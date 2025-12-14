package project.common;

import net.jini.core.event.*;
import java.rmi.*;

public class RobotRoomEvent extends RemoteEvent{
	public static final int NO_HIT = 0;
	public static final int HIT_BLOCK = 1;
	public static final int HIT_ROBOT = 2;
	public static final int HIT_BORDER = 3;
	public static final int HIT_UNKNOWN = 4;
	public static final int ALERT_HIT = 5;
	public static final int ROBOT_DISCONNECT = 6;

	
	public static final int ID = 1001;

	public int type;
	public int fromRobot;
	
	public RobotRoomEvent(Object source,long seqno,MarshalledObject key,int eventType,int robot){
		super(source,ID,seqno,key);
		this.type = eventType;
		this.fromRobot = robot;
	}
}