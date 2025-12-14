import java.net.*;
import java.io.*;
import java.util.*;

public class ServerListener extends Thread
{
 	boolean           haveData=false;
  byte[]            inputData;
  OwnerUserInfo     oUserInfo;


  static Vector     Listener;
  static Vector     dataBox;
  ServerAck         sAck;
  int               getCount=0;
  int               msgID=1;
  DataFromServer    dFromServer;

  ServerListener(OwnerUserInfo oUserInfo)
  {
    super(oUserInfo.allThread,"serverListener");
    this.oUserInfo    = oUserInfo;
    Listener=new Vector();
    dataBox =new Vector();
    sAck=new ServerAck(this.oUserInfo);
    this.start();
  }

	public void run()
	{

        ServerHandle sHandle;
 		    while(true)
        {
           if(dataBox.size()>0)
            {
              dFromServer=(DataFromServer)dataBox.elementAt(0);
              dataBox.removeElementAt (0);
              inputData=dFromServer.getData ();
              msgID=dFromServer.getID ();
              sHandle=new ServerHandle(oUserInfo,inputData);

              getCount=0;
              haveData=true;
              System.out.println("Wait for ("+Listener.size()+") reader..........");
              while(getCount<Listener.size()){this.yield ();}
              System.out.println("Reader read all.................");
              haveData=false;
              getCount=0;
            }
            this.yield ();
  			}
	}

  public boolean getFlag(){return haveData;}
  public int     getMsgID(){return msgID;}

  public synchronized byte[]  getData()
  {
      getCount++;
      return inputData;
  }
}
