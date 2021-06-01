package ex.java.day15.innerclass;

public class InnerClassExample4 {

	public static void main(String[] args) {
		InnerClassExample4 exam = new InnerClassExample4();
		System.out.println(exam.getName().toString());
	}
	
	
	public Object getName() {
		
		// Object o = new Object();
		return new Object() {	// anonymous class
			@Override
			public String toString() {
				return this.getClass().getName();
			}
		};
		
		// return new MyObject();
	}

}

/*
class MyObject extends Object {
	@Override
	public String toString() {
		return this.getClass().getName();
	}
}
*/