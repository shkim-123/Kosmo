package ex.java.Array;

import java.util.Scanner;

public class MaxNumber {

	public static void main(String[] args) {
		// 정수 배열을 "," 구분자로 입력 받음
		// 가장 큰 수 출력
		
		Scanner scanner = new Scanner(System.in);
		int max = 0;
		
		System.out.println("정수 배열을 입력해 주세요. 구분자 \", \"");
		String sc = scanner.nextLine();
		
		String[] num = sc.split(", ");
		
		
		// 큰 수 찾기
		for(int i = 0; i < num.length; i++) {
			if(max < Integer.parseInt(num[i])) {
				max = Integer.parseInt(num[i]);
			}
		}
		
		System.out.println("가장 큰 수 : " + max);

	}

}
