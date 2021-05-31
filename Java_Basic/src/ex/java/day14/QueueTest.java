package ex.java.day14;

import java.util.ArrayList;

class MyQueue {
	private ArrayList<Member> arrayQueue = new ArrayList<Member>();
	
	public void enQueue(Member m) {
		arrayQueue.add(m);
	}
	
	public Member deQueue() {
		int len = arrayQueue.size();
		
		if(len == 0) {
			System.out.println("큐가 비었습니다.");
			return null;
		}
		return(arrayQueue.remove(0));
	}
}

public class QueueTest {

	public static void main(String[] args) {
		
		MyQueue queue = new MyQueue();
		Member member = new Member(0, "A");
		Member member1 = new Member(1, "B");
		Member member2 = new Member(2, "C");
		
		queue.enQueue(member);
		queue.enQueue(member1);
		queue.enQueue(member2);
		
		System.out.println(queue.deQueue());
		System.out.println(queue.deQueue());
		System.out.println(queue.deQueue());
	}

}
