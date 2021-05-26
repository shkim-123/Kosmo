package ex.java.day11.inheritance;

public class CalculatorMain {

	public static void main(String[] args) {

		Calculator cal = new Calculator();
		
		cal.setOperand(20, 10);
		
		System.out.println(cal.sum());
		System.out.println(cal.avg());
		
		SubCalculator subCal = new SubCalculator();
		
		subCal.setOperand(30, 20);
			
		System.out.println(subCal.sum());
		System.out.println(subCal.avg());
		System.out.println(subCal.sub());
	}

}
