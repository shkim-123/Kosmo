package com.naver.erp.dto;

//----------------------------------------------------------------
// DTO 객체의 관용적 명명 규칙
//----------------------------------------------------------------
// BoardDTO / BoardDto : 테이블명 + DTO
// BoardVO  / BoardVo : 테이블명 + VO : Value Object 값을 가진 객체란 뜻
// Board : 테이블명과 일치하는 경우
//----------------------------------------------------------------
public class DeptDTO {
	
	private int dep_no;
	private String dep_name;
	private String loc;
	
	public int getDep_no() {
		return dep_no;
	}
	public void setDep_no(int dep_no) {
		this.dep_no = dep_no;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}
