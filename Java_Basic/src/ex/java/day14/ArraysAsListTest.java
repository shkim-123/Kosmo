package ex.java.day14;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class ArraysAsListTest {

	public static void main(String[] args) {
		
		List<String> list = java.util.Arrays.asList("서초구", "구로구", "강서구");
		
		List<Member> list1 = Arrays.asList(new Member(1, "홍길동"),
				new Member(2, "이순신"));
		
		for(Member m : list1) {
			m.getMemberName();
		}
		
		Iterator<Member> it = list1.iterator();
		
		while(it.hasNext()) {
			Member m = it.next();
			m.getMemberName();
		}

	}

}
