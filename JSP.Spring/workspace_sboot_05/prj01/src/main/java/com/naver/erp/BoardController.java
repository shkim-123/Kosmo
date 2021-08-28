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
	public ModelAndView getBoardList() {
		ModelAndView mav = new ModelAndView();
		
		List<Map<String,String>> boardList = null;
		
		try {
			// 게시판 목록 가져오기
			boardList = this.boardDAO.getBoardList();
		} catch(Exception ex) {
			System.out.println("getBoardList catch!!! => " + ex);
		}
		
		mav.setViewName("boardList.jsp");
		mav.addObject("boardList", boardList);
		
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
