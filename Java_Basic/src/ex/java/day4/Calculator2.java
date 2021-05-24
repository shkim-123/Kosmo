package ex.java.day4;

public class Calculator2 {

	public static void main(String[] args) {
		// 사칙 연산 수행 프로그램 (연습문제 p.123 / 1번)
		int num1 = 10;
		int num2 = 2;
		char operator = '+';
		int result;
		
		//if-else if문
//		if (operator == '+') {
//			result = num1 + num2;
//		} else if(operator == '-') {
//			result = num1 - num2;
//		} else if(operator == '*') {
//			result = num1 * num2;
//		} else if(operator == '/') {
//			result = num1 / num2;
//		} else {
//			result = 0;
//			System.out.println("재시도");
//		}
		
		
		// switch-case문
		switch(operator) {
			case '+' :
				result = num1 + num2;
				break;
			case '-' :
				result = num1 - num2;
				break;
			case '*' :
				result = num1 * num2;
				break;
			case '/' : 
				result = num1 / num2;
				break;
			default :
				result = 0;
				System.out.println("재시도");
		}
		
		System.out.println(num1 + " " + operator + " " + num2 + " = " + result);

	}

}
