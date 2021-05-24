package ex.java.day6;

import java.util.Scanner;

public class LastThreeNumber {

	public static void main(String[] args) {
		// 100개의 정수를 입력받을 수 있는 배열 선언
		// 정수 입력 받다가 -1이 입력되면 중단
		// -1을 제외한 마지막 3개의 정수 출력
		// 입력 받은 정수가 3개 미만일 경우 입력 받은 정수 모두 출력
		
		Scanner scanner = new Scanner(System.in);
		int[] num = new int[100];
		int size = -1;
		
		System.out.println("숫자를 입력해 주세요. -1 입력 시 종료됩니다.");
		
		// 숫자 입력 받기, -1 입력 시 종료
		for(int i = 0; i < num.length; i++) {
			num[i] = scanner.nextInt();
			size++;
			if(num[i] == -1) break;
		}
		
		// 3개 이상 입력했는지 확인, 마지막 3개 정수 출력
		if(size > 3) {
			System.out.print(num[size-3] + " " + num[size-2] + " " + num[size-1]);
		} else if(size <= 3 && size != 0) {
			for(int i = 0; i < size; i++) {
				System.out.print(num[i] + " ");
			}
		} else {
			System.out.println("숫자를 입력하지 않았습니다.");
		}
		
		System.out.println();
		System.out.println("종료");
		
	}

}
