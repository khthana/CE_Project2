package project.service.robotsim;

import project.common.*;
import project.service.robotsim.*;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;
import java.rmi.*;
import java.rmi.server.*;
import net.jini.discovery.*;
import net.jini.lookup.*;
import net.jini.lookup.entry.*;
import net.jini.core.entry.*;

public class RobotSim{

	RobotSim(){
	}

	public static void main(String[] args) throws RemoteException {
		//Do not forget this line,because if you do you'll can't register service to Jini Lookup
		System.setSecurityManager(new RMISecurityManager());
		
		//Create new RobotRoom
		RobotRoomSim room = new RobotRoomSim("RobotSim Rev5",0,0,409,409);

		//Create new Robot
		RobotImpl robot = new RobotImpl(350,350,'N',1,40);
		RobotImpl robot2 = new RobotImpl(10,20,'S',2,40);

		//Add robot and Blocks to the Room
		room.addObject(new Block(100,100,150,80,Color.green));
		room.addObject(new Block(220,310,80,50,Color.red));
		room.addObject(new Block(300,150,50,90,Color.blue));
		room.addObject(new Block(100,250,70,40,Color.yellow));
		room.addObject(robot);
		room.addObject(robot2);
		
		//Create new ControllerBoard for control robot
		/*
		ControllerBoard controller = new ControllerBoard("Robot Controller",robot);
		controller.addWindowListener(new WindowsListener());
		controller.setVisible(true); */

		//Create Display board that display the robot simulation
		DisplayFrame displayBoard = new DisplayFrame("Robot Simulation",room);
		//displayBoard.addWindowListener(new WindowsListener());
		displayBoard.setVisible(true);
		displayBoard.start();

		//Register RobotController to Jini as Service
		ServerListener sl = null;
		try{
			String[] groups = new String[]{""};
			LookupDiscovery reg = new LookupDiscovery(groups);
			//Parameter that pass to RobotControllerServiceImpl constructur is MAX_CLIENT and RobotRoom
			RobotRoomServiceImpl rrsi = (RobotRoomServiceImpl)new RobotRoomServiceImpl(1,(RobotRoom)room);
			
			sl = new ServerListener(reg,rrsi,displayBoard);
			reg.addDiscoveryListener(sl);
			
			//Create Attributes for This RobotRoomService
			Entry[] attr = new Entry[2];
			attr[0] = new Name("RobotRoomService");
			attr[1] = new ServiceInfo("RobotRoomService","CE Kmit'l","CE Kmit'l","0.5",null,null);

			//LookupDiscoveryManager mgr = new LookupDiscoveryManager(groups,null,null);
			JoinManager manager = new JoinManager(rrsi,attr,rrsi,reg,null);
			
			//Move from the top because WindowsListener need to use ServerListener
			//for Cancel Lease when Exit Program
			displayBoard.addWindowListener(new WindowsListener(manager));
			//System.out.println("Pass Register Process");
		} catch(Exception e){
			System.out.println("Can't Register Service to Jini network");
			System.out.println(e.toString());
		}

	}
}

class WindowsListener extends WindowAdapter{
	private JoinManager jManager;

	WindowsListener(JoinManager mgr){
		this.jManager = mgr;
	}

	public void windowClosing(WindowEvent e){
		try{ 
			jManager.terminate();
		} catch(Exception ex){
			System.out.println("Can't cancel all leases");
			System.out.println(ex);
		}
		System.exit(0);
	}
}