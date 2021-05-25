package ex.java.day10;

public class PersonExam {
	
	// 멤버 필드(변수)
	String name;		// 이름
	int age;			// 나이
	String gender;		// 성별
	boolean married;	// 결혼 여부
	int child; 			// 자식 수
	
	public void print() {
		System.out.println("01. 나이 : " + age);
		System.out.println("02. 이름 : " + name);
		System.out.println("03. 결혼 : " + married);
		System.out.println("04. 자녀 : " + child);
	}
	
}