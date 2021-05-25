package ex.java.day10;

public class MethodTestMain {

	public static void main(String[] args) {
		
		MethodClass m = new MethodClass();
		
		MethodClass m1;
		m1 = new MethodClass();
		
		m.name = "홀길동";
		
		int r = m.add(10, 100);
		
		m.add(10, 100);
		
		m.printTenTotal();
		
		m.getTenTotal();
		
		m.printGreeting("haha");
		
		m.divide(20, 200);

	}

}
