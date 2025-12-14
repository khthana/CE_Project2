import		java.math.BigInteger;
import		java.net.*;
import		java.io.*;
import		java.awt.TextArea;
import    java.util.*;
import    javax.swing.table.*;
import    javax.swing.*;
public class ContactUserInfo extends UserAllInfo
{
      boolean          cEstablish=false;
      Socket           connection;
      DataInputStream  inS;
      DataOutputStream outS;
      Vector           fileVector;
      ClientHandle     cHandle;
      ProgressFrame    pgFrame;
      ProgressFrame    rpgFrame;
      boolean          waitSendFile=false;
      String           saveFilePath;

      public ImageIcon iconIdle;

      final static int c_contactNormal=0;
      final static int c_contactAwait=1;
      final static int c_contactNotin=2;

      final static int c_infoReady=0;
      final static int c_infoNotReady=1;

      final static int c_tableOffline=0;
      final static int c_tableOnline=1;
      final static int c_tableSecure=2;
      final static int c_tableAwait=3;
      final static int c_tableNotin=4;

      int     contactStatus=0;
      int     infoStatus=1;
      int     tableStore=-1;

      Vector  dataQueue=new Vector();
      int     dataStatus=c_NoMsg;

      OwnerUserInfo oUserInfo;
      MainFrame f;

      ContactUserInfo(OwnerUserInfo oUserInfo)
      {
          this.oUserInfo=oUserInfo;
          this.f=oUserInfo.f;
          iconIdle=f.iconGIcq;
      }

      public synchronized void addData(DataReceive dReceive)
      {
         dataQueue.addElement(dReceive);
         if(dataQueue.size()==1)
         {
            dataStatus=dReceive.getDataType();
         }
         System.out.println("add to data queue");
      }

      public synchronized DataReceive getData()
      {
         DataReceive dRec=new DataReceive(this.c_NoMsg);
         DataReceive dRecT=new DataReceive(this.c_NoMsg);
         if(dataQueue.size()>0)
         {
           dRec=(DataReceive)dataQueue.elementAt (0);
           dataQueue.removeElementAt(0);
           if(dataQueue.size()>0)
           {
              dRecT=(DataReceive)dataQueue.elementAt (0);
              dataStatus=dRecT.getDataType();
           }
           else
           {
              dataStatus=this.c_NoMsg;
           }
         }
         return dRec;
     }

      public void CloseEstablish()
      {
            if(cEstablish)
            {
                cEstablish=false;
                try{
                inS.close();
                outS.close();
                connection.close();
                }catch(Exception e){System.out.println(e);}
            }
      }


      public void sendKeyE()throws IOException
      {
          checkConnection();
          byte[] sMessage=cHandle.cData.getSendKeyE(oUserInfo.getKey_E().toString());
          sendData(sMessage);
         // outS.write(cHandle.cData.GetLength(sMessage));    //send  length of message
         // outS.write(sMessage);                    //send  message data
      }

      public void sendKeyN()throws IOException
      {
          checkConnection();
          byte[] sMessage=cHandle.cData.getSendKeyN(oUserInfo.getKey_N().toString());
          sendData(sMessage);
      }

      public void sendKeyDES()throws IOException
      {
          checkConnection();
          byte[] sMessage=cHandle.cData.getSendKeyDES(encryptDESKey(getKey_E(),getKey_N(),oUserInfo.getKey_DES()));
          sendData(sMessage);
      }

      public String encryptDESKey(BigInteger e ,BigInteger n ,byte[] des)
	    {
        RSA  rsa=new RSA();
      	BigInteger des_big = new BigInteger(des);
		    BigInteger des_en = rsa.Encrypt(e ,n ,des_big);
	    	return des_en.toString();
	    }

      public void sendMessage(String message)throws IOException
      {
          checkConnection();
          if(this.getSecure())
          {
            DES edes=new DES();
            byte[] msg_byte=edes.paddingMessage(message.getBytes() ,this.getKey_DES().length);
        		edes.setKey(this.getKey_DES());
	        	byte[] encrypt_msg = edes.encrypt(msg_byte);
		        BigInteger encrypt_DES =new BigInteger (encrypt_msg);
		        String en_des_str =encrypt_DES.toString();
            byte[] sMessage=cHandle.cData.getSendEncryptMessageBytes(en_des_str);
            sendData(sMessage);
          }
          else
          {
            byte[] sMessage=cHandle.cData.getSendMessageBytes(message);
            sendData(sMessage);
          }
      }

