package com.naver.erp;

import java.util.List;

public class BoardSearchDTO {
	
	private String keyword1;
	private String keyword2;
	private int selectPageNo = 1;
	private int rowCntPerPage = 20;
	private List<String> day;
	private String orAnd;
	
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
	public String getOrAnd() {
		return orAnd;
	}
	public void setOrAnd(String orAnd) {
		this.orAnd = orAnd;
	}
	
	
	
}
