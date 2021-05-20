package ex.java.array;

import java.util.Scanner;

public class LocationArray {

	public static void main(String[] args) {
		// 6개의 문자배열을 만들고 {'P', 'R', 'O', 'G', 'R', 'A', 'M', 'M', 'I', 'N', 'G'} 초기화
		// 문자 한 개를 입력받아 배열에서의 위치 출력
		// 첫 번쨰 위치는 0번
		// 배열에 없는 문자 입력 시 "none" 메시지 출력 후 종료
		
		Scanner scanner = new Scanner(System.in);
		char[] exArray = {'P', 'R', 'O', 'G', 'R', 'A', 'M', 'M', 'I', 'N', 'G'};
		
		char target = scanner.next().charAt(0);
		boolean find = false;
		
		System.out.println("문자 한 개를 입력해 주세요.");
		
		for(int i = 0; i < exArray.length; i++) {
			if(target == exArray[i]) {
				System.out.println(i + "번째 위치");
				find = true;
			} 
		}
		
		if(!find) {
			System.out.println("none");
		}

	}

}
