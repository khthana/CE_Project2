import java.net.*;
import java.io.*;
import java.util.*;
import java.math.BigInteger;

public class ClientHandle  extends Thread
{
  ChannelData cData;
  boolean found=false;
  OwnerUserInfo oUserInfo;
  ContactUserInfo cUserInfo;
	Socket connection;
	DataInputStream inS;
  DataOutputStream outS;
	TimeCount tc;
  Util u=new Util();
  boolean   connectionOK=true;
  byte[] data;
  short  packetLen;
  MainFrame      f;

  public ClientHandle(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo,Socket connection)
  {
    super(oUserInfo.allThread,"clientHandle");
 	  System.out.println("...........................New handle...............);.");
    this.oUserInfo=oUserInfo;
    this.f=oUserInfo.f;
    cData=new ChannelData(oUserInfo);
    this.cUserInfo=cUserInfo;
		try{
  		this.connection=connection;
      if(cUserInfo.getUIN()==0)
      {
	  	  inS=new DataInputStream(connection.getInputStream());
        outS=new DataOutputStream(connection.getOutputStream());
      }
      else
      {
        inS=cUserInfo.inS;
        outS=cUserInfo.outS;
        found=true;
      }
		  this.start();
		}catch(Exception e){System.out.println(e);}
  }

