using System;
using System.Collections;
using Npgsql;

namespace Restaurant
{
	/// <summary>
	/// Summary description for promotionDA.
	/// </summary>
	public class promotionDA
	{
		static NpgsqlConnection conn;
		static NpgsqlCommand command; 

		static int promotionID;
		static string promotionName;
		static string discription;
		static string beginTime;
		static string endTime;

		static promotion aPromotion;
		public promotionDA()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static void  initialize()
		{
			try
			{
				conn = new NpgsqlConnection("Server=161.246.5.202;Port=5432;User Id=oad;Password=461382;Database=restaurant;");
			
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
			ArrayList promotionGroup = new ArrayList();
			string sql = "select * from promotion";
			command = new NpgsqlCommand(sql,conn);
			try
			{
				NpgsqlDataReader dr = command.ExecuteReader();
				bool moreData = dr.Read();
        
				if(moreData)
					while(moreData)
					{
						promotionID = Convert.ToInt32(dr["promotionid"]);
						promotionName = (string)dr["promotionname"];
						discription   = (string)dr["discription"];
						beginTime   = Convert.ToString(dr["begintime"]);
						endTime  = Convert.ToString(dr["endtime"]);
						
						aPromotion= new promotion(promotionID,promotionName,discription,beginTime,endTime);
						                  
						promotionGroup.Add(aPromotion);
						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return promotionGroup;
		}
		
		
		public static ArrayList currentPromotion()
		{
			DateTime d = DateTime.Now;
			string date = d.ToShortDateString()+" "+d.ToShortTimeString();
			
			ArrayList promotionGroup = new ArrayList();
			string sql = "select * from promotion where begintime<'" + date +
					"' AND endtime >'" + date + "'";
			
			command = new NpgsqlCommand(sql,conn);
			try
			{
				NpgsqlDataReader dr = command.ExecuteReader();
				bool moreData = dr.Read();
        
				if(moreData)
					while(moreData)
					{
						promotionID = Convert.ToInt32(dr["promotionid"]);
						promotionName = (string)dr["promotionname"];
						discription   = (string)dr["discription"];
						beginTime   = Convert.ToString(dr["begintime"]);
						endTime  = Convert.ToString(dr["endtime"]);
						
						aPromotion= new promotion(promotionID,promotionName,discription,beginTime,endTime);
						                  
						promotionGroup.Add(aPromotion);
						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return promotionGroup;
		}
		
		public static bool addPromotion(string promotionName,string discription,
			string beginTime,string endTime)
		{
			string sql;
			sql = "insert into promotion (promotionname,discription,begintime,endtime) VALUES ('" +
				promotionName + "','" + 
				discription + "','" + 
				beginTime + "','" + 
				endTime + "')";

			command = new NpgsqlCommand(sql, conn);

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

		public static bool editPromotion(int promotionID,string promotionName,string discription,
			string beginTime,string endTime)
		{
			string sql;
			sql = "UPDATE promotion SET " +
				"promotionname = '" + promotionName + "', " +
				"discription = '" + discription + "', " +
				"begintime = '" + beginTime + "', " +
				"endtime = '" + endTime + "' " +
				"WHERE promotionid = '" + promotionID + "'";
			command = new NpgsqlCommand(sql, conn);

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

		public static promotion find(int key)
		{
			aPromotion = null;
			string sql;
			sql = "select * from promotion where promotionid ='" + key + "'";
			command = new NpgsqlCommand(sql, conn);
			try
			{ 
				NpgsqlDataReader dr = command.ExecuteReader();
				bool gotIt = dr.Read();
				if(gotIt)
				{
					//extract the data
					promotionID = Convert.ToInt32(dr["promotionid"]);
					promotionName = (string)dr["promotionname"];
					discription   = (string)dr["discription"];
					beginTime   = Convert.ToString(dr["begintime"]);
					endTime  = Convert.ToString(dr["endtime"]);
						
					aPromotion= new promotion(promotionID,promotionName,discription,beginTime,endTime);
										               
				}
				
				dr.Close();
			}
			catch(Exception e)
			{
				Console.WriteLine(e);
				string ex = e.ToString();
			}
			return aPromotion;
		}
	}
}
