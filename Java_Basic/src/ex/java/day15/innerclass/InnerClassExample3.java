package ex.java.day15.innerclass;

import java.util.Date;

public class InnerClassExample3 {

	public void printStatus() {
		
		class DateFormat {
			private Date date;
			
			public DateFormat() {
				this.date = date;
			}
			
			public String getDateFormat() {
				return date.toString();
			}
		}
		
		DateFormat format = new DateFormat();
		System.out.println("The Date : " + format);
	}
	
	public static void main(String[] args) {
		InnerClassExample3 example = new InnerClassExample3();
		example.printStatus();
	}

}
