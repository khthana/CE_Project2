import   java.io.*;
import   java.util.*;
import java.io.File;

public class ChannelData
{
       //command
       static final short c_CmdCancel  =(short)0x07d0;
       static final short c_CmdAck     =(short)0x07da;
       static final short c_CmdMessage =(short)0x07ee;
       static final short c_CmdSMessage=(short)0xffff;
       //message type
       static final short c_MsgTypeMsg =(short)0x0001;
       static final short c_MsgTypeFile=(short)0x0003;

       static final short c_MsgTypeKeyE    =(short)0xffff;
       static final short c_MsgTypeKeyN    =(short)0xfffe;
       static final short c_MsgTypeKeyDES  =(short)0xfffd;
       //message command
       static final short c_MsgCmdAuTo  =(short)0x0000;
       static final short c_MsgCmdReal  =(short)0x0010;
       static final short c_MsgCmdUrgent=(short)0x0040;
       //message status
       static final short c_MsgStaOnline =(short)0x0000;
       static final short c_MsgStaRefuse =(short)0x0001;
  //------------------------------
      //tcp capable
       static final byte c_tcpCap     =(byte)0x04;
       static final byte c_tcpUnCap   =(byte)0x06;
  //-----------common----------------
       int    rUIN;
       short  command;
       short  messageType;
       short  messageLen;
       String message;
       int    rIP;
       int    rRealIP;
       int    port;
       short  messageCom;
  //------------file-----------------
       short  filePortNetWork;
       short  fileNameLen;
       String fileName="";
       int    fileSize;
       int    filePortIntel;
  //---------------------------------
       int    seq;
       int    fileSeq;
       int    sfSeq;
  //---------------------------------
  OwnerUserInfo oUserInfo;
  Util          u=new Util();
  short         tcpVersion=3;

  public ChannelData(OwnerUserInfo oUserInfo)
  {
    this.oUserInfo=oUserInfo;
  }

  public int getUIN()
  {
     return rUIN;
  }

  public int getRecFileSeq()
  {
     return fileSeq;
  }

  public short getCommand()
  {
     return command;
  }

  public short getMessageType()
  {
     return messageType;
  }

  public short getMessageCommand()
  {
     return messageCom;
  }

  public String getMessage()
  {
     return message;
  }

  public short getFilePortNetWork()
  {
     return filePortNetWork;
  }
  public short getFileNameLength()
  {
     return fileNameLen;
  }

  public String getFileName()
  {
     return fileName;
  }

  public int getFileSize()
  {
     return fileSize;
  }
  public int getFilePortIntel()
  {
     return filePortIntel;
  }


  public byte[] GetLength(byte[] data)
  {
    short length=(short)data.length;
    return u.short2BytesSW(length);
  }

