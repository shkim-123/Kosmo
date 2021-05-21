package ex.java.array;

import java.util.Scanner;

public class ArrayTest5 {

	public static void main(String[] args) {
		// 과학/수학 성적을 "학생/점수/점수" 순서로 입력
		// 10개 입력
		// 'ㅎ'으로 시작하는 학생의 성적의 과학,수학 성적 합/평균만 출력
		Scanner scanner = new Scanner(System.in);
		int cnt = 0, scienceSum = 0, mathSum = 0;

		String[] temp = new String[10];
		String[][] grade = new String[10][3];
		
		while(cnt < grade.length) {
			// 입력 받기
			System.out.print("성적입력) ");
			String sc = scanner.nextLine();
			
			// / 구분자로 잘라서 배열에 저장
			temp = sc.split("/");
			
			// 다중배열에 값 저장
			for(int i = 0; i < temp.length; i++) {
				grade[cnt][i] = temp[i];
			}
			
			// ㅎ으로 시작하는 학생 성적, matches() 함수, 정규식 사용
			if(grade[cnt][0].matches("[하-힣].*")) {
				System.out.println("dd");
				scienceSum += Integer.parseInt(grade[cnt][1]);
				mathSum += Integer.parseInt(grade[cnt][2]);
			}
			cnt++;
		}
		
		// 출력
		System.out.println("과학 : " + scienceSum + " / " +scienceSum/grade.length);
		System.out.println("수학 : " + mathSum + " / " + mathSum/grade.length);

	}

}
