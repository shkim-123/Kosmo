package ex.java.day14.hashmap;

import java.util.HashMap;
import java.util.Iterator;

public class MemberHashMap {
	private HashMap<Integer, Member> hashMap;
	
	public MemberHashMap() {
		hashMap = new HashMap<Integer, Member>();
	}
	
	public void addMember(Member member) {
		// key-value 쌍으로 추가
		hashMap.put(member.getMemberId(), member);
	}
	
	public boolean removeMember(int id) {
		// HashMap에 매개변수로 받은 키 값인 회원이 있다면
		if(hashMap.containsKey(id)) {
			hashMap.remove(id);
			return true;
		}
		System.out.println(id + "가 존재하지 않습니다.");
		return false;
	}
	
	public void showAllMember() {
		Iterator<Integer> ir = hashMap.keySet().iterator();
		while(ir.hasNext()) {
			int key = ir.next();
			Member member = hashMap.get(key);
			System.out.println(member);
		}
		System.out.println();
	}
}
