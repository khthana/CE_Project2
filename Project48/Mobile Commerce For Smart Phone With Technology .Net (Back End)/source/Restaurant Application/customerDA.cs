using System;
using System.Collections;
using Npgsql;

namespace Restaurant
{
	/// <summary>
	/// Summary description for customerDA.
	/// </summary>
	public class customerDA
	{
		
		static NpgsqlConnection conn;
		static NpgsqlCommand command; 

		static string cardID;
		static string name;
		static string lastname;
		static int age;
		static bool sex;
		static string address;
		static string province;
		static string postcode;
		static string telephone;
		static string email;

		static customer aCustomer;
		public customerDA()
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

		public static customer find(string key)
		{
			aCustomer = null;
			string sql = "select * from customer where name='";
			sql +=key;
			sql +="'";      
			command = new NpgsqlCommand(sql,conn);
	 
			try
			{ 
				NpgsqlDataReader dr = command.ExecuteReader();
				bool gotIt = dr.Read();
				if(gotIt)
				{
					//extract the data
					cardID = (string)dr["cardid"];
					name = (string)dr["name"];
					lastname   = (string)dr["lastname"];
					age   = Convert.ToInt32(dr["age"]);
					sex   = (bool)dr["sex"];
					address   = (string)dr["address"];
					province   = (string)dr["province"];
					postcode = (string)dr["postcode"];
					telephone = (string)dr["telephone"];
					email = (string)dr["email"];

					aCustomer= new customer(cardID,name,lastname,age,sex,address,province,
						postcode,telephone,email);
               
				}
				
				dr.Close();
			}
			catch(Exception e)
			{
				Console.WriteLine(e);
				string ex = e.ToString();
			}
			return aCustomer;
		}
		
		public static customer find(string key,string key2)
		{
			aCustomer = null;
			string sql = "select * from customer where name ='" + key + "' AND " +
					"lastname ='" + key2 + "'";
			 
			command = new NpgsqlCommand(sql,conn);
	 
			try
			{ 
				NpgsqlDataReader dr = command.ExecuteReader();
				bool gotIt = dr.Read();
				if(gotIt)
				{
					//extract the data
					cardID = (string)dr["cardid"];
					name = (string)dr["name"];
					lastname   = (string)dr["lastname"];
					age   = Convert.ToInt32(dr["age"]);
					sex   = (bool)dr["sex"];
					address   = (string)dr["address"];
					province   = (string)dr["province"];
					postcode = (string)dr["postcode"];
					telephone = (string)dr["telephone"];
					email = (string)dr["email"];

					aCustomer= new customer(cardID,name,lastname,age,sex,address,province,
						postcode,telephone,email);
               
				}
				
				dr.Close();
			}
			catch(Exception e)
			{
				Console.WriteLine(e);
				string ex = e.ToString();
			}
			return aCustomer;
		}

		public static ArrayList getAll()
		{
			ArrayList customerGroup = new ArrayList();
			string sql = "select * from customer";
			command = new NpgsqlCommand(sql,conn);
			try
			{
				NpgsqlDataReader dr = command.ExecuteReader();
				bool moreData = dr.Read();
        
				if(moreData)
					while(moreData)
					{
						cardID = (string)dr["cardid"];
						name = (string)dr["name"];
						lastname   = (string)dr["lastname"];
						age   = Convert.ToInt32(dr["age"]);
						sex   = (bool)dr["sex"];
						address   = (string)dr["address"];
						province   = (string)dr["province"];
						postcode = (string)dr["postcode"];
						telephone = (string)dr["telephone"];
						email = (string)dr["email"];

						aCustomer= new customer(cardID,name,lastname,age,sex,address,province,
							postcode,telephone,email);
						                  
						customerGroup.Add(aCustomer);
						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return customerGroup;
		}

		public static int totalCustomers()
		{
			int count = 0;
			string sql = "select * from customer";
			command = new NpgsqlCommand(sql,conn);
			try
			{
				NpgsqlDataReader dr = command.ExecuteReader();
				bool moreData = dr.Read();
        
				if(moreData)
					while(moreData)
					{
						cardID = (string)dr["cardid"];
						name = (string)dr["name"];
						lastname   = (string)dr["lastname"];
						age   = Convert.ToInt32(dr["age"]);
						sex   = (bool)dr["sex"];
						address   = (string)dr["address"];
						province   = (string)dr["province"];
						postcode = (string)dr["postcode"];
						telephone = (string)dr["telephone"];
						email = (string)dr["email"];

						count++;

						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return count;
		}

		public static bool deleteName(string name,string lastname)
		{
			string sql = "delete from customer where name='" +
					name + "' AND lastname='" +
					lastname + "'";
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

		public static bool addCustomer(string cardID,string name,string lastname,
			int age,bool sex,string address,string province,
			string postcode,string telephone,string email)
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
				return false;
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
					return true;
				}
				catch(Exception e)
				{
					string ex = e.ToString();
					return false;
				}
				
			} else return false;
			
		}

		public static bool editCustomer(string cardID,string name,string lastname,
			int age,bool sex,string address,string province,
			string postcode,string telephone,string email)
		{
			string sql;
			sql = "UPDATE customer SET " +
				"name = '" + name + "', " +
				"lastname = '" + lastname + "', " +
				"age = '" + age + "', " +
				"sex = '" + sex + "', " +
				"address = '" + address + "', " +
				"province = '" + province + "', " +
				"postcode = '" + postcode + "', " +
				"telephone = '" + telephone + "', " +
				"email = '" + email + "' " +
				"WHERE cardid = '" + cardID + "'";
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
