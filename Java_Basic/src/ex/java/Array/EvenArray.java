package ex.java.Array;

import java.util.Scanner;

public class EvenArray {

	public static void main(String[] args) {
		// [-12, 3, -9, 5, 8, -2, 0, -8, 3, 10] 정수 배열을 입력 받음
		// while문 이용하여 짝수 번째 요소 합과 평균 출력
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("정수 배열을 입력해 주세요. 구분자 \", \"");
		String sc = scanner.nextLine();
		
		String[] num = sc.split(", ");

		int i = 0, sum = 0, avg = 0, cnt = 0;
		
		while(i < num.length) {
			if(Integer.parseInt(num[i]) % 2 == 0) {
				sum += Integer.parseInt(num[i]);
				cnt++;
			}
			i++;
		}
		
		avg = sum/cnt;
		
		System.out.println("합산 : " + sum);
		System.out.println("평균 : " + avg);
		
	}

}
