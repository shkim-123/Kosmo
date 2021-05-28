package ex.java.day13;

public class ClassTest2 {

	public static void main(String[] args) throws ClassNotFoundException {
		
		Person person = new Person();
		Class pClass1 = person.getClass();
		System.out.println(pClass1.getName());
		
		Class pClass2 = person.getClass();
		System.out.println(pClass2.getName());
		
		Class pClass3 = Class.forName("ex.java.day13.Person");
		System.out.println(pClass3.getName());

	}

}
