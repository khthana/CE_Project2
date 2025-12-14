
import java.awt.event.*;
import java.awt.*;
//import com.borland.jbcl.layout.*;



public class Gameroom extends Frame implements MouseListener{
	ClientC you;  
  final int cardW=80;
  final int cardH=100;
  int lastPlayer=-1;
  int thisPlayer = -1;
  int state =-1;
  int leadCard=-1;
  int lastCard=-1;
  //int[] cardInHand = new int[13];
  int[] dropCard = new int[4];
  int[] playerId = new int[4];
  //int cardCount;  
  boolean notStart = true;
  Button BStart = new Button();
  Button BQuit = new Button();
//  Button BDropCard = new Button();
  
  Label LName1 = new Label();
  Label LName2 = new Label();
  Label LName3 = new Label();
  
  Label LMyScore = new Label();
  Label LMyName1 = new Label();
  
  Label LMessage = new Label();
  
  Label LScore1 = new Label();
  
  Label LScore2 = new Label();
  
  Label MDropCard = new Label();
  Label LScore3 = new Label();
  
  
  Panel PCard1 = new Panel();
  Panel PCard4 = new Panel();  
  Panel PCard2 = new Panel();
  Panel PCard3 = new Panel();
  Panel PMyCard = new Panel();
  Panel PPlayer3 = new Panel();
  Panel PPlayer1 = new Panel();
  Panel PPlayer2 = new Panel();
  Panel PPlayer4 = new Panel();
  Panel PControl = new Panel();
  
