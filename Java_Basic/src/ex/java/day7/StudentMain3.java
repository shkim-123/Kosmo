package ex.java.day7;

public class StudentMain3 {

	public static void main(String[] args) {
		// Student2, Score2 이용
		// -- subj -> 배역
		
		// 홍길동/구로구/3, 수학 100, 국어 90
		// 고길동/영등포구/3, 수학 70, 국어 80
		
		Student2[] student = new Student2[2];
		student[0] = new Student2();
		student[1] = new Student2();

		
		// 학생 1
		student[0].studentName = "홍길동";
		student[0].address = "구로구";
		student[0].grade = 3;
		
		student[0].subj = new Score2[2];
		student[0].subj[0] = new Score2();
		student[0].subj[0].subject = "수학";
		student[0].subj[0].score = 100;
		student[0].subj[1] = new Score2();
		student[0].subj[1].subject = "국어";
		student[0].subj[1].score = 90;
		
		// 학생 2
		student[1].studentName = "고길동";
		student[1].address = "영등포구";
		student[1].grade = 3;
		
		student[1].subj = new Score2[2];
		student[1].subj[0] = new Score2();
		student[1].subj[0].subject = "수학";
		student[1].subj[0].score = 70;
		student[1].subj[1] = new Score2();
		student[1].subj[1].subject = "국어";
		student[1].subj[1].score = 80;
		
		// for문
		for(int i = 0; i < student.length; i++) {
			Student2 s = student[i];
			System.out.println(s.studentName);
		}
		
		// 향상된 for문
		for(Student2 s: student) {
			System.out.println(s.studentName);
		}
	}

}
