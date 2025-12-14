package project.service.robotdaemon;

import project.common.*;
import project.service.robotdaemon.*;

import java.io.Serializable;

public class RobotProxy implements Serializable,Robot{
	
	public static final int ROBOT_FORWARD = 1;
	public static final int ROBOT_BACKWARD = 2;
	public static final int ROBOT_LEFT = 3;
	public static final int ROBOT_RIGHT = 4;
	public static final int ROBOT_STOP = 5;

	public long duration;
	public long expireTime;
	
	public int robotID;

	private RobotManager manager;
	
	public RobotProxy(int ID,long duration,RobotManager manager){
		this.robotID = ID;
		this.duration = duration;
		this.manager = manager;
		this.renew();
	}
	
	public int getID(){
		return robotID;
	}

	public long getExpire(){
		return expireTime;
	}

	public boolean isExpire(){
		long now = System.currentTimeMillis();
		if(this.expireTime > now){
			return false;
		} else return true;
	}

	public void renew(){
		long now = System.currentTimeMillis();
		this.expireTime = now + duration;
	}

	public void forward(){
		manager.sendMovementCommand(ROBOT_FORWARD,robotID);
	}
	public void backward(){
		manager.sendMovementCommand(ROBOT_BACKWARD,robotID);
	}
	public void turnLeft(){
		manager.sendMovementCommand(ROBOT_LEFT,robotID);
	}
	public void turnRight(){
		manager.sendMovementCommand(ROBOT_RIGHT,robotID);
	}
	public void turnOn(){
	}
	public void turnOff(){
	}
	public void stop_move(){
		manager.sendMovementCommand(ROBOT_STOP,robotID);
	}

}