     public void sendFileReq(String message,Vector fileVector)throws IOException
     {
          this.fileVector=fileVector;
          checkConnection();
          pgFrame=new ProgressFrame(oUserInfo,this,"Sending File(s) to "+this.getNick(),"send");
          byte[] sMessage=cHandle.cData.getSendFileBytes(message,fileVector);
          sendData(sMessage);
     }

      public void sendFileAccept(short port)
      {
         if(port!=0)
         {
            pgFrame=new ProgressFrame(oUserInfo,this,"Receiveing File(s) from "+this.getNick(),"receive");
            ReceiveFileSeq rFileSeq=new ReceiveFileSeq(oUserInfo,this,oUserInfo.getFileSocket());
         }
         try
         {
           byte[] sMessage=cHandle.cData.getAcceptFileBytes("",port);
           sendData(sMessage);
         }catch(Exception e){System.out.println(e);}
      }

      public void sendFileCancel()
      {
         try
         {
           byte[] sMessage=cHandle.cData.getCancelFileBytes("");
           sendData(sMessage);
         }catch(Exception e){System.out.println(e);}
      }

      public int getDataStatus()
      {
        return dataStatus;
      }

      public boolean getFileAbort()
      {
        return ((DataReceive)(dataQueue.elementAt(0))).fileAbort;
      }


      public void setContactStatus(int status)
      {
          contactStatus=status;
      }

      public void setInfoStatus(int status)
      {
          infoStatus=status;
      }

      public void setTableStore(int table)
      {
          tableStore=table;
      }

      public int getInfoStatus(){return infoStatus;}
      public int getcontactStatus(){return contactStatus;}
      public int getTableStore(){return tableStore;}

      public synchronized void removeFromVector()
      {
          oUserInfo.contactUser.removeElement(this);
      }

      public synchronized void removeFromTable(DefaultTableModel dTableModel)
      {
            for(int i=0;i<dTableModel.getRowCount();i++)
            {
              ContactUserInfo cUser=new ContactUserInfo(oUserInfo);
              cUser=(ContactUserInfo)dTableModel.getValueAt(i,0);
              if(cUser.getUIN()==this.getUIN())
              {
                 dTableModel.removeRow (i);
              }
            }
      }

      public synchronized void addToTable(int table)
      {
            if(table==c_tableOffline)
            {
              this.setOffline();
              this.setUserStatus(this.c_Offline);
              f.offlineTm.addRow(new Object[]{this});
            }
            else if(table==c_tableOnline)
            {
              f.onlineTm.addRow(new Object[]{this});
              this.setOnline();
            }
            else if(table==c_tableSecure)
            {
              f.secureTm.addRow(new Object[]{this});
              this.setSecure();
            }
            else if(table==c_tableAwait)
            {
              this.setOffline();
              f.awaitTm.addRow(new Object[]{this});

            }
            else if(table==c_tableNotin)
            {
              this.setOffline();
              f.notinTm.addRow(new Object[]{this});
            }
      }

      private void sendData(byte[] sMessage)throws IOException
      {
         outS.write(cHandle.cData.GetLength(sMessage));
         outS.write(sMessage);
      }

      private void checkConnection()throws IOException
      {
        ChannelInit cInit=new ChannelInit(oUserInfo);
        if(!cEstablish)
        {
            System.out.println("Create new establish....");
            cEstablish=true;
            connection =new Socket(this.getIPStr(),(int)this.getMessagePort());
            outS=new DataOutputStream(connection.getOutputStream());
            inS=new DataInputStream(connection.getInputStream());
            cHandle=new ClientHandle(oUserInfo,this,connection);
            //------------------------------------
            byte[] initByte=cInit.getBytes();
            outS.write(cInit.GetLength(initByte));
            outS.write(initByte);
            //------------------------------------
        }
      }

}


