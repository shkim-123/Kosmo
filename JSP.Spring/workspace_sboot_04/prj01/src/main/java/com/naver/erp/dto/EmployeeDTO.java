package com.naver.erp.dto;

//----------------------------------------------------------------
// DTO 객체의 관용적 명명 규칙
//----------------------------------------------------------------
// BoardDTO / BoardDto : 테이블명 + DTO
// BoardVO  / BoardVo : 테이블명 + VO : Value Object 값을 가진 객체란 뜻
// Board : 테이블명과 일치하는 경우
//----------------------------------------------------------------
public class EmployeeDTO {

	private int emp_no;
	private String emp_name;
	private int dep_no;
	private String jikup;
	private int salary;
	private String hire_date;
	private String jumin_num;
	private String phone;
	private int mgr_emp_no;
	private String dep_name;
	private String mgr_emp_name;
	
	
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getDep_no() {
		return dep_no;
	}
	public void setDep_no(int dep_no) {
		this.dep_no = dep_no;
	}
	public String getJikup() {
		return jikup;
	}
	public void setJikup(String jikup) {
		this.jikup = jikup;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getHire_date() {
		return hire_date;
	}
	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}
	public String getJumin_num() {
		return jumin_num;
	}
	public void setJumin_num(String jumin_num) {
		this.jumin_num = jumin_num;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getMgr_emp_no() {
		return mgr_emp_no;
	}
	public void setMgr_emp_no(int mgr_emp_no) {
		this.mgr_emp_no = mgr_emp_no;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	public String getMgr_emp_name() {
		return mgr_emp_name;
	}
	public void setMgr_emp_name(String mgr_emp_name) {
		this.mgr_emp_name = mgr_emp_name;
	}
	
	
	
	
}
