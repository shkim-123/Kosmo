package ex.java.day13.system;


class Employee {
	int eno;
	
	public Employee(int eno) {
		this.eno = eno;
		System.out.println("Employee" + eno + " 생성");
	}
	
	@Override
	protected void finalize() throws Throwable {
		System.out.println("Employee" + eno + " 삭제");
	}
}



public class SystemGcExample {

	public static void main(String[] args) {
		
		Employee emp = new Employee(1);
		emp = null; // Employee1 가비지 컬렉션 대상
		emp = new Employee(2);
		emp = new Employee(3); // Employee2 가비지 컬렉션 대상
		System.out.println("Employee" + emp.eno);
		System.gc(); // 가비지 컬렉션 대상 finalize()
		
	}

}
