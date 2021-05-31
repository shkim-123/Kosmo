package ex.java.day12;

public class Customer implements Buy, Sell {
	
	protected int customerID;			// 고객 아이디
	protected String customerName;	// 고객 이름
	protected String customerGrade;	// 고객 등급
	int bonusPoint; 				// 보너스 포인트
	double bonusRatio;				// 적립 비율
	
	public Customer() {
		initCustomer();
	}
	
	public Customer(int customerID, String customerName) {
		this.customerID = customerID;
		this.customerName = customerName;

		initCustomer();
		
		System.out.println("Customer() 생성자 호출");
	}
	
	// 내부에서만 사용하는 메서드는 대부분 private을 붙인다.
	private void initCustomer() {
		customerGrade = "SILVER";
		bonusRatio = 0.01;
	}
	
	public int calcPrice(int price) {
		bonusPoint += price * bonusRatio; // 보너스 포인트 계산
		return price;
	}
	
	public String showCustomerInfo() {
		return customerName + " 님의 등급은 " + customerGrade + "이며, 보너스 포인트는 " + bonusPoint + "입니다.";
	}
	
	@Override
	public void sell() {
		System.out.println("구매하기");
	}
	
	@Override
	public void buy() {
		System.out.println("판매하기");
	}
	

	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerGrade() {
		return customerGrade;
	}

	public void setCustomerGrade(String customerGrade) {
		this.customerGrade = customerGrade;
	}

	@Override
	public void order() {
		System.out.println("고객 판매 주문");
	}
	
	

}
