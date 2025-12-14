
public class ExtractServerData
{
	Util u=new Util();
  OwnerUserInfo oUserInfo;

ExtractServerData(OwnerUserInfo oUserInfo)
{
  this.oUserInfo=oUserInfo;
}
//------------------------------get version ------------------
public short getVersion(byte[] data)
{
  byte[] tmp=new byte[2];
  short  version=0;
      tmp[0]=data[0];
    	tmp[1]=data[1];
      version=u.bytes2ShortSW(tmp);
  return version;
}
//------------------------------get command ------------------
public short getCommand(byte[] data)
{
  byte[] tmp=new byte[2];
  short  command=0;
      tmp[0]=data[2];
    	tmp[1]=data[3];
      command=u.bytes2ShortSW(tmp);
  return command;
}

//------------------------------get seq ------------------
public short getSeq(byte[] data)
{
  byte[] tmp=new byte[2];
  short  seq=0;
      tmp[0]=data[4];
    	tmp[1]=data[5];
      seq=u.bytes2ShortSW(tmp);
  return seq;
}
//------------------------------get ext seq ------------------
public short getExtSeq(byte[] data)
{
  byte[] tmp=new byte[2];
  short  extSeq=0;
      tmp[0]=data[6];
    	tmp[1]=data[7];
      extSeq=u.bytes2ShortSW(tmp);
  return extSeq;
}

//----------------------------- NEW UIN -----------------------------------------------------
	public int NEW_UIN(byte[] data)	// 70
	{	return u.bytes2IntSW(u.copyBytes(data,8,4));
	}
//----------------------------- USER ONLINE -----------------------------------------------------
	public UserOnlineInfo  USER_ONLINE(byte[] data) // 6E 00 (110)
	{
    int index=6;
		UserOnlineInfo uoi=new UserOnlineInfo();
    //------------
  	uoi.setUIN(u.bytes2IntSW(u.copyBytes(data,6,4)));
		uoi.setIP(u.bytes2Int(u.copyBytes(data,10,4)));
		uoi.setMessagePort(u.bytes2ShortSW(u.copyBytes(data,14,2)));
		uoi.setUserStatus(u.bytes2IntSW(u.copyBytes(data,23,4)));
    //---------
		return uoi;
	}
//----------------------------- USER OFFLINE --------------------------------------------------------
	public int  USER_OFFLINE(byte[] data) // 78 00 (120)
	{	return u.bytes2IntSW(u.copyBytes(data,6,4));
	}
//----------------------------- USER FOUND ---------------------------------------------------------
	public ContactUserInfo USER_FOUND(byte[] data) // 8C 00 (140)
	{
		int index=6;
		short nick_len,  first_len,  last_len,  email_len,    search_seq;
		ContactUserInfo uinfo=new ContactUserInfo(oUserInfo);

		search_seq=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index=index+2;
		uinfo.setUIN(u.bytes2IntSW(u.copyBytes(data,index,4)));
		index=index+4;
		nick_len	=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index		=index+2;
		uinfo.setNick(new String(data,index,(int)(nick_len-1)));
		index		=index+nick_len;
		first_len	=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index		=index+2;
		uinfo.setFirst(new String(data,index,(int)(first_len-1)));
		index		=index+first_len;
		last_len	=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index		=index+2;
		uinfo.setLast(new String(data,index,(int)(last_len-1)));
		index		=index+last_len;
		email_len	=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index		=index+2;
		uinfo.setEmail(new String(data,index,(int)(email_len-1)));
		index		=index+email_len;
		uinfo.setAuth(data[index]);
		return uinfo;
	}
	//------------------------RECEIVE MESSAGE------------------------------------------------------------------
	int senderUIN;
	short year;
	byte month,day,hour,minute;
	short msg_type,msg_len;
	String rcv_msg="";

