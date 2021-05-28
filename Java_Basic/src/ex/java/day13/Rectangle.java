package ex.java.day13;

public class Rectangle implements Drawable, Sound {

	int x1, x2, y1, y2;
	String[] colors = {"RED", "GREEN", "BLUE", "BLACK", "WHITE"};
	
	public Rectangle(int x1, int x2, int y1, int y2) {
		this.x1 = x1;
		this.x2 = x2;
		this.y1 = y1;
		this.y2 = y2;
	}
	
	@Override
	public void draw(int color) {
		System.out.printf("왼쪽 위의 좌표가 (%d, %d), " 
				 	+ "오른쪽 아래의 좌표가 (%d, %d), "
					+ "원의 색깔이 %s인 사각형을 그립니다. \n", 
					x1, y1, x2, y2, colors[color - 1]);
		
		sound(10);
	}
	
	public int getX1() {return x1;}
	public int getX2() {return x2;}
	public int getY1() {return y1;}
	public int getY2() {return y2;}
	
	@Override
	public void sound(int tone) {
		// 사운드 매니저에서 구현 ...
	}


}
