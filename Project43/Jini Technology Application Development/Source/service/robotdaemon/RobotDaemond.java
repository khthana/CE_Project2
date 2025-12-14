package project.service.robotdaemon;

import project.common.*;
import project.service.robotdaemon.*;

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

public class RobotDaemond {

	private RobotRoomImpl robotRoom;
	private ServerListener sl;
	private LookupDiscovery reg;
	private RobotRoomServiceImpl rrsi;
	private Entry[] attr;
	private JoinManager joinManager;

	private DaemondBrowser browser;
	
	public RobotDaemond(){
		//Create Service Browser
		browser = new DaemondBrowser(this);
		browser.setVisible(true);
	}

	public static void main(String[] args) throws Exception{
		RobotDaemond daemond = new RobotDaemond();
	}

	public void startService(String serviceName,String port,int baud,long duration,long expireCheckInterval){
		//Create new Room and Open COM port
		robotRoom = new RobotRoomImpl(port,baud,duration,expireCheckInterval,browser);
		robotRoom.startConnection();

		//Do not forget this line,because if you don't you'll can't register service to Jini LookupService.
		//And have to set this SecurityManager AFTER! open COM port.
		System.setSecurityManager(new RMISecurityManager());

		//Register RobotRoom to Jini as a Service
		sl = null;
		try{
			String[] groups = new String[]{""};
			reg = new LookupDiscovery(groups);
			//Parameter that pass to RobotControllerServiceImpl constructur is MAX_CLIENT and RobotRoom
			rrsi = (RobotRoomServiceImpl)new RobotRoomServiceImpl(1,(RobotRoom)robotRoom);
			
			sl = new ServerListener(reg,rrsi,browser);
			reg.addDiscoveryListener(sl);
			
			//Create Attributes for This RobotRoomService
			attr = new Entry[2];
			attr[0] = new Name(serviceName);
			attr[1] = new ServiceInfo("RobotRoomService","CE Kmit'l","CE Kmit'l","0.5",null,null);

			//LookupDiscoveryManager mgr = new LookupDiscoveryManager(groups,null,null);
			joinManager = new JoinManager(rrsi,attr,rrsi,reg,null);
			
			//browser.display("Finish starting service");
		} catch(Exception e){
			browser.display("Can't Register Service to Jini network");
			System.out.println(e.toString());
		}
	}
	
	public void stopService(){
		//Stop Jini Service
		try{ 
			if(joinManager != null) joinManager.terminate();
		} catch(Exception ex){
			browser.display("ERROR:Can't cancel all leases");
		}
		System.setSecurityManager(null); 
		browser.display("Service stoped.");
		//Stop Listen on port
		robotRoom.stopConnection();
		browser.display("Port closed.");
	}

	public void systemExit(){
		try{ 
			if(joinManager != null) joinManager.terminate();
		} catch(Exception ex){
			System.out.println("ERROR:Can't cancel all leases");
			System.out.println(ex);
		}
		System.exit(0);		
	}
}