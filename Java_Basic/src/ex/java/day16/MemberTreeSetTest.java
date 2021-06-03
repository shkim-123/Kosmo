package ex.java.day16;

public class MemberTreeSetTest {
	public static void main(String[] args) {
		MemberTreeSet memberTreeSet = new MemberTreeSet();

		Member memberPark = new Member(1003, "박지민");
		Member memberKim = new Member(1001, "김석진");
		Member memberJeon = new Member(1002, "전정국");

		memberTreeSet.addMember(memberPark);
		memberTreeSet.addMember(memberKim);
		memberTreeSet.addMember(memberJeon);
		memberTreeSet.showAllMember();

		Member memberTae = new Member(1003, "김태형");
		memberTreeSet.addMember(memberTae);
		memberTreeSet.showAllMember();
	}
}
