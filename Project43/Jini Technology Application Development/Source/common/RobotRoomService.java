package project.common;

import java.rmi.*;
import net.jini.core.event.*;

public interface RobotRoomService {
	public RobotRoomServiceRegistration getInstance(long duration) 
			throws RemoteException;
	public EventRegistration trackEvents(long duration,RemoteEventListener rel,MarshalledObject key)
			throws RemoteException;
}