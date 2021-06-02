package ex.java.day14;

import java.util.ArrayList;

class MyStack {
	
	private ArrayList<Member> arrayStack = new ArrayList<Member>();
	
	// 스택의 맨 뒤에 요소를 추가
	public void push(Member m) {
		arrayStack.add(m);
	}
	
	// 스택의 맨 뒤에서 요소 꺼냄
	public Member pop() {
		// ArrayList에 저장된 유효한 자료의 개수
		int len = arrayStack.size();
		
		if(len == 0) {
			System.out.println("스택이 비었습니다.");
			return null;
		}
		// 맨 뒤에 있는 자료 반환하고 배열에서 제거
		return(arrayStack.remove(len-1));
	}
	
}

public class StackTest {
	public static void main(String[] args) {
		MyStack stack = new MyStack();
		Member member = new Member(0, "A");
		Member member1 = new Member(1, "B");
		Member member2 = new Member(2, "C");
		
		stack.push(member);
		stack.push(member1);
		stack.push(member2);
		
		System.out.println(stack.pop());
		System.out.println(stack.pop());
		System.out.println(stack.pop());
		System.out.println(stack.pop());
		
	}
}
