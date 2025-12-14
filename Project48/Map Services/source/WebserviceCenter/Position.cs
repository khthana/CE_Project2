using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for Position.
	/// </summary>
	public class Position
	{
		private double latitude;
		private double longitude;
		public Position()
		{}
		public Position(double latitude,double longitude)
		{
			this.latitude = latitude;
			this.longitude = longitude;
		}

		/*
		public void setLatitude(float latitude)
		{ this.latitude = latitude;}
		public float getLatitude()
		{ return latitude;}
		public void setLongitude(float longitude)
		{ this.longitude = longitude;}
		public float getLongitude()
		{ return longitude;}
*/
		// use in webservice
		public double Latitude
		{
			get{ return latitude; }
			set{ latitude = value; }
		}
		public double Longitude
		{
			get{ return longitude; }
			set{ longitude = value; }
		}	
	}
}
