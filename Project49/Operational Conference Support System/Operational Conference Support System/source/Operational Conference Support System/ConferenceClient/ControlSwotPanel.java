import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.awt.event.*;
import java.util.*;

public class ControlSwotPanel extends JPanel {
	private JPanel p1 = new JPanel();
	private JPanel p2 = new JPanel();
	private JPanel p3 = new JPanel();
	
	private JLabel headerSwot;
	private JLabel headerTopic;
	private GridBagConstraints gbc;
	private GridBagLayout gbl;
	
	private static JLabel topicName = new JLabel("");
	private JLabel lb1 = new JLabel("1");
	private JLabel lb2 = new JLabel("1");

	private static String topic = "";
	
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
  
  	private ImageIcon icobS,icobW,icobO,icobT,icobOk,icobCancel;
	private JLabel bS,bW,bO,bT,bOk,bCancel;
	
	public ControlSwotPanel(Socket sock) {
		try {
			this.sock = sock;
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() throws Exception{
		din = new DataInputStream(sock.getInputStream());
      	dout = new DataOutputStream(sock.getOutputStream());
		gbl = new GridBagLayout();
		setLayout(gbl);
		gbc  = new GridBagConstraints();
		
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,40));
		
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,40));
		
		//##### Component ################
		headerSwot = new JLabel("           โปรดเลือกชนิดของการวิเคราะห์");
		headerSwot.setFont(new Font("",0,30));
		headerTopic = new JLabel("หหัวข้อ :");
		headerTopic.setFont(new Font("",0,30));
		
		icobS = new ImageIcon(ControlSwotPanel.class.getResource("SButton.png"));
		icobW = new ImageIcon(ControlSwotPanel.class.getResource("WButton.png"));
		icobO = new ImageIcon(ControlSwotPanel.class.getResource("OButton.png"));
		icobT = new ImageIcon(ControlSwotPanel.class.getResource("TButton.png"));
		icobOk = new ImageIcon(ControlSwotPanel.class.getResource("Ok.png"));
		icobCancel = new ImageIcon(ControlSwotPanel.class.getResource("bcancel1.png"));
		
		bS = new JLabel(icobS); 
		bW = new JLabel(icobW); 
		bO = new JLabel(icobO);
		bT = new JLabel(icobT); 
		bOk = new JLabel(icobOk);
		bCancel = new JLabel(icobCancel);
		//###### End Component ##############
		
		setBackground(Color.WHITE);
	 	gbc.anchor = GridBagConstraints.CENTER;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.weightx = 0; gbc.weighty = 0;
		
		addComponent(headerSwot,gbl,gbc,0,1,3,1);
		
		gbc.anchor = GridBagConstraints.CENTER;
		addComponent(lb2,gbl,gbc,2,0,1,1);
		
		gbc.insets.set(30,75,30,30);
		addComponent(bS,gbl,gbc,3,1,1,1);
		addComponent(bO ,gbl,gbc,4,1,1,1);

		gbc.insets.set(30,30,30,30);
		addComponent(bW ,gbl,gbc,3,2,1,1);
		addComponent(bT ,gbl,gbc,4,2,1,1);
				
		MouseListeners mouselistener = new MouseListeners();
	 	bS.addMouseListener(mouselistener);
	 	bW.addMouseListener(mouselistener);
	    bO.addMouseListener(mouselistener);
	    bT.addMouseListener(mouselistener);
	}
	
	public static void setTopic(String aTopic) {
		topic = aTopic;
		topicName.setText((" หัวข้อคือ : "+ aTopic));
		topicName.setFont(new Font("",0,30));
	}
	//############ ( gbl , gbc , row , collumn , width ,height)
	private void addComponent(Component c , GridBagLayout gbl , GridBagConstraints gbc ,int row,int column,
														int width,int height){
		//set gridx and gridy --> position
		gbc.gridx = column;
		gbc.gridy = row;
		
		//set gridwidth and gridheight ---> number of column and row the component occupies
		gbc.gridwidth = width;
		gbc.gridheight = height;
		
		//set constraints
		gbl.setConstraints(c,gbc);
		
		//add component to applet
		add(c);
	}
private class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) { 
    		try {
		      if(e.getSource() == bS) {
					dout.writeInt(77);
					dout.writeUTF(topic);			
					dout.writeUTF("s");
		      } else if(e.getSource() == bW) {
					dout.writeInt(77);
					dout.writeUTF(topic);			
					dout.writeUTF("w");
		      } else if(e.getSource() == bO) {
					dout.writeInt(77);
					dout.writeUTF(topic);			
					dout.writeUTF("o");
		      } else if(e.getSource() == bT) {
					dout.writeInt(77);
					dout.writeUTF(topic);			
					dout.writeUTF("t");
		      } 
		   } catch(Exception ex) {}
	    }

    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  }
} // End of class