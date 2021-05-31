package ex.java.day12;

public class CalculatorMain {

	public static void main(String[] args) {
		
		int num1 = 10;
		int num2 = 5;
		
		CompleteCalc calc = new CompleteCalc();
		System.out.println(calc.add(num1, num2));
		System.out.println(calc.substract(num1, num2));
		System.out.println(calc.times(num1, num2));
		System.out.println(calc.divide(num1, num2));
		calc.showInfo();
		// 디폴트 메서드 호출
		calc.description();
		
		// 정적 메서드 호출
		int[] arr = {1, 2, 3, 4, 5};
		System.out.println(Calc.total(arr));
		
		// 인터페이스를 직접 구현하여 사용, 코드 블록 끝에 ; 추가
		Calc c = new Calc() {

			@Override
			public int add(int num1, int num2) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public int substract(int num1, int num2) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public int times(int num1, int num2) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public int divide(int num1, int num2) {
				// TODO Auto-generated method stub
				return 0;
			}
			
		};

	}

}
