//package server;
/*import Player;
import Server;
import Packet;*/
import java.lang.*;
import java.util.*;
import java.io.*;
import java.net.*;

class Table{

	public static Table[] global = new Table[25];
	
	int[][] cardInHand=new int[4][13];
	int id = -1;
	Player[] players = new Player[8];
	//this is game control pararmeter
	int Turn =-1;
	int ThisPlayer=-1;
	boolean Ready=false; 
	boolean InGame=false;
	int MaxPlayer =0;
	int LeadCard =0;
	int[] LastCard = new  int[4];
	int aiPos=-1;
	AiObj aiObj;
	//end of game control pararmeter
	
	public Table() /*throws FullServerException*/{
	  synchronized(global){
		for (int i = 0; i < global.length; i++){
			if (global[i] == null){
				id = i;
				global[i] = this;
				break;
			}
			
		}
		
	  }
	//if (id == -1) throw new FullServerException();
	}
		
	public synchronized void makeNewGame(){
		int temp;
		
	//	if (!(InGame)){
		if (MaxPlayer==3){
				try{
					
					Socket s = new Socket("161.246.6.141",5656);
					DataInputStream i = new DataInputStream(s.getInputStream());	
					DataOutputStream o = new DataOutputStream(s.getOutputStream());
					aiObj = new AiObj(s, i, o, id);
					
				} catch(IOException e){}
				
			}else{	
			if  (Ready){
				
				InGame = true;
				Turn = 0;
				int[] card =new int[52];
				for (int i = 0; i < 52 ; i++) //initial card
	  					card[i] = i + 1;
	 		
	 			Random rand = new Random();  //shuffle card
	 			for (int i = 1; i < 52; i++){
					int j = Math.abs(rand.nextInt())%(i+1);
					if (i != j){
						temp = card[i];
						card[i] = card[j];
						card[j] = temp;
					}
				}
				ThisPlayer=firstLead(card);
				String SendCard="";
				
				//outputTable(Packet.InitCard(ThisPlayer,AllCard));
				//randomcard and send card to all player
				int playerCard;
				for (int i=0;i<4;i++){
						for (int j=0;j<13;j++){
						playerCard=card[(j*4)+i];
						cardInHand[i][j]=playerCard;
						if (playerCard <10){
							
							SendCard = SendCard+"0"+playerCard;				 		
						} else{
							SendCard = SendCard+playerCard;				 		
						}

					}
					System.out.println("string SendCard = "+SendCard);	
					
					//players[i].output(Packet.InitCard(ThisPlayer));
					players[i].output(Packet.InitCard(ThisPlayer,SendCard));
					SendCard = "";
					sortCard(cardInHand,i);
				}
				
				//outputTable(Packet.ThisPlayer(ThisPlayer,0,0));
			} 
		}
		//}ingame
	}
	void sortCard(int[][] c,int x){
 		int temp =0;
 		for (int i=0;i<13;i++){
 			for (int j=0;j<12-i;j++){
 				
 				if (c[x][j]>c[x][j+1]){
 					temp = c[x][j];	
 					c[x][j] = c[x][j+1];	
 					c[x][j+1]	= temp;
 				}
 			}
 		}
 	}
	/*public synchronized void sendCard(int seq,int player){
		int playerCard;
		playerCard = card[(seq*4)+player];
		
		players[player].output(Packet.GiveCard(player,playerCard));		
		
	}*/
	public String MakeDetail(int fCard,int lCard){
		String detail="";
				if (fCard <10){
					detail = "0"+fCard;
				}else{
					detail = ""+fCard;
				}
				if (lCard <10){
					detail = detail+"0"+lCard;
				}else{
					detail = detail+lCard;
				}
		return detail;				
	}
	public synchronized void ControlGame(int card){
	int endturn,temp;
	int LastPlayer= ThisPlayer;
	String detail="";
			LastCard[ThisPlayer] = card;
			for(int i=0;i<13;i++){
				if (cardInHand[ThisPlayer][i]==card)
					cardInHand[ThisPlayer][i]=0;
			}
			Turn++;
			endturn = Turn%4;
			if (endturn ==1){
				//lead card
				LeadCard = card;
	
			}
			if (endturn !=0){
				//not turn 4 then next player
	
				ThisPlayer++;
				
				if (ThisPlayer >3) 
					ThisPlayer = 0;
					outputTable(Packet.ThisPlayer(ThisPlayer,LeadCard,LastCard[LastPlayer]));

			}else{
				//turn 4 then find laed player
				
				temp=0;
				for (int i=0;i<4;i++){
						if (SameLead(LeadCard,LastCard[i]))	{
							if (temp<LastCard[i]){
								ThisPlayer = i;
								temp=LastCard[i];
							}
						}
				}
				
				if (Turn ==52){
					
					outputTable(Packet.EndGame(ThisPlayer,LastCard[LastPlayer]));
					Turn =-1;
					ThisPlayer=-1;
					Ready=true; 
					InGame=false;
					LeadCard =0;
					for (int i=0;i<4;i++)
						LastCard[i]=0;
				}else{
				
				outputTable(Packet.ThisPlayer(ThisPlayer,0,LastCard[LastPlayer]));
				}
				for(int i=0;i<4;i++)
					LastCard[i]=0;
			}
		}
			
	
	public boolean SameLead(int l,int c){
		boolean same=false;
		if (l>=1&&l<=13){
			if(c>=1&&c<=13){
				same=true;
			}
		}
		if (l>=14&&l<=26){
			if(c>=14&&c<=26){
				same=true;
			}
		}
		if (l>=27&&l<=39){
			if(c>=27&&c<=39){
				same=true;
			}
		}
			if (l>=40&&l<=52){
			if(c>=40&&c<=52){
				same=true;
			}
		}
		return same;
	}
	public synchronized int firstLead(int[] card){
		int first=0;
		for(int i=0;i<13;i++){
			for(int j=0;j<4;j++){
				if (card[(i*4)+j]==1){
					first=j;
				}
			}
		}
		return first;
	}

