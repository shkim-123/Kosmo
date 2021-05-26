package ex.java.day11.inheritance;

public class Car {
	
	private String name;
	private int cc;
	
	public Car(){
		this("이름 없음", 0);
	}
	
	public Car(String name, int cc) {
		this.name = name;
		this.cc = cc;
	}
	
	public void run(){
		System.out.println(this.name + " 달려라");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCc() {
		return cc;
	}

	public void setCc(int cc) {
		this.cc = cc;
	}
	
	

}
