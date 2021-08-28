package com.naver.erp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO loginDAO;
	

	@RequestMapping(value="/loginForm.do")
	public ModelAndView loginForm() {
		
		System.out.println("===LoginForm.loginForm() 시작===");
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("loginForm.jsp");
		
		System.out.println("===LoginForm.loginForm() 종료===");
		return mav;
	}
	
	@RequestMapping(value="/loginProc.do")
	public ModelAndView loginProc(HttpServletRequest request) {
		
		System.out.println("===LoginForm.loginProc 시작===");
		
		ModelAndView mav = new ModelAndView();
		String login_id = request.getParameter("login_id");
		String pwd = request.getParameter("pwd");
		
		System.out.println("===LoginForm.loginProc login_id => " + login_id);
		System.out.println("===LoginForm.loginProc pwd => " + pwd);
		
		Map<String,String> login_map = new HashMap<String,String>();
		login_map.put("login_id", login_id);
		login_map.put("pwd", pwd);
		
		System.out.println("===LoginForm.loginProc login_map => " + login_map);

		int login_cnt = loginDAO.get_loginCNT(login_map);
		
		System.out.println("===LoginForm.loginProc login_cnt =>" + login_cnt);
		mav.addObject("login_cnt", login_cnt);
		mav.setViewName("loginProc.jsp");
		
		System.out.println("===LoginForm.loginProc 끝===");
		
		return mav;
		
	}
	
}
