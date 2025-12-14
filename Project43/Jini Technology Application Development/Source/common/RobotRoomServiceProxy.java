package project.common;

import project.common.*;

import java.rmi.*;

interface RobotRoomServiceProxy extends Remote,RobotRoomService{
	public int[] getRobotID() throws RemoteException;
	public RobotController getController(int ID) throws RemoteException;
}