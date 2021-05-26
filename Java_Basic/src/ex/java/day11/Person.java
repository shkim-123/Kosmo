package ex.java.day11;

public class Person {
	String name;
	String job;
	int age;
	String gender;
	String blood;
	
	public Person() {
		//this("이름없음", 0);
		this("이름없음", 0, "", "", "직업없음");
	}
	
	public Person(String name, int age) {
		this(name, age, "", "", "직업없음");
		//this.name = name;
		//this.age = age;
	}
	
	// 가장 매개변수가 많은 생성자 생성 후 this()로 받는 경우가 많다.
	public Person(String name, int age, String gender, String blood, String job) {
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.blood = blood;
		this.job = job;
	}
	
	public String play() {
		String play = "";
		switch(job) {
			case "의사" :
				play = "진료한다.";
				break;
			case "골프 선수" :
			case "골퍼" :
				play = "라운딩 간다.";
				break;
			case "교수" :
				play = "강의한다.";
				break;
			default :
				play = "뭔가 하겠지";
		}
		
		return job + ": " + play;
	}

}
