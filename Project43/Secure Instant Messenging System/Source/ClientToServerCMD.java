import java.io.*;
import java.net.*;
import java.awt.*;
import java.util.*;

public class ClientToServerCMD
{
  short  version=2;
  OwnerUserInfo ownerUser;
 	public ClientToServerCMD(OwnerUserInfo ownerUser)
	{
    this.ownerUser =ownerUser;
 	}
	static short ACK=10;
	static short SEND_MESSAGE=270;
	static short LOGIN=1000;
	static short REG_NEW_USER=1020;
	static short CONTACT_LIST=1030;
	static short SEARCH_UIN=1050;
	static short SEARCH_USER=1060;
	static short KEEP_ALIVE=1070;
	static short SEND_TEXT_CODE=1080;
	static short ACK_MESSAGES=1090;
	static short LOGIN_1=1100;
	static short MSG_TO_NEW_USER=1110;
	static short INFO_REQ=1120;
	static short EXT_INFO_REQ=1130;
	static short CHANGE_PW=1180;
	static short NEW_USER_INFO=1190;
	static short UPDATE_EXT_INFO=1200;
	static short QUERY_SERVERS=1210;
	static short QUERY_ADDONS=1220;
	static short STATUS_CHANGE=1240;
	static short NEW_USER_1=1260;
	static short UPDATE_INFO=1290;
	static short AUTH_UPDATE=1300;
	static short KEEP_ALIVE2=1310;
	static short LOGIN_2=1320;
	static short ADD_TO_LIST=1340;
	static short RAND_SET=1380;
	static short RAND_SEARCH=1390;
	static short META_USER=1610;
	static short INVIS_LIS=1700;
	static short VIS_LIS=1710;
	static short UPDATE_LIST=1720;

	Util u=new Util();

//-------------------------------------------------------------------------------------------------
	public byte[] ACK(short seq)throws IOException // 10
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)ACK));
		dataO.write(u.short2BytesSW((short)seq));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] SEND_MESSAGE(int remote_uin ,short msg_type ,String msg)throws IOException  // 0E 01 (270)
	{
		short	msg_len=0; //include null
		msg_len=(short)(msg.length()+1);
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)SEND_MESSAGE));
		dataO.write(u.short2BytesSW(ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.int2BytesSW(remote_uin));
		dataO.write(u.short2BytesSW(msg_type));
		dataO.write(u.short2BytesSW(msg_len));
		dataO.write(msg.getBytes());
		dataO.writeByte((byte)0);
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] USER_ADDED(int remote_uin ,short msg_type)throws IOException  // 0E 01 (270)
	{
		short	msg_len=0; //include null
    String auth=Byte.toString(ownerUser.getAuth());
    //---------------------
		msg_len=(short)(ownerUser.getNick().length()+ownerUser.getFirst().length()+ownerUser.getLast().length()+ownerUser.getEmail().length()+auth.length()+6);
    //---------------------
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)SEND_MESSAGE));
		dataO.write(u.short2BytesSW(ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.int2BytesSW(remote_uin));
		dataO.write(u.short2BytesSW(msg_type));
		dataO.write(u.short2BytesSW(msg_len));
    dataO.write(ownerUser.getNick().getBytes());
    dataO.writeByte((byte)0xFE);
    dataO.write(ownerUser.getFirst().getBytes());
    dataO.writeByte((byte)0xFE);
    dataO.write(ownerUser.getLast().getBytes());
    dataO.writeByte((byte)0xFE);
    dataO.write(ownerUser.getEmail().getBytes());
    dataO.writeByte((byte)0xFE);
    dataO.write(auth.getBytes()); //-------test-------------
		dataO.writeByte((byte)0);
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] AUTH_REQUEST(int remote_uin ,short msg_type,String msg)throws IOException  // 0E 01 (270)
	{
		short	 msg_len=0; //include null
    String auth=Byte.toString(ownerUser.getAuth());
    //---------------------
		msg_len=(short)(ownerUser.getNick().length()+ownerUser.getFirst().length()+ownerUser.getLast().length()+ownerUser.getEmail().length()+msg.length()+auth.length()+6);
    //---------------------
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)SEND_MESSAGE));
		dataO.write(u.short2BytesSW(ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.int2BytesSW(remote_uin));
		dataO.write(u.short2BytesSW(msg_type));
		dataO.write(u.short2BytesSW(msg_len));
    dataO.write(ownerUser.getNick().getBytes());
    dataO.writeByte((byte)0xFE);
    dataO.write(ownerUser.getFirst().getBytes());
    dataO.writeByte((byte)0xFE);
    dataO.write(ownerUser.getLast().getBytes());
    dataO.writeByte((byte)0xFE);
    dataO.write(ownerUser.getEmail().getBytes());
    dataO.writeByte((byte)0xFE);
    dataO.write(auth.getBytes());//------test-------------
		dataO.writeByte((byte)0xFE);
    dataO.write(msg.getBytes());
    dataO.writeByte((byte)0);
		return byteO.toByteArray();
	}

