package ex.java.day04;

public class Gugudan2 {

	public static void main(String[] args) {
		//구구단을 단보다 곱하는 수가 작거나 같은 경우까지만 출력 (연습문제 p.123 / 3번)
		for(int i = 1; i < 10; i++) {
			
			// j는 i보다 작거나 같은 경우까지만 출력
//			for(int j = 1; j <= i; j++) {
//				System.out.println(i + " * " + j + " = " + (i*j)); 
//			}
//			
//			System.out.println("============");
			
			// break문 사용한 경우
			for(int j = 1; j < 10; j++) {
				// i보다 j가 클 경우 for문 빠져나감
				if(i < j) break;

				System.out.println(i + " * " + j + " = " + (i*j)); 				
			}
			
			System.out.println("============");
		}

	}

}
