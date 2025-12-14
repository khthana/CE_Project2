using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for ROwner.
	/// </summary>
	public class ROwner : User
	{
		private string restaurantID;
		public ROwner()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public void setRestaurantID(string restaurantID)
		{ this.restaurantID = restaurantID;}
		public string getRestaurantID()
		{ return restaurantID;}
	}
}
