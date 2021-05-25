package ex.java.day10.constructor;

public class PersonTest {

	public static void main(String[] args) {
		
		// 1. 기본 생성자
		Person person = new Person();
		Person person2 = new Person();
		Person person3 = new Person();
		
		// 2. 매개변수 생성자
		// p: 홍길동, p2: 자바, p3: 도넛
		Person person4 = new Person("홍길동");
		Person person5 = new Person("자바");
		Person person6 = new Person("도넛");

		Person person7 = new Person("홍길동", 100, 80);
		Person person8 = new Person("자바", 80, 90);
		Person person9 = new Person("도넛", 10, 10);
	}

}
