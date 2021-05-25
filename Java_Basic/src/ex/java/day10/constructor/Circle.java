package ex.java.day10.constructor;

public class Circle {
	
	double radius;
	String name;
	
	public Circle(String n, double r){
		radius = r;
		name = n;
	}
	
	public double getArea() {
		double result = radius * radius * 3.14;
		
		return result;
	}

}
