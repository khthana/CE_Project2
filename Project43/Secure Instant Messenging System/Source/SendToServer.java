import  java.net.*;
import  java.io.*;
import  java.util.*;

public class SendToServer extends Thread
{
  DatagramSocket    serverSocket;
  String					  icqServerName	  =	"icq.mirabilis.com";
  InetAddress       icqServerAddr    ;
	int				  		  icqServerPort		=	4000;

  byte[]          data;
  Util            u=new Util();
  OwnerUserInfo   oUser;
  ServerListener  sLis;

  byte[]          indata;
  short           commandReply=0;
  short           seqReply=0;
  short           sendCommand=0;
  short           seqCommand=0;
  boolean         ack=false;
  byte            sendCount=0;
  TimeCount       tc;
  int             msgID=0;
  ExtractServerData eData;

  SendToServer(OwnerUserInfo oUser,byte[] data)
  {
        super(oUser.allThread,"sendToServer");
        this.serverSocket = serverSocket;
        this.oUser =oUser;
        this.eData=new ExtractServerData(oUser);
        this.serverSocket =oUser.getServerLisSocket();
        this.sLis=oUser.sLis;
        this.sLis.Listener.addElement (this);
        this.data=data;
        this.start();
  }

  public void run()
	{
      try{
      icqServerAddr=InetAddress.getByName(icqServerName);
      }catch(Exception e){System.out.println ("Send to Server : "+e);}
      DatagramPacket theOutput=new DatagramPacket(data,data.length,icqServerAddr,icqServerPort);
      System.out.print("(Client) Version."+eData.getVersion(data)+" ");
      sendCommand=eData.getCommand(data);
      System.out.print("Command."+sendCommand+" ");
      seqCommand=eData.getSeq(data);
      System.out.println("SeqNumber."+seqCommand+" ");

    do{
      try{serverSocket.send(theOutput);}catch (Exception e){System.out.println ("Send to Server : "+e);}
      if(sendCommand!=10)
      {
        tc=new TimeCount(15000);
        do{
          if((sLis.getFlag())&&(sLis.getMsgID()!=msgID))
          {
            msgID=sLis.getMsgID();
            indata=sLis.getData();
            commandReply=eData.getCommand(indata);
            seqReply=eData.getSeq(indata);
            if((commandReply==10)&&(seqReply==seqCommand)){ack=true;}
          }
          this.yield();
        }while((!tc.timeOut())&&(!ack));
      }else{ack=true;}
      sendCount++;
    }while((!ack)&&(sendCount<4));
    sLis.Listener.removeElement (this);
	}
}
