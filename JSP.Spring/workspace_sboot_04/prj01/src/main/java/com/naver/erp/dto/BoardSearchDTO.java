package com.naver.erp.dto;

import java.util.List;

//----------------------------------------------------------------
// DTO 객체의 관용적 명명 규칙
//----------------------------------------------------------------
// BoardDTO / BoardDto : 테이블명 + DTO
// BoardVO  / BoardVo : 테이블명 + VO : Value Object 값을 가진 객체란 뜻
// Board : 테이블명과 일치하는 경우
//----------------------------------------------------------------
public class BoardSearchDTO {
	
	//----------------------------------------------------------------
	// 속성변수 선언
	//----------------------------------------------------------------
	private String keyword1;			// 키워드가 저장될 속성변수
	private String keyword2;			// 키워드가 저장될 속성변수
	private String orAnd;				// 2개의 키워드 사이에 들어갈 or 또는 and가 저장되는 속성변수
	private int selectPageNo = 1;		// 유저가 [선택한 페이지번호]가 저장되는 속성변수, 
										// 		반드시 디폴트 값이 있어야 DB 연동 시 에러가 없다.
	private int rowCntPerPage = 20;		// 한 화면에 보여줄 [행의 개수]를 저장하는 속성변수,
										// 		반드시 디폴트 값이 있어야 DB 연동 시 에러가 없다.
	private List<String> day;			// 어제 또는 오늘 또는 그제가 저장되는 속성변수
										//		checkbox 입력양식 값이 들어올 때는 ArrayList가 받는다.
	private String sort;				// 등록일 관련 정렬 데이터가 저장되는 속성변수. 
										//		"reg_date desc" 또는 "reg_date asc"가 저장될 예정이다.
	//----------------------------------------------------------------
	// getter, setter 메소드 선언
	//----------------------------------------------------------------
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public String getOrAnd() {
		return orAnd;
	}
	public void setOrAnd(String orAnd) {
		this.orAnd = orAnd;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	public List<String> getDay() {
		return day;
	}
	public void setDay(List<String> day) {
		this.day = day;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}

}
