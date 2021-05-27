package ex.java.day11.inheritance;

public class Child extends Parent {
	private int id;
	
	public Child(String name, int id) {
		super(name);
		this.id = id;
	}
	
	@Override
	public void info() {
		System.out.println(super.name + " 가족의 " + this.id + " 입니다.");
	}

}
