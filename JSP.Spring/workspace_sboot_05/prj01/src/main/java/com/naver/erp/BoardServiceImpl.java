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
}
