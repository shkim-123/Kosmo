package ex.java.day6;

import java.util.Scanner;

public class Sandglass {

	public static void main(String[] args) {
		// 자연수 n을 입력받아
		// 모래시계 모양으로 별 찍기
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("숫자를 입력해주세요.");
		int num = scanner.nextInt() - 1;
		
		// 행
		for(int i = 0; i < (2*num+1); i++) {
			
			if(i <= num) {
				// 열 (공백 찍기)
				for(int j = 0; j < i ; j++) {
					System.out.print(" ");
				}
				
				// 열 (별 찍기)
				for(int k = 0; k <= ((2*num)-(2*i)); k++) {
					System.out.print("*");
				}
				
			} else {
				// 열 (공백 찍기)
				for(int j = 0; j < (2*num-i); j++) {
					System.out.print(" ");
				}
				
				// 열 (별 찍기)
				for(int k = 0; k <= ((2*i)-(2*num)); k++) {
					System.out.print("*");
				}
				
			}
				
			System.out.println();
			
		}
		
		
	}

}
