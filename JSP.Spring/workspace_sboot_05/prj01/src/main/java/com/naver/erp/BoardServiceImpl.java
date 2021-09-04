package com.naver.erp;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	// 새글쓰기
	@Override
	public int insertBoard(BoardDTO boardDTO) {
		
		int insertCnt = this.boardDAO.insertBoard(boardDTO);
		
		return insertCnt;
	}
	
	//게시글 하나 가져오기
	@Override
	public BoardDTO getBoard(int b_no) {
		
		// 조회수 업데이트
		int updateReadcount = this.boardDAO.updateReadcount(b_no);
		if(updateReadcount == 0) {return null;}
		
		// 게시글 가져오기
		BoardDTO board = this.boardDAO.getBoard(b_no);
		
		return board;
		
	}
	
	// 게시글 수정하기
	@Override
	public int updateBoard(BoardDTO boardDTO) {
		
		// 게시글이 존재하는지 확인
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
		if(boardCnt == 0) {return -1;}
				
		// 비밀번호 일치하는지 확인		
		int pwdCnt = this.boardDAO.getPwdCnt(boardDTO);
		if(pwdCnt == 0) {return -2;}
				
		// 게시글 수정하기
		int updateCnt = this.boardDAO.updateBoard(boardDTO);
		
		return updateCnt;
		
	}
	
	// 게시글 삭제하기
	@Override
	public int deleteBoard(BoardDTO boardDTO) {
		
		// 게시글이 존재하는지 확인
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
		if(boardCnt == 0) {return -1;}
		
		// 비밀번호 일치하는지 확인
		int pwdCnt = this.boardDAO.getPwdCnt(boardDTO);
		if(pwdCnt == 0) {return -2;}
		
		// 댓글이 존재하는지 확인
		int childrenCnt = this.boardDAO.getChildrenCnt(boardDTO);
		if(childrenCnt > 0) {return -3;}
		
		// 게시글 출력순서번호 -1씩 업데이트
		int downPrintNoCnt = this.boardDAO.downPrintNo(boardDTO);
		
		// 게시글 삭제하기
		int deleteBoard = this.boardDAO.deleteBoard(boardDTO);
		
		return deleteBoard;
	}
	
	// 댓글 등록
	@Override
	public int insertReply(BoardDTO boardDTO) {
		
		// 게시글이 존재하는지 확인
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
		if(boardCnt == 0) {return -1;}
		
		// 게시글 출력순서번호 +1씩 업데이트
		int upPrintNo = this.boardDAO.upPrintNo(boardDTO);
		
		// 댓글 등록
		int insertReply = this.boardDAO.insertReply(boardDTO);
		
		return insertReply;
	}
	
}
