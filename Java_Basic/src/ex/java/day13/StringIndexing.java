package ex.java.day13;

public class StringIndexing {

	public static void main(String[] args) {
		String str = "Java Programming";
		
		System.out.println(str.indexOf("J"));
		System.out.println(str.indexOf('P'));
		System.out.println(str.indexOf("gram"));
		
		// 자르기
		System.out.println(str.subSequence(0, str.indexOf("gram")));
		
		// 뒤에서 부터 찾는다.
		System.out.println(str.lastIndexOf("a"));
		
		System.out.println(str.startsWith("java"));
		System.out.println(str.startsWith("Java"));
		System.out.println(str.startsWith("va"));
	}

}
