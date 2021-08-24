package com.naver.erp;

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
		int boardRegCnt = sqlSession.insert(
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
	
}
