package ex.java.day4;

import java.util.Scanner;

public class Bmi {

	public static void main(String[] args) {
		// Scanner로 각각 입력 받음 (q, -1 입력 시 종료)
		// if-else, 삼항 연산자 각각 이용
		// 비만공식 = 몸무게 + 100 - 키
		// 키, 몸무게 자연수로 입력 받음, 비만수치 0 보다 크면 "비만수치 비만" 출력
		// 출력 후 다시 입력 시작
		Scanner scanner = new Scanner(System.in);
		String weight, height, obesity;
		int bmi;
		
		while(true) {
			System.out.println("q 또는 -1 입력 시 종료됩니다.");
			System.out.print("키를 입력해주세요 : ");
			height = scanner.nextLine();
			if(height.equals("q") || height.equals("-1")) break;

			System.out.print("몸무게를 입력해주세요 : ");
			weight = scanner.nextLine();
			if(weight.equals("q") || weight.equals("-1")) break;
			
			bmi = Integer.parseInt(weight) + 100 - Integer.parseInt(height);
			obesity = bmi > 0 ? "비만" : "비만아님" ;
			
			System.out.println("BMI : " + bmi + ",  " + obesity);
		}
		
		System.out.println("끝~~");

	}

}
