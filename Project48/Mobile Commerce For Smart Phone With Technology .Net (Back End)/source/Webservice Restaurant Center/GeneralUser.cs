using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for GeneralUser.
	/// </summary>
	public class GeneralUser : User
	{
		public GeneralUser()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		/*
		 private string name;
		private string address;
		private string telephone;
		private string identify;
		private string username;
		private string password;
		 */
		public GeneralUser(string name,string address,string telephone,string identify,string username,string password)
		{
			this.Name = name;
			this.Address = address;
			this.Talephone = telephone;
			this.Identify = identify;
			this.Username = username;
			this.Password = password;
		}
	}
}
