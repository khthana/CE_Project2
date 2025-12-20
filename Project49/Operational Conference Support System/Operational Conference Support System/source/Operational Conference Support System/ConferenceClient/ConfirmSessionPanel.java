import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.awt.event.*;
import java.util.*;
import java.applet.*;

public class ConfirmSessionPanel extends JPanel{
	private GridBagConstraints gbc;
	private GridBagLayout gbl;
	 private DataInputStream din;
  	 private DataOutputStream dout;
  	 private Socket sock;
	 private ImageIcon icob2,icob3,icob4;
	 private static JLabel LImage = new JLabel("");
	 private static ImageIcon icob1 = new ImageIcon("");
	 private static String picName1 = "";
	 private static String topic = "";
  
  	 public ConfirmSessionPanel(Socket sock) {
	 	try {
	 		this.sock = sock;
	 		Init();
	 	} catch (Exception e) { e.printStackTrace(); }
	 }
	 private void Init() throws Exception {
	 	din = new DataInputStream(sock.getInputStream());
      	dout = new DataOutputStream(sock.getOutputStream());
		
		gbl = new GridBagLayout();
		setLayout(gbl);
		
		gbc  = new GridBagConstraints();
		setBackground(Color.WHITE);
		gbc.fill = GridBagConstraints.BOTH;
		
		addComponent(LImage,gbl,gbc,0,0,6,4);
		
		gbc.anchor = GridBagConstraints.CENTER;
		gbc.insets.set(30,200,0,0);
		gbc.insets.set(30,10,0,100);
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
	public static void setPictureConfirmSession(String picName){
  	icob1 = new ImageIcon(picName);	
	LImage.setIcon(icob1);
  	picName1 = picName;
  }
	public static void setTopic(String aTopic) {
		topic = aTopic;
	}
	public void buttonOkPushed() throws Exception{
			dout.writeInt(74);
	}
	public void buttonCancelPushed() throws Exception {
				dout.writeInt(72);
				dout.writeUTF(topic);
	}
}
