package ex.java.day11;

public class StudentMain2 {

	public static void main(String[] args) {
		
		Student3 student1 = new Student3();
		Student3 student2 = new Student3();
		
		student1.num += 1;
		
		System.out.println(student1.num);
		System.out.println(student2.num);
		
		student2.num += 1;
		System.out.println(student1.num);
		System.out.println(student2.num);
		

	}

}

class Student3 {
	static int num = 0;
	
}