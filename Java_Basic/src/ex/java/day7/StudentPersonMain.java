package ex.java.day7;

import java.util.Arrays;

public class StudentPersonMain {

	public static void main(String[] args) {
		
		String student2;
		student2 = new String("홍길동/구로구/2");
		
		String[] data = student2.split("/");
		System.out.println(data[0]);  //이름
		// student2 = "이순신/광양/2";
		
		data[0] = "이순신";
				
		// 클래스는 객체화 해서 사용 : instantiation
		Student student;
		student = new Student();
		student.address = "구로구";
		student.studentName = "홍길동";
		student.grade = 2;
		
		System.out.println(student.studentName);
		System.out.println(student.address);
		System.out.println(student.grade);
		
		student.studentName = "이순신";
		
		System.out.println(student.studentName);
		System.out.println(student.address);
		System.out.println(student.grade);

		Person person;
		person = new Person();
		
		String msg;
		msg = new String("홍길동/100/200");
		
		
	}

}
