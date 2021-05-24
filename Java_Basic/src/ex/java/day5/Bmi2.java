package ex.java.day5;

import java.util.Scanner;

public class Bmi2 {

	public static void main(String[] args) {
		// 키와 몸무게 값을 받아 bmi 계산
		Scanner scanner = new Scanner(System.in);
		String weight, height, obesity;
		int bmi;
		
		while(true) {
			System.out.println("키와 몸무게를 입력하세요. ex: 키 몸무게, q와 -1 입력 시 종료");
			String sc = scanner.nextLine();

			if("q".equals(sc) || "-1".equals(sc)) {
				System.out.println("종료");
				break;
			} else {
				String[] sc2 = sc.split(" ");
				
				weight = sc2[1];
				height = sc2[0];
				
				bmi = Integer.parseInt(weight) + 100 - Integer.parseInt(height);
				obesity = bmi > 0 ? "비만" : "비만아님" ;
				
				System.out.println("BMI : " + bmi + ",  " + obesity);
			}	
		}
			
	}

}
