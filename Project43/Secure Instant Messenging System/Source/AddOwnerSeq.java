import java.util.*;

public class AddOwnerSeq extends Thread
{
  OwnerUserInfo       oUserInfo;
  ServerListener      sLis;
  MainFrame           f;
  AddICQFrame         af;
  short               loginResult;
  int                 msgID=0;
  byte[]              data;
  ExtractServerData   eData;
  short               commandReply;
  boolean             addSucc=false;

  public AddOwnerSeq(OwnerUserInfo oUserInfo,AddICQFrame  af)
  {
      super(oUserInfo.allThread,"addOwner");
      this.oUserInfo =oUserInfo;
      eData=new ExtractServerData(oUserInfo);
      this.f=this.oUserInfo.f;
      this.af=af;
      this.start();
  }

  public void run()
  {
        try
        {
          oUserInfo.login();
          sLis=oUserInfo.sLis;
          while(!oUserInfo.lSeq.getEndLogin())
          {
            this.yield ();
          }
            sLis.Listener.addElement (this);
            oUserInfo.requestInfo(oUserInfo.getUIN());
            do{
               if((sLis.getFlag())&&(sLis.getMsgID()!=msgID))
                {
                  msgID=sLis.getMsgID();
                  data=sLis.getData();
                  commandReply=eData.getCommand(data);
                  if(commandReply==280)
                  {
                      oUserInfo.setUserBasicInfo (eData.INFO_REPLY(data));
                  }
                }
               this.yield ();
            }while((commandReply!=280)&&(commandReply!=300));

            oUserInfo.requestExtInfo(oUserInfo.getUIN());

            do{
               if((sLis.getFlag())&&(sLis.getMsgID()!=msgID))
                {
                  msgID=sLis.getMsgID();
                  data=sLis.getData();
                  commandReply=eData.getCommand(data);
                  if(commandReply==290)
                  {
                      oUserInfo.setUserExtInfo (eData.EXT_INFO_REPLY(data));
                  }
                }
               this.yield ();
            }while((commandReply!=290)&&(commandReply!=310));

             addSucc=true;
             sLis.Listener.removeElement (this);

             f.addICQToComp(oUserInfo);
             WriteOwnerDataFile wOwnerDataFile =new WriteOwnerDataFile("sicq.ifo",f.ownerUsers);
             f.initTable();
             f.setEnabled(true);
             f.setVisible (true);
             af.dispose();
       }catch(ThreadDeath e)
       {
             af.newUser=false;
             af.okBt.setEnabled (true);
             f.setEnabled(false);
             f.setVisible (false);
             throw(e);
       }
    }

  public boolean getAddresult(){return addSucc;}
}
