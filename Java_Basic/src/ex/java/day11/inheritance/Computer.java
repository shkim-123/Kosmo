package ex.java.day11.inheritance;

public class Computer extends Calculator {
	
	
	@Override
	public double areaCircle(double r) {
		return Math.PI*r*r;
	}
}
