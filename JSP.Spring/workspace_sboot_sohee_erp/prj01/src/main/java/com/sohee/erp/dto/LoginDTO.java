package com.sohee.erp.dto;

import java.util.List;

public class LoginDTO {
/*
	login_no		number(3) 	not null
	,login_id		varchar2(20)	not null unique
	,pwd		varchar2(20)	not null
	,primary key(login_no)
 */
	
	private int login_no;			// 회원 번호
	private String login_id;		// 아이디
	private String pwd;				// 비밀번호
	//-------------------------
	public int getLogin_no() {
		return login_no;
	}
	public void setLogin_no(int login_no) {
		this.login_no = login_no;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}
