import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.applet.*;
import java.awt.event.*;
import java.util.*;
import java.awt.geom.*;


class ShowSummaryAll4Session extends JPanel {
	
	 private JPanel p1 = new JPanel();
 	 private JPanel p2 = new JPanel();
	 private JPanel p3 = new JPanel();
	 
	 
 	 private JLabel LPriority = new JLabel("ระดับความสำคัญ");
	 private JLabel LPosibility = new JLabel("");
	 private JLabel LCost = new JLabel("");

	 

	 private ImageIcon	icob1 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("summaryS.png"));	
	 private ImageIcon	icob2 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("summaryW.png"));	
	 private ImageIcon	icob3 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("summaryO.png"));	
	 private ImageIcon	icob4 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("summaryT.png"));
	 private ImageIcon	icob5 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pushOkorViewGraph.png"));
	
	
	
 	 private JLabel	bHeader1 = new JLabel(icob1);
 	 private JLabel	bHeader2 = new JLabel(icob2);
 	 private JLabel	bHeader3 = new JLabel(icob3);
 	 private JLabel	bHeader4 = new JLabel(icob4);
 	 
  	 private JLabel	bFooter1 = new JLabel(icob5);

	 private GridBagConstraints gbc = new GridBagConstraints();
	 private GridBagLayout gbl;
	
	 private Socket sock;
	 private DataInputStream din;
  	 private DataOutputStream dout;
	 
  	 private Vector vectorOfSuggestionS = new Vector();
  	 private Vector vectorOfPriorityValueS = new Vector();
  	 private Vector vectorOfPosibilityValueS = new Vector();
  	 private Vector vectorOfCostValueS = new Vector();
  	 
  	 
  	 private Vector vectorOfSuggestionW = new Vector();
  	 private Vector vectorOfPriorityValueW = new Vector();
  	 private Vector vectorOfPosibilityValueW = new Vector();
  	 private Vector vectorOfCostValueW = new Vector();
  		 
  	 private Vector vectorOfSuggestionO = new Vector();
  	 private Vector vectorOfPriorityValueO = new Vector();
  	 private Vector vectorOfPosibilityValueO = new Vector();
  	 private Vector vectorOfCostValueO = new Vector();
  	 
  	 
  	 private Vector vectorOfSuggestionT = new Vector();
  	 private Vector vectorOfPriorityValueT = new Vector();
  	 private Vector vectorOfPosibilityValueT = new Vector();
  	 private Vector vectorOfCostValueT = new Vector();
  
  	 
  	 private String yLabelS = "";
  	 private String rLabelS = "";
  	 private int yMaxS;
  	 private int yMinS;
  	 private int rMaxS;
  	 private int rMinS;
  	 
  	 
  	 private String yLabelW = "";
  	 private String rLabelW = "";
  	 private int yMaxW;
  	 private int yMinW;
  	 private int rMaxW;
  	 private int rMinW;
  	 
  	 private String yLabelO = "";
  	 private String rLabelO = "";
  	 private int yMaxO;
  	 private int yMinO;
  	 private int rMaxO;
  	 private int rMinO;
  	 
  	 private String yLabelT = "";
  	 private String rLabelT = "";
  	 private int yMaxT;
  	 private int yMinT;
  	 private int rMaxT;
  	 private int rMinT;
  	 
	 private DrawOvals d = new DrawOvals();
	 	 
	 private Vector sug = new Vector();	 
	 private Vector pri = new Vector();
	 private Vector pos = new Vector();
	 private Vector cos = new Vector();
	 
	 
	 
	 
	 private Vector vectorOfSuggestionG = new Vector();
  	 private Vector vectorOfPriorityValueG = new Vector();
  	 private Vector vectorOfPosibilityValueG = new Vector();
  	 private Vector vectorOfCostValueG = new Vector();
  
	 private String yLabelG = "";
  	 private String rLabelG = "";
  	 private int yMaxG;
  	 private int yMinG;
  	 private int rMaxG;
  	 private int rMinG;
	 
	 
	 
	 private int page = 1;
	 
	 public ShowSummaryAll4Session (Socket sock) {
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
	
	public void showScoreStrenght(){
		
		p1.removeAll();
		p2.removeAll();
		p3.removeAll();
		
		gbc.fill = GridBagConstraints.NONE;
		gbc.anchor = GridBagConstraints.CENTER;
		gbc.insets.top = 0; gbc.insets.bottom = 0;
		gbc.insets.left = 5; gbc.insets.right = 5;
			
		LPriority.setFont(new Font("",0,20));
		LPosibility.setText(yLabelS);
		LPosibility.setFont(new Font("",0,20));
		LCost.setText(rLabelS);
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
		for(i=0 ; i<vectorOfSuggestionW.size() ; i++){
			gbc.anchor = GridBagConstraints.WEST;
			JLabel l = new JLabel((vectorOfSuggestionS.elementAt(i)).toString());
			l.setFont(new Font("",0,20));
			gbc.gridx = 3; gbc.gridy = i+1;											
			p2.add(l,gbc);
			
			gbc.anchor = GridBagConstraints.CENTER;
			JLabel l1 = new JLabel(((vectorOfPriorityValueS.elementAt(i))).toString());	   		   		
			l1.setFont(new Font("",0,20));
			gbc.gridx = 5; gbc.gridy = i+1; 										
			p2.add(l1,gbc);
				
			JLabel l2 = new JLabel(((vectorOfPosibilityValueS.elementAt(i))).toString());	   		   		
			l2.setFont(new Font("",0,20));
			gbc.gridx = 7; gbc.gridy = i+1; 										
			p2.add(l2,gbc);
				
			JLabel l3 = new JLabel(((vectorOfCostValueS.elementAt(i))).toString());	   		   		
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
	
	
		public void showScoreWeakness(){
		
		p1.removeAll();
		p2.removeAll();
		p3.removeAll();
		
		gbc.fill = GridBagConstraints.NONE;
		gbc.anchor = GridBagConstraints.CENTER;
		gbc.insets.top = 0; gbc.insets.bottom = 0;
		gbc.insets.left = 5; gbc.insets.right = 5;
			
		LPriority.setFont(new Font("",0,20));
		LPosibility.setText(yLabelW);
		LPosibility.setFont(new Font("",0,20));
		LCost.setText(rLabelW);
		LCost.setFont(new Font("",0,20));
		
		LPriority.setForeground(Color.BLUE);
		LPosibility.setForeground(Color.blue);
		LCost.setForeground(Color.blue);
		
		gbc.gridwidth = 10; gbc.gridheight = 1;		
		gbc.gridx = 0 ;gbc.gridy = 0;
		gbc.weighty = 0;gbc.weightx = 0;
		gbc.insets.top = 10;
		p1.add(bHeader2,gbc);
		
		gbc.gridwidth = 1;
		gbc.gridx = 5; gbc.gridy = 0;											
		p2.add(LPriority,gbc);	
		gbc.gridx = 7;
		p2.add(LPosibility,gbc);
		gbc.gridx = 9;
		p2.add(LCost,gbc);	
			
					
		gbc.anchor = GridBagConstraints.WEST;
		int i;
		for(i=0 ; i<vectorOfSuggestionW.size() ; i++){
			gbc.anchor = GridBagConstraints.WEST;
			JLabel l = new JLabel((vectorOfSuggestionW.elementAt(i)).toString());
			l.setFont(new Font("",0,20));
			gbc.gridx = 3; gbc.gridy = i+1;											
			p2.add(l,gbc);
			
			gbc.anchor = GridBagConstraints.CENTER;
			JLabel l1 = new JLabel(((vectorOfPriorityValueW.elementAt(i))).toString());	   		   		
			l1.setFont(new Font("",0,20));
			gbc.gridx = 5; gbc.gridy = i+1; 										
			p2.add(l1,gbc);
				
			JLabel l2 = new JLabel(((vectorOfPosibilityValueW.elementAt(i))).toString());	   		   		
			l2.setFont(new Font("",0,20));
			gbc.gridx = 7; gbc.gridy = i+1; 										
			p2.add(l2,gbc);
				
			JLabel l3 = new JLabel(((vectorOfCostValueW.elementAt(i))).toString());	   		   		
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
	
	
	public void showScoreOpportunities(){
		
		p1.removeAll();
		p2.removeAll();
		p3.removeAll();
		
		gbc.fill = GridBagConstraints.NONE;
		gbc.anchor = GridBagConstraints.CENTER;
		gbc.insets.top = 0; gbc.insets.bottom = 0;
		gbc.insets.left = 5; gbc.insets.right = 5;
			
		LPriority.setFont(new Font("",0,20));
		LPosibility.setText(yLabelO);
		LPosibility.setFont(new Font("",0,20));
		LCost.setText(rLabelO);
		LCost.setFont(new Font("",0,20));
		
		LPriority.setForeground(Color.BLUE);
		LPosibility.setForeground(Color.blue);
		LCost.setForeground(Color.blue);
		
		gbc.gridwidth = 10; gbc.gridheight = 1;		
		gbc.gridx = 0 ;gbc.gridy = 0;
		gbc.weighty = 0;gbc.weightx = 0;
		gbc.insets.top = 10;
		p1.add(bHeader3,gbc);
		
		gbc.gridwidth = 1;
		gbc.gridx = 5; gbc.gridy = 0;											
		p2.add(LPriority,gbc);	
		gbc.gridx = 7;
		p2.add(LPosibility,gbc);
		gbc.gridx = 9;
		p2.add(LCost,gbc);	
			
					
		gbc.anchor = GridBagConstraints.WEST;
		int i;
		for(i=0 ; i<vectorOfSuggestionO.size() ; i++){
			gbc.anchor = GridBagConstraints.WEST;
			JLabel l = new JLabel((vectorOfSuggestionO.elementAt(i)).toString());
			l.setFont(new Font("",0,20));
			gbc.gridx = 3; gbc.gridy = i+1;											
			p2.add(l,gbc);
			
			gbc.anchor = GridBagConstraints.CENTER;
			JLabel l1 = new JLabel(((vectorOfPriorityValueO.elementAt(i))).toString());	   		   		
			l1.setFont(new Font("",0,20));
			gbc.gridx = 5; gbc.gridy = i+1; 										
			p2.add(l1,gbc);
				
			JLabel l2 = new JLabel(((vectorOfPosibilityValueO.elementAt(i))).toString());	   		   		
			l2.setFont(new Font("",0,20));
			gbc.gridx = 7; gbc.gridy = i+1; 										
			p2.add(l2,gbc);
				
			JLabel l3 = new JLabel(((vectorOfCostValueO.elementAt(i))).toString());	   		   		
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
	
	public void showScoreThread(){
		
		p1.removeAll();
		p2.removeAll();
		p3.removeAll();
		
		gbc.fill = GridBagConstraints.NONE;
		gbc.anchor = GridBagConstraints.CENTER;
		gbc.insets.top = 0; gbc.insets.bottom = 0;
		gbc.insets.left = 5; gbc.insets.right = 5;
			
		LPriority.setFont(new Font("",0,20));
		LPosibility.setText(yLabelT);
		LPosibility.setFont(new Font("",0,20));
		LCost.setText(rLabelT);
		LCost.setFont(new Font("",0,20));
		
		LPriority.setForeground(Color.BLUE);
		LPosibility.setForeground(Color.blue);
		LCost.setForeground(Color.blue);
		
		gbc.gridwidth = 10; gbc.gridheight = 1;		
		gbc.gridx = 0 ;gbc.gridy = 0;
		gbc.weighty = 0;gbc.weightx = 0;
		gbc.insets.top = 10;
		p1.add(bHeader4,gbc);
		
		gbc.gridwidth = 1;
		gbc.gridx = 5; gbc.gridy = 0;											
		p2.add(LPriority,gbc);	
		gbc.gridx = 7;
		p2.add(LPosibility,gbc);
		gbc.gridx = 9;
		p2.add(LCost,gbc);	
			
					
		gbc.anchor = GridBagConstraints.WEST;
		int i;
		for(i=0 ; i<vectorOfSuggestionT.size() ; i++){
			gbc.anchor = GridBagConstraints.WEST;
			JLabel l = new JLabel((vectorOfSuggestionT.elementAt(i)).toString());
			l.setFont(new Font("",0,20));
			gbc.gridx = 3; gbc.gridy = i+1;											
			p2.add(l,gbc);
			
			gbc.anchor = GridBagConstraints.CENTER;
			JLabel l1 = new JLabel(((vectorOfPriorityValueT.elementAt(i))).toString());	   		   		
			l1.setFont(new Font("",0,20));
			gbc.gridx = 5; gbc.gridy = i+1; 										
			p2.add(l1,gbc);
				
			JLabel l2 = new JLabel(((vectorOfPosibilityValueT.elementAt(i))).toString());	   		   		
			l2.setFont(new Font("",0,20));
			gbc.gridx = 7; gbc.gridy = i+1; 										
			p2.add(l2,gbc);
				
			JLabel l3 = new JLabel(((vectorOfCostValueT.elementAt(i))).toString());	   		   		
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
	
	 	
	 	d.setYaxisName(yLabelG);
	 	d.setRaxisName(rLabelG);
	 	
	 	d.setMaxMinRAxis(rMaxG,rMinG);
	 	d.setMaxMinYAxis(yMaxG,yMinG);
	 	d.setProperty(vectorOfSuggestionG,vectorOfPriorityValueG,vectorOfPosibilityValueG,vectorOfCostValueG);
	 	
	 	remove(p1);
	 	remove(p2);
	 	remove(p3);
	 	
	 	add(d,BorderLayout.CENTER);
	 		
	 	invalidate();
    	repaint();
    	validate();
	}
	
	
	public void prepareDrawGraph(String type){
		
		
		
		if(type.equals("s")){
			
			 vectorOfSuggestionG = vectorOfSuggestionS;
		  	 vectorOfPriorityValueG = vectorOfPriorityValueS;
		  	 vectorOfPosibilityValueG = vectorOfPosibilityValueS ;
		  	 vectorOfCostValueG = vectorOfCostValueS;
		  
			 yLabelG = yLabelS;
		  	 rLabelG = rLabelS ;
		  	 yMaxG = yMaxS;
		  	 yMinG = yMinS;
		  	 rMaxG = rMaxS ;
		  	 rMinG = rMinS;
	 
	 
			
			
			
			}else if(type.equals("w")){
				
					
					 vectorOfSuggestionG = vectorOfSuggestionW;
				  	 vectorOfPriorityValueG = vectorOfPriorityValueW;
				  	 vectorOfPosibilityValueG = vectorOfPosibilityValueW ;
				  	 vectorOfCostValueG = vectorOfCostValueW;
				  
					 yLabelG = yLabelW;
				  	 rLabelG = rLabelW ;
				  	 yMaxG = yMaxW;
				  	 yMinG = yMinW;
				  	 rMaxG = rMaxW ;
				  	 rMinG = rMinW;
						
				
				}else if(type.equals("o")){
					
									
						 vectorOfSuggestionG = vectorOfSuggestionO;
					  	 vectorOfPriorityValueG = vectorOfPriorityValueO;
					  	 vectorOfPosibilityValueG = vectorOfPosibilityValueO;
					  	 vectorOfCostValueG = vectorOfCostValueO;
					  
						 yLabelG = yLabelO;
					  	 rLabelG = rLabelO ;
					  	 yMaxG = yMaxO;
					  	 yMinG = yMinO;
					  	 rMaxG = rMaxO ;
					  	 rMinG = rMinO;
								
						
					}else if(type.equals("t")){
						
										
								 vectorOfSuggestionG = vectorOfSuggestionT;
							  	 vectorOfPriorityValueG = vectorOfPriorityValueT;
							  	 vectorOfPosibilityValueG = vectorOfPosibilityValueT;
							  	 vectorOfCostValueG = vectorOfCostValueT;
							  
								 yLabelG = yLabelT;
							  	 rLabelG = rLabelT ;
							  	 yMaxG = yMaxT;
							  	 yMinG = yMinT;
							  	 rMaxG = rMaxT ;
							  	 rMinG = rMinT;
											
									
							
						}
					
		
		
	}
	
	public void setFactorStrenght(Vector aSuggestion  , Vector aPriority , Vector aPosibility , Vector aCost, String aYLabel,
											int aYMax , int aYMin , String aRLabel ,int aRMax , int aRMin){
		 LPosibility.setText(aYLabel);
		 LCost.setText(aRLabel);
		 
		 yLabelS = aYLabel;
		 rLabelS = aRLabel;
		 
		 yMinS = aYMin;
		 yMaxS = aYMax;
		 rMinS = aRMin;
		 rMaxS = aRMin;
		 
		 vectorOfSuggestionS = aSuggestion;
		 vectorOfPriorityValueS = aPriority;
		 vectorOfPosibilityValueS = aPosibility;
		 vectorOfCostValueS = aCost;
	}
	
	
	public void setFactorWeakness(Vector aSuggestion  , Vector aPriority , Vector aPosibility , Vector aCost, String aYLabel,
											int aYMax , int aYMin , String aRLabel ,int aRMax , int aRMin){
		 LPosibility.setText(aYLabel);
		 LCost.setText(aRLabel);
		 
		 yLabelW = aYLabel;
		 rLabelW = aRLabel;
		 
		 yMinW = aYMin;
		 yMaxW = aYMax;
		 rMinW = aRMin;
		 rMaxW = aRMin;
		 
		 vectorOfSuggestionW = aSuggestion;
		 vectorOfPriorityValueW = aPriority;
		 vectorOfPosibilityValueW = aPosibility;
		 vectorOfCostValueW = aCost;
	}
	
		public void setFactorOpportunities(Vector aSuggestion  , Vector aPriority , Vector aPosibility , Vector aCost, String aYLabel,
											int aYMax , int aYMin , String aRLabel ,int aRMax , int aRMin){
		 LPosibility.setText(aYLabel);
		 LCost.setText(aRLabel);
		 
		 yLabelO = aYLabel;
		 rLabelO = aRLabel;
		 
		 yMinO = aYMin;
		 yMaxO = aYMax;
		 rMinO = aRMin;
		 rMaxO = aRMin;
		 
		 vectorOfSuggestionO = aSuggestion;
		 vectorOfPriorityValueO = aPriority;
		 vectorOfPosibilityValueO = aPosibility;
		 vectorOfCostValueO = aCost;	
	}
	
		public void setFactorThread(Vector aSuggestion  , Vector aPriority , Vector aPosibility , Vector aCost, String aYLabel,
											int aYMax , int aYMin , String aRLabel ,int aRMax , int aRMin){
		 LPosibility.setText(aYLabel);
		 LCost.setText(aRLabel);
		 
		 yLabelT = aYLabel;
		 rLabelT = aRLabel;
		 
		 yMinT = aYMin;
		 yMaxT = aYMax;
		 rMinT = aRMin;
		 rMaxT = aRMin;
		 
		 vectorOfSuggestionT = aSuggestion;
		 vectorOfPriorityValueT = aPriority;
		 vectorOfPosibilityValueT = aPosibility;
		 vectorOfCostValueT = aCost;
	}
	
}
