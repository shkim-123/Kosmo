package ex.java.day13;

import java.lang.reflect.Method;

public class ClassTest {

	public static void main(String[] args) {
		
		// 1
		String s = new String();
		Class c = s.getClass();
		Method[] m = c.getMethods();
		
		for(Method method : m) {
			System.out.println(method.getName());
		}
		
		System.out.println("===");
		
		// 2
		c = String.class;
		c = EqualsTest.class;
		System.out.println(c);
		
		
		// 3
		try {
			c = Class.forName("ex.java.day13.CalenderTest");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(c.getName());

	}

}
