package ex.java.day06;

import java.util.Scanner;

public class TwoClassSum {

	public static void main(String[] args) {
		// 1반 ~ 6반까지의 평균점수 저장
		// 반 번호 2개 입력받음
		// 입력받은 2개의 반의 평균점수의 합 출력
		// 반별 평균점수 초기값 85.6, 79.5, 83.1, 80.0, 78.2, 75.0
		// 출력은 소수 두 번째 자리에서 반올림하여 소수 첫째자리까지 출력
		
		Scanner scanner = new Scanner(System.in);
		double[] banArray = {85.6, 79.5, 83.1, 80.0, 78.2, 75.0};
		
		System.out.println("1반 ~ 6반 중 반 번호를 2개 입력하세요. (엔터로 구분)");
		int ban1 = scanner.nextInt();
		int ban2 = scanner.nextInt();
		
		// 범위 내 값 입력했는지 확인
		if(ban1 > banArray.length || ban2 > banArray.length || ban1 < 0 || ban2 < 0 ) {
			System.out.println("1 ~ 6까지만 입력가능합니다.");
		}else {
			double sum = banArray[ban1 - 1] + banArray[ban2 - 1];
			System.out.println(ban1 + "반, " + ban2 + "반의 평균점수 합: " + sum);			
		}
		

	}

}
