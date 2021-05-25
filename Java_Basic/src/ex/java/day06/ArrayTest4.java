package ex.java.day06;

import java.util.Scanner;

public class ArrayTest4 {

	public static void main(String[] args) {
		// 과학/수학 성적을 "학생/점수/점수" 순서로 입력
		// 10개 입력
		// 각 과목별 합계와 평균 출력
		
		Scanner scanner = new Scanner(System.in);
		int cnt = 0, scienceSum = 0, mathSum = 0;

		String[] grade = new String[10];
		
		while(cnt < grade.length) {
			// 입력 받기
			System.out.print("성적입력) ");
			String sc = scanner.nextLine();
			
			// / 구분자로 잘라서 배열에 저장
			grade = sc.split("/");
			
			// 과학, 수학 점수 저장
			scienceSum += Integer.parseInt(grade[1]);
			mathSum += Integer.parseInt(grade[2]);
			
			cnt++;
		}
		
		// 출력
		System.out.println("과학 : " + scienceSum + " / " +scienceSum/grade.length);
		System.out.println("수학 : " + mathSum + " / " + mathSum/grade.length);

	}

}
