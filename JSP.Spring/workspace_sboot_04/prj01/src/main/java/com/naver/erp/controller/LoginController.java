package com.naver.erp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.erp.Info;
import com.naver.erp.Util;
import com.naver.erp.dao.LoginDAO;

//----------------------------------------------------------------
// URL 주소로 접속하면 호출되는 메소드를 소유한 [컨트롤러 클래스] 선언
// @Controller 를 붙임으로써 [컨트롤러 클래스] 임을 지정한다.
//----------------------------------------------------------------
// 로그인과 관련된 URL 주소를 맞이하는 LoginController 클래스 선언
//----------------------------------------------------------------
@Controller
@RequestMapping(value="/naver")
public class LoginController {
	
	//----------------------------------------------------------------
	// 속성변수 loginDAO 선언하고, LoginDAO 라는 인터페이스를 구현한 클래스를 객체화하여 저장
	// 즉, 속성변수 loginDAO 에는 LoginDAOImple 객체의 메위주가 저장된다.
	//----------------------------------------------------------------
	// ★★@Autowired★★이 붙은 속성변수에는 인터페이스 자료형을 쓰고 
	// 이 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	// LoginDAO 라는 인터페이스를 구현한 클래스의 이름을 몰라도 관계없다. 1개 존재하기만 하면 된다.
	//----------------------------------------------------------------
	// @Autowired
	// 인터페이스명 속성변수;
	// 이 인터페이스를 구현한 클래스를 찾아서 객체화한 후 객체의 메위주를 속성변수에 저장한다.
	// 객체의 이름은 무엇이든 상관없다. 인터페이스를 구현한 객체이면 된다.
	// 즉, 속성변수에는 null이 저장이 아니다.
	// <주의> 인터페이스를 구현한 객체는 1개 이어야 한다.
	//----------------------------------------------------------------
	@Autowired
	private LoginDAO loginDAO;
	
	private String path=Info.naverPath+"login/";
	
