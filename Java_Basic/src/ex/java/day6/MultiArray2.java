package ex.java.day6;

import java.util.Scanner;

public class MultiArray2 {

	public static void main(String[] args) {
		// 자연수 n을 입력받아
		// n x n 크기에 공백으로 구분하여 출력
		// 10 미만의 홀수만 출력
		
		Scanner scanner = new Scanner(System.in);
		
		// 숫자 입력 받기
		System.out.println("숫자를 입력하세요.");
		int num = scanner.nextInt();
		
		// 입력받은 숫자 크기만큼 2차원 배열 생성
		int[][] numArray = new int[num][num];
		int cnt = 1;
		
		// 숫자 넣기
		for(int i = 0; i < numArray.length; i++) {

			for(int j = 0; j < numArray[i].length; j++) {
				
				// cnt 10 초과 시 1로 초기화
				if(cnt > 10) {
					cnt = 1;
				}
				
				//배열에 값 할당 후 cnt +2
				numArray[i][j] = cnt;
				cnt += 2;
				
				System.out.print(numArray[i][j] + " ");
			}
			
			System.out.println();
		}
		

	}

}
