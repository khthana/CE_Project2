import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.applet.*;
import java.awt.event.*;
import java.util.*;

public class StrenghtSwotPanel extends JPanel {
	private JLabel headerSwot;
	private JLabel headerTopic;
	
	private JPanel p1 = new JPanel();
	private JPanel p2 = new JPanel();
	private JPanel p3 = new JPanel();
	private JPanel p4 = new JPanel();
	private JPanel p5 = new JPanel();
	
	private JLabel lb1 = new JLabel("1");
	private JLabel lb2 = new JLabel("1");
	private JLabel lb3 = new JLabel("1");
	private JLabel lb4 = new JLabel("1");
	
	private JLabel lnumber1 = new JLabel("   ข้อคิดเห็นที่1  ");
	private JLabel lnumber2 = new JLabel("	  ข้อคิดเห็นที่2  ");
  	private JLabel lnumber3 = new JLabel("   ข้อคิดเห็นที่3  ");
  
  	private ImageIcon	icob3 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pushOkorCancel.png"));
	private JLabel	bFooter1 = new JLabel(icob3);
	
	private ImageIcon	icob2 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("confirmSuggestionStrenght.png"));
	private JLabel	bHeader2 = new JLabel(icob2);

	private ImageIcon	icob4 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pushOkorReset.png"));
	private JLabel	bFooter2 = new JLabel(icob4);
	
	private JTextField t1 = new JTextField(30); //30 
	private JTextField t2 = new JTextField(30);
	private JTextField t3 = new JTextField(30);
	
	 private static JLabel LImage = new JLabel("");
	 private static ImageIcon icob1 = new ImageIcon("");
	 private static String picName1 = "";
		
	private static JLabel topicName = new JLabel("");
	
	private Vector vtext = new Vector();
	
	private static JLabel Lsuggestion1 = new JLabel("-");
	private static JLabel Lsuggestion2 = new JLabel("-");
	private static JLabel Lsuggestion3 = new JLabel("-");

	private String suggestion1 = "";
	private String suggestion2 = "";
	private String suggestion3 = "";
	
	private GridBagConstraints gc = new GridBagConstraints();
	private GridBagLayout gl = new GridBagLayout();
	
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
  
  	private ImageIcon icobS,icobW,icobO,icobT,icobOk,icobClear;
	private JLabel bS,bW,bO,bT,bOk,bClear;

	private int page = 1;
	
	private Vector vectorOfSuggestion = new Vector();
	
	public StrenghtSwotPanel(Socket sock) {
		try {
			this.sock = sock;
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() throws Exception{
		din   = new DataInputStream(sock.getInputStream());
      	dout  = new DataOutputStream(sock.getOutputStream());
      	
      	lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,30));
		
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,30));
		
		lb3.setForeground(Color.WHITE);
		lb3.setFont(new Font("",0,30));
				
		lb4.setForeground(Color.WHITE);
		lb4.setFont(new Font("",0,40));
				
		lnumber1.setFont(new Font("",0,25)); // size of textlabel //20
		lnumber2.setFont(new Font("",0,25)); // size of textlabel
		lnumber3.setFont(new Font("",0,25)); // size of textlabel
		lnumber1.setForeground(Color.BLUE);
		lnumber2.setForeground(Color.BLUE);
		lnumber3.setForeground(Color.BLUE);		
		
		t1.setFont(new Font("",0,25)); // size of text in textbox
		t2.setFont(new Font("",0,25)); // size of text in textbox
		t3.setFont(new Font("",0,25)); // size of text in textbox	//20
	 	
	 	p1.setLayout(new GridBagLayout());
	 	p2.setLayout(new GridBagLayout());
	 	p3.setLayout(new GridBagLayout());
	 	p4.setLayout(new GridBagLayout());
	 	p5.setLayout(new GridBagLayout());
	 
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 	p3.setBackground(Color.WHITE);
	 	p4.setBackground(Color.WHITE);
	 	p5.setBackground(Color.WHITE);
	 
	 	setBackground(Color.WHITE);
	 	setLayout(new BorderLayout());
	 	
	 	gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.CENTER;
		gc.insets.top = 0; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
	
		gc.gridwidth = 20; gc.gridheight = 1;		
		gc.gridx = 0 ;gc.gridy = 0;
		gc.weighty = 0;gc.weightx = 0;
		p1.add(LImage,gc);
		
		gc.gridwidth = 1;
		gc.gridx = 0 ;gc.gridy = 0;
		p2.add(lnumber1,gc);
		
		gc.gridwidth = 1;
		gc.gridx = 1 ;gc.gridy = 0;
		p2.add(t1,gc);
		
		gc.gridwidth = 10;
		gc.gridx = 0 ;gc.gridy = 1;
		p2.add(lb2,gc);
		
		gc.gridwidth = 1;
		gc.gridx = 0 ;gc.gridy = 2;
		p2.add(lnumber2,gc);
		
		gc.gridwidth = 1;
		gc.gridx = 1 ;gc.gridy = 2;
		p2.add(t2,gc);
		
		gc.gridwidth = 10;
		gc.gridx = 0 ;gc.gridy = 3;
		p2.add(lb3,gc);
				
		gc.gridwidth = 1;
		gc.gridx = 0 ;gc.gridy = 4;
		p2.add(lnumber3,gc);
		
		gc.gridwidth = 1;
		gc.gridx = 1 ;gc.gridy = 4;
		p2.add(t3,gc);
		
		gc.gridwidth = 10;
		gc.gridx = 0 ;gc.gridy = 5;
		p2.add(lb4,gc);
	
		gc.gridx = 0 ;gc.gridy = 0;
		p5.add(bFooter2,gc);
		
	 	add(p1,BorderLayout.NORTH);	 
	 	add(p2,BorderLayout.CENTER);	
	 	add(p5,BorderLayout.SOUTH);
	}
	public static void setTopic(String topic) {
		topicName.setText(topic);
		topicName.setFont(new Font("",0,30));
	}
	private void defaultPage(){
			p1.removeAll();
			p2.removeAll();
			p5.removeAll();
			
			gc.fill = GridBagConstraints.BOTH;
			gc.anchor = GridBagConstraints.CENTER;
				
			gc.gridwidth = 10; gc.gridheight = 1;		
			gc.gridx = 0 ;gc.gridy = 0;
			gc.weighty = 0;gc.weightx = 0;
			p1.add(LImage,gc);
			
			gc.gridwidth = 1;
			gc.gridx = 0 ;gc.gridy = 0;
			p2.add(lnumber1,gc);
			
			gc.gridwidth = 9;
			gc.gridx = 1 ;gc.gridy = 0;
			p2.add(t1,gc);
			
			gc.gridwidth = 10;
			gc.gridx = 0 ;gc.gridy = 1;
			p2.add(lb2,gc);
			
			gc.gridwidth = 1;
			gc.gridx = 0 ;gc.gridy = 2;
			p2.add(lnumber2,gc);
			
			gc.gridwidth = 9;
			gc.gridx = 1 ;gc.gridy = 2;
			p2.add(t2,gc);
			
			gc.gridwidth = 10;
			gc.gridx = 0 ;gc.gridy = 3;
			p2.add(lb3,gc);
					
			gc.gridwidth = 1;
			gc.gridx = 0 ;gc.gridy = 4;
			p2.add(lnumber3,gc);
			
			gc.gridwidth = 9;
			gc.gridx = 1 ;gc.gridy = 4;
			p2.add(t3,gc);
			
			gc.gridwidth = 10;
			gc.gridx = 0 ;gc.gridy = 5;
			p2.add(lb4,gc);
	
			gc.gridx = 0 ;gc.gridy = 0;
	  		p5.add(bFooter2,gc);
				
			remove(p3);
		 	remove(p4);
		 	
			add(p1,BorderLayout.NORTH);	 
			add(p2,BorderLayout.CENTER);
			add(p5,BorderLayout.SOUTH);
				 	
			invalidate();
	    	repaint();
	    	validate();
	}
	private void confirmPage(){
			p3.removeAll();
	 		p4.removeAll();
	 		p5.removeAll();
	 		
	 		gc.fill = GridBagConstraints.BOTH;
			gc.anchor = GridBagConstraints.WEST;
		
	 		gc.gridwidth = 10; gc.gridheight = 1;		
			gc.gridx = 0 ;gc.gridy = 0;
			gc.weighty = 0;gc.weightx = 0;
			p3.add(bHeader2,gc);
			
			gc.gridwidth = 1;
			gc.gridx = 0 ;gc.gridy = 0;
			p4.add(lnumber1,gc);
			
			gc.gridwidth = 9;
			gc.gridx = 1 ;gc.gridy = 0;
			p4.add(Lsuggestion1,gc);
			
			gc.gridwidth = 10;
			gc.gridx = 0 ;gc.gridy = 1;
			p4.add(lb2,gc);
			
			gc.gridwidth = 1;
			gc.gridx = 0 ;gc.gridy = 2;
			p4.add(lnumber2,gc);
			
			gc.gridwidth = 9;
			gc.gridx = 1 ;gc.gridy = 2;
			p4.add(Lsuggestion2,gc);
			
			gc.gridwidth = 10;
			gc.gridx = 0 ;gc.gridy = 3;
			p4.add(lb3,gc);
					
			gc.gridwidth = 1;
			gc.gridx = 0 ;gc.gridy = 4;
			p4.add(lnumber3,gc);
			
			gc.gridwidth = 9;
			gc.gridx = 1 ;gc.gridy = 4;
			p4.add(Lsuggestion3,gc);
			
			gc.gridwidth = 10;
			gc.gridx = 0 ;gc.gridy = 5;
			p4.add(lb4,gc);
		 	
			gc.gridx = 0 ;gc.gridy = 0;
	  		p5.add(bFooter1,gc);
		 			
			remove(p1);
			remove(p2);
			
			add(p3,BorderLayout.NORTH);
			add(p4,BorderLayout.CENTER);
			add(p5,BorderLayout.SOUTH);
			
			repaint();
			validate();
			invalidate();
	}
	private void getSuggestion(){
			suggestion1 = t1.getText();
			suggestion2 = t2.getText();
			suggestion3 = t3.getText();
			
			Lsuggestion1.setText(suggestion1);
			Lsuggestion1.setFont(new Font("",0,30));
			Lsuggestion1.setForeground(Color.orange);
				
			Lsuggestion2.setText(suggestion2);
			Lsuggestion2.setFont(new Font("",0,30));
			Lsuggestion2.setForeground(Color.orange);
			
			Lsuggestion3.setText(suggestion3);
			Lsuggestion3.setFont(new Font("",0,30));
			Lsuggestion3.setForeground(Color.orange);
	}
	 private void clearText() throws Exception {
			t1.setText(""); 
			t2.setText("");
			t3.setText("");
			
			suggestion1 = "";
			suggestion2 = "";
			suggestion3 = "";
	 }
	 public static void setPictureDisplay(String picName){
		  	icob1 = new ImageIcon(picName);	
		  	LImage.setIcon(icob1);	  	
		  	picName1 = picName;
  	}
  	public void buttonOkPushed() throws Exception{
				if(getPage() == 1){
					getSuggestion();
					confirmPage();	
					page = 2;
				}else if(getPage() == 2){
					getSuggestion();		
									
					dout.writeInt(78); // next session wait for another
					dout.writeUTF(suggestion1);	
					dout.writeUTF(suggestion2);	
					dout.writeUTF(suggestion3);
					
					clearText();
					defaultPage();
					page = 1;
				}
  	}
  	public void buttonCancelPushed() throws Exception{
  			if(getPage() == 2 ){
  					
			defaultPage();
			page = 1;		
			}
  	}
  	public void buttonResetPushed() throws Exception{
  			if(getPage() == 1)
  				clearText();
  	}
  	public int getPage(){
  			return page;
  	}
	private class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) { 
    		try {
		      if(e.getSource() == bOk) {		
				getSuggestion();
				confirmPage();
		      }
		   } catch(Exception ex) {}
	    }

    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  }
} // End of class