  public byte[] getSendKeyE(String message)throws IOException
  {
    ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);

    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(tcpVersion));
    dataO.write(u.short2BytesSW(this.c_CmdSMessage));
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(this.c_MsgTypeKeyE));
    dataO.write(u.short2BytesSW((short)(message.length()+1)));
    dataO.write(message.getBytes());
    dataO.writeByte((byte)0);// end null (end string)
    dataO.write(u.int2Bytes(oUserInfo.getIP()));
    dataO.write(u.int2Bytes(oUserInfo.getRealIP()));
    dataO.write(u.int2BytesSW(oUserInfo.getMessagePort()));
    dataO.writeByte(c_tcpCap);
    dataO.write(u.short2BytesSW(this.c_MsgStaOnline));
    dataO.write(u.short2BytesSW(this.c_MsgCmdReal));
    dataO.write(u.int2BytesSW(oUserInfo.getTCPSeqNumber()));
		return byteO.toByteArray();
  }

  public byte[] getSendKeyN(String message)throws IOException
  {
    ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);

    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(tcpVersion));
    dataO.write(u.short2BytesSW(this.c_CmdSMessage));
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(this.c_MsgTypeKeyN));
    dataO.write(u.short2BytesSW((short)(message.length()+1)));
    dataO.write(message.getBytes());
    dataO.writeByte((byte)0);// end null (end string)
    dataO.write(u.int2Bytes(oUserInfo.getIP()));
    dataO.write(u.int2Bytes(oUserInfo.getRealIP()));
    dataO.write(u.int2BytesSW(oUserInfo.getMessagePort()));
    dataO.writeByte(c_tcpCap);
    dataO.write(u.short2BytesSW(this.c_MsgStaOnline));
    dataO.write(u.short2BytesSW(this.c_MsgCmdReal));
    dataO.write(u.int2BytesSW(oUserInfo.getTCPSeqNumber()));
		return byteO.toByteArray();
  }

  public byte[] getSendKeyDES(String message)throws IOException
  {
    ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);

    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(tcpVersion));
    dataO.write(u.short2BytesSW(this.c_CmdSMessage));
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(this.c_MsgTypeKeyDES));
    dataO.write(u.short2BytesSW((short)(message.length()+1)));
    dataO.write(message.getBytes());
    dataO.writeByte((byte)0);// end null (end string)
    dataO.write(u.int2Bytes(oUserInfo.getIP()));
    dataO.write(u.int2Bytes(oUserInfo.getRealIP()));
    dataO.write(u.int2BytesSW(oUserInfo.getMessagePort()));
    dataO.writeByte(c_tcpCap);
    dataO.write(u.short2BytesSW(this.c_MsgStaOnline));
    dataO.write(u.short2BytesSW(this.c_MsgCmdReal));
    dataO.write(u.int2BytesSW(oUserInfo.getTCPSeqNumber()));
		return byteO.toByteArray();
  }




  public byte[] getSendMessageBytes(String message)throws IOException
  {
    ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);

    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(tcpVersion));
    dataO.write(u.short2BytesSW(this.c_CmdMessage));
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(this.c_MsgTypeMsg));
    dataO.write(u.short2BytesSW((short)(message.length()+1)));
    dataO.write(message.getBytes());
    dataO.writeByte((byte)0);// end null (end string)
    dataO.write(u.int2Bytes(oUserInfo.getIP()));
    dataO.write(u.int2Bytes(oUserInfo.getRealIP()));
    dataO.write(u.int2BytesSW(oUserInfo.getMessagePort()));
    dataO.writeByte(c_tcpCap);
    dataO.write(u.short2BytesSW(this.c_MsgStaOnline));
    dataO.write(u.short2BytesSW(this.c_MsgCmdUrgent));  //-----------test
    dataO.write(u.int2BytesSW(oUserInfo.getTCPSeqNumber()));
		return byteO.toByteArray();
  }

  public byte[] getSendEncryptMessageBytes(String message)throws IOException
  {
    ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);

    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(tcpVersion));
    dataO.write(u.short2BytesSW(this.c_CmdSMessage));
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(this.c_MsgTypeMsg));
    dataO.write(u.short2BytesSW((short)(message.length()+1)));
    dataO.write(message.getBytes());
    dataO.writeByte((byte)0);// end null (end string)
    dataO.write(u.int2Bytes(oUserInfo.getIP()));
    dataO.write(u.int2Bytes(oUserInfo.getRealIP()));
    dataO.write(u.int2BytesSW(oUserInfo.getMessagePort()));
    dataO.writeByte(c_tcpCap);
    dataO.write(u.short2BytesSW(this.c_MsgStaOnline));
    dataO.write(u.short2BytesSW(this.c_MsgCmdReal));
    dataO.write(u.int2BytesSW(oUserInfo.getTCPSeqNumber()));
		return byteO.toByteArray();
  }


  public byte[] getAckMessageBytes(String message)throws IOException
  {
    ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);

    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(tcpVersion));
    dataO.write(u.short2BytesSW(this.c_CmdAck));
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(this.c_MsgTypeMsg));
    dataO.write(u.short2BytesSW((short)(message.length()+1)));
    dataO.write(message.getBytes());
    dataO.writeByte((byte)0);// end null (end string)
    dataO.write(u.int2Bytes(oUserInfo.getIP()));
    dataO.write(u.int2Bytes(oUserInfo.getRealIP()));
    dataO.write(u.int2BytesSW(oUserInfo.getMessagePort()));
    dataO.writeByte(c_tcpCap);
    dataO.write(u.short2BytesSW(this.c_MsgStaOnline));
    dataO.write(u.short2BytesSW(this.c_MsgCmdAuTo));
    dataO.write(u.int2BytesSW(seq));
		return byteO.toByteArray();
  }


  public byte[] getSendFileBytes(String message,Vector fileVector)throws IOException
  {
    ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);

    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(tcpVersion));
    dataO.write(u.short2BytesSW(this.c_CmdMessage));
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(this.c_MsgTypeFile));
    dataO.write(u.short2BytesSW((short)(message.length()+1)));
    dataO.write(message.getBytes());
    dataO.writeByte((byte)0);// end null (end string)
    dataO.write(u.int2Bytes(oUserInfo.getIP()));
    dataO.write(u.int2Bytes(oUserInfo.getRealIP()));
    dataO.write(u.int2BytesSW(oUserInfo.getMessagePort()));
    dataO.writeByte(c_tcpCap);
    dataO.write(u.short2BytesSW(this.c_MsgStaOnline));
    dataO.write(u.short2BytesSW(this.c_MsgCmdUrgent));  //-----------test

    //------------------------
    String fname="";
    int    fileSize=0;
    if(fileVector.size()>1)
    {
        fname=String.valueOf(fileVector.size())+" file(s).";
        File fileT;
        for(int i=0;i<fileVector.size();i++)
        {
           fileT=(File)fileVector.elementAt(i);
           fileSize=fileSize+(int)fileT.length();
        }
    }
    else
    {
        File fileT;
        fileT=(File)fileVector.elementAt(0);
        fname=fileT.getName();
        fileSize=(int)fileT.length();
    }


    short  fLen =(short)(fname.length()+1);
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.short2BytesSW((short)0));
    //--------------------------
    dataO.write(u.short2BytesSW(fLen));
    dataO.write(fname.getBytes());
    dataO.writeByte((byte)0);// end null (end string)
    //--------------------------
    dataO.write(u.int2BytesSW(fileSize));
    dataO.write(u.int2BytesSW(0));
    //--------------------------
    sfSeq=oUserInfo.getTCPSeqNumber();
    System.out.println("seq at send "+sfSeq);
    dataO.write(u.int2BytesSW(sfSeq));
		return byteO.toByteArray();
  }