	public synchronized void outputTable (byte[] p){
		for (int i = 0; i < 4 ;i++ ){
			if (players[i] != null)
			  players[i].output(p);
		}
	}

  	public synchronized void join (Player him, boolean play){
		join:
		  { 
			int s0 = play ? 0 : 4;
			int s1 = play ? 4 : players.length;
			boolean set=false;
			for (int i = s0; i < s1 ; i++ ){
				
				if (players[i] == null){
					players[i] = him;
//					him.PTable = this;
					him.myTable = id;
					him.seat =i;
					System.out.println("join idTable="+id+" Seat="+i+" Him="+him.id);
					him.outputAll(Packet.SPTableJoin(id, i, him.id));//not have SPTablePlayer
					MaxPlayer++;
					//System.out.println("MaxPlayer = "+MaxPlayer);
					if (MaxPlayer >= 4){
						Ready = true;
					}
					if (InGame){
						System.out.println("start rejoin game");
						String SendCard="";
						for(int k=0;k<13;k++){
						if (cardInHand[him.seat][k] <10){
							
							SendCard = SendCard+"0"+cardInHand[him.seat][k];				 		
						} else{
							SendCard = SendCard+cardInHand[him.seat][k];				 		
						}	
					}
						System.out.println("string SendCard = "+SendCard);	
						System.out.println("LeadCard = "+LeadCard);
						System.out.println("Turn/4 = "+Turn/4);
					
						players[him.seat].output(Packet.CardInJoin(ThisPlayer,SendCard,LastCard,Turn/4,LeadCard));
						
					}
					break join;
				}
			}
			him.output(Packet.SPMessage(Packet.MSG_GOD, 0, "Table is full"));
			return;
		  }
		  
	}
	public void Leave(Player him){
		synchronized(global){
			synchronized(this){
				InGame =false;
				System.out.println("leave idTable="+id+" Seat="+him.seat+" Him="+him.id);
				if (him.seat !=-1){
				Player.outputAll(Packet.SPLeaveTable(him.id,id,him.seat));
				
				players[him.seat] = null;
				
				//him.PTable = null;
				him.myTable=-1;
				him.seat = -1;
				MaxPlayer--;
			//	System.out.println("MaxPlayer " +MaxPlayer);
				if (MaxPlayer <4){
					Ready = false;
				}
				if (MaxPlayer ==1){
					if(aiObj != null){
						//System.out.println("in ai out");
						for(int i=0;i<4;i++){
							if(players[i] != null){
							if(players[i].id==aiPos)
								players[i].output(Packet.SPDestroyAI());
						}
					}
					
					//out AI
					}
				}
			}	
			}
		}
		
	}

	public synchronized void waitAi(){
		outputTable(Packet.waitAI());
	}
	public synchronized void endWaitAI(){
		outputTable(Packet.AIEndTree());
	}
	public synchronized void update(Player him){
		for (int i = 0; i < players.length ; i++){
			if (players[i] != null)
				him.output(Packet.SPTableJoin(id, i, players[i].id));
			}
		}


}
	