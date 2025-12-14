import java.awt.*;
import java.io.*;
import java.net.*;
import java.applet.*;
import java.lang.*;
import java.awt.event.*;
import javax.swing.*;
//import com.borland.jbcl.layout.*;


public class ClientC implements Runnable  {
	
	int LeadCard=0;
	int LastCard=0;
		
	
	GreetingC greeter;
	Socket sock;
	DataInputStream in;
	DataOutputStream out;
	Thread listener;
	
	CPlayer[] g_players = new CPlayer[100];
	CTable[] g_tables = new CTable[25];
	
	boolean HaveAi=false;
	boolean tempFlag=false;
	int[] cardInHand = new  int[13];;
	int[][] cardScore = new int[4][18];
	int[] last4Card = new int[4];
	int myID = -1;
	String myNAME=null;
	int myTable = -1;
	int mySeat =-1;
	boolean MyTurn;
	int NumCard=0; // sum card in hand in dex of cardInHand
	int turn=0;
	int round=0;
	LobbyRoom lobby;	

	Gameroom game;

	
ClientC (Socket s,DataInputStream i,DataOutputStream o,GreetingC g){
		int count;
			sock = s;
			in = i;
			out = o;
			greeter = g;
			(listener = new Thread(this)).start();
			myNAME=greeter.name;
			for (count=0;count<100;count++)
				g_players[count] = new CPlayer();
			for (count=0;count<25;count++)
				g_tables[count] = new CTable();
			
			MyTurn =false;
			lobby = new LobbyRoom(this);
	}
		
		void output(byte[] p){
			if (p != null && p.length >0){
				try {
					out.write(p, 0,p.length);
				} catch (IOException e){
					disconnect();
					listener.stop();
					lobby.dispose();
					if(game!=null){
						game.dispose();
					}
					greeter.restart();
				}
			}
		}
		
	public boolean SameLead(int l,int c){
		boolean same=false;
		if (l==0){
			same= true;
		}
		
		if (voidCard(l)){
				same=true;
			}else{
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
	}
		return same;
}
public boolean	voidCard(int l){
	int lead=check(l);
	boolean voidc=true;
	for (int i=0;i<13;i++)	{
		if (check(cardInHand[i])==lead){
			voidc=false;
		}
	}
	return voidc;
}
public 	int check(int l){
	int i=0;
	if (l<=13)
		i=1;
	if (l<=26)
		i=2;
	if (l<=39)
		i=3;
	if (l<=52)
		i=4;
	return i;
}
		void disconnect (){
			try{
				in.close();
				out.close();
				sock.close();
			} catch (IOException e){}
		}
		
		int hdYouAre ()throws IOException {
			myID = (int)in.readByte();
			return(myID);
		}
		
		
	
	
	void outMessage() throws IOException {
	int id = in.readInt();
	String text = in.readUTF();
	lobby.TaChat.appendText("From:"+g_players[id].name+" >"+text+"\n");
	
	}
	
	void hdJoin ()throws IOException {
		int id=-1;
		String name="";
		id = in.readInt();
		name = in.readUTF();
		CPlayer him = g_players[id]= new CPlayer(id, name);
//		player_List.appendText(him.toLobby());
		lobby.list2.addItem(him.name);
		if (id!=myID) {
		
		joinRes(id,myNAME);
	}
	}
	void playerJoin()throws IOException{
		int id=-1;
		int tid=-1;
		int tseat=-1;
		String name="";
		id = in.readInt();
		name = in.readUTF();
		tid = in.readInt();
		tseat=in.readInt();
		CPlayer him = g_players[id]= new CPlayer(id, name);
		if (tid !=-1){
			g_tables[tid].players[tseat]=him;
			him.tableId =tid;
			him.seat=tseat;
		//	player_List.appendText(him.toTable());
		} 
//		player_List.appendText(him.toLobby());
		lobby.list2.addItem(name);
		lobby.UpdateGameRoom();
	}
	void joinRes(int i,String s) throws IOException {
		output(Packet.CPPlayer(i,s));
	}
	void hdLeave()throws IOException {
	int id=-1;
	id = in.readInt();
	CPlayer him = g_players[id];
//	int i = player_List.getText().indexOf(him.toLobby());//player_List.getText().indexof(him.getString());
//	int j = i + him.toLobby().length();
//	player_List.replaceText("",i,j);
	lobby.list2.remove(him.name);
		
	
 	}
 	int findId(String name){
 		int Id=-1;
 		loop:for (int i=0;i<100;i++){
 			if (name.equals(g_players[i].name)){
 				Id = g_players[i].id;
 				break loop;	
 			}
 		}
 		return Id;
 	}
  	void youJoin() throws IOException{
  		String name=null;
 		myID =in.readInt();
// 		name = login_name.getText();
  		CPlayer you = g_players[myID]=new CPlayer(myID,name);
  		
  	}
  	
