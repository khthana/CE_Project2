package project.common;

import java.io.*;
import java.rmi.*;
import java.rmi.server.*;
import net.jini.core.lease.*;

public class  RobotRoomServiceRegistrationImpl implements Serializable,RobotRoomServiceRegistration{
	
	protected RobotRoomServiceProxy server;
	protected Lease lease;

	RobotRoomServiceRegistrationImpl(RobotRoomServiceProxy s,Lease l) throws RemoteException{
		this.server = s;
		this.lease = l;
	}

	public int[] getRobotID() throws RemoteException{
		return server.getRobotID();
	}

	public RobotController getController(int RobotID) throws RemoteException{
		return server.getController(RobotID);
	}

	public Lease getLease(){
		return lease;
	}
}