package ex.java.day15.innerclass;

class Outer {
	int outNum = 100;
	static int sNum = 200;
	
	Runnable getRunnable(int i) {
		int num = 100;  // 지역 변수
		
		// 지역 내부 클래스
		class MyRunnable implements Runnable {
			int localNum = 10;	// 지역 내부 클래스의 인스턴스 변수 
			
			@Override
			public void run() {
				System.out.println("i = " + i);
				System.out.println("num = " + num);
				System.out.println("localNum = " + localNum);
				System.out.println("outNum = " + outNum + "(외부 클래스 인스턴스 변수)");
				System.out.println("Ouber.sNum = " + Outer.sNum + "(외부 클래스 정적 변수)");
			}
		} // 내부 클래스 끝
		
		return new MyRunnable();  // new inner class 반환
	}
}

public class LocalInnerTest {
	
	public static void main(String[] args) {
		Outer out = new Outer();
		// 내부 클래스 객체를 상위 클래스로 업캐스팅 하여 대입
		Runnable runner = out.getRunnable(10);	// 메서드 호출
		runner.run();
	}

}
