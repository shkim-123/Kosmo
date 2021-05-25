package ex.java.day04;

public class Pyramids {

	public static void main(String[] args) {
		// 반복문 사용하여 피라미드 출력 (연습문제 p.123 / 4번)
		for(int i = 0; i < 4; i++) {
			int j = 0;
			
			for(; j < 3-i; j++) {
				System.out.print(" ");
			}
			
			for(; j < 4+i; j++) {
				System.out.print("*");
			}

			System.out.println("");
		}

	}

}
