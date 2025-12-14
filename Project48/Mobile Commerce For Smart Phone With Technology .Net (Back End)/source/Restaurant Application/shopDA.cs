using System;
using System.Collections;
using Npgsql;

namespace Restaurant
{
	/// <summary>
	/// Summary description for shopDA.
	/// </summary>
	public class shopDA
	{
		static NpgsqlConnection conn;
		static NpgsqlCommand command; 

		static int shopID;
		static string shopName;
		static string number;
		static string soi;
		static string road;
		static string district;
		static string amphur;
		static string province;
		static string postcode;
		static string telephone;
		static float latijude;
		static float longtijude;
		static string type;
		
		static shop aShop;
		public shopDA()
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

		public static ArrayList getAll()
		{
			ArrayList shopGroup = new ArrayList();
			string sql = "select * from shop";
			command = new NpgsqlCommand(sql,conn);
			try
			{
				NpgsqlDataReader dr = command.ExecuteReader();
				bool moreData = dr.Read();
        
				if(moreData)
					while(moreData)
					{
						shopID = Convert.ToInt32(dr["shopid"]);
						shopName = (string)dr["shopname"];
						number   = (string)dr["number"];
						soi   = (string)dr["soi"];
						road   = (string)dr["road"];
						district   = (string)dr["district"];
						amphur   = (string)dr["amphur"];
						province   = (string)dr["province"];
						postcode   = (string)dr["postcode"];
						telephone   = (string)dr["telephone"];
						latijude   = (float)dr["latijude"];
						longtijude   = (float)dr["longtijude"];
						type   = (string)dr["type"];
						
						aShop = new shop(shopID,shopName,number,soi,road,district,amphur,
									province,postcode,telephone,latijude,longtijude,type);
						                  
						shopGroup.Add(aShop);
						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return shopGroup;
		}
	}
}
