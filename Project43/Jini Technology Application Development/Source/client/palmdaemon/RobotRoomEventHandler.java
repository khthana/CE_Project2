package project.client.palmdaemon;

import project.common.*;
import project.client.palmdaemon.*;

import java.io.*;
import java.rmi.*;
import java.rmi.server.*;
import net.jini.core.event.*;

public class RobotRoomEventHandler extends UnicastRemoteObject
								   implements RemoteEventListener{
	private PalmProxy parrent;

	RobotRoomEventHandler(PalmProxy proxy) throws RemoteException{
		this.parrent = proxy;
	}

	public void notify(RemoteEvent rev) throws UnknownEventException,RemoteException{
		RobotRoomEvent rrev;
		if(!(rev instanceof RobotRoomEvent))
			throw new UnknownEventException("Unexpected event type");
		rrev = (RobotRoomEvent)rev;
		try{
			switch(rrev.type){
				case RobotRoomEvent.HIT_BLOCK: parrent.sendPalm("Robot("+rrev.fromRobot+") hit Block");break;
				case RobotRoomEvent.HIT_BORDER: parrent.sendPalm("Robot("+rrev.fromRobot+") hit Border");break;
				case RobotRoomEvent.HIT_ROBOT: parrent.sendPalm("Robot("+rrev.fromRobot+") hit Robot");break;
				case RobotRoomEvent.HIT_UNKNOWN: parrent.sendPalm("Robot("+rrev.fromRobot+") hit UNKNOWN");break;
				case RobotRoomEvent.ALERT_HIT: parrent.sendPalm("Robot("+rrev.fromRobot+") ALERT! hit");break;
				case RobotRoomEvent.ROBOT_DISCONNECT: 
					if(rrev.fromRobot == parrent.controlledRobot){
						parrent.state = PalmProxy.ROBOT_DISCONNECT;
						break;
					} else parrent.sendPalm("Robot("+rrev.fromRobot+") has disconnected");
					break;
				default: parrent.sendPalm("Robot("+rrev.fromRobot+") Recieve Unknown Event");
			}
		} catch(IOException ioe){
			System.out.println("Error:Can't communicate to palm");
			System.out.println(ioe);
		}
	}
}