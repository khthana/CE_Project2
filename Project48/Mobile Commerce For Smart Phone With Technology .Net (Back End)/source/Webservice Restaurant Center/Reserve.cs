using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for Reserve.
	/// </summary>
	public class Reserve
	{
		private Restaurant restaurant;
		//private User user;
		private String time;
		private String endTime;
		private int table;
		public Reserve()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public Reserve(Restaurant res,string time,int table)
		{
			this.restaurant = res;
			this.time = time;
			this.table = table;
		}
		public Reserve(Restaurant res,string time,string endTime,int table)
		{
			this.restaurant = res;
			this.time = time;
			this.table = table;
			this.endTime = endTime;
		}
		public Restaurant Restaurant
		{
			get {   return this.restaurant; }
			set {	this.restaurant = value; }
		}
		/*
		public User User
		{
			get { return this.user; }
			set { this.user = value; }
		}
		*/
		public String EndTime
		{
			get { return this.endTime;}
			set {this.endTime = value;}
		}
		public String Time
		{
			get { return this.time;}
			set {this.time = value;}
		}
		public int Table
		{
			get { return this.table; }
			set { this.table = value;}
		}

	}
}
