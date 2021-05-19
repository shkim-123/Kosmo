package ex.java.loop;

public class Pyramids2 {

	public static void main(String[] args) {
		// 반복문, 조건문 사용하여 마름모 찍기 (연습문제 p.123 / 5번)
		for(int i = 0; i < 7; i++) {

			for(int j = 0; j < 7; j++) {
				
				if(j < 3-i || j < i-3) {
					System.out.print(" ");
				} else if(i < 4 && j < i+4) {
					System.out.print("*");
				} else if(i >= 4 && j < 10-i) {
					System.out.print("*");
				}
				
			}

			System.out.println("");
		}
	}

}
