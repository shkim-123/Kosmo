package ex.java.day13;

public class WrapperClassTest {

	public static void main(String[] args) {
		
		// Integer 클래스의 메서드
		
		// int 값 가져오기
		Integer iValue = new Integer(100);
		int myValue = iValue.intValue();
		
		Integer number1 = Integer.valueOf("100");
		Integer number2 = Integer.valueOf(100);
		
		int num = Integer.parseInt("100");
		
		System.out.println(iValue);
		System.out.println(myValue);
		System.out.println(number1);
		System.out.println(number2);
		System.out.println(num);
		
		// ==
		System.out.println("=====");
		
		Integer ivalue = new Integer(100);
		
		// 오토박싱
		ivalue = Integer.valueOf(100);
		ivalue = Integer.valueOf("1000");
		
		// 언박싱
		int i = ivalue.intValue();
		i = Integer.parseInt("100");
		
		Byte bt = Byte.valueOf("101");
		byte b = Byte.parseByte("101");

		Float ft = Float.valueOf("2.5F");
		
		Integer i1 = Integer.valueOf("1000");
		Integer i2 = Integer.valueOf("1000");
		
		if(i1.equals(i2)) {
			System.out.println("equal : 1000");
		}
		
		if(i1 == i2) {
			System.out.println("== : 1000");
		}
		
		
	}

}
