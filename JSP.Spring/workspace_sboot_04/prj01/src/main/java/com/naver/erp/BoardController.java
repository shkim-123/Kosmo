package com.naver.erp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//----------------------------------------------------------------
// URL 주소로 접속하면 호출되는 메소드를 소유한 [컨트롤러 클래스] 선언
// @Controller 를 붙임으로써 [컨트롤러 클래스] 임을 지정한다.
//----------------------------------------------------------------
// 게시판과 관련된 URL 주소를 맞이하는 BoardController 클래스 선언
//----------------------------------------------------------------
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//----------------------------------------------------------------
	// 가상주소 /boardList.do 로 접근하면 호출되는 메소드 선언
	// @RequestMappgin 내부에 method="RequestMethod.POST" 가 없으므로
	// 가상주소 /boardList.do 접근 시 get 또는 post 방식 접근 모두 허용한다.
	//----------------------------------------------------------------
	@RequestMapping( value="/boardList.do" )
	public ModelAndView getBoardList() {
		
		System.out.println("===BoardController.getBoardList 시작===");
		
		// ★★★하이라이트 검색 화면★★★
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체] 에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardList.jsp");
		
		System.out.println("===BoardController.getBoardList 종료===");
		
		return mav;
	}
	
	//----------------------------------------------------------------
	// 가상주소 /boardRegForm.do 로 접근하면 호출되는 메소드 선언
	//----------------------------------------------------------------
	@RequestMapping( value="/boardRegForm.do" )
	public ModelAndView goBoardRegForm() {
		
		System.out.println("===BoardController.goBoardRegForm 시작===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체] 에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardRegForm.jsp");		
		
		System.out.println("===BoardController.goBoardRegForm 종료===");
		
		return mav;
	}
	
	//----------------------------------------------------------------
	// 가상주소 /boardRegProc.do 로 접근하면 호출되는 메소드 선언
	//----------------------------------------------------------------
	@RequestMapping( value="/boardRegProc.do" )
	public ModelAndView insertBoard(
			//----------------------------------------------------------------
			// 파라미터값을 저장할 [BoardDTO 객체]를 매개변수로 선언
			//----------------------------------------------------------------
			// [파라미터명]과 [BoardDTO 객체]의 [속성변수명]이 같으면
			// setter 메소드가 작동되어 [파라미터값]이 [속성변수]에 저장된다.
			// [속성변수명]에 대응하는 [파라미터명]이 없으면 setter 메소드가 작동되지 않는다.
			// [속성변수명]에 대응하는 [파라미터명]이 있는데 [파라미터값]이 없으면
			// [속성변수]의 자료형에 관계없이 무조건 null 값이 저장된다.
			// 이때 [속성변수]의 자료형이 기본형일 경우 null 값이 저장될 수 없어 에러가 발생한다.
			// 이런 에러를 피하려면 파라미터값이 기본형이거나 속성변수의 자료형을 String으로 해야한다.
			// 이런 에러가 발생하면 메소드안의 실행구문은 하나도 실행되지 않음에 주의한다.
			// 매개변수로 들어온 [DTO 객체]는 이 메소드가 끝난 후 호출되는 JSP 페이지로 그대로 이동한다.
			// 즉, HttpServletRequest 객체에 boardDTO 라는 키값명으로 저장된다.
			//----------------------------------------------------------------
			BoardDTO boardDTO
	) {
		
		System.out.println("===BoardController.boardRegProc 시작===");
		
//		System.out.println(boardDTO.getB_no());
//		System.out.println(boardDTO.getSubject());
//		System.out.println(boardDTO.getWriter());
//		System.out.println(boardDTO.getContent());
//		System.out.println(boardDTO.getPwd());
		
		//----------------------------------------------------------------
		// check_BoardDTO 메소드를 호출하여 [유효성 체크]하고 경고 문자 얻기
		//----------------------------------------------------------------
		
		
		
		//----------------------------------------------------------------
		// [BoardServiceImpl 객체]의 insertBoard 메소드 호출로
		// 게시판 글 입력하고 [게시판 입력 적용행의 개수] 얻기
		//----------------------------------------------------------------
		
		
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체] 에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardRegProc.jsp");	
		
		
		//----------------------------------------------------------------
		// [ModelAndView 객체]에 [게시판 입력 적용행의 개수] 저장하기
		//----------------------------------------------------------------
		
		
		
		
		System.out.println("===BoardController.boardRegProc 종료===");
		
		return mav;
	}
	
	
}
