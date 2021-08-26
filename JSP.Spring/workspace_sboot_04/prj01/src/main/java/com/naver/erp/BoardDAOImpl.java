package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//----------------------------------------------------------------
// [DAO 클래스]인 [BoardDAOImpl 클래스] 선언
//----------------------------------------------------------------
// @Repository를 붙임으로써 [DAO 클래스]임을 지정하게 되고, bean 태그로 자동 등록된다.
//----------------------------------------------------------------
@Repository
public class BoardDAOImpl implements BoardDAO {

	//----------------------------------------------------------------
	// 속성변수 sqlSession 선언하고, [SqlSessionTemplate 객체]를 생성해 저장
	//----------------------------------------------------------------
	// @Autowired 역할 : 속성변수에 붙은 자료형이 [인터페이스]면 이를 구현한 [클래스]를 객체화하여 저장한다.
	// @Autowired 역할 : 속성변수에 붙은 자료형이 [클래스]명 이를 객체화하여 저장한다.
	//----------------------------------------------------------------
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//----------------------------------------------------------------
	// [게시판 글 입력 후 입력 적용 행의 개수]를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	@Override
	public int insertBoard(BoardDTO boardDTO) {
		
		System.out.println("===BoardDAOImpl.insertBoard 시작===");
		
		//----------------------------------------------------------------
		// SqlSessionTemplate 객체의 insert 메소드 호출로
		// 게시판 글 입력 SQL 구문을 실행하고 입력 성공 행의 개수 얻기
		//----------------------------------------------------------------
		int boardRegCnt = this.sqlSession.insert(
				//----------------------------------------------------------------
				// 실행할 SQL 구문의 위치를 지정하기
				// 실행할 SQL 구문의 위치 문자열 패턴은 아래와 같다.
				// xml 파일 중에 "mapper태그의namespace명.mapper태그내부의호출할SQL구문소유한태그id값"
				//----------------------------------------------------------------
				"com.naver.erp.BoardDAO.insertBoard"
				//----------------------------------------------------------------
				// 호출할 SQL구문에서 사용할 데이터 지정하기
				//----------------------------------------------------------------
				, boardDTO
		);
		
		System.out.println("===BoardDAOImpl.insertBoard 종료===");
		
		return boardRegCnt;
	}

	//----------------------------------------------------------------
	// [검색한 게시판 목록] 리턴하는 메소드 선언
	//----------------------------------------------------------------
	@Override
	public List<Map<String, String>> getBoardList() {
		
		System.out.println("===BoardDAOImpl.getBoardList 시작===");
		
		List<Map<String, String>> boardList = this.sqlSession.selectList(
				"com.naver.erp.BoardDAO.getBoardList"	// 실행할 SQL 구문의 위치 지정
		);
		
		System.out.println("===BoardDAOImpl.getBoardList 종료===");
		
		return boardList;
	}
	
	//----------------------------------------------------------------
	// [1개의 게시판 글 정보]를 리턴하는 메소드 선언
	//----------------------------------------------------------------
	@Override
	public BoardDTO getBoard(int b_no) {
		
		System.out.println("===BoardDAOImpl.getBoard 시작===");
		
		//----------------------------------------------------------------
		// [SqlSessionTemplate 객체]의 selectOne(~,~)를 호출하여 [1개 게시판 글 정보] 얻기
		// selectOne은 1행 n열의 select 결과를 얻을 때 사용하는 메소드이다.
		//----------------------------------------------------------------
		BoardDTO boardDTO = this.sqlSession.selectOne(
				//----------------------------------------------------------------
				// 실행할 SQL 구문의 위치를 지정하기
				// 실행할 SQL 구문의 위치 문자열 패턴은 아래와 같다.
				// xml 파일 중에 "mapper태그의namespace명.mapper태그내부의호출할SQL구문소유한태그id값"
				//----------------------------------------------------------------
				"com.naver.erp.BoardDAO.getBoard"	// 실행할 SQL 구문의 위치 지정
				//----------------------------------------------------------------
				// 실행할 SQL구문에서 사용할 데이터 지정하기
				//----------------------------------------------------------------
				, b_no								// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		
		System.out.println("===BoardDAOImpl.getBoard 종료===");
		
		//----------------------------------------------------------------
		// [1개의 게시판 글 정보]를 리턴하기
		//----------------------------------------------------------------
		return boardDTO;
	}
	
	//----------------------------------------------------------------
	// [게시판 글 조회수 증가하고 수정행의 개수] 리턴하는 메소드 선언
	//----------------------------------------------------------------
	@Override
	public int updateReadcount(int b_no) {
		
		System.out.println("===BoardDAOImpl.updateReadcount 시작===");
		
		//----------------------------------------------------------------
		// [SqlSessionTemplate 객체]의 update(~,~)를 호출하여 [조회수 증가]하기
		//----------------------------------------------------------------
		int updateCnt = this.sqlSession.update(
				"com.naver.erp.BoardDAO.updateReadcount"	// 실행할 SQL 구문의 위치 지정
				, b_no										// 실행할 SQL 구문에서 사용할 데이터 지정
		);
		
		System.out.println("===BoardDAOImpl.updateReadcount 종료===");
		
		return updateCnt;
		
	}
	
	@Override
	public int boardUpdate(BoardDTO boardDTO) {
		
		System.out.println("===BoardDAOImpl.boardUpdate 시작===");
		
		int boardUpCnt = this.sqlSession.update("com.naver.erp.BoardDAO.boardUpdate", boardDTO);

		System.out.println("===BoardDAOImpl.boardUpdate boardUpCnt => " + boardUpCnt);

		System.out.println("===BoardDAOImpl.boardUpdate 종료===");
		
		return boardUpCnt;
	}
	
	@Override
	public String getPwd(int b_no) {
		
		System.out.println("===BoardDAOImpl.getPwd 시작===");
		
		System.out.println("===BoardDAOImpl.getPwd b_no => " + b_no);
		
		String pwd = this.sqlSession.selectOne("com.naver.erp.BoardDAO.getPwd", b_no);
		
		System.out.println("===BoardDAOImpl.getPwd pwd => " + pwd);
		
		System.out.println("===BoardDAOImpl.getPwd 종료===");
		
		return pwd;
	}
	
	@Override
	public int boardDelete(BoardDTO boardDTO) {

		System.out.println("===BoardDAOImpl.boardDelete 시작===");
		
		int boardDelCnt = this.sqlSession.delete("com.naver.erp.BoardDAO.boardDelete", boardDTO);
		
		System.out.println("===BoardDAOImpl.boardDelete boardDelCnt => " + boardDelCnt);

		System.out.println("===BoardDAOImpl.boardDelete 종료===");
		
		return boardDelCnt;
	}
	
}
