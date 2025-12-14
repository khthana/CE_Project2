using System;
using System.Data;
using System.Collections;
using Npgsql;

namespace Restaurant
{
	/// <summary>
	/// Summary description for menuDA.
	/// </summary>
	public class menuDA
	{
		static NpgsqlConnection conn;
		static NpgsqlCommand command; 

		static int menuID;
		static string menuName;
		static string menuType;
		static int cost;
		static string other;

		static menu aMenu;
		public menuDA()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static void  initialize()
		{
			try
			{
				conn = new NpgsqlConnection("Server=161.246.5.202;Port=5432;User Id=postgres;Password=461382;Database=restaurant;");
			
				conn.Open();
			}
			catch(Exception ex)
			{
				string error = ex.ToString();
			}
		}
		public static void terminate()
		{
			conn.Close();
		}

		public static ArrayList getAll()
		{
			ArrayList menuGroup = new ArrayList();
			string sql = "select * from menu";
			command = new NpgsqlCommand(sql,conn);
			try
			{
				NpgsqlDataReader dr = command.ExecuteReader();
				bool moreData = dr.Read();
        
				if(moreData)
					while(moreData)
					{
						menuID = Convert.ToInt32(dr["menuid"]);
						menuName = (string)dr["menuname"];
						menuType   = (string)dr["menutype"];
						cost   = Convert.ToInt32(dr["cost"]);
						other   = (string)dr["other"];
						byte[] img = (byte[])dr["picture"];
						aMenu= new menu(menuID,menuName,menuType,cost,other,img);
						                  
						menuGroup.Add(aMenu);
						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return menuGroup;
		}

		public static bool addMenu(string menuName,string menuType,string other,int cost,byte[] pic)
		{
			bool checkMenu = true;
			string sql;
			sql = "select menuname from menu where menuname='" + menuName + "'";

			command = new NpgsqlCommand(sql, conn);
			
			try
			{	

				NpgsqlDataReader dr = command.ExecuteReader();
			
				if(dr.Read())
				{
					checkMenu = false;
				} // end while
				dr.Close();
					
			}	// end try
			catch(Exception e)
			{
				string ex = e.ToString();
				return false;
			}
			if(checkMenu)
			{
				sql = "insert into menu (menuname,menutype,other,cost,picture) VALUES ('" +
					menuName + "','" + 
					menuType + "','" + 
					other + "','" + 
					cost + "',:bytesData)";
				command = new NpgsqlCommand(sql, conn);
				NpgsqlParameter param = new NpgsqlParameter(":bytesData", DbType.Binary);
				param.Value = pic;
				command.Parameters.Add(param);
		
				Int32 rowsaffected;
		
				try
				{
					rowsaffected = command.ExecuteNonQuery();
					return true;
				
				}
				catch(Exception e)
				{
					string ex = e.ToString();
					return false;
				}
			} else return false;
			
		}

		public static bool editMenu(int menuID,string menuName,string menuType,string other,
									int cost,byte[] img)
		{
			string sql;
			sql = "UPDATE menu SET " +
				"menuname = '" + menuName + "', " +
				"menutype = '" + menuType + "', " +
				"other = '" + other + "', " +
				"cost = '" + cost + "', " +
				"picture=:bytesData" +
				" WHERE menuid = '" + menuID + "'";
			command = new NpgsqlCommand(sql, conn);
			NpgsqlParameter param = new NpgsqlParameter(":bytesData", DbType.Binary);
			param.Value = img;
			command.Parameters.Add(param);
			Int32 rowsaffected;
			try
			{
				rowsaffected = command.ExecuteNonQuery();
				return true;
			}
			catch(Exception e)
			{
				string ex = e.ToString();
				return false;
			}
		}

		public static menu find(int id)
		{
			aMenu = null;
			string sql = "select * from menu where menuid='";
			sql +=id;
			sql +="'";      
			command = new NpgsqlCommand(sql,conn);
	 
			try
			{ 
				NpgsqlDataReader dr = command.ExecuteReader();
				bool gotIt = dr.Read();
				if(gotIt)
				{
					//extract the data
					menuID = Convert.ToInt32(dr["menuid"]);
					menuName = (string)dr["menuname"];
					menuType   = (string)dr["menutype"];
					cost   = Convert.ToInt32(dr["cost"]);
					other   = (string)dr["other"];
					byte[] img = (byte[])dr["picture"];
					aMenu= new menu(menuID,menuName,menuType,cost,other,img);
				}
				
				dr.Close();
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return aMenu;
		}

		public static bool remove(int key)
		{
			string sql = "delete from menu where menuid='" +
				key + "'";
			command = new NpgsqlCommand(sql,conn);

			Int32 rowsaffected;
			try
			{
				rowsaffected = command.ExecuteNonQuery();
				return true;
				
			}
			catch(Exception e)
			{
				string ex = e.ToString();
				return false;
				
			}
		}
	}
}
