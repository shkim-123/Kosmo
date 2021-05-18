package ex.java.input;

import java.util.Scanner;

public class InputParameter4 {

	public static void main(String[] args) {
		// 0, - 부호면 "안녕~" 출력 후 프로그램 종료 or 다시 입력 받는다
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("정수1 : ");
		int num1 = scanner.nextInt();
		System.out.println("정수2 : ");
		int num2 = scanner.nextInt();
		System.out.println("정수3 : ");
		int num3 = scanner.nextInt();
		
		if ((num1 <= 0) || (num2 <= 0) || (num3 <= 0)) {
			System.out.println("안녕~~");
		} else {
			System.out.println("합산 : " + (num1 + num2 + num3));
			System.out.println("평균 : " + (num1 + num2 + num3)/3);
		}
	}

}
