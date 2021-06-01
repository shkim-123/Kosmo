package ex.java.day13;

public class NewInstanceTest {

	public static void main(String[] args) throws ClassNotFoundException, 
	InstantiationException, IllegalAccessException {
		
		// 생성자로 생성하기
		Person person1 = new Person();
		System.out.println(person1);
		
		Class pClass = Class.forName("ex.java.day13.Person");
		// Class 클래스의 newInstance() 메서드로 생성하기
		Person person2 = (Person)pClass.newInstance();
		System.out.println(person2);

	}

}
