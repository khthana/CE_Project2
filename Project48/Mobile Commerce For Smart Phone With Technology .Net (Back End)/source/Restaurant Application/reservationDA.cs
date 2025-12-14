using System;
using System.Data;
using System.Collections;
using Npgsql;

namespace Restaurant
{
	/// <summary>
	/// Summary description for reservationDA.
	/// </summary>
	public class reservationDA
	{
		static NpgsqlConnection conn;
		static NpgsqlCommand command; 

		static int reservationID;
		static int shopID;
		static int tableID;
		static string shopName;
		static string name;
		static string lastname;
		static string useTime;
		static string reservTime;
		static string endTime;
		static string status;

		static reservation aReservation;
		public reservationDA()
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
			ArrayList reservationGroup = new ArrayList();
			string sql = "select * from treservation ORDER BY reservationid";
			command = new NpgsqlCommand(sql,conn);
			try
			{
				NpgsqlDataReader dr = command.ExecuteReader();
				bool moreData = dr.Read();
        
				if(moreData)
					while(moreData)
					{
						reservationID = Convert.ToInt32(dr["reservationid"]);
						shopID = Convert.ToInt32(dr["shopid"]);
						tableID   = Convert.ToInt32(dr["tableid"]);
						shopName   = (string)dr["shopname"];
						name   = (string)dr["name"];
						lastname   = (string)dr["lastname"];
						useTime   = Convert.ToString(dr["usetime"]);
						reservTime   = Convert.ToString(dr["reservtime"]);
						endTime   = Convert.ToString(dr["endtime"]);
						status   = (string)dr["status"];
						
						aReservation= new reservation(reservationID,shopID,tableID,shopName,name,
							lastname,useTime,reservTime,endTime,status);
						                  
						reservationGroup.Add(aReservation);
						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return reservationGroup;
		}

		public static ArrayList checkReserv(string begin,string end)
		{
			ArrayList groupReservation = new ArrayList();
			string sql = "select * from treservation where reservTime<='"+begin+"' AND endTime >='"+begin;
			sql = sql + "' OR reservTime<='" + end + "' AND endTime>='" + end + "'";
			command = new NpgsqlCommand(sql, conn);

			try
			{	

				NpgsqlDataReader dr = command.ExecuteReader();

				bool gotIt = dr.Read();
				if(gotIt)
					while(gotIt)
					{
						
						
						int reservationID1 = Convert.ToInt32(dr["reservationID"]);
						int shopID1 = Convert.ToInt32(dr["shopID"]);
						int tableID1   = Convert.ToInt32(dr["tableID"]);
						string shopName1   = (string)dr["shopName"];
						string name1   = (string)dr["name"];
						string lastname1 = (string)dr["lastname"];
						string useTime1 = Convert.ToString(dr["useTime"]);
						string reservTime1 = Convert.ToString(dr["reservTime"]);
						string endTime1 = Convert.ToString(dr["endTime"]);
						string status1 = (string)dr["status"];
						
						
					
						aReservation= new reservation(reservationID1,shopID1,tableID1,shopName1,name1,lastname1,
							useTime1,reservTime1,endTime1,status1);
						groupReservation.Add(aReservation);
						gotIt = dr.Read();
						
					}
				dr.Close();
			
			
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return groupReservation;
		}

		public static bool makeReservation(string useTime,string reservTime,string endTime,int covers,
			string cardID,string name,string lastname,int age,bool sex,
			string address,string province,string postcode,string telephone,
			string email,int shopID,int tableID,string shopName)
		{
			try
			{
				Reserv(478,tableID,"mclfood",name,lastname,useTime,reservTime,endTime,"ยังไม่มา");
				AddCustomer(cardID,name,lastname,age,sex,address,province,postcode,telephone,email);
				return true;
			}
			catch(Exception e)
			{
				string ex = e.ToString();
				return false;
			}
		
		}	

		public static void Reserv(int shopID,int tableID,string shopName,string name,string lastname,
			string useTime,string reservTime,string endTime,string status)
		{
			string sqlCommand;
			sqlCommand = "insert into treservation (shopid,tableid,shopname,name,lastname," +
				"usetime,reservtime,endtime,status) VALUES ('" +
				shopID + "','" + 
				tableID + "','" + 
				shopName + "','" + 
				name + "','" + 
				lastname + "','" + 
				useTime + "','" + 
				reservTime + "','" + 
				endTime + "','" + 
				status + "')";

			command = new NpgsqlCommand(sqlCommand, conn);

			Int32 rowsaffected;
			//	Console.WriteLine(sqlCommand);
			try
			{
				rowsaffected = command.ExecuteNonQuery();
				
			}
			catch(Exception e)
			{
				string ex = e.ToString();
				
			}
			

			
		}

		public static void AddCustomer(string cardID,string name,string lastname,int age,bool sex,
			string address,string province,string postcode,string telephone,
			string email)
		{
			bool checkCustomer = true;
			string sql;
			sql = "select cardid from customer where cardid='" + cardID + "'";

			command = new NpgsqlCommand(sql, conn);
			
			try
			{	

				NpgsqlDataReader dr = command.ExecuteReader();
			
				if(dr.Read())
				{
					checkCustomer = false;
				} // end while
				dr.Close();
					
			}	// end try
			catch(Exception e)
			{
				string ex = e.ToString();
			}

			if(checkCustomer)
			{
				sql = "insert into customer VALUES ('" +
					cardID + "','" + 
					name + "','" + 
					lastname + "','" + 
					age + "','" + 
					sex + "','" + 
					address + "','" + 
					province + "','" + 
					postcode + "','" + 
					telephone + "','" + 
					email + "')";

				command = new NpgsqlCommand(sql, conn);

				Int32 rowsaffected;
				try
				{
					rowsaffected = command.ExecuteNonQuery();
				}
				catch(Exception e)
				{
					string ex = e.ToString();
				}
			}
		}

		public static ArrayList getCurrentAll()
		{
			DateTime dNow = DateTime.Now;
			string sNow;
			sNow = dNow.ToShortDateString()+ " " +dNow.ToShortTimeString();
			ArrayList reservationGroup = new ArrayList();
			string sql = "select * from treservation where endtime>='" + sNow + "' ORDER BY reservationid";
			command = new NpgsqlCommand(sql,conn);
			try
			{
				NpgsqlDataReader dr = command.ExecuteReader();
				bool moreData = dr.Read();
        
				if(moreData)
					while(moreData)
					{
						reservationID = Convert.ToInt32(dr["reservationid"]);
						shopID = Convert.ToInt32(dr["shopid"]);
						tableID   = Convert.ToInt32(dr["tableid"]);
						shopName   = (string)dr["shopname"];
						name   = (string)dr["name"];
						lastname   = (string)dr["lastname"];
						useTime   = Convert.ToString(dr["usetime"]);
						reservTime   = Convert.ToString(dr["reservtime"]);
						endTime   = Convert.ToString(dr["endtime"]);
						status   = (string)dr["status"];
						
						aReservation= new reservation(reservationID,shopID,tableID,shopName,name,
							lastname,useTime,reservTime,endTime,status);
						                  
						reservationGroup.Add(aReservation);
						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return reservationGroup;
		}

		public static bool confirm(int key)
		{
			string sql;
			sql = "UPDATE treservation SET status ='ยืนยัน' WHERE reservationid ='" + key + "'";
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

		public static bool remove(int key)
		{
			string sql;
			sql = "DELETE FROM treservation WHERE reservationid ='" + key + "'";
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

		public static reservation find(int id)
		{
			aReservation = null;
			string sql;
			sql = "select * from treservation where reservationid='" + id + "'";
			command = new NpgsqlCommand(sql,conn);
	 
			try
			{ 
				NpgsqlDataReader dr = command.ExecuteReader();
				bool gotIt = dr.Read();
				if(gotIt)
				{
					//extract the data
					reservationID = Convert.ToInt32(dr["reservationid"]);
					shopID = Convert.ToInt32(dr["shopid"]);
					tableID   = Convert.ToInt32(dr["tableid"]);
					shopName   = (string)dr["shopname"];
					name   = (string)dr["name"];
					lastname   = (string)dr["lastname"];
					useTime   = Convert.ToString(dr["usetime"]);
					reservTime   = Convert.ToString(dr["reservtime"]);
					endTime   = Convert.ToString(dr["endtime"]);
					status   = (string)dr["status"];

					aReservation= new reservation(reservationID,shopID,tableID,shopName,name,
						lastname,useTime,reservTime,endTime,status);
               
				}
				
				dr.Close();
			}
			catch(Exception e)
			{
				Console.WriteLine(e);
				string ex = e.ToString();
			}
			return aReservation;
		}

		public static bool editReservation(int reservID,int tableID,string useTime,
						string reservTime,string endTime)
			
		{
			string sql;
			sql = "UPDATE treservation SET " +
				"tableid = '" + tableID + "', " +
				"usetime = '" + useTime + "', " +
				"reservtime = '" + reservTime + "', " +
				"endtime = '" + endTime + "' " +
				"WHERE reservationid = '" + reservID + "'";
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
	}
}
