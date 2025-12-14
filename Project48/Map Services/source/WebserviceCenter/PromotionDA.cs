using System;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Collections;
using System.Data;
using Npgsql;

namespace Restaurant
{
	/// <summary>
	/// Summary description for PromotionDA.
	/// </summary>
	public class PromotionDA
	{
		// connection		
		NpgsqlConnection aCon;

		// Data member
		public static string aName;
		public static string aNote;
		public static string aReserve;

		public static Promotion aPromotion;
		public static ArrayList promotions;
		public PromotionDA()
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
			catch
			{
				
			}
			
			return pass;
		}

		public void closeConnection()
		{
			aCon.Close();
		}
		public Promotion find(string key) 
		{
			aPromotion = null; 
			string sqlQuery = "SELECT promotion,note,reserve FROM promotion WHERE promotion ='"+
				key + "'";
			NpgsqlCommand command = new NpgsqlCommand(sqlQuery,aCon);
			try
			{
				
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					String name = (string)dr["promotion"];
					String note = (string)dr["note"];
					String reserve  = (string)dr["reserve"]; 
					aPromotion = new Promotion(name,note,reserve);
										
				}
			}
			catch
			{
				return null;
			}
			return aPromotion;					
		}
		
	}
}
