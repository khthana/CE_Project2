using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for Address.
	/// </summary>
	public class Address
	{
		private string province;
		private string amphur;
		private string district;
		private string zone;
		private int zipcode;
		private string road;
		public Address()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public Address(string province,string amphur,string district,string zone,int zipcode,string road)
		{
			this.province = province;
			this.amphur = amphur;
			this.district = district;
			this.zone = zone;
			this.zipcode = zipcode;
			this.road = road;
		}

		public string Province
		{
			get{ return province; }
			set{ province = value; }
		}
		public string Amphur
		{
			get{ return amphur; }
			set{ amphur = value; }
		}
		public string District
		{
			get{ return district; }
			set{ district = value; }
		}
		public string Zone
		{
			get{ return zone; }
			set{ zone = value; }
		}
		public int Zipcode
		{
			get{ return zipcode;}
			set{ zipcode = value;}
		}
		public string Road
		{
			get{return this.road;}
			set{this.road = value;}
		}
	}
}
