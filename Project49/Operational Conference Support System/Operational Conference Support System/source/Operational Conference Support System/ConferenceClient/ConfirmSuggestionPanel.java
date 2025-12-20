import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.applet.*;
import java.awt.event.*;
import java.util.*;


public class ConfirmSuggestionPanel extends JPanel {
	private JLabel headerSwot;
	private JLabel headerTopic;
	
	private JLabel lb1 = new JLabel("1");
	private JLabel lb2 = new JLabel("1");
	private JLabel lb3 = new JLabel("1");
	private JLabel lb4 = new JLabel("1");
	
	private JLabel lnumber1 = new JLabel("   ข้อคิดเห็นที่1  ");
	private JLabel lnumber2 = new JLabel("	    ข้อคิดเห็นที่2  ");
  	private JLabel lnumber3 = new JLabel("   ข้อคิดเห็นที่3  ");
	
	private static JLabel text1 = new JLabel("-");
	private static JLabel text2 = new JLabel("-");
	private static JLabel text3 = new JLabel("-");
	
	private static String suggestion1 = "";
	private static String suggestion2 = "";
	private static String suggestion3 = "";
	
	 private static JLabel LImage = new JLabel("");
	 private static ImageIcon icob1 = new ImageIcon("");
	 private static String picName1 = "";
	
	private static JLabel topicName = new JLabel("");
	
	private Vector vtext = new Vector();
	
	private GridBagConstraints gbc;
	private GridBagLayout gbl;
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
  
  	private ImageIcon icobS,icobW,icobO,icobT,icobOk,icobCancel;
	private JLabel bS,bW,bO,bT,bOk,bCancel;
	
	private static String topic = "";
	
	public ConfirmSuggestionPanel(Socket sock) {
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
				
		//##### Component ################
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,30));
		
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,30));
		
		lb3.setForeground(Color.WHITE);
		lb3.setFont(new Font("",0,30));
		
		lb4.setForeground(Color.WHITE);
		lb4.setFont(new Font("",0,40));
		
		lnumber1.setFont(new Font("",0,20)); // size of textlabel
		lnumber2.setFont(new Font("",0,20)); // size of textlabel
		lnumber3.setFont(new Font("",0,20)); // size of textlabel
		lnumber1.setForeground(Color.BLUE);
		lnumber2.setForeground(Color.BLUE);
		lnumber3.setForeground(Color.BLUE);
		
		icobS = new ImageIcon(ConfirmSuggestionPanel.class.getResource("spanel.png"));
		icobOk = new ImageIcon(ConfirmSuggestionPanel.class.getResource("ok.png"));
		icobCancel = new ImageIcon(ConfirmSuggestionPanel.class.getResource("bcancel1.png"));
		
		bS = new JLabel(icobS); 
		bW = new JLabel(icobW); 
		bO = new JLabel(icobO);
		bT = new JLabel(icobT); 
		bOk = new JLabel(icobOk);
		bCancel = new JLabel(icobCancel);
		//###### End Component ##############
		
		setBackground(Color.WHITE);
	 	gbc.fill = GridBagConstraints.CENTER;
		gbc.insets.top = 0; gbc.insets.bottom = 0; // that make gat between component etc botton , text
		gbc.insets.left = 1; gbc.insets.right = 1; //
		
		//############ ( gbl , gbc , row , collumn , width ,height)	
		gbc.anchor = GridBagConstraints.CENTER;
		addComponent(LImage,gbl,gbc,0,0,5,1);
		addComponent(lb4 ,gbl,gbc,1,0,1,1);	
			
		gbc.anchor = GridBagConstraints.WEST;
		addComponent(lnumber1 ,gbl,gbc,2,1,1,1);
		addComponent(text1 ,gbl,gbc,2,2,3,1);
		addComponent(lb2 ,gbl,gbc,3,0,1,1);
		addComponent(lnumber2 ,gbl,gbc,4,1,1,1);
		addComponent(text2 , gbl ,gbc , 4 , 2 , 3 , 1);
		addComponent(lb1 ,gbl,gbc,5,0,1,1);
		addComponent(lnumber3 ,gbl,gbc,6,1,1,1);
		addComponent(text3 ,gbl,gbc,6,2,3,1);
 		addComponent(lb3 ,gbl,gbc,7,0,1,1);	
 		
 /*		gbc.ipadx = 20;
 		gbc.insets.set(0,50,0,0);
 		gbc.fill = GridBagConstraints.NONE;
 		gbc.anchor = GridBagConstraints.EAST;
 		gbc.insets.set(0,0,0,0);
		gbc.anchor = GridBagConstraints.WEST;*/
				
		MouseListeners mouselistener = new MouseListeners();
	 	bS.addMouseListener(mouselistener);
	 	bOk.addMouseListener(mouselistener);
	 	bCancel.addMouseListener(mouselistener);
	}
	
	public static void setTopic(String aTopic) {
		topicName.setText(aTopic);
		topicName.setFont(new Font("",0,30));
		topic = aTopic;
	}
	
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
	 public static void setPictureDisplay(String picName){	
  		icob1 = new ImageIcon(picName);	
		LImage.setIcon(icob1);
  		picName1 = picName;
  }
  public  static void setTextDisplay(String topic1 , String topic2 , String topic3) {
		text1.setText(topic1);
		text1.setFont(new Font("",0,30));
		text1.setForeground(Color.orange);
		suggestion1 = topic1;
		
		text2.setText(topic2);
		text2.setFont(new Font("",0,30));
		text2.setForeground(Color.orange);
		suggestion2 = topic2;
		
		text3.setText(topic3);
		text3.setFont(new Font("",0,30));
		text3.setForeground(Color.orange);
		suggestion3 = topic3;
	}
 	public void buttonOkPushed() throws Exception{
 				dout.writeInt(78); // next session wait for another
				dout.writeUTF(suggestion1);	
				dout.writeUTF(suggestion2);	
				dout.writeUTF(suggestion3);	
 }
 public void buttonCancelPushed() throws Exception{
 			dout.writeInt(74);
 }
private class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) { 
    		try {
		      if(e.getSource() == bOk) {
				dout.writeInt(78); // next session wait for another
				dout.writeUTF(suggestion1);	
				dout.writeUTF(suggestion2);	
				dout.writeUTF(suggestion3);
		      } else if(e.getSource() == bCancel) {
		      		dout.writeInt(74);
		      } 
		   } catch(Exception ex) {}
	    }

    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  }
}