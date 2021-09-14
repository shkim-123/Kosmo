package com.naver.erp.dto;

import java.util.List;

//----------------------------------------------------------------
// DTO 객체의 관용적 명명 규칙
//----------------------------------------------------------------
// BoardDTO / BoardDto : 테이블명 + DTO
// BoardVO  / BoardVo : 테이블명 + VO : Value Object 값을 가진 객체란 뜻
// Board : 테이블명과 일치하는 경우
//----------------------------------------------------------------
public class EmployeeSearchDTO {

	private String keyword;
	private List<String> jikup;
	private List<String> dep_name;
	private String hire_date_year_start;
	private String hire_date_month_start;
	private String hire_date_year_end;
	private String hire_date_month_end;
	
	private String hire_date_start;  // 입사일 flatpickr
	private String hire_date_end;	// 입사일 flatpickr
//----------------------------------------------------------------
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public List<String> getJikup() {
		return jikup;
	}
	public void setJikup(List<String> jikup) {
		this.jikup = jikup;
	}
	public List<String> getDep_name() {
		return dep_name;
	}
	public void setDep_name(List<String> dep_name) {
		this.dep_name = dep_name;
	}
	public String getHire_date_year_start() {
		return hire_date_year_start;
	}
	public void setHire_date_year_start(String hire_date_year_start) {
		this.hire_date_year_start = hire_date_year_start;
	}
	public String getHire_date_month_start() {
		return hire_date_month_start;
	}
	public void setHire_date_month_start(String hire_date_month_start) {
		this.hire_date_month_start = hire_date_month_start;
	}
	public String getHire_date_year_end() {
		return hire_date_year_end;
	}
	public void setHire_date_year_end(String hire_date_year_end) {
		this.hire_date_year_end = hire_date_year_end;
	}
	public String getHire_date_month_end() {
		return hire_date_month_end;
	}
	public void setHire_date_month_end(String hire_date_month_end) {
		this.hire_date_month_end = hire_date_month_end;
	}
	public String getHire_date_start() {
		return hire_date_start;
	}
	public void setHire_date_start(String hire_date_start) {
		this.hire_date_start = hire_date_start;
	}
	public String getHire_date_end() {
		return hire_date_end;
	}
	public void setHire_date_end(String hire_date_end) {
		this.hire_date_end = hire_date_end;
	}
	
	
}
