package ex.java.day12;


// 추상클래스 (new 연산자 처리 불가)
public abstract class Computer {
	
	// 하나 이상의 추상 메서드가 선언되어야 함
	public abstract void display();
	public abstract void typing();
	
	// 일반 메서드 선언 가능
	public void print() {
		System.out.println(" ");
	}
}
