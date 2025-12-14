package project.service.robotdaemon;

import project.common.*;
import project.service.robotdaemon.*;

import java.util.*;

public class RobotManager implements Runnable{
	
	public static final long DEFAULT_DURATION = 10*1000; //10 Seconds
	public static final long DEFAULT_EXPIRE_CHECK = 3*1000; //3 Seconds

	public long duration;
	public long expireCheckInterval;

	private Hashtable robotHash;
	private RobotRoomImpl robotRoom;

	private Thread myThread;

	public RobotManager(RobotRoomImpl room){
		this(room,DEFAULT_DURATION,DEFAULT_EXPIRE_CHECK);
	}

	public RobotManager(RobotRoomImpl room,long RobotDuration){
		this(room,RobotDuration,DEFAULT_EXPIRE_CHECK);
	}

	public RobotManager(RobotRoomImpl room,long RobotDuration,long expireCheckInterval){
		robotHash = new Hashtable();
		this.robotRoom = room;
		this.duration = RobotDuration;
		this.expireCheckInterval = expireCheckInterval;
	}

	//This Thread is for checking if some RobotProxy expire.
	public void run(){
		while(true){
			try{ Thread.sleep(expireCheckInterval);}
	  		catch(Exception e){}
			this.checkExpiration();
		}
	}

	//This method is do check if some RobotProxy expire.
	public void checkExpiration(){
		Enumeration e = robotHash.keys();
		while(e.hasMoreElements()){
			Integer key = (Integer)e.nextElement();
			RobotProxy robot = (RobotProxy)robotHash.get(key);
			if(robot.isExpire()){
				robotRoom.display("RobotProxy ID:"+key+" was destroyed.");
				robotRoom.robotRemoved(robot.getID());
				robotHash.remove(key);
			}
		}
	}

	synchronized public void sendMovementCommand(int command,int toRobot){
		String outCommand = new String("01");
		outCommand = outCommand + Util.int2bin(command,3);
		outCommand = outCommand + Util.int2bin(toRobot,3);
		robotRoom.portManager.sendData(Util.bin2int(outCommand));
	}

	public void receivePing(int RobotID){
		if(robotHash.containsKey(new Integer(RobotID))){
			RobotProxy robot = (RobotProxy)robotHash.get(new Integer(RobotID));
			robot.renew();
		} else {
			robotHash.put(new Integer(RobotID),new RobotProxy(RobotID,duration,this));
			robotRoom.robotAdded(RobotID);
			robotRoom.display("RobotProxy ID:"+RobotID+" was created.");
		  }
	}

	public void start(){
		myThread = new Thread(this);
		myThread.start();
	}

	public int[] getAllRobotID(){
		Enumeration e = robotHash.keys();
		int[] robotID = new int[robotHash.size()];
		for(int i=0;e.hasMoreElements();i++){
			Robot robot = (Robot)robotHash.get(e.nextElement());
			robotID[i] = robot.getID();
		}
		return robotID;		
	}

	public Robot getRobot(int ID){
		return (Robot)robotHash.get(new Integer(ID));
	}
}