package ex.java.day14;

import java.util.ArrayList;

class MyQueue {
	private ArrayList<Member> arrayQueue = new ArrayList<Member>();
	
	// 큐의 맨 뒤에 추가
	public void enQueue(Member m) {
		arrayQueue.add(m);
	}
	
	// 큐의 맨 앞에서 꺼냄
	public Member deQueue() {
		int len = arrayQueue.size();
		
		if(len == 0) {
			System.out.println("큐가 비었습니다.");
			return null;
		}
		// 맨 앞의 자료 반환하고 배열에서 제거
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