	public void RECV_MESSAGE(byte[] data) // DC 00 (220)
	{	senderUIN = u.bytes2IntSW(u.copyBytes(data,6,4));
		year = u.bytes2ShortSW(u.copyBytes(data,10,2));
		month = data[12];
		day  =   data[13];
		hour = data[14];
		minute = data[15];
		msg_type = u.bytes2ShortSW(u.copyBytes(data,16,2));
		msg_len = u.bytes2ShortSW(u.copyBytes(data,18,2));
		rcv_msg = new String(data,20,(int)(msg_len-1));
	}
	public int    getSender() {return senderUIN;}
	public String getDate()		{return day+"/"+month+"/"+year;}
	public String getTime()		{return hour+":"+minute;}
	public short  getMsgType(){return msg_type;}
	public short  getMsgLen()	{return msg_len;}
	public String getMessage(){return rcv_msg;}
	//--------------------------SYS DELIVERED MESS-------------------------------------------------------------
	public void SYS_DELIVERED_MESS(byte[] data) //  04 01 (260)
	{	senderUIN=u.bytes2IntSW(u.copyBytes(data,6,4));
		msg_type=u.bytes2ShortSW(u.copyBytes(data,10,2));
		msg_len=u.bytes2ShortSW(u.copyBytes(data,12,2));
		rcv_msg=new String(data,14,(int)(msg_len-1));
	}
  //-----------------------------INFO REPLY-----------------------------------------------------
	public UserBasicInfo INFO_REPLY(byte[] data) // 18 01  ()
	{
		int index=6;
		short nick_len,  first_len,  last_len,  email_len,    search_seq;
		UserBasicInfo uinfo=new UserBasicInfo();
		index=index+2;
		uinfo.setUIN(u.bytes2IntSW(u.copyBytes(data,index,4)));
		index=index+4;
		nick_len	=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index		=index+2;
		uinfo.setNick(new String(data,index,(int)(nick_len-1)));
		index		=index+nick_len;
		first_len	=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index		=index+2;
		uinfo.setFirst(new String(data,index,(int)(first_len-1)));
		index		=index+first_len;
		last_len	=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index		=index+2;
		uinfo.setLast(new String(data,index,(int)(last_len-1)));
		index		=index+last_len;
		email_len	=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index		=index+2;
		uinfo.setEmail(new String(data,index,(int)(email_len-1)));
		index		=index+email_len;
		uinfo.setAuth(data[index]);
		return uinfo;
	}

	//-----------------------------EXT INFO REPLY-----------------------------------------------------
	public UserExtInfo EXT_INFO_REPLY(byte[] data) // 22 01 (290)
	{	short search_seq ,city_len ,state_len ,phone_len ,page_len ,about_len;
		int index=6;
		UserExtInfo uextinfo=new UserExtInfo();
		index	+=2;
		uextinfo.setUIN(u.bytes2IntSW(u.copyBytes(data,index,4)));
		index	+=4;
		city_len	=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index	+=2;
		uextinfo.setCity(new String(data,index,(int)(city_len-1)));
		index	+=city_len;
		uextinfo.setCountryCode(u.bytes2ShortSW(u.copyBytes(data,index,2)));
		index	+=2;
		uextinfo.setCountryStatus(data[index]);
		index++;
		state_len	=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index	+=2;
		uextinfo.setState(new String(data,index,(int)(state_len-1)));
		index	+=state_len;
		uextinfo.setAge(u.bytes2ShortSW(u.copyBytes(data,index,2)));
		index	+=2;
		uextinfo.setSex(data[index]);
		index++;
		phone_len=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index	+=2;
		uextinfo.setPhone(new String(data,index,(int)(phone_len-1)));
		index	+=phone_len;
		page_len=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index	+=2;
		uextinfo.setHomepage(new String(data,index,(int)(page_len-1)));
		index	+=page_len;
		about_len=u.bytes2ShortSW(u.copyBytes(data,index,2));
		index	+=2;
		uextinfo.setAbout(new String(data,index,(int)(about_len-1)));
		index	+=about_len;
		return uextinfo;
	}	//--------------------------STATUS UPDATE--------------------------------------------------------------------

	int updateStatus;
	int updateUIN;
	public void STATUS_UPDATE(byte[] data) //420
	{	updateUIN=u.bytes2IntSW(u.copyBytes(data,6,4));
		updateStatus=u.bytes2IntSW (u.copyBytes(data,10,4));
	}
	public int getUpdateUIN(){return updateUIN;}
	public int getUpdateStatus(){return updateStatus;}
}