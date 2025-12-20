import java.io.*;
import java.net.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class NoticePanel extends JPanel{
	private static JLabel lblrule;
	private static String msg;
	private GridBagConstraints gc = new GridBagConstraints();
	private ImageIcon iconOK;
	private JLabel labelOK;
  	private static DataOutputStream dout;
  	private Socket sock;
  	
  	public NoticePanel(Socket sock) {
		try {
			this.sock = sock;
			dout = new DataOutputStream(sock.getOutputStream());
			
			iconOK = new ImageIcon(NoticePanel.class.getResource("ok1.png"));
			labelOK = new JLabel(iconOK);
			
			setLayout(new GridBagLayout());
			lblrule = new JLabel("");
			lblrule.setFont(new Font("",0,30));
			
			setBackground(Color.WHITE);
			
			gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
			gc.ipadx = 5; gc.ipady = 5; // size of component
			gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
			gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
			add(lblrule,gc);
			
			// Add blank line
			JLabel lb = new JLabel("1");
			lb.setForeground(Color.WHITE);
			gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
			add(lb,gc);
			
			gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
			add(labelOK,gc);
			
			MouseListeners MouseListener = new MouseListeners();
		 	labelOK.addMouseListener(MouseListener);
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	public static void setTextDisplay(String disp, String n) {
		msg = n;

		lblrule.setText(disp);
		lblrule.setFont(new Font("",0,30));
	}

	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) { 
    		try {
				  if(e.getSource() == labelOK) {
				  	if(msg.equals("cancel"))
				  	{
				  		dout.writeInt(30);
				  		dout.writeUTF("cancel");
				  	}
			  								
				  	else if(msg.equals("recreate"))
				  	{
				  		dout.writeInt(30);
				  		dout.writeUTF("recreate");
				  	}				  		
				  }
		   	 }catch(Exception ex) {}
	    }

    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  }
	
} // End of class