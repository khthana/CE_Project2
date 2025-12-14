package project.common;

import java.rmi.*;
import net.jini.core.lease.*;

public interface RobotRoomServiceRegistration{
	//Get all RobotID on the room for request control
	public int[] getRobotID() throws RemoteException;

	//Get Robot controller for the specific RobotID
	public RobotController getController(int ID) throws RemoteException;

	//Get the Lease for renewal perpose
	public Lease getLease()  throws RemoteException;
}