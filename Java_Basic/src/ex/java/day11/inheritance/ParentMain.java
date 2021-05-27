package ex.java.day11.inheritance;

public class ParentMain {

	public static void main(String[] args) {
		Parent parent = new Parent("홍길동");
		Child child = new Child("홍길동", 123);
		
		parent.info();
		child.info();

	}

}
