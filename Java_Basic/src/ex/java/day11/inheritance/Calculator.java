package ex.java.day11.inheritance;

public class Calculator {
	
	protected int op1;
	protected int op2;
	
	public void setOperand(int op1, int op2) {
		this.op1 = op1;
		this.op2 = op2;
	}
	
	public int sum() {
		return op1 + op2;
	}
	
	public int avg() {
		return sum()/2;
	}
	
	public double areaCircle(double r) {
		return 3.14159*r*r;
	}

}
