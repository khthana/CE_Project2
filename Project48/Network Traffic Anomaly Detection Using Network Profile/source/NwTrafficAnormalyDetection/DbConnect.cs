using System;
using MySql.Data.MySqlClient;

namespace Org.Snmp.Snmp_pp
{
	/// <summary>
	///
	/*		วิธีใช้ function 
	query(string interf,string var,string day,string time) 

	interf :: หมายเลข interface เอาเฉพาะ col index ที่ 0 ของตัวแปร ifNo 
	var :: ตัวแปร 0-13 ไล่จาก ifInOctets = 0 ไปจน etherStatsPkts1024to1518Octets = 13 
	day :: Sun,Mon,Tue,...,Sat 
    time :: ชั่วโมง ปัจจุบันที่จะเรียกดูข้อมูล เช่น จะดู 16.30 ไปจนถึง 15.30 ให้ใส่ --->  16 
	*/

	/// </summary>
	public class DbConnect
	{
		private string server;
		private string user;
		private string password;
		private string database;
		private string SQL;
		private MySqlConnection DbCon;
		private MySqlCommand sqlCommand;
		private ulong[,] multiplier;
		private ulong[,] ovalue;
		private int sizeof_param = 14;	// 14 is number of parameter
		private ulong max = 4294967295;
		private int sizeof_ifNo;
		//private bool passed=false; // check for first time to differentiated
		private ulong obuffer; // for differentiated & global variable
		
		public DbConnect()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	
		public DbConnect(string arg_server,string arg_user,string arg_password,string arg_database)
		{
			server = arg_server;
			user = arg_user;
			password = arg_password;
			database = arg_database;
			DbCon = new MySqlConnection();
			DbCon.ConnectionString = "server='"+server+"';user id='"+user+"';password='"+password+"';database='"+database+"'";
			
		}