 	void createTableFrame() throws IOException{
 			game = new Gameroom(this);
 			
 }
 	
 	void sendError(byte tag) throws IOException{
 		output(Packet.CPError(tag));
 			
 	}
 	
 	void hdLeaveTable() throws IOException{
 		int t_id, p_id, seat;
 		
 		p_id = in.readInt();
 		
 		t_id=in.readInt();
 		
 		seat=in.readInt();
 		
 		
 		g_tables[t_id].players[seat] =null;
 		//g_tables[t_id].players[seat].seat =-1;
 		//g_tables[t_id].players[seat].tableId =-1;
		 		
		g_players[p_id].seat=-1;
		g_players[p_id].tableId=-1;
  	 
		if (myID==p_id){// secret text
	
			myTable = -1;
 			mySeat = -1;
 			game.dispose();
 			lobby.BJoin.enable();
 		}
 			if (myTable==t_id){
 			UpdateGameFrame();
 		}
 			lobby.UpdateGameRoom();

 	}
 	void sortCard(){
 		int temp =0;
 		for (int i=0;i<13;i++){
 			for (int j=0;j<12-i;j++){
 				
 				if (cardInHand[j]>cardInHand[j+1]){
 					temp = cardInHand[j];	
 					cardInHand[j] = cardInHand[j+1];	
 					cardInHand[j+1]	= temp;
 				}
 			}
 		}
 	}
 
 	void SetZero(int[] arry){
 		for(int i=0;i<arry.length;i++){
 			arry[i]=0;
 		}
 	}
 	 void StartGame()throws IOException{
	int himId;
	himId=in.readInt();	
	String RecvCard = in.readUTF();
	String debug="";
	LeadCard=0;
	LastCard=0;
	SetZero(last4Card);
	SetZero(game.dropCard);
	MyTurn=false;
	for (int i=0;i<13;i++){
		debug = RecvCard.substring(i*2,(i*2)+2);
		cardInHand[i]=  Integer.parseInt(debug);
	}
	sortCard();
	for(int j=0;j<4;j++){
	for(int i=0;i<18;i++){
		cardScore[j][i]=0;
	}
	}
	//for (int i=0;i<13;i++){
		game.setCard(himId);

	//}
	NumCard=13;
	//test bench
	turn=0;
	game.TAMessage.appendText("wait for "+g_tables[myTable].players[himId].name+" leadGame\n");
	if (himId == mySeat)
		MyTurn=true;
	game.BStart.disable();
}