//-------------------------------------------------------------------------------------------------
	public byte[] LOGIN()throws IOException  //1000
	{	ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)LOGIN));
		dataO.write(u.short2BytesSW(ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.short2BytesSW(ownerUser.getMessagePort()));
		dataO.writeShort((short)0);  /// ??????????????????????????
		dataO.write(u.short2BytesSW((short)(ownerUser.getPWD().length()+1)));
		dataO.write(ownerUser.getPWD().getBytes());
		dataO.writeByte((byte)0);
		dataO.writeInt((int)0x72000400);
		dataO.writeInt(ownerUser.getIP());
		dataO.writeByte((byte)4);
		dataO.writeInt(ownerUser.getUserStatus());
		dataO.writeInt((int)0x03000000);
		dataO.write(u.int2BytesSW(ownerUser.getLoginSeqNumber()));
		dataO.writeInt((int)0x00000400);//?????????????????????????
		dataO.writeShort((short)0x7200);//?????????????????????????
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
/*///	public byte[] REG_NEW_USER(String password)throws IOException //1020
	{	///incSeqNum();
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)REG_NEW_USER));
		dataO.write(u.short2BytesSW((short)getSeqNum()));
		dataO.writeShort((short)0x0200);
		dataO.write(u.short2BytesSW((short)(password.length()+1)));
		dataO.write(password.getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.writeInt(0x72000000);
		dataO.writeInt(0x6de70e00);
		decSearchSeq();
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
*/
	public byte[] CONTACT_LIST(Vector contactUser)throws IOException // 1030
	{
		byte num_contacts=(byte)contactUser.size();
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)CONTACT_LIST));
		dataO.write(u.short2BytesSW(ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.writeByte(num_contacts);
		for (int i=0;i<num_contacts ;i++ )
		{
      ContactUserInfo cUser=(ContactUserInfo)contactUser.elementAt (i);
			dataO.write(u.int2BytesSW(cUser.getUIN()));
		}
		return byteO.toByteArray();
	}

//-------------------------------------------------------------------------------------------------
	public byte[] SEARCH_UIN(int search_uin)throws IOException //1050
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)SEARCH_UIN));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.short2BytesSW(ownerUser.getSearchSeqNumber()));
		dataO.write(u.int2BytesSW(search_uin));
	  return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] SEARCH_USER(UserBasicInfo user)throws IOException //1060
	{
		short search_seq=(short)0xefff;
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)SEARCH_USER));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.short2BytesSW(ownerUser.getSearchSeqNumber()));
		dataO.write(u.short2BytesSW((short)(user.getNick().length()+1)));
		dataO.write(user.getNick().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(user.getFirst().length()+1)));
		dataO.write(user.getFirst().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(user.getLast().length()+1)));
		dataO.write(user.getLast().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(user.getEmail().length()+1)));
		dataO.write(user.getEmail().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		return byteO.toByteArray();
	}

//-------------------------------------------------------------------------------------------------
	public byte[] KEEP_ALIVE() throws IOException //1070
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)KEEP_ALIVE));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] KEEP_ALIVE2() throws IOException //1310
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)KEEP_ALIVE2));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] DISCONNECT() throws IOException //1080
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)SEND_TEXT_CODE));
		dataO.write(u.short2BytesSW(ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.short2BytesSW((short)20));
		dataO.writeBytes("B_USER_DISCONNECTED");
		dataO.writeByte((byte)0);
		dataO.write(u.short2Bytes((short)0x0500));
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] ACK_MESSAGES()throws IOException //1090
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)ACK_MESSAGES));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------

	public byte[] LOGIN_1() throws IOException //1100
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)LOGIN_1));
		dataO.write(u.short2BytesSW(ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.short2BytesSW((short)19));
		dataO.write(u.short2Bytes((short)0x0500));
		return byteO.toByteArray();
	}

  //-------------------------------------------------------------------------------------------------
	public byte[] INFO_REQ(int search_uin)throws IOException //1120
	{

		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)INFO_REQ));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.short2BytesSW((short)ownerUser.getInfoSeqNumber()));
		dataO.write(u.int2BytesSW(search_uin));
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
/*	public byte[] CHANGE_PW(String pwd)throws IOException //1180
	{
		incSeqNum();
		short pwd_seq_num=(short)0xbefc;
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)CHANGE_PW));
		dataO.write(u.short2BytesSW((short)getSeqNum()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.short2BytesSW(pwd_seq_num));
		dataO.write(u.short2BytesSW((short)(pwd.length()+1)));
		dataO.write(pwd.getBytes());
		dataO.writeByte((byte)0);// end null (end string)
		return byteO.toByteArray();
	}*/
