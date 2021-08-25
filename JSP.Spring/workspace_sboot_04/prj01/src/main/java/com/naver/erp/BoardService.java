package com.naver.erp;

public interface BoardService {
	
	//----------------------------------------------------------------
	// [게시판 글 입력 후 입력 적용 행의 개수]를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int insertBoard(BoardDTO boardDTO);
	
	BoardDTO getBoard(int b_no);
	
	int updateBoard(int b_no);
	
}
