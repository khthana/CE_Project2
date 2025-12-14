import   java.io.*;

public class ChannelInit
{
       //command
       static final short c_CmdCancel  =(short)0x07d0;
       static final short c_CmdAck     =(short)0x07da;
       static final short c_CmdMessage =(short)0x07ee;
       static final short c_CmdX1      =(short)0xffff;
       static final short c_CmdX2      =(short)0xfffe;
       static final short c_CmdX3      =(short)0xfffd;
       //message type
       static final short c_MsgTypeMsg =(short)0x0001;
       static final short c_MsgTypeFile=(short)0x0003;
       //message command
       static final short c_MsgCmdAuTo =(short)0x0000;
       static final short c_MsgCmdReal =(short)0x0010;
       //message status
       static final short c_MsgStaOnline =(short)0x0000;
       static final short c_MsgStaRefuse =(short)0x0001;
  //------------------------------
      //tcp capable
       static final byte c_tcpCap     =(byte)0x04;
       static final byte c_tcpUnCap   =(byte)0x06;
  //------------------------------
  OwnerUserInfo oUserInfo;
  Util          u=new Util();
  short         tcpVersion=3;
  int           port=0;
  int           rUIN=0;

  public ChannelInit(OwnerUserInfo oUserInfo)
  {
      this.oUserInfo=oUserInfo;
      port=oUserInfo.getMessagePort();
  }

  public byte[] GetLength(byte[] data)
  {
    short length=(short)data.length;
    return u.short2BytesSW(length);
  }

  public byte[] getBytes()throws IOException
  {
    ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
    dataO.writeByte((byte)0xff);
    dataO.write(u.short2BytesSW(tcpVersion));
    dataO.write(u.short2BytesSW((short)0));
    dataO.write(u.int2BytesSW((int)0));
    dataO.write(u.int2BytesSW(oUserInfo.getUIN()));
    dataO.write(u.int2Bytes(oUserInfo.getIP()));
    dataO.write(u.int2Bytes(oUserInfo.getRealIP()));
    dataO.writeByte(c_tcpCap);
    dataO.write(u.int2BytesSW(port));
		return byteO.toByteArray();
  }

  public void setPort(int p){port=p;}
  public int  getPort(){return port;}
  public int  getUIN(){return rUIN;}
 	public void receiveData(byte[] d)
	{
    byte[] bytes4=new byte[4];
		byte[] bytes2=new byte[2];

//-----------uin----------------
		bytes4[0]=d[9];
		bytes4[1]=d[10];
		bytes4[2]=d[11];
		bytes4[3]=d[12];
		rUIN=u.bytes2Int(bytes4);//??????????????
//------------- port------------------
		bytes4[0]=d[22];
		bytes4[1]=d[23];
		bytes4[2]=d[24];
		bytes4[3]=d[25];
		port=u.bytes2Int(bytes4);
	}

}