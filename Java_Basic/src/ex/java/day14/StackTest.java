package ex.java.day14;

import java.util.ArrayList;

class MyStack {
	
	private ArrayList<Member> arrayStack = new ArrayList<Member>();
	
	public void push(Member m) {
		arrayStack.add(m);
	}
	
	public Member pop() {
		int len = arrayStack.size();
		
		if(len == 0) {
			System.out.println("스택이 비었습니다.");
			return null;
		}
		
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
