import java.awt.*;
import java.io.*;
import java.net.*;
import java.applet.*;
import java.lang.*;
import java.util.*;


public class AiObj extends Thread {
	int LeadCard=0;
	int LastCard=0;
	int id=-1;
	Socket sock;
	DataInputStream in;
	DataOutputStream out;
	Thread listener;
	public static AiObj[] global = new AiObj[100];
	  int clubplay=0;
 	  int diamonplay=0; 
 	  int heartplay=0;
 	  int spreadplay=0;
	
// -----------------------T R E E----------------------------------
 	//  ANode root;
 	  ANode root = new ANode();
 	  ANode aptr = new ANode();
   	  ANode ptr = new ANode();
   	int oo = 0;
  	  AIdata data = new AIdata();
// 	AIdata temp = new AIdata();
//    int plays[];
	int play1[];
	  int initial[] = new int[4]; 
 	  int AItern;
	
	   int[] cardinhand= new int[13];
	   int cardcount = 13;
	   int[] plays = new int[13];
	   int ps;
	   int rp=0;
	   int[] roundplay = new int [4];
	   int outcard;	
 	   int order = 0;
	   int temp;
	   int first;
 	   int[] per = new int[16];	
	
//MY VARIABLE
	int NumCard=0; // sum card in hand in dex of cardInHand
	int turn=0;
	int[] FirstP=new int[5];
	int  round=0;
	
	int[] cardScore = new int[16];
//MY VARIABLE IN PROGRAM
	int myID = -1;
	String myNAME="AI";
	int myTable = -1;
	int mySeat =-1;
	
	
	 
	public  AiObj(Socket s,DataInputStream i,DataOutputStream o,int Tid)
	{		
	
	
	synchronized (global){
		for (int j = 0; j < global.length; j++){
			if (global[j] == null){
				
				id = j;
				global[j] = this;
				break;
			}
		}
	
	}
			sock = s;
			in = i;
			out = o;
			myTable = Tid;
			(listener = new Thread(this)).start();
			
	}
	 	  void copy(int a[],int b[]){
		for (int i = 0;i < a.length;i++){
			a[i] = b[i];
		}
	}
	 
