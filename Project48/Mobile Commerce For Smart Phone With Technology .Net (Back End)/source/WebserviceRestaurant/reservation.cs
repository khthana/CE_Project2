using System;
using System.Data;

namespace WebserviceRestaurant
{
	/// <summary>
	/// Summary description for reservation.
	/// </summary>
	public class reservation
	{
		private int reservationID;
		private int shopID;
		private int tableID;
		private string shopName;
		private string name;
		private string lastname;
		private string useTime;
		private string reservTime;
		private string endTime;
		private string status;

		public reservation()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public reservation(int reservationID,int shopID,int tableID,string shopName,string name,string lastname,
			string useTime,string reservTime,string endTime,string status)
		{
			this.reservationID = reservationID;
			this.shopID = shopID;
			this.tableID = tableID;
			this.shopName = shopName;
			this.name = name;
			this.lastname = lastname;
			this.useTime = useTime;
			this.reservTime = reservTime;
			this.endTime = endTime;
			this.status = status;
		}

		public int getReservationID()
		{
			return reservationID;
		}

		public void setReservationID(int reservationID)
		{
			this.reservationID = reservationID;
		}

		public int getShopID()
		{
			return shopID;
		}

		public void setShopID(int shopID)
		{
			this.shopID = shopID;
		}

		public int getTableID()
		{
			return tableID;
		}

		public void setTableID(int tableID)
		{
			this.tableID = tableID;
		}

		public string getShopName()
		{
			return shopName;
		}
		public void setShopName(string shopName)
		{
			this.shopName = shopName;
		}

		public string getName()
		{
			return name;
		}
		public void setName(string name)
		{
			this.name = name;
		}

		public string getLastName()
		{
			return lastname;
		}
		public void setLastName(string lastname)
		{
			this.lastname = lastname;
		}

		public string getUseTime()
		{
			return useTime;
		}
		public void setUseTime(string useTime)
		{
			this.useTime = useTime;
		}
		
		public string getReservTime()
		{
			return reservTime;
		}
		public void setReservTime(string reservTime)
		{
			this.reservTime = reservTime;
		}
		
		public string getEndTime()
		{
			return endTime;
		}
		public void setEndTime(string endTime)
		{
			this.endTime = endTime;
		}

		public string getStatus()
		{
			return status;
		}
		public void setStatus(string status)
		{
			this.status = status;
		}

		//--------------------For Webservice--------------------
		public int ReservationID
		{
			get{ return reservationID; }
			set{ reservationID = value; }
		}
		public int ShopID
		{
			get{ return shopID; }
			set{ shopID = value; }
		}
		public int TableID
		{
			get{ return tableID; }
			set{ tableID = value; }
		}
		public string ShopName
		{
			get{ return shopName; }
			set{ shopName = value; }
		}
		public string Name
		{
			get{ return name; }
			set{ name = value; }
		}
		public string LastName
		{
			get{ return lastname; }
			set{ lastname = value; }
		}
		public string UseTime
		{
			get{ return useTime; }
			set{ useTime = value; }
		}
		public string ReservTime
		{
			get{ return reservTime; }
			set{ reservTime = value; }
		}
		public string EndTime
		{
			get{ return endTime; }
			set{ endTime = value; }
		}

	}
}
