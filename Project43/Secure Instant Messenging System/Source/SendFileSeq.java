import		java.math.BigInteger;
import  java.util.*;
import  java.io.*;
import  java.net.*;

public class SendFileSeq extends Thread
{
  ProgressFrame   pgFrame;
  OwnerUserInfo   oUserInfo;
  ContactUserInfo cUserInfo;
  Vector          fileVector;
  Socket          connection;
  DataInputStream  inS;
  DataOutputStream outS;
  int             filePort;
  int             fileIndex=-1;
  String          fileName;
  int             fileNameLen;
  int             fileSize;
  int             totalSize;
  int             fileCount=1;
  int             fileTotal;
  File            sendFile;
  byte[]          data;
  short           packetLen;
  Util            u=new Util();
  //----------------------
  int             totalSendAll=0;
  int             totalSendFile=0;
  //----------------------

  public SendFileSeq(OwnerUserInfo oUserInfo,ClientHandle cHandle)
  {
        super(oUserInfo.allThread,"sendFileSeq");

        this.oUserInfo=oUserInfo;
        cUserInfo=cHandle.cUserInfo;
        pgFrame=cUserInfo.pgFrame;
        pgFrame.sFileSeq=this;
        fileVector=cUserInfo.fileVector;
        filePort=cHandle.cData.getFilePortIntel();
        try{
        connection=new Socket(cUserInfo.getIPStr(),filePort);
        inS=new DataInputStream(connection.getInputStream());
        outS=new DataOutputStream(connection.getOutputStream());
        }catch(Exception e)
        {
          System.out.println(e);
          pgFrame.closeFrame();
          WarningFrame wFrame=new WarningFrame(cUserInfo.getNick()+" abort to receive file.");
          wFrame.setTitle("Send file result");
        }
        this.start();
  }

  public void run()
  {

       pgFrame.sendFileStart=true;
       ChannelInit cInit=new ChannelInit(oUserInfo);
       try{
        //-----------
        byte[] initByte=cInit.getBytes();
        outS.write(cInit.GetLength(initByte));
        outS.write(initByte);
        //-----------
        data=get0x00();
        outS.write(getLength(data));
        outS.write(data);
        //---
        System.out.println("send init send all "+data.length);
        do
        {
           packetLen=inS.readShort();
           packetLen=u.bytes2Short(u.short2BytesSW(packetLen));
           data=new byte[packetLen];
           inS.readFully(data);
        }while((data[0]!=0x01)&&(data[0]!=0x05));

        System.out.println("receive 0x01 "+data.length);
        while(getNextFile())
        {
         //----------------------
          data=get0x02();
          outS.write(getLength(data));
          outS.write(data);
         //----------------------
          System.out.println("send init send file "+data.length);
         //---------
          do
          {
           packetLen=inS.readShort();
           packetLen=u.bytes2Short(u.short2BytesSW(packetLen));
           data=new byte[packetLen];
           inS.readFully(data);
          }while(data[0]!=0x03);

          //---------
          System.out.println("receive 0x03 "+data.length);
          int    byteRead=0;
          byte[] fileData=new byte[2048];
          FileInputStream fIn=new FileInputStream(sendFile);

          while((byteRead=fIn.read(fileData))!=-1)
          {
             //---------
             totalSendAll=totalSendAll+byteRead;
             totalSendFile=totalSendFile+byteRead;
             pgFrame.progressBatch.setValue(totalSendAll);
             pgFrame.progressFile.setValue(totalSendFile);
             //------------encrypt
             if(cUserInfo.getSecure())
             {

              DES edes=new DES();
              edes.setKey(cUserInfo.getKey_DES());

              byte[] msgTemp =getSubData(fileData,0,byteRead);
              byte[] msgPad=edes.paddingMessage(msgTemp,cUserInfo.getKey_DES().length);
	          	byte[] msgEncrypt = edes.encrypt(msgPad);
              data=get0x70(msgEncrypt);
		         }
             //------------
             else
             {
              data=get0x06(fileData,byteRead);
             }
             outS.write(getLength(data));
             outS.write(data);
             System.out.println("send Data..........."+byteRead+" total send "+totalSendAll+"/"+totalSize);
          }
          fileCount++;
          fIn.close();

        }

          pgFrame.closeFrame();
          inS.close();
          outS.close();
          connection.close();
          WarningFrame wFrame=new WarningFrame("Send file complete.");
          wFrame.setTitle("Send file result");
       }catch(Exception e)
       {
         System.out.println(e);
         try{
           pgFrame.closeFrame();
           inS.close();
           outS.close();
           connection.close();
           WarningFrame wFrame=new WarningFrame("Send file error.");
           wFrame.setTitle("Send file result");
         }catch(Exception ex)
         {System.out.println(ex);}

         this.stop();
      }
  }

