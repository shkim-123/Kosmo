package ex.java.day11.inheritance;

public class Parent {
	
	public String name;
	
	public Parent(String name) {
		this.name = name;
	}
	
	public void info() {
		System.out.println(name + " 가족입니다.");
	}

}
