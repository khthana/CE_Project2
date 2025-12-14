using System;
using System.Collections;
using Npgsql;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using System.Xml.Serialization;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Diagnostics;
using System.Data.OleDb;
using System.Data.SqlClient;

namespace WebserviceRestaurant
{
	/// <summary>
	/// Summary description for Service1.
	/// </summary>
	public class Service1 : System.Web.Services.WebService
	{
		const string  DB ="Server=161.246.5.202;Port=5432;User Id=postgres;Password=461382;Database=restaurant;";
		NpgsqlConnection conn;
		NpgsqlCommand command;
		public Service1()
		{
			//CODEGEN: This call is required by the ASP.NET Web Services Designer
			InitializeComponent();
			
			
			conn = new NpgsqlConnection(DB);
			conn.Open();
		}

		#region Component Designer generated code
		
		//Required by the Web Services Designer 
		private IContainer components = null;
				
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if(disposing && components != null)
			{
				components.Dispose();
			}
			base.Dispose(disposing);		
		}
		
		#endregion

		// WEB SERVICE EXAMPLE
		// The HelloWorld() example service returns the string Hello World
		// To build, uncomment the following lines then save and build the project
		// To test this web service, press F5
		
		
		[WebMethod]
		public int checkReserv(string useTime,string reservTime,string endTime,int covers,
							string cardID,string name,string lastname,int age,bool sex,
							string address,string province,string postcode,string telephone,
							string email,int shopID,string shopName)
		{
			string begin,end;
			int numberOfTable = 0;
			begin = "'" + reservTime + "'";
			end = "'" + endTime + "'";
		//	ArrayList aList;
			
			
			

			ArrayList groupReservation = new ArrayList();
			reservation aReservation = new reservation();

			bool checkDate = false;		// ถ้า false คือไม่มีการจองที่ซ้ำกับที่มีอยู่
										// ถ้า true คือมีการจองที่ซ้ำกับที่มีอยู่
			string sql = "select * from treservation where reservTime<="+begin+" AND endTime >="+begin;
			sql = sql + " OR reservTime<=" + end + " AND endTime>=" + end;
			command = new NpgsqlCommand(sql, conn);

			try
			{	

				NpgsqlDataReader dr = command.ExecuteReader();

				bool gotIt = dr.Read();
				if(gotIt)
					while(gotIt)
					{
						checkDate = true;
						
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

			if(checkDate)	// เมื่อมีการจองซ้ำกับที่มีอยู่
			{
				sql = "select * from rtable where covers >='" +covers+ "' AND tableID <>";
				if(groupReservation.Count==1)	// ถ้าซ้ำแค่ 1
				{
					reservation t = (reservation)groupReservation[0];
					string c = Convert.ToString(t.getTableID());
					c = "'" + c + "'";
					sql = sql + c;

				}
				else	// ซ้ำมากกว่า 1
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
							numberOfTable = Convert.ToInt32(dr["tableID"]);
							int number   = Convert.ToInt32(dr["covers"]);
							if(number>=covers)
								gotIt = false;
							else
								gotIt = dr.Read();
						} // end while
					dr.Close();
					
				}	// end try
				catch(Exception e)
				{
					string ex = e.ToString();
				}
			}
			else // กรณีที่ไม่มีการจองซ้ำกับของที่มีอยู่
			{
				sql = "select * from rtable where covers >='" +covers+ "'" +
					  " ORDER BY covers ";
				command = new NpgsqlCommand(sql, conn);
				try
				{	

					NpgsqlDataReader dr = command.ExecuteReader();

					bool gotIt = dr.Read();
					if(gotIt)
						while(gotIt)
						{
							numberOfTable = Convert.ToInt32(dr["tableID"]);
							int number   = Convert.ToInt32(dr["covers"]);
							if(number>=covers)
								gotIt = false;
							else
								gotIt = dr.Read();
						} // end while
					dr.Close();
					
				}	// end try
				catch(Exception e)
				{
					string ex = e.ToString();
				}
			}
			if(numberOfTable!=0)
			{
				
				if(Reserv(shopID,numberOfTable,shopName,name,lastname,useTime,reservTime,endTime,"ยังไม่มา"))
				{
					localhost.Service1 sCenter = new localhost.Service1();
					string token = sCenter.check_res_PWD("test","test");
					sCenter.add_book(cardID,reservTime,endTime,numberOfTable,token);
					AddCustomer(cardID,name,lastname,age,sex,address,province,postcode,telephone,email);
				}
              						
			}

			conn.Close();

			return numberOfTable;
		
		}

		
		public bool Reserv(int shopID,int tableID,string shopName,string name,string lastname,
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
				return false;
			}
			
