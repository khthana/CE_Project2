package project.service.robotsim;

public class RobotSimComponent{
	public int pos_x = 0;
	public int pos_y = 0;
	public int width = 0;
	public int height = 0;

	//Return true if hit the other
	public boolean checkHit(RobotSimComponent other){
		int X1min = other.pos_x;
		int X1max = other.pos_x + other.width;
		int Y1min = other.pos_y;
		int Y1max = other.pos_y + other.height;
		int X2min = this.pos_x;
		int X2max = this.pos_x + width;
		int Y2min = this.pos_y;
		int Y2max = this.pos_y + height;
		if(X1max < X2min || X2max < X1min || Y1max < Y2min || Y2max < Y1min){
			return false;
		} else return true;
	}
}