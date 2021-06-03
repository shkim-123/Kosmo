package ex.java.day15.innerclass;

class OutClass1 {
	private int num = 10;
	private static int sNum = 20;
	
	private InClass inClass;
	
	public OutClass1() {
		inClass = new InClass();
	}
	
	class InClass {
		int inNum = 10;
		//static int sInNum = 200;
		
		void inTest() {
			System.out.println("OutClass num = " + num + "(외부 클래스 인스턴스 변수)" );
			System.out.println("OutClass sNum = " + sNum + "(외부 클래스 정적 변수)" );
		}
		
		//static void sTest() {
		//}
		
	}
	
	public void usingClass() {
		inClass.inTest();
	}
}

public class InnerTest {

	public static void main(String[] args) {
		OutClass1 outClass = new OutClass1();
		System.out.println("외부 클래스 이용하여 내부 클래스 기능 호출");
		outClass.usingClass();
	}

}
