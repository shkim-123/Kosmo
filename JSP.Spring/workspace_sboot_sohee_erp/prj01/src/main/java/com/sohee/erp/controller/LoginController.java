package com.sohee.erp.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sohee.erp.Info;
import com.sohee.erp.LoginValidator;
import com.sohee.erp.StaffValidator;
import com.sohee.erp.Util;
import com.sohee.erp.dao.LoginDAO;
import com.sohee.erp.dto.LoginDTO;
import com.sohee.erp.dto.StaffDTO;
import com.sohee.erp.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private LoginDAO loginDAO;
	
	// jsp 파일 경로
	private String path = Info.soheePath + "login/";
	
	@RequestMapping(value="/login_form.do")
	public String goLoginForm() {	
		return path+"loginForm.jsp";
	}
	
	@RequestMapping( 
			value="/loginProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int loginProc(
			@RequestParam(value="login_id") String login_id
			, @RequestParam(value="pwd") String pwd
			, @RequestParam(value="is_login", required=false) String is_login
			, HttpSession session
			, HttpServletResponse response		
	) {
		
		Map<String, String> id_pwd_map = new HashMap<String, String>();
		id_pwd_map.put("login_id", login_id);
		id_pwd_map.put("pwd", pwd);
		
		int login_idCnt = this.loginDAO.getLogin_idCnt(id_pwd_map);
		
		if(login_idCnt == 1) {
			session.setAttribute("login_id", login_id);
			
			if(is_login == null) {
				Util.addCookie(
						"login_id"		// 쿠키명
						, null			// 쿠키값
						, 0				// 생명 주기
						, response		// HttpServletResponse 객체
				);
				Util.addCookie("pwd", null, 0, response);
				
			} 
			else {
				Util.addCookie("login_id", login_id, 60*60*24, response);
				Util.addCookie("pwd", pwd, 60*60*24, response);
			}
			session.setAttribute("msg", "좋은 하루 ╰(*°▽°*)╯");
		}
		return login_idCnt;
	}
	
	@RequestMapping( value="/logout.do" )
	public String logout(HttpSession session) {
		session.removeAttribute("login_id");
		return path+"logout.jsp";
	}
	
	@RequestMapping( value="/login_alert.do" )
	public String login_alert() {
		return path+"login_alert.jsp";
	}
	
	//=======================================================
	// 회원 가입 jsp 페이지 리턴
	//=======================================================
	@RequestMapping( value="/join_form.do" )
	public String goJoinForm() {
		return path+"joinForm.jsp";
	}
	
	//=======================================================
	// 회원 가입 
	//=======================================================
	@RequestMapping( value="/joinProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public Map<String ,String> insertLogin(LoginDTO loginDTO, @RequestParam(value="step") int step, BindingResult bindingResult){
		Map<String, String> map = new HashMap<String, String>();
		String msg = "";
		int joinCnt = 0;
		//------------------
		
		//------------------
		try {
			// 아이디 중복 확인, 유효성 체크
			if(step == 2) {
				loginDTO.setPwd("123");
				msg = check_StaffDTO(loginDTO, bindingResult);
				// 유효성 체크 통과 시 아이디 중복 확인
				if("".equals(msg)) {
					joinCnt = this.loginDAO.getLogin_idCnt(loginDTO);
				}
			}
			// 비밀번호 유효성 체크, insert
			else if(step == 3) {
				msg = check_StaffDTO(loginDTO, bindingResult);
				// 유효성 체크 통과 시 insert
				if("".equals(msg)) {
					joinCnt = this.loginService.insertLogin(loginDTO);
				}
			}
			
		} catch(Exception ex) {
			System.out.println("insertJoin catch!! => " + ex.getMessage());
		}
		//------------------
		
		//------------------
		map.put("msg", msg);
		map.put("joinCnt", joinCnt+"");
		//------------------
		return map;
	}
	
	
	public String check_StaffDTO(LoginDTO loginDTO, BindingResult bindingResult) {
		
		//----------------------------------------------------------------
		String checkMsg = "";
		LoginValidator loginValidator = new LoginValidator();
		
		loginValidator.validate(loginDTO, bindingResult);
		
		if( bindingResult.hasErrors() ) {
			checkMsg = bindingResult.getFieldError().getCode();
		}
		
		return checkMsg;
	}
	
}
