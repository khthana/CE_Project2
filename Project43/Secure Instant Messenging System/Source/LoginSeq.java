

public class LoginSeq extends Thread
{
  OwnerUserInfo       oUserInfo;
  ClientToServerCMD   cmd;
  SendToServer        sLogin;
  ServerListener      sLis;
  Util u =new Util();
  int                 msgID=0;
  ExtractServerData   eData;

  boolean endLogin=false;
  byte[] data;
  byte[] tmp=new byte[2];
  short  commandReply=0;
  short  seqReceive=0;
  MainFrame f;

  public LoginSeq(OwnerUserInfo oUserInfo)
  {
    super(oUserInfo.allThread,"loginSeq");
    this.oUserInfo=oUserInfo;
    this.f=this.oUserInfo.f;
    eData=new ExtractServerData(oUserInfo);
    cmd=new  ClientToServerCMD(oUserInfo);
    this.sLis =oUserInfo.sLis;
    this.sLis.Listener.addElement (this);
    this.start();
  }

  public void run()
  {
      try{
      SendToServer  sLogin0 = new SendToServer(oUserInfo,cmd.LOGIN());

      f.statusBt.setIcon(f.iconSConnecting);
      f.statusBt.setText("Connecting");

      do{
         if((sLis.getFlag())&&(sLis.getMsgID()!=msgID))
         {
            msgID=sLis.getMsgID();
            data=sLis.getData();
            commandReply=eData.getCommand(data);
            if(commandReply==90)
            {
              SendToServer  sLogin1 =new SendToServer(oUserInfo,cmd.LOGIN_1());
              SendToServer  sLogin2 =new SendToServer(oUserInfo,cmd.CONTACT_LIST(oUserInfo.getContactList()));
            }
         }
           this.yield ();
       }while(commandReply!=90);

         f.statusBt.setIcon(f.iconSOnline);
         f.statusBt.setText("Online");
         oUserInfo.setOnline();
         endLogin=true;
      }catch(Exception e){System.out.println (e);}
        sLis.Listener.removeElement (this);
  }

   public boolean getEndLogin(){return endLogin;}

}