
import    javax.swing.JFrame;

public class RequestAllInfoSeq extends Thread
{
  OwnerUserInfo       oUserInfo;
  ContactUserInfo     cUserInfo;
  UserDetailFrame     uDetailFrame;
  ViewMyDetailFrame   vDetailFrame;
  ServerListener      sLis;
  int                 msgID=0;
  byte[]              data;
  ExtractServerData   eData;
  short               commandReply;
  short               seqReply;
  short               rSeq;
  boolean             requestResult=false;
  boolean             addTosLis=false;
  boolean             cUserFrame=false;

  public RequestAllInfoSeq(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo,UserDetailFrame uDetailFrame)
  {
      super(oUserInfo.allThread,"requestInfoSeq");
      this.oUserInfo =oUserInfo;
      this.cUserInfo=cUserInfo;
      cUserFrame=true;
      eData=new ExtractServerData(oUserInfo);
      this.uDetailFrame=uDetailFrame;
      this.sLis=oUserInfo.sLis;
      uDetailFrame.jLabel1.setIcon(uDetailFrame.iconAFace);
      this.start();
  }

  public RequestAllInfoSeq(OwnerUserInfo oUserInfo,ViewMyDetailFrame vDetailFrame)
  {
      super(oUserInfo.allThread,"requestInfoSeq");
      this.oUserInfo =oUserInfo;
      eData=new ExtractServerData(oUserInfo);
      this.vDetailFrame=vDetailFrame;
      this.sLis=oUserInfo.sLis;
      vDetailFrame.jLabel1.setIcon(vDetailFrame.iconAFace);
      this.start();
  }


  public void run()
  {
            sLis.Listener.addElement (this);
            addTosLis=true;
            if(cUserFrame)
            {
             oUserInfo.requestInfo(cUserInfo.getUIN());
            }
            else
            {
             oUserInfo.requestInfo(oUserInfo.getUIN());
            }
            rSeq=(short)(oUserInfo.readInfoSeqNumber()-1);
            do{
               if((sLis.getFlag())&&(sLis.getMsgID()!=msgID))
                {
                  msgID=sLis.getMsgID();
                  data=sLis.getData();
                  commandReply=eData.getCommand(data);
                  if(commandReply==280)
                  {
                    seqReply=eData.getExtSeq(data);
                    if(seqReply==rSeq)
                    {
                      if(cUserFrame)
                      {
                       cUserInfo.setUserBasicInfo (eData.INFO_REPLY(data));
                      }
                      else
                      {
                       oUserInfo.setUserBasicInfo(eData.INFO_REPLY(data));
                      }
                    }
                  }
                }
               this.yield ();
            }while((commandReply!=280)&&(commandReply!=300));

            if(cUserFrame)
            {
             oUserInfo.requestExtInfo(cUserInfo.getUIN());
            }
            else
            {
             oUserInfo.requestExtInfo(oUserInfo.getUIN());
            }
            rSeq=(short)(oUserInfo.readInfoSeqNumber()-1);
            do{
               if((sLis.getFlag())&&(sLis.getMsgID()!=msgID))
                {
                  msgID=sLis.getMsgID();
                  data=sLis.getData();
                  commandReply=eData.getCommand(data);
                  if(commandReply==290)
                  {
                    seqReply=eData.getExtSeq(data);
                    if(seqReply==rSeq)
                    {
                     if(cUserFrame)
                     {
                      cUserInfo.setUserExtInfo (eData.EXT_INFO_REPLY(data));
                     }
                     else
                     {
                      oUserInfo.setUserExtInfo(eData.EXT_INFO_REPLY(data));
                     }
                    }
                  }
                }
               this.yield ();
            }while((commandReply!=290)&&(commandReply!=310));
            sLis.Listener.removeElement (this);
            addTosLis=false;
           //-----------------
            if(cUserFrame)
            {
              String sex="N/A";
              if(cUserInfo.getSex()==1)sex="Female";
              else if(cUserInfo.getSex()==2) sex ="Male";
              uDetailFrame.tfGender.setText(sex);
              uDetailFrame.tfAge.setText(String.valueOf (cUserInfo.getAge()));
              uDetailFrame.tfIP.setText(cUserInfo.getIPStr());
            	uDetailFrame.tfICQ.setText(String.valueOf(cUserInfo.getUIN()));
              uDetailFrame.tfNick.setText(cUserInfo.getNick());
           		uDetailFrame.tfEmail.setText(cUserInfo.getEmail());
           		uDetailFrame.tfFirst.setText(cUserInfo.getFirst());
          		uDetailFrame.tfLast.setText(cUserInfo.getLast());
           		uDetailFrame.tpAbout.setText(cUserInfo.getAbout());
              uDetailFrame.tfPhone.setText(cUserInfo.getPhone());
              uDetailFrame.tfHomepage.setText(cUserInfo.getHomepage());
           		uDetailFrame.tfState.setText(cUserInfo.getState());
              uDetailFrame.tfCity.setText(cUserInfo.getCity());
              uDetailFrame.tfZipCode.setText(String.valueOf(cUserInfo.getCountryStatus()));
              uDetailFrame.tfCountry.setText(String.valueOf(cUserInfo.getCountryCode()));
           //-----------------
              cUserInfo.setInfoStatus(cUserInfo.c_infoReady);
              uDetailFrame.requestInfo=false;
              uDetailFrame.jLabel1.setIcon(uDetailFrame.icon);
            }
            else
            {
              vDetailFrame.tfGender.setSelectedIndex(0);
              if(oUserInfo.getSex()==1)vDetailFrame.tfGender.setSelectedIndex(1);
              else if(oUserInfo.getSex()==2)vDetailFrame.tfGender.setSelectedIndex(2);

              vDetailFrame.tfAge.setText(String.valueOf (oUserInfo.getAge()));
              vDetailFrame.tfIP.setText(oUserInfo.getIPStr());
            	vDetailFrame.tfICQ.setText(String.valueOf(oUserInfo.getUIN()));
              vDetailFrame.tfNick.setText(oUserInfo.getNick());
           		vDetailFrame.tfEmail.setText(oUserInfo.getEmail());
           		vDetailFrame.tfFirst.setText(oUserInfo.getFirst());
          		vDetailFrame.tfLast.setText(oUserInfo.getLast());
           		vDetailFrame.tpMessage.setText(oUserInfo.getAbout());
              vDetailFrame.tfPhone.setText(oUserInfo.getPhone());
              vDetailFrame.tfHomepage.setText(oUserInfo.getHomepage());
           		vDetailFrame.tfState.setText(oUserInfo.getState());
              vDetailFrame.tfCity.setText(oUserInfo.getCity());
              vDetailFrame.tfZipCode.setText(String.valueOf(oUserInfo.getCountryStatus()));
              vDetailFrame.tfCountry.setText(String.valueOf(oUserInfo.getCountryCode()));
           //-----------------
              vDetailFrame.requestInfo=false;
              vDetailFrame.jLabel1.setIcon(vDetailFrame.icon);
            }
    }

    public void cancelRequest()
    {
        if(addTosLis)
        {
          sLis.Listener.removeElement (this);
          System.out.println ("remove request info");
        }
        System.out.println ("stop request info");
        this.stop();
    }
}