	  void copy1(int a[],int b[]){
		int jj=0;
		for (int i = 0;i < b.length;i++){
			if(b[i]!=0)
			{
				a[jj] = b[i];
				System.out.print(" "+a[jj]);
				jj++;
			}
		}
		System.out.println();
	 }
int rule(){

	ps = 0;
	rl:{	
	lead:{
	if(order == 0){//0 
	
		for(int i = 4;i >= 1;i--){
			playsuit(i);
			if((ps  <= 2)&&(ps!=0)&&(heartplay<2)){
				if((i == 4) && (plays[1] <= 49) && (plays[0] <= 49)){
				
					drawplay(ps - 1);break rl;}
				if((i == 3) && (plays[1] <= 36)){
				
					drawplay(ps - 1);break rl;}
				if(plays[ps-1] < 50){
				
					drawplay(ps - 1);
				break rl;}
				}	
			}

		playsuit(4);
		ds:{			
		if(ps==0){
			break ds;
		}
		if(ps != 0){
			for(int i = 0;i <= ps-1;i++){
				if(plays[i] == 50) break ds;
				if(plays[i] == 51) break ds;
				if(plays[i] == 52) break ds;}
			
			
			
		drawplay(0);
		break rl;
			}
		}
		playsuit(3);
		if((ps != 0) && (plays[ps-1]<= 36)){
			
			drawplay(ps-1);
			break rl;		
		}	
				
		playsuit(1);
		if((ps >= 2) && (clubplay <= 2)){
			for(int i=ps-1;i>=1;i--)
				if(plays[i] != 9) temp = i;
				
			drawplay(temp);
			break rl;
		}
		
		if((ps != 0) && (clubplay <= 2)){
			for(int i=ps-1;i>=0;i--)
				if(plays[i] != 9) temp = i;
			
			drawplay(temp);
			break rl;
			
		}
		
		playsuit(2);
		
		if((ps >= 2) && (diamonplay <= 2)){
			for(int i=ps-1;i>=1;i--)
				if(plays[i] != 23) temp = i;
				
			drawplay(temp);
			break rl;
		}
		
		if((ps != 0) && (diamonplay <= 2)){
			for(int i =ps-1;i>=0;i--)
				if(plays[i] != 23) temp = i;
			
			drawplay(temp);
			break rl;
			
		}
		Random rand = new Random();
/*	
		for (int i = 0;i < 10;i++){
			int v = Math.abs(rand.nextInt())%(pp);
			if (cardinhand[v] != 0){
				System.out.println("kradoor9");
				drawcard(v);
				break rl;
			}
		}*/
	
		for (int i = 0;i < 10;i++){
			
			int v = Math.abs(rand.nextInt())%(cardcount - 1);
			if (cardinhand[v] != 0){
				drawcard(v);
				break rl;
			}
		}
	}
	}
	
	
	
	if (checksuit(roundplay[0]) == 1){
	System.out.println("roundplay0 SUIT =1");
	club:{
		playsuit(1);
		if(ps == 0){ // if void 
			for(int i = cardinhand.length -1 ;i >=0 ;i--){
				if(cardinhand[i] == 50){drawcard(i);break club;}
				if(cardinhand[i] == 51){drawcard(i);break club;}
				if(cardinhand[i] == 52){drawcard(i);break club;}
			}
			playsuit(3);
			if(ps != 0){
				for (int i = ps-1;i >= 0;i--){
					if(plays[i]	!= 0){
					drawplay(i);
					break club;}
			}
			}
			for(int i = cardcount-1;i >= 0;i--){
				if(plays[i]	!= 0){
					drawplay(i);
					break club;}
			}
		}
		for(int i=0;i < order - 1;i++){//if has some danger card
			if((roundplay[i] == 50)||(checksuit(roundplay[i]) == 3)){
			 	drawplay(0);
			 	break club;
			}
			if(roundplay[i] == 9){//if 10c
				drawplay(0);
				break club;
			}
		}
		drawplay(ps -1);
		break club;
	}
	}
	
	
	
	
	if (checksuit(roundplay[0]) == 2){
	System.out.println("roundplay0 suit=2");
	diamond:{
		playsuit(2);
		if(ps == 0){ // if void 
			for(int i = cardinhand.length -1 ;i >=0 ;i--){
				if(cardinhand[i] == 50){drawcard(i);break diamond;}
				if(cardinhand[i] == 51){drawcard(i);break diamond;}
				if(cardinhand[i] == 52){drawcard(i);break diamond;}
			}
			playsuit(3);if(ps != 0){drawcard(ps-1);break diamond;}
			playsuit(4);if(ps != 0){drawcard(ps-1);break diamond;}
			playsuit(2);if(ps != 0){drawcard(0);break diamond;}
			playsuit(1);if(ps != 0){drawcard(ps-1);break diamond;}
		}
		for(int i=0;i < order - 1;i++){//if has some danger card
			if((roundplay[i] == 50)||(checksuit(roundplay[i]) == 3)){
			 	drawplay(0);
			 	break diamond;
			}
			if(roundplay[i] == 23){//if Jd
				drawplay(ps-1);
				break diamond;
			}
		}
		if(ps == 1){drawplay(0);break diamond;}
		drawplay(ps -2);
		break diamond;
	}
	}
	
	
	if (checksuit(roundplay[0]) == 3){
	System.out.println("roundplay0 suit ==3");
	heart:{
		playsuit(3);
		if(ps == 0){ // if void 
			for(int i = cardinhand.length -1 ;i >=0 ;i--){
				if(cardinhand[i] == 50){drawcard(i);break heart;}//Qs
				if(cardinhand[i] == 9){drawcard(i);break heart;}//10c
			}
			for(int i = cardinhand.length - 1;i >= 0;i--){
				if(cardinhand[i] != 0){drawcard(i);break heart;}
			}	 
		}
		
		for(int i = 0;i < order-1;i++) //isnot heart
			if (checksuit(roundplay[i]) != 3) roundplay[i] = 0;
	
		for(int i = 0;i < order-1;i++) //arrange roundplay
		for(int j = 0;j < order-1;j++)	 
			if (roundplay[i] <= roundplay[j]){
				temp = roundplay[i];
				roundplay[i] = roundplay[j];
				roundplay[j] = temp;}
	
		for(int i = order -2;i >= 0;i--) //throw lower than top roundplay
		for(int j = ps-1;j >= 0;j--)
			if ((roundplay[i] != 0)&&(roundplay[i] > plays[j])){
				if(roundplay[i] < 36)// try to get under Jh
					for(int k = ps-1;k >= 0;k--)
						if((plays[k] > roundplay[i])&&(plays[k]<=36)){drawplay(j);break heart;}
				drawplay(j);
				break heart;} 
		
		drawplay(0);
	}
	}
	
	
	
	if (checksuit(roundplay[0]) == 4) {
	System.out.println("round play0 suit =4");
	spread:{
		playsuit(4);
		if (ps == 0){
			for (int b = 12;b >=0;b--){
				if (cardinhand[b] != 0)
					{drawcard(b);break spread;}}//if void
		}
			for(int i = 0;i < order -1;i++){ 
				if (roundplay[i] == 50){//some1 throw Q 
					for(int j = plays.length-1;j >= 0; j--){
						if((plays[j] != 51) && (plays[j] != 0) && (plays[j] != 52))
							{drawplay(j);break spread;} 
					}
				drawplay(0);	
				break spread;	
				}	
				if (roundplay[i] >= 51){//some1 throw A,K 
					for(int j =0;j < plays.length; j++){
						if(plays[j] == 50){drawplay(j);break spread;} 
					}
				}
			}
			if (order != 4){
				for(int j = plays.length-1;j >= 0; j--){
						if((plays[j] != 50) && (plays[j] != 51) && (plays[j] != 0) && (plays[j] != 52))
							{drawplay(j);break spread;} 
					}
				if (plays[ps-1] != 50){drawplay(ps-1);break spread;}
				drawplay(0);
				break spread;
			}	
			if (order == 4){
				if (plays[ps-1] != 50){drawplay(ps-1);break spread;}//if last card not Qs throw it		
				drawplay(0);
				break spread;
			}
		
	}	
	}

	}//end rl	
	if (checksuit(outcard)==1) clubplay++; 
	if (checksuit(outcard)==2) diamonplay++; 
	if (checksuit(outcard)==3) heartplay++; 
	if (checksuit(outcard)==4) spreadplay++; 
	
	return(outcard);
	}//end rule

