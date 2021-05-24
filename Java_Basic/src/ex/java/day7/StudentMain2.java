package ex.java.day7;

public class StudentMain2 {

	public static void main(String[] args) {
		// Student 는 과목별 점수에 대해서 Score 클래스로 표현한다.
		// 어떤 학생의 수학/과학 과목의 점수를 처리하도록 해라.
		
		// 학생
		Student2 student = new Student2();
		student.studentName = "홍길동";
		student.grade=3;
//		student.subj = new Score2();
//		student.subj.subject = "수학";
//		student.subj.score = 1000;
		
		System.out.println(student.toString());
		System.out.println(student.subj.toString());
		
		// 스코어
	}

}
