import java.util.*;
public class ServerHandle extends Thread
{
  OwnerUserInfo oUserInfo;
  MainFrame     f;
  ClientToServerCMD cmd;
  byte[]        inputData;
  Vector        searchUserFound=new Vector();
  short         commandReply;
  short         seqReceive;
  byte[]        tmp=new byte[2];
  Util          u=new Util();
  ExtractServerData eData;
  ServerHandle(OwnerUserInfo oUserInfo,byte[] inputData)
  {
        super(oUserInfo.allThread,"serverHandle");
        this.oUserInfo =oUserInfo;
        this.f=oUserInfo.f;
        eData=new ExtractServerData(oUserInfo);
        this.inputData =inputData;
        cmd=new ClientToServerCMD(this.oUserInfo);
        this.start();
  }

  public void run()
  {
              System.out.print("(Server Handle) Version."+eData.getVersion(inputData)+" ");
              commandReply=eData.getCommand(inputData);
              System.out.print("Command."+commandReply+" ");
              seqReceive=eData.getSeq(inputData);
              System.out.println("SeqNumber."+seqReceive+" ");

         switch (commandReply)
         {

            case 110:{

                 UserOnlineInfo uOnlineInfo;
                 uOnlineInfo=eData.USER_ONLINE(inputData);

                 Vector vUser=oUserInfo.getContactList();
                 ContactUserInfo cU=new ContactUserInfo(oUserInfo);
                 VectorManager vManager=new VectorManager();
                 cU.setUIN(0);
                 cU=vManager.findContactUser(vUser,cU,uOnlineInfo.getUIN());

                 if(cU.getUIN()!=0)
                 {
                     try{
                       cU.setUserOnlineInfo(uOnlineInfo);
                     }catch(Exception e){System.out.println(e);}

                     if((cU.getcontactStatus()!=cU.c_contactNotin)&&(cU.getcontactStatus()!=cU.c_contactAwait))
                     {
                       cU.setUserStatus(checkStatus(cU,cU.getUserStatus()));
                       f.addToTable(cU,cU.c_tableOnline);
                     }
                     else
                     {
                       cU.setUserStatus(cU.c_Online);
                     }
                     System.out.println("User Online "+cU.getUIN()+" "+cU.getUserStatus());

                     try{
                       cU.sendKeyE();
                       cU.sendKeyN();
                     }catch(Exception e){System.out.println(e);}
                  }

            break;}

            case 120:{
                 int oUIN=0;
                 oUIN=eData.USER_OFFLINE(inputData);

                 Vector vUser=oUserInfo.getContactList();
                 ContactUserInfo cU=new ContactUserInfo(oUserInfo);
                 VectorManager vManager=new VectorManager();
                 cU.setUIN(0);
                 cU=vManager.findContactUser(vUser,cU,oUIN);

                 if(cU.getUIN()!=0)
                 {
                     cU.CloseEstablish();
                     if((cU.getcontactStatus()!=cU.c_contactNotin)&&(cU.getcontactStatus()!=cU.c_contactAwait))
                     {
                       cU.setUserStatus(cU.c_Offline);
                       f.addToTable(cU,cU.c_tableOffline);
                     }
                  }

            break;}

            case 220:{

                boolean found=false;
                int   senderUIN=0;
                short msg_type=0;
                String rcv_msg="";
                try{
                SendToServer mAck = new SendToServer(oUserInfo,cmd.ACK_MESSAGES());
                }catch(Exception e){System.out.println (e);}

                eData.RECV_MESSAGE(inputData);
                senderUIN=eData.getSender();
                rcv_msg=eData.getMessage();
                msg_type=eData.getMsgType();
                System.out.println ("Incoming message.......("+eData.getMsgType()+")..("+rcv_msg+").........................");

                 Vector vUser=oUserInfo.getContactList();
                 ContactUserInfo cU=new ContactUserInfo(oUserInfo);
                 VectorManager vManager=new VectorManager();
                 cU.setUIN(0);
                 cU=vManager.findContactUser(vUser,cU,senderUIN);

                 if(cU.getUIN()!=0)
                 {
                      found=true;
                      DataReceive dRec=new DataReceive(msg_type);
                      checkMessageType(cU,dRec);
                      cU.addData(dRec);
                 }

                 else//if(!found)
                 {
                      ContactUserInfo newUser=new ContactUserInfo(oUserInfo);
                      newUser.setUIN(senderUIN);
                      newUser.setNick(String.valueOf(senderUIN));
                      newUser.setContactStatus(newUser.c_contactNotin);
                      f.addToTable(newUser,newUser.c_tableNotin);
                      DataReceive dRec=new DataReceive(msg_type);
                      checkMessageType(newUser,dRec);
                      newUser.addData(dRec);
                 }

            break;}

            case 140:{
                int uinFound=0;
                uinFound=u.bytes2IntSW(u.copyBytes(inputData,8,4));
                searchUserFound.addElement(new Integer(uinFound));
                System.out.println ("...........Userfound("+uinFound+")............");

            break;}

            case 160:{
                System.out.println ("...........End of search............");
            break;}

            case 260:{
                boolean found=false;
                int     senderUIN=0;
                short   msg_type=0;
                String  rcv_msg="";

                eData.SYS_DELIVERED_MESS(inputData);
                senderUIN=eData.getSender();
                rcv_msg=eData.getMessage();
                msg_type=eData.getMsgType();
                System.out.println ("Incoming message.......("+eData.getMsgType()+")..("+rcv_msg+").........................");

                 Vector vUser=oUserInfo.getContactList();
                 ContactUserInfo cU=new ContactUserInfo(oUserInfo);
                 VectorManager vManager=new VectorManager();
                 cU.setUIN(0);
                 cU=vManager.findContactUser(vUser,cU,senderUIN);

                 if(cU.getUIN()!=0)
                 {
                      found=true;
                      DataReceive dRec=new DataReceive(msg_type);
                      checkMessageType(cU,dRec);
                      cU.addData(dRec);
                 }

                 else//if(!found)
                 {
                      ContactUserInfo newUser=new ContactUserInfo(oUserInfo);
                      newUser.setUIN(senderUIN);
                      newUser.setNick(String.valueOf(senderUIN));
                      newUser.setContactStatus(newUser.c_contactNotin);
                      f.addToTable(newUser,newUser.c_tableNotin);
                      DataReceive dRec=new DataReceive(msg_type);
                      checkMessageType(newUser,dRec);
                      newUser.addData(dRec);
                  }

            break;}

            case 280:{
                int index=6;
	              short nick_len,  first_len,  last_len,  email_len,    search_seq;
               		search_seq=u.bytes2ShortSW(u.copyBytes(inputData,index,2));
              		index=index+2;
              		System.out.println(u.bytes2IntSW(u.copyBytes(inputData,index,4)));
              		index=index+4;
              		nick_len	=u.bytes2ShortSW(u.copyBytes(inputData,index,2));
              		index		=index+2;
              		System.out.println (new String(inputData,index,(int)(nick_len-1)));
              		index		=index+nick_len;
              		first_len	=u.bytes2ShortSW(u.copyBytes(inputData,index,2));
              		index		=index+2;
              		System.out.println(new String(inputData,index,(int)(first_len-1)));
              		index		=index+first_len;
              		last_len	=u.bytes2ShortSW(u.copyBytes(inputData,index,2));
              		index		=index+2;
              		System.out.println(new String(inputData,index,(int)(last_len-1)));
              		index		=index+last_len;
              		email_len	=u.bytes2ShortSW(u.copyBytes(inputData,index,2));
              		index		=index+2;
              		System.out.println(new String(inputData,index,(int)(email_len-1)));
              		index		=index+email_len;
              		System.out.println(inputData[index]);
            break;}

            case 290:{
                System.out.println("...........(Extinfo reply)........... ");
            break;}

            case 300:{
                System.out.println("...........(not available info)........... ");
            break;}

            case 310:{
                System.out.println("...........(not available extinfo)........... ");
            break;}

            case 40:{

                   WarningFrame wFrame=new WarningFrame("Connection Problem.");
                   oUserInfo.disconnect();
            break;}

            case 100:{
                   WarningFrame wFrame=new WarningFrame("Incorrect Password.");
                   oUserInfo.disconnect();
            break;}

            case 240:{

                   WarningFrame wFrame=new WarningFrame("Connection Problem.");
                   oUserInfo.disconnect();
            break;}

            case 250:{

                   WarningFrame wFrame=new WarningFrame("Connection Problem.");
                   oUserInfo.disconnect();
            break;}

            case 420:{
                   int updateUIN=0;
                   int status=0;

                   eData.STATUS_UPDATE(inputData);
                   updateUIN=eData.getUpdateUIN();
                   status=eData.getUpdateStatus();

                   Vector vUser=oUserInfo.getContactList();
                   for(int i=0;i<vUser.size();i++)
                   {
                      ContactUserInfo cUser=(ContactUserInfo)vUser.elementAt(i);
                      if(cUser.getUIN()==updateUIN)
                      {
                         System.out.println("User update status "+cUser.getUIN()+" "+status);
                         if((cUser.getcontactStatus()!=cUser.c_contactNotin)&&(cUser.getcontactStatus()!=cUser.c_contactAwait)&&(cUser.getOnline()))//---------test
                         {
                           cUser.setUserStatus(checkStatus(cUser,status));
                         }
                      }
                   }
            break;}


         }
    }

