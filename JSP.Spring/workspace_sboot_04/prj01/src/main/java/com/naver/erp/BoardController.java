package com.naver.erp;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
	
	//----------------------------------------------------------------
	// 속성변수 boardService 선언하고 [BoardService 인터페이스]를 구현한 클래스를 찾아 객체 생성해 객체의 메위주를 저장
	//----------------------------------------------------------------
	// @Autowired 역할 : 속성변수에 붙은 자료형인 [인터페이스]를 구현한 [클래스]를 객체화하여 객체의 메위주를 저장한다.
	// [인터페이스]를 구현한 [클래스]가 1개가 아니면 에러가 발생한다.
	// 단, @Autowired(required=false)로 선언하면 [인터페이스]를 구현한 [클래스]가 0개여도 에러없이 null이 저장된다.
	//----------------------------------------------------------------
	@Autowired
	private BoardService boardService;
	
	//----------------------------------------------------------------
	// 속성변수 boardDAO 선언하고 [BoardDAO 인터페이스]를 구현한 클래스를 찾아 객체 생성해 객체의 메위주를 저장
	//----------------------------------------------------------------
	@Autowired
	private BoardDAO boardDAO;
	
	//----------------------------------------------------------------
	// 가상주소 /boardList.do 로 접근하면 호출되는 메소드 선언
	// @RequestMappgin 내부에 method="RequestMethod.POST" 가 없으므로
	// 가상주소 /boardList.do 접근 시 get 또는 post 방식 접근 모두 허용한다.
	//----------------------------------------------------------------
	@RequestMapping( value="/boardList.do" )
	public ModelAndView getBoardList() {
		
		System.out.println("===BoardController.getBoardList 시작===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체] 에 [호출 JSP 페이지명]을 저장하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardList.jsp");

		try {
			
			//----------------------------------------------------------------
			// 오라클 board 테이블 안의 데이터를 검색해와 자바 객체에 저장하기. 즉, [게시판 목록] 얻기
			//----------------------------------------------------------------
			List<Map<String,String>> boardList = this.boardDAO.getBoardList();
			
			System.out.println("===BoardController.getBoardList boardList => " + boardList);
			
			//----------------------------------------------------------------
			// [ModelAndView 객체]에 [게시판 목록 검색 결과]를 저장하기
			//----------------------------------------------------------------
			mav.addObject("boardList", boardList);
			
		} catch(Exception ex) {
			//----------------------------------------------------------------
			// DB 연동 에러 발생 시 -1 저장
			//----------------------------------------------------------------
			mav.addObject("boardList", -1);
		}
		
		System.out.println("===BoardController.getBoardList 종료===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
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
			//----------------------------------------------------------------
			// Errors 객체를 관리하는 BindingResult 객체가 저장되어 들어오는 매개변수 bindingResult 선언
			//----------------------------------------------------------------
			, BindingResult bindingResult
	) {
		
		System.out.println("===BoardController.boardRegProc 시작===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardRegProc.jsp");	
		
		// try-catch 구문으로 예외 처리
		try {
	//		System.out.println(boardDTO.getB_no());
	//		System.out.println(boardDTO.getSubject());
	//		System.out.println(boardDTO.getWriter());
	//		System.out.println(boardDTO.getContent());
	//		System.out.println(boardDTO.getPwd());
			
			//----------------------------------------------------------------
			// <1> 유효성 체크 에러 메시지 저장할 변수 선언
			// <2> [게시판 입력 적용행의 개수] 저장할 변수 선언
			// <3> check_BoardDTO 메소드를 호출하여 [유효성 체크]하고 에러 메시지 문자 얻기
			//	check_BoardDTO 메소드로 분리한 이유 : 재활용, 코딩이 길어서 분리
			//----------------------------------------------------------------
			String msg = "";
			int boardRegCnt = 0;
			msg = check_BoardDTO(boardDTO, bindingResult);
			
			//----------------------------------------------------------------
			// 만약 mgs가 안에 ""가 저장되어 있으면, 즉, 유효성 체크를 통과했으면
			//----------------------------------------------------------------
			if( "".equals(msg) ) {
				//----------------------------------------------------------------
				// [BoardServiceImpl 객체]의 insertBoard 메소드 호출로
				// 게시판 글 입력하고 [게시판 입력 적용행의 개수] 얻기
				//----------------------------------------------------------------
				boardRegCnt = this.boardService.insertBoard(boardDTO);
				
				System.out.println("BoardController.boardRegProc boardRegCnt => " + boardRegCnt);
				
			}
			//----------------------------------------------------------------
			// 만약 msg 안에 ""가 저장되어 있지 않으면, 즉, 유효성 체크를 통과 못했으면
			//----------------------------------------------------------------
			else {
				//----------------------------------------------------------------
				// [게시판 입력 적용행의 개수] 변수에 0 저장하기
				//----------------------------------------------------------------
				boardRegCnt = 0;
			}
			
			//----------------------------------------------------------------
			// [ModelAndView 객체]에 [게시판 입력 적용행의 개수] 저장하기
			// [ModelAndView 객체]에 [유효성 체크 에러 메시지] 저장하기
			//----------------------------------------------------------------
			mav.addObject("boardRegCnt", boardRegCnt);
			mav.addObject("msg", msg);
		
		} catch(Exception ex) {
			//----------------------------------------------------------------
			// [ModelAndView 객체]에 -1 저장하기
			// [ModelAndView 객체]에 에러 메시지 저장하기
			//----------------------------------------------------------------
			mav.addObject("boardRegCnt", -1);
			mav.addObject("msg", "서버쪽에서 문제 발생! 서버 관리자에게 문의 바람");
		}
		
		System.out.println("===BoardController.boardRegProc 종료===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
		return mav;
	}
	

	//----------------------------------------------------------------
	// 가상주소 /boardContentForm.do 로 접근하면 호출되는 메소드 선언
	//----------------------------------------------------------------
	// b_no 파라미터명에 해당하는 파라미터값은 숫자문자면 int로 명시하면 숫자로 스프링이 형변환해준다
	// 단, 반드시 파라미터값이 들어가야 한다. (int에 null이 들어가면 에러가 난다.)
	//----------------------------------------------------------------
	@RequestMapping( value="/boardContentForm.do" )
	public ModelAndView goBoardContentForm(@RequestParam(value="b_no") int b_no) {
		
		
		System.out.println("===BoardController.goBoardContentForm 시작===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		//----------------------------------------------------------------		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardContentForm.jsp");
		
		try {
			
			//----------------------------------------------------------------
			// [BoardServiceImpl 객체]의 getBoard 메소드 호출로 [1개의 게시판 글]을 BoardDTO 객체에 담아오기 
			//----------------------------------------------------------------
			BoardDTO board = this.boardService.getBoard(b_no);
			
			System.out.println("===BoardController.goBoardContentForm board =>" + board);
			
			//----------------------------------------------------------------
			// [ModelAndView 객체]에 BoardDTO 저장하기
			//----------------------------------------------------------------
			mav.addObject("board", board);
			
			
		} catch(Exception ex) {
			mav.addObject("board", -1);
		}
		
		mav.addObject("b_no", b_no);
		
		System.out.println("===BoardController.goBoardContentForm 종료===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------		
		return mav;
	}
	

	
	//----------------------------------------------------------------
	// 수정/삭제 화면 이동
	//----------------------------------------------------------------
	@RequestMapping( value="/boardUpDelForm.do" )
	public ModelAndView goBoardUpDelForm(
			//----------------------------------------------------------------
			// "b_no"라는 파라미터명의 파라미터값이 저장되는 매개변수 b_no 선언
			// 수정 또는 삭제할 게시판 고유 번호가 들어오는 매개변수 선언
			//----------------------------------------------------------------
			@RequestParam(value="b_no") int b_no
	) {
		
		System.out.println("===BoardController.goBoardUpDelForm 시작===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		//----------------------------------------------------------------			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardUpDelForm.jsp");
		
		try {
			//----------------------------------------------------------------			
			// [boardDAOImpl 객체]의 getBoard 메소드 호출로 1개의 게시판글을 BoardDTO 객체에 담아서 가져오기
			//----------------------------------------------------------------			
			BoardDTO board = this.boardDAO.getBoard(b_no);
			mav.addObject("board", board);
			
			System.out.println("===BoardController.goBoardUpDelForm board => " + board);
		
		} catch(Exception ex) {
			mav.addObject("board", -1);
		}
		
		System.out.println("===BoardController.goBoardUpDelForm 종료===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------				
		return mav;
	}
	
	@RequestMapping(value="/boardUpDelProc.do")
	public ModelAndView boardUpDelProc(
			@RequestParam(value="upDel") String upDel
			, BoardDTO boardDTO
			, BindingResult bindingResult
	) {
		
		System.out.println("===BoardController.boardUpDelProc 시작===");
		
		String msg = "";
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		//----------------------------------------------------------------			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardUpDelProc.jsp");
		
		// 수정인 경우
		if("up".equals(upDel)) {
			
			msg = check_BoardDTO(boardDTO, bindingResult);
			
			// 유효성 체크 통과 시
			if("".equals(msg)) {
				
				try {
					
					// 업데이트 성공한 개수 boardUpCnt에 저장
					int boardUpCnt = this.boardService.boardUpdate(boardDTO);
				
					System.out.println("===BoardController.boardUpDelProc boardUpCnt => " + boardUpCnt);
					
					mav.addObject("boardUpCnt", boardUpCnt);
					
				} catch(Exception ex) {
					System.out.println("BoardController.boardUpDelProc up 캐치캐치");
				}
			
			} else {
				mav.addObject("boardUpCnt", -4);
			}
			
			mav.addObject("boardDelCnt", -2);
			
		}
		// 삭제인 경우
		else if("del".equals(upDel)) {
			
			try {
				
				int boardDelCnt = this.boardService.boardDelete(boardDTO);
				
				System.out.println("===BoardController.boardUpDelProc boardDelCnt => " + boardDelCnt);
				
				mav.addObject("boardDelCnt", boardDelCnt);
				
			} catch(Exception ex) {
				System.out.println("BoardController.boardUpDelProc del 캐치캐치");
			}
			
			mav.addObject("boardUpCnt", -2);
			
		}
		
		// [ModelAndView 객체] msg 저장
		mav.addObject("msg", msg);
		
		System.out.println("===BoardController.boardUpDelProc 종료===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------				
		return mav;		
		
	}
	
	
	
	
	
	//----------------------------------------------------------------
	// 게시판 입력 또는 수정 시 게시판 입력글의 입력양식의 유효성을 검사하고 
	// 문제가 있으면 경고 문자를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	public String check_BoardDTO(BoardDTO boardDTO, BindingResult bindingResult) {
		
		//----------------------------------------------------------------
		// 에러메시지 저장할 변수 선언
		//----------------------------------------------------------------
		String checkMsg = "";
		
		//----------------------------------------------------------------
		// BoardDTO 객체에 저장된 데이터의 유효성 체크할 BoardValidator 객체 생성하기
		// BoardValidator 객체의 validate 메소드 호출하여 유효성 체크 실행하기
		//----------------------------------------------------------------
		BoardValidator boardValidator = new BoardValidator();
		
		boardValidator.validate(
				boardDTO			// 유효성 체크할 DTO 객체
				, bindingResult		// 유효성 체크 결과를 관리하는 BindingResult 객체
		);
		
		System.out.println("bindingResult.hasErrors() => " + bindingResult.hasErrors());
		System.out.println("bindingResult => " + bindingResult);
		
		//----------------------------------------------------------------
		// 만약 BindingResult 객체의 hasErrors() 메소드 호출하여 true 값을 얻으면
		//----------------------------------------------------------------
		if( bindingResult.hasErrors() ) {
			//----------------------------------------------------------------
			// 변수 checkMsg에 BoardValidator 객체에 저장된 경고문구 얻어 저장하기
			//----------------------------------------------------------------
			checkMsg = bindingResult.getFieldError().getCode();
			
			System.out.println("=========================================");
			System.out.println("bindingResult => " + bindingResult);
			System.out.println("bindingResult.getFieldError() => " + bindingResult.getFieldError());
			System.out.println("bindingResult.getFieldError().getCode() => " + bindingResult.getFieldError().getCode());
			System.out.println("=========================================");
		}
		
		//----------------------------------------------------------------
		// checkMsg 안의 문자 리턴하기
		//----------------------------------------------------------------
		return checkMsg;
	}
	
	
	
}
