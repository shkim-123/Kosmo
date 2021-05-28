package ex.java.day13;

import java.util.Calendar;

public class CalenderTest {

	public static void main(String[] args) {
		
		// Calendar
		Calendar now = Calendar.getInstance();   // singletone
		
		now.get(Calendar.DAY_OF_WEEK);
		now.get(Calendar.YEAR);
		now.get(Calendar.DAY_OF_MONTH);
		now.get(Calendar.DAY_OF_YEAR);
		
		System.out.println(now.get(Calendar.DAY_OF_WEEK));
		System.out.println(now.get(Calendar.YEAR));
		System.out.println(now.get(Calendar.DAY_OF_MONTH));
		System.out.println(now.get(Calendar.DAY_OF_YEAR));
		

	}

}
