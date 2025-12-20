import java.io.*;
import java.net.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class NoticeProjector extends JPanel{
	private static JLabel lblrule;
	private static String msg;
	private GridBagConstraints gc = new GridBagConstraints();
	private ImageIcon iconOK;
	private JLabel labelOK;
  	private static DataOutputStream dout;
  	private Socket sock;
  	
  	public NoticeProjector() {
  			invalidate();	
			iconOK = new ImageIcon(NoticeProjector.class.getResource("wordProjector.png"));
			labelOK = new JLabel(iconOK);
			
			setLayout(new GridBagLayout());
			setBackground(Color.WHITE);
			
			gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
			gc.ipadx = 5; gc.ipady = 5; // size of component
			gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
			gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
			
			add(labelOK,gc);
			
			invalidate();
    		repaint();
    		validate();
	}
} // End of class