package ex.java.day08;

import java.util.Scanner;

public class ReverseNumber {

	public static void main(String[] args) {
		// 100개의 정수를 저장할 수 있는 배열 선언
		// 정수 입력 받음
		// 0 입력 시
		// 0을 제외한 입력된 숫자 거꾸로 출력
		
		Scanner scanner = new Scanner(System.in);
		int[] numArray = new int[100];
		int cnt = 0;
		
		System.out.println("정수를 입력해 주세요. (0 입력 시 멈춤)");
		
		// 숫자 입력 받기, 0 입력 시 멈춰!
		while(true) {
			numArray[cnt] = scanner.nextInt();
			
			if(numArray[cnt] == 0) break;
			
			cnt++;
		}
		
		// 입력 받은 수 0제외하여 거꾸로 출력
		for(int i = cnt-1 ; i > -1 ; i--) {
			System.out.print(numArray[i] + " ");
		}
		

	}

}
