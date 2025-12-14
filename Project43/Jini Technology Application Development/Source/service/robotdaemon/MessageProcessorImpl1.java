package project.service.robotdaemon;

import project.common.*;
import project.service.robotdaemon.*;

public class MessageProcessorImpl1 implements MessageProcessor{
	
	private RobotManager robotManager;
	private RobotRoomImpl robotRoom;

	public MessageProcessorImpl1(RobotRoomImpl room,RobotManager manager){
		this.robotManager = manager;
		this.robotRoom = room;
	}

	public void process(int data){
		String buffer = Util.int2bin(data,8);
		String command = buffer.substring(0,5);
		int ID = Util.bin2int(buffer.substring(5));
		if(command.equals("11000")){
			robotManager.receivePing(ID);
		} else
		if(command.equals("11111")){
			robotRoom.sendEvent(RobotRoomEvent.ALERT_HIT,ID);
			robotRoom.display("Recieve ALERT event from robot ID:"+ID);
		} else
		if(command.equals("11110")){
			robotRoom.sendEvent(RobotRoomEvent.HIT_UNKNOWN,ID);
			robotRoom.display("Recieve HIT event from robot ID:"+ID);
		} else 
		robotRoom.display("Recieve unknown Command \""+command+"\" from robot ID:"+ID);
	}
}