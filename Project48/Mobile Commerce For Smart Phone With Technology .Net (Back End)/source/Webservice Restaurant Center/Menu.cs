using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for Menu.
	/// </summary>
	public class Menu
	{
		private string name;
		private string type;
		private int  cost;
		private int tenstar;
		public Menu()
		{
		}
		public Menu(string name,string type,int cost,int tenstar)
		{
			this.name = name;
			this.type = type;
			this.cost = cost;
			this.tenstar = tenstar;
		}
		/*
		public string getName()
		{return name;}
		public void setName(string name)
		{this.name = name;}

		public string getType()
		{return type;}
		public void setType(string type)
		{this.type = type;}

		public float getCost()
		{return cost;}
		public void setcost(int cost)
		{this.cost = cost;}

		public int gettenstar()
		{return tenstar; }
		public void settenstar(int tenstar)
		{this.tenstar = tenstar;}
		

*/
		public string Name
		{
			get{ return name; }
			set{ name = value; }
		}
		public string Type
		{
			get{ return type; }
			set{ type = value; }
		}
		public int Cost
		{
			get{ return cost; }
			set{ cost = value; }
		}
		public int Tenstar
		{
			get{ return tenstar;}
			set{ tenstar = value;}
		}
		
	}
}
