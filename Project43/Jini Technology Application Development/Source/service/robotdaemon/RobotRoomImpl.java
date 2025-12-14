package project.service.robotdaemon;

import project.common.*;
import project.service.robotdaemon.*;

import java.io.*;

public class RobotRoomImpl implements RobotRoom{
	
	private SerialParameters serialParameters;
	private MessageProcessor processor;

	public PortManager portManager;
	
	private RobotManager robotManager;

	private ServerDelivery sender;

	private DaemondBrowser displayer;


	public RobotRoomImpl(String portName,int baud,long duration,long expireCheckInterval,DaemondBrowser d){
		//Create RobotManager who manage the RobotProxy objects
		//The parameter "this" means RobotRoom 
		robotManager = new RobotManager(this,duration,expireCheckInterval);
		processor = new MessageProcessorImpl1(this,robotManager);
		serialParameters = new SerialParameters(portName);
		serialParameters.setBaudRate(baud);
		portManager = new PortManager(serialParameters,processor,this);

		displayer = d;
	}

	public void startConnection(){
			robotManager.start();
			portManager.openConnection();
	}

	public void stopConnection(){
		portManager.closeConnection();
	}
	
	public int[] getAllRobotID(){
		return robotManager.getAllRobotID();
	}

	public Robot getRobot(int ID){
		return robotManager.getRobot(ID);
	}

	public void setSender(ServerDelivery s){
		this.sender = s;
	}

	public void sendEvent(int type,int fromRobot){
		sender.deliver(type,fromRobot);
	}

	public void display(String s){
		if(this.displayer != null){
			displayer.display(s);
		} else System.out.println(s);
	}

	public void portReady(){
		this.displayer.portReady();
	}

	public void portNotReady(){
		this.displayer.portNotReady();
	}

	public void robotAdded(int ID){
		this.displayer.addRobot(ID);
	}

	public void robotRemoved(int ID){
		this.displayer.removeRobot(ID);
		this.sendEvent(RobotRoomEvent.ROBOT_DISCONNECT,ID);
	}
}