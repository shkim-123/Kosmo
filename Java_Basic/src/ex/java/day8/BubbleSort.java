package ex.java.day8;

import java.util.Scanner;

public class BubbleSort {

	public static void main(String[] args) {
		// 10개의 정수를 입력받아 배열에 저장한 후
		// 내림차순으로 정렬하여 출력
		
		Scanner scanner = new Scanner(System.in);
		final int COUNT = 3;
		int cnt = 0, temp;
		int[] bubbleArray = new int[COUNT];
		
		System.out.println(COUNT + "개의 숫자를 입력해 주세요.");
		
		// 정수 입력 받기
		while(cnt < COUNT) {
			bubbleArray[cnt] = scanner.nextInt();
			
			cnt++;
		}
		
		cnt = 0;
		
		// 내림차순
		while(cnt < 10) {
			
			// 버블정렬
			for(int i = 1; i < bubbleArray.length - cnt; i++) {
				// 뒤에 숫자가 더 작은 경우 교환
				if(bubbleArray[i-1] < bubbleArray[i]) {
					temp = bubbleArray[i-1];
					bubbleArray[i-1] = bubbleArray[i];
					bubbleArray[i] = temp;
				}
			}
			
			cnt++;
		}
		
		// 출력
		for(int i : bubbleArray) {
			System.out.print(i + " ");
		}

	}

}
