package ex.java.day10.constructor;

public class MainTest {

	public static void main(String[] args) {
		Rectangle rect = new Rectangle("사각", 15, 20);
		Rectangle rect1 = new Rectangle("직사각", 19, 80);
		
		System.out.println(rect.getArat());
		System.out.println(rect1.getArat());

		Circle cir = new Circle("피자", 10);
		Circle cir2 = new Circle("도넛", 2);
		
		System.out.println(cir.getArea());
		System.out.println(cir2.getArea());
		
		
	}

}
