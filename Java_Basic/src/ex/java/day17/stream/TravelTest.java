package ex.java.day17.stream;

import java.util.ArrayList;
import java.util.List;

public class TravelTest {

	public static void main(String[] args) {

		TravelCustomer customerKim = new TravelCustomer("김석진", 30, 20000);
		TravelCustomer customerPark = new TravelCustomer("박지민", 27, 15000);
		TravelCustomer customerTae = new TravelCustomer("김태형", 27, 10000);

		List<TravelCustomer> customerList = new ArrayList<>();

		customerList.add(customerKim);
		customerList.add(customerPark);
		customerList.add(customerTae);

		System.out.println("== 고객 명단 추가된 순서대로 출력==");
		customerList.stream().map(c -> c.getName()).forEach(s -> System.out.println(s));

		int total = customerList.stream().mapToInt(c -> c.getPrice()).sum();
		System.out.println("총 여행 비용은 : " + total + "입니다.");

		System.out.println("=== 30세 이상 고객 명단 정렬하여 출력 ==");
		customerList.stream().filter(c -> c.getAge() >= 30).map(c -> c.getName()).sorted()
				.forEach(s -> System.out.println(s));

	}

}
