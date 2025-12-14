using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for UserPoint.
	/// </summary>
	public class UserPoint
	{
		private string iduser;
		private float latitude;
		private float longitude;
		public UserPoint()
		{
		
		}
		public UserPoint(string iduser,float latitude,float longitude)
		{
			this.iduser  = iduser;
			this.latitude = latitude;
			this.longitude = longitude;
		}
		public string IDUser
		{
			get{ return iduser; }
			set{ iduser = value; }
		}
		public float Latitude
		{
			get{ return latitude; }
			set{ latitude = value; }
		}
		public float Longitude
		{
			get{ return longitude; }
			set{ longitude = value; }
		}

	}
}
