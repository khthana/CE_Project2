import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.awt.event.*;
import java.util.*;
import java.applet.*;

class StartSwotPanel extends JPanel {
	private GridBagConstraints gbc;
	private GridBagLayout gbl;
	 
	 private DataInputStream din;
  	 private DataOutputStream dout;
  	 
	 private JLabel LImage,bOk,bCancel;
	 private ImageIcon icob1,icob2,icob3,icob4;
	 
	 private Socket sock;
  
  	 public StartSwotPanel(Socket sock) {
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
		
		// ####### Component	
		icob1 = new ImageIcon(StartSwotPanel.class.getResource("startSwot.png"));
      	icob2 = new ImageIcon(StartSwotPanel.class.getResource("ok.png"));
		icob3 = new ImageIcon(StartSwotPanel.class.getResource("bcancel1.png"));
	
		LImage = new JLabel(icob1);
		bOk = new JLabel(icob2); 
		bCancel = new JLabel(icob3); 
		// ###### EndComponent
		
		setBackground(Color.WHITE);
		
		gbc.fill = GridBagConstraints.BOTH;
		// row , collume , width , height
		addComponent(LImage,gbl,gbc,0,0,6,4);
		
/*		gbc.anchor = GridBagConstraints.CENTER;
		// top,left,button,right
		gbc.insets.set(30,200,0,0);
		
		gbc.insets.set(30,10,0,100);	*/
	 	
	 	MouseListeners mouselistener = new MouseListeners();
	 	bOk.addMouseListener(mouselistener);
	 	bCancel.addMouseListener(mouselistener);
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
	public void buttonOkPushed() throws Exception{
			dout.writeInt(71);
	}
	public void buttonResetPushed() throws Exception{
			dout.writeInt(81);
	}
	
	private	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) { 
    		try {
		      if(e.getSource() == bOk) {
				dout.writeInt(71);
		      } else if(e.getSource() == bCancel){
		      	dout.writeInt(81);
			  }
		   } catch(Exception ex) {}
	    }

    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  }
}