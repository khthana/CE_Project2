import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.awt.event.*;
import java.util.*;

class PicturePanel extends JPanel {
	 private GridBagConstraints gbc;
	 private GridBagLayout gbl;
	 
	 private DataInputStream din;
  	 private DataOutputStream dout;
  	 
	 private static JLabel LImage = new JLabel("");
	 private static ImageIcon icob1 = new ImageIcon("");
	 private static String picName1 = "";
	
	 private Socket sock;
	  
	  public PicturePanel(Socket sock) {
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
	
		// row , collume , width , height
		addComponent(LImage,gbl,gbc,0,0,6,4);
		
		gbc.anchor = GridBagConstraints.CENTER;
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
}