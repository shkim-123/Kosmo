package ex.java.input;

public class InputParameter2 {

	public static void main(String[] args) {
		// 정수 2개를 입력받아서 첫 번째 수에는 100을 증가시켜 저장하고, 두 번째 수는 10으로 나눈 나머지를 저장한 후 두 수를 차례로 출력하는 프로그램 작성
		
		int a = Integer.parseInt(args[0])+100;
		int b = Integer.parseInt(args[1])%10;
		System.out.print(a + " " + b);

	}

}
