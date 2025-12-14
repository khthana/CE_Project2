package project.client.palmdaemon;

import project.common.*;
import project.client.palmdaemon.*;

import java.io.*;
import java.net.*;
import java.rmi.*;
import java.rmi.server.*;
import java.util.*;
import net.jini.lease.*;
import net.jini.core.lease.*;
import net.jini.core.event.*;
import net.jini.discovery.*;
import net.jini.core.lookup.*;
import net.jini.lookup.entry.*;

public class PalmProxy implements Runnable{
	public static final int NO_CONNECTION = 1;
	public static final int WAIT_FOR_SERVICE_ID = 2;
	public static final int WAIT_FOR_ROBOT_ID = 3;
	public static final int WAIT_FOR_CONTROL = 4;
	public static final int WAIT_FOR_CONFIRM_CLOSE = 5;
	public static final int WAIT_RESTART = 6;
	public static final int ROBOT_DISCONNECT = 7;

	public int state;

	private Socket palmSocket = null;
	private int palmID;
	private PalmDaemonImpl palmDaemon = null;
	private DataInputStream in;
	private DataOutputStream out;
	private Thread myThread;

	private ServiceFinder sf;
	private ServiceItem[] roomServices;
	private LeaseRenewalManager lrm = new LeaseRenewalManager();

	private RobotRoomService selectedService;
	private RobotRoomServiceRegistration selectedRegistration;
	private RemoteEventListener rel;
	private EventRegistration eventRegistration;
	private int[] allRobotID;
	private RobotController controller;

	public int controlledRobot;

	public PalmProxy(PalmDaemonImpl daemon,Socket socket,int id){
		System.setSecurityManager(new RMISecurityManager());
		palmSocket = socket;
		palmID = id;
		palmDaemon = daemon;
		try{
			in = new DataInputStream(socket.getInputStream());
			out = new DataOutputStream(socket.getOutputStream());
			sendPalm("Welcome to Jini Network");
			sendPalm("-----------------------");
			sendPalm("You connect as ID = "+palmID);
		} catch(IOException ioe){
			System.out.println("ERROR: Can't retrive stream from socket");
		  }

		//NO_CONNECTION is the start state of this proxy
		this.state = NO_CONNECTION;
	}

	public void run(){
		String request = new String("");
		while(true){
			try{
				request = in.readUTF();
				//out.writeUTF("#"+request);
				try{
					processRequest(request);
				} catch(Exception e){
					System.out.println(e);
				}
			}
			catch(IOException ioe){
				System.out.println("PalmID:"+palmID+" is disconnect");
				palmDaemon.removeClient(palmID);
			}
		}
	}

	private String receivePalm() throws IOException {
		synchronized (in) {
			String line = in.readUTF();
			if (line == null) {
				throw new InterruptedIOException();
			}
			return line;
		}
	}

	public void sendPalm(String value) throws IOException {
		synchronized (out) {
			out.writeUTF(value);
			out.flush();
		}
	}
	
	public void start(){
		myThread = new Thread(this);
		myThread.start();
	}
	
	public void stop(){
   	    myThread.stop();
        myThread = null;
    }

