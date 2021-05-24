package ex.java.day4;

public class Gugudan {

	public static void main(String[] args) {
		//구구단을 짝수 단만 출력 (연습문제 p.123, 2번)
		for(int i = 1; i < 10; i++) {
			
			// 홀수인 경우 for문으로 감
			if((i % 2) == 1) continue; 
			
			for(int j = 1; j < 10; j++) { 
				// 구구단 출력
				System.out.println(i + " * " + j + " = " + (i*j)); 
			}
			
			System.out.println("============");
		}

	}

}
