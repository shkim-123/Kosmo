package ex.java.day08;

import java.util.Scanner;

public class StudentScoreMain {

	public static void main(String[] args) {
		final int stuCnt = 10; //입력 받을 값
		
		Student[] student = new Student[stuCnt];
		
		// 배열에 객체 생성
		for(int i = 0; i < student.length; i++) {
			student[i] = new Student();
			student[i].subj = new Score[3];
			
			// subj 배열에 Score() 객체 생성
			for(int j = 0; j <student[i].subj.length; j++) {
				student[i].subj[j] = new Score();
			}
		}
		
		Scanner scanner = new Scanner(System.in);
		String temp = "";
		String[][] temp2 = new String[student.length][];
		int cnt = 0;
		int mathSum = 0, scienceSum = 0, englishSum = 0;
		
		System.out.println("이름/학년/주소/수학점수/과학점수/영어점수를 입력해 주세요. (/sum 입력 시 합계/평균 출력)");
		
		// 이름/학년/주소/수학/과학/영어 점수 받은 후 대입
		while(cnt <= student.length) {
			temp = scanner.nextLine();
			
			// /sum 입력 시 배열의 수학, 과학, 영어의 합계를 계산하고, 출력
			if(cnt == student.length || "/sum".equals(temp)){
				// sum 계산
				for(int i = 0; i < student.length; i++) {
					mathSum += student[i].subj[0].score;
					scienceSum += student[i].subj[1].score;
					englishSum += student[i].subj[2].score;
				}
				
				//출력
				System.out.println("수학 : " + mathSum + " / " + mathSum/cnt);
				System.out.println("과학 : " + scienceSum + " / " + scienceSum/cnt);
				System.out.println("영어 : " + englishSum + " / " + englishSum/cnt);
				
				break; // while 문 종료
				
			} else {
				temp2[cnt] = temp.split("/");

				System.out.println((cnt + 1) + "/" + student.length);
				
				// student 객체에 값 대입 
				student[cnt].studentName = temp2[cnt][0];
				student[cnt].grade = Integer.parseInt(temp2[cnt][1]);
				student[cnt].address = temp2[cnt][2];
				student[cnt].subj[0].score = Integer.parseInt(temp2[cnt][3]);
				student[cnt].subj[0].subject = "수학";
				student[cnt].subj[1].score = Integer.parseInt(temp2[cnt][4]);
				student[cnt].subj[1].subject = "과학";
				student[cnt].subj[2].score = Integer.parseInt(temp2[cnt][5]);
				student[cnt].subj[2].subject = "영어";				
			}
			
			cnt++;
			
			// 마지막으로 입력하는 경우 /sum 입력 안내 msg 출력
			if(cnt == student.length) {
				System.out.println("/sum을 입력해주세요.");
			}

		}

	}

}
