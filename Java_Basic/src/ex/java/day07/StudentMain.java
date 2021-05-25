package ex.java.day07;

public class StudentMain {

	public static void main(String[] args) {
		// 다수의 학생정보를 관리 - 5명
		String[] sss = new String[5];
		sss[0] = "//";
		sss[2] = "고릴라/100/1000";
		sss[3] = new String("하진우/100/100");
		
		Student[] students = new Student[5];
		students[0] = new Student();
		students[1] = new Student();
		students[2] = new Student();
		students[3] = new Student();
		students[4] = new Student();
		
		students[0].studentName = "홍길동";
		students[0].grade = 3;
		
		students[1].studentName = "이순신";
		students[1].grade = 2;
		
		for(int i = 0; i < 5; i++) {
			System.out.println(students[i]);
			System.out.println(students[i].studentName);
		}
		
	}

}
