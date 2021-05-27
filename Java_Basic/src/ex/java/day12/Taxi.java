package ex.java.day12;

public class Taxi extends Vehicle {
	@Override
	public void run() {
		System.out.print("택시가 ");
		super.run();
	}
}
