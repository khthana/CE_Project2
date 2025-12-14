package project.service.robotsim;

import project.common.*;
import project.service.robotsim.*;

import java.util.*;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.image.*;
import java.io.*;
import java.rmi.*;
import java.rmi.server.*;

public class RobotRoomSim implements Serializable,RobotRoom{
	
	public static final int NO_HIT = 0;
	public static final int HIT_BLOCK = 1;
	public static final int HIT_ROBOT = 2;
	public static final int HIT_BORDER = 3;

	public String roomName;
	public Hashtable robots = new Hashtable();
	public Vector blocks = new Vector();

	protected ServerDelivery sender;

	public int x_min;
	public int y_min;
	public int x_max;
	public int y_max;
	public int width;
	public int height;

	RobotRoomSim(String s,int x,int y,int w,int h) throws RemoteException{
		this.roomName = s;
		this.x_min = x;
		this.y_min = y;
		this.width = w;
		this.height = h;
		this.x_max = x_min + height;
		this.y_max = y_min + width;
		this.sender = sender;
	}

	public void setSender(ServerDelivery sender){
		this.sender = sender;
	}

	public void addObject(Object obj){
		if(obj instanceof RobotImpl){
			RobotImpl r = (RobotImpl)obj;
			r.setRoom(this);
			robots.put(new Integer(r.getID()),r);
		} else {
			blocks.add(obj);
		}
	}

	public void draw(Graphics g){		
		//Draw Blocks
		Enumeration e = blocks.elements();
		while(e.hasMoreElements()){
			Drawable obj = (Drawable)e.nextElement();
			obj.draw(g);
		}
		//Draw Border
		g.setColor(Color.red);
		g.drawRect(x_min,y_min,width,height);
	}

	public int checkHit(RobotSimComponent rsc){
		//Check if "rsc" hits some block
		Enumeration e = blocks.elements();
		while(e.hasMoreElements()){
			Block obj = (Block)e.nextElement();
			if(obj.checkHit(rsc)){
				return HIT_BLOCK;
			}
		}
		//Check if "rsc" hits some robot
		Enumeration e2 = robots.keys();
		while(e2.hasMoreElements()){
			RobotImpl obj = (RobotImpl)robots.get(e2.nextElement());
			if(obj != rsc){
				if(obj.checkHit(rsc)){
					return HIT_ROBOT;
				}
			}
		}
		//Check if "rsc" this the border
		if(rsc.pos_x <= this.x_min || rsc.pos_y <= this.y_min || rsc.pos_x+rsc.height >= this.x_max || rsc.pos_y+rsc.width >= this.y_max){
			return HIT_BORDER;
		} else return NO_HIT;
	}

	public int[] getAllRobotID(){
		Enumeration e = robots.keys();
		int[] robotID = new int[robots.size()];
		for(int i=0;e.hasMoreElements();i++){
			Robot robot = (Robot)robots.get(e.nextElement());
			robotID[i] = robot.getID();
		}
		return robotID;
	}

	public Robot[] getAllRobot(){
		Enumeration e = robots.keys();
		Robot[] allRobot = new Robot[robots.size()];
		for(int i=0;e.hasMoreElements();i++){
			Robot robot = (Robot)robots.get(e.nextElement());
			allRobot[i] = robot;
		}
		return allRobot;
	}

	public Robot getRobot(int ID){
		return (Robot)robots.get(new Integer(ID));
	}

	public void sendEvent(int type,int fromRobot){
		sender.deliver(type,fromRobot);
	}

	public void display(String s){
		System.out.println(s);
	}
}