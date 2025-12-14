package project.common;

import java.rmi.*;

public interface RobotController{
	public void forward() throws RemoteException;
	public void backward() throws RemoteException;
	public void turnLeft() throws RemoteException;
	public void turnRight() throws RemoteException;
	public void turnOn() throws RemoteException;
	public void turnOff() throws RemoteException;
	public void stop_move() throws RemoteException;
}