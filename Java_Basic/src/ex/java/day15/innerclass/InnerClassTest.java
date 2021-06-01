package ex.java.day15.innerclass;

import ex.java.day15.innerclass.MyClass.MyInnerClass;

public class InnerClassTest {

	public static void main(String[] args) {

		MyClass obj = new MyClass();
		
		// 내부 클래스 별도 객체화 (권장하지 않는 사용 방법)
		MyInnerClass innerObj = obj.new MyInnerClass();
		
	}

}
