package ex.java.day03;

public class InputParameter1 {

	public static void main(String[] args) {
		// 세 개의 정수를 입력 받아서 합계와 평균을 출력하시오. 단, 평균은 소수 이하를 버리고 정수 부분만 출력한다.
		int a = Integer.parseInt(args[0]);
		int b = Integer.parseInt(args[1]);
		int c = Integer.parseInt(args[2]); 
		
		int sum = a+b+c;
		int avg = sum/3;
		
		System.out.println("sum : " + sum);
		System.out.println("avg : " + avg);
		
	}

}
