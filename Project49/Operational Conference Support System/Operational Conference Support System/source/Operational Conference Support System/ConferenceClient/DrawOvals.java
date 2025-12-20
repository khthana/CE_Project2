import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import java.awt.geom.*;
import java.util.*;

public class DrawOvals extends JPanel {
	private  int diameter;	//= 50;
	private  int x ;		//= 50;
	private  int y ;			//= 50;
	private  int x1 , x2;
	private  int y1 , y2;
	
	private  String suggestion;
	private  String topicName;
	
	private  int numberOfSuggestion;
	
	private JPanel p1 = new JPanel();
	private JPanel p2 = new JPanel();
	private JPanel p3 = new JPanel();
	private JPanel p4 = new JPanel();
  	private ImageIcon	icob1 = new ImageIcon(ShowAllSuggestionPanel.class.getResource("confirmToContinue.png"));
	private JLabel	b1 = new JLabel(icob1);
	
	private Vector vectorOfSuggestion = new Vector();
	private Vector vectorOfPriority = new Vector();
	private Vector vectorOfPosibility = new Vector();
	private Vector vectorOfCost = new Vector();
	
	private GridBagConstraints gc = new GridBagConstraints();
  	 
  	private String yAxisName = "";
  	private String rAxisName = "";
  	private String xAxisName = "ระดับความสำคัญ";
  	private int maxYAxis = 10;
  	private int minYAxis = 0;
  	private int maxRAxis = 100;
  	private int minRAxis = 10;
  	
  	private Font font1 = new Font("",0,28); 
  	private Font font2 = new Font("",0,32); 
  	
  	
  	//************************************************
  	
  	
  	private int originY = 500;  //500
  	private int originX = 100;  //140
  	
