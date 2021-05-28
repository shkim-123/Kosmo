package ex.java.day13;

public class Student {
	
	int studentId;
	String studentName;
	
	public Student(int sId, String sName) {
		this.studentId = sId;
		this.studentName = sName;
	}
	
	public String toString() {
		return studentId + ", " + studentName;
	}
	
	// equalse() 메서드 재정의
	@Override
	public boolean equals(Object obj) {
		
		if(obj instanceof Student) {
			Student std = (Student)obj;
			// 학번이 같으면 true
			if(this.studentId == std.studentId) {
				return true;
			} else {
				return false;
			}
		}
		
		
		return false;
	}
	
	// hashCode() 재정의
	@Override
	public int hashCode() {
		return studentId;
	}
	

}
