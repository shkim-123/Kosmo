package ex.java.day13;

public class ToStringEx {

	public static void main(String[] args) {
		
		Book book1 = new Book(200, "개미");
		
		// toString() 메서드
		// 원형 : getClass().getName() + '@' + Integer.toHexString(hashCode())
		// 재정의하여 출력
		System.out.println(book1);
		System.out.println(book1.toString());
		
		String str = new String("알고리즘");
		int i1 = new Integer(100);
		System.out.println(str);
		System.out.println(i1);
		
		System.out.println("===인터페이스===");
		
		// 익명 구현 객체
		Drawable d = new Drawable() {
			
			@Override
			public void draw(int color) {
				// TODO Auto-generated method stub
				
			}
		};
		
		DrawableMain dm = new DrawableMain();
		System.out.println(d);
		System.out.println(dm);

	}

}


class Book {
	int bookNumber;
	String bookTitle;
	
	Book(int bookNumber, String bookTitle) {
		this.bookNumber = bookNumber;
		this.bookTitle = bookTitle;
	}
	
	// toString() 재정의
	@Override
	public String toString() {
		
		// getClass() 사용해보기
		Class c = getClass();
		
		System.out.println("클래스 : " + c);
		System.out.println("클래스 이름 : " + c.getName());
		System.out.println("해시 코드 : " + hashCode());
		System.out.println("해시 코드 2진수 표현 : " + Integer.toBinaryString(hashCode()));
		
		return bookTitle + "," + bookNumber;
	}

}


