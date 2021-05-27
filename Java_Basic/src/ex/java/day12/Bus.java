package ex.java.day12;

public class Bus extends Vehicle {
	
	@Override
	public void run() {
		System.out.print("버스가 ");
		super.run();
	}
}
