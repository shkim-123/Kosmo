package com.naver.erp.service;

import org.springframework.web.multipart.MultipartFile;

import com.naver.erp.dto.BoardDTO;

public interface BoardService {
	
	//----------------------------------------------------------------
	// [게시판 글 입력 후 입력 적용 행의 개수]를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int insertBoard(BoardDTO boardDTO, MultipartFile multi) throws Exception;
	
	//----------------------------------------------------------------
	// [1개 게시판 글] 리턴하는 메소드 선언
	//----------------------------------------------------------------
	BoardDTO getBoard(int b_no);
	
	//----------------------------------------------------------------
	// [1개 게시판] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int updateBoard(BoardDTO boardDTO, MultipartFile multi) throws Exception;
	
	//----------------------------------------------------------------
	// [1개 게시판] 삭제 후 삭제 적용행의 개수를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int deleteBoard(BoardDTO boardDTO);
	
}
