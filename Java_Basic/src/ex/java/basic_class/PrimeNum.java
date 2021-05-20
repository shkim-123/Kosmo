package ex.java.basic_class;

import java.util.Scanner;

public class PrimeNum {

	public static void main(String[] args) {
		// 숫자 n값 입력 받아 1부터 n까지 소수 구하는 프로그램 작성
		// 1에서 n까지 소수 출력
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("숫자를 입력하세요.");
		int num = scanner.nextInt();
//		int cnt;
//		
//		for(int i = 1; i <= num; i++) {
//			cnt = 0;
//			for(int j = 1; j <= num; j++) {
//				if(i%j == 0 ) {
//					cnt++;
//				}
//			}
//			if (i == 1 || cnt == 2) {
//				System.out.print(i + " ");
//			}			
//		}
		
		// simple
		int i = 2; // i는 나눌 대상
		boolean isPrime = true;
		
		while(i <= num) {
			isPrime = true;
			
			for(int n = 2; n < i; n++) {
				if(i % n == 0) {
					isPrime = false;
				}
				continue;
			}
			if(isPrime == true) {
				System.out.println(i);
			}
			i++;
		}
		System.out.println("");
	}

}