    private int checkStatus(ContactUserInfo cU,int status)
    {
      status=status&0x000000ff;
      switch (status)
      {
      case 0:status=cU.c_Online; break;
      case 1:status=cU.c_Away; break;
      case 5:case 4:status=cU.c_Na; break;
      case 17:case 16:status=cU.c_Occupied; break;
      case 19:status=cU.c_Dnd; break;
      }
      return status;
    }

    private synchronized void checkMessageType(ContactUserInfo cUser,DataReceive dRec)
    {
        short msgType=eData.getMsgType();
        String message=eData.getMessage();

        if((msgType==cUser.c_MsgText)||(msgType==cUser.c_MsgAuthIgnore))
        {
              dRec.setMessage(message);
        }
        else if ((msgType==cUser.c_MsgUserAdd)||(msgType==cUser.c_MsgAuthReq))
        {
              extractMessage(cUser,dRec);
        }
    }

    private synchronized void extractMessage(ContactUserInfo cUser,DataReceive dRec)
    {
      short  msgType=eData.getMsgType();
      String message=eData.getMessage();

      int    bIndex=0,eIndex=0;
      String nName="",fName="",lName="",email="",reason="",auth="";


      eIndex=message.indexOf(0xfffd);
      nName=message.substring(bIndex,eIndex);
      cUser.setNick(nName);

      bIndex=eIndex+1;
      eIndex=message.indexOf(0xfffd,bIndex);
      fName=message.substring(bIndex,eIndex);
      cUser.setFirst(fName);

      bIndex=eIndex+1;
      eIndex=message.indexOf(0xfffd,bIndex);
      lName=message.substring(bIndex,eIndex);
      cUser.setLast(lName);

      bIndex=eIndex+1;
      eIndex=message.indexOf(0xfffd,bIndex);
      email=message.substring(bIndex,eIndex);
      cUser.setEmail(email);


      bIndex=eIndex+1;
      eIndex=message.indexOf(0xfffd,bIndex);

      if(eIndex!=-1)
      {
       auth=message.substring(bIndex,eIndex);
       cUser.setAuth(Byte.parseByte(auth));
       bIndex=eIndex+1;
      }
       reason=message.substring(bIndex);

      if(msgType==cUser.c_MsgAuthReq)
      {
         dRec.setMessage(reason);
      }
    }
}
