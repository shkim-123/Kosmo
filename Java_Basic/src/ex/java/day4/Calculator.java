package ex.java.day4;

import java.util.Scanner;

public class Calculator {

	public static void main(String[] args) {
		// 사칙연산을 Scanner 입력으로 구현
		// 피연산자 => 연산자 => 피연산자 순서로 입력받아 결과 출력
		Scanner scanner = new Scanner(System.in);
		int num1, num2, result = 0;;
		char op;
		
		System.out.println("계산식을 차례로 입력하세요. (피연산자 -> 연산자 -> 피연산자)");
		
		System.out.print("피연산자: ");
		num1 = scanner.nextInt();
		
		System.out.print("연산자: ");
		op = scanner.next().charAt(0); // char형으로 받음
		
		System.out.print("피연산자: ");
		num2 = scanner.nextInt();
		
		if(op == '+') {
			result = num1 + num2;
		} else if(op == '-') {
			result = num1 - num2;
		} else if(op == '*') {
			result = num1 * num2;
		} else if(op == '/') {
			result = num1 / num2;
		} else {
			System.out.println("연산자는 +, -, *, / 중 입력해 주세요.");
		}
		
		System.out.print("결과: " + result);

	}

}
