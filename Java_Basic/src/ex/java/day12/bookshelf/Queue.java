package ex.java.day12.bookshelf;

public interface Queue {
	// 배열의 맨 마지막에 추가
	void enQueue(String title);
	// 배열의 맨 처음 항목 반환
	String deQueue();
	// 현재 큐에 있는 개수 반환
	int getSize();

}
