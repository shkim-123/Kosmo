package com.naver.erp.dto;

//----------------------------------------------------------------
// DTO 객체의 관용적 명명 규칙
//----------------------------------------------------------------
// BoardDTO / BoardDto : 테이블명 + DTO
// BoardVO  / BoardVo : 테이블명 + VO : Value Object 값을 가진 객체란 뜻
// Board : 테이블명과 일치하는 경우
//----------------------------------------------------------------
public class BoardDTO {

	private int b_no;
	private String subject;
	private String writer;
	private String reg_date;
	private int readcount;
	private String content;
	
	
	private String pic;
	
	
	private String pwd;
	private String email;
	private int group_no;
	private int print_no;
	private int print_level;
	
	private String is_del;
	//----------------------------------------------------------------

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public int getPrint_no() {
		return print_no;
	}

	public void setPrint_no(int print_no) {
		this.print_no = print_no;
	}

	public int getPrint_level() {
		return print_level;
	}

	public void setPrint_level(int print_level) {
		this.print_level = print_level;
	}

	public String getIs_del() {
		return is_del;
	}

	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}
	
	
	
	
}
