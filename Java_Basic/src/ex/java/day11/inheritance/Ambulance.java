package ex.java.day11.inheritance;

public class Ambulance extends Car {
	private String kit;
	
	public void siren() {
		System.out.println("삐용삐용");
	}

	public String getKit() {
		return kit;
	}

	public void setKit(String kit) {
		this.kit = kit;
	}
	
	
}
