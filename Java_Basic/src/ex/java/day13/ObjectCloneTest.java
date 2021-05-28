package ex.java.day13;

class Circle1 implements Cloneable {

	// 내부 클래스, 이너 클래스
	class Point {
		int x;
		int y;

		public Point(int x, int y) {
			this.x = x;
			this.y = y;
		}

		@Override
		public String toString() {
			return "x = " + x + ", " + "y = " + y;
		}
	}

	Point point;
	int radius;

	public Circle1(int x, int y, int raidus) {
		this.radius = raidus;
		point = new Point(x, y);
	}

	@Override
	public String toString() {
		return "원점은 " + point + "이고, 반지름은 " + radius + "입니다.";
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}

public class ObjectCloneTest {

	public static void main(String[] args) throws CloneNotSupportedException {
		Circle1 circle = new Circle1(10, 20, 30);
		// 앝은 복사
		Circle1 circle2 = circle;
		
		// 깊은 복사
		Circle1 copyCircle = (Circle1) circle.clone();

		System.out.println(circle);
		System.out.println(copyCircle);
		System.out.println(circle2);
		System.out.println(System.identityHashCode(circle));
		System.out.println(System.identityHashCode(circle2));
		System.out.println(System.identityHashCode(copyCircle));
	}

}
