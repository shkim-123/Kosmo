package ex.java.day13;

public class StringConcatTest {

	public static void main(String[] args) {
		
		long start = System.currentTimeMillis();
		
		String str1 = new String("Java");
		String str2 = "Programing";
		
		// 동작
		System.out.println(str1);
		System.out.println(System.identityHashCode(str1));
		
		str1 = str1.concat(str2);
		
		System.out.println(str1);
		System.out.println(System.identityHashCode(str1));
		
		
		
		
		// 끝 시점 시간
		long end = System.currentTimeMillis();
		
		System.out.println("===Concatenating===");
		System.out.println("시간: " + (end - start));

	}

}