	//----------------------------------------------------------------
	// 가상주소 /loginForm.do 로 접근하면 호출되는 메소드 선언
	//----------------------------------------------------------------
	@RequestMapping( value="/loginForm.do" )
	public ModelAndView loginForm() {
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체] 에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName(path+"loginForm.jsp");		// "/WEB-INF/views/naver/loginForm.jsp"
		return mav;
		
	}
	
	
	//----------------------------------------------------------------
	// 가상주소 /loginProc3.do 로 접근하면 호출되는 메소드 선언
	// 메소드 앞에 @RequestMapping(~,~,produces="application/json;charset=UTF-8") 하고
	// @ResponseBody 가 붙으면 리턴하는 데이터가 클라이언트에게 전송된다.
	// ModelAndView 객체를 리턴하면 JSP 페이지를 호출하고, 
	//		그 JSP 페이지의 실행결과인 HTML 문서가 응답 메시지에 저장되어 전송되지만
	// @RequestMapping(~)와 @ResponseBody가 붙으면 리턴하는 데이터가 JSON 형태로 응답메시지에 저장되어 전송된다.
	//----------------------------------------------------------------
	@RequestMapping( 
			value="/loginProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int loginProc3(
			//----------------------------------------------------------------
			// "login_id" 라는 파라미터명에 해당하는 파라미터값을 꺼내서 매개변수 login_id에 저장하고 들어온다.
			// "pwd" 라는 파라미터명에 해당하는 파라미터값을 꺼내서 매개변수 pwd에 저장하고 들어온다.
			// "is_login" 라는 파라미터명에 해당하는 파라미터값을 꺼내서 매개변수 is_login에 저장하고 들어온다.
			//----------------------------------------------------------------
			@RequestParam(value="login_id") String login_id
			, @RequestParam(value="pwd") String pwd
			, @RequestParam(value="is_login", required=false) String is_login
			//----------------------------------------------------------------
			// [HttpSession 객체]의 메위주를 저장하는 매개변수 session 선언하기
			//----------------------------------------------------------------
			, HttpSession session
			//----------------------------------------------------------------
			// [HttpServletResponse 객체]가 들어올 매개변수 선언
			//----------------------------------------------------------------
			, HttpServletResponse response		
	) {
		
		//----------------------------------------------------------------
		// HashMap 객체 생성하기
		// HashMap 객체에 로그인 아이디 저장하기
		// HashMap 객체에 암호 저장하기
		//----------------------------------------------------------------
		Map<String, String> id_pwd_map = new HashMap<String, String>();
		id_pwd_map.put("login_id", login_id);
		id_pwd_map.put("pwd", pwd);
		
		//----------------------------------------------------------------
		// LoginDAOImpl 객체의 getLogin_idCnt 메소드를 호출하여 로그인 아이디와 암호의 전체 개수 얻기
		// 트랜잭션을 걸 필요가 없어서 바로 DAO로 넘어감
		//----------------------------------------------------------------
		int login_idCnt = this.loginDAO.getLogin_idCnt(id_pwd_map);
		
		//----------------------------------------------------------------
		// 만약, login_idCnt 변수 안의 데이터가 1이면
		// 즉, 만약 입력한 아이디, 암호가 DB에 존재하면
		// 즉, 만약 로그인이 성공했으면
		//----------------------------------------------------------------
		if(login_idCnt == 1) {
			//----------------------------------------------------------------
			// HttpSession 객체에 로그인 아이디 저장하기
			// HttpSession 객체에 아이디를 저장하면 재 접속했을 때 다시 꺼낼 수 있다
			// <참고> HttpSession 객체는 접속한 이후에도 제거되지 않고 지정된 기간 동안 살아 있는 객체이다.
			// <참고> HttpServletRequest, HttpServletResponse 객체는 접속할 때 생성되고 응답 이후 삭제되는 객체이다.
			//----------------------------------------------------------------
			session.setAttribute("login_id", login_id);
			
			//----------------------------------------------------------------
			// 매개변수 "is_login"에 null 이 저장되어 있으면(=[아아디, 암호 자동 입력]의사 없을 경우)
			//----------------------------------------------------------------
			if(is_login == null) {
				
				//----------------------------------------------------------------
				// 쿠키명 "login_id", 쿠키값 null 로 응답메시지에 쿠키 저장하기
				// 응답 메시지에 저장된 쿠키는 클라이언트쪽에 저장된다. 또는 이미 존재하면 덮어쓴다.
				//----------------------------------------------------------------
				Util.addCookie(
						"login_id"		// 쿠키명
						, null			// 쿠키값
						, 0				// 생명 주기
						, response		// HttpServletResponse 객체
				);
				//----------------------------------------------------------------
				// 쿠키명 "pwd", 쿠키값 null 로 응답메시지에 쿠키 저장하기
				// 응답 메시지에 저장된 쿠키는 클라이언트쪽에 저장된다. 또는 이미 존재하면 덮어쓴다.
				//----------------------------------------------------------------
				Util.addCookie("pwd", null, 0, response);
				
			} 
			//----------------------------------------------------------------
			// 매개변수 "is_login" 에 "yes"가 저장되어 있으면(=[아이디, 암호 자동 입력]의사 있을 경우)
			//----------------------------------------------------------------
			else {
				
				//----------------------------------------------------------------
				// 쿠키명 "login_id", 쿠키값 매개변수 login_id 로 응답메시지에 쿠키 저장하기
				// 응답 메시지에 저장된 쿠키는 클라이언트쪽에 저장된다. 또는 이미 존재하면 덮어쓴다.
				// 쿠키명 "pwd", 쿠키값 매개변수 pwd 로 응답메시지에 쿠키 저장하기
				// 응답 메시지에 저장된 쿠키는 클라이언트쪽에 저장된다. 또는 이미 존재하면 덮어쓴다.
				//----------------------------------------------------------------
				Util.addCookie("login_id", login_id, 60*60*24, response);
				Util.addCookie("pwd", pwd, 60*60*24, response);
				
			}
			
			//----------------------------------------------------------------
			// HttpSession 객체에 메시지 저장하기
			// HttpSession 객체에 저장된 데이터는 모든 JSP 페이지에서 ${sessionScope.키값명}으로 꺼내 표현할 수 있다.
			//----------------------------------------------------------------
			session.setAttribute("msg", "좋은 하루 ╰(*°▽°*)╯");
		}
		
		//----------------------------------------------------------------
		// 로그인 아이디, 암호 존재 개수 리턴하기
		//----------------------------------------------------------------
		return login_idCnt;
	}
	
	
	//----------------------------------------------------------------
	// 가상주소 /logout.do 로 접근하면 호출되는 메소드 선언
	//----------------------------------------------------------------
	@RequestMapping( value="/logout.do" )
	public ModelAndView logout(HttpSession session) {
		
		//----------------------------------------------------------------
		// HttpSession 객체에 "login_id" 라는 키값으로 저장된 데이터 삭제하기
		// 즉, HttpSession 객체에 저장된 로그인 성공 후 저장된 아이디값을 지우기
		// 즉, HttpSession 객체에 저장된 로그인 정보를 삭제하기
		//----------------------------------------------------------------
		session.removeAttribute("login_id");

		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName(path+"logout.jsp");
		
		return mav;
		
	}
	
	//----------------------------------------------------------------
	// 가상주소 /login_alert.do 로 접근하면 호출되는 메소드 선언
	//----------------------------------------------------------------
	@RequestMapping( value="/login_alert.do" )
	public ModelAndView login_alert() {
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName(path+"login_alert.jsp");
		
		return mav;
	}
	
	
