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
import org.springframework.web.bind.annotation.RequestMethod;
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
	// @RequestMapping 내부에 method=RequestMethod.POST 가 없으므로
	// 가상주소 /boardList.do 접근 시 get 또는 post 방식 접근 모두 허용한다.
	//----------------------------------------------------------------
	@RequestMapping( value="/boardList.do")
	public ModelAndView getBoardList(
			//----------------------------------------------------------------
			// 파라미터값을 저장하고 있는 BoardSearchDTO 객체를 받아오는 매개변수 선언
			//----------------------------------------------------------------
			BoardSearchDTO boardSearchDTO
	) {
		
		System.out.println("===BoardController.getBoardList 시작===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		List<Map<String,String>> boardList = null;
		int boardListAllCnt = 0;
		//----------------------------------------------------------------
		// 마지막 페이지 번호 구하기
		// 현 화면에 보여줄 최소 페이지 번호 구하기
		// 현 화면에 보여줄 최대 페이지 번호 구하기
		// BoardSearchDTO 객체에 저장된 [선택 페이지 번호] 구하기
		// BoardSearchDTO 객체에 저장된 [한 화면에 보여줄 행의 개수] 구하기
		// 한 화면에 보여줄 페이지 번호의 개수 구하기
		//----------------------------------------------------------------
		int last_pageNo = 0;
		int min_pageNo = 0;
		int max_pageNo = 0;
		int selectPageNo = boardSearchDTO.getSelectPageNo();
		int rowCntPerPage = boardSearchDTO.getRowCntPerPage();
		int pageNoCntPerPage = 10;
		// Paging paging = new Paging();
		
		try {
			//----------------------------------------------------------------
			// 검색 조건에 맞는 [게시판 목록의 총개수] 얻기
			//----------------------------------------------------------------
			boardListAllCnt = this.boardDAO.getBoardListAllCnt(boardSearchDTO);
			System.out.println("===BoardController.getBoardList boardListAllCnt => " + boardListAllCnt);
			
		} catch(Exception ex) {
			System.out.println("BoardController.getBoardList boardListAllCnt catch!! => " + ex);
		}
		
		//Map<String,Integer> pagingMap = paging.getPaging(boardListAllCnt, 10, boardSearchDTO);
		
		
		//----------------------------------------------------------------
		// 만약, 검색된 결과물의 개수가 0보다 크면, 즉, 검색 결과물이 있으면
		//----------------------------------------------------------------
		if(boardListAllCnt > 0) {
			// 마지막 페이지 번호 구하기
			last_pageNo = boardListAllCnt/rowCntPerPage;
				if( boardListAllCnt%rowCntPerPage > 0 ) { last_pageNo++; }
			//----------------------------------------------------------------
			// 만약, 선택한 페이지 번호가 마지막 페이지 번호보다 크면
			//----------------------------------------------------------------
			if( selectPageNo > last_pageNo ) {
				// selectPageNo 변수에 1 저장하기
				selectPageNo = 1;
				//----------------------------------------------------------------
				// boardSearchDTO 객체의 selectPageNo 속성 변수에 1 저장하기
				// 완전 조심!!! boardSearchDTO에 setter 메소드 호출하여 데이터를 저장해야 한다. (DB 에서 사용하니까)
				//----------------------------------------------------------------
				boardSearchDTO.setSelectPageNo(selectPageNo);	
			}
				
			// 한 화면에 보일 최소 페이지 번호 구하기
			min_pageNo = (selectPageNo - 1)/pageNoCntPerPage * pageNoCntPerPage + 1;
			// 한 화면에 보일 최대 페이지 번호 구하기
			max_pageNo = min_pageNo + pageNoCntPerPage - 1;
				if(max_pageNo > last_pageNo) { max_pageNo = last_pageNo; }
		}
		
		
		
		try {
			//----------------------------------------------------------------
			// 오라클 board 테이블 안의 데이터를 검색해와 자바 객체에 저장하기.
			// 즉, 검색 조건에 맞는 [게시판 목록] 얻기
			//----------------------------------------------------------------
			boardList = this.boardDAO.getBoardList(boardSearchDTO);
			
		} catch(Exception ex) {
			//----------------------------------------------------------------
			// DB 연동 에러 발생 시 -1 저장
			//----------------------------------------------------------------
			// mav.addObject("boardList", -1);
			System.out.println("BoardController.getBoardList boardList catch!! => " + ex);
		}
		
		//----------------------------------------------------------------
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		// [ModelAndView 객체]에 [게시판 목록 검색 결과]를 저장하기
		// [ModelAndView 객체]에 [게시판 목록의 총 개수]를 저장하기
		// [ModelAndView 객체]에 [마지막 페이지 번호]를 저장하기
		// [ModelAndView 객체]에 [현재 화면에 보여지는 페이지 번호의 최소 페이지 번호]를 저장하기
		// [ModelAndView 객체]에 [현재 화면에 보여지는 페이지 번호의 최대 페이지 번호]를 저장하기
		// [ModelAndView 객체]에 [선택한 페이지 번호]를 저장하기
		// [ModelAndView 객체]에 [한 화면에 보여줄 행의 개수]를 저장하기
		// [ModelAndView 객체]에 [한 화면에 보여줄 페이지 번호의 개수]를 저장하기
		//----------------------------------------------------------------
		mav.setViewName("boardList.jsp");
		mav.addObject("boardList", boardList);
		mav.addObject("boardListAllCnt", boardListAllCnt);
		mav.addObject("last_pageNo", last_pageNo);
		mav.addObject("min_pageNo", min_pageNo);
		mav.addObject("max_pageNo", max_pageNo);
//		mav.addObject("last_pageNo", pagingMap.get("last_pageNo"));
//		mav.addObject("min_pageNo", pagingMap.get("min_pageNo"));
//		mav.addObject("max_pageNo", pagingMap.get("max_pageNo"));
		mav.addObject("selectPageNo", selectPageNo);
		mav.addObject("rowCntPerPage", rowCntPerPage);
		mav.addObject("pageNoCntPerPage", pageNoCntPerPage);
		
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
	public ModelAndView goBoardRegForm(
			//----------------------------------------------------------------
			// 파라미터명이 b_no인 파라미터값을 받아오는 매개변수 b_no 선언하기
			//----------------------------------------------------------------
			@RequestParam(
					value="b_no"		// 파라미터명 설정
					,required=false		// 파라미터명, 값이 안들어와도 용서한다는 의미
					,defaultValue="0"	// 파라미터값이 없으면 파라미터값을 0으로 하곘음
			)int b_no
	) {
		
		System.out.println("===BoardController.goBoardRegForm 시작===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		//----------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		
		System.out.println("b_no => " + b_no);
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 에 [호출 JSP 페이지명]을 저장하기
		//----------------------------------------------------------------
		mav.setViewName("boardRegForm.jsp");		
		
		System.out.println("===BoardController.goBoardRegForm 종료===");
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 리턴하기
		//----------------------------------------------------------------
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
			System.out.println(boardDTO.getB_no());
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
			
			System.out.println(msg);
			
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
	
	//----------------------------------------------------------------				
	// /boardUpDelProc.do 접속 시 호출되는 메소드 선언
	//----------------------------------------------------------------				
	@RequestMapping(value="/boardUpDelProc.do")
	public ModelAndView boardUpDelProc(
			//----------------------------------------------------------------				
			// "upDel" 라는 파라미터명의 파라미터값이 저장된 매개변수 upDel 선언 
			//----------------------------------------------------------------				
			@RequestParam(value="upDel") String upDel
			//----------------------------------------------------------------				
			// 파라미터값을 저장할 [BoardDTO 객체]를 매개변수로 선언
			//----------------------------------------------------------------				
			, BoardDTO boardDTO
			//----------------------------------------------------------------				
			// 유효성 검사 결과를 관리하는 BindingResult 객체가 저장되어 들어오는 매개변수 bindingResult 선언
			//----------------------------------------------------------------				
			, BindingResult bindingResult
	) {
		
		System.out.println("===BoardController.boardUpDelProc 시작===");
		
		//----------------------------------------------------------------
		// 유효성 체크 에러 메시지 저장할 변수 msg 선언
		//----------------------------------------------------------------
		String msg = "";
		int boardUpDelCnt = 0;
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		//----------------------------------------------------------------			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardUpDelProc.jsp");
		
		//----------------------------------------------------------------			
		// 만약 [게시판 수정] 모드이면 수정 실행하고 수정 적용행의 개수얻기
		//----------------------------------------------------------------			
		if("up".equals(upDel)) {
			
			System.out.println("===BoardController.boardUpDelProc up===");
			
			//----------------------------------------------------------------		
			// check_BoardDTO 메소드를 호출하여 유효성 체크하고 에러 메시지 문자 얻기
			//----------------------------------------------------------------			
			msg = check_BoardDTO(boardDTO, bindingResult);
			
			//----------------------------------------------------------------			
			// 만약 msg 안에 ""가 저장되어 있으면, 즉, 유효성 체크를 통과했으면
			//----------------------------------------------------------------			
			if("".equals(msg)) {
				try {
					//----------------------------------------------------------------		
					// BoardServiceImpl 객체의 updateBoard 라는 메소드 호출로
					// 게시판 수정 실행하고 수정 적용행의 개수얻기
					//----------------------------------------------------------------			
					boardUpDelCnt = this.boardService.updateBoard(boardDTO);
				
					System.out.println("===BoardController.boardUpDelProc boardUpDelCnt => " + boardUpDelCnt);
					
				} catch(Exception ex) {
					System.out.println("BoardController.boardUpDelProc up 캐치캐치");
				}
			
			}

		}
		//----------------------------------------------------------------			
		// 만약 [게시판 삭제] 모드이면
		//----------------------------------------------------------------			
		else if("del".equals(upDel)) {
			
			System.out.println("===BoardController.boardUpDelProc del===");
			
			try {
				//----------------------------------------------------------------			
				// 삭제 실행하고 삭제 적용행의 개수 얻기
				//----------------------------------------------------------------			
				boardUpDelCnt = this.boardService.deleteBoard(boardDTO);
				
			} catch(Exception ex) {
				System.out.println("BoardController.boardUpDelProc del 캐치캐치");
			}
			
		}
		
		//----------------------------------------------------------------
		// [ModelAndView 객체] boardUpDelCnt 저장
		// [ModelAndView 객체] msg 저장
		//----------------------------------------------------------------
		mav.addObject("boardUpDelCnt", boardUpDelCnt);
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
