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
		
		System.out.println("==오버라이딩==");
		
		int r = 10;
		
		Computer compu = new Computer();
		
		System.out.println("원면적: " + cal.areaCircle(r));
		System.out.println("원면적: " + compu.areaCircle(r));
	}

}