/*
	 
	//----------------------------------------------------------------
	// 가상주소 /loginProc.do 로 접근하면 호출되는 메소드 선언
	//----------------------------------------------------------------
	@RequestMapping( value="/loginProc.do" )
	public ModelAndView loginProc(
			//----------------------------------------------------------------
			// "login_id" 라는 파라미터명에 해당하는 파라미터값을 꺼내서 매개변수 login_id에 저장하고 들어온다.
			// "pwd" 라는 파라미터명에 해당하는 파라미터값을 꺼내서 매개변수 pwd에 저장하고 들어온다.
			// "is_login" 라는 파라미터명에 해당하는 파라미터값을 꺼내서 매개변수 is_login에 저장하고 들어온다.
			//----------------------------------------------------------------
			@RequestParam(value="login_id") String login_id
			, @RequestParam(value="pwd") String pwd
			, @RequestParam(value="is_login", required=false) String is_login
			//----------------------------------------------------------------
			// [HttpSession 객체]의 메위주를 저장하는 매개변수 session 선언하기
			//----------------------------------------------------------------
			, HttpSession session
			//----------------------------------------------------------------
			// [HttpServletResponse 객체]가 들어올 매개변수 선언
			//----------------------------------------------------------------
			, HttpServletResponse response
	) {
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// HashMap 객체 생성하기
		// HashMap 객체에 로그인 아이디 저장하기
		// HashMap 객체에 암호 저장하기
		//----------------------------------------------------------------
		// HashMap에 저장하는 이유는? mybatis 쿼리에 참여시키기 위하여, 한 곳에 집어넣어야지 mapper로 던질 수 있음
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		Map<String, String> id_pwd_map = new HashMap<String, String>();
		id_pwd_map.put("login_id", login_id);
		id_pwd_map.put("pwd", pwd);
		
		//----------------------------------------------------------------
		// LoginDAOImpl 객체의 getLogin_idCnt 메소드를 호출하여 로그인 아이디와 암호의 전체 개수 얻기
		//----------------------------------------------------------------
		System.out.println("LoginController.loginProc => " + 1);
		int login_idCnt = loginDAO.getLogin_idCnt(id_pwd_map);
		
		//----------------------------------------------------------------
		// 만약, login_idCnt 변수 안의 데이터가 1이면
		// 즉, 만약 입력한 아이디, 암호가 DB에 존재하면
		// 즉, 만약 로그인이 성공했으면
		//----------------------------------------------------------------
		if(login_idCnt == 1) {
			//----------------------------------------------------------------
			// HttpSession 객체에 로그인 아이디 저장하기
			// HttpSession 객체에 아이디를 저장하면 재 접속했을 때 다시 꺼낼 수 있다
			// <참고> HttpSession 객체는 접속한 이후에도 제거되지 않고 지정된 기간 동안 살아 있는 객체이다.
			// <참고> HttpServletRequest, HttpServletResponse 객체는 접속할 때 생성되고 응답 이후 삭제되는 객체이다.
			//----------------------------------------------------------------
			session.setAttribute("login_id", login_id);
			
			//----------------------------------------------------------------
			// 매개변수 "is_login"에 null 이 저장되어 있으면(=[아아디, 암호 자동 입력]의사 없을 경우)
			//----------------------------------------------------------------
			if(is_login == null) {
				
				//================================================================
				// 웹서버 쪽에서 클라이언트(=웹브라우저)에 있는 쿠키를 삭제하는 방법은? (입사시험질문)
				//----------------------------------------------------------------
				// 웹서버는 클라이언트에게 있는 쿠키를 지울 수 없다.
				// 그 쿠키명에 해당하는 쿠키에 null 값을 저장하여 클라이언트에게 보내서 덮어씌운다.
				//================================================================
				
				
				//----------------------------------------------------------------
				// Cookie 객체를 생성하고 쿠키명-쿠키값을 ["login_id"-null]로 하기
				// Cookie 객체를 생성하고 쿠키명-쿠키값을 ["pwd"-null]로 하기
				// Cookie 객체에 저장된 쿠키의 수명은 0으로 하기
				//----------------------------------------------------------------
//				Cookie cookie1 = new Cookie("login_id", null);
//				Cookie cookie2 = new Cookie("pwd", null);
//				cookie1.setMaxAge(0);
//				cookie2.setMaxAge(0);
				
				//----------------------------------------------------------------
				// Cookie 객체가 소유한 쿠키를 응답메시지에 저장하기
				// 결국 Cookie 객체가 소유한 쿠키명-쿠키값이 응답메시지에 저장되는 셈이다.
				// 응답메시지에 저장된 쿠키는 클라이언트쪽으로 전송되어 클라이언트쪽에 저장된다.
				//----------------------------------------------------------------
//				response.addCookie(cookie1);
//				response.addCookie(cookie2);
				
				
				// 공용 클래스 호출
				Util.addCookie("login_id", null, 0, response);
				Util.addCookie("pwd", null, 0, response);
				
			} 
			//----------------------------------------------------------------
			// 매개변수 "is_login" 에 "yes"가 저장되어 있으면(=[아이디, 암호 자동 입력]의사 있을 경우)
			//----------------------------------------------------------------
			else {
				
				//================================================================
				// 클라이언트가 보낸 아이디, 암호를 응답 메시지에 쿠키명-쿠키값으로 저장하기
				//================================================================
				
				
				//----------------------------------------------------------------
				// Cookie 객체를 생성하고 쿠키명-쿠키값을 ["login_id"-"입력아이디"]로 하기
				// Cookie 객체를 생성하고 쿠키명-쿠키값을 ["pwd"-"입력암호"]로 하기
				// Cookie 객체에 저장된 쿠키의 수명은 60*60*24로 하기
				//----------------------------------------------------------------
				// Cookie 객체란? 웹브라우저가 웹서버에게 보낸 요청메시지 안에 저장된 쿠키값을 관리하는 객체이다.
				// 1개의 쿠키값을 1개의 Cookie 객체가 관리한다.
				//----------------------------------------------------------------
//				Cookie cookie1 = new Cookie("login_id", login_id);
//				Cookie cookie2 = new Cookie("pwd", pwd);
//				cookie1.setMaxAge(60*60*24);
//				cookie2.setMaxAge(60*60*24);
				
				//----------------------------------------------------------------
				// Cookie 객체가 소유한 쿠키를 응답메시지에 저장하기
				//----------------------------------------------------------------
//				response.addCookie(cookie1);
//				response.addCookie(cookie2);
				
				
				// 공용 클래스 호출
				Util.addCookie("login_id", login_id, 60*60*24, response);
				Util.addCookie("pwd", pwd, 60*60*24, response);
				
			}
			
			
		}
		
		System.out.println("LoginController.loginProc => " + 2);
				
		//----------------------------------------------------------------
		// [ModelAndView 객체] 에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체] 에 아이디 암호 존재개수 저장하기. 즉, DB 연동 결과물 저장하기
		// [ModelAndView 객체] 에 저장된 DB 연동 결과물은 HttpServletRequest 객체에 setAttribute 메소드로 저장된다.
		//----------------------------------------------------------------
		mav.setViewName("loginProc2.jsp");
		mav.addObject( "idCnt", login_idCnt );		// "idCnt"는 키값, DB 연동 결과물 저장
			// 위 addObject 메소드로 저장된 DB 연동 결과물은 HttpServletRequest 객체에 setAttribute 메소드로 저장된다.

		System.out.println("====LoginController.loginProc 메소드 호출 종료====");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
		return mav;
	}
	
	
	//----------------------------------------------------------------
	// 가상주소 /loginProc2.do 로 접근하면 호출되는 메소드 선언
	//----------------------------------------------------------------
	@RequestMapping( value="/loginProc2.do" )
	public ModelAndView loginProc2(
			// 클라이언트가 보낸 요청 메시지를 관리하는 HttpServletRequest 객체가 매개변수로 들어온다.
			// HttpServletRequest 객체의 메소드를 이용하면 파라미터값을 얻을 수 있다.
			HttpServletRequest request
	) {
		
		System.out.println("====LoginController.loginProc 메소드 호출 시작====");
		//----------------------------------------------------------------
		// 클라이언트가 보낸 요청 메시지 안의 "login_id" 라는 파라미터명의 파라미터값 꺼내기
		// 클라이언트가 보낸 아이디를 꺼내라
		// 클라이언트가 보낸 요청 메시지 안의 "pwd" 라는 파리미터명의 파라미터값 꺼내기
		// 클라이언트가 보낸 암호를 꺼내라
		//----------------------------------------------------------------
		String login_id = request.getParameter("login_id");
		String pwd = request.getParameter("pwd");
		
		System.out.println("LoginController.loginProc => 파명 login_id => " + login_id);
		System.out.println("LoginController.loginProc => 파명 pwd => " + pwd);
		
		//----------------------------------------------------------------
		// HashMap 객체 생성하기
		// HashMap 객체에 로그인 아이디 저장하기
		// HashMap 객체에 암호 저장하기
		//----------------------------------------------------------------
		Map<String, String> id_pwd_map = new HashMap<String, String>();
		id_pwd_map.put("login_id", login_id);
		id_pwd_map.put("pwd", pwd);
		
		//----------------------------------------------------------------
		// LoginDAOImpl 객체의 getLogin_idCnt 메소드를 호출하여 로그인 아이디와 암호의 전체 개수 얻기
		//----------------------------------------------------------------
		System.out.println("LoginController.loginProc => " + 1);
		int login_idCnt = loginDAO.getLogin_idCnt(id_pwd_map);
		System.out.println("LoginController.loginProc => " + 2);
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체] 에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체] 에 아이디 암호 존재개수 저장하기. 즉, DB 연동 결과물 저장하기
		// [ModelAndView 객체] 에 저장된 DB 연동 결과물은 HttpServletRequest 객체에 setAttribute 메소드로 저장된다.
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginProc.jsp");
		mav.addObject( "idCnt", login_idCnt );		// "idCnt"는 키값, DB 연동 결과물 저장
			// 위 addObject 메소드로 저장된 DB 연동 결과물은 HttpServletRequest 객체에 setAttribute 메소드로 저장된다.
		System.out.println("====LoginController.loginProc 메소드 호출 종료====");
		return mav;
	}
*/
	
}
