package ex.java.day9;

import java.util.Scanner;

public class MoresCode {

	public static void main(String[] args) {
		// 영문자를 입력받아
		// 모르스 부호를 출력하시오.
		Scanner scanner = new Scanner(System.in);
		String[] mores = {".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", 
						".---", "-.-.", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-",
						"..-", "...-", ".--", "-..-", "-.--", "--.."};
		
		// 영문자 입력 받기
		System.out.println("영문자를 입력해 주세요.");		
		String[] scArray = scanner.nextLine().split("");
		
		for(int i = 0; i< scArray.length; i++) {
			
			// 대문자인 경우
			if(scArray[i].charAt(0) >= 65 && scArray[i].charAt(0) <= 90) {
				System.out.print(mores[scArray[i].charAt(0) - 65]+ " ");
				
			} else if(scArray[i].charAt(0) >= 97 && scArray[i].charAt(0) <= 122){   // 소문자인 경우
				System.out.print(mores[scArray[i].charAt(0) - 97]+ " ");
			} else { 
				System.out.print(" ");
			}
			
		}
		
	}

}
