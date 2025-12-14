using System;
using System.Data.SqlClient;
using System.Data.OleDb;

namespace Restaurant
{
	/// <summary>
	/// Summary description for Restaurant.
	/// </summary>
	public class Restaurant 
	{
		private int id_restaurant;
		private string name;
		private string telephone;
		private string type;
		private Position position;
		private Address address;
		private string valid;
		private string reserve;
		public Restaurant(){}
		public Restaurant(int id_restaurant,string name,string telephone,string type,Position position,Address address,string valid,string reserve)
		{
			this.id_restaurant = id_restaurant;
			this.name = name;
			this.telephone = telephone;
			this.position = position;
			this.address = address;
			this.type = type;
			this.valid = valid;
			this.reserve = reserve;
		}
		

		
		public int ID_restaurant
		{
			get{return id_restaurant;}
			set{id_restaurant = value;}
		}
		public string Name
		{
			get{ return name; }
			set{ name = value; }
		}	
		public string Telephone
		{
			get{ return telephone; }
			set{ telephone = value; }
		}
		public string Type
		{
			get{ return type;}
			set{ type = value;}
		}
		public Position Position
		{
			get{ return position;}
			set{ position = value;}
		}
		public Address Address
		{
			get{ return address;}
			set{ address = value;}
		}
		public string Valid
		{
			get{ return valid;}
			set{ valid = value;}
		}
		public string Reserve
		{
			get{ return reserve;}
			set{ reserve = value;}
		}
		
	}
}
