package ex.java.day15.innerclass;

public class ExInnerClassDb {

	public void retrieve(String table) {
		// DB table 에서 data row fetch.
		// 제목, 저자, 청구번호
		
		// 내부 클래스
		class Book {
			String title;   // 제목
			String author;  // 저자
			String no;			// 청구번호
			
			public Book(String t, String a, String n) {
				this.title = t;
				this.author = a;
				this.no = n;
			}
		}
		
		
		// String[] result = Db.fetch(table);
		String[] result = {"자바 원전", "고슬링", "ㄱ1000"};
		Book book = new Book(result[0], result[1], result[2]);
		
		//
		if(book.title.contains("세상에")) {
			// ..
		}
	}
	
	public static void main(String[] args) {
		
		

	}

}
