import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;

public class WaitConfirmTopicSwotPanel extends JPanel {
	private JLabel lblrule;
	private GridBagConstraints gc = new GridBagConstraints();
	private static JLabel lblname = new JLabel("");
	private static JLabel lblstatus = new JLabel("");
	private JLabel lb1 = new JLabel("1");
	private JLabel lb2 = new JLabel("1");
	private JLabel lbx = new JLabel("You are ");
	private JLabel lby = new JLabel(" in the system");
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
	
	public WaitConfirmTopicSwotPanel(Socket sock) {
		try {
			this.sock = sock;
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() throws Exception{
		din = new DataInputStream(sock.getInputStream());
      	dout = new DataOutputStream(sock.getOutputStream());
		
		setLayout(new GridBagLayout());
		lblrule = new JLabel("SWOT ANALYSIS");
		lblrule.setFont(new Font("",0,30));
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,40));
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,40));
		lbx.setFont(new Font("",0,30));
		lby.setFont(new Font("",0,30));
		
		setBackground(Color.WHITE);
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.ipadx = 5; gc.ipady = 5; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(lblrule,gc);
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		add(lb1,gc);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		add(lblname,gc);
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		add(lb2,gc);
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		add(lblstatus,gc);
	}
	public static void setWelcome(String name,String stat) {
		lblname.setText(name);
		lblstatus.setText("You are " + stat + " in the system.");
		lblname.setFont(new Font("",0,50));
		lblstatus.setFont(new Font("",0,40));
	}
} // End of class