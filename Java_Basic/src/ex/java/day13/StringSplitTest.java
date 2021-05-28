package ex.java.day13;

import java.util.StringTokenizer;

public class StringSplitTest {

	public static void main(String[] args) {

		String str = "Java Programming is funny things!";
		String str1 = "Java\\Programming\\is\\funny\\things!";

		// split()
		String[] result = str.split(" ");

		for (String s : result) {
			System.out.println(s);
		}

		System.out.println("===");
		
		// StringTokenizer class
		StringTokenizer st = new StringTokenizer(str);
		while(st.hasMoreTokens()) {
			System.out.println(st.nextToken());
		}

	}

}
