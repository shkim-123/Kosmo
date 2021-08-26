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
	
	@Override
	public int boardUpdate(BoardDTO boardDTO) {
		
		System.out.println("===BoardServiceImpl.boardUpdate 시작===");
		
		// 입력한 pwd, b_no 가져오기
		String pwd = boardDTO.getPwd();
		int b_no = boardDTO.getB_no();

		// 게시글의 원래 비밀번호 가져오기
		String getPwd = this.boardDAO.getPwd(b_no);
		
		// getPwd가 null 인 경우 게시글이 삭제되었다고 판단하여 -3 리턴한다.
		if( getPwd == null ) { return -3; }

		// 업데이트된 개수를 저장하는 변수 선언
		int boardUpCnt = 0;
		
		// 비밀번호가 일치한 경우
		if(getPwd.equals(pwd)) {
			// BoardDAOImpl 객체의 boardUpdate 메소드 호출
			boardUpCnt = this.boardDAO.boardUpdate(boardDTO);
			System.out.println("===BoardServiceImpl.boardUpdate boardUpCnt => " + boardUpCnt);
		} 
		// 비밀번호가 일치하지 않은 경우 -1 저장
		else {
			boardUpCnt = -1;
		}
		
		System.out.println("===BoardServiceImpl.boardUpdate 종료===");
		
		return boardUpCnt;
	}
	
	@Override
	public int boardDelete(BoardDTO boardDTO) {
		
		System.out.println("===BoardServiceImpl.boardDelete 시작===");
		
		
		// 입력한 pwd, b_no 가져오기
		String pwd = boardDTO.getPwd();
		int b_no = boardDTO.getB_no();

		// 게시글의 원래 비밀번호 가져오기
		String getPwd = this.boardDAO.getPwd(b_no);
		
		// getPwd가 null 인 경우 게시글이 삭제되었다고 판단하여 -3 리턴한다.
		if( getPwd == null ) { return -3; }
		
		
		int boardDelCnt = 0;
		
		// 비밀번호가 일치하는지 확인
		if(getPwd.equals(pwd)) {
			// BoardDAOImpl 객체의 boardUpdate 메소드 호출
			boardDelCnt = this.boardDAO.boardDelete(boardDTO);
			System.out.println("===BoardServiceImpl.boardUpdate boardDelCnt => " + boardDelCnt);
		} 
		// 비밀번호가 일치하지 않은 경우 -1 저장
		else {
			boardDelCnt = -1;
		}
		
		
		System.out.println("===BoardServiceImpl.boardDelete 종료===");
		
		return boardDelCnt;
	}
	
}
