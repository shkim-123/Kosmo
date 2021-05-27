package ex.java.day12;

public abstract class Calculator implements Calc {

	// 인터페이스 일부만 구현할 수 있다.
	// 추상 메서드를 전부 구현하지 않아서 추상 클래스가 된다.
	
	@Override
	public int add(int num1, int num2) {
		return num1 + num2;
	}

	@Override
	public int substract(int num1, int num2) {
		// TODO Auto-generated method stub
		return num1 - num2;
	}

}
