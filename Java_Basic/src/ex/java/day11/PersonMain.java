package ex.java.day11;

public class PersonMain {

	public static void main(String[] args) {
		
		Person person = new Person();
		System.out.println(person.name);
		
		Person person2 = new Person("최승희", 45, "여", "A", "의사");
		Person person3 = new Person("이미녀", 28, "여", "O", "골프 선수");
		Person person4 = new Person("김미남", 47, "남", "AB", "교수");
		
		System.out.println(person2.play());
		System.out.println(person3.play());
		System.out.println(person4.play());
		
		System.out.println("===");
		
		// 객체 배열 복사
		Person[] per1 = new Person[2];
		Person[] per2 = new Person[2];
		Person[] per3 = new Person[2];
		
		per1[0] = new Person("최승희", 45, "여", "A", "의사");
		per1[1] = new Person("이미녀", 28, "여", "O", "골프 선수");
		
		// 얕은 복사
		System.arraycopy(per1, 0, per2, 0, 2);
		
		System.out.println(per2[0].name);
		
		// 깊은 복사
		per3[0] = new Person();
		per3[1] = new Person();
		
		for(int i = 0; i < per3.length; i++) {
			per3[i].name = per1[i].name;
		}

		System.out.println(per3[0].name);

		per1[0].name = "홍길동";
		
		System.out.println(per2[0].name);
		System.out.println(per3[0].name);

	}

}
