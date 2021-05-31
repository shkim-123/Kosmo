package ex.java.day14;

import java.util.ArrayList;

public class TestArrayList extends ArrayList<Member> {

	@Override
	public Member get(int index) {
		return super.get(index);
	}

	@Override
	public void add(int index, Member element) {
		super.add(index, element);
	}

	@Override
	public Member remove(int index) {
		return super.remove(index);
	}
	
}
