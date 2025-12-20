import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.applet.*;
import java.awt.event.*;
import java.util.*;
import java.awt.geom.*;

class EvaluatePanel extends JPanel {
	 private JPanel p1 = new JPanel();
 	 private JPanel p2 = new JPanel();
	 private JPanel p3 = new JPanel();
	 private JPanel p4 = new JPanel();
 	 private JPanel p5 = new JPanel();
	 private JPanel p6 = new JPanel();
	
	 private JLabel LPriority = new JLabel("ระดับความสำคัญ");
	 private JLabel LPosibility = new JLabel("");
	 private JLabel LCost = new JLabel("");

	 private ImageIcon	icob1 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pleaseInputValue.png"));
	 private ImageIcon	icob3 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pushOkorViewGraph.png"));
	 private ImageIcon	icob4 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("showEvaluateResult.png"));
	 private ImageIcon	icob5 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pushOkorReset.png"));
	 private ImageIcon	icob6 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("pushOkorCancel.png"));

 	 private JLabel	bHeader1 = new JLabel(icob1);
 	 private JLabel bHeader3 = new JLabel(icob4);
	 private JLabel bFooter  = new JLabel(icob3);
	 private JLabel bFooter1 = new JLabel(icob5);
	 private JLabel bFooter2 = new JLabel(icob6);
	 		
     private String detailPosibility[] = {"1","2","3","4","5","6","7","8","9","10"};
	 private String detailCost[] = {"10","20","30","40","50","60","70","80","90","100"};
	 private String detailPriority[];
	 private String detailYaxis[];
	 private String detailRaxis[];	
	
	 private GridBagConstraints gbc = new GridBagConstraints();
	 private GridBagLayout gbl;
		
	 private Socket sock;
	 private DataInputStream din;
  	 private DataOutputStream dout;
  	 
  	 private Vector tem = new Vector();
  	 
  	 private Vector vectorOfSuggestions = new Vector();
  	 private Vector vectorOfPriorityValue = new Vector();
  	 private Vector vectorOfPosibilityValue = new Vector();
  	 private Vector vectorOfCostValue = new Vector();
  	 
  	 private Vector selectedPriorityValue = new Vector();
  	 private Vector selectedPosibilityValue = new Vector();
  	 private Vector selectedCostValue = new Vector();
  	 
  	 private int page = 1;
  	 
  	 private String yLable = "";
  	 private String rLable = "";
  	 private int yMax;
  	 private int yMin;
  	 private int rMax;
  	 private int rMin;
  	 
	 private DrawOvals d = new DrawOvals();
	 
	 private Vector pri = new Vector();
	 private Vector pos = new Vector();
	 private Vector cos = new Vector();
  	 
  	 public EvaluatePanel(Socket sock) {
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
	   	p5.setLayout(new GridBagLayout());
	 	p6.setLayout(new GridBagLayout());
	 	
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 	p3.setBackground(Color.WHITE);
	 	p5.setBackground(Color.WHITE);
	 	p6.setBackground(Color.WHITE);
	 	
	 	gbc.fill = GridBagConstraints.NONE;
		gbc.anchor = GridBagConstraints.CENTER;
		gbc.insets.top = 0; gbc.insets.bottom = 0;
		gbc.insets.left = 5; gbc.insets.right = 5;
	
		gbc.gridwidth = 10; gbc.gridheight = 1;		
		gbc.gridx = 0 ;gbc.gridy = 0;
		gbc.weighty = 0;gbc.weightx = 0;
		p1.add(bHeader1,gbc);
	
	 	add(p1,BorderLayout.NORTH);	 	
	}
	public  void setTextBox(Vector aVector) {
		
		tem.removeAllElements();
		pri.removeAllElements();
		pos.removeAllElements();
		cos.removeAllElements();

		vectorOfSuggestions.removeAllElements();
		vectorOfPriorityValue.removeAllElements();
  	 	vectorOfPosibilityValue.removeAllElements();
  	 	vectorOfCostValue.removeAllElements();
  	 	
  	 	selectedPriorityValue.removeAllElements();
  	 	selectedPosibilityValue.removeAllElements();
  	    selectedCostValue.removeAllElements();
		
		tem = aVector;
		
		p2.removeAll();
		p3.removeAll();
		p4.removeAll();
		p5.removeAll();
		p6.removeAll();
 	  
 	 	remove(p2);
	  	remove(p3);
	  	remove(p4);
	  	remove(p5);
	  	remove(p6);
		
		detailPriority = new String[tem.size()];
		for(int i = 0 ; i < tem.size() ; i++){
			detailPriority[i] = Integer.toString (i+1);
		}
		
		int rangeY = yMax-yMin;
		int scaleY;
		
		if(rangeY <= 20 ){
			scaleY = rangeY;
			detailYaxis = new String[scaleY+1];
			
			for(int i = 0 ; i <= scaleY ; i++){
				detailYaxis[i] = Integer.toString(yMin + (i));
			}
		} else{
			scaleY = rangeY/10;
			detailYaxis = new String[11];
			for(int i = 0 ; i <= 10 ; i++){	
				detailYaxis[i] = Integer.toString(  yMin + (i*scaleY) );
			}
		}
		
		int rangeR = rMax-rMin;
		int scaleR = rangeR/10;
		detailRaxis = new String[11];
		
		for(int i = 0 ; i <= 10 ; i++){
			detailRaxis[i] = Integer.toString(  rMin + (i*scaleR) );
		}
		
		gbc.fill = GridBagConstraints.BOTH;
		gbc.anchor = GridBagConstraints.NORTH;
		gbc.gridwidth = 1;
		gbc.insets.top = 10;
		 
		LPriority.setFont(new Font("",0,28)); //20
		LPosibility.setText(yLable);
		LPosibility.setFont(new Font("",0,28));
		LCost.setText(rLable);
		LCost.setFont(new Font("",0,28));
		
		LPriority.setForeground(Color.BLUE);
		LPosibility.setForeground(Color.blue);
		LCost.setForeground(Color.blue);
			
		gbc.gridx = 5; gbc.gridy = 0;											
		p2.add(LPriority,gbc);	
		gbc.gridx = 7;
		p2.add(LPosibility,gbc);
		gbc.gridx = 9;
		p2.add(LCost,gbc);
			
		int i;
		for(i=0 ; i<tem.size() ; i++){
				String s1 = (tem.elementAt(i)).toString();
				JLabel c = new JLabel( (i+1) + ". " + s1);
				
				//**************************************
				
				c.setFont(new Font("",0,20)); //16
				gbc.gridx = 3; gbc.gridy = i+1;											// position of grid [like array two dimention]
				p2.add(c,gbc);
				vectorOfSuggestions.addElement(c);

				//**************************************
	
				JComboBox c1 = new JComboBox(detailPriority);	
				c1.setEditable(false);
				c1.setAlignmentX(Component.LEFT_ALIGNMENT);
				c1.setMaximumRowCount(10);
				c1.setSelectedIndex(0);	
				c1.setFont(new Font("",0,16));
				gbc.gridx = (5) ; gbc.gridy = i+1;											// position of grid [like array two dimention]
				p2.add(c1,gbc);
				vectorOfPriorityValue.addElement(c1);
			
				JComboBox c2 = new JComboBox(detailYaxis);
				c2.setEditable(false);
				c2.setAlignmentX(Component.LEFT_ALIGNMENT);
				c2.setMaximumRowCount(10);
				c2.setSelectedIndex(0);
				c2.setFont(new Font("",0,16)); //12
				gbc.gridx = (7) ; gbc.gridy = i+1;											// position of grid [like array two dimention]
				p2.add(c2,gbc);
				vectorOfPosibilityValue.addElement(c2);
				
				JComboBox c3 = new JComboBox(detailRaxis);	
				c3.setEditable(false);
				c3.setAlignmentX(Component.LEFT_ALIGNMENT);
				c3.setMaximumRowCount(10);
				c3.setSelectedIndex(0);
				c3.setFont(new Font("",0,16));

				gbc.gridx = (9) ; gbc.gridy = i+1;											// position of grid [like array two dimention]
				p2.add(c3,gbc);
				vectorOfCostValue.addElement(c3);
		}
		
		gbc.anchor = GridBagConstraints.CENTER;
		gbc.fill = GridBagConstraints.BOTH;	
		gbc.gridwidth = 10;	
		gbc.gridx = 0 ;gbc.gridy = 0;
		p5.add(bFooter1,gbc);
		
		add(p2,BorderLayout.CENTER);
		add(p5,BorderLayout.SOUTH);
		
		invalidate();
    	repaint();
    	validate();
	 }
	 private void showValue(){
	 	p1.removeAll();	
	 	p2.removeAll();
	 	p3.removeAll();	
	 		 		
	 	//
	 	gbc.fill = GridBagConstraints.NONE;
		gbc.anchor = GridBagConstraints.NORTH;
		
		LPriority.setFont(new Font("",0,26));
		LPosibility.setText(yLable);
		LPosibility.setFont(new Font("",0,26));
		LCost.setText(rLable);
		LCost.setFont(new Font("",0,26));
		
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
			
		int i;
		for(i=0 ; i<tem.size() ; i++){
			
				gbc.anchor = GridBagConstraints.WEST;
				
				JLabel l = new JLabel((((JLabel)(vectorOfSuggestions.elementAt(i))).getText()).toString());
				l.setFont(new Font("",0,20)); //20
				gbc.gridx = 3; gbc.gridy = i+1;											
				p2.add(l,gbc);
				
				gbc.anchor = GridBagConstraints.CENTER;
				
				JLabel l1 = new JLabel((((JComboBox)(vectorOfPriorityValue.elementAt(i))).getSelectedItem().toString()));	   		   		
				l1.setFont(new Font("",0,20));
				gbc.gridx = 5; gbc.gridy = i+1; 										
				p2.add(l1,gbc);
					
				pri.addElement((((JComboBox)(vectorOfPriorityValue.elementAt(i))).getSelectedItem().toString()));	
				
				JLabel l2 = new JLabel((((JComboBox)(vectorOfPosibilityValue.elementAt(i))).getSelectedItem().toString()));	   		   		
				l2.setFont(new Font("",0,20));
				gbc.gridx = 7; gbc.gridy = i+1; 										
				p2.add(l2,gbc);
				
				pos.addElement((((JComboBox)(vectorOfPosibilityValue.elementAt(i))).getSelectedItem().toString()));
				
				JLabel l3 = new JLabel((((JComboBox)(vectorOfCostValue.elementAt(i))).getSelectedItem().toString()));	   		   		
				l3.setFont(new Font("",0,20));
				gbc.gridx = 9; gbc.gridy = i+1; 										
				p2.add(l3,gbc);
				
				cos.addElement((((JComboBox)(vectorOfCostValue.elementAt(i))).getSelectedItem().toString()));
		}
		
		gbc.gridwidth = 10; gbc.gridheight = 1;		
		gbc.gridx = 0 ;gbc.gridy = 0;
		gbc.weighty = 0;gbc.weightx = 0;
		
		p3.add(bFooter,gbc);
		
		remove(d);
		remove(p5);
	 	
		add(p1,BorderLayout.NORTH);	
		add(p2,BorderLayout.CENTER);
		add(p3,BorderLayout.SOUTH);
		
		invalidate();
    	repaint();
    	validate();
	 }
	private void setDefault(){
		p1.removeAll();	
	 	p2.removeAll();
	 	p3.removeAll();
	 	
	 	pri.removeAllElements();
	 	cos.removeAllElements();
	 	pos.removeAllElements();
	 	
	 	vectorOfPriorityValue.removeAllElements();
	 	vectorOfPosibilityValue.removeAllElements();
	 	vectorOfCostValue.removeAllElements();	
		
		gbc.fill = GridBagConstraints.BOTH;
		gbc.anchor = GridBagConstraints.NORTH;
		gbc.insets.top = 10;
		
		LPosibility.setText(yLable);
		LCost.setText(rLable);
		LPriority.setFont(new Font("",0,26));
		LPosibility.setFont(new Font("",0,26));
		LCost.setFont(new Font("",0,26));
		
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
			
		int i;
		for(i=0 ; i<tem.size() ; i++){
				String s1 = (tem.elementAt(i)).toString();
				JLabel c = new JLabel( (i+1) + ". " + s1);
				c.setFont(new Font("",0,20));
				gbc.gridx = 3; gbc.gridy = i+1;											// position of grid [like array two dimention]
				p2.add(c,gbc);
				vectorOfSuggestions.addElement(c);

				JComboBox c1 = new JComboBox(detailPriority);	
				c1.setEditable(false);
				c1.setAlignmentX(Component.LEFT_ALIGNMENT);
				c1.setMaximumRowCount(20);
				c1.setSelectedIndex(0);	
				c1.setFont(new Font("",0,16)); //12
				gbc.gridx = (5) ; gbc.gridy = i+1;											// position of grid [like array two dimention]
				p2.add(c1,gbc);
				vectorOfPriorityValue.addElement(c1);
			
				JComboBox c2 = new JComboBox(detailYaxis);
				c2.setEditable(false);
				c2.setAlignmentX(Component.LEFT_ALIGNMENT);
				c2.setMaximumRowCount(20);
				c2.setSelectedIndex(0);
				c2.setFont(new Font("",0,16));
				gbc.gridx = (7) ; gbc.gridy = i+1;											// position of grid [like array two dimention]
				p2.add(c2,gbc);
				vectorOfPosibilityValue.addElement(c2);
				
				JComboBox c3 = new JComboBox(detailRaxis);	
				c3.setEditable(false);
				c3.setAlignmentX(Component.LEFT_ALIGNMENT);
				c3.setMaximumRowCount(20);
				c3.setSelectedIndex(0);
				c3.setFont(new Font("",0,16));
				gbc.gridx = (9) ; gbc.gridy = i+1;											// position of grid [like array two dimention]
				p2.add(c3,gbc);
				vectorOfCostValue.addElement(c3);
		}
		
		gbc.anchor = GridBagConstraints.CENTER;
		gbc.fill = GridBagConstraints.BOTH;	
		gbc.gridwidth = 10;	
		gbc.gridx = 0 ;gbc.gridy = 0;
		p5.add(bFooter1,gbc);
		add(p5,BorderLayout.SOUTH);
		
		remove(d);
		remove(p6);
		remove(p3);
		
		add(p1,BorderLayout.NORTH);
		add(p2,BorderLayout.CENTER);
		add(p5,BorderLayout.SOUTH);
		
		invalidate();
    	repaint();
    	validate();
	}
	public void setFactor(String aYLable,int aYMax , int aYMin , String aRLable , int aRMax , int aRMin){
		 LPosibility.setText(aYLable);
		 LCost.setText(aRLable);
		 
		 yLable = aYLable;
		 rLable = aRLable;
		 
		 yMin = aYMin;
		 yMax = aYMax;
		 rMin = aRMin;
		 rMax = aRMax;
	}
	
	public  void clearText() {
	   		for(int i = 0 ; i < vectorOfSuggestions.size() ; i ++ ){
	   			((JComboBox)(vectorOfPriorityValue.elementAt(i))).setSelectedIndex(0);
	   			((JComboBox)(vectorOfPosibilityValue.elementAt(i))).setSelectedIndex(0);
	   			((JComboBox)(vectorOfCostValue.elementAt(i))).setSelectedIndex(0);
	   		}
	 }
	 private  void getText() throws Exception {
	   		dout.writeInt(82);
		    dout.writeInt(vectorOfSuggestions.size());
		    
		    
			for(int i = 0 ; i < vectorOfSuggestions.size() ; i ++ ){
		   		
		   		dout.writeUTF((((JLabel)(vectorOfSuggestions.elementAt(i))).getText()).toString());
		   	 	dout.writeUTF((((JComboBox)(vectorOfPriorityValue.elementAt(i))).getSelectedItem()).toString());
		      	dout.writeUTF((((JComboBox)(vectorOfPosibilityValue.elementAt(i))).getSelectedItem()).toString());
		      	dout.writeUTF((((JComboBox)(vectorOfCostValue.elementAt(i))).getSelectedItem()).toString());
		    }
		    
	   		dout.writeUTF(yLable);
	   		dout.writeInt(yMax);
	   		dout.writeInt(yMin);
	   		dout.writeUTF(rLable);
	   		dout.writeInt(rMax);
	   		dout.writeInt(rMin); 

	   		
	}

	
	public int getPage(){
		return page;
	}
	public void  drawGraph(){
		
		
	 	d.setYaxisName(yLable);
	 	d.setRaxisName(rLable);
	 		
	 	d.setMaxMinRAxis(rMax,rMin);
	 	d.setMaxMinYAxis(yMax,yMin);
	 	d.setProperty(tem,pri,pos,cos);
	 	
	 	remove(p1);
	 	remove(p2);
	 	remove(p3);
	 	remove(p5);
	 	remove(p6);
	 	
	 	add(d,BorderLayout.CENTER);
	 		
	 	invalidate();
    	repaint();
    	validate();
	}
		
	public void buttonOkPushed() throws Exception{
		if(getPage() == 1){
			showValue();		
			page = 2;
			
			
			// at page = 2 can view graph
			}else if(( getPage() == 2) || (getPage() == 3)){
				getText();
				page = 1;
		
	  		}
	}
	public void buttonCancelPushed(){
		//Cancel only on page confirm
		if(getPage() == 2){
			setDefault();
			page = 1;
		
			
		}else if(getPage() == 3){
			showValue();
			page = 2;
	
		}
	}
	public void buttonResetPushed(){
		if(getPage() == 1 ){
			clearText();
		}
	}
	public void buttonViewGraphPushed(){
		if(getPage()== 2){
			drawGraph();
			page = 3;
		
			
		}
	}
}
 