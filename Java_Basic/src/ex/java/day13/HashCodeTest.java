package ex.java.day13;

public class HashCodeTest {

	public static void main(String[] args) {
		
		// String 클래스, Integer 클래스는 
		// hashCode() 메서드가 재정의 되어 있다.
		
		String str1 = new String("abc");
		String str2 = new String("abc");
		
		System.out.println(str1 == str2);
		System.out.println(str1.equals(str2));
		
		System.out.println(str1.hashCode());
		System.out.println(str2.hashCode());
		
		System.out.println("===");
		
		// Integer() 생성자에 취소선이 보이는 이유
		// deprecated 경고, 앞으로 사라질 수 있다는 뜻
		Integer t1 = new Integer(100);
		Integer t2 = new Integer(100);
		
		System.out.println(t1 == t2);
		System.out.println(t1.equals(t2));
		
		System.out.println(t1.hashCode());
		System.out.println(t2.hashCode());
	}

}
