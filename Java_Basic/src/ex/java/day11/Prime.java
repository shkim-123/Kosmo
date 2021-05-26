package ex.java.day11;

public class Prime {
	int number;
	int[] primeNumbers = new int[100];
	
	public Prime() {}
	
	public Prime(int t) {
		number = t;
	}
	
	// 출력
	public void print() {
		for(int i : primeNumbers) {
			if(i == 0) {
				break;
			}
			System.out.println(i);
		}
	}
	
	// 소수 계산 메서드
	public void primeNumber() {
		int i = 2; // i는 나눌 대상
		boolean isPrime = true;
		int cnt = 0;
		
		while(i <= number) {
			isPrime = true;
			
			for(int n = 2; n < i; n++) {
				if(i % n == 0) {
					isPrime = false;
				}
				continue;
			}
			
			if(isPrime == true) {
				primeNumbers[cnt] = i;
				cnt++;
			}
			i++;
		}
	}
	
	// number 세팅 메서드
	public void setNumber(int t) {
		number = t;
	}
	
}