	 public   void drawcard(int n){
	 	cardcount = cardcount -1;
	 	outcard = cardinhand[n];
	 	cardinhand[n] = 0;
	 	}
	 
	 public   void drawplay(int n){
	 	int c;
	 	c = 0;
	 	dd:{
	 			for (int i = 0;i < cardinhand.length;i++)
	 				if (cardinhand[i] == plays[n]) {c = i;break dd;}
	 		}
	 	drawcard(c);
	 }
	 		
	 public   int checksuit(int card){
	 	if (card != 0){
	 		if (card <= 13) card = 1; // remain club
	 	 	else if (card <= 26) card =2; // remain diamon
	 	 	else if (card <= 39) card =3; // remain heart
	 	 	else if (card <= 52) card =4; // remain spread
		}
	 return card;}
	 
	 public   void playsuit(int n){
	 	for (int i = 0;i < plays.length;i++)
	 		plays[i] = 0;
	 	ps = 0;
	 	
	 	for (int i = 0;i < cardinhand.length;i++){
	 		if ((checksuit(cardinhand[i]) == n)&&(cardinhand[i]!=0)) {
	 			
	 			plays[ps] = cardinhand[i];
	 			ps = ps + 1;
	 		}
	 	
	 	}
	 	System.out.print("plays =  ");
	 	for (int i = 0;i < plays.length;i++)
	 		System.out.print(plays[i]+"  ");
	 	System.out.println();
	 }
	 
	 
	 
	   void get(int y)throws IOException{
	
	 	roundplay[rp] = y;
	  	rp++;
	 }
	 
