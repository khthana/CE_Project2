package project.service.robotsim;

import project.common.*;
import project.service.robotsim.*;

import java.io.*;

public class RobotImpl extends RobotSimComponent
				   implements Runnable,Serializable,Robot{
	
	public RobotRoomSim room;

	public char direction;
	public int robotID;

	public char move_direction;
	public boolean power_on = false;
	public Thread myThread = null;

	RobotImpl(int x,int y,char d,int id,int size){
		pos_x = x;
		pos_y = y;
		direction = d;
		robotID = id;
		move_direction = 'S';
		width = size;
		height = size;
	}

	public void setRoom(RobotRoomSim r){
		this.room = r;
	}

	public int getID(){
		return robotID;
	}

	public void run(){
		while(true){
			if(power_on == true){
				try{ Thread.sleep(20);}
	  			catch(Exception e){}
				switch(move_direction){
					case 'F':this.moveUp(1);break;
					case 'B':this.moveDown(1);break;
					case 'S':;break;
				}
				if(room.checkHit(this) == RobotRoomEvent.HIT_BLOCK){
					System.out.println("ROBOT("+robotID+"):Hit block");
					room.sendEvent(RobotRoomEvent.HIT_BLOCK,robotID);
					if(move_direction == 'F'){
						this.moveDown(2);
						this.stop_move();
					} else if(move_direction == 'B'){
						this.moveUp(2);
						this.stop_move();
					}
				} else
				if(room.checkHit(this) == RobotRoomEvent.HIT_BORDER){
					System.out.println("ROBOT("+robotID+"):Hit border");
					room.sendEvent(RobotRoomEvent.HIT_BORDER,robotID);
					if(move_direction == 'F'){
						this.moveDown(2);
						this.stop_move();
					} else if(move_direction == 'B'){
						this.moveUp(2);
						this.stop_move();
					}
				} else
				if(room.checkHit(this) == RobotRoomEvent.HIT_ROBOT){
					System.out.println("ROBOT("+robotID+"):Hit robot");
					room.sendEvent(RobotRoomEvent.HIT_ROBOT,robotID);
					if(move_direction == 'F'){
						this.moveDown(2);
						this.stop_move();
					} else if(move_direction == 'B'){
						this.moveUp(2);
						this.stop_move();
					}
				}
			}
		}
	}

	private void moveUp(int steps){
		switch(direction){
			case 'N':pos_y = pos_y-steps;break;
			case 'E':pos_x = pos_x+steps;break;
			case 'W':pos_x = pos_x-steps;break;
			case 'S':pos_y = pos_y+steps;break;
		}
	}

	private void moveDown(int steps){
		switch(direction){
			case 'N':pos_y = pos_y+steps;break;
			case 'E':pos_x = pos_x-steps;break;
			case 'W':pos_x = pos_x+steps;break;
			case 'S':pos_y = pos_y-steps;break;
		}
	}

	public void forward(){
		if(power_on)
		this.move_direction = 'F';
	}

	public void backward(){
		if(power_on)
		this.move_direction = 'B';
	}

	public void stop_move(){
		this.move_direction = 'S';
	}


	public void turnRight(){
		if(power_on)
		switch(direction){
			case 'N':direction='E';break;
			case 'E':direction='S';break;
			case 'W':direction='N';break;
			case 'S':direction='W';break;
		}
	}

	public void turnLeft(){
		if(power_on)
		switch(direction){
			case 'N':direction='W';break;
			case 'E':direction='N';break;
			case 'W':direction='S';break;
			case 'S':direction='E';break;
		}
	}

	public void turnOn(){
		this.power_on = true;
		this.start();
	}

	public void turnOff(){
		this.power_on = false;
		//this.stop();
		this.move_direction = 'S';
	}

	public void start(){
		if(this.myThread == null){
			myThread = new Thread(this);
			myThread.start();
		}
	}

	public void stop(){
		//myThread.destroy();
		//myThread = null;
	}

}