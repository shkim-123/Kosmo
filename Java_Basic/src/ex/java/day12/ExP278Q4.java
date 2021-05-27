package ex.java.day12;

public class ExP278Q4 {

	public static void main(String[] args) {
		

	}

}

class Employee {
	public String name;
	public String grade;
	

	public Employee() {}
	
	public Employee(String name) {
		this.name = name;
	}
}

class Enginner extends Employee {
	private String skillset;
	
	public String getSkillSet() {
		return skillset;
	}
	
	public void setSkillSet(String skillset) {
		this.skillset = skillset;
	}
	
}