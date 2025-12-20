import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.awt.*;
import java.awt.event.*;

public class PermitPanel extends JPanel {
	
	private JButton bok,bcancel;
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
  	private static String whois;
  	private JLabel b1,b2;
  	private static JLabel lname = new JLabel();
  	private JLabel lb = new JLabel("1");
	private ImageIcon icob1,icob2;
	private GridBagConstraints gc = new GridBagConstraints();
	
	public PermitPanel(Socket sock) {
		try {
			this.sock = sock;
			Init();
			din = new DataInputStream(this.sock.getInputStream());
      	dout = new DataOutputStream(this.sock.getOutputStream());
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() {
		setLayout(new GridBagLayout());
		setBackground(Color.WHITE);
		icob1 = new ImageIcon(PermitPanel.class.getResource("accept.png"));
		icob2 = new ImageIcon(PermitPanel.class.getResource("declide.png"));
		b1 = new JLabel(icob1); b2 = new JLabel(icob2);
		lname.setFont(new Font("",0,30));
		lb.setForeground(Color.WHITE);
		lb.setFont(new Font("",0,30));
		
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.ipadx = 5; gc.ipady = 5; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(lname,gc);
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		add(lb,gc);
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		add(b1,gc);
	 	gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		add(b2,gc);
		
		MouseListeners mouseslistener = new MouseListeners();
		b1.addMouseListener(mouseslistener);
		b2.addMouseListener(mouseslistener);
	}
	public static void setWhois(String whoiss) {
		whois = whoiss;
		lname.setText(whois + " ต้องการใช้งานโปรเจคเตอร์");
	}
	
	// Listener button event
 	
	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) { 
    		try {
		      if(e.getSource() == b1) { // per mit ok
		      	dout.writeInt(14);
		      	dout.writeUTF(whois);
		      	Chairman.prevPanel();
		      } else if(e.getSource() == b2) { 
		      	Chairman.prevPanel();
		      }
		   } catch(Exception ex) {}
    	}
    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  }
	
} // End of class