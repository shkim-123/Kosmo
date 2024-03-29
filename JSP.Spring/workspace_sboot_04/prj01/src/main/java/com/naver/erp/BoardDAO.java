package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface BoardDAO {

	//----------------------------------------------------------------
	// [게시판 글 입력 후 입력 적용 행의 개수]를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int insertBoard(BoardDTO boardDTO);
	
	//----------------------------------------------------------------
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	//----------------------------------------------------------------
	List<Map<String, String>> getBoardList(BoardSearchDTO boardSerarchDTO);
	
	//----------------------------------------------------------------
	// [1개의 게시판 글 정보]를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	BoardDTO getBoard(int b_no);
	
	//----------------------------------------------------------------
	// 조회수를 1 증가하고 업데이트한 행의 개수를 얻는 메소드 선언
	//----------------------------------------------------------------
	int updateReadcount(int b_no);
	
	//----------------------------------------------------------------
	// 수정할 게시판의 존재 개수를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int getBoardCnt(BoardDTO boardDTO);
	
	//----------------------------------------------------------------
	// 수정할 게시판의 비밀번호 존재 개수를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int getPwdCnt(BoardDTO boardDTO);
	
	//----------------------------------------------------------------
	// 게시판 수정 명령한 후 수정 적용행의 개수를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int updateBoard(BoardDTO boardDTO);
	
	//----------------------------------------------------------------
	// [삭제할 게시판의 자식글 존재 개수]를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int getChildrenCnt(BoardDTO boardDTO);
	
	//----------------------------------------------------------------
	// [삭제될 게시판 이후 글의 출력 순서번호]를 1씩 감소 시킨 후 수정 적용행의 개수를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int downPrintNo(BoardDTO boardDTO);
	
	//----------------------------------------------------------------
	// [게시판 삭제 명령한 후 삭제 적용행의 개수]를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int deleteBoard(BoardDTO boardDTO);
	
	//----------------------------------------------------------------
	// [게시판 글 출력번호 1 증가하고 수정행의 개수] 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int updatePrintNo(BoardDTO boardDTO);
	
	//----------------------------------------------------------------
	// [검색한 게시판 목록 총개수] 리턴하는 메소드 선언
	//----------------------------------------------------------------
	int getBoardListAllCnt(BoardSearchDTO boardSearchDTO);
	
}
