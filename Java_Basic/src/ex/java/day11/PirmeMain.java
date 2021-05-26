package ex.java.day11;

import java.util.Scanner;

public class PirmeMain {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("숫자를 입력해 주세요.");
		int num = sc.nextInt();
		
		// 클래스 생성
		Prime prime = new Prime(num);
		prime.primeNumber();
		prime.print();
		
	}

}
