package project.common;

import project.common.*;
import java.rmi.*;
import java.rmi.server.*;
import java.io.*;

public class RobotControllerImpl extends UnicastRemoteObject
							 implements RobotControllerProxy{
	public Robot robot;

	RobotControllerImpl(Robot r) throws RemoteException{
		this.robot = r;
	}

	public void forward() throws RemoteException{
		robot.forward();
	}
	public void backward() throws RemoteException{
		robot.backward();
	}
	public void turnRight() throws RemoteException{
		robot.turnRight();
	}
	public void turnLeft() throws RemoteException{
		robot.turnLeft();
	}
	public void turnOn() throws RemoteException{
		robot.turnOn();
	}
	public void turnOff() throws RemoteException{
		robot.turnOff();
	}
	public void stop_move() throws RemoteException{
		robot.stop_move();
	}
}