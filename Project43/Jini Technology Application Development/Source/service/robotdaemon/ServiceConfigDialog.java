package project.service.robotdaemon;

import project.common.*;
import project.service.robotdaemon.*;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class ServiceConfigDialog extends Dialog {

  public boolean okStatus = false;

  Panel panel1 = new Panel();
  Label label1 = new Label();
  Label label2 = new Label();
  Label label3 = new Label();
  Label label4 = new Label();
  TextField serviceNameField = new TextField();
  Choice portChoice = new Choice();
  Choice baudChoice = new Choice();
  TextField dtimeField = new TextField();
  Label label5 = new Label();
  Button okButton = new Button();
  Button cancelButton = new Button();
  Label label6 = new Label();
  TextField expireIntervalField = new TextField();
  Label label7 = new Label();

  public ServiceConfigDialog(Frame frame, String title, boolean modal) {
    super(frame, title, modal);
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try  {
      jbInit();
      add(panel1);
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }
  }

  public ServiceConfigDialog(Frame frame) {
    this(frame, "", false);
  }

  public ServiceConfigDialog(Frame frame, boolean modal) {
    this(frame, "", modal);
  }

  public ServiceConfigDialog(Frame frame, String title) {
    this(frame, title, false);
  }

  void jbInit() throws Exception {
    label1.setBounds(new Rectangle(13, 12, 91, 23));
    label1.setFont(new java.awt.Font("SansSerif", 0, 10));
    label1.setText("Service Name");
    panel1.setLayout(null);
    label2.setBounds(new Rectangle(14, 44, 92, 23));
    label2.setFont(new java.awt.Font("SansSerif", 0, 10));
    label2.setText("Listen on port");
    label3.setBounds(new Rectangle(13, 76, 91, 23));
    label3.setFont(new java.awt.Font("SansSerif", 0, 10));
    label3.setText("Baud rate");
    label4.setBounds(new Rectangle(13, 110, 98, 23));
    label4.setFont(new java.awt.Font("SansSerif", 0, 10));
    label4.setText("Robot duration time");
    serviceNameField.setBounds(new Rectangle(118, 13, 160, 20));
    serviceNameField.setFont(new java.awt.Font("Serif", 0, 10));
    serviceNameField.setText("RobotDaemondService");
    portChoice.setBounds(new Rectangle(118, 44, 76, 21));
    portChoice.setFont(new java.awt.Font("Serif", 0, 10));
	portChoice.addItem("COM1");
	portChoice.addItem("COM2");
    baudChoice.setBounds(new Rectangle(118, 76, 75, 21));
    baudChoice.setFont(new java.awt.Font("Serif", 0, 10));
	baudChoice.addItem("110");
	baudChoice.addItem("300");
	baudChoice.addItem("1200");
	baudChoice.addItem("2400");
	baudChoice.addItem("4800");
	baudChoice.addItem("9600");
    dtimeField.setBounds(new Rectangle(118, 111, 57, 20));
    dtimeField.setFont(new java.awt.Font("Serif", 0, 10));
    dtimeField.setText("5000"); //Default = 10 seconds
    label5.setBounds(new Rectangle(185, 109, 60, 23));
    label5.setFont(new java.awt.Font("Serif", 0, 10));
    label5.setText("Milliseconds");
    okButton.setBounds(new Rectangle(60, 182, 72, 23));
    okButton.setFont(new java.awt.Font("Serif", 0, 10));
    okButton.setLabel("OK");
    okButton.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        okButton_actionPerformed(e);
      }
    });
    cancelButton.setBounds(new Rectangle(155, 182, 76, 23));
    cancelButton.setLabel("Cancel");
    cancelButton.addActionListener(new java.awt.event.ActionListener() {

      public void actionPerformed(ActionEvent e) {
        cancelButton_actionPerformed(e);
      }
    });
    label6.setBounds(new Rectangle(13, 142, 99, 23));
    label6.setFont(new java.awt.Font("SansSerif", 0, 10));
    label6.setText("Expire Interval");
    expireIntervalField.setBounds(new Rectangle(118, 145, 57, 20));
    expireIntervalField.setFont(new java.awt.Font("SansSerif", 0, 10));
    expireIntervalField.setText("3000");
    label7.setText("Milliseconds");
    label7.setFont(new java.awt.Font("Serif", 0, 10));
    label7.setBounds(new Rectangle(186, 143, 60, 23));
    panel1.add(label4, null);
    panel1.add(label1, null);
    panel1.add(label5, null);
    panel1.add(baudChoice, null);
    panel1.add(dtimeField, null);
    panel1.add(serviceNameField, null);
    panel1.add(portChoice, null);
    panel1.add(label2, null);
    panel1.add(label3, null);
    panel1.add(label6, null);
    panel1.add(expireIntervalField, null);
    panel1.add(label7, null);
    panel1.add(cancelButton, null);
    panel1.add(okButton, null);
    this.setSize(300,240);
    this.setResizable(false);
  }

  protected void processWindowEvent(WindowEvent e) {
    if(e.getID() == WindowEvent.WINDOW_CLOSING) {
      cancel();
    }
    super.processWindowEvent(e);
  }

  void cancel() {
    okStatus = false;
	dispose();
  }

  void okButton_actionPerformed(ActionEvent e) {
    okStatus = true;
	this.hide();
  }

  void cancelButton_actionPerformed(ActionEvent e) {
	cancel();
  }
}