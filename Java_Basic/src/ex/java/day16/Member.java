package ex.java.day16;

public class Member implements Comparable<Member> {
	private int memberId;
	private String memberName;
	
	public Member(int id, String name) {
		this.memberId = id;
		this.memberName = name;
	}

	
	@Override
	public int compareTo(Member member) {
		// 추가한 회원 아이디와 매개변수로 받은 회원 아이디 비교
		return (this.memberId - member.memberId) * (-1);
	}
	
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
	
	@Override
	public String toString() {
		return memberName + " 회원님의 아이디는 " + memberId + "입니다.";
	}
	
	@Override
	public int hashCode() {
		return memberId;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Member) {
			Member member = (Member)obj;
			if(this.memberId == member.memberId) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}
}
