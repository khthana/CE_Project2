import		java.math.BigInteger;
import		java.net.*;
import		java.io.*;
import		java.awt.TextArea;
import    java.util.*;
import    javax.swing.JFrame;
public class OwnerUserInfo extends UserAllInfo
{
  String					  icqServerName	  =	"icq.mirabilis.com";
  InetAddress       icqServerAddr    ;
	int				  		  icqServerPort		=	4000;

  short             seqNumber=0;
  short             loginSeqNumber=0;
  short             searchSeqNumber=0;
  short             infoSeqNumber=0;
  short             uInfoSeqNumber=0;
  int               TCPSeqNumber=0xfffffffc;

  Vector            contactUser=new Vector();
  ServerSocket      messageSocket;
  ServerSocket      fileSocket;
  DatagramSocket    serverLisSocket;
  short             serverLisPort;
  static Util       util=new Util();
  ServerListener    sLis;
  ClientListener    cLis;
  KeepAlive         kAlive;
  ClientToServerCMD cmd;
  MainFrame         f;
  LoginSeq          lSeq;
  ThreadGroup       allThread=new ThreadGroup("allThread");
  Vector            allFrame=new Vector();
  boolean           socketOpen=false;

  OwnerUserInfo(MainFrame f)
  {
      this.f=f;
  }

  public void initData()
  {
        allThread.stop();
        allThread=new ThreadGroup("allThread");
        seqNumber=1;
        loginSeqNumber=1;
        searchSeqNumber=1;
        infoSeqNumber=5;
        uInfoSeqNumber=5;
        TCPSeqNumber=0xfffffffc;
        this.readContactList();
        this.createFileSocket();
        this.createMessageSocket();
        this.createServerLisSocket();
  			this.setUserStatus (this.c_Online);
        genKey();
        try{
        this.setIP(InetAddress.getLocalHost().getAddress());
        }catch(Exception e){System.out.println(e);}
        socketOpen=true;
        cmd   =new ClientToServerCMD(this);
  }

  private void genKey()
	{	RSA rsa = new RSA();
		rsa.genKey();
		this.setKey_E(rsa.getE());
		this.setKey_D(rsa.getD());
		this.setKey_N(rsa.getN());
		DES des =new DES();
		this.setKey_DES(des.genKey(16));
	}

  public void login()
  {
       sLis  =new ServerListener(this);
       cLis  =new ClientListener(this);
       kAlive=new KeepAlive(this);
       lSeq  =new LoginSeq(this);
  }

  public void searchUser(UserBasicInfo user)
  {
     if(this.getOnline())
     {
      try{
      SendToServer sUser=new SendToServer(this,cmd.SEARCH_USER (user));
      }catch(Exception e){System.out.println(e);}
     }
  }

  public void searchUIN(int rUIN)
  {
     if(this.getOnline())
     {
      try{
      SendToServer sUIN=new SendToServer(this,cmd.SEARCH_UIN (rUIN));
      }catch(Exception e){System.out.println(e);}
     }
  }

  public void updateAllInfo()
  {
     if(this.getOnline())
     {
      try{
      SendToServer uAuthInfo=new SendToServer(this,cmd.AUTH_UPDATE());
      SendToServer uBasicInfo=new SendToServer(this,cmd.UPDATE_INFO());
      SendToServer uExtInfo =new SendToServer(this,cmd.UPDATE_EXT_INFO());
      }catch(Exception e){System.out.println(e);}
     }
  }

  public void requestInfo(int rUIN)
  {
     if(this.getOnline())
     {
      try{
      SendToServer rInfo=new SendToServer(this,cmd.INFO_REQ (rUIN));
      }catch(Exception e){System.out.println(e);}
     }
  }

  public void requestExtInfo(int rUIN)
  {
    if(this.getOnline())
     {
      try{
      SendToServer rInfo=new SendToServer(this,cmd.EXT_INFO_REQ (rUIN));
      }catch(Exception e){System.out.println(e);}
     }
  }

  public void sendFileReq(ContactUserInfo cUser,String message,Vector fileVector)
  {
   if(this.getOnline())
   {
      if(cUser.getOnline())
      {
        try{
            cUser.sendFileReq(message,fileVector);
        }catch(Exception e){System.out.println(e);}

      }
   }


  }

