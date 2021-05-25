package ex.java.day05;

public class StringTest {

	public static void main(String[] args) {
		String str1 = new String("abc");
		String str2 = "abc";
		String str3 = "abc";
		
		System.out.println(str1);
		System.out.println(str2);
		System.out.println(str3);
		System.out.println(str1 == str2);
		System.out.println(str1 == str3);
		System.out.println(str2 == str3);
		
		str2 = "efg";
		System.out.println(str2);
		System.out.println(str2 == str3);
		
		//str1 = "abc";
		System.out.println(str1 == str3);
		
		// charAt() 예제
		String str4 = "배고파아";
		System.out.println(str4);
		System.out.print(str4.charAt(0));
		System.out.print(str4.charAt(1));
		System.out.print(str4.charAt(2));
		System.out.println(str4.charAt(3));
		System.out.println(str4.length());
		
		for(int i=0; i < str4.length(); i++) {
			System.out.print(str4.charAt(i));
		}
		
		System.out.println("");
		
		// equals(string)
		System.out.println(str4.equals(str4));
		System.out.println(str1 == str3);
		System.out.println(str1.equals(str3));
		System.out.println(str1.equals("abc")); // 권장안함
		System.out.println("abc".equals(str1)); // 문자열 비교 시 권장, NullPointerException 회피하기 위하여
		
		//split 예제
		String[] strs = "하 나 둘 셋 넷".split(" ");
		System.out.println(strs.length);

		for(int i = 0; i<strs.length; i++) {
			System.out.println(strs[i]);
		}
		
		//substring()
		System.out.println(str4.substring(2, 4));
		System.out.println("하 나 둘 셋 넷".substring(2, 4));
		
	}

}
