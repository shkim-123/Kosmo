package com.sohee.erp.dto;

import java.util.List;

public class StaffSkillDTO {
/*
    staff_skill_no  number(3)
    ,staff_no       number(3)       not null
    ,skill_code     number(3)       not null
    ,primary key(staff_skill_no)
    ,foreign key(staff_no) references staff(staff_no)
    ,foreign key(skill_code) references code_skill(skill_code)
 */
	
	private int staff_skill_no;		// 사원 스킬 번호
	private int staff_no;			// 사원 번호
	private int skill_code;			// 스킬 번호
	//-------------------------
	public int getStaff_skill_no() {
		return staff_skill_no;
	}
	public void setStaff_skill_no(int staff_skill_no) {
		this.staff_skill_no = staff_skill_no;
	}
	public int getStaff_no() {
		return staff_no;
	}
	public void setStaff_no(int staff_no) {
		this.staff_no = staff_no;
	}
	public int getSkill_code() {
		return skill_code;
	}
	public void setSkill_code(int skill_code) {
		this.skill_code = skill_code;
	}

}
