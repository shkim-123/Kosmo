package ex.java.day10.constructor;

public class Person {
	
	// 멤버 필드(변수)
	String name;		// 이름
	float height;			// 키
	float weight;		// 몸무게
	
	// 생성자, 메소드
	// class 이름과 같다.
	// return 타입 X
	
	public Person() { 
		height = 0;
		weight = -1;
		
		System.out.println("Person 생성자 w :" + weight + "  h : " + height);
	}
	
	public Person(String n) {
		name = n;
		
		System.out.println(name);
	}
	
	public Person(String n, float w, float h) {
		name = n;
		weight = w;
		height = h;
		
		System.out.println(name + " " + weight + " " + height);
	}
	
}
