package ex.java.day17.stream;

import java.util.Arrays;

public class IntArrayTest {
	public static void main(String[] args) {
		int[] arr = { 1, 2, 3, 4, 5 };

		// sum() 연산으로 arr 배열에 저장된 값을 모두 더함
		int sumVal = Arrays.stream(arr).sum();
		// count() 연산으로 arr 배열의 요소 개수를 반환함
		// count() 메서드의 반환 값이 long이므로 int형으로 반환
		int count = (int) Arrays.stream(arr).count();

		int max = Arrays.stream(arr).max().getAsInt();
		int min = Arrays.stream(arr).min().getAsInt();
		double avg = Arrays.stream(arr).average().getAsDouble();

		System.out.println(sumVal);
		System.out.println(count);
		System.out.println(max);
		System.out.println(min);
		System.out.println(avg);

	}
}
