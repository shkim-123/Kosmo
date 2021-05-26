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

	}

}
