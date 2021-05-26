package ex.java.day11.inheritance;

public class AmbulanceMain extends Ambulance {

	public static void main(String[] args) {

		Car car1 = new Car("테슬라", 1000);
		Ambulance car2 = new Ambulance();
		
		car2.setName("응급차");
		
		car1.run();
		car2.run();
		
		car2.siren();
		
		
	}

}
