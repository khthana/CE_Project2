package project.common;

public interface RobotRoom {
	public int[] getAllRobotID();
	public Robot getRobot(int ID);
	public void setSender(ServerDelivery s);
	public void sendEvent(int type,int fromRobot);
	public void display(String s);
}