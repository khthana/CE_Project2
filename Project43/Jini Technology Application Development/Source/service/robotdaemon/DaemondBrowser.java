package project.service.robotdaemon;

import project.common.*;
import project.service.robotdaemon.*;
import java.awt.*;
import java.awt.event.*;

public class DaemondBrowser extends Frame implements Displayer{
  Panel panel1 = new Panel();
  TextArea eventDisplayArea = new TextArea();
  Label label1 = new Label();
  Button startServiceButton = new Button();
  Button stopServiceButton = new Button();
  Button exitButton = new Button();
  List robotList = new List();
  Label label2 = new Label();

  private ServiceConfigDialog configDialog;

  public RobotDaemond parent;

  public DaemondBrowser(RobotDaemond d) {
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
	this.parent = d;
	configDialog = new ServiceConfigDialog(this,"Service Configuration",true);
  }

  private void jbInit() throws Exception {
    label2.setBounds(new Rectangle(17, 11, 32, 21));
    label2.setText("Robots");
    this.setFont(new java.awt.Font("SansSerif", 0, 10));
    this.setTitle("RobotDaemond Service");
    panel1.setLayout(null);
    eventDisplayArea.setBounds(new Rectangle(17, 162, 401, 131));
    eventDisplayArea.setEditable(false);
    label1.setBounds(new Rectangle(18, 138, 107, 24));
    label1.setText("Event");
    startServiceButton.setBounds(new Rectangle(324, 36, 92, 21));
    startServiceButton.setLabel("Start Service");
    startServiceButton.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        startServiceButton_actionPerformed(e);
      }
    });
    stopServiceButton.setBounds(new Rectangle(324, 71, 92, 21));
    stopServiceButton.setLabel("Stop Service");
    stopServiceButton.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        stopServiceButton_actionPerformed(e);
      }
    });
    exitButton.setBounds(new Rectangle(324, 107, 91, 21));
    exitButton.setLabel("Exit");
    exitButton.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        exitButton_actionPerformed(e);
      }
    });
    robotList.setBounds(new Rectangle(17, 35, 276, 95));
    panel1.setBackground(new java.awt.Color(210, 208, 200));
    this.add(panel1, BorderLayout.CENTER);
    panel1.add(eventDisplayArea, null);
    panel1.add(label1, null);
    panel1.add(robotList, null);
    panel1.add(startServiceButton, null);
    panel1.add(stopServiceButton, null);
    panel1.add(exitButton, null);
    panel1.add(label2, null);
	this.setSize(435,335);
	this.setResizable(false);
	this.addWindowListener(new java.awt.event.WindowAdapter(){

		public void windowClosing(WindowEvent e){
			systemExit();
		}
	});
  }

  public void display(String input){
	this.eventDisplayArea.append(input+"\n");
  }

  public void addRobot(int ID){
	robotList.add("Robot ID "+ID);
  }

  public void removeRobot(int ID){
	robotList.remove("Robot ID "+ID);
  }
	
  public void portReady(){
	this.startServiceButton.setEnabled(false);
	this.stopServiceButton.setEnabled(true);
  }

  public void portNotReady(){
	this.startServiceButton.setEnabled(true);
	this.stopServiceButton.setEnabled(false);
  }

  void startServiceButton_actionPerformed(ActionEvent e) {
	this.eventDisplayArea.setText("");
	this.display("Trying to start service...");
	this.configDialog.show();
	if(configDialog.okStatus == true){
		//Get value from dialog
		String name = configDialog.serviceNameField.getText();
		String port = configDialog.portChoice.getSelectedItem();
		int baud = Integer.parseInt(configDialog.baudChoice.getSelectedItem());
		long duration;
		long expireCheckInterval;
		try{
			duration = Long.parseLong(configDialog.dtimeField.getText());
			expireCheckInterval = Long.parseLong(configDialog.expireIntervalField.getText());
		} catch(NumberFormatException nfe){
			this.display("ERROR: Error in some field, please try again");
			return;
		}

		this.parent.startService(name,port,baud,duration,expireCheckInterval);
		this.portReady();
	} else{
		this.display("Starting service canceled.");
		this.portNotReady();
	  }
  }

  void stopServiceButton_actionPerformed(ActionEvent e) {
	this.display("Trying to stop service...");
	this.parent.stopService();
	this.portNotReady();
  }

  void exitButton_actionPerformed(ActionEvent e) {
	systemExit();
  }

  public void systemExit(){
	this.parent.systemExit();
  }
} 