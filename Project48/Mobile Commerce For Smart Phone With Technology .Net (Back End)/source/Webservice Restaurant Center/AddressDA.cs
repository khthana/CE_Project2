using System;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Collections;
using System.Data;
using Npgsql;

namespace Restaurant
{
	/// <summary>
	/// Summary description for AddressDA.
	/// </summary>
	public class AddressDA
	{
		// connection		
		NpgsqlConnection aCon;

		// Data member
		public static string province;
		public static string aumphur;
		public static string district;
		public static string zone;

		public static Address aAddress;
		public static ArrayList addresss;
		public AddressDA()
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
			aCon.Close();
		}
		// key is name of menu
		public Address find(string key) 
		{
			aAddress = null;
			string sqlQuery = "SELECT province,amphur,district,zone,zipcode FROM restaurant WHERE rname ='"+
				key + "'";
			NpgsqlCommand command = new NpgsqlCommand(sqlQuery,aCon);
			try
			{			
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					string province = (string)dr["province"];
					string amphur = (string)dr["amphur"];
					string district  = (string)dr["district"]; 
					string zone = (string)dr["zone"];
					int zipcode = (int)dr["zipcode"];
					//aAddress = new Address(province,amphur,district,zone,zipcode);										
				}
			}
			catch(Exception e)
			{
				return null;
			}
			return aAddress;					
		}
		
	}
}
