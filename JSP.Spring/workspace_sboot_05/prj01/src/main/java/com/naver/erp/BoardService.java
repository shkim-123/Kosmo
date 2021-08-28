package com.naver.erp;

import java.util.Map;

public interface BoardService {
	
	// 새글쓰기
	int insertBoard(BoardDTO boardDTO);
	
	// 게시글 하나 가져오기
	BoardDTO getBoard(int b_no);

}
