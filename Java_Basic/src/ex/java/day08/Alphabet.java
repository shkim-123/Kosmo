package ex.java.day08;

import java.util.Scanner;

public class Alphabet {

	public static void main(String[] args) {
		// 자연수 n(3 <= n <= 10)을 입력받아
		// 영문자 출력
		
		Scanner scanner = new Scanner(System.in);
		
		
		// 숫자 입력 받기
		System.out.println("3이상 10이하의 숫자를 입력해 주세요.");
		int num = scanner.nextInt();
		
		char[] alphabetArray = new char[100];
		int i = 0, cnt = 0;
		
		// 알파벳 배열에 담기
		for(char b = 'A'; b <= 'Z'; b++) {
			alphabetArray[i] = b;
			i++;
		}
		
		// 입력한 숫자까지 반복
		while(num > 0) {
			// 알파벳 출력
			for(int j = 0; j < num; j++) {
				System.out.print(alphabetArray[cnt]);
				cnt++;
				
				if(cnt == i) {
					cnt = 0;
				}
			}
			System.out.println();
			num--;
		}
		
	}

}
