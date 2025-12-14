
import java.io.*;


public class Packet extends DataOutputStream{
	ByteArrayOutputStream b_out;

	private Packet (ByteArrayOutputStream buf){
		super(buf);
		b_out = buf;
	}
	private byte[] buf(){
		return b_out.toByteArray();
	}
	private static Packet New (int size){
		ByteArrayOutputStream buf = new ByteArrayOutputStream(size);
		return new Packet(buf);
	}
//this is Head of packet start

// client send to server 
public static final byte CP_QUIT=20;
public static final byte CP_MESSAGE =21;
public static final byte CP_LOGIN=22;
public static final byte CP_PLAYER=23;
public static final byte CP_JOINTABLE=24;
public static final byte CP_LEAVETABLE=25;
public static final byte CP_CREATTABLE=26;
public static final byte CP_MAKEGAME=27;
public static final byte CP_DROPCARD=28;
public static final byte CP_ERROR=29;
public static final byte CP_REQUEST_CARD =30;
public static final byte CP_CHECKINT = 31;
public static final byte CP_2AI = 32;
// server send to client 
public static final byte SP_WAIT = 0;
public static final byte SP_YOU_ARE = 15;
public static final byte SP_LEAVE = 2;
public static final byte SP_SOME_PACKET = 3;
public static final byte SP_JOIN = 4;
public static final byte SP_QUIT = 127;
public static final byte SP_PLAYER = 16;

public static final byte SP_JOIN_TABLE = 49;
public static final byte SP_IN_TABLE = 51;
public static final byte SP_LEAVE_TABLE = 52;
public static final byte SP_THISPLAYER=53;
public static final byte SP_ENDGAME=54;
public static final byte SP_INITCARD=55;
public static final byte SP_GIVECARD=56;
public static final byte SP_2AI=58;
public static final byte SP_AIIN=59;
public static final byte SP_CARDJOIN=60;
public static final byte SP_WAITAI=63;
public static final byte SP_DESTROYAI=64;
public static final byte AI_SEAT=57;
public static final byte AI_MAKETREE=61;
public static final byte AI_ENDTREE=62;
// massage chat
public static final byte MSG_SERVER=5;
public static final byte MSG_TABLE =6;
public static final byte MSG_ALL =7;
public static final byte MSG_GOD =8;
public static final byte MSG_CP =9;
public static final byte MSG_SP2CP =10;


//end Head of packet 

public static byte[] AIMakeTree(){
	try{
		Packet p =New(10);
		p.writeByte(AI_MAKETREE);
		return p.buf();
	} catch (IOException e){return null;}

}
public static byte[] waitAI(){
		try{
		Packet p =New(10);
		p.writeByte(SP_WAITAI);
		return p.buf();
	} catch (IOException e){return null;}
}

public static byte[] SPDestroyAI(){
	try{
		Packet p =New(10);
		p.writeByte(SP_DESTROYAI);
		return p.buf();
	} catch (IOException e){return null;}

}

public static byte[] AIEndTree(){
	try{
		Packet p =New(10);
		p.writeByte(AI_ENDTREE);
		return p.buf();
	} catch (IOException e){return null;}

}

public static byte[] card2AI(int id,int[] tcard){
	try{
		Packet p =New(10);
		p.writeByte(SP_2AI);
		p.writeInt(id);
		for(int i=0;i<13;i++)
			p.writeInt(tcard[i]);
		
		return p.buf();
	} catch (IOException e){return null;}

}
public static byte[] haveAI(int aiSeat){
	try{
		Packet p =New(10);
		p.writeByte(SP_AIIN);
		p.writeInt(aiSeat);
		
		return p.buf();
	} catch (IOException e){return null;}
}


//server tell other to know some one join table
public static byte[] CPCheckInt(String varName,int var){
	try{
		Packet p =New(10);
		p.writeByte(CP_CHECKINT);
		p.writeUTF(varName);
		p.writeInt(var);
		
		return p.buf();
	} catch (IOException e){return null;}
}
	
/*public static byte[] CPRequestCard(int seq,int player){
		try{
		Packet p =New(10);
		p.writeByte(CP_REQUEST_CARD);
		p.writeInt(seq);
		p.writeInt(player);
		return p.buf();
	} catch (IOException e){return null;}
}*/
public static byte[] CardInJoin(int ThisPlayer,String SendCard,int[] LastCard,int turn,int LeadCard){
		try{
		Packet p =New(10);
		p.writeByte(SP_CARDJOIN);
		p.writeInt(ThisPlayer);
		p.writeUTF(SendCard);
		p.writeInt(LeadCard);
		p.writeInt(turn);
		for(int i=0;i<4;i++){
			p.writeInt(LastCard[i]);
		}
		
	

		return p.buf();
	} catch (IOException e){return null;}
}
public static byte[] GiveCard(int seq,int card){
		try{
		Packet p =New(10);
		p.writeByte(SP_GIVECARD);
		p.writeInt(seq);
		p.writeInt(card);
		return p.buf();
	} catch (IOException e){return null;}
}
public static byte[] EndGame(int id,int LastCard){
	try{
		Packet p =New(10);
		
		p.writeByte(SP_ENDGAME);
		p.writeInt(id);
		p.writeInt(LastCard);
		return p.buf();
	} catch (IOException e){return null;}
}

public static byte[] InitCard(int player,String SendCard){
	try{
		Packet p =New(10);
		p.writeByte(SP_INITCARD);
		p.writeInt(player);
		p.writeUTF(SendCard);
		return p.buf();
	} catch (IOException e){return null;}
}
/*public static byte[] InitCard(int player){
	try{
		Packet p =New(10);
		p.writeByte(SP_INITCARD);
		p.writeInt(player);
		return p.buf();
	} catch (IOException e){return null;}
}*/
public static byte[] ThisPlayer(int player,int leadCard,int lastCard){
	try{
		Packet p =New(10);
		p.writeByte(SP_THISPLAYER);
		p.writeInt(player);
		p.writeInt(leadCard);
		p.writeInt(lastCard);
		
		return p.buf();
	} catch (IOException e){return null;}
}
public static byte[] CPMakeGame(){
	try{
		Packet p = New(10);
		p.writeByte(CP_MAKEGAME);
		return p.buf();
	} catch (IOException e){return null;}
}	


public static byte[] CPDropCard(int cardNumber){
	try{
		Packet p = New(10);
		p.writeByte(CP_DROPCARD);
		p.writeInt(cardNumber);
		return p.buf();
	} catch (IOException e){return null;}
}	

public static byte[] CPCreatTable(){
	//out of table
	try{
		Packet p = New(10);
		p.writeByte(CP_CREATTABLE);
		return p.buf();
	} catch (IOException e){return null;}
}


public static byte[] CPLeaveTable(int idtable){
	//out of table
	try{
		Packet p = New(10);
		p.writeByte(CP_LEAVETABLE);
		p.writeInt(idtable);
		return p.buf();
	} catch (IOException e){return null;}
}


public static byte[] CPJoinTable(int idtable){
	//join table
	try{
		Packet p = New(10);
		p.writeByte(CP_JOINTABLE);
		p.writeInt(idtable);
		return p.buf();
	} catch (IOException e){return null;}
}
//client send chat to another person but send pass server 1st
public static byte[] CP2CP(int i,String s){
	try{
		Packet p =New(10);
		p.writeByte(MSG_SP2CP);
		p.writeInt(i);
		p.writeUTF(s);
		return p.buf();
	} catch (IOException e){return null;}
}
// send id to clieent
public static byte[] CPPlayer(int i,String s){
	//tell id client to know me
	try{
		Packet p=New(10);
		p.writeByte(CP_PLAYER);
		p.writeInt(i);
		p.writeUTF(s);
		return p.buf();
	} catch(IOException e){
		return null;
	}
	}
public static byte[] SPMessage(byte b,int i,String s){
	try{
		Packet p = New(10);
		p.writeByte(b);
		p.writeInt(i);
		p.writeUTF(s);
		return p.buf();
	} catch (IOException e) {return null;}
	
}
public static byte[] SPPlayer(int i,String s,int TableId,int seat){
	try{
		Packet p = New(10);
		p.writeByte(SP_PLAYER);
		p.writeInt(i);
		p.writeUTF(s);
		p.writeInt(TableId);
		p.writeInt(seat);
		return p.buf();
	} catch (IOException e) {return null;}
}
public static byte[] SPSomePacket (byte b,int i,String s){
	try{
		Packet p = New(10);
		p.writeByte(SP_SOME_PACKET);
		p.writeByte(b);
		p.writeInt(i);
		p.writeUTF(s);
		return p.buf();
	} catch (IOException e) {return null;}
}

public static byte[] CPQuit(){
	try{
		Packet p=New(10);
		p.writeByte(CP_QUIT);
		return p.buf();
	}catch (IOException e) {return null;}
	
}

public static byte[] CPLogin(String s){
	try{
		Packet p=New(10);
		p.writeByte(CP_LOGIN);
		p.writeUTF(s);
		return p.buf();
	}catch (IOException e) {return null;}
}
public static byte[] SPJoin(int id,String name){
	try{
		Packet p = New(10);
		p.writeByte(SP_JOIN);
		p.writeInt(id);
		p.writeUTF(name);
		return p.buf();		
	} catch (IOException e) {return null;}		
}
public static byte[] MSG2CP(int id, String text){
	try{
		Packet p =New(10);
		p.writeByte(MSG_CP);
		p.writeInt(id);
		p.writeUTF(text);
		return p.buf();
	} catch(IOException e){return null;
	}
}

public static byte[] SPYouAre(int id){
	try{
	Packet p = New(10);
	p.writeByte(SP_YOU_ARE);
	p.writeInt(id);
	
	return p.buf();
	} catch (IOException e) {return null;}

}
public static byte[] AISeat(int AIid){
	try{
	Packet p = New(10);
	p.writeByte(AI_SEAT);
	p.writeInt(AIid);
	return p.buf();
	} catch (IOException e) {return null;}
}
public static byte[] SPLeave(int id){
	try{
	Packet p = New(10);
	p.writeByte(SP_LEAVE);
	p.writeInt(id);
	return p.buf();
	} catch (IOException e) {return null;}

}
public static byte[] CP2AI(int[] card){
	try{
		Packet p =New(10);
		p.writeByte(CP_2AI);
		for(int i=0;i<card.length;i++){
			p.writeInt(card[i]);
		}
		return p.buf();
	} catch (IOException e) {return null;}
}
public static byte[] SPLeaveTable(int playerid,int table,int seat){

	try{
		Packet p =New(10);
		p.writeByte(SP_LEAVE_TABLE);
		p.writeInt(playerid);
		p.writeInt(table);
		p.writeInt(seat);
		return p.buf();
	} catch (IOException e) {return null;}
}

public static byte[] SPTableJoin(int tableid,int seat,int playerid){
	try{
		Packet p =New(10);
		p.writeByte(SP_JOIN_TABLE);
		p.writeInt(tableid);
		p.writeInt(seat);
		p.writeInt(playerid);
		return p.buf();
	} catch (IOException e) {return null;}
}

public static byte[] SPInTable(int tableid,int seat,int playerid){
	try{
		Packet p =New(10);
		p.writeByte(SP_IN_TABLE);
		p.writeInt(tableid);
		p.writeInt(seat);
		p.writeInt(playerid);
		return p.buf();
	} catch (IOException e) {return null;}
}
public static byte[] CPMessage(String t){
	try{
		Packet p =New(10);
		p.writeByte(CP_MESSAGE);
		p.writeUTF(t);
		return p.buf();
	} catch (IOException e) {return null;}
}
public static byte[] CPError(byte errorCode){
	try{
		Packet p =New(10);
		p.writeByte(CP_ERROR);
		p.writeByte(errorCode);
		return p.buf();
	} catch (IOException e) {return null;}

}

public static void hdSomeThing() throws IOException{ //test
/*	byte b = in.readByte();
	int  i = in.readInt();
	string s = in.readUTF();*/
}
}