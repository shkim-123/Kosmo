package com.naver.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//----------------------------------------------------------------
// [서비스 클래스]인 [BoardServiceImpl 클래스] 선언
//----------------------------------------------------------------
// [서비스 클래스]에는 @Service와 @Transactional를 붙인다.
//----------------------------------------------------------------
// @Service : [서비스 클래스] 임을 지정하고 bean 태그로 자동 등록된다.
// @Transactional : [서비스 클래스]의 메소드 내부에서 일어나는 모든 작업에는 [트랜잭션]이 걸린다.
//----------------------------------------------------------------
@Service 
@Transactional
public class BoardServiceImpl implements BoardService {
	
	//----------------------------------------------------------------
	// 속성변수 boardDAO 선언하고, [BoardDAO 인터페이스]를 구현한 클래스를 객체화해서 저장한다.
	//----------------------------------------------------------------
	// @Autowired 역할 : 속성변수에 붙은 자료형인 [인터페이스]를 구현한 [클래스]를 객체화하여 저장한다.
	//----------------------------------------------------------------
	@Autowired
	private BoardDAO boardDAO;
	
	
	//----------------------------------------------------------------
	// [1개 게시판 글 입력 후 입력 적용 행의 개수]를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	@Override
	public int insertBoard(BoardDTO boardDTO) {
		
		System.out.println("===BoardServiceImpl.insertBoard 시작===");
		
		//----------------------------------------------------------------
		// 만약 부모글의 글 번호가 1 이상이면 댓글쓰기 이므로,
		// 부모글 이후의 게시판 글에 대해 출력순서번호를 1 증가 시키기
		//----------------------------------------------------------------
		if(boardDTO.getB_no() > 0) {
			System.out.println("===BoardServiceImpl.insertBoard updatePrintNoCnt 시작===");
			//----------------------------------------------------------------
			// [BoardDAOImpl 객체]의 updatePrintNo 메소드를 호출하여 출력 순서 번호를 1증가시키고
			// 수정행에 적용 개수를 리턴받는다.
			// 게시판 글이 입력되는 부분 이후 글들은 출력 순서번호를 1씩 증가하여야 한다.
			//----------------------------------------------------------------
			int updatePrintNoCnt = this.boardDAO.updatePrintNo(boardDTO);
			System.out.println("===BoardServiceImpl.insertBoard updatePrintNoCnt => " + updatePrintNoCnt);
			
		}
		
		//----------------------------------------------------------------
		// BoardDAOImpl 객체의 insertBoard 메소드 호출하여 게시판 글 입력 후 입력 적용 행의 개수 얻기
		//----------------------------------------------------------------
		int boardRegCnt = this.boardDAO.insertBoard(boardDTO);
		
		System.out.println("BoardServiceImpl.insertBoard boardRegCnt => " + boardRegCnt);
		
		System.out.println("===BoardServiceImpl.insertBoard 종료===");
		
		//----------------------------------------------------------------
		// 1개 게시판 글 입력 적용 행의 개수 리턴하기
		//----------------------------------------------------------------
		return boardRegCnt;
	}
	
	//----------------------------------------------------------------
	// [1개 게시판 글] 리턴하는 메소드 선언
	//----------------------------------------------------------------
	@Override
	public BoardDTO getBoard(int b_no) { 
		
		System.out.println("===BoardServiceImpl.getBoard 시작===");
		
		//----------------------------------------------------------------
		// [BoardDAOImpl 객체]의 updateReadcount 메소드를 호출하여
		// [조회수 증가]하고 수정한 행의 개수를 얻는다.
		//----------------------------------------------------------------
		int updateCnt = this.boardDAO.updateReadcount(b_no);
		
		System.out.println("===BoardServiceImpl.getBoard updateCnt => " + updateCnt);
		
		//----------------------------------------------------------------
		// 수정된 개수가 0이라면 
		//----------------------------------------------------------------
		if(updateCnt == 0) { return null; }
		
		//----------------------------------------------------------------
		// [BoardDAOImpl 객체]의 getBoard 메소드를 호출하여 [1개 게시판 글]을 얻는다. 
		//----------------------------------------------------------------
		BoardDTO board = this.boardDAO.getBoard(b_no);
		
		System.out.println("===BoardServiceImpl.getBoard boardDTO => " + board);
		
		System.out.println("===BoardServiceImpl.getBoard 종료===");
		
		//----------------------------------------------------------------
		// [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
		//----------------------------------------------------------------
		return board;
	}
	
