package ex.java.day04;

public class Grades {

	public static void main(String[] args) {
		//성적에 따라 학점 부여 (p.100)
		int score = 89;
		char grade;
		
		if(score >= 90) {
			grade = 'A';
		} else if(score >= 80) {
			grade = 'B';
		} else if(score >= 70) {
			grade = 'C';
		} else if(score >= 60) {
			grade = 'D';
		} else {
			grade = 'F';
		}
		
		System.out.println(score + ", " + grade);
	}

}
