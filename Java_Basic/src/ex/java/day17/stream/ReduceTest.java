package ex.java.day17.stream;

import java.util.Arrays;
import java.util.function.BinaryOperator;

// BinaryOperator를 구현한 클래스 정의
class CompareString implements BinaryOperator<String> {
	// reduce() 메서드가 호출될 때 불리는 메서드, 두 문자열 길이를 비교
	@Override
	public String apply(String s1, String s2) {
		if (s1.getBytes().length >= s2.getBytes().length)
			return s1;
		else
			return s2;
	}
}

public class ReduceTest {

	public static void main(String[] args) {

		String[] greetings = { "안뇽", "hello", "good morning", "하이하이" };

		// 람다식을 직접 구현하는 방법
		System.out.println(Arrays.stream(greetings).reduce("", (s1, s2) -> {
			if (s1.getBytes().length >= s2.getBytes().length)
				return s1;
			else
				return s2;
		}));

		String str = Arrays.stream(greetings).reduce(new CompareString()).get();
		System.out.println(str);

	}

}
