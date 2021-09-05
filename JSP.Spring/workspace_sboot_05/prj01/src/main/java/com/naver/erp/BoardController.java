package com.naver.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardServie;
	
	@Autowired
	private BoardDAO boardDAO;
	
	// 게시판 목록으로 이동
	@RequestMapping( value="/boardList.do" )
	public ModelAndView getBoardList(BoardSearchDTO boardSearchDTO) {
		ModelAndView mav = new ModelAndView();
		
		List<Map<String,String>> boardList = null;
		int boardListAllCnt=0;
		int rowCntPerPage = boardSearchDTO.getRowCntPerPage();
		int selectPageNo = boardSearchDTO.getSelectPageNo();
		int pageNoCntPerPage = 10;
		int last_pageNo = 0;
		int min_pageNo = 0;
		int max_pageNo = 0;
		
		try {
			// 게시판 글 개수 가져오기
			boardListAllCnt = this.boardDAO.getBoardListAllCnt(boardSearchDTO);
			System.out.println("getBoardList boardListAllCnt => " + boardListAllCnt);
		} catch(Exception ex) {
			System.out.println("getBoardList boardListAllCnt catch!!! => " + ex);
		}
		
		// 페이징 처리
		if(boardListAllCnt > 0) {
			last_pageNo = boardListAllCnt/rowCntPerPage;
				if(boardListAllCnt%rowCntPerPage > 0) { last_pageNo++; }
				if(selectPageNo > last_pageNo) {
					selectPageNo = 1;
					boardSearchDTO.setSelectPageNo(selectPageNo);
				}
				
			min_pageNo = (selectPageNo-1)/pageNoCntPerPage*pageNoCntPerPage+1;
			max_pageNo = min_pageNo+pageNoCntPerPage-1;
				if(max_pageNo > last_pageNo) { max_pageNo = last_pageNo; }
		}
		
		
		try {
			// 게시판 목록 가져오기
			boardList = this.boardDAO.getBoardList(boardSearchDTO);
		} catch(Exception ex) {
			System.out.println("getBoardList boardList catch!!! => " + ex);
		}
		
		mav.setViewName("boardList.jsp");
		mav.addObject("boardListAllCnt", boardListAllCnt);
		mav.addObject("boardList", boardList);
		mav.addObject("rowCntPerPage",rowCntPerPage);
		mav.addObject("selectPageNo",selectPageNo);
		mav.addObject("last_pageNo",last_pageNo);
		mav.addObject("min_pageNo",min_pageNo);
		mav.addObject("max_pageNo",max_pageNo);
		
		return mav;
	}
	
	// 게시글 쓰기로 이동
	@RequestMapping( value="/boardRegForm.do" )
	public ModelAndView goBoardRegForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardRegForm.jsp");
		return mav;
	}
	
	// 게시판 새글쓰기 등록
	@RequestMapping( value="/boardRegProc.do" )
	public ModelAndView insertBoard(BoardDTO boardDTO, BindingResult bindingResult) {
		ModelAndView mav = new ModelAndView();
		String msg="";
		int insertCnt=0;
		
		// 유효성 체크
		msg = checkForm(boardDTO, bindingResult);
		
		// 유효성 체크 통과 시 db통신하여 새글쓰기 등록
		if("".equals(msg)) {
			try {
				insertCnt = this.boardServie.insertBoard(boardDTO);
			} catch(Exception ex) {
				System.out.println("insertBoard 캐치!! => " + ex);
			}
		}
		
		mav.setViewName("boardRegProc.jsp");
		mav.addObject("insertCnt", insertCnt);
		mav.addObject("msg", msg);
		
		return mav;
	}
	
	// 게시글 상세로 이동
	@RequestMapping( value="/boardContentForm.do" )
	public ModelAndView goBoardContentForm(@RequestParam(value="b_no") int b_no) {
		ModelAndView mav = new ModelAndView();
		BoardDTO getBoard = null;
		
		try {
			// 가져온 게시글 저장
			getBoard = this.boardServie.getBoard(b_no);
			
		}catch(Exception ex) {
			System.out.println("goBoardContentForm catch!! => " + ex);
		}
		
		mav.setViewName("boardContentForm.jsp");
		mav.addObject("getBoard", getBoard);
		
		return mav;
	}
	
	// 게시글 수정/삭제 화면으로 이동
	@RequestMapping( value="/boardUpDelForm.do" )
	public ModelAndView goBoardUpDelForm(@RequestParam(value="b_no") int b_no) {
		ModelAndView mav = new ModelAndView();
		
		BoardDTO getBoard = null;
		
		try {
			// 가져온 게시글 저장
			getBoard = this.boardServie.getBoard(b_no);
			
		}catch(Exception ex) {
			System.out.println("goBoardContentForm catch!! => " + ex);
		}
		
		
		mav.setViewName("boardUpDelForm.jsp");
		mav.addObject("getBoard", getBoard);
		return mav;
	}
	
	// 게시글 수정/삭제하기
	@RequestMapping( value="/boardUpDelProc.do" )
	public ModelAndView upDelBoard(
			BoardDTO boardDTO
			, @RequestParam(value="upDel") String upDel
			, BindingResult bindingResult
	) {
		ModelAndView mav = new ModelAndView();
		String msg = "";
		int upDelCnt = 0;
		
		// 수정인 경우
		if("up".equals(upDel)) {
			// 유효성 체크
			msg = checkForm(boardDTO, bindingResult);
			
			// 유효성 체크 통과 시 
			if("".equals(msg)) {
				try {
					upDelCnt = this.boardServie.updateBoard(boardDTO);
				} catch(Exception ex) {
					System.out.println("upDelBoard up catch!! => " + ex );
				}
			}
			
		} else if("del".equals(upDel)) {
			try {
				upDelCnt = this.boardServie.deleteBoard(boardDTO);
			} catch(Exception ex) {
				System.out.println("upDelBoard del catch!! => " + ex );
			}
		}
		
		mav.setViewName("boardUpDelProc.jsp");
		mav.addObject("msg", msg);
		mav.addObject("upDelCnt", upDelCnt);
		
		return mav;
	}
	
	// 댓글쓰기로 이동
	@RequestMapping( value="/boardReplyForm.do" )
	public ModelAndView goBoardReplyForm(@RequestParam(value="b_no") int b_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardReplyForm.jsp");
		return mav;
	}
	
	// 댓글 등록
	@RequestMapping( value="/boardReplyProc.do" )
	public ModelAndView insertReply(BoardDTO boardDTO, BindingResult bindingResult) {
		ModelAndView mav = new ModelAndView();
		String msg="";
		int insertReplyCnt = 0;
		
		// 유효성 체크
		msg=checkForm(boardDTO, bindingResult);
		
		// 유효성 체크 통과 시
		if("".equals(msg)) {
			try {
				insertReplyCnt = this.boardServie.insertReply(boardDTO);
			} catch(Exception ex) {
				System.out.println("insertReply catch!! => " + ex);
			}
		}
		
		mav.setViewName("boardReplyProc.jsp");
		mav.addObject("msg", msg);
		mav.addObject("insertReplyCnt", insertReplyCnt);
		
		return mav;
	}
	
	// 유효성 체크 함수
	public String checkForm(BoardDTO boardDTO, BindingResult bindingResult) {
		String checkMsg ="";
		
		BoardValidator boardValidator = new BoardValidator();
		
		boardValidator.validate(boardDTO, bindingResult);
		
		if(bindingResult.hasErrors()) {
			checkMsg= bindingResult.getFieldError().getCode();
		}
		
		return checkMsg;
	}
	
}
