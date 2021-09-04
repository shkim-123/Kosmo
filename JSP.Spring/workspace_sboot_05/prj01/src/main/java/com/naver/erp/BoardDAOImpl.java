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
	public List<Map<String, String>> getBoardList(BoardSearchDTO boardSearchDTO) {
		
		List<Map<String,String>> boardList = this.sqlSession.selectList(
				"com.naver.erp.BoardDAO.getBoardList", boardSearchDTO
		);
		
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
	
	// 게시글 존재하는지 리턴
	@Override
	public int getBoardCnt(BoardDTO boardDTO) {
		
		int boardCnt = this.sqlSession.selectOne("com.naver.erp.BoardDAO.getBoardCnt", boardDTO);
		
		return boardCnt;
	}
	
	// 비밀번호 일치하는지 리턴
	@Override
	public int getPwdCnt(BoardDTO boardDTO) {
		
		int pwdCnt = this.sqlSession.selectOne("com.naver.erp.BoardDAO.getPwdCnt", boardDTO);
		
		return pwdCnt;
	}
	
	// 수정한 게시글 개수 리턴
	@Override
	public int updateBoard(BoardDTO boardDTO) {
		
		int updateBoard = this.sqlSession.update("com.naver.erp.BoardDAO.updateBoard", boardDTO);
		
		return updateBoard;
	}
	
	// 댓글이 존재하는지 리턴
	@Override
	public int getChildrenCnt(BoardDTO boardDTO) {
		
		int childrenCnt = this.sqlSession.selectOne("com.naver.erp.BoardDAO.getChildrenCnt", boardDTO);
		
		return childrenCnt;
	}
	
	// 출력순서번호 -1씩 업데이트
	@Override
	public int downPrintNo(BoardDTO boardDTO) {
		
		int downPrintNo = this.sqlSession.update("com.naver.erp.BoardDAO.downPrintNo", boardDTO);
		
		return downPrintNo;
	}
	
	// 삭제한 게시글 개수 리턴
	@Override
	public int deleteBoard(BoardDTO boardDTO) {
		
		int deleteBoard = this.sqlSession.delete("com.naver.erp.BoardDAO.deleteBoard", boardDTO);
		
		return deleteBoard;
	}
	
	// 출력순서번호 +1씩 업데이트
	@Override
	public int upPrintNo(BoardDTO boardDTO) {
		
		int upPrintNo = this.sqlSession.update("com.naver.erp.BoardDAO.upPrintNo", boardDTO);
		
		return upPrintNo;
	}
	
	// 댓글 등록
	@Override
	public int insertReply(BoardDTO boardDTO) {
		
		int insertReply = this.sqlSession.insert("com.naver.erp.BoardDAO.insertReply", boardDTO);
		
		return insertReply;
	}
	
	// 게시글 개수 리턴
	@Override
	public int getBoardListAllCnt(BoardSearchDTO boardSearchDTO) {
		
		int boardListAllCnt = this.sqlSession.selectOne(
				"com.naver.erp.BoardDAO.getBoardListAllCnt", boardSearchDTO
		);
		
		return boardListAllCnt;
	}
	
}