	public void processRequest(String request) throws Exception{
		switch(state){
			case NO_CONNECTION:
				
				if (request.equals("find service")){
					//Create ServiceFinder Object to looking for Service
					System.out.println("Service Finding, Please wait...");
					sendPalm("#Service Finding,Please wait.");
					//Find the Service
					sf = new ServiceFinder(RobotRoomService.class);
					Object[] temp = (Object[])sf.getObject();
					roomServices = new ServiceItem[temp.length];
					for(int i=0;i<temp.length;i++){
						roomServices[i] = (ServiceItem)temp[i];
					}
					//Display the result to palm
					System.out.println("found "+roomServices.length+" service(s)");
					sendPalm("#found "+roomServices.length+" service(s)");
					sendPalm("@==Please select service==");
					//Search for the service name
					for(int j=0;j<roomServices.length;j++){
						boolean knowName = false;
						for(int k=0;k<roomServices[j].attributeSets.length;k++){
							if(roomServices[j].attributeSets[k] instanceof Name){
								sendPalm((j+1)+") "+((Name)(roomServices[j].attributeSets[k])).name);
								knowName = true;
							}
						}
						if(!knowName){
							sendPalm((j+1)+") No_name Service");
						}
					}
					//If couldn't find service,ask for restart
					if(roomServices.length == 0){
						sendPalm("#Couldn't find Service");
						sendPalm("@Couldn't find Service. Want to find Service again?");
						sendPalm("1) YES");
						sendPalm("2) NO");
						state = WAIT_RESTART;
						break;
					}
					//Change to next state
					this.state = WAIT_FOR_SERVICE_ID;
				}
				break;
			case WAIT_FOR_SERVICE_ID:
				
				int serviceRequest = 0;
				//Check if the request string is not a digit
				try{serviceRequest = Integer.parseInt(request);}
				catch(NumberFormatException nfe){break;}

				if(serviceRequest > roomServices.length){
					sendPalm("#The number "+serviceRequest+" is OutOfRange");
					break;
				}
				//Get Service Object and get ServiceRegistration
				sendPalm("#Registration Process");
				sendPalm("@Retriving Registration Object.");
				selectedService = (RobotRoomService)roomServices[serviceRequest-1].service;
				selectedRegistration = selectedService.getInstance(Lease.FOREVER);
				
				//Check if can't get ServiceRegistration Object
				if(selectedRegistration == null){
					sendPalm("#Can't Request Registeration Object");
					sendPalm("@Can't Request Registeration Object. Want to find Service again?");
					sendPalm("1) YES");
					sendPalm("2) NO");
					state = WAIT_RESTART;
					break;
				} else	if(selectedRegistration.getLease() == null){
					sendPalm("#Error: Can't get Lease from service");
					sendPalm("@Can't get Lease from service. Want to find Service again?");
					sendPalm("1) YES");
					sendPalm("2) NO");
					state = WAIT_RESTART;
					break;
				}

				//Register for RemoteEvent
				sendPalm("Register for RemoteEvent");
				rel = new RobotRoomEventHandler(this);
				eventRegistration = selectedService.trackEvents(Lease.FOREVER,rel,null);

				//Register lease to LeaseRenewalalManager for renew
				sendPalm("Register for Leasing");
				lrm.renewUntil(eventRegistration.getLease(),Lease.FOREVER,null);
				lrm.renewUntil(selectedRegistration.getLease(),Lease.FOREVER,null);
				
				allRobotID = selectedRegistration.getRobotID();
				sendPalm("#Found "+allRobotID.length+" robot(s)");
				sendPalm("@==Please select Robot==");
				for(int i=0;i<=allRobotID.length-1;i++){
					sendPalm((i+1)+") Robot ID = "+allRobotID[i]);
				}
				if(allRobotID.length == 0){
					sendPalm("#Couldn't find Robot");
					sendPalm("@Want to find Service again?");
					sendPalm("1) YES");
					sendPalm("2) NO");
					state = WAIT_RESTART;
					break;
				}
				//Change to next state
				state = WAIT_FOR_ROBOT_ID;
				break;
			case WAIT_FOR_ROBOT_ID:
				int robotRequest = 0;
				//Check if the request string is not a digit or OutOFRange
				try{robotRequest = Integer.parseInt(request);}
				catch(NumberFormatException nfe){break;}
				if(robotRequest-1 > roomServices.length){
					sendPalm("#Number "+robotRequest+" is OutOfRange");
					break;
				}
				controller = (RobotController)selectedRegistration.getController(allRobotID[robotRequest-1]);
				sendPalm("@Selected robot ID ="+allRobotID[robotRequest-1]);
				sendPalm("  ");
				sendPalm("Ready to Control!");
				sendPalm("#Ready to control robot");

				//Save controlled robotID to this proxy
				this.controlledRobot = allRobotID[robotRequest-1];

				//Change to next State
				state = WAIT_FOR_CONTROL;
				break;
			case WAIT_FOR_CONTROL:
				if(request.equals("forward")){
					controller.forward();
				} else
				if(request.equals("backward")){
					controller.backward();
				} else
				if(request.equals("left")){
					controller.turnLeft();
				} else
				if(request.equals("right")){
					controller.turnRight();
				} else
				if(request.equals("turn on")){
					controller.turnOn();
				} else
				if(request.equals("stop")){
					controller.stop_move();
				} else
				if(request.equals("turn off")){
					controller.turnOff();
				} else
				if(request.equals("find service")){
					sendPalm("@Do you want to leave current Service?");
					sendPalm("1) YES");
					sendPalm("2) NO");
					this.state = WAIT_FOR_CONFIRM_CLOSE;
				}  
				break;
			case WAIT_FOR_CONFIRM_CLOSE:
				int cancelRequest = 0;
				//Check if the request string is not a digit or OutOFRange
				try{cancelRequest = Integer.parseInt(request);}
				catch(NumberFormatException nfe){break;}
				if(cancelRequest == 1 || cancelRequest == 2){
					if(cancelRequest == 1){
						this.state = NO_CONNECTION;
						sendPalm("@Find Service Again...");
						sendPalm("#Service finding.please wait.");
						processRequest("find service");
					} else {
						sendPalm("@Ready to Control!");
						this.state = WAIT_FOR_CONTROL;
						break;
					  }
				} else sendPalm("#Please select 1 or 2");
				break;
			case WAIT_RESTART:
				int restartRequest = 0;
				//Check if the request string is not a digit or OutOFRange
				try{restartRequest = Integer.parseInt(request);}
				catch(NumberFormatException nfe){break;}
				if(restartRequest == 1 || restartRequest == 2){
					if(restartRequest == 1){
						this.state = NO_CONNECTION;
						sendPalm("@Find Service Again...");
						processRequest("find service");
					} else {
						sendPalm("@Thank you for use this program. You can press FIND SERVICE again or EXIT if you want.");
						this.state = NO_CONNECTION;
						break;
					  }
				} else sendPalm("#Please select 1 or 2");
				break;
			case ROBOT_DISCONNECT:
				sendPalm("@Your robot has disconnected. Do you want to find robot again?");
				sendPalm("1) YES");
				sendPalm("2) NO");
				this.state = WAIT_RESTART;
				break;
			default:throw new Exception("Unknown Proxy State");
		}
	}
}