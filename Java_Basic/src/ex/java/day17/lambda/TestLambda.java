package ex.java.day17.lambda;

interface PrintString {
	void showString(String str);
}

public class TestLambda {

	public static void main(String[] args) {
		
		// 람다식을 인터페이스형 변수에 대입
		PrintString lambdaStr = s -> System.out.println(s);
		
		// 변수를 사용해 람다식 구현부 호출
		lambdaStr.showString("hello lambda_1");
		
		// 메서드의 매개변수로 람다식을 대입한 변수 전달
		showMyString(lambdaStr);
		
		// 변수로 반환받기
		PrintString reStr = returnString();
		// 메서드 호출
		reStr.showString("hello ");
	}
	
	// 매개변수를 인터페이스형으로 받음
	public static void showMyString(PrintString p) {
		p.showString("hello lambda_2");
	}
	
	// 람다식을 반환하는 메서드
	public static PrintString returnString() {
		return s -> System.out.println(s + "world");
	}

}
