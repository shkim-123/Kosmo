package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
	
	// 새글쓰기
	int insertBoard(BoardDTO boardDTO);
	
	// 목록 가져오기
	List<Map<String,String>> getBoardList(BoardSearchDTO boardSearchDTO);
	
	// 조회수 업데이트
	int updateReadcount(int b_no);
	
	// 게시글 하나 가져오기
	BoardDTO getBoard(int b_no);
	
	// 게시글 존재하는지 리턴
	int getBoardCnt(BoardDTO boardDTO);
	
	// 비밀번호 일치하는지 리턴
	int getPwdCnt(BoardDTO boardDTO);
	
	// 수정한 게시글 개수 리턴
	int updateBoard(BoardDTO boardDTO);

	// 댓글이 존재하는지 리턴
	int getChildrenCnt(BoardDTO boardDTO);

	// 출력순서번호 -1씩 업데이트
	int downPrintNo(BoardDTO boardDTO);
	
	// 삭제한 게시글 개수 리턴
	int deleteBoard(BoardDTO boardDTO);
	
	// 출력순서번호 +1씩 업데이트
	int upPrintNo(BoardDTO boardDTO);
	
	// 댓글 등록
	int insertReply(BoardDTO boardDTO);
	
	// 게시글 개수 리턴
	int getBoardListAllCnt(BoardSearchDTO boardSearchDTO);
	
}
