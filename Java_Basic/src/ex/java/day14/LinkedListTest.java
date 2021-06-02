package ex.java.day14;

import java.util.LinkedList;

public class LinkedListTest {

	public static void main(String[] args) {
		
		LinkedList<String> myList = new LinkedList<String>();
		
		// 링크드 리스트에 요소 추가
		myList.add("A");
		myList.add("B");
		myList.add("C");
		
		// 리스트 전체 출력
		System.out.println(myList);
		
		// 링크드 리스트의 첫 번째 위치에 D 추가
		myList.add(1, "D");
		System.out.println(myList);
		
		// 연결 리스트의 맨 앞에 0 추가
		myList.addFirst("0");
		System.out.println(myList);
		
		// 맨 뒤 요소 삭제 후 해당 요소 출력
		System.out.println(myList.removeLast());
		System.out.println(myList);

	}

}
