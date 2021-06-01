package ex.java.day13;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class StringClassTest1 {

	public static void main(String[] args) throws ClassNotFoundException {

		// 클래스 가져오기
		Class strClass = Class.forName("java.lang.String");

		// 모든 생성자 가져오기
		Constructor[] cons = strClass.getConstructors();

		for (Constructor c : cons) {
			System.out.println(c);
		}

		System.out.println("===");

		// 모든 멤버 변수(필드) 가져오기
		Field[] fields = strClass.getFields();

		for (Field f : fields) {
			System.out.println(f);
		}

		System.out.println("===");

		// 모든 메서드 가져오기
		Method[] methods = strClass.getMethods();
		for (Method m : methods) {
			System.out.println(m);
		}

	}

}
