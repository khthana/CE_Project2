import java.net.*;
import java.io.*;
import java.util.*;

public class ServerAck extends Thread
{
  ServerListener    sLis;
  OwnerUserInfo     oUserInfo;
  byte[]            data;
  int               dataID=1;
  short             commandReply;
  short             seqReceive;
  Util              u=new Util();
  ClientToServerCMD cmd;
  DatagramSocket    serverSocket;
  ExtractServerData eData;

  public ServerAck(OwnerUserInfo oUserInfo)
  {
      super(oUserInfo.allThread,"serverAck");
      this.oUserInfo =oUserInfo;
      this.eData=new ExtractServerData(oUserInfo);
      this.sLis =this.oUserInfo.sLis;
      this.serverSocket =oUserInfo.getServerLisSocket ();
      cmd=new ClientToServerCMD(this.oUserInfo);
      this.start();
  }

  public void run()
  {
      while(true)
      {
            try{
            data=receivePacket();
            }catch(Exception e){System.out.println (e);}

              commandReply=eData.getCommand(data);
              seqReceive=eData.getSeq(data);

            if(commandReply!=10)
            {
              try{
                 oUserInfo.sendPacket (cmd.ACK(seqReceive));
              }catch(Exception e){System.out.println (e);}
            }
            sLis.dataBox.addElement (new DataFromServer(data,dataID));
            this.yield ();
      }
  }

 	public byte[] receivePacket() throws IOException
	{
    byte[] buffer=new byte[65507];
		int datagramLen=0;
		DatagramPacket serverPacket=new DatagramPacket(buffer, buffer.length);
		serverSocket.receive(serverPacket);
		datagramLen=serverPacket.getLength();
		ByteArrayInputStream byteI=new ByteArrayInputStream(serverPacket.getData(),0,datagramLen);
		DataInputStream dataI=new DataInputStream(byteI);
		byte[] recData=new byte[datagramLen];
		dataI.read(recData);
    if(dataID==1)dataID=2;else dataID=1;
		return recData;
	}
}
