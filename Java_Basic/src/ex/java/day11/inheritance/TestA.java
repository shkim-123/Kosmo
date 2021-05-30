package ex.java.day11.inheritance;

public class TestA {

	int num;
	
	void aaa() {
		System.out.println("aaa() 출력");
	}
	
	public static void main(String[] args) {
		TestA a1 = new TestA();
		TestA a2 = new TestA();
		a1.aaa();
		a2.aaa();
	}

}
