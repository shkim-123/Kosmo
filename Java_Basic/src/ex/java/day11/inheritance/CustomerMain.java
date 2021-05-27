package ex.java.day11.inheritance;

public class CustomerMain {

	public static void main(String[] args) {

		Customer c1 = new Customer();
		c1.setCustomerName("홍길동");
		System.out.println(c1.showCustomerInfo());
		
		Customer c2 = new Customer(10, "홍길동");
		System.out.println(c2.showCustomerInfo());
		
		Customer c3 = new Customer(10010, "이순신");
		c3.bonusPoint = 1000;
		System.out.println(c3.showCustomerInfo());
		
		
		VIPCustomer c4 = new VIPCustomer();
		c4.setCustomerID(10020);
		c4.setCustomerName("김유신");
		c4.bonusPoint = 10000;
		System.out.println(c4.showCustomerInfo());
		System.out.println(c4.calcPrice(1000));
		
	}

}
