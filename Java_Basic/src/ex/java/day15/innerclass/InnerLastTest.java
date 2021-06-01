package ex.java.day15.innerclass;

// outer class, 외부 클래스
public class InnerLastTest {

	// anonymous inner class, 익명 내부 클래스
	Object o = new Object() {
		@Override
		public String toString() {
			return InnerLastTest.class.getName();
		}
	};

	public InnerLastTest() {
		o.toString();
	}

	// anonymous inner class
	Object method2() {
		return new Object() {
			@Override
			public String toString() {
				return InnerLastTest.class.getName();
			}
		};
	}

	// anonymous inner class
	Runnable method3() {
		return new Runnable() {

			@Override
			public void run() {
			}
		};
	}

	// method inner class, 메서드 내부 클래스
	void method() {
		class ABC {
			int a = 10;
			// static int b = 100;

			public ABC() {
			}

		}

		ABC abc = new ABC();
		abc.a = 1000;
	}

	// instance inner class, 인스턴스 내부 클래스
	public class InstanceInner {
		int abc;
		static final int A = 10;

		public InstanceInner() {
		}

		public void print() {
			abc = 100;
			System.out.println(abc);
		}
	}

	// static inner class, 정적 내부 클래스
	static class StaticInner {
		int abc;
		static int abcd = 100;

		public StaticInner() {
		}

		public void print() {
			abc = 1000;
			System.out.println(abc);
			System.out.println(StaticInner.abcd);
		}

		static void info() {
			// System.out.println(abc);
			System.out.println(abcd);
		}

	}
}
