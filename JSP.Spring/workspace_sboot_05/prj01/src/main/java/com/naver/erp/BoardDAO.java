package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
	
	// 새글쓰기
	int insertBoard(BoardDTO boardDTO);
	
	// 목록 가져오기
	List<Map<String,String>> getBoardList();
	
	// 조회수 업데이트
	int updateReadcount(int b_no);
	
	// 게시글 하나 가져오기
	BoardDTO getBoard(int b_no);

}