	//----------------------------------------------------------------
	// [1개 게시판] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	@Override
	public int updateBoard(BoardDTO boardDTO) {
		
		System.out.println("===BoardServiceImpl.updateBoard 시작===");
		
		//----------------------------------------------------------------
		// [BoardDAOImpl 객체]의 getBoardCnt 메소드를 호출하여 
		// 수정할 게시판의 존재 개수를 얻는다.
		//----------------------------------------------------------------
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
		if(boardCnt == 0) { return -1; }
		
		//----------------------------------------------------------------
		// [BoardDAOImpl 객체]의 getPwdCnt 메소드를 호출하여 
		// 수정할 게시판의 비밀번호 존재 개수를 얻는다.
		//----------------------------------------------------------------
		int pwdCnt = this.boardDAO.getPwdCnt(boardDTO);
		if(pwdCnt == 0) { return -2; }
		
		//----------------------------------------------------------------
		// [BoardDAOImpl 객체]의 updateBoard 메소드를 호출하여 
		// 게시판 수정 명령한 후 수정 적용행의 개수를 얻는다.
		//----------------------------------------------------------------
		int updateCnt = this.boardDAO.updateBoard(boardDTO);
		
		System.out.println("===BoardServiceImpl.updateBoard 종료===");
		
		//----------------------------------------------------------------
		// [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
		//----------------------------------------------------------------
		return updateCnt;
		
	}
	
	//----------------------------------------------------------------
	// [1개 게시판] 삭제 후 삭제 적용행의 개수를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	@Override
	public int deleteBoard(BoardDTO boardDTO) {
		
		System.out.println("===BoardServiceImpl.deleteBoard 시작===");
		
		//----------------------------------------------------------------
		// [BoardDAOImpl 객체]의 getBoardCnt 메소드를 호출하여 
		// 삭제할 게시판의 존재 개수를 얻는다.
		//----------------------------------------------------------------
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
		if(boardCnt == 0) { return -1; }
		
		//----------------------------------------------------------------
		// [BoardDAOImpl 객체]의 getPwdCnt 메소드를 호출하여 
		// 삭제할 게시판의 비밀번호 존재 개수를 얻는다.
		//----------------------------------------------------------------
		int pwdCnt = this.boardDAO.getPwdCnt(boardDTO);
		if(pwdCnt == 0) { return -2; }
		
		//----------------------------------------------------------------
		// [BoardDAOImpl 객체]의 getChildrenCnt 메소드를 호출하여
		// [삭제할 게시판의 자식글 존재 개수]를 얻는다.
		//----------------------------------------------------------------
		int childrenCnt = this.boardDAO.getChildrenCnt(boardDTO);
		if(childrenCnt > 0) { return -3; }
		
		//----------------------------------------------------------------
		// [BoardDAOImpl 객체]의 downPrintNo 메소드를 호출하여
		// [삭제할 게시판 이후 글의 출력 순서번호를 1씩 감소 시킨 후 수정 적용행의 개수]를 얻는다.
		//----------------------------------------------------------------
		int downPrintNoCnt = this.boardDAO.downPrintNo(boardDTO);
		
		//----------------------------------------------------------------
		// [BoardDAOImpl 객체]의 deleteBoard 메소드를 호출하여
		// [게시판 삭제 명령한 후 삭제 적용행의 개수]를 얻는다.
		//----------------------------------------------------------------
		int deleteCnt = this.boardDAO.deleteBoard(boardDTO);
		
		System.out.println("===BoardServiceImpl.deleteBoard 종료===");
		
		return deleteCnt;
	}
	
	
}
