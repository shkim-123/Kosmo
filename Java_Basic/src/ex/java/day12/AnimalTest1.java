package ex.java.day12;

class Animal {
	public void move() {
		System.out.println("동물이 움직입니다.");
	}
}

class Human extends Animal {
	public void move() {
		System.out.println("사람이 두 발로 걷습니다.");
	}
}

class Tiger extends Animal {
	@Override
	public void move() {
		System.out.println("호랑이가 네 발로 뜁니다.");
	}
}

class Eagle extends Animal {
	public void move() {
		System.out.println("독수리가 하늘을 납니다.");
	}
}

public class AnimalTest1{
	public static void main(String[] args) {
		AnimalTest1 aTest = new AnimalTest1();
		
		aTest.moveAnimal(new Human());  // Up - Casting
		aTest.moveAnimal(new Tiger());
		aTest.moveAnimal(new Eagle());
		
		new Tiger().move();
		new Human().move();
		
		aTest.moveAnimal(new Animal());
		
		Animal h1 = new Human();
		Animal a1 = new Animal();
		
		if(h1 instanceof Human) {
			System.out.println("Human!!!!");
		}
		
		if(h1 instanceof Animal) {
			System.out.println("Animal!!!");
		}
		
		if(h1 instanceof Tiger) {
			System.out.println("Tiger!!!");
		}
		
		System.out.println("===a1 비교===");
		
		if(a1 instanceof Human) {
			System.out.println("Human!!!!");
		}
		
		if(a1 instanceof Animal) {
			System.out.println("Animal!!!");
		}
		
		if(a1 instanceof Tiger) {
			System.out.println("Tiger!!!");
		}
		
		Animal a2 = new Tiger();
		//Human h2 = (Human)a2;		// 에러!
		
		
	}
	
	// 매개 변수의 자료형이 상위 클래스
	public void moveAnimal(Animal animal) {	
		animal.move();	// 재정의 된 메서드 호출
	}
	
}
