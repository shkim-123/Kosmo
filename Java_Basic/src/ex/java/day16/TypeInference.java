package ex.java.day16;

public class TypeInference {
	public static void main(String[] args) {
		var i = 10; // int i = 10 컴파일
		var j = 10.0; // double j = 10.0 컴파일
		var str = "hello"; // String str = "hello" 컴파일

		System.out.println(i);
		System.out.println(j);
		System.out.println(str);

		str = "test";
		// str = 3; // String형으로 사용되었기에 정수 값 대입 불가
	}
}
