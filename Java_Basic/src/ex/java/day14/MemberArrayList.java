package ex.java.day14;

import java.util.ArrayList;
import java.util.Iterator;

public class MemberArrayList {
	private ArrayList<Member> arrayList;

	public MemberArrayList() {
		arrayList = new ArrayList<>();
	}
	
	// p412
	public void insertMember(Member m, int index) {
		arrayList.add(index, m);
	}

	public void addMember(Member m) {
		arrayList.add(m);
	}

	public boolean removeMember(int id) {
		for(int i = 0; i < arrayList.size(); i++) {
			// get() 메서드로 회원을 순차적으로 가져옴
			Member member = arrayList.get(i);
			int tempId = member.getMemberId();
			// 회원 아이디가 매개변수와 일치하면
			if(tempId == id) {
				// 해당 회원을 삭제
				arrayList.remove(i);
				return true;
			}
		}
		
		// 2번째 방법
//		Iterator<Member> ir = arrayList.iterator();
//		while(ir.hasNext()) {
//			Member member = ir.next();
//			int tempId = member.getMemberId();
			// 멤버 아이디가 매개변수
//			if(tempId == id) {
//				arrayList.remove(member);
//				return true;
//			}
//		}
		
		System.out.println(id + "가 존재하지 않습니다.");
		return false;
	}

	public void showAllMembers() {
		for (Member m : arrayList) {
			System.out.println(m);
		}
		System.out.println();
	}
	
}
