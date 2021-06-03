package ex.java.day16;

import java.util.Comparator;

public class Member2 implements Comparator<Member> {
	private int memberId;
	private String memberName;
	
	public Member2(int id, String name) {
		this.memberId = id;
		this.memberName = name;
	}

	@Override
	public int compare(Member mem1, Member mem2) {
		// 전달받은 두 매개변수를 비교함
		return mem1.getMemberId() - mem2.getMemberId();
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
		if(obj instanceof Member2) {
			Member2 member = (Member2)obj;
			if(this.memberId == member.memberId) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}
}