  public void sendMessage(ContactUserInfo cUser,String message)
  {
    if(this.getOnline())
    {
      if(cUser.getOnline())
      {
        //send direct
        try{
           cUser.sendMessage(message);
        }catch(Exception e)
        {
           System.out.println("can't send direct"+e);
           cUser.CloseEstablish();
           try{
           SendToServer sMessage=new SendToServer(this,cmd.SEND_MESSAGE((int)cUser.getUIN(),this.c_MsgText,message));
           }catch(Exception ex)
           {
             System.out.println("can't close socket"+ex);
           }

        }
      }
      else
      {
        try{
          SendToServer sMessage=new SendToServer(this,cmd.SEND_MESSAGE((int)cUser.getUIN(),this.c_MsgText,message));
        }catch(Exception e){System.out.println(e);}
      }
    }
  }

  public void changeStatus(int status)
  {
     if(this.getOnline())
     {
      System.out.println("change status");
      try{
      SendToServer cStatus=new SendToServer(this,cmd.STATUS_CHANGE(status));
      }catch(Exception e){System.out.println(e);}
     }
  }

  public void addContactUser(int addUIN)
  {
     if(this.getOnline())
     {
      try{
      SendToServer aContactUser=new SendToServer(this,cmd.ADD_TO_LIST(addUIN));
      SendToServer sUserAdded  =new SendToServer(this,cmd.USER_ADDED(addUIN,this.c_MsgUserAdd));
      }catch(Exception e){System.out.println(e);}
     }
  }

  public void authAccept(ContactUserInfo cUser)
  {
     if(this.getOnline())
     {
      try{
      SendToServer sMessage=new SendToServer(this,cmd.SEND_MESSAGE((int)cUser.getUIN(),this.c_MsgAuthGrant,""));
      }catch(Exception e){System.out.println(e);}
     }
  }

  public void authIgnore(ContactUserInfo cUser)
  {
     if(this.getOnline())
     {
      try{
      SendToServer sMessage=new SendToServer(this,cmd.SEND_MESSAGE((int)cUser.getUIN(),this.c_MsgAuthIgnore,"No reason given"));
      }catch(Exception e){System.out.println(e);}
     }
  }

  public void authRequest(ContactUserInfo cUser,String message)
  {
     if(this.getOnline())
     {
      try{
        SendToServer sMessage=new SendToServer(this,cmd.AUTH_REQUEST((int)cUser.getUIN(),this.c_MsgAuthReq,message));
      }catch(Exception e){System.out.println(e);}
     }
  }

  public synchronized void disconnect()
  {
     int bSize=0;

     WriteContactDataFile wContactDataFile =new WriteContactDataFile(this.getUIN()+".ifo",contactUser);
     do
     {
       bSize=contactUser.size();
       for(int i=0;i<contactUser.size();i++)
       {
         ContactUserInfo cUser=new ContactUserInfo(this);
         cUser=(ContactUserInfo)contactUser.elementAt(i);
         cUser.CloseEstablish();
         if((cUser.getTableStore()==cUser.c_tableOnline)||(cUser.getTableStore()==cUser.c_tableSecure))
         {
            f.addToTable(cUser,cUser.c_tableOffline);
         }
       }
     }while(bSize!=contactUser.size());

     while(allFrame.size()>0)
     {
         JFrame frameTemp=(JFrame)allFrame.elementAt(0);
         allFrame.removeElementAt(0);
         frameTemp.dispose();
     }

      f.setEnabled(true);
      f.statusBt.setIcon(f.iconSOffline);
      f.statusBt.setText("Offline");
      this.setOffline();

    if(socketOpen)
     {
       System.out.println ("...........................Close All Socket.");
       socketOpen=false;
       try{
           sendPacket (cmd.DISCONNECT());
           sendPacket (cmd.DISCONNECT());
           sendPacket (cmd.DISCONNECT());

           messageSocket.close();
           fileSocket.close();
           serverLisSocket.close();
       }catch(Exception e){System.out.println("disconnect "+e);}
     }

    ThreadGroup tempThread=new ThreadGroup("tempThread");
    tempThread=allThread;
    allThread=new ThreadGroup("allThread");
    tempThread.stop();
    System.out.println("end disconnect ");
  }


