import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.awt.event.*;
import java.util.*;

class ConfirmFactorName extends JPanel{
	 private JPanel p1 = new JPanel();
	 private JPanel p2 = new JPanel();
	 private JPanel p3 = new JPanel();
	 
	 private JTextField Radious1 = new JTextField();
	 private JTextField Yaxis1 = new JTextField();
	 private JTextField MaxYaxis1 = new JTextField();
	 private JTextField MinYaxis1 = new JTextField();
	 private JTextField MaxRadious1 = new JTextField();
	 private JTextField MinRadious1 = new JTextField();
	 
	 private JLabel lblrule;
	 
	 private ImageIcon	icob1 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("selectSuggestion.png"));
	 private JLabel	bHeader = new JLabel(icob1);
	 
	 private GridBagConstraints gc = new GridBagConstraints();
	 private DataInputStream din;
  	 private DataOutputStream dout;
  	 private Socket sock;
  	 
  	  public ConfirmFactorName(Socket sock) {
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
	 	
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 
	 	gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.CENTER;
		gc.insets.top = 0; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
	
		gc.gridwidth = 20; gc.gridheight = 1;		
		gc.gridx = 0 ;gc.gridy = 0;
		gc.weighty = 0;gc.weightx = 0;
		p1.add(bHeader,gc);
		
		//--------------------------------------------
		gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.EAST;
		
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 0;
			
		JLabel Max = new JLabel("Max Value");
		Max.setFont(new Font("",0,30));
		Max.setForeground(Color.orange);										
		p2.add(Max,gc);	
				
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 0;
		
		JLabel Min = new JLabel("Min Value");
		Min.setFont(new Font("",0,30));
		Min.setForeground(Color.orange);										
		p2.add(Min,gc);		
				
		gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.WEST;
		//--------------------------------------------------
		
		gc.fill = GridBagConstraints.BOTH;
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 0 ;gc.gridy = 1;
		gc.weighty = 0;gc.weightx = 0;
			
		JLabel Xaxis = new JLabel("Xaxis is");
		Xaxis.setFont(new Font("",0,30));
		Xaxis.setForeground(Color.orange);										
		p2.add(Xaxis,gc);
		
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 4 ;gc.gridy = 1;
			
		JLabel Xaxis1 = new JLabel("Priority Value");
		Xaxis1.setFont(new Font("",0,30));
		Xaxis1.setForeground(Color.blue);										
		p2.add(Xaxis1,gc);
		
		//--------------------------------------------------------
		//   Posibility
		//-----------------------------------------------------
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 0 ;gc.gridy = 2;
			
		JLabel Yaxis = new JLabel("Yaxis is");
		Yaxis.setFont(new Font("",0,30));
		Yaxis.setForeground(Color.orange);										
		p2.add(Yaxis,gc);
		
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 4 ;gc.gridy = 2;
			
		Yaxis1.setText("Posibility Value");
		Yaxis1.setFont(new Font("",0,30));
		Yaxis1.setForeground(Color.blue);
		Yaxis1.setEditable(true);										
		p2.add(Yaxis1,gc);
			
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 2;
		
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.EAST;
		
				
		MaxYaxis1.setText("0");
		MaxYaxis1.setFont(new Font("",0,30));
		MaxYaxis1.setForeground(Color.blue);
		MaxYaxis1.setEditable(true);										
		p2.add(MaxYaxis1,gc);	
			
			
			
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 2;
				
		MinYaxis1.setText("10");
		MinYaxis1.setFont(new Font("",0,30));
		MinYaxis1.setForeground(Color.blue);
		MinYaxis1.setEditable(true);										
		p2.add(MinYaxis1,gc);	
	
	//--------------------------------------------------------
	//			Radious   
	//-----------------------------------------------------
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.WEST;
			
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 0 ;gc.gridy = 3;	
			
		JLabel Radious = new JLabel("Radious is");
		Radious.setFont(new Font("",0,30));
		Radious.setForeground(Color.orange);										
		p2.add(Radious,gc);
		
		gc.gridwidth = 4;gc.gridheight = 1;	
		gc.gridx = 4 ;gc.gridy =3;
			
		Radious1.setText("Radious is");
		Radious1.setFont(new Font("",0,30));
		Radious1.setForeground(Color.blue);
		Radious1.setEditable(true);										
		p2.add(Radious1,gc);
	
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.EAST;
		
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 13 ;gc.gridy = 3;
				
		MaxRadious1.setText("0");
		MaxRadious1.setFont(new Font("",0,30));
		MaxRadious1.setForeground(Color.blue);
		MaxRadious1.setEditable(true);										
		p2.add(MaxRadious1,gc);	
			
		gc.gridwidth = 3;gc.gridheight = 1;	
		gc.gridx = 17 ;gc.gridy = 3;
				
		MinRadious1.setText("10");
		MinRadious1.setFont(new Font("",0,30));
		MinRadious1.setForeground(Color.blue);
		MinRadious1.setEditable(true);										
		p2.add(MinRadious1,gc);	
	
		//--------------------------------------------------------
	 	add(p1,BorderLayout.NORTH);
	 	add(p2,BorderLayout.CENTER);
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
}