	  void nextorder(){
		int a = 0;
		int b = 0;	
			for(int h = 0;h < 4;h++){
				if ((checksuit(roundplay[0]) == checksuit(roundplay[h])) && (roundplay[h] >= a)){
				
					a = roundplay[h];
					b = h;}  			
			}
	
			if ((order == 0) && (b == 0)) a = 0;
			if ((order == 0) && (b == 1)) a = 3;
			if ((order == 0) && (b == 2)) a = 2;
			if ((order == 0) && (b == 3)) a = 1;
			
			if ((order == 1) && (b == 0)) a = 1;
			if ((order == 1) && (b == 1)) a = 0;
			if ((order == 1) && (b == 2)) a = 3;
			if ((order == 1) && (b == 3)) a = 2;
			
			if ((order == 2) && (b == 0)) a = 2;
			if ((order == 2) && (b == 1)) a = 1;
			if ((order == 2) && (b == 2)) a = 0;
			if ((order == 2) && (b == 3)) a = 3;
			
			if ((order == 3) && (b == 0)) a = 3;
			if ((order == 3) && (b == 1)) a = 2;
			if ((order == 3) && (b == 2)) a = 1;
			if ((order == 3) && (b == 3)) a = 0;
			
			order = a;
		}
	
		
		void output(byte[] p){
			if (p != null && p.length >0){
				try {
					out.write(p, 0,p.length);
				} catch (IOException e){
					disconnect();
					listener.stop();
				}
			}
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
	void hdJoin ()throws IOException {
		int id=-1;
		String name="";
		id = in.readInt();
		name = in.readUTF();
		if (id!=myID) {
		
		joinRes(id,myNAME);
		}
	}
	
	void joinRes(int i,String s) throws IOException {
		output(Packet.CPPlayer(i,s));
	}

	void hdLeave()throws IOException {
	int id=-1;
	id = in.readInt();
 	}
 	
  	void youJoin() throws IOException{
  		String name=null;
 		myID =in.readInt();
 		name = myNAME;
 		output(Packet.CPJoinTable(myTable));	
//  		CPlayer you = g_players[myID]=new CPlayer(myID,name);	
  	}
  	void sendError(byte tag) throws IOException{
 	output(Packet.CPError(tag));
 	}
 	
 	void hdLeaveTable() throws IOException{
 		int t_id, p_id, seat;
 		
 		p_id = in.readInt();
 		
 		t_id=in.readInt();
 		
 		seat=in.readInt();
 		
		
		if (myID==p_id){// secret text
			myTable = -1;
 			mySeat = -1;
 			output(Packet.CPQuit());
 		}
}
 	
int findOrder(int order,int b) {
	int a=0;
	
			if ((order == 0) && (b == 0)) a = 0;
			if ((order == 0) && (b == 1)) a = 1;
			if ((order == 0) && (b == 2)) a = 2;
			if ((order == 0) && (b == 3)) a = 3;
			
			if ((order == 1) && (b == 0)) a = 3;
			if ((order == 1) && (b == 1)) a = 0;
			if ((order == 1) && (b == 2)) a = 1;
			if ((order == 1) && (b == 3)) a = 2;
			
			if ((order == 2) && (b == 0)) a = 2;
			if ((order == 2) && (b == 1)) a = 3;
			if ((order == 2) && (b == 2)) a = 0;
			if ((order == 2) && (b == 3)) a = 1;
			
			if ((order == 3) && (b == 0)) a = 1;
			if ((order == 3) && (b == 1)) a = 2;
			if ((order == 3) && (b == 2)) a = 3;
			if ((order == 3) && (b == 3)) a = 0;
	
	return a;
}

 	void hdPlayerTable() throws IOException{
 			int t_id, p_id, seat;
 			

 			t_id=in.readInt();
 			seat=in.readInt();
 			p_id=in.readInt();
 	
 			
 			if (myID==p_id){// secret text
 				myTable = t_id;
 				mySeat = seat;
 			output(Packet.AISeat(myID));
 			makeGame();
// 				createTableFrame();
 			}
	 		
 			}
 	
  	
public synchronized void  StartGame()throws IOException{
	int himId;
		  clubplay=0;
 	  diamonplay=0; 
 	  heartplay=0;
 	  spreadplay=0;
	
 	  root = null;
 	  aptr = null;
   	  ptr = null;
   	  oo = 0;
  	  
	  //set0(play1);
	  set0(initial); 
 	  AItern=0;
	
	  set0(cardinhand);
	  cardcount = 13;
	  set0(plays);
	   ps=0;
	   rp=0;
	   set0(roundplay);
	   outcard=0;	
 	   order = 0;
	   temp=0;
	   first=0;
 	   set0(per);	
	himId=in.readInt();	

	String RecvCard = in.readUTF();

	String debug="";
	for (int i=0;i<13;i++){
		debug = RecvCard.substring(i*2,(i*2)+2);
		cardinhand[i]=  Integer.parseInt(debug);

	}
	sortCard();
	System.out.print("AI card :");
	for (int i=0;i<13;i++){
		System.out.print(" "+cardinhand[i]);
	}
	System.out.println();
	turn = 0;
	first = 1;
	
	for(int fp=0;fp<4;fp++){
		FirstP[fp]= findOrder(himId,fp)+1;
	}
	for(int i=0;i<4;i++){
		System.out.println("FirstP"+i+" :"+FirstP[i]);
	}
	order = findOrder(himId,mySeat);
	System.out.println("ORDER  ==="+order);
	AItern = order+1;
	if (order == 0){
		insert();
		output(Packet.CPDropCard(rule()));

		//output(Packet.CPCheckInt("rp in start",rp));
	}
	
}
		  int nextplay(ANode q){
		int a = 0;
		int b = 0;	
			for(int i = 0;i < 4;i++){
				if ((checksuit(q.round[0]) == checksuit(q.round[i])) && (q.round[i] >= a)){
					
					a = q.round[i];
					b = i;}  			
			}
			
			if ((q.firstplayer == 1) && (b == 0)) a = 1;
			if ((q.firstplayer == 2) && (b == 0)) a = 2;
			if ((q.firstplayer == 3) && (b == 0)) a = 3;
			if ((q.firstplayer == 4) && (b == 0)) a = 4;
			
			if ((q.firstplayer == 1) && (b == 1)) a = 2;
			if ((q.firstplayer == 2) && (b == 1)) a = 3;
			if ((q.firstplayer == 3) && (b == 1)) a = 4;
			if ((q.firstplayer == 4) && (b == 1)) a = 1;
			
			if ((q.firstplayer == 1) && (b == 2)) a = 3;
			if ((q.firstplayer == 2) && (b == 2)) a = 4;
			if ((q.firstplayer == 3) && (b == 2)) a = 2;
			if ((q.firstplayer == 4) && (b == 2)) a = 1;
						
			if ((q.firstplayer == 1) && (b == 3)) a = 4;
			if ((q.firstplayer == 2) && (b == 3)) a = 1;
			if ((q.firstplayer == 3) && (b == 3)) a = 2;
			if ((q.firstplayer == 4) && (b == 3)) a = 3;									
		//	System.out.println(a);
			return(a);
		}
 	void sortCard(){
 		int temp =0;
 		for (int i=0;i<13;i++){
 			for (int j=0;j<12-i;j++){
 				
 				if (cardinhand[j]>cardinhand[j+1]){
 					temp = cardinhand[j];	
 					cardinhand[j] = cardinhand[j+1];	
 					cardinhand[j+1]	= temp;
 				}
 			}
 		}
 	}
  void insert(){
		int[] c= new int[16];
		int r = 0;
		for(int i =0;i<16;i++){
			if(per[i] != 0){
				
				c[r] = per[i];
				r = r+1;
				}
		}
	
		for(int i =0;i < 4;i++){
			System.out.println(roundplay[i]+" check "+checksuit(roundplay[i]));
			 if((checksuit(roundplay[i]) == 3) || (roundplay[i] == 9) || (roundplay[i] == 50)|| (roundplay[i] == 23)){
			 
			 c[r] = roundplay[i];
			 r = r+1;
			 }
		}
		copy(per,c);
		} 
		  int nextplay1(ANode f){
			int a = 0;
			if (f.tern == 1) a = 2;
			if (f.tern == 2) a = 3;
			if (f.tern == 3) a = 4;
			if (f.tern == 4) a = 1;
			return(a);
		}

        public   int[] canplay(int[] n,int suit){
        	int ps = 1;
        	int[] p = new int[8];
	 		
	 		for (int i = 0;i < n.length;i++){
	 			//	System.out.print("  "+n[i]);
	 			if (checksuit(n[i]) == suit){
	 		//		System.out.print(" *** "+suit+"  "+n[i]+" "+checksuit(n[i]));
	 				p[ps] = n[i];
	 				ps = ps + 1;
	 			}	 		
	 		}
	 
	 		if (ps == 1){
	 		 	for(int i = 0;i<n.length;i++){
	 		 		if(n[i] != 0){
	 		 			p[ps] = n[i];
	 		 			ps++;
	 		 		}
	 			}
	 		}
	 		p[0] = ps-1;
	 		return p;
	 	}

	      int[] insert(ANode a){
		int[] c= new int[16];
		int r = 0;
		for(int i =0;i<16;i++){
			if(a.percept[i] != 0){
				c[r] = a.percept[i];
				r = r+1;
				}
		}
		for(int i =0;i < 4;i++){
			 if((checksuit(a.round[i]) == 3) || (a.round[i] == 9) || (a.round[i] == 50)|| (a.round[i] == 23)){
			 c[r] = a.round[i];
			 r = r+1;
			 }
		}
		return(c);
		} 

  int[] set0(int[] n){
		for(int i = 0;i < n.length;i++){
			n[i] = 0;
		}
			return(n);
}
       	public   int[] can(int[] n){
       		int c = 1;
       		int[] p = new int[7];
       		for(int i = 0;i < n.length;i++){
       			if(n[i] != 0){
    //   				System.out.println(n[i]);
       				p[c] = n[i];
       				c++;}
       			}
       		c=c-1;
       		p[0] =c;
       		return(p);
       	}
          void insertson(ANode f){
       		if (f.playcard[0] != 0){
       		ANode o = new ANode();
       		o.firstplayer = f.firstplayer;
       		copy(o.percept,f.percept);
       		copy(data.p1,f.p1);
       		copy(data.p2,f.p2);
       		copy(data.p3,f.p3);
       		copy(data.p4,f.p4);
       		f.numchild = f.numchild + 1;
       		f.childcard[f.numchild] = f.playcard[f.playcard[0]];
       		f.childptr[f.numchild] = o;
       		for(int i = 0;i < 7;i++){
       			if (f.p1[i] == f.childcard[f.numchild]){data.p1[i] = 0;}
       			if (f.p2[i] == f.childcard[f.numchild]){data.p2[i] = 0;}
       			if (f.p3[i] == f.childcard[f.numchild]){data.p3[i] = 0;}
       			if (f.p4[i] == f.childcard[f.numchild]){data.p4[i] = 0;}
       		}
       		copy(o.p1,data.p1);
       		copy(o.p2,data.p2);
       		copy(o.p3,data.p3);
       		copy(o.p4,data.p4);
       		f.playcard[0] = f.playcard[0] - 1;
       		o.firstplayer = f.firstplayer;
       //		o.r = f.r;
       	
       		
       		
       		copy(o.round,f.round);
       	
       		if (f.round[3] != 0){o.round=set0(o.round);}
  
       		p:{
       			for (int i = 0;i <4;i++){
       				if (o.round[i] == 0){o.round[i] = f.childcard[f.numchild];break p;}
       			}
       		}
       		
       		if (o.round[3] == 0){
       			o.tern = nextplay1(f);
       			if(o.tern == 1){o.playcard = canplay(o.p1, checksuit(o.round[0]));}
				if(o.tern == 2){o.playcard = canplay(o.p2, checksuit(o.round[0]));}
				if(o.tern == 3){o.playcard = canplay(o.p3, checksuit(o.round[0]));}
				if(o.tern == 4){o.playcard = canplay(o.p4, checksuit(o.round[0]));}			       		
       		}
       	    		
       		
       		if (o.round[3] != 0){
       			o.tern = nextplay(o);
       			
       			o.firstplayer = o.tern;
       			if(o.tern != AItern){
       				if(o.tern == 1){o.playcard = can(o.p1);}
       				if(o.tern == 2){o.playcard = can(o.p2);}
       				if(o.tern == 3){o.playcard = can(o.p3);}
       				if(o.tern == 4){o.playcard = can(o.p4);}
       			}
       			if(o.tern==AItern){
       				if(o.tern == 1){o.playcard = can(o.p1);o.percept=insert(o);}
       				if(o.tern == 2){o.playcard = can(o.p2);o.percept=insert(o);}
       				if(o.tern == 3){o.playcard = can(o.p3);o.percept=insert(o);}
       				if(o.tern == 4){o.playcard = can(o.p4);o.percept=insert(o);}	
       			}
       			
       		}
       		
       		if ((o.tern == AItern) && (o.playcard[0] == 0)){
				o.percept = insert(o);}
			if 	((o.playcard[0] == 0)&&(endnode(o))){
				o.bestpoint = point(o.percept);	
			}
		
	   		aptr = o;
       		o.prev= f;
       		}
        }   
        
 	public   int point(int[] n){
		int p = 0;
		boolean no =true;
		boolean got10c = false;
		for(int i = 0;i <16;i++){
			
				switch(n[i]){
					case 27:p=p-2;no=false;break;
					case 28:p=p-3;no=false;break;
					case 29:p=p-4;no=false;break;
					case 30:p=p-5;no=false;break;
					case 31:p=p-6;no=false;break;
					case 32:p=p-7;no=false;break;
					case 33:p=p-8;no=false;break;
					case 34:p=p-9;no=false;break;
					case 35:p=p-10;no=false;break;
					case 36:p=p-20;no=false;break;
					case 37:p=p-30;no=false;break;
					case 38:p=p-40;no=false;break;
					case 39:p=p-50;no=false;break;
					case 50:p=p-100;no=false;break;
					case 23:p=p+100;no=false;break;
					case  9:no=false;got10c = true;break;
				}
			}
		if(got10c){ p=p*2;}
		if((got10c)&&(p==0)) p=50;
		if(no) p = -50;
		return(p);}

           boolean endnode(ANode e){
        	boolean end = true;
        	for (int i = 0;i < 7;i++){
        		if(e.p1[i] != 0) end = false;
        		if(e.p2[i] != 0) end = false;
        		if(e.p3[i] != 0) end = false;
        		if(e.p4[i] != 0) end = false; 
        	}
        	return(end);
        }
                   
    	  void searchway(int a){
    		outcard = 0;
    		uloop:{
    			if (a == 66){
    				outcard = 0;
    				ptr = ptr.best;
    				for(int i1 = 0;i1<4;i1++){
    					if (ptr.round[i1] != 0){ outcard = ptr.round[i1];}
    				}
    				
    			break uloop;
    		}
    		
    			rloop:{
    				for(int i2 =1;i2 < 7;i2++){
    					if(ptr.childcard[i2] == a){ptr = ptr.childptr[i2];break rloop;}
    				}
    			}
    		
    		}//uloop
    	}
 
  public   void show(ANode a){
        	System.out.println("--------------------------");
      
        	System.out.println("firstplayer  "+a.firstplayer);
        	System.out.println("numchild  "+a.numchild);
        	System.out.println("bestpoint "+a.bestpoint);
			for (int i=0;i <= a.numchild;i++)
				System.out.println("childcard "+ i +" "+a.childcard[i]);        
        	System.out.print("percept");
        	for (int i=0;i < a.percept.length;i++)
				System.out.print(" "+a.percept[i]);        
        	System.out.println();
        	System.out.print("p1  ");
        	for (int i=0;i < 7;i++) System.out.print(a.p1[i]+"  ");
        	System.out.println();
        	System.out.print("p2  ");
        	for (int i=0;i < 7;i++) System.out.print(a.p2[i]+"  ");
        	System.out.println();
        	System.out.print("p3  ");
        	for (int i=0;i < 7;i++) System.out.print(a.p3[i]+"  ");
        	System.out.println();
        	System.out.print("p4  ");
        	for (int i=0;i < 7;i++) System.out.print(a.p4[i]+"  ");
        	System.out.println();
        	System.out.println("tern  "+a.tern);
        	System.out.print("round  ");
        	for (int i=0;i < 4;i++) System.out.print(a.round[i]+"  ");		
 			System.out.println();       
 			System.out.print("playcard  ");
        	for (int i=0;i < 7;i++) System.out.print(a.playcard[i]+"  ");		
 			System.out.println();       
        	if ((a.playcard[0] == 0)&&endnode(a)){
       			System.out.println();
       			System.out.println("**************End Tree***********");}
        } 
 

public synchronized void  ControlGame()throws IOException{
	Runtime.getRuntime().freeMemory();
	
	int thisId=0;
	thisId=in.readInt();
	int  LeadCard;
	LeadCard = in.readInt();
	int LastCard;
	
	LastCard = in.readInt();
	

	//lead step
	if (LeadCard==0&&LastCard!=0){
		order=findOrder(thisId,mySeat);
		System.out.println("ORDER  ==="+order);
		get(LastCard);
		turn++;
		System.out.println("turn--->"+turn);
		
	
		rp =0;
	
		round = 0;
		
		
		
		if (turn <9){
			
			if(order==0){
				insert();
			}	
		}
	if(turn==9){
		System.out.println("start tree");
		output(Packet.AIMakeTree());
		root.tern= FirstP[thisId];
		System.out.println("root.tern >>>>>>"+root.tern);
		if (AItern == 1){copy1(root.p1,cardinhand);
		System.out.println("AItern == 1");}
		if (AItern == 2){copy1(root.p2,cardinhand);
		System.out.println("AItern == 2");}
		if (AItern == 3){copy1(root.p3,cardinhand);
		System.out.println("AItern == 3");}
		if (AItern == 4){copy1(root.p4,cardinhand);
		System.out.println("AItern == 4");}
		set0(roundplay);
		if (root.tern == 1) root.playcard = can(root.p1);
		if (root.tern == 2) root.playcard = can(root.p2);
		if (root.tern == 3) root.playcard = can(root.p3);
		if (root.tern == 4) root.playcard = can(root.p4);
	
	aptr = root;
    root.prev = null;
    root.isroot = true;
 	copy1(root.percept,per);
 	int l = 0;
    int k = 1; 		
    
    System.out.print("p1= ");
    for(int i =0;i<7;i++)
       System.out.print(root.p1[i]+"  ");
    System.out.println();
    
    System.out.print("p2= ");
    for(int i =0;i<7;i++)
       System.out.print(root.p2[i]+"  ");
    System.out.println();
    
    System.out.print("p3= ");
    for(int i =0;i<7;i++)
       System.out.print(root.p3[i]+"  ");
    System.out.println();
    
    System.out.print("p4= ");
    for(int i =0;i<7;i++)
       System.out.print(root.p4[i]+"  ");
    System.out.println();
	    
    System.out.print("CAN  ");
    for(int i =0;i<7;i++)
       System.out.print(root.playcard[i]+"  ");
    System.out.println();
    root.firstplayer = root.tern;
    show(root);
    try{
    kloop:{
      while(aptr != null){
           	insertson(aptr);
           	
           	k++;
          // 	System.out.println(k);
           	if(endnode(aptr)){
          	
          		if ((!aptr.isroot)&&(aptr.prev.bestpoint == 0)){
          			aptr.prev.bestpoint = aptr.bestpoint;
          			aptr.prev.best = aptr;}
          		
          		if ((!aptr.isroot)&&(aptr.prev.bestpoint < aptr.bestpoint)){
          			aptr.prev.bestpoint = aptr.bestpoint;
          			aptr.prev.best = aptr;}	
          		
          		aptr = aptr.prev;
 
          		l = 0;
          		while(aptr.playcard[0] ==0){
          			if ((!aptr.isroot)&&(aptr.prev.bestpoint == 0)){
          			aptr.prev.bestpoint = aptr.bestpoint;
          			aptr.prev.best = aptr;}
          			
          			if ((!aptr.isroot)&&(aptr.prev.bestpoint < aptr.bestpoint)){
          			aptr.prev.bestpoint = aptr.bestpoint;
          			aptr.prev.best = aptr;}
          			
          			aptr = aptr.prev;
          			if (aptr == null){break kloop;
          			}
          			l = l+1;
          
          			
          		}
          	}
          		
          		
          }//end while
          				break kloop;
 		 }//end kloop
 	}catch (Exception e){
 		System.out.println(e);
 	}
 		System.out.println("tree compleat");
        show(root);			
		aptr = root;
		ptr = root;
		output(Packet.AIEndTree());
	}
	
	if (turn >9){
			if(order != round)
			searchway(LastCard);
			show(ptr);	
	}
	
	}	
	//drop step
	if (LeadCard!=0&&LastCard!=0){	
	round++;
	
	if(turn<9) {
			
		get(LastCard);
		roundplay[round]=LastCard;
	
	}
	}
	if(turn>=9){
		System.out.println(" order = " +order + " round = "+round );
		if(order != round)
		System.out.println("do searchway("+LastCard+")");
			searchway(LastCard);
			show(ptr);
			roundplay[round]=LastCard;
	
	}
	
	//System.out.println("mySeat = "+mySeat+" thisId = "+thisId);
	
	if (mySeat == thisId){
		if(LeadCard==0){
			try{
				sleep(2000);
			}catch (InterruptedException e){
				System.out.println(e);
			}
		}
		if (turn<9){
			output(Packet.CPDropCard(rule()));
			System.out.print("cardinhand :");
			for(int i=0;i<13;i++){
				System.out.print(" "+cardinhand[i]);
			}
			System.out.println();
		}
		if (turn >=9){
			System.out.println("do searchway(66)");
			searchway(66);
			show(ptr);
			output(Packet.CPDropCard(outcard));
		}
	}//if myid	
			
}//end procedure

void makeGame() throws IOException{
	output(Packet.CPMakeGame());
}

	void outMessage() throws IOException {
	int id = in.readInt();
	String text = in.readUTF();
//	outText.appendText("From:"+id+" >"+text+"\n");
	}
void getCard()throws IOException{
	int[] cardTemp = new int[13];
	int sendId = in.readInt();
	System.out.println("in get card from :"+sendId);
//	System.out.println("FirstP[] :"+FistP[sendId]);
	for(int i=0;i<13;i++){
		cardTemp[i] = in.readInt();
	}
	
		if(FirstP[sendId]==1){
			System.out.println("getCardp1");
				copy1(root.p1,cardTemp);
				
			}
		if(FirstP[sendId]==2){
			System.out.println("getCardp2");
				copy1(root.p2,cardTemp);
				
			}
		if(FirstP[sendId]==3){
			System.out.println("getCardp3");
				copy1(root.p3,cardTemp);
				
			}
		if(FirstP[sendId]==4){
			System.out.println("getCardp4");
				copy1(root.p4,cardTemp);
				
			}
	
	
}
public synchronized void aiIn()throws IOException{
	int aipos =in.readInt();
}
public synchronized void  destroyMySelf(){
	output(Packet.CPQuit());
	
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
//		CPlayer him = g_players[id]= new CPlayer(id, name);
//		if (tid !=-1){
//			g_tables[tid].players[tseat]=him;
//			him.tableId =tid;
//			him.seat=tseat;
		//	player_List.appendText(him.toTable());
//		} 
//		player_List.appendText(him.toLobby());
	
	}
public synchronized void  endGame()throws IOException{
	int thisId=in.readInt();
	int lastCard=in.readInt();
	  clubplay=0;
 	  diamonplay=0; 
 	  heartplay=0;
 	  spreadplay=0;
	
 	  root = null;
 	  aptr = null;
   	  ptr = null;
   	  oo = 0;
  	  
	  //set0(play1);
	  set0(initial); 
 	  AItern=0;
	
	  set0(cardinhand);
	  cardcount = 13;
	  set0(plays);
	   ps=0;
	   rp=0;
	   set0(roundplay);
	   outcard=0;	
 	   order = 0;
	   temp=0;
	   first=0;
 	   set0(per);	
}

//main
public void run(){ //this write in client class
	output(Packet.CPLogin(myNAME));
	
//	outText.appendText("START SERVER 80");
	Loop:
		while(true){
			try{			
				
				byte tag = in.readByte();
			
				switch(tag){
					case Packet.SP_ENDGAME:{
						endGame();
						break;
					}
					case Packet.SP_JOIN_TABLE:{
//						outText.appendText("SP_JOIN_TABLE");
 						hdPlayerTable();
						break;
					}
					case Packet.SP_YOU_ARE:{
						youJoin();
						break;
						}
					case Packet.AI_ENDTREE:{
					
						break;
					}
					case Packet.SP_WAITAI:{
					
						break;
					}
					case Packet.SP_WAIT:{
//						outText.appendText("SP_WAIT");
						break;
					}
				
					case Packet.MSG_ALL:{
//						outText.appendText("MSG_ALL");		
						outMessage();
						break;
					}
					case Packet.SP_JOIN:{
//						outText.appendText("SP_JOIN");
						hdJoin();
						break;
					}
					case Packet.SP_AIIN:{
						aiIn();
						break;
					}
					case Packet.SP_2AI:{
						getCard();
						break;
					}
					case Packet.SP_DESTROYAI:{
						destroyMySelf();
						break;
					}
					case Packet.SP_LEAVE:{
//						outText.appendText("SP_LEAVE");
						hdLeave();
						break;
					}
					case Packet.MSG_SP2CP:{
//						outText.appendText("MSG_SP2CP");
						outMessage();
						break;
					}
					case Packet.SP_PLAYER:{
//						outText.appendText("SP_PLAYER");
						playerJoin();
						break;
					}
					
					case Packet.SP_IN_TABLE:{// i will make table
//						outText.appendText("SP_IN_TABLE");
						makeGame();
						break;
					}
					case Packet.MSG_GOD:{
//						outText.appendText("MSG_GOD");
						outMessage();
						break;
					}
					case Packet.SP_LEAVE_TABLE:{
//						outText.appendText("SP_WAIT");
						hdLeaveTable();
						break;
					}
					case Packet.SP_INITCARD:{
//						outText.appendText("SP_INITCARD");
						StartGame();
						break;
					}
					case Packet.SP_THISPLAYER:{
//						outText.appendText("SP_THISPLAYER");
						ControlGame();
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
	
	}	

}
