package ex.java.day13;

public class StringConcatTest {

	public static void main(String[] args) {
		
		long start = System.currentTimeMillis();
		
		String str1 = new String("Java");
		String str2 = "Programing";
		String result = "";
		
		// 동작
		for(int i = 0; i <= 10000; i++) {
			result += " ";
			result += str2;
		}
		
		System.out.println(result);
		
		// 끝 시점 시간
		long end = System.currentTimeMillis();
		
		System.out.println("===Concatenating===");
		System.out.println("시간: " + (end - start));

	}

}
