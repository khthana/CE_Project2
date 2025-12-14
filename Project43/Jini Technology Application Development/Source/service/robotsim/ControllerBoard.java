package project.service.robotsim;

import project.common.*;
import project.service.robotsim.*;
import java.awt.Frame;
import java.awt.Button;
import java.awt.event.*;

public class ControllerBoard extends Frame{
	private Button upButton = new Button("Move up");
	private Button downButton = new Button("Move down");
	private Button leftButton = new Button("Turn left");
	private Button rightButton = new Button("Turn right");
	public Button turnOnButton = new Button("SW/ON");
	public Button turnOffButton = new Button("SW/OFF");
	private Robot robot;

	ControllerBoard(String s,Robot r){
		super(s);
		this.setLayout(null);
		this.setSize(120,150);
		this.robot = r;
		ControllerBoardListener cbl = new ControllerBoardListener(robot,this);

		upButton.setBounds(35,30,50,20);upButton.addActionListener(cbl);this.add(upButton);
		leftButton.setBounds(5,60,50,20);leftButton.addActionListener(cbl);this.add(leftButton);
		rightButton.setBounds(65,60,50,20);rightButton.addActionListener(cbl);this.add(rightButton);
		downButton.setBounds(35,90,50,20);downButton.addActionListener(cbl);this.add(downButton);
		turnOnButton.setBounds(5,120,50,20);turnOnButton.addActionListener(cbl);this.add(turnOnButton);
		turnOffButton.setBounds(65,120,50,20);turnOffButton.addActionListener(cbl);this.add(turnOffButton);

		turnOffButton.setEnabled(false);
	}
}

class ControllerBoardListener implements ActionListener{
	
	private Robot robot;
	private ControllerBoard parrent;

	ControllerBoardListener(Robot r,ControllerBoard cb){
		super();
		this.robot = r;
		this.parrent = cb;
	}

	public void actionPerformed(ActionEvent e){
		String temp = new String("");
		temp = e.getActionCommand();
		System.out.println("You pressed "+temp);
		if(temp.equals("Move up")){
			robot.forward();
		}
		if(temp.equals("Move down")){
			robot.backward();
		}
		if(temp.equals("Turn left")){
			robot.turnLeft();
		}
		if(temp.equals("Turn right")){
			robot.turnRight();
		}
		if(temp.equals("SW/ON")){
			robot.turnOn();
			parrent.turnOnButton.setEnabled(false);
			parrent.turnOffButton.setEnabled(true);
		}
		if(temp.equals("SW/OFF")){
			robot.turnOff();
			parrent.turnOffButton.setEnabled(false);
			parrent.turnOnButton.setEnabled(true);
		}
	}
}