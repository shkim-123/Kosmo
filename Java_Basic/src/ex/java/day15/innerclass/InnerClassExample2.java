package ex.java.day15.innerclass;

public class InnerClassExample2 {

	int num = 20;
	static int sum = 20;

	static class InnerClass {
		// static inner class 내부에서는 static 변수 선언 가능
		static String keyword = "STATIC INNER";

		public void info() {
			// num += 10;
			System.out.println("Inner.info()");
		}

		// static inner class 내부에서는 static 메서드 선언 가능
		public static void printName() {
			System.out.println("Inner.printName()");
		}

	}

	public static void main(String[] args) {

		InnerClass innerObj = new InnerClassExample2.InnerClass();
		System.out.println("Keyword: " + InnerClass.keyword);
		innerObj.info();
		InnerClass.printName();

	}

}
