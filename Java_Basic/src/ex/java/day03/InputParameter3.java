package ex.java.day03;

public class InputParameter3 {

	public static void main(String[] args) {
		// 두 정수를 입력받아서 나눈 몫과 나머지를 다음과 같은 형식으로 출력하는 프로그램 작성
		int a = Integer.parseInt(args[0]);
		int b = Integer.parseInt(args[1]);
		
		System.out.println(a + " / " + b + " = " + a/b + "..." + a%b);

	}

}
