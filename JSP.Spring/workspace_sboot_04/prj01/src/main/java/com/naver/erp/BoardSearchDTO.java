package com.naver.erp;

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
	// [검색 키워드] 저장하는 속성변수 선언
	// 현재 [선택된 페이지 번호]를 저장하는 속성변수 선언
	// 한 화면에 보여줄 [행의 개수]를 저장하는 속성변수 선언
	//----------------------------------------------------------------
	private String keyword1;
	private String keyword2;
	private String orAnd;
	private int selectPageNo = 1;
	private int rowCntPerPage = 20;
	private List<String> day;
	private String sort;
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
