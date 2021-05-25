package ex.java.day08;

import java.util.Scanner;

public class Triangle {
	
	public static void main(String[] args) {
		// 자연수 n 입력받아
		// 삼각형 출력 (숫자로) 
		// 숫자는 공백으로 구분
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("숫자를 입력해 주세요.");
		int num = scanner.nextInt();
		int num2 = num;
		int cnt = 1;
		
		// 입력한 숫자만큼 반복
		while(num > 0) {
			
			// 행 찍기
			for(int i = 0; i < num2; i++) {
				if(i < num-1) {
					System.out.print("  ");
				} else {
					System.out.print(cnt++ + " ");
				}
			}
			
			cnt = 1;
			System.out.println("");
			num--;
			
		}
		
	}
	
}