  public synchronized short getSeqNumber()
  {
        short  seqTemp;
        seqTemp=seqNumber;
        if(seqNumber<Short.MAX_VALUE)seqNumber++;else seqNumber=1;
        return seqTemp;
  }

  public synchronized short getSearchSeqNumber()
  {
        short  seqTemp;
        seqTemp=searchSeqNumber;
        if(searchSeqNumber<Short.MAX_VALUE)searchSeqNumber++;else searchSeqNumber=1;
        return seqTemp;
  }

  public synchronized short getLoginSeqNumber()
  {
        short  seqTemp;
        seqTemp=loginSeqNumber;
        if(loginSeqNumber<Short.MAX_VALUE )loginSeqNumber++;else loginSeqNumber=1;
        return seqTemp;
  }

  public synchronized short getInfoSeqNumber()
  {
        short  seqTemp;
        seqTemp=infoSeqNumber;
        if(infoSeqNumber<Short.MAX_VALUE )infoSeqNumber++;else infoSeqNumber=5;
        return seqTemp;
  }
  public synchronized short getUpdateInfoSeqNumber()
  {
        short  seqTemp;
        seqTemp=uInfoSeqNumber;
        if(uInfoSeqNumber<Short.MAX_VALUE )uInfoSeqNumber++;else uInfoSeqNumber=5;
        return seqTemp;
  }

  public synchronized int getTCPSeqNumber()
  {
        int  seqTemp;
        seqTemp=TCPSeqNumber;
        if(TCPSeqNumber>Integer.MIN_VALUE)TCPSeqNumber--;else TCPSeqNumber=0xfcffffff;
        return seqTemp;
  }

  public synchronized short readSeqNumber()
  {
    return seqNumber;
  }

  public synchronized short readSearchSeqNumber()
  {
    return searchSeqNumber;
  }

  public synchronized short readLoginSeqNumber()
  {
    return loginSeqNumber;
  }

  public synchronized short readInfoSeqNumber()
  {
    return infoSeqNumber;
  }

  public synchronized short readUpdateInfoSeqNumber()
  {
    return uInfoSeqNumber;
  }


  public void readContactList()
	{
    try{
		ReadContactDataFile contactFile = new ReadContactDataFile(this);
    contactUser=contactFile.ReadFile(this.getUIN()+".ifo");
    }catch(Exception e){System.out.println (e);}
	}

  private void createMessageSocket()
  {
    short port=0;
    boolean ok=false;

    do{
     try{
       port=(short)util.portGen();
       messageSocket=new ServerSocket(port);
       System.out.println ("Create message socket OK. (port "+port+")");
       this.setMessagePort(port);
       ok=true;
     }catch(Exception e){System.out.println (e); }
    }while(!ok);
  }

  private void createFileSocket()
  {
    short port=0;
    boolean ok=false;

    do{
     try{
       port=(short)util.portGen();
       fileSocket=new ServerSocket(port);
       System.out.println ("Create file socket OK. (port "+port+")");
       this.setFilePort(port);
       ok=true;
     }catch(Exception e){System.out.println (e); }
    }while(!ok);
  }

  private void createServerLisSocket()
  {
    short port=0;
    boolean ok=false;

    do{
     try{
       port=(short)util.portGen();
       serverLisSocket=new DatagramSocket(port);
       System.out.println ("Create server socket OK. (port "+port+")");
       serverLisPort=port;
       ok=true;
     }catch(Exception e){System.out.println (e); }
    }while(!ok);
  }

  public ServerSocket getMessageSocket(){return messageSocket;}
  public ServerSocket getFileSocket(){return fileSocket;}
  public DatagramSocket getServerLisSocket(){return serverLisSocket;}
  public int getServerLisPort(){return serverLisPort;}
  public Vector getContactList(){return contactUser;}


	public synchronized void sendPacket(byte[] data)throws IOException
	{
    try{
    icqServerAddr=InetAddress.getByName (icqServerName);
    }catch(Exception e){System.out.println (e);}
    DatagramPacket theOutput=new DatagramPacket(data,data.length,icqServerAddr,icqServerPort);
		serverLisSocket.send(theOutput);
	}

}


