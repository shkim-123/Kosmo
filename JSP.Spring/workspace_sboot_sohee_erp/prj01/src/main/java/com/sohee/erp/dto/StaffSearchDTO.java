package com.sohee.erp.dto;

import java.util.List;

public class StaffSearchDTO {

	private String keyword;
	private List<String> gender;
	private Integer religion_code;
	private List<Integer> school_code;
	private List<Integer> skill_code;
	private String graduate_day_year_start;
	private String graduate_day_month_start;
	private String graduate_day_start;
	private String graduate_day_year_end;
	private String graduate_day_month_end;
	private String graduate_day_end;
	//-------------
	private int selectPageNo = 1;
	private int rowCntPerPage = 10;
	//-------------
	private String sort;
	//-------------
	public String getkeyword() {
		return keyword;
	}
	public void setkeyword(String keyword) {
		this.keyword = keyword;
	}
	public List<String> getGender() {
		return gender;
	}
	public void setGender(List<String> gender) {
		this.gender = gender;
	}
	public Integer getReligion_code() {
		return religion_code;
	}
	public void setReligion_code(Integer religion_code) {
		this.religion_code = religion_code;
	}
	public List<Integer> getSchool_code() {
		return school_code;
	}
	public void setSchool_code(List<Integer> school_code) {
		this.school_code = school_code;
	}
	public List<Integer> getSkill_code() {
		return skill_code;
	}
	public void setSkill_code(List<Integer> skill_code) {
		this.skill_code = skill_code;
	}
	public String getGraduate_day_year_start() {
		return graduate_day_year_start;
	}
	public void setGraduate_day_year_start(String graduate_day_year_start) {
		this.graduate_day_year_start = graduate_day_year_start;
	}
	public String getGraduate_day_month_start() {
		return graduate_day_month_start;
	}
	public void setGraduate_day_month_start(String graduate_day_month_start) {
		this.graduate_day_month_start = graduate_day_month_start;
	}
	public String getGraduate_day_start() {
		return graduate_day_start;
	}
	public void setGraduate_day_start(String graduate_day_start) {
		this.graduate_day_start = graduate_day_start;
	}
	public String getGraduate_day_year_end() {
		return graduate_day_year_end;
	}
	public void setGraduate_day_year_end(String graduate_day_year_end) {
		this.graduate_day_year_end = graduate_day_year_end;
	}
	public String getGraduate_day_month_end() {
		return graduate_day_month_end;
	}
	public void setGraduate_day_month_end(String graduate_day_month_end) {
		this.graduate_day_month_end = graduate_day_month_end;
	}
	public String getGraduate_day_end() {
		return graduate_day_end;
	}
	public void setGraduate_day_end(String graduate_day_end) {
		this.graduate_day_end = graduate_day_end;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	
	
}
