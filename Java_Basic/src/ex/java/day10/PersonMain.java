package ex.java.day10;

public class PersonMain {

	public static void main(String[] args) {
		
		PersonExam px1 = new PersonExam();
		PersonExam px2 = new PersonExam();
		
		px1.name = "제임스";
		px1.age = 40;
		px1.child = 3;
		px1.gender = "남자";
		
		//px2.name = "니아";
		//px2.age = 41;
		px2.child = 0;
		//px2.gender = "여자";
		
		px1.print();
		px2.print();
	}

}
