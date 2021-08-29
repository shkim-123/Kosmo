package com.naver.erp;

import java.util.Map;

public interface BoardService {
	
	// 새글쓰기
	int insertBoard(BoardDTO boardDTO);
	
	// 게시글 하나 가져오기
	BoardDTO getBoard(int b_no);
	
	// 게시글 수정하기
	int updateBoard(BoardDTO boardDTO);
	
	// 게시글 삭제하기
	int deleteBoard(BoardDTO boardDTO);

	// 댓글 등록
	int insertReply(BoardDTO boardDTO);
	
}
