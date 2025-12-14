
public class UserBasicInfo
{
	private int uin=0;
	private String nick="", first="", last="", email="";
	private byte  authorize=0;

	public void setInfo(String nick, String first,  String last, String email,byte auth)
	{		this.nick=nick;	this.first=first;	this.last=last;	this.email=email;	authorize=auth;
	}
	public void setInfo(String nick, String first,  String last, String email)
	{		this.nick=nick;	this.first=first;	this.last=last;	this.email=email;
	}

	public void   setUIN(int uin)		    {this.uin=uin;}
	public void   setNick(String nick)  {this.nick=nick;}
	public void   setFirst(String first){this.first=first;}
	public void   setLast(String last)	{this.last=last;}
	public void   setEmail(String email){this.email=email;}
	public void   setAuth(byte auth)		{authorize=auth;}

	public int    getUIN()	            {return uin;}
	public String getNick()	            {return nick;}
	public String getFirst()		        {return first;}
	public String getLast()		          {return last;}
	public String getEmail()	          {return email;}
	public byte   getAuth()	            {return authorize;}
}