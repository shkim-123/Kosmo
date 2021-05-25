package ex.java.day05;

import java.util.Scanner;

public class Calculator3 {

	public static void main(String[] args) {
		//사칙연산 scanner 입력으로 구현, 1+1 입력받아 결과 출력
		
		Scanner scanner = new Scanner(System.in);
		int num1, num2, result = 0;
		String op ="";
		
		System.out.println("식을 입력하세요. ex:1+1");
		String sc1 = scanner.nextLine();
		
		String[] sc2 = sc1.split("");
		result = 0;
		
		num1 = Integer.valueOf(sc2[0]);
		op = sc2[1];
		num2 = Integer.valueOf(sc2[2]);
		
		if("+".equals(op)) {
			result = num1 + num2;
		} else if("-".equals(op)) {
			result = num1 - num2;
		} else if("*".equals(op)) {
			result = num1 * num2;
		} else if("/".equals(op)) {
			result = num1 / num2;
		} else {
			System.out.println("연산자는 +, -, *, / 중 입력해 주세요.");
		}
		
		System.out.print("결과: " + result);
		

	}

}
