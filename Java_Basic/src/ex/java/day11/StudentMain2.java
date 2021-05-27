package ex.java.day11;

public class StudentMain2 {

	public static void main(String[] args) {
		
		Student1 student1 = new Student1();
		Student1 student2 = new Student1();
		
		student1.num += 1;
		
		System.out.println(Student1.num);
		System.out.println(Student1.num);
		
		student2.num += 1;
		System.out.println(student1.num);
		System.out.println(student2.num);
		
		
		Student2 stu2 = new Student2();
		
		// static 메서드 호출
		System.out.println(Student2.getNum());
		
	}

}

class Student1 {
	static int num = 0;
	
}

class Student2 {
	private static int num = 0;
	
	public Student2() {
		num++;
	}
	
	public static int getNum() {
		return num;
	}
	
	public static void setNum(int num) {
		Student2.num = num;
	}
}