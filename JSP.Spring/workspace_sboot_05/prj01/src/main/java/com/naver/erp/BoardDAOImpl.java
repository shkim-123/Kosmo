package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 새글쓰기
	@Override
	public int insertBoard(BoardDTO boardDTO) {
		
		int insertCnt = this.sqlSession.insert("com.naver.erp.BoardDAO.insertBoard", boardDTO);
		
		return insertCnt;
	}
	
	// 목록 가져오기
	@Override
	public List<Map<String, String>> getBoardList() {
		
		List<Map<String,String>> boardList = this.sqlSession.selectList("com.naver.erp.BoardDAO.getBoardList");
		
		return boardList;
	}
	
	// 조회수 업데이트
	@Override
	public int updateReadcount(int b_no) {
		
		int updateReadcount = this.sqlSession.update("com.naver.erp.BoardDAO.updateReadcount", b_no);
		
		return updateReadcount;
	}
	
	// 게시글 하나 가져오기
	@Override
	public BoardDTO getBoard(int b_no) {
		
		BoardDTO getBoard = this.sqlSession.selectOne("com.naver.erp.BoardDAO.getBoard", b_no);
		
		return getBoard;
	}
	
	
}
