package ex.java.day10.constructor;

public class Rectangle {
	
	String name;
	float width;
	float height;
	
	public Rectangle() {
		width = 0;
		height = 0;
	}
	
	public Rectangle(String name) {
		this.name = name;
	}
	
	public Rectangle(String name, float w, float h) {
		this.name = name;
		width = w;
		height = h;
	}
	
	public float getArat() {
		float result = width * height;
		
		return result;
	}
}
