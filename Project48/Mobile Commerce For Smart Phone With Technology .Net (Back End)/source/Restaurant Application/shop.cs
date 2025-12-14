using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for shop.
	/// </summary>
	public class shop
	{
		private int shopID;
		private string shopName;
		private string number;
		private string soi;
		private string road;
		private string district;
		private string amphur;
		private string province;
		private string postcode;
		private string telephone;
		private float latijude;
		private float longtijude;
		private string type;

		public shop()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public shop(int shopID,string shopName,string number,string soi,string road,
					string district,string amphur,string province,string postcode,
					string telephone,float latijude,float longtijude,string type)
		{
			this.shopID = shopID;
			this.shopName = shopName;
			this.number = number;
			this.soi = soi;
			this.road = road;
			this.district = district;
			this.amphur = amphur;
			this.province = province;
			this.postcode = postcode;
			this.telephone = telephone;
			this.latijude = latijude;
			this.longtijude = longtijude;
			this.type = type;
			
		}

		public int getShopID()
		{
			return shopID;
		}
		public void setShopID(int shopID)
		{
			this.shopID = shopID;
		}

		public string getShopName()
		{
			return shopName;
		}
		public void setShopName(string shopName)
		{
			this.shopName = shopName;
		}

		public string getNumber()
		{
			return number;
		}
		public void setNumber(string number)
		{
			this.number = number;
		}

		public string getSoi()
		{
			return soi;
		}
		public void setSoi(string soi)
		{
			this.soi = soi;
		}

		public string getRoad()
		{
			return road;
		}
		public void setRoad(string road)
		{
			this.road = road;
		}

		public string getDistrict()
		{
			return district;
		}
		public void setDistrict(string district)
		{
			this.district = district;
		}

		public string getAmphur()
		{
			return amphur;
		}
		public void setAmphur(string amphur)
		{
			this.amphur = amphur;
		}

		public string getProvince()
		{
			return province;
		}
		public void setProvince(string province)
		{
			this.province = province;
		}

		public string getPostcode()
		{
			return postcode;
		}
		public void setPostcode(string postcode)
		{
			this.postcode = postcode;
		}

		public string getTelephone()
		{
			return telephone;
		}
		public void setTelephone(string telephone)
		{
			this.telephone = telephone;
		}

		public float getLatijude()
		{
			return latijude;
		}
		public void setLatijude(float latijude)
		{
			this.latijude = latijude;
		}

		public float getLongtijude()
		{
			return longtijude;
		}
		public void setLongtijude(float longtijude)
		{
			this.longtijude = longtijude;
		}

		public string getType()
		{
			return type;
		}
		public void setType(string type)
		{
			this.type = type;
		}
	}
}