  TextArea TAMessage = new TextArea();

  
  public Gameroom(ClientC c) {
  
    try {
    	you= c;	
    	playerId[0] = you.myID;
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  /*public static void main (String arg[]){
  Gameroom x= new Gameroom();
  x.show();
  }*/
  public void setScore(int score,int seat){
  	if (findSeat(seat)==0)
  		LMyScore.setText("SCORE :"+Integer.toString(score));
  	if (findSeat(seat)==1)
  		LScore1.setText("SCORE :"+Integer.toString(score));
  	if (findSeat(seat)==2)
  		LScore2.setText("SCORE :"+Integer.toString(score));
  	if (findSeat(seat)==3)
  		LScore3.setText("SCORE :"+Integer.toString(score));
  }
  public int findLastSeat(int seat){
  	int temp=0;
  	int find=0;
  	if (seat == 0){
  		temp = 3;
  	}else {
  		temp = seat-1;
  	}
  	
  	for(int i=0;i<4;i++){
  		if (playerId[i]==temp){
  			find = i;
  		}
  	}
  	return find;
  }
  public int findSeat(int seat){
  	int temp=0;
  	int find=0;
  	
  	
  	for(int i=0;i<4;i++){
  		if (playerId[i]==seat){
  			find = i;
  		}
  	}
  	return find;
  }
  public void dropCard(int Lead,int Last,int seat){
  	int temp =findLastSeat(seat) ;
  	dropCard[temp]=Last;
  	temp++;
  	if (temp ==4)
  		temp =0;
  	thisPlayer = temp;
  	lastPlayer= seat;
  	leadCard=Lead;
  	lastCard=Last;
  	repaint();
  }
  public void clearAll(Graphics g){
  		paintBackFull(g,120,320);
  		for(int i=1;i<13;i++){
  			paintBackFull(g,120+((cardW/2)*i),320);
  		}
  		//for player1
  		paintBackFull(g,260, 155);
  		//for player2
  		paintBackFull(g,350, 100);
  		//for player3
  		paintBackFull(g,440,155);
  		//for player4
  		paintBackFull(g,350,210);
  }
  public void paint(Graphics g){
  	int paintF=0;
  	if (notStart){
  		clearAll(g);
	}//end not start
  	else {
  		clearAll(g);
  		//set my card
  		
  		for(int i=0;i<13;i++){
  			if (you.cardInHand[i] !=0){
  				if(paintF==0){
  					if(state==paintF){
  						paintFrontFull(g,120,300,you.cardInHand[i]);
  					}else{
  					paintFrontFull(g,120,320,you.cardInHand[i]);
  					}
  					paintF++;
  				}else{
  					if(state==paintF){
  						paintFrontFull(g,120+((cardW/4)*(paintF)),300,you.cardInHand[i]);
  					}else{
  					paintFrontFull(g,120+((cardW/4)*(paintF)),320,you.cardInHand[i]);
  					}
  					paintF++;
  				}
  			}
  		}
  		
  		int row=0;
  		int col=0;
  		for(int i=0;i<4;i++){
  			for(int j=1;j<17;j++){
  				if (you.cardScore[i][j]!=0){
  						if(j>8){
  							row=20;
  							col=160;
  						}else{
  							row=0;
  							col=0;
  						}
  						
  					if(findSeat(i)==0){
  			  			paintFrontFull(g,(450+(j*20))-col,320+row,you.cardScore[i][j]);
					
					}
  					
  					if(findSeat(i)==1){
						paintFrontFull(g,((j*20)-10)-col,190+row,you.cardScore[i][j]);
  					}
  					if(findSeat(i)==2){
  						paintFrontFull(g,(450+(j*20))-col,20+row,you.cardScore[i][j]);
  					}
  					if(findSeat(i)==3){
  						paintFrontFull(g,(520+(j*20))-col,190+row,you.cardScore[i][j]);
  					}
  				}
  				row=0;
  			}
  		}
  		
  		//for player1
  		if (dropCard[0]==0){
  			paintBackFull(g,350, 210);
  		}else{
  			paintFrontFull(g,350, 210,dropCard[0]);
  		}
  		//for player2
  		if (dropCard[1]==0){
  			paintBackFull(g,260, 155);
  		}else{
  			paintFrontFull(g,260, 155,dropCard[1]);
  		}
  		//for player3
  		if (dropCard[2]==0){
  			paintBackFull(g,350,100);
  		}else{
	  		paintFrontFull(g,350,100,dropCard[2]);
	  	}
  		//for player4
  		if (dropCard[3]==0){
  			paintBackFull(g,440, 155);
  		}else{
	  		paintFrontFull(g,440, 155,dropCard[3]);
	  	}
	  	if(thisPlayer == 0){
	  		paintRect(g,350, 210);
	  	}
	  	if(thisPlayer == 1){
	  		paintRect(g,260, 155);
	  	}
	  	if(thisPlayer == 2){
	  		paintRect(g,350,100);
	  	}
	  	if(thisPlayer == 3){
	  		paintRect(g,440, 155);
	  	}
  	}//end else start game
  }
  void paintRect(Graphics g,int x,int y){
  	g.setColor(Color.blue);
  	g.drawRect(x-1,y-1,cardW+2,cardH+2);
  }
  void EndGame(){
  	TAMessage.appendText("GAME IS END PRESS STARTGAME OR QUIT");
  	BStart.enable();
  }
  void UpdateGameRoom(){
  //	TAMessage.appendText("UpdateGameRoom\n");
  	for(int i=0;i<4;i++){
  	if (you.g_tables[you.myTable].players[i]==null){
  			LName1.setText("Wait for player");
  		}else{
  		if (findSeat(i)==1){
  		   	LName1.setText("NAME : "+you.g_tables[you.myTable].players[i].name);
   	    }
  		if (findSeat(i)==2){	    	
  	   		LName2.setText("NAME : "+you.g_tables[you.myTable].players[i].name);
    	}
  		if (findSeat(i)==3){
    		LName3.setText("NAME : "+you.g_tables[you.myTable].players[i].name);
	    }
	    //TAMessage.appendText(you.g_tables[you.myTable].players[i].name+"\n");
		}
	}

}
  	String ToCard(int cardNum){
 		String returnS="";
 		int AddSuit=0;
 		if (cardNum <=13){
 			
 			AddSuit =0;
 		}else 
 		if (cardNum <=26){
 			
 			AddSuit =13;
 		}else	
 		if (cardNum <=39){
 			
 			AddSuit =26;
 		}else	
 		if (cardNum <=52){
 			
 			AddSuit =39;
 		}	
 			if (cardNum == 13+AddSuit){
 				returnS = returnS+"A";
 			}else
 			if (cardNum == 10+AddSuit){
 				returnS = returnS+"J";
 			}else 
 			if (cardNum == 11+AddSuit){
 				returnS = returnS+"Q";
 			}else 
 			if (cardNum == 12+AddSuit){
 				returnS = returnS+"K";
 			} else returnS = returnS+(cardNum-AddSuit+1);
 			return returnS;
 		
 	}
 	public void drawCS(int x,int y,Graphics g){
 		int xCoords[]={x+5,x+3,x+7,x+5};
		int yCoords[]={y+5,y+10,y+10,y+5};
		g.setColor(Color.black);
		g.fillOval(x+2,y,5,5);
		g.fillOval(x,y+3,5,5);
		g.fillOval(x+5,y+3,5,5);
		g.fillOval(x+4,y+4,2,2);
		g.fillPolygon(xCoords,yCoords,4);
 	}
 	public void drawDS(int x,int y,Graphics g){
		int xCoords[]={x+5,x+2,x+5,x+8,x+5};
		int yCoords[]={y,y+5,y+10,y+5,y};
		g.setColor(Color.red);
		g.fillPolygon(xCoords,yCoords,5);
	}
	public void drawHS(int x,int y,Graphics g){
		int xCoords[]={x+1,x+5,x+9,x+1};
		int yCoords[]={y+4,y+10,y+4,y+4};
		g.setColor(Color.red);
		g.fillOval(x,y,6,6);
		g.fillOval(x+4,y,6,6);
		g.fillPolygon(xCoords,yCoords,4);
	}
	
	public void drawSS(int x,int y,Graphics g){
		int xCoords[]={x+5,x+3,x+7,x+5};
		int yCoords[]={y+6,y+10,y+10,y+6};
		int xC[] = {x+5,x,x+5,x+10,x+5};
		int yC[] = {y,y+4,y+6,y+4,y};
		g.setColor(Color.black);
		g.fillOval(x,y+3,5,4);
		g.fillOval(x+5,y+3,5,4);
		g.fillPolygon(xCoords,yCoords,4);
		g.fillPolygon(xC,yC,5);
	}
	
	
	
 	public void drawC(int x,int y,Graphics g){
		int xCoords[]={x+25,x+14,x+35,x+25};
		int yCoords[]={y+27,y+50,y+50,y+27};
		g.setColor(Color.black);
	
		g.fillOval(x+12,y,25,25);
	
		g.fillOval(x,y+15,25,25);
	
		g.fillOval(x+25,y+15,25,25);
	
		g.fillOval(x+20,y+20,10,10);
	
		g.fillPolygon(xCoords,yCoords,4);
	}
	
	public void drawD(int x,int y,Graphics g){
		int xCoords[]={x+25,x+8,x+25,x+41,x+25};
		int yCoords[]={y,y+25,y+50,y+25,y};
		g.setColor(Color.red);
		g.fillPolygon(xCoords,yCoords,5);
	}
	public void drawH(int x,int y,Graphics g){
		int xCoords[]={x+3,x+25,x+46,x+3};
		int yCoords[]={y+22,y+50,y+22,y+22};
		g.setColor(Color.red);
		g.fillOval(x,y,28,28);
		g.fillOval(x+21,y,28,28);
		g.fillPolygon(xCoords,yCoords,4);
	}
	public void drawS(int x,int y,Graphics g){
		int xCoords[]={x+25,x+14,x+35,x+25};
		int yCoords[]={y+27,y+50,y+50,y+27};
		int xC[] = {x+25,x,x+25,x+50,x+25};
		int yC[] = {y,y+22,y+27,y+22,y};
		g.setColor(Color.black);
		g.fillOval(x,y+16,26,23);
		g.fillOval(x+25,y+16,26,23);
		g.fillPolygon(xCoords,yCoords,4);
		g.fillPolygon(xC,yC,5);
	}
  void paintFrontFull(Graphics g,int x,int y,int card){
  	g.setColor(Color.red);
  	g.fill3DRect(x,y,cardW,cardH,true);
  	g.setColor(Color.white);
  	g.fillRect(x+5,y+5,cardW-10,cardH-10);
  	int color = checksuit(card);
  	if (color==1){
  	 	drawC(x+15,y+25,g);
  	 	drawCS(x+8,y+15,g);
  	 	drawCS(x+cardW-15,y+cardH-31,g);
  	 	}
  	if (color==2){
  		drawD(x+15,y+25,g);
  		drawDS(x+8,y+15,g);
  		drawDS(x+cardW-15,y+cardH-31,g);
  		}
  	if (color==3){
  		drawH(x+15,y+25,g);
  		drawHS(x+8,y+15,g);
  		drawHS(x+cardW-15,y+cardH-31,g);
  		}
  	if (color==4){
  		drawS(x+15,y+25,g);
  		drawSS(x+8,y+15,g);
  		drawSS(x+cardW-15,y+cardH-31,g)
  		;}
  		
  	g.drawString(ToCard(card),x+8,y+14);
  	
  	g.drawString(ToCard(card),x+cardW-15,y+cardH-10);
  }
  void paintBackFull(Graphics g,int x,int y){
 
  	g.clearRect(x,y-20,cardW,cardH);
  }
  
 
  private void jbInit() throws Exception {
    this.setLayout(null);
  //  this.setBackground(Color.gray);
    PControl.setLayout(null);
    BStart.setLabel("Strart Game");
    BQuit.setLabel("Quit Game");
//    BDropCard.setLabel("Drop Card");
    LMyScore.setText("SCORE : 0");
    LMyName1.setText("NAME : "+you.myNAME);
    TAMessage.setText("");
    LMessage.setText("MESSAGE");
    //PMyCard.setBackground(Color.gray);
    //PPlayer1.setBackground(Color.gray);
    PPlayer1.setLayout(null);
    //PCard1.setBackground(Color.gray);
    LScore1.setText("SCORE :0");
    LName1.setText("wait for player");
    //PCard2.setBackground(Color.gray);
    LScore2.setText("SCORE :0");
    PPlayer2.setLayout(null);
    //PPlayer2.setBackground(Color.gray);
    LName2.setText("wait for player");
    LScore3.setText("SCORE :0");
    //PCard3.setBackground(Color.gray);
    LName3.setText("wait for player");
    PPlayer3.setLayout(null);
    //PPlayer3.setBackground(Color.gray);
    //PCard4.setBackground(Color.gray);
    PPlayer4.setLayout(null);
    //PPlayer4.setBackground(Color.gray);
    MDropCard.setText("Drop this card");
    
    
    this.add(PPlayer1);PPlayer1.setBounds(145, 155, 110, 50);
    this.add(PPlayer2);PPlayer2.setBounds(340, 45, 110, 50);
    this.add(PPlayer3);PPlayer3.setBounds(525, 155, 110, 50);
    //this.add(PPlayer4);PPlayer4.setBounds(290, 200, 110, 50);
  
    this.add(TAMessage);TAMessage.setBounds(120, 450,500, 100);
    this.add(LMessage);LMessage.setBounds(120, 425,100, 23);
    this.add(PControl);PControl.setBounds(6, 425, 110, 120);
    this.setBounds(0,0,999,999);
    
    
  //  this.add(PCard1);PCard1.setBounds(260, 155, cardW, cardH);
  //  this.add(PCard2);PCard2.setBounds(350, 100, cardW, cardH);
    //this.add(PCard3);PCard3.setBounds(440,155, cardW, cardH);
    //this.add(PCard4);PCard4.setBounds(350,210, cardW, cardH);
    PPlayer1.add(LName1);LName1.setBounds(6, 5, 100, 23);
    PPlayer1.add(LScore1);LScore1.setBounds(6, 30, 100, 23);
    
    
    PPlayer2.add(LName2);LName2.setBounds(6, 5, 100, 23);
    PPlayer2.add(LScore2);LScore2.setBounds(6, 30, 100, 23);
    
    
    PPlayer3.add(LName3);LName3.setBounds(6, 5, 100, 23);
    PPlayer3.add(LScore3);LScore3.setBounds(6,30 , 100, 23);
    
    
    //PPlayer4.add(MDropCard);MDropCard.setBounds(12, 6, 100, 23);
    
    PControl.add(LMyName1);LMyName1.setBounds(4, 0, 100, 23);
    PControl.add(LMyScore);LMyScore.setBounds(4, 25, 100, 23);
    PControl.add(BStart);BStart.setBounds(2, 50, 100, 20);
//    PControl.add(BDropCard);BDropCard.setBounds(2, 75, 100, 20);
//    BDropCard.disable();
    PControl.add(BQuit);BQuit.setBounds(2, 100, 100, 20);
	
	addMouseListener(this);
	    
    show();
    
  //  this.add(PMyCard);PMyCard.setBounds(155, 40, 560, 100);
  }
  public void setCard(int thisId){
  	leadCard=0;
  	thisPlayer = findSeat(thisId);
  	notStart=false;
  	repaint();
  }    				
	 		
  public static int checksuit(int card){
	 	if (card != 0){
	 		if (card <= 13) card = 1; // remain club
	 	 	else if (card <= 26) card =2; // remain diamon
	 	 	else if (card <= 39) card =3; // remain heart
	 	 	else if (card <= 52) card =4; // remain spread
		} return card;
	}
  public void mouseReleased(MouseEvent evt){
  }
  public void mousePressed(MouseEvent evt){
  }
  public void mouseEntered(MouseEvent evt){
  }	
  public void mouseExited(MouseEvent evt){
  }
  public void mouseClicked(MouseEvent evt){
  	if (you.MyTurn){
			int x =evt.getX();
  			int y = evt.getY();
  			int cardId = findCard(x,y);
  		
  			if (cardId !=-1){
  				if (cardId == state){
  					int temp=findIndexCard(cardId);
  					
  					dropCard[0] = you.cardInHand[temp];
  					you.cardInHand[temp]=0;
  					if (you.HaveAi){
  					if (you.turn==8){
  						you.output(Packet.CP2AI(you.cardInHand));
  					//	TAMessage.appendText("send packet to AI compleat\n");
  					}
  					}
  					you.output(Packet.CPDropCard(dropCard[0]));
  					
  					
					you.NumCard--;
  					you.MyTurn = false;
  					
  					state=-1;
  					repaint();			
				}else {
					boolean canPlay=false;
					if (leadCard==0){
						state = cardId;
				//		canPlay=true;
						repaint();
					}else{
				//	for(int i =1;i<=canplay(you.cardInHand,leadCard).length;i++){
						if(checksuit(you.cardInHand[findIndexCard(cardId)])==checksuit(leadCard)){
							state = cardId;
				//			canPlay=true;
							repaint();
						}else if(voidCard(leadCard)){
							state = cardId;
							repaint();
						}
					//}
				}
					/*if (!(canPlay))
						state = -1;
					*/
					}
			}
		}
  	
  }
  public boolean voidCard(int l){
  	boolean VoidC=true;
  	for(int i=0;i<13;i++){
  		if(checksuit(l)==checksuit(you.cardInHand[i])){
  			VoidC= false;
  		}
  	}
  	return VoidC;
  }
  public void leadCard(int last ,int seat){
  	int temp =findLastSeat(lastPlayer);
  	temp++;
  	if (temp==4)
  		temp=0;
  	
  	dropCard[temp]=last;
  	temp = findLastSeat(seat);
  	temp++;
  	if (temp ==4)
  		temp =0;
  	thisPlayer = temp;
  	leadCard=0;
  	repaint();
 /* 	for(int i=0;i<4;i++){
  		dropCard[i] =0;
	} 	*/
  }
  public int findIndexCard(int PicIndex){
  	int temp=-1;
  	int ret=-1;
  	boolean find=false;
  	for(int i=0;i<13;i++){
  		if (!(find)){
  		if (you.cardInHand[i]!=0)	
  			temp++;
  		if (temp==PicIndex){
  			  find = true;
  			ret= i;
  		}
  		}
  	}
  	
  	return ret;
  }
  public int findCard(int x,int y){
  	int ret=-1;
  	if((y>320)&&(y<420)){
  		if (x>120){
  			if (x<140){
  				ret=0;
  			}else if(x<160){
  				ret=1;
  				}else if(x<180){
  				ret=2;
  				}else if(x<200){
  				ret=3;
  				}else if(x<220){
  				ret=4;
  				}else if(x<240){
  				ret=5;
  				}else if(x<260){
  				ret=6;
  				}else if(x<280){
  				ret=7;
  				}else if(x<300){
  				ret=8;
  				}else if(x<320){
  				ret=9;
  				}else if(x<340){
  				ret=10;
  				}else if(x<360){
  				ret=11;
  				}else if(x<460){
  				ret=12;
  				}
  		}
  	
  		if(ret > you.NumCard){
  			ret=you.NumCard;
  		}
  		
  	}
  	return ret;
  }
  	public synchronized boolean action(Event evt,Object what){	
  			
  		
			if (evt.target==BQuit){
				you.output(Packet.CPLeaveTable(you.myTable));
			}
	
			if (evt.target==BStart){
				you.output(Packet.CPMakeGame());
				
			}
					
					return true;
		}
  }
