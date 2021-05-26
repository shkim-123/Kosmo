package ex.java.day11.P;

public class BusMain {

	public static void main(String[] args) {
		// Bus 필드 name, number 사용
		
		Bus bus = new Bus();
		
		bus.setName("타요");
		bus.setNumber(7011);
		
		System.out.println(bus.getName());
		System.out.println(bus.getNumber());
		
	}
	
}