		public void launch(int arg_sizeof_ifNo)
		{
			sizeof_ifNo = arg_sizeof_ifNo;

			// ------------------------------------------------//
			multiplier = new ulong[sizeof_ifNo,14];
			// initialize array
			for(int a=0;a<sizeof_ifNo;a++)
			{
				for(int b=0;b<sizeof_param;b++)
				{
					multiplier[a,b]=0;
				}
			}
			// ------------------------------------------------\\

			// ------------------------------------------------//
			// define array to keep ovaluse (old value)
			ovalue = new ulong[sizeof_ifNo,14];
			// initialize array
			for(int a=0;a<sizeof_ifNo;a++)
			{
				for(int b=0;b<sizeof_param;b++)
				{
					ovalue[a,b]=0;
				}
			}
			// ------------------------------------------------\\
		}
		public bool create_database(string name,string [,] ifNo,int arg_sizeof_ifNo) 
		{
			SQL = "CREATE DATABASE "+name;
			sqlCommand = new MySqlCommand(SQL,DbCon);
			this.open();
			sqlCommand.ExecuteNonQuery();
			this.close();
			this.database = name;
			DbCon.ConnectionString = "server='"+server+"';user id='"+user+"';password='"+password+"';database='"+database+"'";
			this.open();
			// $$$ redundant $$$ //
			sizeof_ifNo = arg_sizeof_ifNo;
			// $$$ redundant $$$ \\
			for(int i=0;i<sizeof_ifNo;i++)
			{
				SQL = "CREATE TABLE `" + ifNo[i,0].Substring(1) + 
					"` (`ID` BIGINT NOT NULL AUTO_INCREMENT," +
					"`datetime` DATETIME NOT NULL," + 
					"`dayofweek` VARCHAR(3) NOT NULL," +
					"`ifInOctets` VARCHAR(45) NOT NULL," +
					"`ifInUcastPkts` VARCHAR(45) NOT NULL," + 
					"`ifInNUcastPkts` VARCHAR(45) NOT NULL," + 
					"`ifInDiscards` VARCHAR(45) NOT NULL," + 
					"`ifOutOctets` VARCHAR(45) NOT NULL," + 
					"`ifOutUcastPkts` VARCHAR(45) NOT NULL," + 
					"`ifOutNUcastPkts` VARCHAR(45) NOT NULL," +
					"`ifOutDiscards` VARCHAR(45) NOT NULL," +
					"`etherStatsPkts64Octets` VARCHAR(45) NOT NULL," + 
					"`etherStatsPkts65to127Octets` VARCHAR(45) NOT NULL," + 
					"`etherStatsPkts128to255Octets` VARCHAR(45) NOT NULL," +
					"`etherStatsPkts256to511Octets` VARCHAR(45) NOT NULL," + 
					"`etherStatsPkts512to1023Octets` VARCHAR(45) NOT NULL," +
					"`etherStatsPkts1024to1518Octets` VARCHAR(45) NOT NULL," +
					"PRIMARY KEY(`ID`))ENGINE = InnoDB PACK_KEYS = 1;";
				sqlCommand = new MySqlCommand(SQL,DbCon);
				sqlCommand.ExecuteNonQuery();
			}
			this.close();
			return true;
		}
		public bool toDB(string arg_recv_data,int arg_sizeof_ifNo,bool passed)
		{
			int first = 0;
			int last = 0;
			sizeof_ifNo = arg_sizeof_ifNo;
			DateTime dt;
			ovalue = new ulong[sizeof_ifNo,14];
			multiplier = new ulong[sizeof_ifNo,14];
			for(int i=0;i<sizeof_ifNo;i++)
			{
				//int j =0;
				first = arg_recv_data.IndexOf("$");
				last = arg_recv_data.IndexOf("$",first+1);
				string temp = arg_recv_data.Substring(first,last-first);
				// process in temp
				temp = temp.Substring(1);
				int index = temp.IndexOf("%");
				string ifNumber = temp.Substring(0,index);
				temp += "%";			// for easy search
				string[] values = new string[sizeof_param];
				for(int j=0;j<sizeof_param;j++)
				{
					int index1 = temp.IndexOf("%");
					int index2 = temp.IndexOf("%",index1+1);
				
					values[j] = temp.Substring(index1+1,index2-index1-1);

					if(passed) // Not run in first time
					{
						////// ------ differentiated ------ //////
						ulong obuff = max * multiplier[i,j];
						obuffer = ovalue[i,j] + obuff;
						////// ------ differentiated ------ \\\\\\
					


						if(UInt64.Parse(values[j]) < ovalue[i,j])
						{
							multiplier[i,j] += 1;
						}
					}

					/////////////////////////////////////////////////
					// replace current to ovalue
					ovalue[i,j] = UInt64.Parse(values[j]);
					/////////////////////////////////////////////////
					
					ulong buff = max * multiplier[i,j];
					ulong buffer = UInt64.Parse(values[j]) + buff;
					if(passed)
					{
						buffer -= obuffer;
					}
					values[j] = buffer.ToString();

					
					temp = temp.Substring(index2);
				}
				////////////////////////////////////
				dt = DateTime.Now;
				string datetime = dt.ToString("u");
				datetime = datetime.Substring(0,datetime.Length-1);
				string day = dt.ToString("r");
				day = day.Substring(0,3);
				////////////////////////////////////
				SQL = "INSERT INTO `" + ifNumber + "` VALUES (0," +
					"'" + datetime + "'," +
					"'" + day + "'," +
					values[0] + "," +
					values[1] + "," +
					values[2] + "," +
					values[3] + "," +
					values[4] + "," +
					values[5] + "," +
					values[6] + "," +
					values[7] + "," +
					values[8] + "," +
					values[9] + "," +
					values[10] + "," +
					values[11] + "," +
					values[12] + "," +
					values[13] + ");";
				sqlCommand = new MySqlCommand(SQL,DbCon);
				this.open();
				if(passed)
				{
					try
					{
						sqlCommand.ExecuteNonQuery();
					}
					catch(Exception e){}
				}
				this.close();

				arg_recv_data = arg_recv_data.Substring(last);
			}
			passed = true; // toggle passed flag to enable all function in next time
			return passed;
		}

		public bool create_databaseAlert(string name,string [,] ifNo,int arg_sizeof_ifNo) 
		{
			SQL = "CREATE DATABASE "+name;
			sqlCommand = new MySqlCommand(SQL,DbCon);
			this.open();
			sqlCommand.ExecuteNonQuery();
			this.close();
			this.database = name;
			DbCon.ConnectionString = "server='"+server+"';user id='"+user+"';password='"+password+"';database='"+database+"'";
			this.open();
			// $$$ redundant $$$ //
			sizeof_ifNo = arg_sizeof_ifNo;
			// $$$ redundant $$$ \\
			for(int i=0;i<sizeof_ifNo;i++)
			{
				SQL = "CREATE TABLE `" + ifNo[i,0].Substring(1) + 
					"` (`ID` BIGINT NOT NULL AUTO_INCREMENT," +
					"`datetime` DATETIME NOT NULL," + 
					"`dayofweek` VARCHAR(3) NOT NULL," +
					"`message` VARCHAR(255) NOT NULL," +
					"PRIMARY KEY(`ID`))ENGINE = InnoDB PACK_KEYS = 1;";
				sqlCommand = new MySqlCommand(SQL,DbCon);
				sqlCommand.ExecuteNonQuery();
			}
			this.close();
			return true;
		}
		public void toDBAlert(string ifNumber,string message,int arg_sizeof_ifNo)
		{
			DbCon.ConnectionString = "server='"+server+"';user id='"+user+"';password='"+password+"';database='"+database+"'";
			DateTime dt;
			dt = DateTime.Now;
			string datetime = dt.ToString("u");
			datetime = datetime.Substring(0,datetime.Length-1);
			string day = dt.ToString("r");
			day = day.Substring(0,3);
			////////////////////////////////////
			SQL = "INSERT INTO `" + Cut_dot(ifNumber) + "` VALUES (0," +
				"'" + datetime + "'," +
				"'" + day + "','" +
				message  + "');";
			sqlCommand = new MySqlCommand(SQL,DbCon);
			try
			{
				this.open();
				sqlCommand.ExecuteNonQuery();
				this.close();
			}
			catch(Exception e){}
		}

