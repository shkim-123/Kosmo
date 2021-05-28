package ex.java.day13;

class MyDate {
	int day;
	int month;
	int year;
	
	public MyDate(int day, int month, int year) {
		this.day = day;
		this.month = month;
		this.year = year;
	}
	
	@Override
	public boolean equals(Object obj) {
		MyDate date = (MyDate)obj;
		
		if(this.day == date.day && this.month == date.month && this.year == date.year) {
			return true;
		} else {
			return false;
		}
		
	}
}

public class MyDateTest {

	public static void main(String[] args) {
		
		MyDate date1 = new MyDate(9, 18, 2004);
		MyDate date2 = new MyDate(9, 18, 2004);
		
		System.out.println(date1.equals(date2));

	}

}