  	//************************************************
  	
	
	public DrawOvals() {
	 	setBackground(Color.WHITE);
	 	setLayout(new BorderLayout());
	 	
	 	p1.setLayout(new GridBagLayout());
	 	p2.setLayout(new GridBagLayout());
	 	p3.setLayout(new GridBagLayout());
	 	p4.setLayout(new GridBagLayout());
	 	
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 	p3.setBackground(Color.WHITE);
	 	p4.setBackground(Color.WHITE);
	 	
	 	gc.fill = GridBagConstraints.NONE;
		gc.anchor = GridBagConstraints.CENTER;
		gc.insets.top = 0; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;	
		gc.gridwidth = 10; gc.gridheight = 1;		
		gc.gridx = 0 ;gc.gridy = 0;
		gc.weighty = 0;gc.weightx = 0;

	 	add(p1,BorderLayout.NORTH);
	 	add(p2,BorderLayout.SOUTH);	 	
	}
	public void paintComponent(Graphics g){
		super.paintComponent(g);
		Graphics2D g2d = (Graphics2D) g ;
		g.setFont(font1);
		
		
		//*********************************************	
		//*********************************************
		
		for(int i = 0 ; i < vectorOfSuggestion.size() ; i++)
		{
			if( (i%9) == 1 ){
				g.setColor(Color.red);
			}else if ( (i%9) == 2 ){
				g.setColor(Color.green);
			}else if ( (i%9) == 3){
				g.setColor(Color.PINK);
			}else
				g.setColor(Color.orange);
					 
			int tempX = Integer.parseInt((vectorOfPriority.elementAt(i)).toString());
			int tempY = Integer.parseInt((vectorOfPosibility.elementAt(i)).toString());
			int tempZ = Integer.parseInt((vectorOfCost.elementAt(i)).toString());
				
			setPositionDiameter(tempX,tempY,tempZ);	
			g.drawOval(x,y,diameter,diameter);
			g.setFont(font2);
			
			
			//***********************************************
			
			g.drawString((vectorOfSuggestion.elementAt(i)).toString(),originX+(500),(100+((i+1 )*40 )));
			
			//*************************************************
		}
		
		g.setColor(Color.DARK_GRAY);
		g.setFont(font1);
		drawXaxis(g2d);
		
		g.setColor(Color.DARK_GRAY);
		drawYaxis(g2d);
		
		g.setFont(font2);
		drawStringPriority(g2d);
	}
	public  void setPositionDiameter(int iX,int iY,int d){
		int scaleX =  vectorOfSuggestion.size();
		if(scaleX == 0)
			scaleX = 1;
		int rangeX = 400/scaleX;
		
		int scaleY = maxYAxis - minYAxis;
		if(scaleY == 0)
			scaleY = 1;
		int rangeY = 400/scaleY;
		
		int scaleR = maxRAxis - minRAxis;
		if(scaleR == 0)
			scaleR = 1;
		int rangeR = scaleR/10;
		
		//*******************************************
		
		
		if( rangeR < 1) {
			
			for(int i = 0 ; i < scaleR ; i++){
				
					if(( minRAxis + (i *scaleR)) == d ){
					diameter = (i + 1 )*16;
				}
			}
			
		} else {
				for(int i = 0; i<= 10 ; i++){
			
					
						if(( minRAxis + (i *rangeR)) == d ){
							diameter = (i + 1 )*16;
						}
				}
		}
		//*****************************************
		if(scaleY <= 20){
			int tem = iY-minYAxis;
			iY = 	tem%(scaleY + 1);
			y =  (( (originY - ( rangeY * iY ) )  ) - (diameter/2));
		}else {
			for(int i = 0 ; i <= 10 ; i++){
					if(( minYAxis + (i* (scaleY/10))) == iY ){
						iY = i;
					}
			}
			
			y =  (( (originY - ( 40 * iY ) )  ) - (diameter/2));	
		}
		
		
		numberOfSuggestion = iX;
		x =  ( (originX + ( rangeX * iX ) ) - (diameter/2));
	}
	public  void setSuggestion(String aSuggestion){
		suggestion = aSuggestion;
	}
	public  String getSuggestion(){
		return suggestion;
	}
	public  void setTopic(String aTopicName){
		topicName = aTopicName;
	}
	public  String getTopicName(){
		return topicName;
	}
	public String getYaxisName(){
		return yAxisName;
	}
	public String getRaxisName(){
		return rAxisName;
	}
	public String getXaxisName(){
		return xAxisName;
	}
	public void setXaxisName(String aXAxisName){
		xAxisName = aXAxisName;
	}
	public void setYaxisName(String aYAxisName){
		yAxisName = aYAxisName;
	}
	public void setRaxisName(String aRAxisName){
		rAxisName = aRAxisName;
	}
	public void setMaxMinYAxis(int aMax , int aMin){
		maxYAxis = aMax;
		minYAxis = aMin;
	}
	public int getMaxYAxis(){
		return maxYAxis;
	} 
	public int getMinYAxis(){		
		return minYAxis;
	}
	public void setMaxMinRAxis(int aMax , int aMin){
		maxRAxis = aMax;
		minRAxis = aMin;
	}
	public int getMaxRAxis(){
		return maxRAxis;
	} 
	public int getMinRAxis(){
		return minRAxis;
	}
	public void setProperty(Vector aSuggestion , Vector aPriority , Vector aPosibility , Vector aCost){
		vectorOfSuggestion = aSuggestion;
		vectorOfPriority = aPriority;
		vectorOfPosibility = aPosibility;
		vectorOfCost = aCost;		
		
	}
	public void drawXaxis( final Graphics2D g2d){
		int scale = vectorOfSuggestion.size();
		if(scale == 0)
			scale = 1;
		int range = 400/scale;
		
		Line2D line = new Line2D.Double(originX,originY,originX+450,originY); // Main Line in Xaxis
		g2d.draw(line); 
		
		int i ;
		for( i = 0 ; i <= scale ; ++i){
			if(i != 0 ){ // to write line at each degree
				line.setLine((i*range) + originX , originY, (i*range) + originX , originY + 5 );
				g2d.draw(line);
				
				x1 = (i*range) + 50;
				x2 = (i*range) + 50;
			}
			g2d.drawString(new Integer(i).toString(),(i*range)+originX , originY + 25 ); //(String , x ,y)
		}
		g2d.setColor(Color.blue);
		g2d.drawString(xAxisName,((originX+450 )+ 42) , originY + 20 );
	}
	public void drawYaxis(final Graphics2D g2d){
		int scale = maxYAxis - minYAxis;
		if(scale == 0)
			scale = 1;
		int range = 400/scale;
		
		Line2D line = new Line2D.Double(originX,originY,originX,originY-450); //70 //80
		g2d.draw(line);
		int i;
		
		if(scale <= 20 ){
				for( i = 0 ; i <= scale ; ++ i){
					if(i != 0){
						line.setLine(originX,originY-(i*range),(originX-5),originY-(i*range));
						g2d.draw(line);
						
						y1 = originY - (i*range);
						y2 = originY - (i*range);
					}
				g2d.drawString(new Integer( minYAxis + i).toString(),(originX-40),(originY+5) -(i * range));	
			}
		}else {
					for( i = 0 ; i < 11 ; ++ i){
						if(i != 0){
							line.setLine(originX,originY-(i*40),(originX-5),originY-(i*40));
							g2d.draw(line);
							
							y1 = originY - (i*range);
							y2 = originY - (i*range);
						}
					g2d.drawString(new Integer( minYAxis + (i*(scale/10) )).toString(),(originX-40),(originY+5)-(i * 40));	
				}
		}
		g2d.setColor(Color.blue);
		g2d.drawString(yAxisName,(originX-40),45);
	}
	public void drawStringPriority(final Graphics2D g2d){
		g2d.setFont(font1);	
		g2d.setColor(Color.blue);	
		g2d.drawString("รัศมี คือ " + rAxisName,600,100);
	}
}
