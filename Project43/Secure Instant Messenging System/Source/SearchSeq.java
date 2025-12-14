

public class SearchSeq extends Thread
{
  OwnerUserInfo       oUserInfo;
  SearchFrame         sFrame;
  ServerListener      sLis;
  byte[]              data;
  int                 msgID=0;
  short               commandReply;
  short               searchSeqReply;
  ExtractServerData   eData;
  boolean             addTosLis=false;

  public SearchSeq(OwnerUserInfo oUserInfo,SearchFrame sFrame)
  {
    super(oUserInfo.allThread,"searchSeq");
    this.oUserInfo=oUserInfo;
    eData=new ExtractServerData(oUserInfo);
    this.sLis=oUserInfo.sLis;
    this.sFrame=sFrame;
    this.start();
  }

  public void run()
  {
     short   searchSeq=0;
     boolean endOfSearch=false;
     boolean uinCorrect=false;
     try{
      sLis.Listener.addElement (this);
      addTosLis=true;

      try{
        Integer.parseInt (sFrame.tfUIN.getText());
        uinCorrect=true;
      }catch(Exception ex)
      {
        uinCorrect=false;
      }

      if((sFrame.tabSearch.getSelectedIndex()==0)&&(uinCorrect)/*!(sFrame.tfUIN.getText().equals(""))*/)
      {
       oUserInfo.searchUIN (Integer.parseInt (sFrame.tfUIN.getText()));
       searchSeq=(short)(oUserInfo.readSearchSeqNumber()-1);
      }
      else if(sFrame.tabSearch.getSelectedIndex()==1)
      {
       UserBasicInfo uBasicInfo=new UserBasicInfo();

       uBasicInfo.setNick(sFrame.tfNick.getText());
       uBasicInfo.setFirst (sFrame.tfFirst.getText());
       uBasicInfo.setLast(sFrame.tfLast.getText());
       oUserInfo.searchUser(uBasicInfo);
       searchSeq=(short)(oUserInfo.readSearchSeqNumber()-1);
      }
      else if(sFrame.tabSearch.getSelectedIndex()==2)
      {
       UserBasicInfo uBasicInfo=new UserBasicInfo();
       uBasicInfo.setEmail(sFrame.tfEmail.getText());
       oUserInfo.searchUser(uBasicInfo);
       searchSeq=(short)(oUserInfo.readSearchSeqNumber()-1);
      }
      else
      {
       UserBasicInfo uBasicInfo=new UserBasicInfo();
       uBasicInfo.setEmail("");
       oUserInfo.searchUser(uBasicInfo);
       searchSeq=(short)(oUserInfo.readSearchSeqNumber()-1);
      }

      do{
         if((sLis.getFlag())&&(sLis.getMsgID()!=msgID))
          {
            msgID=sLis.getMsgID();
            data=sLis.getData();
            commandReply=eData.getCommand(data);
            if(commandReply==140)
            {
              searchSeqReply=eData.getExtSeq(data);
              if(searchSeqReply==searchSeq)
              {
                System.out.println ("add found User to vector");
                sFrame.vResult.addElement(eData.USER_FOUND(data));
              }
            }
            else if(commandReply==160)
            {
              searchSeqReply=eData.getExtSeq(data);
              if(searchSeqReply==searchSeq)
              {
                endOfSearch=true;
              }
            }

          }
       this.yield();
      }while(!endOfSearch);
      System.out.println ("end search seq");
      sLis.Listener.removeElement (this);
      addTosLis=false;
      sFrame.showSearchResult();
      sFrame.btStop .setEnabled(false);
      sFrame.btSearch.setEnabled (true);
      sFrame.searchStart=false;
      sFrame.imageLabel.setIcon(sFrame.image);
      }catch(ThreadDeath e)
      {
         sFrame.btStop .setEnabled(false);
         sFrame.btSearch.setEnabled (true);
         sFrame.searchStart=false;
         sFrame.imageLabel.setIcon(sFrame.image);
         throw(e);
      }
  }

  public void cancelSearch()
  {
     if(addTosLis)
     {
        sLis.Listener.removeElement (this);
        System.out.println("remove search seq");
     }
     System.out.println("stop search seq");
     this.stop();
  }
}