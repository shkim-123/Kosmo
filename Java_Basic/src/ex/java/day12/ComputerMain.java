package ex.java.day12;

public class ComputerMain {

	public static void main(String[] args) {
		
		// 추상 클래스는 객체 생성 ㅂ루가
		// Computer c1 = new Computer();
		Computer c2 = new DeskTop();
		
		c2.display();
		c2.typing();
		
		c2.print();

	}

}
