package ex.java.day15.innerclass;

public class InnerClassExample1 {

	private int outerHashCode;
	public String outerClassName;
	static boolean isOuter;

	InnerClass innerClass;

	public InnerClassExample1() {
		innerClass = new InnerClass();
		outerHashCode = System.identityHashCode(this);
		outerClassName = this.getClass().getName();
		isOuter = true;
	}

	// 내부 클래스
	class InnerClass {
		private int innerHashCode;
		public String innerClassName;
		static final boolean isInner = true;

		public InnerClass() {
			innerHashCode = System.identityHashCode(this);
			innerClassName = this.getClass().getName();
		}

		public void printOuterInfo() {
			System.out.println("Outer hash: " + outerHashCode);
			System.out.println("Outer name: " + outerClassName);
			System.out.println("It is outer class: " + isOuter);
		}

		public void printInnerInfo() {
			System.out.println("Inner hash: " + innerHashCode);
			System.out.println("Inner name: " + innerClassName);
			System.out.println("It is inner class: " + isInner);
		}
	} // 내부 클래스 끝

	public void info() {
		innerClass.printInnerInfo();
	}

	public static void main(String[] args) {
		// 외부 클래스 객체 생성
		InnerClassExample1 example = new InnerClassExample1();
		// 내쿠 클래스 객체 생성
		InnerClassExample1.InnerClass inner = example.new InnerClass();

		example.info();
		System.out.println("==================================");
		inner.printInnerInfo();
		System.out.println("==================================");
		inner.printOuterInfo();

	}
}
