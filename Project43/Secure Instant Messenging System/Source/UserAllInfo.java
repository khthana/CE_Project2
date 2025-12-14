import		java.math.BigInteger;
import		java.net.*;
import		java.io.*;
import		java.awt.TextArea;
import    java.util.*;
public class UserAllInfo
{
  static  int c_Online   =0x00000000;
  static  int c_Away     =0x00000001;
  static  int c_Dnd      =0x00000013;
  static  int c_Invisible=0x00000100;
  static  int c_Occupied =0x00000010;
  static  int c_Na       =0x00000004;
  static  int c_Offline  =-1;
//-------------------------------------
  static  short c_NoMsg       =0x0000;
  static  short c_MsgText     =0x0001;
  static  short c_MsgFile     =0x0003;
  static  short c_MsgURL      =0x0004;
  static  short c_MsgAuthReq  =0x0006;
  static  short c_MsgAuthIgnore=0x0007;
  static  short c_MsgAuthGrant=0x0008;
  static  short c_MsgUserAdd  =0x000c;
  static  short c_MsgContact  =0x0013;
//-------------------------------------
  static  byte  c_Auth         =0x00;
  static  byte  c_Alway        =0x01;



  Util    u=new Util();
  private boolean online = false ,secure = false;

	private String	password = "" ,nick = "" ,first = "" ,last = "" ,email = "" ;
	private String	city = "" ,state = "" ,phone = "" ,homepage = "" ,about = "";
	private String	IPString = "" ,displayString = "";
	private byte		authorize = 0 ,countryStatus = 0 ,sex = 0;
	private int			uin=0 ,IP = 0 ,realIP = 0,userStatus = -1;
	private short	  messagePort=0,filePort = 0,countryCode = 0 ,age = 0;

 	private BigInteger E =new BigInteger("0");
	private BigInteger N =new BigInteger("0");
	private BigInteger D =new BigInteger("0");
	private byte[]	  DES=new byte[0];

	public void setUserBasicInfo(UserBasicInfo uinfo)
	{	uin       = uinfo.getUIN();
		nick      = uinfo.getNick();
		first     = uinfo.getFirst();
		last      = uinfo.getLast();
		email     = uinfo.getEmail();
		authorize = uinfo.getAuth();
	}

	public void setUserOnlineInfo (UserOnlineInfo uoninfo) throws UnknownHostException ,IOException
	{
    uin          = uoninfo.getUIN();
		IP           = uoninfo.getIP();
		realIP       = uoninfo.getReal_IP();
		userStatus   = uoninfo.getUserStatus();
		messagePort  = uoninfo.getMessagePort();
    filePort     = uoninfo.getFilePort();
		IPString     = u.IPint2String(IP);
	}

	public void setUserExtInfo(UserExtInfo uextinfo)
	{	city            = uextinfo.getCity();
    countryCode     = uextinfo.getCountryCode();
		countryStatus   = uextinfo.getCountryStatus();
		state           = uextinfo.getState();
		age             = uextinfo.getAge();
		sex             = uextinfo.getSex();
		phone           = uextinfo.getPhone();
		homepage        = uextinfo.getHomepage();
		about           = uextinfo.getAbout();
	}
//---------------------------------------------------------------------
	public void setUIN(int uin)			      {this.uin = uin;}
	public void setPWD(String pwd)		    {this.password = pwd;}
	public void setNick(String nick)	    {this.nick = nick;}
	public void setFirst(String first)		{this.first = first;}
	public void setLast(String last)		  {this.last = last;}
	public void setEmail(String email)	  {this.email = email;}
	public void setAuth(byte auth)		    {this.authorize = auth;}
	public void setCity(String city)		  {this.city = city;}
	public void setCountryCode(short ctcode){this.countryCode = ctcode;}
	public void setCountryStatus(byte ctstatus){this.countryStatus= ctstatus;}
	public void setState(String state)	  {this.state =  state;}
	public void setAge(short age)		      {this.age = age;}
	public void setSex(byte sex)		      {this.sex = sex;}
	public void setPhone(String phone)	  {this.phone = phone;}
	public void setHomepage(String hp)		{this.homepage = hp;}
	public void setAbout(String about)	  {this.about = about;}
	public void setIP(int ip)
  {
      IP = ip;
      realIP = ip;
      IPString=u.IPint2String(IP);
  }
	public void setIP(byte[] ip)
	{
		int ip1;
		ip1=u.bytes2Int(ip);
		IP=ip1;realIP=ip1;
    IPString=u.IPint2String(IP);

	}
	public void setReal_IP(int ip)				{this.realIP = ip;}
	public void setMessagePort(short port){this.messagePort = port;}
  public void setFilePort(short port)   {this.filePort = port;}
	public void setUserStatus(int status) {this.userStatus = status;}
  public void setDisplayString(String displayStr){this.displayString = displayStr;}
	public void setOffline()
	{
  	online = false;
   	secure = false;
 	}
	public void setOnline()	  {online = true;}
	public void setSecure()		{secure = true;}
	public void setKey_E		(BigInteger e)	{E = e;}
	public void setKey_D		(BigInteger d)	{D = d;}
	public void setKey_N		(BigInteger n)	{N = n;}
	public void setKey_DES	(byte[] des)		{DES = des;}

//---------------------------------------------------------------------
	public int			getUIN()			  {return uin;}
	public String	  getPWD()		    {return password;}
	public String	  getNick()			  {return nick;}
	public String	  getFirst()		  {return first;}
	public String	  getLast()			  {return last;}
	public String	  getEmail()		  {return email;}
	public byte		  getAuth()			  {return authorize;}
	public String	  getCity()			  {return city;}
	public short		getCountryCode(){return countryCode;}
	public byte		  getCountryStatus(){return countryStatus;}
	public String	  getState()		  {return state;}
	public short		getAge()			  {return age;}
	public byte		  getSex()			  {return sex;}
	public String	  getPhone()		  {return phone;}
	public String	  getHomepage()		{return homepage;}
	public String	  getAbout()		  {return about;}
	public int			getIP()				  {return IP;}
	public String	  getIPStr()			{return IPString;}
	public short		getMessagePort(){return messagePort;}
 	public short		getFilePort()   {return filePort;}
	public int			getRealIP()	    {return realIP;}
	public int			getUserStatus()	{return userStatus;}
	public String	  getDisplayString(){return displayString;}
	public boolean	getOnline()	    {return online;}
	public boolean	getSecure()	    {return secure;}
	public BigInteger getKey_E()	  {return E;}
	public BigInteger getKey_D()	  {return D;}
	public BigInteger getKey_N()	  {return N;}
	public byte[]			getKey_DES()	{return DES;}


}