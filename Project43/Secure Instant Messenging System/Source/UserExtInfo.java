public class UserExtInfo 
{
  private int			uin=0;
	private String	city="" ,state="" ,phone="" ,homepage="" ,about="";
	private short	  countryCode=0 ,age=0;
	private byte		countryStatus=0 ,sex=0;


	public void setUIN(int		uin)		    	{this.uin=uin;}
	public void setCity(String city)	 	    {this.city=city;}
	public void setCountryCode(short	code)	{countryCode=code;}
	public void setCountryStatus(byte	cstatus){countryStatus=cstatus;}
	public void setState(String state)		  {this.state=state;}
	public void setAge(short	age)			    {this.age=age;}
	public void setSex(byte	sex)			      {this.sex=sex;}
	public void setPhone(String phone)		  {this.phone=phone;}
	public void setHomepage(String homepage){this.homepage=homepage;}
	public void setAbout(String about)		  {this.about=about;}


	public int 		getUIN()					{return uin;}
	public String	getCity()					{return city;}
	public short	getCountryCode()	{return countryCode;}
	public byte		getCountryStatus(){return countryStatus;}
	public String	getState()				{return state;}
	public short	getAge()					{return age;}
	public byte		getSex()					{return sex;}
	public String	getPhone()				{return phone;}
	public String	getHomepage()		  {return homepage;}
	public String	getAbout()				{return about;}
}