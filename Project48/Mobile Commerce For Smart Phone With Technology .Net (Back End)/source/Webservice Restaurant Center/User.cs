using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for User.
	/// </summary>
	public class User
	{
		private string name;
		private string address;
		private string telephone;
		private string identify;
		private string username;
		private string password;
		public User()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public  string Name
		{
			get{  return this.name; }
			set{ this.name = value; }
		}
		public  string Address
		{
			get{  return this.address; }
			set{ this.address= value; }
		}
		public  string Talephone
		{
			get{  return this.telephone; }
			set{ this.telephone = value; }
		}
		public  string Identify
		{
			get{  return this.identify; }
			set{ this.identify = value; }
		}
		public  string Username
		{
			get{  return this.username; }
			set{ this.username = value; }
		}
		public  string Password
		{
			get{  return this.password; }
			set{ this.password = value; }
		}

		/*
		public void setName(string name)
		{ this.name = name; }
		public string getName()
		{ return name;}
		public void setAddress(string address)
		{  this.address = address;}
		public string getAddress()
		{ return address;}
		public void setIdentify(string identify)
		{ this.identify = identify;}
		public string getIdentify()
		{ return identify; }
		public void setUsername(string username)
		{ this.username = username;}
		public string getUsername()
		{ return username;}
		public void setPassword(string password)
		{ this.password = password;}
		public string getPassword()
		{ return password;}
		*/
	}
}