			return true;
     	}

		public void AddCustomer(string cardID,string name,string lastname,int age,bool sex,
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
		
		[WebMethod]
	//	[XmlInclude(typeof(menu))]
		public menu[] updateMenu()
		{
			menu aMenu = new menu();
			ArrayList menuGroup = new ArrayList();
			
			
			string sql;
			sql = "select * from menu where other='เมนูแนะนำ' OR other ='เมนูใหม่'";
			command = new NpgsqlCommand(sql, conn);
			
			try
			{	

				NpgsqlDataReader dr = command.ExecuteReader();
				
				bool gotIt = dr.Read();
				if(gotIt)
					while(gotIt)
					{
						
						int menuID = Convert.ToInt32(dr["menuID"]);
						string menuName = (string)dr["menuName"];
						string menuType = (string)dr["menuType"];
						int cost = Convert.ToInt32(dr["cost"]);
						string other = (string)dr["other"];
						byte[] pic = (byte[])dr["picture"];		
			
						aMenu= new menu(menuID,menuName,menuType,cost,other,pic);
						menuGroup.Add(aMenu);
						gotIt = dr.Read();
						
					}
				dr.Close();
				
				
			}
			catch(Exception e)
			{
				string ex = e.ToString();
				
			}
			return (menu[])menuGroup.ToArray(typeof(menu));
			
		}
		
		[WebMethod]
		[XmlInclude(typeof(menu))]
		public menu[] updateMenuAll()
		{
			menu aMenu = new menu();
			ArrayList menuGroup = new ArrayList();
			string sql;
			sql = "select * from menu";
			command = new NpgsqlCommand(sql, conn);
			
			try
			{	

				NpgsqlDataReader dr = command.ExecuteReader();

				bool gotIt = dr.Read();
				if(gotIt)
					while(gotIt)
					{
												
						int menuID = Convert.ToInt32(dr["menuID"]);
						string menuName = (string)dr["menuName"];
						string menuType = (string)dr["menuType"];
						int cost = Convert.ToInt32(dr["cost"]);
						string other = (string)dr["other"];
						byte[] pic = (byte[])dr["picture"];		
											
						aMenu= new menu(menuID,menuName,menuType,cost,other,pic);
						menuGroup.Add(aMenu);
						gotIt = dr.Read();
						
					}
				dr.Close();
			
			
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
				
			return (menu[])menuGroup.ToArray(typeof(menu));
		}

		[WebMethod]
		public promotion[] updatePromotion()
		{
			promotion aPromotion = new promotion();
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
						int promotionID = Convert.ToInt32(dr["promotionid"]);
						string promotionName = (string)dr["promotionname"];
						string discription   = (string)dr["discription"];
						string beginTime   = Convert.ToString(dr["begintime"]);
						string endTime  = Convert.ToString(dr["endtime"]);
						
						aPromotion= new promotion(promotionID,promotionName,discription,beginTime,endTime);
						                  
						promotionGroup.Add(aPromotion);
						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return (promotion[])promotionGroup.ToArray(typeof(promotion));
		}
		
		[WebMethod]
		[XmlInclude(typeof(promotion))]
		public promotion[] updatePromotionAll()
		{
			promotion aPromotion = new promotion();
						
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
						int promotionID = Convert.ToInt32(dr["promotionid"]);
						string promotionName = (string)dr["promotionname"];
						string discription   = (string)dr["discription"];
						string beginTime   = Convert.ToString(dr["begintime"]);
						string endTime  = Convert.ToString(dr["endtime"]);
						
						aPromotion= new promotion(promotionID,promotionName,discription,beginTime,endTime);
						                  
						promotionGroup.Add(aPromotion);
						moreData = dr.Read();
					}
              
			}
			catch(Exception e)
			{
				string ex = e.ToString();
			}
			return (promotion[])promotionGroup.ToArray(typeof(promotion));
		}
		
		/*
		[WebMethod]
		public bool editReserv(int tableID,string reservTime,string endTime,
								 int tableID2,string reservTime2,string endTime2,
								 string useTime)
		{
			string sql;
			sql = "UPDATE treservation SET " +
				"tableid = '" + tableID2 + "', " +
				"reservtime = '" + reservTime2 + "', " +
				"usetime = '" + useTime + "', " +
				"endtime = '" + endTime2 + "' " +
				"WHERE tableid = '" + tableID + "' AND " +
				"reservtime ='" + reservTime + "' AND " +
				"endtime ='" + endTime + "'";

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
		*/
		[WebMethod]
		public bool cancelReserv(int tableID,string reservTime,string endTime)
		{
			string sql;
			sql = "delete from treservation where tableid='" + tableID + 
				"' AND reservtime='" + reservTime +
				"' AND endtime='" + endTime + "'";
			
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

		[WebMethod]
		public int getMenuPictureAll(string userid,byte[] img)
		{
			NpgsqlConnection aConnect;
			try
			{
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=user;Password=password;Database=RestaurantService;");			
			
			
				NpgsqlCommand command = 
					new NpgsqlCommand("insert into menu(menuid,picture) values('" +
					userid + "',:bytesData)", conn);
		
				NpgsqlParameter param = new NpgsqlParameter(":bytesData", DbType.Binary);
				param.Value = img;
				command.Parameters.Add(param);
				command.ExecuteNonQuery();

				return 1;
				
			}
			catch(Exception e)
			{
				return 0;
			}
		}
	}

}
