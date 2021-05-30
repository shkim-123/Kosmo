package ex.java.day12.gameLevel;

public class BeginnerLevel extends PlayerLevel {
	@Override
	public void run() {
		System.out.println("천천히 달립니다.");
	}
	
	@Override
	public void jump() {
		System.out.println("JUMP 할지 모름");
	}
	
	@Override
	public void turn() {
		System.out.println("TURN 할지 모름");
	}
	
	@Override
	public void showLevelMessage() {
		System.out.println("===초보자 레벨===");
	}
}
