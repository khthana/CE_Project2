
import java.net.*;
import java.io.*;
class Player extends Thread{
	public static Player[] global = new Player[100];
	public static Table AllTable= null;
	
	public static int TableCount=0;
	public Table PTable;
//	public Table PTable=null;
	public int id = -1;
	public String name = null;
	private Socket sock;
	private DataInputStream in;
	private DataOutputStream out;
	public boolean connected = true;
	private PlayerOutput out_thread = null;
	//public int tableId = -1;
	public int seat = -1;
	public int myTable = -1;
	
	

public Player (Socket s, DataInputStream in, DataOutputStream out)
//throws FullServerException
{
	synchronized (global){
		for (int i = 0; i < global.length; i++){
			if (global[i] == null){
				
				id = i;
				global[i] = this;
				break;
			}
		}
	
	}
/*	if (id == -1)
		throw new FullServerException();*/
	if (TableCount <5){
	for (int i = 0;i <6;i++)	{
		AllTable= new Table();
		TableCount++;
	}
}
	sock = s;
	this.in = in;
	this.out = out;
	(out_thread = new PlayerOutput(this, out)).start();
	output(Packet.SPYouAre(id));
}

public void output (byte[] p){
	if (connected)		
		out_thread.output(p);
}
public static void outputAll(byte[] p){
	synchronized (global){
		for (int i =0; i < global.length; i++){
			Player him = global[i];
			if (him != null && him.name != null)
				him.output(p);
		}
	}
}

public static void outputTo(byte[] p,int recievId){
	synchronized (global){
		Player him= global[recievId];
		if (him != null && him.name != null)
			him.output(p);
	}
}
public synchronized void disconnect(){
	System.out.println("LOGOUT ID : "+id+",NAME : "+name);
	System.out.println("From :" +sock.getLocalAddress()+" Port :"+sock.getLocalPort());
	if (id == -1) return;
	connected = false;
	if(PTable !=null){
			PTable.Leave(this);
	}
	
	synchronized(global){
		global[id] = null;
	}
	try{
		
		in.close();
		out.close();
		sock.close();
	}catch(IOException e){
		System.out.println(e);
	}
	if (name != null)
		outputAll(Packet.SPLeave(id));
	id = -1;
//	tableId = -1;
	seat = -1;
}

public void CP2CPMSG()throws IOException {
	int toId=in.readInt();
	String Message=in.readUTF();
	System.out.println(toId+Message);
	outputTo(Packet.CP2CP(id,Message),toId);
	output(Packet.CP2CP(id,Message));
}
public synchronized void userHdJoin()throws IOException {
	outputAll(Packet.SPJoin(id,name));
}

public synchronized void playerJoinTable()throws IOException {
	//only join table
	myTable = in.readInt();
	System.out.println(id +") join table = "+myTable);
	PTable = AllTable.global[myTable];
	if (PTable.MaxPlayer < 4){
		PTable.join(this,true);	
	}
}
	


public synchronized void playerLeaveTable()throws IOException {
	int temp = in.readInt();
	PTable.Leave(this);
	myTable=-1;
//	PTable=null;
}

public synchronized void readCard()throws IOException {
	int card = in.readInt();
	System.out.println("id >"+id+"nubmer of card drop is"+card);
	PTable.ControlGame(card);
}

public void testtest() throws IOException{
	System.out.println(in.readInt());
	System.out.println(in.readInt());
	System.out.println(in.readInt());
}

/*public void getRequestCard() throws IOException{
	int seq = in.readInt();
	int player = in.readInt();
	System.out.println("get card seq := "+seq+" from player "+player);
	PTable.sendCard(seq,player);
}*/

public void checkVar() throws IOException{
	String varName = in.readUTF();
	int varValue = in.readInt();
	System.out.println(varName+" := "+varValue);
}
public synchronized void sendToAI() throws IOException{
		int[] tcard = new int[13];
		for(int i=0;i<13;i++){
			tcard[i]=in.readInt();
	//		System.out.println(tcard[i]);
		}
		
		
		outputTo(Packet.card2AI(seat,tcard),PTable.aiPos);
		
}
public synchronized  void keepAI() throws IOException{
	PTable.aiPos = in.readInt();
				
	for (int i=0;i<4;i++){
		if(PTable.players[i]!=null){
		if (PTable.players[i].id != id){
			outputTo(Packet.haveAI(PTable.aiPos),PTable.players[i].id);
		}
	}
	}
}
private Integer working = new Integer(0);
public  void run(){
	Loop:
		while (connected){
			try{
		//		System.out.println("START.....");
				byte tag = in.readByte();
			
				System.out.println("tag :"+tag);
				synchronized(working){
				
					switch(tag){
						case Packet.CP_QUIT:{
					
							break Loop;}
							
						case Packet.CP_MESSAGE:{
					
							hdMessage();
							break;
						}
						case Packet.CP_LOGIN:{
					
							loginUser();
							userHdJoin();
							break;
						}
						case Packet.CP_PLAYER:{
					
							playerJoin();
							break;
						}
						case Packet.MSG_CP:{
					
							CP2CPMSG();
							break;
						}
						case Packet.CP_JOINTABLE:{
							playerJoinTable();
							break;
						}
						case Packet.AI_MAKETREE:{
						PTable.waitAi();
							break;
						}
						case Packet.AI_ENDTREE:{
							PTable.endWaitAI();
							break;
						}
						// test
						case Packet.SP_JOIN_TABLE:{
							testtest();
							break;
						}
						case Packet.CP_CREATTABLE:{
						//	makeNewTable();
							break;
						}
						//end test
						case Packet.CP_LEAVETABLE:{
							playerLeaveTable();
							break;
							}
						case Packet.CP_MAKEGAME:{
							PTable.makeNewGame();
							break;
							}	
						case Packet.CP_2AI:{
							sendToAI();
							break;
						}
						case Packet.AI_SEAT:{
							keepAI();
							break;
						}
					/*	case Packet.CP_REQUEST_CARD:{
							getRequestCard();
							
							break;
							}	*/
						case Packet.CP_DROPCARD:{
							readCard();
							break;
							}
						case Packet.CP_CHECKINT:{
							checkVar();
							break;
						}
						case Packet.CP_ERROR:{
							errorCheckTag();
							break;
							}		
					}
				}
			}catch (IOException e){
				break Loop;
			}
		}
		
		connected = false;
		out_thread.stop();
		disconnect();
		connected = true;
}
public void errorCheckTag()throws IOException {
	byte tag = in.readByte();
	System.out.println("Error Tag is"+tag+"\n");
}
public void loginUser()throws IOException {
	name = in.readUTF();
	System.out.println("LOGIN ID : "+id+",NAME : "+name);
	System.out.println("From :" +sock.getLocalAddress()+" Port :"+sock.getLocalPort());
	//send message to user
	output(Packet.SPYouAre(id));
}
public void stopOnWait(){
	connected = false;
	synchronized(working){
		stop();
	}
}
void hdMessage() throws IOException {
	
	String text = in.readUTF();
	System.out.println(text);
/*	if (type == Packet.MSG_SERVER)
		System.out.println("Msg from " + id + ":" + text);
	else if (type == Packet.MSG_TABLE && table != null)

		table.outputTable(Packet.SPMessage(Packet.MSG_TABLE, id ,text));
	else*/
		outputAll(Packet.SPMessage(Packet.MSG_ALL, id, text));
		

}
	void playerJoin() throws IOException{
		int i;
		String s;
		i=in.readInt();
		s=in.readUTF();
		//System.out.println(i+" "+s);
		if (PTable != null){
		outputTo(Packet.SPPlayer(id,s,PTable.id,seat),i);
		} else{
		outputTo(Packet.SPPlayer(id,s,-1,-1),i);	
		}
	}
	void hdLogin() throws IOException{
		 String n = in.readUTF();
		 synchronized(global){
			 for (int i = 0 ; i < global.length ; i++ ){
				if (global[i] != null && n.equals(global[i].name)){
					//output(Packet.SPLogin(Packet.LOGIN_TWICE));
					return;
				}
			 }
			 name = n;
			 
		 }
	//	 output(Packet.SPLogin(Packet.LOGIN_OK));
	/*	 synchronized(global){
			 for (int i = 0;i< global.Length; i++){
				if (global[i] != null && global[i].name != null)
				
					output(Packet.SPJoin(i, global[i].name));
		 }
		}*/
		synchronized(Table.global){
			for (int i = 0;i < Table.global.length; i++){
			
				if (Table.global[i] != null){
				  //output(Packet.SPTableOpt(i, null));
				  Table.global[i].update(this);
				}
			}
		}
		}

}

	