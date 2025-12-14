using System;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Collections;
using Npgsql;


namespace Restaurant
{
	/// <summary>
	/// Summary description for RestaurantAD.
	/// </summary>
	public class RestaurantAD
	{
		public static string name;		
		public static string telephone;
		public static Menu menu;
		public static RMap map;
		public static Position position;
		public static Address address;
		public static Promotion promotion;
		public static string type;

		NpgsqlConnection aCon;
		
		public RestaurantAD()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public bool connected()
		{
		    bool pass = false;
			try
			{
				aCon = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=restaurant;Password=mclonly;Database=RestaurantService;");			
				aCon.Open();  
				pass = true;
			}
			catch(Exception e)
			{
				
			}
			
			return pass;
		}


		public void closeConnection()
		{
			//connect.Close();
			//dbReader.Close();
		}
		public void addRes(Restaurant res) 
		{
			
		}
		public void deleteRes(string name)
		{}
		public void updateRes(Restaurant res)
		{}
		
		
	}
}
