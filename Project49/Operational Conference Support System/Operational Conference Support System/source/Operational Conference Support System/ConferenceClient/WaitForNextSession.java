import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.awt.event.*;
import java.util.*;

class WaitForNextSession extends JPanel {
	 private JPanel p1 = new JPanel();
	 private JPanel p2 = new JPanel();
	
	 private ImageIcon	icob1 = new ImageIcon(WaitForNextSession.class.getResource("waitForNextSession.png"));
     private JLabel	b1 = new JLabel(icob1);
	 
	 private GridBagConstraints gc = new GridBagConstraints();
	 private DataInputStream din;
  	 private DataOutputStream dout;
  	 private Socket sock;
  
   public WaitForNextSession(Socket sock) {
	 	try {
	 		this.sock = sock;
	 		Init();
	 	} catch (Exception e) { e.printStackTrace(); }
	 }
	 
   private void Init() throws Exception {
	 	din   = new DataInputStream(sock.getInputStream());
      	dout  = new DataOutputStream(sock.getOutputStream());
      					
		setBackground(Color.WHITE);
	 	setLayout(new BorderLayout());
	 	
	 	p1.setLayout(new GridBagLayout());
	 	p2.setLayout(new GridBagLayout());
	 
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 	
	 	gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.CENTER;
		gc.insets.top = 0; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
	
		gc.gridwidth = 10; gc.gridheight = 1;		
		gc.gridx = 0 ;gc.gridy = 0;
		gc.weighty = 0;gc.weightx = 0;
		p1.add(b1,gc);
	
	 	add(p1,BorderLayout.CENTER);
	}
}