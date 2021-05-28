package ex.java.day13.system;

public class SystemTestMain {

	public static void main(String[] args) {
		
		// 끝내고자 할때
		// System.exit(0);
		
		// 시작 시점 시간
		long start = System.nanoTime();
		
		// 동작
		int sum = 0;
		for(int i = 0; i <= 100000000; i++) {
			sum += 1;
		}
		
		// 끝 시점 시간
		long end = System.nanoTime();
		
		System.out.println("합: " + sum);
		System.out.println(start);
		System.out.println(end);
		System.out.println("시간: " + (end - start));
		
		System.out.println("===");
		
		// getProperty()
		String osName = System.getProperty("os.name");
		String userName = System.getProperty("user.name");
		System.out.println(System.getProperty("user.dir"));
		System.out.println(System.getProperty("java.class.path"));
		
		System.out.println("OS: " + osName);
		System.out.println("User: " + userName);
		
		// 모든 Property
		System.getProperties().list(System.out);
		
		System.out.println("====================");
		
		// getEnv()
		System.out.println(System.getenv("PATH"));
		
		
	}

}
