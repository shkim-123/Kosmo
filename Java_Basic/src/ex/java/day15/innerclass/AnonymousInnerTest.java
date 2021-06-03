package ex.java.day15.innerclass;

class Outer2 {
	Runnable getRunnable(int i) {
		int num = 100;

		// 익명 내부 클래스, Runnable 인터페이스 생성
		// return new Runnable();
		return new Runnable() {
			@Override
			public void run() {
				System.out.println(i);
				System.out.println(num);
			}
		}; // 클래스 끝에 ; 붙임
	}

	// 익명 내부 클래스 변수 대입
	// Runnable runner = new Runnable();
	Runnable runner = new Runnable() {
		@Override
		public void run() {
			System.out.println("Runnable이 구현된 익명 클래스 변수");
		}
	};
}

public class AnonymousInnerTest {

	public static void main(String[] args) {

		Outer2 out = new Outer2();
		Runnable runnerble = out.getRunnable(10);
		runnerble.run();
		out.runner.run();

	}

}