//--------------
public byte[] getAcceptFileBytes(String message,short port)throws IOException
  {
    ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);

    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(tcpVersion));
    dataO.write(u.short2BytesSW(this.c_CmdAck));
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(this.c_MsgTypeFile));
    dataO.write(u.short2BytesSW((short)(message.length()+1)));
    dataO.write(message.getBytes());
    dataO.writeByte((byte)0);// end null (end string)
    dataO.write(u.int2Bytes(oUserInfo.getIP()));
    dataO.write(u.int2Bytes(oUserInfo.getRealIP()));
    dataO.write(u.int2BytesSW(oUserInfo.getMessagePort()));
    dataO.writeByte(c_tcpCap);
    if(port!=0)
    {
      dataO.write(u.short2BytesSW(this.c_MsgStaOnline));
    }
    else
    {
      dataO.write(u.short2BytesSW(this.c_MsgStaRefuse));
    }
    dataO.write(u.short2BytesSW(this.c_MsgCmdAuTo));
    //------------------------
    dataO.write(u.short2Bytes(port));
    dataO.write(u.short2BytesSW((short)0));
    //-
    dataO.write(u.short2BytesSW((short)1));
    dataO.writeByte((byte)0);// end null (end string)
    //-
    dataO.write(u.int2BytesSW(0x00000000));
    dataO.write(u.int2BytesSW((int)port));
    //------------------------
    dataO.write(u.int2BytesSW(fileSeq));

    System.out.println("file seq b w"+fileSeq);
    System.out.println(u.bytes2HxStr(u.int2BytesSW(fileSeq)));

		return byteO.toByteArray();
  }

