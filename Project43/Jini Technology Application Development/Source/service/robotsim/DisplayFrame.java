package project.service.robotsim;

import project.service.robotsim.*;
import project.common.*;

import java.awt.Color;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.*;
import java.lang.*;
import java.net.*;
import javax.swing.*;
import java.util.*;

public class DisplayFrame extends JFrame implements Runnable{
	protected RobotImpl robot;
	
	protected RobotRoomSim room;
	
	protected Thread myThread;

	protected Graphics offScreenG;
	protected Image screenBuffer;
	protected Image robot_forward;
	protected Image robot_left;
	protected Image robot_right;
	protected Image robot_back;

	Toolkit toolkit = Toolkit.getDefaultToolkit();

	protected boolean firstInitialize = true;
	protected String power_string = new String("");

	DisplayFrame(String s,RobotRoomSim r){
		super(s);
		room = r;
		this.setSize(450,450);
		this.setBackground(Color.black);
		this.setFont(new Font("MS Sans Serif",Font.PLAIN,10));
	}

	public void run(){
		while(true){
	  		try{ Thread.sleep(70);}
	  		catch(Exception e){}
	  		repaint();	
		}
	}

	public void update(Graphics g){
		paint(g);
	}

	public void setRoom(RobotRoomSim r){
		this.room = r;
	}

	public void paint(Graphics g){
		if (firstInitialize == true){
			screenBuffer = createImage(410,410);
			offScreenG = screenBuffer.getGraphics();
			robot_forward = toolkit.getImage("robot_forward.gif");
			robot_left = toolkit.getImage("robot_left.gif");
			robot_right = toolkit.getImage("robot_right.gif");
			robot_back = toolkit.getImage("robot_back.gif");
			firstInitialize = false;
		}
		offScreenG.setColor(Color.black);
		offScreenG.fillRect(0,0,410,410);
		room.draw(offScreenG);
		Robot[] allRobot = room.getAllRobot();
		for(int i=0;i<allRobot.length;i++){
			drawRobot(offScreenG,(RobotImpl)allRobot[i]);
		}
		g.drawImage(screenBuffer,20,30,this);
	}
	
	public void start(){
		myThread = new Thread(this);
		myThread.start();
	}

	public void drawRobot(Graphics g,RobotImpl robot){
		if (robot.direction == 'N'){
			g.drawImage(robot_forward,robot.pos_x,robot.pos_y,this);
		} else
		if (robot.direction == 'E'){
			g.drawImage(robot_right,robot.pos_x,robot.pos_y,this);
		} else
		if (robot.direction == 'W'){
			g.drawImage(robot_left,robot.pos_x,robot.pos_y,this);
		} else
		if (robot.direction == 'S'){
			g.drawImage(robot_back,robot.pos_x,robot.pos_y,this);
		}
		
		if(robot.power_on){
			power_string = " ON";
		} else power_string = "OFF";
		g.setColor(Color.yellow);
		g.drawString("Power:"+power_string,robot.pos_x-5,robot.pos_y-10);
		g.drawString("ID:"+robot.robotID,robot.pos_x+7,robot.pos_y+53);
	}
};