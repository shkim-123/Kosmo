package ex.java.day11;

public class Student {
	
	// 모든 멤버필드는 private 해야 한다. (정보 은닉)
	private int studentID;
	private String studentName;  // 접근 제어자 private 선언, 다른 class에서 직접적으로 접근 불가
	private int grade;
	private String address;
	

	// studentName 값을 가져올 수 있는 get() 메서드 선언
	public String getStudentName() {
		return studentName;
	}
	
	// studentName 값을 지정할 수 있는 set() 메서드 선언
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public int getStudentID() {
		return studentID;
	}
	
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	
	public int getGrade() {
		return grade;
	}
	
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	

}
