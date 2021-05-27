package ex.java.day12;

public class ComputerMain {

	public static void main(String[] args) {
		
		// 추상 클래스는 new 오류
		// Computer c1 = new Computer();
		Computer c2 = new DeskTop();
		
		c2.display();
		c2.typing();

	}

}
