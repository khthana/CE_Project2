package project.common;

public interface Robot{

	public int getID();
	public void forward();
	public void backward();
	public void turnLeft();
	public void turnRight();
	public void turnOn();
	public void turnOff();
	public void stop_move();
}