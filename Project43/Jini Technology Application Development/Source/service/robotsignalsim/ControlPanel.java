package project.service.robotsignalsim;

import project.service.robotsignalsim.*;
import java.awt.*;
import java.awt.event.*;
import javax.comm.*;

public class ControlPanel extends Frame implements Runnable {
  //Auto Ping status ON=1 or OFF=0
  private int autoPingStatus = 0;

  //Use for open serial port
  private SerialConnection connection;
  private SerialParameters parameters;

  Panel mainPanel = new Panel();
  Button connectButton = new Button();
  Button disconnectButton = new Button();
  Button exitButton = new Button();
  Label idLabel = new Label();
  TextField robotIDField = new TextField();
  Button autoPingButton = new Button();
  Button pingButton = new Button();
  Button requestSendButton = new Button();
  Label label1 = new Label();
  TextField pingIntervalField = new TextField();
  Button alertButton = new Button();
  Button crashButton = new Button();
  TextArea sentField = new TextArea();
  public TextArea receiveField = new TextArea();
  private Thread myThread;

  public ControlPanel() {
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  public void run(){
	boolean getInterval = false;
	int sleepInterval = 5000; //Default Value
	while(true){
		if(autoPingStatus == 1){
			if(getInterval == false){
				sleepInterval = Integer.parseInt(this.pingIntervalField.getText());
				getInterval = true;
			}
			try{ Thread.sleep(sleepInterval);}
	  		catch(Exception e){}
			pingButton_actionPerformed(null);
		}
	}
  }

  public void setCommModule(SerialConnection conn,SerialParameters param){
  	this.connection = conn;
	this.parameters = param;
  }

  private void jbInit() throws Exception {
    autoPingButton.setBounds(new Rectangle(226, 50, 74, 24));
    autoPingButton.setFont(new java.awt.Font("SansSerif", 0, 10));
    autoPingButton.setLabel("ON");
    autoPingButton.addActionListener(new ControlPanel_autoPingButton_actionAdapter(this));
    mainPanel.setLayout(null);
    connectButton.setBounds(new Rectangle(21, 142, 76, 23));
    connectButton.setFont(new java.awt.Font("SansSerif", 0, 10));
    connectButton.setLabel("Connect");
    connectButton.addActionListener(new ControlPanel_connectButton_actionAdapter(this));
    disconnectButton.setBounds(new Rectangle(121, 142, 80, 23));
    disconnectButton.setFont(new java.awt.Font("SansSerif", 0, 10));
    disconnectButton.setLabel("Disconnect");
    disconnectButton.setEnabled(false);
    disconnectButton.addActionListener(new ControlPanel_disconnectButton_actionAdapter(this));
    exitButton.setBounds(new Rectangle(224, 143, 76, 23));
    exitButton.setFont(new java.awt.Font("SansSerif", 0, 10));
    exitButton.setLabel("Exit");
    exitButton.addActionListener(new ControlPanel_exitButton_actionAdapter(this));
    idLabel.setBounds(new Rectangle(19, 19, 51, 22));
    idLabel.setFont(new java.awt.Font("SansSerif", 0, 10));
    idLabel.setText("RobotID");
    robotIDField.setBounds(new Rectangle(71, 19, 28, 22));
    robotIDField.setFont(new java.awt.Font("SansSerif", 0, 15));
    robotIDField.setName("robotIDField");
    robotIDField.setText("1");
    this.setFont(new java.awt.Font("SansSerif", 0, 20));
    this.setTitle("Robot Signal Simulation");
    this.setResizable(false);
    pingButton.setBounds(new Rectangle(226, 91, 74, 34));
    pingButton.setFont(new java.awt.Font("SansSerif", 0, 10));
    pingButton.setLabel("Ping");
    pingButton.addActionListener(new ControlPanel_pingButton_actionAdapter(this));
    requestSendButton.setBounds(new Rectangle(226, 16, 74, 24));
    requestSendButton.setFont(new java.awt.Font("SansSerif", 0, 10));
    requestSendButton.setLabel("Req Send");
    requestSendButton.addActionListener(new ControlPanel_requestSendButton_actionAdapter(this));
    label1.setBounds(new Rectangle(17, 46, 142, 33));
    label1.setFont(new java.awt.Font("SansSerif", 0, 10));
    label1.setText("Auto Ping Interval (ms)");
    pingIntervalField.setBounds(new Rectangle(158, 50, 54, 24));
    pingIntervalField.setFont(new java.awt.Font("SansSerif", 0, 15));
    pingIntervalField.setText("5000");
    alertButton.setBounds(new Rectangle(22, 92, 75, 33));
    alertButton.setFont(new java.awt.Font("SansSerif", 0, 10));
    alertButton.setLabel("ALERT!");
    alertButton.addActionListener(new ControlPanel_alertButton_actionAdapter(this));
    crashButton.setBounds(new Rectangle(123, 92, 76, 33));
    crashButton.setFont(new java.awt.Font("SansSerif", 0, 10));
    crashButton.setLabel("CRASH!");
    crashButton.addActionListener(new ControlPanel_crashButton_actionAdapter(this));
    sentField.setBounds(new Rectangle(20, 183, 280, 112));
    sentField.setFont(new java.awt.Font("Courier", 0, 10));
    sentField.setEditable(false);
    receiveField.setBounds(new Rectangle(20, 300, 280, 116));
    receiveField.setFont(new java.awt.Font("Courier", 0, 10));
    receiveField.setEditable(false);
    this.add(mainPanel, BorderLayout.CENTER);
    mainPanel.add(label1, null);
    mainPanel.add(idLabel, null);
    mainPanel.add(robotIDField, null);
    mainPanel.add(pingIntervalField, null);
    mainPanel.add(autoPingButton, null);
    mainPanel.add(exitButton, null);
    mainPanel.add(connectButton, null);
    mainPanel.add(disconnectButton, null);
    mainPanel.add(pingButton, null);
    mainPanel.add(alertButton, null);
    mainPanel.add(crashButton, null);
    mainPanel.add(sentField, null);
    mainPanel.add(receiveField, null);
	mainPanel.add(requestSendButton, null);
	this.setSize(325,455);
	portClose();
  }

  public void portOpen(){
	disconnectButton.setEnabled(true);
	connectButton.setEnabled(false);
	pingButton.setEnabled(true);
	alertButton.setEnabled(true);
	crashButton.setEnabled(true);
	autoPingButton.setEnabled(true);
	requestSendButton.setEnabled(true);
  }

  public void portClose(){
	connectButton.setEnabled(true);
	disconnectButton.setEnabled(false);
	pingButton.setEnabled(false);
	alertButton.setEnabled(false);
	crashButton.setEnabled(false);
	autoPingButton.setEnabled(false);
	requestSendButton.setEnabled(false);
  }

  void crashButton_actionPerformed(ActionEvent e) {
	String command = new String("11110");
	command = command + int2bin(Integer.parseInt(this.robotIDField.getText()),3);
	connection.sendData(bin2int(command));
	this.sentField.append("CMD: crash!   BIN: "+command+"\n");
  }

  void autoPingButton_actionPerformed(ActionEvent e) {
    if(autoPingStatus == 0){
      this.start();
	  autoPingStatus = 1;
      autoPingButton.setLabel("OFF");
      pingButton.setEnabled(false);
	  robotIDField.setEditable(false);
	  pingIntervalField.setEditable(false);
    } else {
		this.stop();
        autoPingStatus = 0;
        autoPingButton.setLabel("ON");
		pingButton.setEnabled(true);
		robotIDField.setEditable(true);
		pingIntervalField.setEditable(true);
      }
  }

  void exitButton_actionPerformed(ActionEvent e) {
	connection.closeConnection();
    System.exit(0);
  }

  void connectButton_actionPerformed(ActionEvent e) {
			    
	try {
		  connection.openConnection();
	} catch (SerialConnectionException e2) {
		AlertDialog ad = new AlertDialog(this, 
						 "Error Opening Port!",
						 "Error opening port,",
						 e2.getMessage() + ".",
						 "Select new settings, try again.");
		return;
	  }
	portOpen();
  }

  void disconnectButton_actionPerformed(ActionEvent e) {
	connection.closeConnection();
	portClose();
  }

  void alertButton_actionPerformed(ActionEvent e) {
	String command = new String("11111");
	command = command + int2bin(Integer.parseInt(this.robotIDField.getText()),3);
	connection.sendData(bin2int(command));
	this.sentField.append("CMD: alert!   BIN: "+command+"\n");
  }

  void requestSendButton_actionPerformed(ActionEvent e) {
	String command = new String("11010");
	command = command + int2bin(Integer.parseInt(this.robotIDField.getText()),3);
	connection.sendData(bin2int(command));
	this.sentField.append("CMD: req_send   BIN: "+command+"\n");
  }

  void pingButton_actionPerformed(ActionEvent e) {
	String command = new String("11000");
	command = command + int2bin(Integer.parseInt(this.robotIDField.getText()),3);
	connection.sendData(bin2int(command));
	this.sentField.append("CMD: ping   BIN: "+command+"\n");
	//System.out.println(command);
	//System.out.println(bin2int(command));
  }

	public String int2bin(int i,int wantLength){
		int temp = i;
		String output = new String("");

		while(temp != 0){
			if((temp % 2) == 1){
				output = "1"+output;
				temp = temp/2;
			} else{
				output = "0"+output;
				temp = temp/2;
			  }
		}
	
		if(output.length() >= wantLength){
			output = output.substring(output.length()-wantLength);
			return output;
		}
		wantLength = wantLength-output.length();
		for(int w=1;w <= wantLength;w++){
			output = "0"+output;
		}
		return output;
	}

  public int bin2int(String s){
		int mul = 1;
		int sum=0;
		if (s.charAt(7)=='1'){
			sum = 1;
		}else if(s.charAt(0)=='0'){sum = 0;}
		for (int i=6;i>=0;i--){
			mul = mul*2;
			char ch = s.charAt(i);
			if(ch == '1'){
				sum = sum+mul;
			}
		}
		return sum;
   }

   public void receive(char data){
		this.receiveField.append("BIN: "+int2bin((int)data,8)+"    CHAR: "+data+"\n");
   }

   public void start(){
		this.myThread = new Thread(this);
		myThread.start();
   }

   public void stop(){
		this.myThread.stop();
   }
}

class ControlPanel_crashButton_actionAdapter implements java.awt.event.ActionListener {
  ControlPanel adaptee;

