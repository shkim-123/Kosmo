package ex.java.day10;

// import문으로 다른 패키지를 가져올 수 있음
import ex.java.day10.info.Person;

public class Chapter5Main {

	public static void main(String[] args) {
		// 같은 패키지인 경우 패키지명 생략 가능
		Student st = new Student();  // ex.java.day10
		ex.java.day10.Student st2;   
		
		// . operator
		st.studentId = 1000;
		st.studentName = "홍길동";
		st.address = "서울";
		
		// 사용
		System.out.println(st.studentName);
		
		// 다른 패키지인 경우 패키지명.클랙스명 으로 사용 가능
		ex.java.day08.Student st3 = new ex.java.day08.Student();  
		
		// import문으로 가져온 경우
		Person person = new Person(); 
		
		// 메서드 사용, 반환형식 있는 경우
		String info = st.showStudentInfo();
		System.out.println(info);
		System.out.println(st.showStudentInfo()); //info를 출력한것과 동일, 시스템 내부적으로도 동일
		
		// 위의 info의 경우와 동일하다.
//		String t = "Hello world"; 
//		System.out.println(t);
//		System.out.println("Hello world");
		
		// 메서드 사용, 반환형식 없는 경우
		st.println();
		
		// 메서드, 매개변수 사용
		String score = st.setScore(99);
		System.out.println(score);
		
		st.setScore2(95);
		System.out.println(st.scores);
		
	}

}
