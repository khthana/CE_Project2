package project.service.robotsignalsim;

import project.service.robotsignalsim.*;
import java.awt.event.*;

public class RobotSignalSim {

  public static void main(String[] args){
    RobotSignalSim rss = new RobotSignalSim();
  
	ControlPanel myPanel = new ControlPanel();
	
	SerialParameters parameters = new SerialParameters("COM2");
	SerialConnection connection = new SerialConnection(myPanel,parameters,myPanel.receiveField);
	
    myPanel.addWindowListener(new WindowsListener());
    myPanel.setCommModule(connection,parameters);
	myPanel.setVisible(true);
  }
}