  ControlPanel_crashButton_actionAdapter(ControlPanel adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.crashButton_actionPerformed(e);
  }
}

class ControlPanel_autoPingButton_actionAdapter implements java.awt.event.ActionListener {
  ControlPanel adaptee;

  ControlPanel_autoPingButton_actionAdapter(ControlPanel adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.autoPingButton_actionPerformed(e);
  }
}

class WindowsListener extends WindowAdapter{

	public void windowClosing(WindowEvent e){
		System.exit(0);
	}
}

class ControlPanel_exitButton_actionAdapter implements java.awt.event.ActionListener {
  ControlPanel adaptee;

  ControlPanel_exitButton_actionAdapter(ControlPanel adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.exitButton_actionPerformed(e);
  }
}

class ControlPanel_connectButton_actionAdapter implements java.awt.event.ActionListener {
  ControlPanel adaptee;

  ControlPanel_connectButton_actionAdapter(ControlPanel adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.connectButton_actionPerformed(e);
  }
}

class ControlPanel_disconnectButton_actionAdapter implements java.awt.event.ActionListener {
  ControlPanel adaptee;

  ControlPanel_disconnectButton_actionAdapter(ControlPanel adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.disconnectButton_actionPerformed(e);
  }
}

class ControlPanel_alertButton_actionAdapter implements java.awt.event.ActionListener {
  ControlPanel adaptee;

  ControlPanel_alertButton_actionAdapter(ControlPanel adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.alertButton_actionPerformed(e);
  }
}

class ControlPanel_pingButton_actionAdapter implements java.awt.event.ActionListener {
  ControlPanel adaptee;

  ControlPanel_pingButton_actionAdapter(ControlPanel adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.pingButton_actionPerformed(e);
  }
}

class ControlPanel_requestSendButton_actionAdapter implements java.awt.event.ActionListener {
  ControlPanel adaptee;

  ControlPanel_requestSendButton_actionAdapter(ControlPanel adaptee) {
    this.adaptee = adaptee;
  }

  public void actionPerformed(ActionEvent e) {
    adaptee.requestSendButton_actionPerformed(e);
  }
}