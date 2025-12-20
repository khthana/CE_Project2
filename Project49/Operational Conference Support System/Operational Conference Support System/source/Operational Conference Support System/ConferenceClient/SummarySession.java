import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.applet.*;
import java.awt.event.*;
import java.util.*;
import java.awt.geom.*;

class SummarySession extends JPanel {
	 private JPanel p1 = new JPanel();
 	 private JPanel p2 = new JPanel();
	 private JPanel p3 = new JPanel();
	 
	 private JLabel LPriority = new JLabel("ระดับความสำคัญ");
	 private JLabel LPosibility = new JLabel("");
	 private JLabel LCost = new JLabel("");

	 private ImageIcon	icob1 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("showSummaryEvaluate.png"));	
	 private ImageIcon	icob2 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pushOkorViewGraph.png"));
	
 	 private JLabel	bHeader1 = new JLabel(icob1);
  	 private JLabel	bFooter1 = new JLabel(icob2);

	 private GridBagConstraints gbc = new GridBagConstraints();
	 private GridBagLayout gbl;
	
	 private Socket sock;
	 private DataInputStream din;
  	 private DataOutputStream dout;
	 
  	 private Vector vectorOfSuggestions = new Vector();
  	 private Vector vectorOfPriorityValue = new Vector();
  	 private Vector vectorOfPosibilityValue = new Vector();
  	 private Vector vectorOfCostValue = new Vector();
  	 
  	 private int page = 1;
  	 private String yLable = "";
  	 private String rLable = "";
  	 private int yMax;
  	 private int yMin;
  	 private int rMax;
  	 private int rMin;
  	 
	 private DrawOvals d = new DrawOvals();
	 	 
	 private Vector sug = new Vector();	 
	 private Vector pri = new Vector();
	 private Vector pos = new Vector();
	 private Vector cos = new Vector();
  	 
  	 public SummarySession (Socket sock) {
		try {
			this.sock = sock;
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() throws Exception{
		din   = new DataInputStream(sock.getInputStream());
      	dout  = new DataOutputStream(sock.getOutputStream());
      					
		setBackground(Color.WHITE);
	 	setLayout(new BorderLayout());
	 		 	
	 	p1.setLayout(new GridBagLayout());
	 	p2.setLayout(new GridBagLayout());
	 	p3.setLayout(new GridBagLayout());
	 
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 	p3.setBackground(Color.WHITE);
	}
	public void showScore(){
		p2.removeAll();
		p3.removeAll();
		
		gbc.fill = GridBagConstraints.NONE;
		gbc.anchor = GridBagConstraints.CENTER;
		gbc.insets.top = 0; gbc.insets.bottom = 0;
		gbc.insets.left = 5; gbc.insets.right = 5;
			
		LPriority.setFont(new Font("",0,20));
		LPosibility.setText(yLable);
		LPosibility.setFont(new Font("",0,20));
		LCost.setText(rLable);
		LCost.setFont(new Font("",0,20));
		
		LPriority.setForeground(Color.BLUE);
		LPosibility.setForeground(Color.blue);
		LCost.setForeground(Color.blue);
		
		gbc.gridwidth = 10; gbc.gridheight = 1;		
		gbc.gridx = 0 ;gbc.gridy = 0;
		gbc.weighty = 0;gbc.weightx = 0;
		gbc.insets.top = 10;
		p1.add(bHeader1,gbc);
		
		gbc.gridwidth = 1;
		gbc.gridx = 5; gbc.gridy = 0;											
		p2.add(LPriority,gbc);	
		gbc.gridx = 7;
		p2.add(LPosibility,gbc);
		gbc.gridx = 9;
		p2.add(LCost,gbc);	
		
		gbc.anchor = GridBagConstraints.WEST;
		int i;
		for(i=0 ; i<vectorOfSuggestions.size() ; i++){
			gbc.anchor = GridBagConstraints.WEST;
			JLabel l = new JLabel((vectorOfSuggestions.elementAt(i)).toString());
			l.setFont(new Font("",0,20));
			gbc.gridx = 3; gbc.gridy = i+1;											
			p2.add(l,gbc);
			
			gbc.anchor = GridBagConstraints.CENTER;
			JLabel l1 = new JLabel(((vectorOfPriorityValue.elementAt(i))).toString());	   		   		
			l1.setFont(new Font("",0,20));
			gbc.gridx = 5; gbc.gridy = i+1; 										
			p2.add(l1,gbc);
				
			JLabel l2 = new JLabel(((vectorOfPosibilityValue.elementAt(i))).toString());	   		   		
			l2.setFont(new Font("",0,20));
			gbc.gridx = 7; gbc.gridy = i+1; 										
			p2.add(l2,gbc);
				
			JLabel l3 = new JLabel(((vectorOfCostValue.elementAt(i))).toString());	   		   		
			l3.setFont(new Font("",0,20));
			gbc.gridx = 9; gbc.gridy = i+1; 										
			p2.add(l3,gbc);
		}
		
		gbc.gridwidth = 10; gbc.gridheight = 1;		
		gbc.gridx = 0 ;gbc.gridy = 0;
		gbc.weighty = 0;gbc.weightx = 0;
		gbc.insets.top = 10;
		p3.add(bFooter1,gbc);
	 	
	 	remove(d);
	 	
		add(p1,BorderLayout.NORTH);	
		add(p2,BorderLayout.CENTER);
		add(p3,BorderLayout.SOUTH);
		
		invalidate();
    	repaint();
    	validate();
	}
	public void  drawGraph(){
	 	d.setYaxisName(yLable);
	 	d.setRaxisName(rLable);
	 	
	 	d.setMaxMinRAxis(rMax,rMin);
	 	d.setMaxMinYAxis(yMax,yMin);
	 	d.setProperty(vectorOfSuggestions,vectorOfPriorityValue,vectorOfPosibilityValue,vectorOfCostValue);
	 	
	 	remove(p1);
	 	remove(p2);
	 	remove(p3);
	 	
	 	add(d,BorderLayout.CENTER);
	 		
	 	invalidate();
    	repaint();
    	validate();
	}
	public void setFactor(Vector aSuggestion  , Vector aPriority , Vector aPosibility , Vector aCost, String aYLable,
											int aYMax , int aYMin , String aRLable , int aRMax , int aRMin){
		 LPosibility.setText(aYLable);
		 LCost.setText(aRLable);
		 
		 yLable = aYLable;
		 rLable = aRLable;
		 
		 yMin = aYMin;
		 yMax = aYMax;
		 rMin = aRMin;
		 rMax = aRMin;
		 
		 vectorOfSuggestions = aSuggestion;
		 vectorOfPriorityValue = aPriority;
		 vectorOfPosibilityValue = aPosibility;
		 vectorOfCostValue = aCost;
	}
	public int getPage(){
		return page;
	}
	public void buttonOkPushed() throws Exception {
		if(getPage() == 1 ) {
			page = 2;
			dout.writeInt(83);
		}else if( getPage() == 2 ){
			page  = 1;
			dout.writeInt(83);
		}
	}
	public void buttonCancelPushed(){
		//Cancel only on page confirm
		if(getPage() == 2){
			 showScore();
				 
			 page = 1; 			//set page 1
		}
	}
	public void buttonViewGraphPushed(){
		if(getPage()== 1){
			drawGraph();
			page = 2;
		}
	}
}