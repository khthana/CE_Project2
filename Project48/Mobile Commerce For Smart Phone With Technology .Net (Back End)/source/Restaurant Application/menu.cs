using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for menu.
	/// </summary>
	public class menu
	{
		private int menuID;
		private string menuName;
		private string menuType;
		private int cost;
		private string other;
		private byte[] pic;

		public menu()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public menu(int menuID,string menuName,string menuType,int cost,string other,byte[] pic)
		{
			this.menuID = menuID;
			this.menuName = menuName;
			this.menuType= menuType;
			this.cost = cost;
			this.other = other;
			this.pic = pic;
		}

		public int getMenuID()
		{
			return menuID;
		}
		public void setMenuID(int menuID)
		{
			this.menuID = menuID;
		}

		public string getMenuName()
		{
			return menuName;
		}
		public void setMenuName(string menuName)
		{
			this.menuName = menuName;
		}

		public string getMenuType()
		{
			return menuType;
		}
		public void setCardID(string menuType)
		{
			this.menuType = menuType;
		}

		public int getCost()
		{
			return cost;
		}
		public void setCost(int cost)
		{
			this.cost = cost;
		}

		public string getOther()
		{
			return other;
		}
		public void setOther(string other)
		{
			this.other = other;
		}

		public byte[] getPicture()
		{
			return pic;
		}
		public void setPicture(byte[] pic)
		{
			this.pic = pic;
		}
	}
}
