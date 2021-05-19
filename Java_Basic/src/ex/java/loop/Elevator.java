package ex.java.loop;

public class Elevator {

	public static void main(String[] args) {
		//switch-case문 연습, 5층 건물, 엘리베이터 층 누르면 어떤 곳인지 출력 (p.106)
		int floor = 2;
		String place;
		
		switch(floor) {
			case 1 :
				place = "약국";
				break;
			case 2 :
				place = "정형외과";
				break;
			case 3 :
				place = "피부과";
				break;
			case 4 :
				place = "치과";
				break;
			case 5 :
				place = "헬스 클럽";
				break;
			default :
				place = "없는 층";
		}
		
		System.out.println(floor + "층 " + place + "입니다.");

	}

}
