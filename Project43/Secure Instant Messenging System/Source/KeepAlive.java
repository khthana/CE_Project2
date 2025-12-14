

public class KeepAlive extends Thread
{
  OwnerUserInfo     oUserInfo;
  ClientToServerCMD cmd;


  public KeepAlive(OwnerUserInfo oUserInfo)
  {
     super(oUserInfo.allThread, "keepAlive");
     this.oUserInfo =oUserInfo;
     this.cmd=new ClientToServerCMD(this.oUserInfo);
     this.start ();
  }

  public void run()
  {
     while(true)
     {
        System.out.println ("......send KeepAlive......");
        try{
        this.sleep (200000);
        SendToServer kAlive=new SendToServer(oUserInfo,cmd.KEEP_ALIVE());
        SendToServer kAlive2=new SendToServer(oUserInfo,cmd.KEEP_ALIVE2());
        }catch(Exception e){System.out.println (e);}
     }
  }
}
