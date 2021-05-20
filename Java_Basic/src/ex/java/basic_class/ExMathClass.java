package ex.java.basic_class;

import java.util.Scanner;

public class ExMathClass {
	
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("숫자 입력하세요.");
		int num = scanner.nextInt();
		double result = 0;
		
		for(int i=1; i<=num; i++) {
			result += Math.pow(2*i, 2*i-1);
		}
		
		System.out.println(result);
	}
	
}
