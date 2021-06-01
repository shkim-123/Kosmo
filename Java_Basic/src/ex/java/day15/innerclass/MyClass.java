package ex.java.day15.innerclass;

public class MyClass {
	
	// 내부 클래스
	class MyInnerClass {
		// 멤버 속성
		int age;
		String name;
		
		// static 변수 선언 불가
		// static int num;
		
		// static final은 선언 가능
		static final int MAX = 999;
	}
	
	public void test() {
		MyInnerClass in = new MyInnerClass();
	}
	
}
