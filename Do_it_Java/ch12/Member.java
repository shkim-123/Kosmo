package day0727.ch12;

//------------------------------------------
// Comparable<Member> 인터페이스를 구현한 Member 클래스 선언
//------------------------------------------
public class Member implements Comparable<Member> {
	
	//------------------------------------------
	// <1> int형 memberId 멤버 변수 선언, 회원 아이디
	// <2> String형 memberName 멤버 변수 선언, 회원 이름
	//------------------------------------------
	private int memberId;			// <1>
	private String memberName;		// <2>
	
	//------------------------------------------
	// 회원 아이디, 회원 이름을 입력받는 생성자 선언
	//------------------------------------------
	public Member(int memberId, String memberName) {
		this.memberId = memberId;
		this.memberName = memberName;
	}

	//------------------------------------------
	// get(), set() 메서드 선언
	//------------------------------------------
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	//------------------------------------------
	// toString() 메서드 오버라이딩
	// 회원 이름, 회원 아이디를 문자열로 리턴한다.
	//------------------------------------------
	@Override
	public String toString() {
		return memberName + " 회원님의 아이디는 " + memberId + "입니다.";
	}
	
	//------------------------------------------
	// hashCode() 메서드가 회원 아이디를 리턴하도록 메서드 오버라이딩
	//------------------------------------------
	@Override
	public int hashCode() {
		return memberId;
	}
	
	//------------------------------------------
	// equals() 메서드 오버라이딩
	// 매개변수로 넘어온 회원아이디와 자신의 회원아기 같다면 true 반환
	// <1> 매개변수로 들어온 객체가 Member형 인 경우
	// <2> Member형 member 변수 선언, obj 객체를 Member로 다운캐스팅하여 대입
	// <3> 회원아이디와 매개변수의 회원아이디 같다면
	// <4> true 리턴하고 함수 중단
	// <5> 회원아이디와 매겨변수의 회원아이디가 같지 않다면 false 리턴하고 함수 중단
	// <6> 매개변수로 넘어온 객체가 Member형이 아니라면 false 리턴하고 함수 중단
	//------------------------------------------
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Member) {					// <1>
			Member member = (Member)obj;			// <2>
			
			if(this.memberId == member.memberId) {	// <3>
				return true;						// <4>
			} else {
				return false;						// <5>
			}
		}
		return false;								// <6>
	}
	
	//------------------------------------------
	// compareTo() 메서드 오버라이딩
	// 추가한 회원 아이디와 매개변수로 받은 회원 아이디를 비교함
	// 새로 추가한 회원 아이디가 더 크면 양수, 그렇지 않으면 음수, 같으면 0을 반환
	// 출력 결과 값은 오름차순으로 정렬된다.
	//------------------------------------------
	// 객체가 TreeSet에 요소를 추가할 때 호출되는 메서드이다.
	// 콜백(callback) 메서드 : 프로그래머가 작성하지만 시스템이나 자바 컬렉션 프레임워크가 호출하는 메서드를 말한다.
	//------------------------------------------
	@Override
	public int compareTo(Member member) {
		return (this.memberId - member.memberId);
	}
	
	
	/* =========================================
	 * 컬렉션 프레임워크(collection framework)
	 * 필요한 자료 구조(data structure)를 미리 구현하여 java.util 패키지에서 제공하는 것을 말한다.
	 * =========================================
	 */

}