 	void hdPlayerTable() throws IOException{
 			int t_id, p_id, seat;
 			
 	//write Packet.SPPlayerTable() and read it here..
 			t_id=in.readInt();
 			seat=in.readInt();
 			p_id=in.readInt();
 	
 			
	 	
 			g_tables[t_id].id = t_id;
 			
 			CPlayer him;
 	
 				him = g_players[p_id];
 			
 				him.tableId = g_tables[t_id].id;
 			
 				him.seat = seat;
 			
 				g_tables[t_id].players[seat] = him;
 			
 		
 			//outText.appendText(him.name+" join table at "+him.seat+"\n");
 			//if in my table then send message show i in same table
			
 			//if i my id = P_id then make tableinterface and in
 			if (myID==p_id){// secret text
 				myTable = t_id;
 				mySeat = seat;
 				createTableFrame();
 				lobby.BJoin.disable();
 			}
 			lobby.UpdateGameRoom();
 			if (myTable==t_id){
 				UpdateGameFrame();
 			}
 			/*if (PlayRoom != null){
 				PlayRoom.UpdateTable();
 	//		UpdateTable();		
 			}*/
 	}
 	 void UpdateGameFrame(){
 	 	int temp=mySeat;
 	 	game.playerId[0]=mySeat;
		for(int i=1;i<4;i++){
			temp++;
			if (temp ==4)
				temp = 0;
			game.playerId[i] = temp;
		}
		game.UpdateGameRoom();
	}
	
 
 	
void ControlGame()throws IOException{
	
	int thisId=0;
	thisId=in.readInt();
	//int  LeadCard;
	LeadCard = in.readInt();
	//int LastCard;
	LastCard = in.readInt();
	last4Card[round] = LastCard;
	round++;
	if (round ==4 )
		round =0;
	MyTurn =false;
	
	if (round == 1){
		for(int j=0;j<4;j++){
			game.dropCard[j]=0;
		}
	}
	
	if (LeadCard!=0&&LastCard!=0){
		game.TAMessage.appendText("wait "+g_tables[myTable].players[thisId].name+" drop card\n");
		game.dropCard(LeadCard,LastCard,thisId);
	
	}
	if (LeadCard==0&&LastCard!=0){
		game.TAMessage.appendText("wait "+g_tables[myTable].players[thisId].name+" laed card\n");
		game.leadCard(LastCard,thisId);
		game.setScore(checkScore(thisId),thisId);
		turn++;
		
		

	}
	
	if (mySeat ==thisId){
		MyTurn=true;

//		game.BDropCard.enable();
	}	
}
 	 	 
public synchronized int checkScore(int seat){
	int oo=0;
	for (int i=0;i<4;i++){
		if ((last4Card[i] == 23)||(last4Card[i] == 50)||((last4Card[i] >= 27)&&(last4Card[i] <= 39))){
			cardScore[seat][cardScore[seat][0]+1] = last4Card[i];
			cardScore[seat][0]++;
			
		}
		if(last4Card[i] == 9)
			cardScore[seat][16]=last4Card[i];
	}
	int temp=0;
		for (int i=1;i<16;i++){
 			for (int j=1;j<15-i;j++){
 				
 				if (cardScore[seat][j]>cardScore[seat][j+1]){
 					temp = cardScore[seat][j];	
 					cardScore[seat][j] = cardScore[seat][j+1];	
 					cardScore[seat][j+1]	= temp;
 				}
 			}
 		}
		int myScore=0;
		for(int i=1;i<17;i++){
			if((cardScore[seat][i]<=35)&&(cardScore[seat][i]>=27)){
				myScore=myScore-(cardScore[seat][i]-25);
				oo++;
			}
			if(cardScore[seat][i]==36)
				{myScore=myScore-20;
				oo++;}
			if(cardScore[seat][i]==37)
				{myScore=myScore-30;
				oo++;}
			if(cardScore[seat][i]==38)
				{myScore=myScore-40;
				oo++;}
			if(cardScore[seat][i]==39)
				{myScore=myScore-50;
				oo++;}
			if(cardScore[seat][i]==50)
				{myScore=myScore-100;
				oo++;}
			if(cardScore[seat][i]==23)
				{myScore=myScore+100;
				oo++;}
			if(cardScore[seat][i]==9)
				if (myScore==0)
					myScore=50;
				else
					myScore=myScore*2;
				
		}
	if (oo == 13) myScore = myScore *(-1);
	return myScore;
	
	
}  	 	 
public void endGame()throws IOException{
	int thisId=in.readInt();
	int lastCard=in.readInt();
	last4Card[round] = LastCard;
	round++;
	if (round ==4 )
		round =0;
	game.leadCard(thisId,LastCard);
	//game.dropCard(thisId,lastCard,0);
	game.setScore(checkScore(thisId),thisId);
	game.EndGame();
	for(int i=0;i<4;i++){
		cardScore[i][17]=checkScore(i);
	}
}
public void AIIn()throws IOException{
	int aiseat =in.readInt();
	HaveAi=true;
}
public void JoinPlayGame() throws IOException{
	int leadSeat=-1;
	
	int thisPlayer= in.readInt();
	
	String RecvCard=in.readUTF();
	LeadCard=in.readInt();
	turn=in.readInt();
	for(int i=0;i<4;i++){
	last4Card[i]=in.readInt();
		if(last4Card[i] == LeadCard){
			leadSeat=i;
		}
	}
	
	
	SetZero(game.dropCard);
	for(int j=0;j<4;j++){
		game.dropCard[game.findSeat(leadSeat)]=last4Card[leadSeat];
		leadSeat++;
	}
	
	String debug="";
	LastCard=0;
	
	
	MyTurn=false;
	for (int i=0;i<13;i++){
		debug = RecvCard.substring(i*2,(i*2)+2);
		cardInHand[i]=  Integer.parseInt(debug);
		lobby.TaChat.appendText("card "+i+" "+debug+"\n");
	}
		
	
	sortCard();
//	for (int i=0;i<13;i++){
		game.thisPlayer = game.findSeat(thisPlayer);
		game.repaint();
		//game.setCard(thisPlayer);
//	}
	NumCard=13;
	//test bench
	turn=0;
	game.TAMessage.appendText("wait for "+g_tables[myTable].players[thisPlayer].name+" leadGame\n");
	if (thisPlayer == mySeat)
		MyTurn=true;
	game.BStart.disable();
}
public void waitAI(){
//	game.TAMessage.appendText("WAIT FOR AI MAKE TREE\n");
	if(MyTurn){
		tempFlag=true;
	}else{
		
		tempFlag=false;
	}
	MyTurn = false;
}
public void endWaitAI(){
//	game.TAMessage.appendText("AI MAKE TREE COMPLETE\n");
	
	MyTurn = tempFlag;
}
 private Integer working = new Integer(0);	
	public void run(){ //this write in client class
	

	output(Packet.CPLogin(myNAME));

	Loop:while(true){
			try{			
				
				byte tag = in.readByte();
			
				switch(tag){
					
					case Packet.SP_JOIN_TABLE:{
			
 						hdPlayerTable();
						break;
					}
					case Packet.AI_ENDTREE:{
						endWaitAI();
						break;
					}
					case Packet.SP_YOU_ARE:{
						youJoin();
						break;
						}
					
					case Packet.SP_WAIT:{
			
						break;
					}
					case Packet.SP_AIIN:{
						AIIn();
						break;
					}
					case Packet.MSG_ALL:{
			
						outMessage();
						break;
					}
					case Packet.SP_JOIN:{
			
						hdJoin();
						break;
					}
					case Packet.SP_LEAVE:{
			
						hdLeave();
						break;
					}
					case Packet.MSG_SP2CP:{
			
						outMessage();
						break;
					}
					case Packet.SP_PLAYER:{
			
						playerJoin();
						break;
					}
					case Packet.SP_WAITAI:{
						waitAI();
						break;
					}
					case Packet.SP_IN_TABLE:{// i will make table
			
						//createTableFrame();
						break;
					}
					case Packet.MSG_GOD:{
			
						outMessage();
						break;
					}
					case Packet.SP_CARDJOIN:{
						JoinPlayGame();
						break;
					}
					case Packet.SP_LEAVE_TABLE:{
			
						hdLeaveTable();
						break;
					}
					case Packet.SP_INITCARD:{
			
						StartGame();
						break;
					}
					case Packet.SP_THISPLAYER:{
			
						ControlGame();
						break;
					}
					/*case Packet.SP_GIVECARD:{
						outText.appendText(myNAME+" get card");
						PlayRoom.getCard();
						break;
					}*/
					case Packet.SP_ENDGAME:{
						endGame();
						break;
					}
					case Packet.SP_QUIT:{
		
						break Loop;
					}
					 default:{
						sendError(tag);						
					 break Loop;
						}
					}
			
			}catch (IOException e){
		
				break Loop;
			}
			
			
		}	//end while Loop
		//handle bad connect
			disconnect();
		/*	if (PlayRoom != null) 
				PlayRoom.dispose();*/
			lobby.dispose();
			if (game!=null){
				game.dispose();
			}
			greeter.restart();
	
	}	
}

	