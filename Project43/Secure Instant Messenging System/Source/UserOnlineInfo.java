public class  UserOnlineInfo
{
  Util u=new Util();
	private int   uin=0 ,IP=0 ,realIP=0, userStatus=0;
	private short messagePort=0,filePort;

	public int    getUIN()        {return uin;}
	public int    getIP()         {return IP;}
	public short  getMessagePort(){return messagePort;}
  public short  getFilePort()   {return filePort;}
	public int    getReal_IP()    {return realIP;}
	public int    getUserStatus()     {return userStatus;}


	public void setUIN(int uin)  {this.uin=uin;}
	public void setIP(int ip)    {IP=ip;realIP=ip;}
	public void setIP(byte[] ip)
	{
		int ip1;
		ip1=u.bytes2Int(ip);
		IP=ip1;realIP=ip1;
	}

	public void setMessagePort(short mPort){this.messagePort=mPort;}
  public void setFilePort(short fPort)   {this.filePort=fPort;}
	public void setUserStatus(int status)      {this.userStatus=status;}

}