//-------------------------------------------------------------------------------------------------
	public byte[] NEW_USER_INFO()throws IOException //1190
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)NEW_USER_INFO));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.short2BytesSW((short)(ownerUser.getNick().length()+1)));
		dataO.write(ownerUser.getNick().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(ownerUser.getFirst().length()+1)));
		dataO.write(ownerUser.getFirst().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(ownerUser.getLast().length()+1)));
		dataO.write(ownerUser.getLast().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(ownerUser.getEmail().length()+1)));
		dataO.write(ownerUser.getEmail().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.writeByte(ownerUser.getAuth());
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] AUTH_UPDATE()throws IOException //1050
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)AUTH_UPDATE));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.short2BytesSW(ownerUser.getUpdateInfoSeqNumber()));
		dataO.write(ownerUser.getAuth());
	  return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
  public byte[] UPDATE_INFO()throws IOException //1190
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)UPDATE_INFO));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
    dataO.write(u.short2BytesSW(ownerUser.getUpdateInfoSeqNumber()));
		dataO.write(u.short2BytesSW((short)(ownerUser.getNick().length()+1)));
		dataO.write(ownerUser.getNick().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(ownerUser.getFirst().length()+1)));
		dataO.write(ownerUser.getFirst().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(ownerUser.getLast().length()+1)));
		dataO.write(ownerUser.getLast().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(ownerUser.getEmail().length()+1)));
		dataO.write(ownerUser.getEmail().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		return byteO.toByteArray();
	}

//-------------------------------------------------------------------------------------------------
  public byte[] UPDATE_EXT_INFO()throws IOException //1190
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)UPDATE_EXT_INFO));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
    dataO.write(u.short2BytesSW(ownerUser.getUpdateInfoSeqNumber()));
		dataO.write(u.short2BytesSW((short)(ownerUser.getCity().length()+1)));
		dataO.write(ownerUser.getCity().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(ownerUser.getCountryCode())));
		dataO.writeByte(ownerUser.getCountryStatus());
		dataO.write(u.short2BytesSW((short)(ownerUser.getState().length()+1)));// end null (end string)
    dataO.write(ownerUser.getState().getBytes());
    dataO.writeByte((short)0);
    dataO.write(u.short2BytesSW((short)(ownerUser.getAge())));
    dataO.writeByte(ownerUser.getSex());
		dataO.write(u.short2BytesSW((short)(ownerUser.getPhone().length()+1)));
		dataO.write(ownerUser.getPhone().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		dataO.write(u.short2BytesSW((short)(ownerUser.getHomepage().length()+1)));
		dataO.write(ownerUser.getHomepage().getBytes());
		dataO.writeByte((short)0);// end null (end string)
    dataO.write(u.short2BytesSW((short)(ownerUser.getAbout().length()+1)));
		dataO.write(ownerUser.getAbout().getBytes());
		dataO.writeByte((short)0);// end null (end string)
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] EXT_INFO_REQ(int search_uin)throws IOException //1230
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)EXT_INFO_REQ));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.short2BytesSW(ownerUser.getInfoSeqNumber()));
		dataO.write(u.int2BytesSW(search_uin));
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] ADD_TO_LIST(int addUIN)throws IOException //1340
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)ADD_TO_LIST));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.int2BytesSW(addUIN));
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------
	public byte[] STATUS_CHANGE(int status)throws IOException //1240(D8 04)
	{
		ByteArrayOutputStream byteO=new ByteArrayOutputStream();
		DataOutputStream dataO=new DataOutputStream(byteO);
		dataO.write(u.short2BytesSW(version));
		dataO.write(u.short2BytesSW((short)STATUS_CHANGE));
		dataO.write(u.short2BytesSW((short)ownerUser.getSeqNumber()));
		dataO.write(u.int2BytesSW(ownerUser.getUIN()));
		dataO.write(u.int2BytesSW(status));
		return byteO.toByteArray();
	}
//-------------------------------------------------------------------------------------------------

}