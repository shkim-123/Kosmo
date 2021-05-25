package ex.java.day08;

import java.util.Scanner;

public class Tens {

	public static void main(String[] args) {
		// 100미만의 양의 정수 입력
		// 0이 입력되면
		// 0을 제외한 입력된 정수의 십의 자리 숫자가 각각 몇 개인지
		// 작은 수부터 출력, 0개인 숫자는 출력하지 않음
		
		Scanner scanner = new Scanner(System.in);
		
		int num;
		int numArray[] = new int[10];
		System.out.println("100 미만의 숫자를 입력해 주세요.");

		// 숫자 입력 받기
		while(true) {
			num = scanner.nextInt();
			
			// 0 입력 시 중단
			if(num == 0) break;
			
			numArray[num/10] += 1; 
			
		}
		
		// 출력
		for(int i = 0; i < numArray.length; i++) {
			// 0개인 경우 출력 안함
			if(numArray[i] == 0) continue;
			
			System.out.println(i + ":" + numArray[i]);
			
		}
	}

}
