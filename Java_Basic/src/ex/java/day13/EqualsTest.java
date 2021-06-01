package ex.java.day13;

public class EqualsTest {

	public static void main(String[] args) {
		
		Student studentHong = new Student(100, "홍길동");
		Student studentHong2 = studentHong;
		Student studentDong = new Student(100, "홍길동");
		
		if(studentHong == studentHong2) {
			System.out.println("studentHong 와 studentHong2의 주소가 같다.");
		} else {
			System.out.println("studentHong 와 studentHong2의 주소가 다르다.");
		}
		
		if(studentHong.equals(studentHong2)) {
			System.out.println("studentHong 와 studentHong2의 동일하다.");
		} else {
			System.out.println("studentHong 와 studentHong2의 동일하지 않다.");
		}
		
		if(studentHong == studentDong) {
			System.out.println("studentHong 와 studentDong의 주소가 같다.");
		} else { 
			System.out.println("studentHong 와 studentDong의 주소가 다르다.");
		}
		
		if(studentHong.equals(studentDong)) {
			System.out.println("studentHong 와 studentDong의 동일하다.");
		} else {
			System.out.println("studentHong 와 studentDong의 동일하지 않다.");
		}
		
		System.out.println("studentHong의 hashCode : " + studentHong.hashCode());
		System.out.println("studentDong의 hashCode : " + studentDong.hashCode());
		
		// System.indentityHashCode() : 실제 인스턴스의 주소 값 반환
		System.out.println("studentHong의 실제 주소값 : " + System.identityHashCode(studentHong));
		System.out.println("studentDong의 실제 주소값 : " + System.identityHashCode(studentDong));
		
	}

}
