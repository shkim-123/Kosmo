package ex.java.day13;

public class EqualsTest {

	public static void main(String[] args) {
		
		Student studentLee = new Student(100, "홍길동");
		Student studentLee2 = studentLee;
		Student studentSang = new Student(100, "홍길동");
		
		if(studentLee == studentLee2) {
			System.out.println("studentLee 와 studentLee2의 주소가 같다.");
		} else {
			System.out.println("studentLee 와 studentLee2의 주소가 다르다.");
		}
		
		if(studentLee.equals(studentLee2)) {
			System.out.println("studentLee 와 studentLee2의 동일하다.");
		} else {
			System.out.println("studentLee 와 studentLee2의 동일하지 않다.");
		}
		
		if(studentLee == studentSang) {
			System.out.println("studentLee 와 studentSang의 주소가 같다.");
		} else { 
			System.out.println("studentLee 와 studentSang의 주소가 다르다.");
		}
		
		if(studentLee.equals(studentSang)) {
			System.out.println("studentLee 와 studentSang의 동일하다.");
		} else {
			System.out.println("studentLee 와 studentSang의 동일하지 않다.");
		}
		
		System.out.println("studentLee의 hashCode : " + studentLee.hashCode());
		System.out.println("studentSang의 hashCode : " + studentSang.hashCode());
		
		// System.indentityHashCode() : 실제 인스턴스의 주소 값 반환
		System.out.println("studentLee의 실제 주소값 : " + System.identityHashCode(studentLee));
		System.out.println("studentSang의 실제 주소값 : " + System.identityHashCode(studentSang));
		
	}

}
