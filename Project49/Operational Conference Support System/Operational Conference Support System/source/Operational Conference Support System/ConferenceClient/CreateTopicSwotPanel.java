import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.awt.event.*;
import java.util.*;

public class CreateTopicSwotPanel extends JPanel {
	 private JPanel p1 = new JPanel();
	 private JPanel p2 = new JPanel();
	 private JPanel p3 = new JPanel();
		 
	 private ImageIcon	icob1 = new ImageIcon(CreateTopicSwotPanel.class.getResource("pleaseInputTopic.png"));
	 private ImageIcon	icob2 = new ImageIcon(CreateTopicSwotPanel.class.getResource("pushOkorReset.png"));
	
	 private JLabel	bHeader = new JLabel(icob1);
	 private JLabel	bFooter = new JLabel(icob2);
	 	 
	 private JTextField t1 = new JTextField(30); 
	 
	 private Vector vtext = new Vector();
	 
	 private GridBagConstraints gc =  new GridBagConstraints();
	 private DataInputStream din;
  	 private DataOutputStream dout;
  	 private Socket sock;
  	 
  	 private JLabel lnumber = new JLabel("Topic to Analysis");
  	 private JLabel lWaitForConfirm = new JLabel("Please Wait For Confirm");
  	 
  	 private String topic;
	 
	 public CreateTopicSwotPanel(Socket sock) {
	 	try {
	 		this.sock = sock;
	 		Init();
	 	} catch (Exception e) { e.printStackTrace(); }
	 }
	 private void Init() throws Exception {
	 	din = new DataInputStream(sock.getInputStream());
      	dout = new DataOutputStream(sock.getOutputStream());
      	
		t1.setFont(new Font("",0,30)); // size of text in textbox
		lnumber.setFont(new Font("",0,30)); // size of textlabel
		
		lWaitForConfirm.setFont(new Font("",0,30));
		
		setBackground(Color.WHITE);
	 	setLayout(new BorderLayout());
	 	
	 	p1.setLayout(new GridBagLayout());
	 	p2.setLayout(new GridBagLayout());
	 	p3.setLayout(new GridBagLayout());
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 	p3.setBackground(Color.WHITE);
	 	
	 	gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
		gc.weightx = 0; gc.weighty = 0; 	 	// resize follow size of screen x ,y
			
		gc.gridwidth = 10;gc.gridheight = 1;
		gc.gridx = 0; gc.gridy = 0;
		p1.add(bHeader,gc);
		
		gc.gridx = 1; gc.gridy = 1; 			// position of grid [like array two dimention]
		p2.add(t1,gc);
		
		gc.gridx = 0; gc.gridy = 0;
		p3.add(bFooter,gc);
	 	
	 	add(p1,BorderLayout.NORTH);
	 	add(p2,BorderLayout.CENTER); 
	 	add(p3,BorderLayout.SOUTH);
	 
	 	KeyListeners keyListeners = new KeyListeners();
	 	t1.addKeyListener(keyListeners);
	 }
	 private void clearText() throws Exception {
		t1.setText("");
	 }
	 private void getText() throws Exception {
		String topic = "";
	 	dout.writeInt(76);	
		topic = t1.getText();	
		dout.writeUTF(topic);
		dout.writeInt(20);
	 }
	 public void buttonOkPushed() throws Exception{
	 		getText();
			clearText();
	 }
	 public void buttonResetPushed() throws Exception{
	 		clearText();
	 }
	 private class KeyListeners implements KeyListener {
	 	public void keyPressed(KeyEvent evt) { 
	      	int key = evt.getKeyCode();
	      	try {
		      	if (key == KeyEvent.VK_ENTER) {
		        	          getText();
		    	              clearText();
			    }
			} catch(Exception ex) {}
	   }
	    
	   public void keyReleased(KeyEvent evt) {}
	   public void keyTyped(KeyEvent e)   {}
	}
} // end of class