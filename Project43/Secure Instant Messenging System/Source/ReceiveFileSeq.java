import 	java.math.BigInteger;
import  java.util.*;
import  java.io.*;
import  java.net.*;


public class ReceiveFileSeq extends Thread
{
  OwnerUserInfo    oUserInfo;
  ContactUserInfo  cUserInfo;
  ServerSocket     sSocket;
  Socket           connection;
  DataInputStream  inS;
  DataOutputStream outS;
  short            packetLen;
  int              count=0;
  byte[]           data;
  Util             u=new Util();
  //----------------------------
  static final byte  c_No=1;
  static final byte  c_NoToAll=2;
  static final byte  c_Yes=3;
  static final byte  c_YesToAll=4;
  byte               overWriteMode=c_No;
  //----------------------------
  File             nFile;
  short            fileNameLen;
  int              fileSize;
  int              fileRec;
  int              totalRec=0;
  int              fileNum;
  int              fileCount;
  int              totalSize;
  FileOutputStream fOut;
  boolean          fileInit=false;
  boolean          fileComplete=true;
  //----------------------------
  ProgressFrame    pgFrame;
  //----------------------------
  public ReceiveFileSeq(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo,ServerSocket sSocket)
  {
        super(oUserInfo.allThread,"receiveFileSeq");
        this.oUserInfo=oUserInfo;
        this.cUserInfo =cUserInfo;
        this.pgFrame=cUserInfo.rpgFrame;
        pgFrame.rFileSeq=this;
        this.sSocket=sSocket;
        this.start();
  }

  public void run()
  {
      try{
        System.out.println("wait for receive file ");
        connection=sSocket.accept();
        inS=new DataInputStream(connection.getInputStream());
        outS=new DataOutputStream(connection.getOutputStream());

        do
        {
           packetLen=inS.readShort();
           packetLen=u.bytes2Short(u.short2BytesSW(packetLen));
           data=new byte[packetLen];
           inS.readFully(data);
        }while(data[0]!=0x00);
        System.out.println("receive 0x00");
        this.extract0x00(data);
        //------
        data=get0x01();
        outS.write(getLength(data));
        outS.write(data);
        //---
        do
        {
           packetLen=inS.readShort();
           packetLen=u.bytes2Short(u.short2BytesSW(packetLen));
           data=new byte[packetLen];
           inS.readFully(data);
        }while(data[0]!=0x02);
        System.out.println("receive 0x02");
      do
      {
        //------
        if(data[0]==0x02)
        {
          this.extract0x02(data);
          if(!nFile.exists())
          {
           count++;
           fOut=new FileOutputStream(nFile);
           fileInit=true;
           fileComplete=false;
          }else
          {
            if((overWriteMode!=c_YesToAll)&&(overWriteMode!=c_NoToAll))
            {
              pgFrame.setEnabled(false);
              OverwriteFrame oWriteFrame=new OverwriteFrame(oUserInfo,nFile,this);
              this.suspend();
              pgFrame.setEnabled(true);
            }
              System.out.println("file is exist");
              count++;

            if((overWriteMode==c_YesToAll)||(overWriteMode==c_Yes))
            {
              fOut=new FileOutputStream(nFile);
              fileInit=true;
              fileComplete=false;
            }
          }

        data=get0x03();
        outS.write(getLength(data));
        outS.write(data);
        }
        //---
        do
        {
           packetLen=inS.readShort();
           packetLen=u.bytes2Short(u.short2BytesSW(packetLen));
           System.out.println("packet Len........."+packetLen);
           data=new byte[packetLen];
           inS.readFully(data);
           System.out.println("receive Data........."+data[0]);
           if((data[0]==0x06)||(data[0]==0x70))
           {
             //------------------------------
             if(data[0]==0x70)
             {
               System.out.println("decrypt data");
               DES ddes=new DES();
               //--------------
               ddes.setKey(oUserInfo.getKey_DES());
               byte[] msgTemp     = getSubData(data,1,data.length-1);
							 byte[] msgDecrypt  = ddes.decrypt(msgTemp);
							 byte[] msgDepad    = ddes.dePaddingMessage(msgDecrypt);

               if(fileInit){fOut.write(msgDepad);}
               fileRec=fileRec+msgDepad.length;
               totalRec=totalRec+msgDepad.length;
               System.out.println("decrypt data complete");
             }
             //------------------------------
             else
             {
               if(fileInit){fOut.write(data,1,data.length-1);}
               fileRec=fileRec+data.length-1;
               totalRec=totalRec+data.length-1;
             }
             //------------------
              pgFrame.progressFile.setValue(fileRec);
              pgFrame.progressBatch.setValue(totalRec);
             //------------------

             System.out.println("file  receive "+nFile.getName()+" "+fileRec+" from "+fileSize+" ("+(int)((fileRec*100)/fileSize)+"%)");
             System.out.println("total receive "+totalRec+" from "+totalSize+" ("+(int)((totalRec*100)/totalSize)+"%)");
             if(fileRec>=fileSize)
             {
               System.out.println("Receive "+ nFile.getName()+" complete.............................");
               if(fileInit){fOut.close();}
               fileComplete=true;
               fileInit=false;
               fileCount++;
               System.out.println("Receive "+ fileCount +" file(s) from "+fileNum+" file(s)");
               if(fileCount>=fileNum)
                {
                     System.out.println("Receive all file complete.............................");
                     pgFrame.dispose();
                     WarningFrame wFrame=new WarningFrame("Receive file complete.","("+cUserInfo.saveFilePath+")");
                     wFrame.setTitle("Receive file result");
                     try{
                     inS.close();
                     outS.close();
                     connection.close();
                     }catch(Exception exc){System.out.println(exc);}
                     this.stop();
                }
             }
           }
        }while(data[0]==0x06||(data[0]==0x70));
      }while((data[0]!=0x06)&&(data[0]!=0x70));
     }catch(Exception e)
     {
       System.out.println(e);
       pgFrame.dispose();
       WarningFrame wFrame=new WarningFrame("Receive file error. ("+cUserInfo.saveFilePath+")");
       try{
       if(fileInit){fOut.close();}
       inS.close();
       outS.close();
       connection.close();
       }catch(Exception ex){System.out.println(e);}
       if(!fileComplete)
       {
        System.out.println("file "+nFile.getName()+" not complete.");
        nFile.delete();

       }
       System.out.println("Receive "+ fileCount +" file(s) from "+fileNum+" file(s)");
       this.stop();
     }
  }


