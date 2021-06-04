package ex.java.day17.stream;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class ArrayListStreamTest {

	public static void main(String[] args) {
		List<String> sList = new ArrayList<String>();
		sList.add("지민");
		sList.add("석진");
		sList.add("정국");

		// 스트림 생성
		Stream<String> stream = sList.stream();
		// 배열의 요소를 하나씩 출력
		stream.forEach(s -> System.out.print(s + " "));
		System.out.println();

		// 스트림 새로 생성, forEach() 수행하면서 자료가 소모되었음
		// 정렬하여, 요소를 하나씩 출력
		sList.stream().sorted().forEach(s -> System.out.print(s + " "));

	}

}
