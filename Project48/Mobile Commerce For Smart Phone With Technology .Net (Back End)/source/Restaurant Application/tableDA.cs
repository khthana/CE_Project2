using System;
using System.Collections;
using Npgsql;

namespace Restaurant
{
	/// <summary>
	/// Summary description for tableDA.
	/// </summary>
	public class tableDA
	{
		static NpgsqlConnection conn;
		static NpgsqlCommand command; 

		static int tableID;
		static string note;
		static int covers;

		static table aTable;
		public tableDA()
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
			ArrayList tableGroup = new ArrayList();
			string sql = "select * from rtable";
			command = new NpgsqlCommand(sql,conn);
			try
			{
				NpgsqlDataReader dr = command.ExecuteReader();
				bool moreData = dr.Read();
        
				if(moreData)
					while(moreData)
					{
						tableID = Convert.ToInt32(dr["tableid"]);
						note= (string)dr["note"];
						covers   = Convert.ToInt32(dr["covers"]);
						
						aTable= new table(tableID,note,covers);
						                  
						tableGroup.Add(aTable);
						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return tableGroup;
		}

		public static ArrayList checkReserv1(ArrayList groupReservation,int covers)	// ใช้เมื่อมีการจองซ้ำกับของที่มีอยู่เดิม
		{
			ArrayList tableGroup = new ArrayList();
			string sql = "select * from rtable where covers >='" +covers+ "' AND tableID <>";
			if(groupReservation.Count==1)	
			{
				reservation t = (reservation)groupReservation[0];
				string c = Convert.ToString(t.getTableID());
				c = "'" + c + "'";
				sql = sql + c;

			}
			else	
			{
				for(int i=0;i<groupReservation.Count;i++)
				{
					reservation t = (reservation)groupReservation[i];
					string c = Convert.ToString(t.getTableID());
					c = "'" + c + "'";
					sql = sql + c;
					if( i != groupReservation.Count-1 )
						sql = sql + " AND tableID <> ";
				}
					
			}
			sql = sql + " ORDER BY covers ";
			command = new NpgsqlCommand(sql, conn);
			try
			{	

				NpgsqlDataReader dr = command.ExecuteReader();

				bool gotIt = dr.Read();
				if(gotIt)
					while(gotIt)
					{
						tableID = Convert.ToInt32(dr["tableid"]);
						note= (string)dr["note"];
						covers   = Convert.ToInt32(dr["covers"]);
						
						aTable= new table(tableID,note,covers);
						                  
						tableGroup.Add(aTable);
                        gotIt = dr.Read();
					} // end while
				dr.Close();
					
			}	// end try
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return tableGroup;
		}

		public static ArrayList checkReserv2(ArrayList groupReservation,int covers)// ใช้เมื่อไม่มีการจองซ้ำกับของที่มีอยู่เดิม
		{
			ArrayList tableGroup = new ArrayList();
			string sql = "select * from rtable where covers >='" +covers+ "'";
			//	" ORDER BY covers ";
			command = new NpgsqlCommand(sql, conn);
			try
			{	

				NpgsqlDataReader dr = command.ExecuteReader();

				bool gotIt = dr.Read();
				if(gotIt)
					while(gotIt)
					{
						tableID = Convert.ToInt32(dr["tableid"]);
						note= (string)dr["note"];
						covers   = Convert.ToInt32(dr["covers"]);
						
						aTable= new table(tableID,note,covers);
						                  
						tableGroup.Add(aTable);
						gotIt = dr.Read();
					} // end while
				dr.Close();
					
			}	// end try
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return tableGroup;
		}

		public static table find(int key)
		{
			aTable = null;
			string sql;
			sql = "select * from rtable where tableid ='" + key + "'";
			command = new NpgsqlCommand(sql, conn);
			try
			{ 
				NpgsqlDataReader dr = command.ExecuteReader();
				bool gotIt = dr.Read();
				if(gotIt)
				{
					//extract the data
					tableID = Convert.ToInt32(dr["tableid"]);
					note = (string)dr["note"];
					covers   = Convert.ToInt32(dr["covers"]);
					
					aTable= new table(tableID,note,covers);
               
				}
				
				dr.Close();
			}
			catch(Exception e)
			{
				Console.WriteLine(e);
				string ex = e.ToString();
			}
			return aTable;
		}
		
		public static bool addTable(int tableID,string note,int covers)
		{
			bool checkTable = true;
			string sql;
			sql = "select tableid from rtable where tableid='" + tableID + "'";

			command = new NpgsqlCommand(sql, conn);
			
			try
			{	

				NpgsqlDataReader dr = command.ExecuteReader();
			
				if(dr.Read())
				{
					checkTable = false;
				} // end while
				dr.Close();
					
			}	// end try
			catch(Exception e)
			{
				string ex = e.ToString();
				return false;
			}

			if(checkTable)
			{
				sql = "insert into rtable VALUES ('" +
					tableID + "','" + 
					note + "','" + 
					covers + "')";

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
			else return false;
		}

		public static bool editTable(int tableID,string note,int covers)
		{
			string sql;
			sql = "UPDATE rtable SET " +
				"note = '" + note + "', " +
				"covers = '" + covers + "' " +
				"WHERE tableid = '" + tableID + "'";
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
			string sql = "delete from rtable where tableid='" +
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