  private byte[] get0x01()throws IOException
  {
     ByteArrayOutputStream byteO=new ByteArrayOutputStream();
  	 DataOutputStream dataO=new DataOutputStream(byteO);
     String nick=oUserInfo.getNick();
     //---------------
     dataO.writeByte(0x01);
     dataO.write(u.int2BytesSW(0x00000064));
     dataO.write(u.short2BytesSW((short)(nick.length()+1)));
     dataO.write(nick.getBytes());
     dataO.writeByte(0x00);
     //---------------
     return byteO.toByteArray();
  }

  private byte[] get0x03()throws IOException
  {
     ByteArrayOutputStream byteO=new ByteArrayOutputStream();
  	 DataOutputStream dataO=new DataOutputStream(byteO);
     //---------------
     dataO.writeByte(0x03);
     dataO.write(u.int2BytesSW(0x00000000));
     dataO.write(u.int2BytesSW(0x00000000));
     dataO.write(u.int2BytesSW(0x00000064));
     //---------------
     return byteO.toByteArray();
  }

  private void extract0x00(byte[] d)
  {
 		byte[] bytes4=new byte[4];

		bytes4[0]=d[5];
		bytes4[1]=d[6];
		bytes4[2]=d[7];
		bytes4[3]=d[8];
		fileNum=u.bytes2IntSW(bytes4);

    bytes4[0]=d[9];
		bytes4[1]=d[10];
		bytes4[2]=d[11];
		bytes4[3]=d[12];
		totalSize=u.bytes2IntSW(bytes4);
    //------------------------------
    pgFrame.progressBatch.setMinimum(0);
    pgFrame.progressBatch.setMaximum(totalSize);
    pgFrame.progressBatch.setValue(0);
    pgFrame.tfBatchSize.setText((int)(totalSize/1024)+"KB");
    //------------------------------
  }

  private void extract0x02(byte[] d)
  {
 		byte[] bytes4=new byte[4];
		byte[] bytes2=new byte[2];
    String fName="";
    String text="";
    short  tLen=0;

  	bytes2[0]=d[2];
  	bytes2[1]=d[3];
		fileNameLen=u.bytes2ShortSW(bytes2);
		fName=new String(d ,4 ,(int)(fileNameLen-1));

   	bytes2[0]=d[4+(int)fileNameLen];
  	bytes2[1]=d[5+(int)fileNameLen];
		tLen=u.bytes2ShortSW(bytes2);
    text=new String(d ,6+(int)fileNameLen ,(int)(tLen-1));

    bytes4[0]=d[6+(int)fileNameLen+(int)tLen];
		bytes4[1]=d[7+(int)fileNameLen+(int)tLen];
		bytes4[2]=d[8+(int)fileNameLen+(int)tLen];
		bytes4[3]=d[9+(int)fileNameLen+(int)tLen];
		fileSize=u.bytes2IntSW(bytes4);

    nFile=new File(File.separator+cUserInfo.saveFilePath+File.separator+fName);
    System.out.println("save to"+nFile.getAbsolutePath());

    fileRec=0;
    //------------------------------
    pgFrame.progressFile.setMinimum(0);
    pgFrame.progressFile.setMaximum(fileSize);
    pgFrame.progressFile.setValue(0);
    pgFrame.tfNumFile.setText((fileCount+1)+"/"+fileNum);
    pgFrame.tfFileName.setText(fName);
    pgFrame.tfFileSize.setText((int)(fileSize/1024)+"KB");
  }

  private byte[] getSubData(byte[] Data,int start,int Len)throws IOException
  {
     ByteArrayOutputStream byteO=new ByteArrayOutputStream();
  	 DataOutputStream dataO=new DataOutputStream(byteO);
     //---------------
     dataO.write(Data,start,Len);
     //---------------
     return byteO.toByteArray();
  }

  public void stopReceive()
  {
       WarningFrame wFrame=new WarningFrame("Receive file error. ("+cUserInfo.saveFilePath+")");
       try{
       if(fileInit){fOut.close();}
        inS.close();
        outS.close();
        connection.close();
       }catch(Exception e){System.out.println(e);}
       if(!fileComplete)
       {
         System.out.println("file "+nFile.getName()+" not complete.");
         nFile.delete();
       }
       System.out.println("Receive "+ fileCount +" file(s) from "+fileNum+" file(s)");
       this.stop();
  }

  public byte[] getLength(byte[] data)
  {
    short length=(short)data.length;
    return u.short2BytesSW(length);
  }

}