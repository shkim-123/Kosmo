package com.sohee.erp.dto;

import java.util.List;

public class StaffDTO {
/*
    staff_no        number(3)
    ,staff_name     varchar2(20)    not null
    ,jumin_num      char(14)        not null unique
    ,school_code    number(3)       not null
    ,religion_code  number(3)       not null
    ,graduate_day   char(10)        not null
    ,foreign key(religion_code) references code_religion(religion_code)
    ,foreign key(school_code) references code_school(school_code)
    ,primary key(staff_no)
 */
	
	private int staff_no;				// 사원번호
	private String staff_name;			// 이름
	private String jumin_num;			// 주민번호
	private String gender;				// 성별
	private int school_code;			// 학력 코드
	private String school_name;			// 학력 이름
	private int religion_code;			// 종교 코드 
	private String religion_name;		// 종교 이름
	private String graduate_day;		// 졸업일
	private List<Integer> skill_code;	// 스킬 코드
	private String skill_name;			// 스킬 이름
	//-------------------------
	public int getStaff_no() {
		return staff_no;
	}
	public void setStaff_no(int staff_no) {
		this.staff_no = staff_no;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getJumin_num() {
		return jumin_num;
	}
	public void setJumin_num(String jumin_num) {
		this.jumin_num = jumin_num;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getSchool_code() {
		return school_code;
	}
	public void setSchool_code(int school_code) {
		this.school_code = school_code;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public int getReligion_code() {
		return religion_code;
	}
	public void setReligion_code(int religion_code) {
		this.religion_code = religion_code;
	}
	public String getReligion_name() {
		return religion_name;
	}
	public void setReligion_name(String religion_name) {
		this.religion_name = religion_name;
	}
	public String getGraduate_day() {
		return graduate_day;
	}
	public void setGraduate_day(String graduate_day) {
		this.graduate_day = graduate_day;
	}
	public List<Integer> getSkill_code() {
		return skill_code;
	}
	public void setSkill_code(List<Integer> skill_code) {
		this.skill_code = skill_code;
	}
	public String getSkill_name() {
		return skill_name;
	}
	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}
	
	
}