		public string query(string interf,string var,string day,string time)
		{
			string result = "$";
			string input = "$";

			// ?????? var ?????? //
			int var_int = Int32.Parse(var) + 3; // shift right to correct column
			//string var = var_int.ToString();
			// ?????? var ?????? //

			// ?????? time ?????? //
			int time_int = Int32.Parse(time);
			string before_time="";
			int before_time_int = time_int - 1;
			time = time_int.ToString();
			before_time = before_time_int.ToString();
			// ?????? time ?????? //

			SQL = "SELECT * FROM `" + 
				interf + "` where dayofweek = '" + day 
				+ "' and hour(`datetime`) >= " 
				+ before_time + " and hour(`datetime`) <= " + time + ";";
			sqlCommand = new MySqlCommand(SQL,DbCon);
			this.open();
			MySqlDataReader r = sqlCommand.ExecuteReader();
			while(r.Read())
			{
				input += r.GetString(var_int)+"$";
			}
			this.close();

			int i = 0;
			int back = 0;
			int front = 0;
			int len_input = input.Length;
			int len_temp = 0;
			while(i < 12 && len_input > 1)
			{
				back = input.LastIndexOf("$");
				front = input.LastIndexOf("$",back - 1);
				len_temp = back-front-1;
				result += input.Substring(front+1,len_temp);
				input = input.Substring(0,len_input - len_temp - 1);
				result += "$";
				len_input = input.Length;
				i++;
			}
			return result;
		}


		public string query(string interf,string var,string day,string time,string min,bool DB)
		{
			string result = "$";
			string input = "$";
			

			//---------------mee modify-------------------------
			int db_length ;
			if(DB == false)				//ถ้า DB = false คือ norm
			{
				db_length = 48;
			}
			else
			{
				db_length = 12;
			}  
			//---------------------------------------------------			   
						  
			// ?????? var ?????? //
			int var_int = Int32.Parse(var) + 3; // shift right to correct column
			//string var = var_int.ToString();
			// ?????? var ?????? //

			// ?????? time ?????? //
			//int time_int = int.Parse(time);
			double time_int = double.Parse(time);
			double min_int = double.Parse(min);
			min_int += 2;
			string min_delay = min_int.ToString();
			string before_time="";
			double before_time_int = time_int - 1 ;
			if(before_time_int < 0)
			{
				before_time_int += 24;
			}
			time_int += 0.02;	// +delay ตอนเก็บลง DB 
			time = time_int.ToString();
			before_time = before_time_int.ToString();
			// ?????? time ?????? //

			/*SQL = "SELECT * FROM `" +
				interf + "` where dayofweek = '" + day
				+ "' and hour(`datetime`) >= "
				+ before_time + " and hour(`datetime`) <= " + time + ";";*/
			SQL = "SELECT * FROM `" +
				interf + "` where dayofweek = '" + day
				+ "' and time(`datetime`) >= maketime("
				+ before_time + "," + min + "," 
				+ "0) and time(`datetime`) <= maketime(" + time + "," + min_delay + ",0);" ;
			sqlCommand = new MySqlCommand(SQL,DbCon);
			try
			{
				this.open();
				MySqlDataReader r = sqlCommand.ExecuteReader();
				while(r.Read())
				{
					input += r.GetString(var_int)+"$";
				}
				this.close();
			}
			catch(Exception e){};
			int i = 0;
			int back = 0;
			int front = 0;
			int len_input = input.Length;
			int len_temp = 0;
			while(i < db_length /*mee modify*/&& len_input > 1)
			{
				back = input.LastIndexOf("$");
				front = input.LastIndexOf("$",back - 1);
				len_temp = back-front-1;
				result += input.Substring(front+1,len_temp);
				input = input.Substring(0,len_input - len_temp - 1);
				result += "$";
				len_input = input.Length;
				i++;
			}
			return result;
			
		}
		public void open()
		{
			try
			{
				DbCon.Open();
			}
			catch(Exception e){}
		}
		public void close()
		{
			try
			{
				DbCon.Close();
			}
			catch(Exception e){}
		}
		
		public bool Can_open()
		{
			if(DbCon.State.ToString() == "Open")
			{
				return true;
			}
			else return false;
		}

		public string Cut_dot(string ifNo)
		{
			return ifNo.Substring(1);
		}
	}
}


