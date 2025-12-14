import java.net.*;
import java.io.*;

public class ClientListener extends Thread
{
  OwnerUserInfo oUserInfo;
  ServerSocket  sSoc;
  public ClientListener(OwnerUserInfo oUserInfo)
  {
       super(oUserInfo.allThread,"clientListener");
       this.oUserInfo =oUserInfo;
       this.sSoc = this.oUserInfo.getMessageSocket();
       this.start();
  }

  public void run()
  {
     	 ClientHandle cHandle;
	 try{
    		while(true)
		    {
			     System.out.println(".............Wait for connection from TCP....");
			     Socket  connection = sSoc.accept();
			     System.out.println("..............Accept connection from TCP......");
           //--------------
           ContactUserInfo cUserInfo=new ContactUserInfo(oUserInfo);
           cUserInfo.setUIN(0);
           //--------------
			     cHandle=new ClientHandle(oUserInfo,cUserInfo,connection);
           this.yield ();
		    }
 	   }
	   catch(Exception e){System.out.println(e);}
  }
}
