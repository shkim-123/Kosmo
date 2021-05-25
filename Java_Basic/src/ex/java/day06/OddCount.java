package ex.java.day06;

import java.util.Scanner;

public class OddCount {

	public static void main(String[] args) {
		// 자연수 n을 입력 받음
		// 1부터 홀수를 차례대로 더함
		// 합이 n 이상이면
		// 더해진 홀수의 개수와 그 합 출력
		
		Scanner scanner = new Scanner(System.in);

		// 숫자 입력 받기
		System.out.println("숫자를 입력해 주세요. (자연수만 가능)");
		int num = scanner.nextInt();
		int cnt = 0, sum = 0;
		
		// 입력 받은 수보다 클 때까지 홀수만 더하기
		for(int i = 1; sum < num ; i++) {
			if(i % 2 == 1) {
				sum += i;
				cnt++;
			}
		}
		
		System.out.println("입력받은 값 : " + num);
		System.out.println("더해진 홀수의 개수: " + cnt);
		System.out.println("합: " + sum);
	}

}
