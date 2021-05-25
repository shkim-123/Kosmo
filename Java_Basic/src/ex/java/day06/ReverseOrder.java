package ex.java.day06;

import java.util.Scanner;

public class ReverseOrder {

	public static void main(String[] args) {
		// 10개의 문자를 입력 받음
		// 마지막으로 입력 받은 문자부터 첫 번째 입력 받은 문자까지 차례로 출력
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("10개의 문자를 입력해 주세요. (띄어쓰기로 구분)");
		String sc = scanner.nextLine();
		
		String[] num = sc.split(" ");
		
		for(int i = (num.length - 1); i > -1; i--) {
			System.out.print(num[i] + " ");
		}
	}

}
