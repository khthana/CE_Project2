package project.common;

import java.util.Hashtable;
import java.rmi.*;
import java.rmi.server.*;
import net.jini.core.lease.*;
import net.jini.lookup.*;
import net.jini.core.lookup.*;
import net.jini.core.event.*;

public class RobotRoomServiceImpl extends UnicastRemoteObject
								  implements RobotRoomServiceProxy,ServiceIDListener{
	protected RobotRoom room;
	protected ServerLandlord lord;
	protected ServerDelivery sender;

	public RobotRoomServiceImpl(int maxClient,RobotRoom r) throws RemoteException{
		lord = new ServerLandlord();
		sender = new ServerDelivery(this,lord);
		this.room = r;
		this.room.setSender(sender);
	}

	public RobotRoomServiceRegistration getInstance(long duration) throws RemoteException{
		//This Hashtable is act as a session data of the client that connect to Service
		Hashtable ht = new Hashtable();
		Lease lease = lord.newLease(ht,duration);
		//if lease == null means Number of the client at Service Already reach MAXIMUM Limits.
		return new RobotRoomServiceRegistrationImpl(this,lease);
	}

	public int[] getRobotID(){
		return room.getAllRobotID();
	}

	public RobotController getController(int ID) throws RemoteException{
		Robot robot = room.getRobot(ID);
		if(robot != null){
			return new RobotControllerImpl(robot);
		} else return null;
	}

	public EventRegistration trackEvents(long duration,RemoteEventListener rel,MarshalledObject key)throws RemoteException{
		return sender.addListener(rel,duration,key);
	}

	public void serviceIDNotify(ServiceID id){
		System.out.println("Service ID is "+id);
	}
}