  private byte[] get0x00()throws IOException
  {
     ByteArrayOutputStream byteO=new ByteArrayOutputStream();
  	 DataOutputStream dataO=new DataOutputStream(byteO);
     String nick=oUserInfo.getNick();
     //---------------
     dataO.writeByte(0x00);
     dataO.write(u.int2BytesSW(0x00000000));
     dataO.write(u.int2BytesSW(fileVector.size()));
     dataO.write(u.int2BytesSW(getTotalSize()));
     dataO.write(u.int2BytesSW(0x00000064));
     dataO.write(u.short2BytesSW((short)(nick.length()+1)));
     dataO.write(nick.getBytes());
     dataO.writeByte(0x00);
     //---------------
     pgFrame.progressBatch.setMinimum(0);
     pgFrame.progressBatch.setMaximum(getTotalSize());
     pgFrame.progressBatch.setValue(0);
     pgFrame.progressFile.setMinimum(0);
     pgFrame.progressFile.setMaximum(100);
     pgFrame.progressFile.setValue(0);
     pgFrame.tfBatchSize.setText((int)(totalSize/1024)+"KB");
     fileTotal=fileVector.size();
     //---------------
     return byteO.toByteArray();
  }

  private byte[] get0x02()throws IOException
  {
     ByteArrayOutputStream byteO=new ByteArrayOutputStream();
  	 DataOutputStream dataO=new DataOutputStream(byteO);
     //---------------
     dataO.writeByte(0x02);
     dataO.writeByte(0x00);
     dataO.write(u.short2BytesSW((short)fileNameLen));
     dataO.write(fileName.getBytes());
     dataO.writeByte(0x00);
     dataO.write(u.short2BytesSW((short)0x0001));
     dataO.writeByte(0x00);
     dataO.write(u.int2BytesSW(fileSize));
     dataO.write(u.int2BytesSW(0x00000000));
     dataO.write(u.int2BytesSW(0x00000064));
     //---------------
     pgFrame.progressFile.setMinimum(0);
     pgFrame.progressFile.setMaximum(fileSize);
     pgFrame.progressFile.setValue(0);
     pgFrame.tfNumFile.setText(fileCount+"/"+fileTotal);
     pgFrame.tfFileName.setText(fileName);
     pgFrame.tfFileSize.setText((int)(fileSize/1024)+"KB");
     totalSendFile=0;
     //---------------
     return byteO.toByteArray();
  }

  private byte[] get0x06(byte[] fileData,int Len)throws IOException
  {
     ByteArrayOutputStream byteO=new ByteArrayOutputStream();
  	 DataOutputStream dataO=new DataOutputStream(byteO);
     //---------------
     dataO.writeByte(0x06);
     dataO.write(fileData,0,Len);
     //---------------
     return byteO.toByteArray();
  }

  private byte[] get0x70(byte[] fileData)throws IOException
  {
     ByteArrayOutputStream byteO=new ByteArrayOutputStream();
  	 DataOutputStream dataO=new DataOutputStream(byteO);
     //---------------
     dataO.writeByte(0x70);
     dataO.write(fileData);
     //---------------
     return byteO.toByteArray();
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

  private int getTotalSize()
  {
     File fileT;
     totalSize=0;
     for(int i=0;i<fileVector.size();i++)
     {
           fileT=(File)fileVector.elementAt(i);
           totalSize=totalSize+(int)fileT.length();
     }
     return totalSize;
  }

  private boolean getNextFile()
  {
       if(fileIndex<(fileVector.size()-1))
       {
         fileIndex++;
         File fileT;
         fileT=(File)fileVector.elementAt(fileIndex);
         fileName=fileT.getName();
         fileNameLen=fileName.length()+1;
         fileSize=(int)fileT.length();
         sendFile=fileT;
         return true;
       }
       else
       {
         return false;
       }
  }

  public byte[] getLength(byte[] data)
  {
    short length=(short)data.length;
    return u.short2BytesSW(length);
  }

  public void stopSend()
  {
       try{
           inS.close();
           outS.close();
           connection.close();
        }catch(Exception e){System.out.println(e);}
        this.stop();
  }

}
