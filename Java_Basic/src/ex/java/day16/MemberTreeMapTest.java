package ex.java.day16;

public class MemberTreeMapTest {

	public static void main(String[] args) {
		MemberTreeMap memberHashMap = new MemberTreeMap();
		
		Member memberPark = new Member(1003, "박지민");
		Member memberKim = new Member(1001, "김석진");
		Member memberJeon = new Member(1002, "전정국");
		Member memberTae = new Member(1004, "김태형");

		memberHashMap.addMember(memberPark);
		memberHashMap.addMember(memberKim);
		memberHashMap.addMember(memberJeon);
		memberHashMap.addMember(memberTae);
		
		memberHashMap.showAllMember();
		
		memberHashMap.removeMember(1004);
		memberHashMap.showAllMember();
	}

}
