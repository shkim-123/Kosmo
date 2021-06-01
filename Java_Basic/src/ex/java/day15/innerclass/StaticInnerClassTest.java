package ex.java.day15.innerclass;

public class StaticInnerClassTest {

	// static inner class
	static class MyInnerClass {
		
	}
	
	
	public static void main(String[] args) {
		
		// 정적 내부 클래스는 외부 클래스 객체를 생성하지 않아도 객체 생성 가능
		MyInnerClass innerOjb = new StaticInnerClassTest.MyInnerClass();

	}

}