  public void run()
	{
 		System.out.println(".........................Input Message From TCP........................");
  try{
    while(connectionOK)
    {
    System.out.println("wait tcp data");
    packetLen=inS.readShort();
    System.out.println("read ok 1");
    packetLen=u.bytes2Short(u.short2BytesSW(packetLen));
    data=new byte[packetLen];

    System.out.println("read ok 2");
   		if (packetLen==26)
	  	{
        inS.readFully(data);
				System.out.print("****************** RECEIVE INIT ****************\n");
 				System.out.println("("+packetLen+")"+u.bytes2HxStr(data));
				packetLen=inS.readShort();
			 	packetLen=u.bytes2Short(u.short2BytesSW(packetLen));
        data=new byte[packetLen];
		  }
				System.out.print("****************** RECEIVE MESSAGE ****************\n");
				inS.readFully(data);
       	System.out.println("("+packetLen+")"+u.bytes2HxStr(data));
        cData.receiveData(data);

      if(!found)
      {
            int rUIN=cData.getUIN();
            Vector vUser=oUserInfo.getContactList();
            //--------------------
            VectorManager vManager=new VectorManager();
            cUserInfo=vManager.findContactUser(vUser,cUserInfo,rUIN);
            if(cUserInfo.getUIN()!=0)
            {
             found=true;
             System.out.println("found user "+cUserInfo.getUIN());
            }
               cUserInfo.cHandle=this;
               cUserInfo.cEstablish=true;
               cUserInfo.connection=connection;
               cUserInfo.inS=inS;
               cUserInfo.outS=outS;

            if(!found)
            {
               found=true;
               cUserInfo.setUIN(rUIN);
               cUserInfo.setNick(String.valueOf(rUIN));
               cUserInfo.setContactStatus(cUserInfo.c_contactNotin);
               f.addToTable(cUserInfo,cUserInfo.c_tableNotin);
            }
        }

        System.out.println(cData.getCommand());
        System.out.println(cData.getMessageType());
        System.out.println(cData.getMessage());
        System.out.println("Sender UIN"+cUserInfo.getUIN());

     if(cData.getCommand()==cData.c_CmdMessage)
     {
               if(cData.getMessageType()==cData.c_MsgTypeMsg)
               {
                 byte[] sAck=cData.getAckMessageBytes("");
                 outS.write(cData.GetLength(sAck));
                 outS.write(sAck);
                 System.out.println("...........ack.............");
               }
               else if(cData.getMessageType()==cData.c_MsgTypeFile)
               {

                  System.out.println("rec file seq "+cData.fileSeq);
                  System.out.println("rec file nameLen "+cData.getFileNameLength());
                  System.out.println("rec file name "+cData.getFileName());
                  System.out.println("rec file size "+cData.getFileSize());
                  System.out.println("rec file port "+cData.getFilePortIntel());
               }

                 DataReceive dRec=new DataReceive(cData.getMessageType());
                 dRec.setMessage(cData.getMessage());
                 dRec.setFileName(cData.getFileName());
                 dRec.setFileSize(cData.getFileSize());
                 cUserInfo.addData(dRec);
        }
     else if((cData.getCommand()==cData.c_CmdAck)&&(cData.getMessageType()==cData.c_MsgTypeFile))
     {

         if((cData.getFilePortIntel()==0)||(cData.getFilePortIntel()>Short.MAX_VALUE))
         {
          System.out.println("cancel send file");
          cUserInfo.pgFrame.closeFrame();
          WarningFrame wFrame=new WarningFrame(cUserInfo.getNick()+" abort to receive file.");
          wFrame.setTitle("Send file result");
         }
         else
         {
          System.out.println("begin send file "+cData.getFilePortIntel());
          SendFileSeq sFileSeq=new SendFileSeq(oUserInfo,this);
         }
     }
     else if((cData.getCommand()==cData.c_CmdCancel)&&(cData.getMessageType()==cData.c_MsgTypeFile))
     {
         boolean found=false;
         System.out.println("Sender abort to send file.");
         for(int i=0;i<cUserInfo.dataQueue.size();i++)
         {
           if(((DataReceive)(cUserInfo.dataQueue.elementAt(i))).type==cUserInfo.c_MsgFile)
           {
             ((DataReceive)(cUserInfo.dataQueue.elementAt(i))).fileAbort=true;
             found=true;
           }
         }

         if(!found)
         {
              WarningFrame wFrame=new WarningFrame(cUserInfo.getNick()+" abort to send file.");
         }

     }
     //----------------spacial command for IsagQ---------------------
     else if(cData.getCommand()==cData.c_CmdSMessage)
     {
            if(cData.getMessageType()==cData.c_MsgTypeKeyE)
            {
               BigInteger keyE=new BigInteger(cData.getMessage());
               cUserInfo.setKey_E(keyE);
               System.out.println("receive key E");
            }
            else if(cData.getMessageType()==cData.c_MsgTypeKeyN)
            {
               BigInteger keyN=new BigInteger(cData.getMessage());
               cUserInfo.setKey_N(keyN);
               cUserInfo.sendKeyDES();
               System.out.println("receive key N");
            }
            else if(cData.getMessageType()==cData.c_MsgTypeKeyDES)
            {
               byte[] keyDES = getDESKey(oUserInfo.getKey_D() ,oUserInfo.getKey_N() ,cData.getMessage());
               cUserInfo.setKey_DES(keyDES);
               System.out.println("receive key DES");
               if((cUserInfo.getcontactStatus()!=cUserInfo.c_contactNotin)&&(cUserInfo.getcontactStatus()!=cUserInfo.c_contactAwait))
               {
                 f.addToTable(cUserInfo,cUserInfo.c_tableSecure);
               }
            }
            else if(cData.getMessageType()==cData.c_MsgTypeMsg)
            {
               System.out.println("Receive encrypt message "+cData.getMessage());
               DataReceive dRec=new DataReceive(cData.getMessageType());
               DES ddes=new DES();
               //--------------
               ddes.setKey(oUserInfo.getKey_DES());
 							 BigInteger msg_big = new BigInteger(cData.getMessage());
							 byte[] msg_byte    =	msg_big.toByteArray();
							 byte[] msg_dec     = ddes.decrypt(msg_byte);
							 byte[] msg_depad   = ddes.dePaddingMessage(msg_dec);
							 String real_msg = new String(msg_depad);
               //--------------
               dRec.setMessage(real_msg);
               cUserInfo.addData(dRec);
            }

     }
  	  System.out.println(".........................end operation from TCP.................................");
    }
	 }catch(Exception e)
   {
     System.out.println("connection error ...."+e);
     connectionOK=false;
     cUserInfo.CloseEstablish();
     this.stop(); //--------------------test
   }
	}

  public byte[] getDESKey(BigInteger d ,BigInteger n ,String msg)
	{
    RSA rsa=new RSA();
    BigInteger des_en_big = new BigInteger(msg);
		BigInteger des_dec = rsa.Decrypt(d ,n ,des_en_big);
		return des_dec.toByteArray();
	}

}