//--------------
public byte[] getCancelFileBytes(String message)throws IOException
  {
    ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);

    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(tcpVersion));
    dataO.write(u.short2BytesSW(this.c_CmdCancel));
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.short2BytesSW(this.c_MsgTypeFile));
    dataO.write(u.short2BytesSW((short)(message.length()+1)));
    dataO.write(message.getBytes());
    dataO.writeByte((byte)0);// end null (end string)
    dataO.write(u.int2Bytes(oUserInfo.getIP()));
    dataO.write(u.int2Bytes(oUserInfo.getRealIP()));
    dataO.write(u.int2BytesSW(oUserInfo.getMessagePort()));
    dataO.writeByte(c_tcpCap);
    dataO.write(u.short2BytesSW(this.c_MsgStaOnline));
    dataO.write(u.short2BytesSW(this.c_MsgCmdAuTo));
    //------------------------
    dataO.write(u.short2Bytes((short)0));
    dataO.write(u.short2BytesSW((short)0));
    //------------------------
    dataO.write(u.short2BytesSW((short)1));
    dataO.writeByte((byte)0);// end null (end string)
    //------------------------
    dataO.write(u.int2BytesSW(0x00000000));
    dataO.write(u.int2BytesSW((int)0));
    //------------------------
    dataO.write(u.int2BytesSW(sfSeq));
    System.out.println("file seq b w "+sfSeq);
    System.out.println(u.bytes2HxStr(u.int2BytesSW(sfSeq)));

		return byteO.toByteArray();
  }


 	public void receiveData(byte[] d)
	{
//--------------------- uin1 ------------------------
		byte[] bytes4=new byte[4];
		byte[] bytes2=new byte[2];
		bytes4[0]=d[0];
		bytes4[1]=d[1];
		bytes4[2]=d[2];
		bytes4[3]=d[3];
		rUIN=u.bytes2IntSW(bytes4);
//--------------------- msg_cmd ------------------------
		bytes2[0]=d[6];
		bytes2[1]=d[7];
		command=u.bytes2ShortSW(bytes2);
//--------------------- msg_type ------------------------
		bytes2[0]=d[14];
		bytes2[1]=d[15];
		messageType=u.bytes2ShortSW(bytes2);
//--------------------- messageLen ------------------------
		bytes2[0]=d[16];
		bytes2[1]=d[17];
		messageLen=u.bytes2ShortSW(bytes2);
//--------------------- msg ------------------------
		message=new String(d ,18 ,(int)(messageLen-1));
//--------------------- ip------------------------
		bytes4[0]=d[18+(int)messageLen];
		bytes4[1]=d[19+(int)messageLen];
		bytes4[2]=d[20+(int)messageLen];
		bytes4[3]=d[21+(int)messageLen];
		rIP=u.bytes2IntSW(bytes4);
//---------------------real ip ------------------------
		bytes4[0]=d[22+(int)messageLen];
		bytes4[1]=d[23+(int)messageLen];
		bytes4[2]=d[24+(int)messageLen];
		bytes4[3]=d[25+(int)messageLen];
		rRealIP=u.bytes2IntSW(bytes4);
//--------------------- port ------------------------
		bytes4[0]=d[26+(int)messageLen];
		bytes4[1]=d[27+(int)messageLen];
    bytes4[2]=d[28+(int)messageLen];
		bytes4[3]=d[29+(int)messageLen];
		port=u.bytes2IntSW(bytes4);
//--------------------- cmd_type ------------------------
		bytes2[0]=d[33+(int)messageLen];
		bytes2[1]=d[34+(int)messageLen];
		messageCom=u.bytes2ShortSW(bytes2);

   if(messageType==this.c_MsgTypeMsg)
   {
//--------------------- tcp_seq ------------------------
		bytes4[0]=d[35+(int)messageLen];
		bytes4[1]=d[36+(int)messageLen];
		bytes4[2]=d[37+(int)messageLen];
		bytes4[3]=d[38+(int)messageLen];
		seq=u.bytes2IntSW(bytes4);
    System.out.println("message seq"+fileSeq);
   }
   else if(messageType==this.c_MsgTypeFile)
   {

     bytes2[0]=d[35+(int)messageLen];
 		 bytes2[1]=d[36+(int)messageLen];
     filePortNetWork=u.bytes2Short(bytes2);

     bytes2[0]=d[39+(int)messageLen];
 		 bytes2[1]=d[40+(int)messageLen];
     fileNameLen=u.bytes2ShortSW(bytes2);

     fileName=new String(d ,41+(int)messageLen,(int)(fileNameLen-1));

     bytes4[0]=d[41+(int)fileNameLen+(int)messageLen];
  	 bytes4[1]=d[42+(int)fileNameLen+(int)messageLen];
	 	 bytes4[2]=d[43+(int)fileNameLen+(int)messageLen];
	   bytes4[3]=d[44+(int)fileNameLen+(int)messageLen];
		 fileSize=u.bytes2IntSW(bytes4);

     bytes4[0]=d[45+(int)fileNameLen+(int)messageLen];
		 bytes4[1]=d[46+(int)fileNameLen+(int)messageLen];
		 bytes4[2]=d[47+(int)fileNameLen+(int)messageLen];
		 bytes4[3]=d[48+(int)fileNameLen+(int)messageLen];
		 filePortIntel=u.bytes2IntSW(bytes4);

     bytes4[0]=d[49+(int)fileNameLen+(int)messageLen];
		 bytes4[1]=d[50+(int)fileNameLen+(int)messageLen];
		 bytes4[2]=d[51+(int)fileNameLen+(int)messageLen];
		 bytes4[3]=d[52+(int)fileNameLen+(int)messageLen];
		 fileSeq=u.bytes2IntSW(bytes4);
     seq=u.bytes2IntSW(bytes4);
     System.out.println("file seq"+fileSeq);
   }
 }

}
