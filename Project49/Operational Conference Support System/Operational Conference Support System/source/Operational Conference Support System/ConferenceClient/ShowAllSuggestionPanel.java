 import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.awt.event.*;
import java.util.*;

class ShowAllSuggestionPanel extends JPanel {
	 private JPanel p1 = new JPanel();
	 private JPanel p2 = new JPanel();
	 private JPanel p3 = new JPanel();
	 private JPanel p4 = new JPanel();
	 private JPanel p5 = new JPanel();
	 private JPanel p6 = new JPanel();
	 private JPanel p7 = new JPanel();
	 private JPanel p8 = new JPanel();
	 private JPanel pFooter1 = new JPanel();
	 private JPanel pFooter2 = new JPanel();
	 
	 private ImageIcon	icob1 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("selectSuggestion.png"));
	 private ImageIcon	icob2 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("ok.png"));
	 private ImageIcon	icob3 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("bclear.png"));
	 private ImageIcon	icob4 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("confirmSelectedSuggestion.png"));
	 private ImageIcon	icob5 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("bcancel1.png"));
	 private ImageIcon	icob6 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pushOkForStartEvaluate.png"));
	 private ImageIcon	icob7 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pleaseSetFactor.png"));
	 private ImageIcon	icob8 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pushOkorReset.png"));
	 private ImageIcon	icob9 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pushOkorCancel.png"));
	 
	 private JTextField Radious1 = new JTextField();
	 private JTextField Yaxis1 = new JTextField();
	 private JLabel MaxXaxis1 = new JLabel();
	 private JLabel MinXaxis1 = new JLabel();
	 
	 private JLabel MaxXaxis12 = new JLabel();
	 private JLabel MinXaxis12 = new JLabel();
	 
	 private JTextField MaxYaxis1 = new JTextField();
	 private JTextField MinYaxis1 = new JTextField();
	 private JTextField MaxRadious1 = new JTextField();
	 private JTextField MinRadious1 = new JTextField();
	 
	 private int maxYaxisValue;
	 private int minYaxisValue;
	 private int maxRaxisValue;
	 private int minRaxisValue;
	
 	 private JLabel	b1 = new JLabel(icob1);
	 private JLabel	bOk1 = new JLabel(icob2); 
	 private JLabel	bClear = new JLabel(icob3);
	 private JLabel	b4 = new JLabel(icob4);
	 private JLabel	bCancel = new JLabel(icob5);
	 private JLabel bOk2 = new JLabel(icob2);
	 private JLabel bOk3 = new JLabel(icob2);
	 private JLabel b6 = new JLabel(icob6);
	 private JLabel	bHeader = new JLabel(icob7);
	 private JLabel	bFooter1 = new JLabel(icob8);
	 private JLabel	bFooter2 = new JLabel(icob9);
 	 
 	 private myMessageBox msgbox = new myMessageBox();
 	 
	 private JTextField t1 = new JTextField(30);
	 private Vector vtext = new Vector();
	 private GridBagConstraints gc = new GridBagConstraints();
	 private DataInputStream din;
  	 private DataOutputStream dout;
  	 private Socket sock;
  	     	 
  	 private  Vector vectorOfSuggestion = new Vector();
  	 private  int loop;
 	 private  Vector tem = new Vector();
     private int page = 1;
	 
	 public ShowAllSuggestionPanel(Socket sock) {
	 	try {
	 		this.sock = sock;
	 		Init();
	 	} catch (Exception e) { e.printStackTrace(); }
	 }
	 private void Init() throws Exception {
	 	din   = new DataInputStream(sock.getInputStream());
      	dout  = new DataOutputStream(sock.getOutputStream());
				
		setBackground(Color.WHITE);
	 	setLayout(new BorderLayout());
	 	
	 	p1.setLayout(new GridBagLayout());
	 	p2.setLayout(new GridBagLayout());
	 	p3.setLayout(new GridBagLayout());
	 	p4.setLayout(new GridBagLayout());
	 	p6.setLayout(new GridBagLayout());
	 	p7.setLayout(new GridBagLayout());
	 	p8.setLayout(new GridBagLayout());
	 	pFooter1.setLayout(new GridBagLayout());
		pFooter2.setLayout(new GridBagLayout());
	 
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 	p3.setBackground(Color.WHITE);
	 	p4.setBackground(Color.WHITE);
	 	p6.setBackground(Color.WHITE);
	 	p7.setBackground(Color.WHITE);
	 	p8.setBackground(Color.WHITE);
	 	pFooter1.setBackground(Color.white);
	 	pFooter2.setBackground(Color.white);
	 	
	 	gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.CENTER;
		gc.insets.top = 0; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
	
		gc.gridwidth = 10; gc.gridheight = 1;		
		gc.gridx = 0 ;gc.gridy = 0;
		gc.weighty = 0;gc.weightx = 0;
		p1.add(b1,gc);
	
	 	add(p1,BorderLayout.NORTH);	 
	 }
	 public  void setTextBox(Vector aVector) {
		remove(p2);
		remove(p3);		
		remove(p4);
		remove(p5);
		remove(p6);
		remove(p7);
		remove(p8);
		remove(pFooter1);
		remove(pFooter2);
		
		p2.removeAll();
		p3.removeAll();
		p4.removeAll();
		p5.removeAll();
		p6.removeAll();
		p7.removeAll();
		p8.removeAll();
		pFooter1.removeAll();
		pFooter2.removeAll();
			
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.gridwidth = 4;
		
		int i;
		for(i=0;i<loop;i++){
			String s = aVector.elementAt(i).toString();	
			Checkbox c = new Checkbox(s);
			c.setFont(new Font("",0,28));
			
			gc.gridx = 3; gc.gridy = i; 											// position of grid [like array two dimention]
			p2.add(c,gc);
			vtext.addElement(c);
		}
		
		gc.gridwidth = 10;	
		gc.gridx = 0 ;gc.gridy = 0;
		pFooter1.add(bFooter1,gc);
	
		p1.add(b1,gc);	
	 	add(p1,BorderLayout.NORTH);
				
		add(p2,BorderLayout.CENTER);
		add(pFooter1,BorderLayout.SOUTH);
		
		invalidate();
    	repaint();
    	validate();
	 }
	 private void setDefaultPanel(){
		p1.removeAll();
		p2.removeAll();
	
	 	vtext.removeAllElements();
	 				
		setBackground(Color.WHITE);
	 	setLayout(new BorderLayout());
	 	
	 	p1.setLayout(new GridBagLayout());
	 	p2.setLayout(new GridBagLayout());
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 	
	 	gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.CENTER;
		gc.insets.top = 0; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
	
		gc.gridwidth = 10; gc.gridheight = 1;		
		gc.gridx = 0 ;gc.gridy = 0;
		gc.weighty = 0;gc.weightx = 0;
		p1.add(b1,gc);
		
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.gridwidth = 4;
		
		int i;
		for(i=0;i<loop;i++){
			String s = vectorOfSuggestion.elementAt(i).toString();	
			Checkbox c = new Checkbox(s);	
			c.setFont(new Font("",0,28));
			
			gc.gridx = 3; gc.gridy = i; 											// position of grid [like array two dimention]
			p2.add(c,gc);
			vtext.addElement(c);
		}
	
		gc.gridwidth = 10;	
		gc.gridx = 0 ;gc.gridy = 0;
		pFooter1.add(bFooter1,gc);

		remove(p3);
	 	remove(p4);
	 	remove(pFooter2);
	 	
		add(p1,BorderLayout.NORTH);	 
		add(p2,BorderLayout.CENTER);
		add(pFooter1,BorderLayout.SOUTH);
			 	
		invalidate();
    	repaint();
    	validate();
	 }
	 public  void setNumberOfSuggestion(Vector aVector){
	 		vectorOfSuggestion = aVector;
	 		loop = aVector.size();
	 		setTextBox(aVector);
	 }
	 public  void setSuggestion(Vector aSuggestion){
	 	loop = vectorOfSuggestion.size();
	 }
	 private void clearText() {
    	int i;
	 	for(i = 0 ; i < loop ; i++){
			if(((Checkbox)vtext.elementAt(i)).getState() == true){
					((Checkbox)vtext.elementAt(i)).setState(false);
			}
		}
	 }
	 private void getText() throws Exception {
	 		p3.removeAll();
	 		p4.removeAll();
	 		tem.removeAllElements();	
	 					
  			gc.fill = GridBagConstraints.NONE;
			gc.anchor = GridBagConstraints.CENTER;
			gc.insets.top = 0; gc.insets.bottom = 0;
			gc.insets.left = 5; gc.insets.right = 5;
	
			gc.gridwidth = 10; gc.gridheight = 1;		
			gc.gridx = 0 ;gc.gridy = 0;
			gc.weighty = 0;gc.weightx = 0;
			p3.add(b4,gc);
			
	 		gc.fill = GridBagConstraints.BOTH;
	 		gc.anchor = GridBagConstraints.NORTH;
			gc.gridwidth = 4;
		
			int i;
	 		for(i = 0 ; i < loop ; i++){
				if(((Checkbox)vtext.elementAt(i)).getState() == true){
					tem.addElement(vtext.elementAt(i));
				}
			}
					
			for(i=0 ; i<tem.size() ; i++){
				String s1 = ((((Checkbox)tem.elementAt(i)).getLabel()).toString());	
				JLabel c = new JLabel( (i+1) + ". " + s1);
				
				c.setFont(new Font("",0,28));
				gc.gridx = 3; gc.gridy = i; 											// position of grid [like array two dimention]
				p4.add(c,gc);
				vtext.addElement(c);
			}

			gc.gridwidth = 10;	
	    	gc.gridx = 0 ;gc.gridy = 0;
		    pFooter2.add(bFooter2,gc);
			
			remove(p1);
			remove(p2);
			remove(pFooter1);
			
			add(p3,BorderLayout.NORTH);
			add(p4,BorderLayout.CENTER);
			add(pFooter2,BorderLayout.SOUTH);
			
			repaint();
			validate();
			invalidate();
	 }
	 private void waitForStart(){
			 	p1.removeAll();
				p2.removeAll();
			
			 	vtext.removeAllElements();
			 				
				setBackground(Color.WHITE);
			 	setLayout(new BorderLayout());
			 	
			 	p1.setLayout(new GridBagLayout());
			 	p2.setLayout(new GridBagLayout());
			 	p1.setBackground(Color.WHITE);
			 	p2.setBackground(Color.WHITE);
			 	
			 	gc.fill = GridBagConstraints.NONE;
				gc.anchor = GridBagConstraints.CENTER;
				gc.insets.top = 0; gc.insets.bottom = 0;
				gc.insets.left = 5; gc.insets.right = 5;
			
				gc.gridwidth = 10; gc.gridheight = 1;		
				gc.gridx = 0 ;gc.gridy = 0;
				gc.weighty = 0;gc.weightx = 0;
				p2.add(b6,gc);
				
				gc.anchor = GridBagConstraints.NORTH;
	
				remove(p7);
			 	remove(p8);
			 	remove(pFooter1);
			 	remove(pFooter2);
			 	
				add(p1,BorderLayout.NORTH);	 
				add(p2,BorderLayout.CENTER);
					 	
				invalidate();
		    	repaint();
		    	validate();
	 }
	 private void checkFactor(){
 		p5.removeAll();
		p6.removeAll();
		
	 	p5.setLayout(new GridBagLayout());
	 	p6.setLayout(new GridBagLayout());
	 	
	 	p5.setBackground(Color.WHITE);
	 	p6.setBackground(Color.WHITE);
	 
	 	gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.CENTER;
		gc.insets.top = 0; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
	
		gc.gridwidth = 20; gc.gridheight = 1;		
		gc.gridx = 0 ;gc.gridy = 0;
		gc.weighty = 0;gc.weightx = 0;
		p5.add(bHeader,gc);
		
		//--------------------------------------------
		gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.EAST;
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 0;
			
		JLabel Max = new JLabel("ค่าสูงสุด");
		Max.setFont(new Font("",0,30));
		Max.setForeground(Color.orange);										
		p6.add(Max,gc);	
				
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 0;
		
		JLabel Min = new JLabel("ค่าต่ำสุด");
		Min.setFont(new Font("",0,30));
		Min.setForeground(Color.orange);										
		p6.add(Min,gc);		
				
		gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.WEST;
		
		//--------------------------------------------------
		//  XAxis Priority
		//--------------------------------------------------
		gc.fill = GridBagConstraints.BOTH;
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 0 ;gc.gridy = 1;
		gc.weighty = 0;gc.weightx = 0;
			
		JLabel Xaxis = new JLabel("แกนนอน คือ");
		Xaxis.setFont(new Font("",0,30));
		Xaxis.setForeground(Color.orange);										
		p6.add(Xaxis,gc);
		
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 4 ;gc.gridy = 1;
		JLabel Xaxis1 = new JLabel("ลำดับความสำคัญ");
		Xaxis1.setFont(new Font("",0,30));
		Xaxis1.setForeground(Color.blue);										
		p6.add(Xaxis1,gc);
		
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 1;
		gc.anchor = GridBagConstraints.EAST;
					
		MaxXaxis1.setText(Integer.toString(tem.size()));
		MaxXaxis1.setFont(new Font("",0,30));
		MaxXaxis1.setForeground(Color.blue);									
		p6.add(MaxXaxis1,gc);	
						
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 1;
				
		MinXaxis1.setText("1");
		MinXaxis1.setFont(new Font("",0,30));
		MinXaxis1.setForeground(Color.blue);
		p6.add(MinXaxis1,gc);	
		
		//--------------------------------------------------------
		//   Posibility
		//-----------------------------------------------------
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 0 ;gc.gridy = 2;
			
		JLabel Yaxis = new JLabel("แกนตั้ง คือ");
		Yaxis.setFont(new Font("",0,30));
		Yaxis.setForeground(Color.orange);										
		p6.add(Yaxis,gc);
		
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 4 ;gc.gridy = 2;
			
		Yaxis1.setText("ความเป็นไปได้");
		Yaxis1.setFont(new Font("",0,30));
		Yaxis1.setForeground(Color.blue);
		Yaxis1.setEditable(true);										
		p6.add(Yaxis1,gc);
			
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 2;
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.EAST;
				
		MaxYaxis1.setText("10");
		MaxYaxis1.setFont(new Font("",0,30));
		MaxYaxis1.setForeground(Color.blue);
		MaxYaxis1.setEditable(true);										
		p6.add(MaxYaxis1,gc);	
			
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 2;
				
		MinYaxis1.setText("0");
		MinYaxis1.setFont(new Font("",0,30));
		MinYaxis1.setForeground(Color.blue);
		MinYaxis1.setEditable(true);										
		p6.add(MinYaxis1,gc);	
	
	//--------------------------------------------------------
	//			Radious   
	//-----------------------------------------------------
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.WEST;
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 0 ;gc.gridy = 3;	
			
		JLabel Radious = new JLabel("รัศมี คือ");
		Radious.setFont(new Font("",0,30));
		Radious.setForeground(Color.orange);										
		p6.add(Radious,gc);
		
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 4 ;gc.gridy =3;
			
		Radious1.setText("มูลค่า");
		Radious1.setFont(new Font("",0,30));
		Radious1.setForeground(Color.blue);
		Radious1.setEditable(true);										
		p6.add(Radious1,gc);	
	
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.EAST;
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 3;
				
		MaxRadious1.setText("10");
		MaxRadious1.setFont(new Font("",0,30));
		MaxRadious1.setForeground(Color.blue);
		MaxRadious1.setEditable(true);										
		p6.add(MaxRadious1,gc);
			
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 3;
				
		MinRadious1.setText("0");
		MinRadious1.setFont(new Font("",0,30));
		MinRadious1.setForeground(Color.blue);
		MinRadious1.setEditable(true);										
		p6.add(MinRadious1,gc);	
		
		//--------------------------------------------------------
		gc.gridwidth = 10;	
		gc.gridx = 0 ;gc.gridy = 0;
		pFooter1.add(bFooter1,gc);
		
		remove(p3);
		remove(p4);
		remove(pFooter1);
		remove(pFooter2);
		remove(p7);
		remove(p8);
		
	 	add(p6,BorderLayout.CENTER);
	 	add(p5,BorderLayout.NORTH);
	 	add(pFooter1,BorderLayout.SOUTH);
	 	
		invalidate();
		repaint();
		validate();
	 }
	 public void confirmFactor(){
	 	p7.removeAll();
	 	p8.removeAll();
	 	
	 	gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.CENTER;
		gc.insets.top = 0; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
	
		gc.gridwidth = 20; gc.gridheight = 1;		
		gc.gridx = 0 ;gc.gridy = 0;
		gc.weighty = 0;gc.weightx = 0;
		p7.add(bHeader,gc);
		
		//--------------------------------------------
		gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.EAST;
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 0;
			
		JLabel Max1 = new JLabel("ค่าสูงสุด");
		Max1.setFont(new Font("",0,30));
		Max1.setForeground(Color.orange);										
		p8.add(Max1,gc);	
				
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 0;
		
		JLabel Min1 = new JLabel("ค่าต่ำสุด");
		Min1.setFont(new Font("",0,30));
		Min1.setForeground(Color.orange);										
		p8.add(Min1,gc);		
				
		gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.WEST;
		
		//--------------------------------------------------
		//  XAxis Priority
		//--------------------------------------------------
		gc.fill = GridBagConstraints.BOTH;
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 0 ;gc.gridy = 1;
		gc.weighty = 0;gc.weightx = 0;
			
		JLabel Xaxis2 = new JLabel("แกนนอน คือ");
		Xaxis2.setFont(new Font("",0,30));
		Xaxis2.setForeground(Color.orange);										
		p8.add(Xaxis2,gc);
		
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 4 ;gc.gridy = 1;
			
		JLabel Xaxis3 = new JLabel("ลำดับความสำคัญ");
		Xaxis3.setFont(new Font("",0,30));
		Xaxis3.setForeground(Color.blue);										
		p8.add(Xaxis3,gc);
		
//#####################################################
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 1;
		gc.anchor = GridBagConstraints.EAST;
					
		MaxXaxis12.setText(Integer.toString(tem.size()));
		MaxXaxis12.setFont(new Font("",0,30));
		MaxXaxis12.setForeground(Color.blue);
		p8.add(MaxXaxis12,gc);	
					
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 1;
				
		MinXaxis12.setText("1");
		MinXaxis12.setFont(new Font("",0,30));
		MinXaxis12.setForeground(Color.blue);
		p8.add(MinXaxis12,gc);	
		
		//--------------------------------------------------------
		//   Posibility
		//-----------------------------------------------------
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 0 ;gc.gridy = 2;
			
		JLabel LYaxis = new JLabel("แกนตั้ง คือ");
		LYaxis.setFont(new Font("",0,30));
		LYaxis.setForeground(Color.orange);										
		p8.add(LYaxis,gc);
		
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 4 ;gc.gridy = 2;
	
		JLabel LYaxis1 = new JLabel(Yaxis1.getText());
		LYaxis1.setFont(new Font("",0,30));
		LYaxis1.setForeground(Color.blue);											
		p8.add(LYaxis1,gc);
				
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 2;
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.EAST;
	
		JLabel LMaxYaxis1 = new JLabel(MaxYaxis1.getText());
		LMaxYaxis1.setFont(new Font("",0,30));
		LMaxYaxis1.setForeground(Color.blue);
		p8.add(LMaxYaxis1,gc);
					
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 2;
		
		JLabel LMinYaxis1 = new JLabel(MinYaxis1.getText());
		LMinYaxis1.setFont(new Font("",0,30));
		LMinYaxis1.setForeground(Color.blue);
		p8.add(LMinYaxis1,gc);
	
	//--------------------------------------------------------
	//			Radious   
	//-----------------------------------------------------
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.WEST;
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 0 ;gc.gridy = 3;	
			
		JLabel Radious12 = new JLabel("รัศมี คือ");
		Radious12.setFont(new Font("",0,30));
		Radious12.setForeground(Color.orange);										
		p8.add(Radious12,gc);
		
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 4 ;gc.gridy =3;
			
		JLabel LRadious1 = new JLabel(Radious1.getText());
		LRadious1.setFont(new Font("",0,30));
		LRadious1.setForeground(Color.blue);											
		p8.add(LRadious1,gc);
	
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.EAST;
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 3;
		
		JLabel LMaxRadious1 = new JLabel(MaxRadious1.getText());
		LMaxRadious1.setFont(new Font("",0,30));
		LMaxRadious1.setForeground(Color.blue);
		p8.add(LMaxRadious1,gc);
			
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 3;
				
		JLabel LMinRadious1 = new JLabel(MinRadious1.getText());
		LMinRadious1.setFont(new Font("",0,30));
		LMinRadious1.setForeground(Color.blue);
		p8.add(LMinRadious1,gc);
		
		//--------------------------------------------------------
		gc.gridwidth = 10;	
		gc.gridx = 0 ;gc.gridy = 0;
		pFooter1.add(bFooter1,gc);
	
		remove(p5);
		remove(p6);
		remove(pFooter1);
		remove(pFooter2);
		
	 	add(p7,BorderLayout.NORTH);
	 	add(p8,BorderLayout.CENTER);
	 	add(pFooter1,BorderLayout.SOUTH);
				 	
		invalidate();
		repaint();
		validate();
	 }
	 public void getMaxMinValue(){
	 	maxYaxisValue = Integer.parseInt(getYaxisMaxValue());
	 	minYaxisValue = Integer.parseInt(getYaxisMinValue());
	 	maxRaxisValue = Integer.parseInt(getRadiousMaxValue());
	 	minRaxisValue = Integer.parseInt(getRadiousMinValue());
	 }
	  public String getYaxisLabel(){
	 	String y = Yaxis1.getText();
	 	return y;
	 }
	  public String getYaxisMaxValue(){
		String YMax = MaxYaxis1.getText();
		return YMax;
	 }
	 public String getYaxisMinValue(){
	 	String YMin = MinYaxis1.getText();
	 	return YMin;
	 }
	 public String getRadiousLabel(){
	 	String r = Radious1.getText();
	 	return r;
	 }
	 public String getRadiousMaxValue(){
	 	String RMax = MaxRadious1.getText();
	 	return RMax;
	 }
	 public String getRadiousMinValue(){
	 	String RMin = MinRadious1.getText();
	 	return RMin;
	 }
	 private int getPage(){
	 	return page;
	 }
	 public void buttonOkPushed() throws Exception{
	 		// ok for your selected
	 		if(getPage() == 1){
	 			getText();
		 		page = 2;
	 			// ok for confirm
	 		}else if(getPage() == 2){
	 				checkFactor();
	 				page = 3;
	 		}else if(getPage() == 3){
	 				// check range max min and get value
	 				int yMax1 =  Integer.parseInt(MaxYaxis1.getText());
	 				int yMin1 =  Integer.parseInt(MinYaxis1.getText());
	 				int rMax1 =  Integer.parseInt(MaxYaxis1.getText());
	 				int rMin1 =  Integer.parseInt(MinYaxis1.getText());
	 				
	 				if( (yMin1 > yMax1) || (rMin1 > rMax1) ){
	 					msgbox.setText("กรุณาใส่ค่าสูงสุดต่ำสุดให้ถูกต้อง",25);
	    				msgbox.showBox();
	 					// Min > Max
	 				} else {
	 						confirmFactor();
	 						page = 4;
	 				}
	 			// check range max min and get value
      			// ok for Start Evaluate
	 			}else if (getPage() == 4 ){
	 				waitForStart();
	 					
			      	dout.writeInt(79);
			      	dout.writeInt(tem.size());
			      	for(int i = 0 ; i < tem.size() ; i++){
			      		dout.writeUTF(((Checkbox)tem.elementAt(i)).getLabel().toString());
			      	}
			      	page = 5;
			    // ok for Start Evaluate
	 			}else if (getPage() ==5){
	 				getMaxMinValue();	
	 				
	 				dout.writeInt(80);
      				dout.writeInt(tem.size());
      				for(int i = 0 ; i < tem.size() ; i++){
      					dout.writeUTF(((Checkbox)tem.elementAt(i)).getLabel().toString());
      				}
      				dout.writeUTF(getYaxisLabel());
		      		dout.writeInt(maxYaxisValue);
		      		dout.writeInt(minYaxisValue);
		      		dout.writeUTF(getRadiousLabel());
		      		dout.writeInt(maxRaxisValue);
		      		dout.writeInt(minRaxisValue);
 							
 					vectorOfSuggestion.removeAllElements(); 
 					tem.removeAllElements();   		
      				page = 1;
	 		}
	 }
	 public void buttonCancelPushed() throws Exception{
	 		if(getPage() == 2 ) {
	 			setDefaultPanel();
      			page = 1;
	 		}else if(getPage() == 4){
	 			checkFactor();
	 			page = 3;
	 		}
	 }
	 public void buttonResetPushed() throws Exception {
	 		if(getPage() == 1)
	 			clearText();
	 }
}