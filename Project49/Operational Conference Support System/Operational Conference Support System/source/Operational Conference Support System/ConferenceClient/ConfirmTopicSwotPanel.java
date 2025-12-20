import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.applet.*;
import java.awt.event.*;
import java.util.*;

public class ConfirmTopicSwotPanel extends JPanel {
	private JPanel p1 = new JPanel();
	private JPanel p2 = new JPanel();
	private JPanel p3 = new JPanel();
	
	private ImageIcon	icob1 = new ImageIcon(CreateTopicSwotPanel.class.getResource("pushOkorCancel.png"));
	 
	 private JLabel	bFooter = new JLabel(icob1);
	
	private JLabel headerSwot;
	private JLabel headerTopic;
	private GridBagConstraints gbc;
	private GridBagLayout gbl;
	private static JLabel lTopicName = new JLabel("");
	private JLabel lb1 = new JLabel("1");
	private JLabel lb2 = new JLabel("1");
	
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
  	
	private static String sTopicName = "" ;
	
	public ConfirmTopicSwotPanel(Socket sock) {
		try {
			this.sock = sock;
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() throws Exception{
		din = new DataInputStream(sock.getInputStream());
      	dout = new DataOutputStream(sock.getOutputStream());
		gbc  = new GridBagConstraints();
		gbl = new GridBagLayout();
		
		setLayout(new BorderLayout());
		setBackground(Color.WHITE);
		
		p1.setLayout(new GridBagLayout());
	 	p2.setLayout(new GridBagLayout());
	 	p3.setLayout(new GridBagLayout());
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 	p3.setBackground(Color.WHITE);
		
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,40));
		
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,40));
		
		//##### Component ################
		headerSwot = new JLabel("การวิเคราะห์สถานะและสถานการณ์");
		headerSwot.setFont(new Font("",0,30));
		headerTopic = new JLabel("หัวข้อ : ");
		headerTopic.setFont(new Font("",0,30));
		//###### End Component ##############
	 	
	 	gbc.anchor = GridBagConstraints.CENTER;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.gridwidth = 10;gbc.gridheight = 1;
	
		gbc.gridx = 0; gbc.gridy = 1; // position of grid [like array two dimention]
		p1.add(lb1,gbc);
		gbc.gridx = 0; gbc.gridy = 2; // position of grid [like array two dimention]
		p2.add(headerSwot,gbc);
		
		gbc.gridwidth = 1;gbc.gridheight = 1;
		gbc.gridx = 0; gbc.gridy = 3; // position of grid [like array two dimention]
		p2.add(headerTopic,gbc);
		gbc.gridx = 5; gbc.gridy = 3; // position of grid [like array two dimention]
		p2.add(lTopicName,gbc);
	
		gbc.gridwidth = 10;gbc.gridheight = 1;
		gbc.fill = GridBagConstraints.NONE;
		gbc.gridx = 0; gbc.gridy = 0;
		p3.add(bFooter,gbc);
				
		add(p1,BorderLayout.NORTH);
		add(p2,BorderLayout.CENTER);
		add(p3,BorderLayout.SOUTH);
	}
	
	public static void setTopic(String topic) {
		sTopicName = topic;
		lTopicName.setText(topic);
		lTopicName.setFont(new Font("",0,30));
	}
	public void buttonOkPushed() throws Exception{
	 		dout.writeInt(72);
			dout.writeUTF(sTopicName);
	 }
	 public void buttonCancelPushed() throws Exception{
	 		dout.writeInt(71);
	 }
} // End of class