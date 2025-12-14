using System;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Collections;
using System.Data;
using Npgsql;

namespace Restaurant
{
	/// <summary>
	/// Summary description for MenuDA.
	/// </summary>
	 public  class MenuDA
	{
		// connection		
		static NpgsqlConnection aCon;

		// Data member
		public static string aName;
		public static string aType;
		public static string aCost;
		public static int tenstar;

		public static Menu aMenu;
		public static ArrayList menus = new ArrayList();
		public MenuDA()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public bool connected()
		{  
			try
			{
				aCon = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=restaurant;Password=mclonly;Database=RestaurantService;");			
				aCon.Open();  
				
			}
			catch
			{
				return false;
			}
			
			return true;
		}

		public void closeConnection()
		{
			aCon.Close();
		}
		// key is name of idrestaurnat return array of menu in key restaurant
		public ArrayList find(string idres) 
		{   
			if(connected())
			{
				string sqlQuery = "SELECT * FROM menu WHERE idmenu ='00001'";
				NpgsqlCommand command = new NpgsqlCommand(sqlQuery,aCon);
				try
				{
				
					NpgsqlDataReader dr = command.ExecuteReader();
					while(dr.Read())
					{
						String name = (string)dr["menu"];
						String type = (string)dr["type"];
						int cost  = (int)dr["cost"]; 
						int   tenstar = (int)dr["tenstar"];
						aMenu = new Menu(name,type,cost,tenstar);
						menus.Add(aMenu);
						
					}
				}
				catch
				{
					return null;
				}
				return menus;			
			}
			else
			{
				//con't connect
				return null;
			} 
					
		}
		
		
	}
}
