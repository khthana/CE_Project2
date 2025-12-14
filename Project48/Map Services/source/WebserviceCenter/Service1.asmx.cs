using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;
using System.Drawing;
using Npgsql;
using System.Xml.Serialization;
using System.Net.Sockets;
using System.Text;



namespace Restaurant
{
	/// <summary>
	/// Summary description for Service1.
	/// </summary>
	public class Service1 : System.Web.Services.WebService 
	{
		//	private string  user= "postgres"; 
		//	private string password = "mclonly";

		public Service1()
		{
			//CODEGEN: This call is required by the ASP.NET Web Services Designer
			InitializeComponent();
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
		///-------------------------------------------------------------------->>>
		public string GetMyToken()
		{
			//just returning a unique id to identify the user usually this would be 
			//done after authentication
			return System.Guid.NewGuid().ToString();
		}
		public void SaveMyStuff(string stuff,string token)
		{
			//save the user string in the asp.net cache//
			System.Web.HttpContext.Current.Cache[token]=stuff;
		}
		public string GetMyStuff(string token)
		{
			//get the user string identified by the token//
			return (string) System.Web.HttpContext.Current.Cache[token];
		} 
		//[WebMethod]
		public string checkToken(string temp)
		{
			string check = GetMyStuff(temp);
			if(check == null)
			{
				return "false";
			}
			else
			{
				return check;
			}
		}
		public bool applyGeneralUser(string Gname,string Gaddress,string Gtelephone,string Gidentitycard ,string Gusername,string Gpassword)
		{
			bool check = false;	
			NpgsqlConnection aConnect;		
			try
			{		
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "insert into generaluser (gname,address,telephone,identitycard,username,password) values ("+
					"'"+Gname+"','"+Gaddress+"','"+Gtelephone+"','"+Gidentitycard+"','"+Gusername+"','"+Gpassword+"')";
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
				NpgsqlDataReader dr = command.ExecuteReader();
				check = true;
			}
			catch
			{
				check = false;
				return false;
			}
			return check;
		}
		///....................................................................>>>
		//check password befor process
		[WebMethod]
		public string checkPWD(string user,string pass)
		{
			bool check = false;
			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
			string token = null;
						
			try
			{		
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select iduser from generaluser where "+
					"username = '"+user+
					"' and password = '"+pass+"'";
				
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				if(dr.Read())
				{
					//check = true;
					int iduser = (int)dr["iduser"];
					token = GetMyToken();
					SaveMyStuff(iduser.ToString(),token); 
					return token;
				}
				
				dr.Close();
				aConnect.Close();
			}
			catch
			{
				return null;
			}
			return token;
		}
		
		[WebMethod]
		public GeneralUser GetProfile(string user,string pass)
		{
			bool check = false;
			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
			string token = null;
			GeneralUser gu =null;
						
			try
			{		
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select iduser from generaluser where "+
					"username = '"+user+
					"' and password = '"+pass+"'";
				
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				int iduser = 0;
				if(dr.Read())
				{
					//check = true;
					 iduser = (int)dr["iduser"];
				}
				if(iduser != 0)
				{
					sql = "select * from generaluser";
					 command = new NpgsqlCommand(sql, aConnect);
					 dr = command.ExecuteReader();
					if(dr.Read())
					{
						//check = true;
						//int iduser = (int)dr["iduser"];
					    string name = (string)dr["gname"];
						string address = (string)dr["address"];
						string telephone = (string)dr["telephone"];
						string identify = (string)dr["identitycard"];
						string username = (string)dr["username"];
						string password = (string)dr["password"];
						gu = new GeneralUser(name,address,telephone,identify,username,password);
					}
					
				}
				else
				{return null;}


			   
				
				dr.Close();
				aConnect.Close();
			}
			catch
			{
				return null;
			}

			return gu;
		}
		[WebMethod]//find all restaurant
		[XmlInclude(typeof(Placemark))]
		public Placemark[] getPlacemark(double latitude,double longitude,int distance,string token)
		{
			//check token before process function
			if (checkToken(token).Equals("false"))
			{
				return null;
			}

			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				
				aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=placemark;");			
				aConnect.Open();  
			
				string sql = "select * from place";

				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					Placemark tempPlacemark = new Placemark();
					tempPlacemark.latitude = Convert.ToDouble(dr["latijude"]);
					tempPlacemark.longitude = Convert.ToDouble(dr["longtijude"]);
					tempPlacemark.name = (string) dr["nameplace"];
					tempPlacemark.type = (string) dr["type"];

					double temp = 110098.9011*Math.Sqrt((tempPlacemark.latitude - latitude)*(tempPlacemark.latitude - latitude)+(tempPlacemark.longitude-longitude)*(tempPlacemark.longitude-longitude));
					if(temp<distance)	arr.Add(tempPlacemark);
				}
				return (Placemark[])arr.ToArray(typeof(Placemark));
			}
			catch
			{
				return null;
			}
		}

		[WebMethod]//findn restaurant detail
		public Placemark getPlacemark2(string name,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}

			NpgsqlConnection aConnect;
			Placemark temp = new Placemark();
			
			try
			{
				
				aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=placemark;");			
				aConnect.Open();  
				string sql = "select * from place where nameplace like '%"+
					name  + "%'";
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					temp.name = (string) dr["nameplace"];
					temp.latitude = Convert.ToDouble(dr["latijude"]);
					temp.longitude = Convert.ToDouble(dr["longtijude"]);
					temp.type = (string) dr["type"];
				}
				return temp;
			}
			catch
			{
				return null;
			}
		}

		//.................................................................
		//WebMethod in webservice
		[WebMethod]
		[XmlInclude(typeof(Restaurant))]
		public Restaurant[] getAllRes(double latitude,double longitude,int distance,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}

			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=restaurant;");			
				aConnect = Database.connected();
				aConnect.Open();  
			
				string sql = "select * from restaurant";


				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					int id = (int)dr["idrestaurant"];
					string rname = (string)dr["rname"];
					string province = (string)dr["province"];
					string amphur = (string)(dr["amphur"]+"");
					string district = (string)(dr["district"]+"");
					string zone = (string)(dr["zone"]+"");
					int zipcode = 0;
					if(!dr.IsDBNull(dr.GetOrdinal("zipcode")))
						zipcode = (int)dr["zipcode"];
					string telephone = (string)(dr["telephone"]+"");
					double la =0;
					double lo =0;
					
					if(!dr.IsDBNull(dr.GetOrdinal("latitude"))) //check this field is empty ?
						la = Convert.ToDouble(dr["latitude"]);
					if(!dr.IsDBNull(dr.GetOrdinal("longitude"))) //check this field is empty ?
						lo = Convert.ToDouble(dr["longitude"]);

					string type = (string)(dr["type"]+"");
					Position p1 = new Position(la,lo);
					string road = (string)(dr["road"]+"");
					Address  a1 = new Address(province,amphur,district,zone,zipcode,road);
					string valid = (string)(dr["valid"]+"");
					string reserve = (string)(dr["reserve"]+"");
					Restaurant restaurant = new Restaurant(id,rname,telephone,type,p1,a1,valid,reserve);					
					
					
					double temp = 110098.9011*Math.Sqrt((la - latitude)*(la - latitude)+(lo-longitude)*(lo-longitude));
					if(temp<distance)
						arr.Add(restaurant);
				}
				return (Restaurant[])arr.ToArray(typeof(Restaurant));
			}
			catch
			{
				return null;
			}
		}

		[WebMethod(EnableSession=true)]//find all restaurant
		[XmlInclude(typeof(Building2))]
		public Building2[] getallBuilding(double latitude,double longitude,int distance,string token)
		{
			//check token before process function
			if (checkToken(token).Equals("false"))
			{
				return null;
			}

			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				
				aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=interior;");			
				aConnect.Open();  
			
				string sql = "select * from building";

				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					Building2 tempBuilding = new Building2();
					if(!dr.IsDBNull(dr.GetOrdinal("latitude"))) //check this field is empty ?
						tempBuilding.lat = Convert.ToDouble(dr["latitude"]);
					if(!dr.IsDBNull(dr.GetOrdinal("longitude"))) //check this field is empty ?
						tempBuilding.lon = Convert.ToDouble(dr["longitude"]);
					tempBuilding.name = (string) dr["name"];
					tempBuilding.id = Convert.ToInt32(dr["id"]);

					double temp = 110098.9011*Math.Sqrt((tempBuilding.lat - latitude)*(tempBuilding.lat - latitude)+(tempBuilding.lon-longitude)*(tempBuilding.lon-longitude));
					if(temp<distance)	arr.Add(tempBuilding);
				}
				return (Building2[])arr.ToArray(typeof(Building2));
			}
			catch(Exception e)
			{
				return null;
			}
		}

		[WebMethod(EnableSession=true)]//find all restaurant
		[XmlInclude(typeof(Placemark))]
		public Placemark[] getallPlacemark(double latitude,double longitude,int distance,string token)
		{
			//check token before process function
			if (checkToken(token).Equals("false"))
			{
				return null;
			}

			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				
				aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=placemark;");			
				aConnect.Open();  
			
				string sql = "select * from place";

				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					Placemark tempPlacemark = new Placemark();
					if(!dr.IsDBNull(dr.GetOrdinal("latijude"))) //check this field is empty ?
						tempPlacemark.latitude = Convert.ToDouble(dr["latijude"]);
					if(!dr.IsDBNull(dr.GetOrdinal("longtijude"))) //check this field is empty ?
						tempPlacemark.longitude = Convert.ToDouble(dr["longtijude"]);
					tempPlacemark.name = (string) (""+dr["nameplace"]);
					tempPlacemark.type = (string) (""+dr["type"]);

					double temp = 110098.9011*Math.Sqrt((tempPlacemark.latitude - latitude)*(tempPlacemark.latitude - latitude)+(tempPlacemark.longitude-longitude)*(tempPlacemark.longitude-longitude));
					if(temp<distance)	arr.Add(tempPlacemark);
				}
				return (Placemark[])arr.ToArray(typeof(Placemark));
			}
			catch
			{
				return null;
			}
		}

		[WebMethod(EnableSession=true)]
		[XmlInclude(typeof(TmgData))]
		public TmgData GetMapTmg(string iduser, double lat, double lon)
		{
			//string iduser, double lat, double lon
			System.Net.Sockets.TcpClient tcpClient = new System.Net.Sockets.TcpClient();

			tcpClient.Connect("127.0.0.1", 11344);
			NetworkStream networkStream = tcpClient.GetStream();

			if ((networkStream.CanWrite) && (networkStream.CanRead))
			{
				// Write msg
				string tempString = "A" + iduser + "B" + lat.ToString() + "C" + lon.ToString() + "D";
				//string tempString = "A1B15.512123C105.121212D";
				Byte[] sendBytes = Encoding.ASCII	.GetBytes(tempString);
				networkStream.Write(sendBytes, 0, sendBytes.Length);

				// Read the NetworkStream into a byte buffer.
				Byte[] bytes = new Byte[tcpClient.ReceiveBufferSize];
				networkStream.Read(bytes, 0, tcpClient.ReceiveBufferSize);

				// Output the data received from the host to the console.
				string returndata = Encoding.ASCII.GetString(bytes);


				// Get picture from db
				NpgsqlConnection aConnect;
				try
				{
					aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=Tmgx;");
					aConnect.Open();  
					/*string sql = "update usermap set mapdata = :bytesData"+
								" where iduser ='"+
								  iduser+"'";
	*/
					string sql = "select mapdata from usermap where iduser = " + iduser + " order by id desc";
		
					NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);

					NpgsqlDataReader dr = command.ExecuteReader();
					TmgData mapdata = new TmgData();
					
					if(dr.Read())
					{
						mapdata.mapdata = (byte[]) dr["mapdata"];
					}

					mapdata.len = Convert.ToDouble(returndata);
					return mapdata;
				
				}
				catch(Exception e)
				{
					return null;
				}
			}
			else
			{
				if (!networkStream.CanRead )
				{
					Console.WriteLine("cannot not write data to this stream");
					tcpClient.Close();
				}
				else
				{
					if (!networkStream.CanWrite)
					{
						Console.WriteLine("cannot read data from this stream");
						tcpClient.Close();
					}
				}
				return null;
			}

			return null;

		}


		[WebMethod]
		public int UpdateMap(string iduser,byte[] map)
		{
			NpgsqlConnection aConnect;
			try
			{
				aConnect = new NpgsqlConnection("Server=161.246.5.214;Port=5432;User Id=postgres;Password=mclonly;Database=Tmgx;");
				aConnect.Open();  
				/*string sql = "update usermap set mapdata = :bytesData"+
							" where iduser ='"+
							  iduser+"'";
*/
				string sql = "insert into usermap(iduser, mapdata) values('" +
					iduser + "', :bytesData)";
		
				NpgsqlCommand command = 
					new NpgsqlCommand(sql, aConnect);
		
				NpgsqlParameter param = new NpgsqlParameter(":bytesData", DbType.Binary);
				param.Value = map;
				command.Parameters.Add(param);
				command.ExecuteNonQuery();

				return 1;
				
			}
			catch
			{
				return 0;
			}
		}
		[WebMethod]
		[XmlInclude(typeof(UserPoint))]
		public ArrayList getUserPoint()
		{
			
			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=user;Password=password;Database=RestaurantService;");			
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select * from currentPoint";
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
			
				while(dr.Read())
				{					
					string iduser = (string)dr["iduser"];
					double latitude = (double)dr["latitude"];
					double longitude = (double)dr["longitude"];
					UserPoint up = new UserPoint(iduser,(float)latitude,(float)longitude);
					arr.Add(up);
				}
				return arr;
			}
			catch
			{
				return null;
			}
		}
		[WebMethod]
		public string getTest()
		{
			NpgsqlConnection aConnect;
			try
			{
				
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=tempuser;Password=temp;Database=restaurant;");			
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select * from restaurant";
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				string temp = "";
				while(dr.Read())
				{
					temp = (string)dr["rname"];			
						
				}
				return temp;
			}
			catch(Exception e)
			{
				return "error"+e.ToString();
			}
		}

		[WebMethod]//find all menu in restaurant  
		[XmlInclude(typeof(Menu))]
		public Menu[] getAllMenu(string id_restaurant,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}

			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=restaurant;");			
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select * from menu where idmenu in ("+
					"select idmenu from res_menu where idrestaurant ="+id_restaurant+")";


				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					string menu = (string)dr["menu"];
					string type = (string)dr["type"];
					int cost = (int)dr["cost"];
					int tenstar = (int)dr["tenstar"];
					Menu m1 = new Menu(menu,type,cost,tenstar);					
					arr.Add(m1);
				}
				return (Menu[])arr.ToArray(typeof(Menu));
			}
			catch
			{
				return null;
			}
		}
		
		[WebMethod]//find map 
		public byte[] getMapRes(double latitude,double longitude,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}

			NpgsqlConnection aConnect;
			try
			{
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=user;Password=password;Database=RestaurantService;");			
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select mapdata from map where idrestaurant = "+
					"(select idrestaurant from restaurant "+
					"where latitude = '"+
					latitude	+	"' and longitude = '"+
					longitude	+	"')";
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				byte[] temp = (Byte[])command.ExecuteScalar();
				
				return temp;
				
			}
			catch
			{
				return null;
			}
		}
		
		[WebMethod]//findn restaurant detail
		public Restaurant getRestaurant(int rid,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}

			NpgsqlConnection aConnect;
			Restaurant res = new Restaurant();
			
			try
			{
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=user;Password=password;Database=RestaurantService;");			
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select * from restaurant where idrestaurant = "+rid;
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					int id = (int)dr["idrestaurant"];
					string rname = (string)dr["rname"];
					string province = (string)dr["province"];
					string amphur = (string)dr["amphur"];
					string district = (string)dr["district"];
					string zone = (string)dr["zone"];
					int zipcode = (int)dr["zipcode"];
					string telephone = (string)dr["telephone"];
					double latitude = Convert.ToDouble(dr["latitude"]);
					double longitude = Convert.ToDouble(dr["longitude"]);
					string type = (string)dr["type"];
					Position p1 = new Position(latitude,longitude);
					string road = (string)(dr["road"]+"");
					Address  a1 = new Address(province,amphur,district,zone,zipcode,road);
					string valid = (string)dr["valid"];
					string reserve = (string)dr["reserve"];
					res = new Restaurant(id,rname,telephone,type,p1,a1,valid,reserve);
						
				}
				return res;
			}
			catch(Exception e)
			{
				return null;
			}
		}
		
		[WebMethod]//find all promotion of resaturant
		public Promotion[] getPromotion(string id_restaurant,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}

			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				
				
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select * from promotion where idpromotion in ("+
					"select idpromotion from res_promotion where idrestaurant = "+id_restaurant+")";


				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					string promotion = (string)dr["promotion"];
					string note = (string)dr["note"];
					string reserve = (string)(dr["reserve"]+"");
					Promotion p1 = new Promotion(promotion,note,reserve);
					arr.Add(p1);
				}

				return (Promotion[])arr.ToArray(typeof(Promotion));
			}
			catch
			{
				return null;
			}

		}
		[WebMethod]
		public int uploadIMG(string userid,string img)
		{
			//  byte []temp = new Test().ReadBitmap2ByteArray("");
			//	int length = temp.Length;
			NpgsqlConnection aConnect;
			Database da = new Database();
			try
			{
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=user;Password=password;Database=RestaurantService;");			
				aConnect = Database.connected();
				aConnect.Open();  
			
				string sqlQuery = "insert into map(idrestaurant, mapdata) values ('"+
					userid    +"','"+
					img +"')";
				NpgsqlCommand command = new NpgsqlCommand(sqlQuery,aConnect);
			
				NpgsqlDataReader dr = command.ExecuteReader();
				return 7;
				
			}
			catch
			{
				return 0;
			}
			

		}

		[WebMethod]
		public int uploadIMG2(string userid,byte[] img)
		{
			NpgsqlConnection aConnect;
			try
			{
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=user;Password=password;Database=RestaurantService;");			
				aConnect = Database.connected();
				aConnect.Open();  
			
				NpgsqlCommand command = 
					new NpgsqlCommand("insert into map(idrestaurant, mapdata) values('" +
					userid + "',:bytesData)", aConnect);
		
				NpgsqlParameter param = new NpgsqlParameter(":bytesData", DbType.Binary);
				param.Value = img;
				command.Parameters.Add(param);
				command.ExecuteNonQuery();

				return 1;
				
			}
			catch
			{
				return 0;
			}
		}

		[WebMethod(EnableSession=true)]
		[XmlInclude(typeof(Floor))]
		[XmlInclude(typeof(Polygon))]
		[XmlInclude(typeof(InteriorPoint))]
		[XmlInclude(typeof(Building))]
		public Building getBuilding(int building_id)
		{
			Building bd = new Building();		
			NpgsqlConnection aConnect;
			try
			{
				aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=interior;");
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=placemark;");			
				aConnect.Open();  

				// Get name from of this building
				string sqlQuery = "select * from Building where id = "+ building_id.ToString();
				NpgsqlCommand command = new NpgsqlCommand(sqlQuery, aConnect);
				NpgsqlDataReader dr = command.ExecuteReader();
				dr.Read();

				bd.id = (int)dr["id"];
				bd.name = (string)("" + dr["name"]);
				if (!dr.IsDBNull(dr.GetOrdinal("latitude")))
					bd.lat = Convert.ToDouble((dr["latitude"]));
				if (!dr.IsDBNull(dr.GetOrdinal("longitude")))
					bd.lon = Convert.ToDouble((dr["longitude"]));

				ArrayList floor = new ArrayList();

				// Get floor data of this building
				sqlQuery = "select * from Floor where building_id = " + building_id;
				command = new NpgsqlCommand(sqlQuery, aConnect);
				dr = command.ExecuteReader();
				while(dr.Read())
				{
					Floor tempFloor = new Floor();
					tempFloor.id = (int) dr["id"];
					tempFloor.name = (string) dr["name"];
					tempFloor.background = (byte[]) dr["background"];

					ArrayList polygon = new ArrayList();

					// Get polygon of this floor
					sqlQuery = "select * from Polygon where building_id = " + building_id +
						" AND floor_id = " + tempFloor.id;
					command = new NpgsqlCommand(sqlQuery, aConnect);
					NpgsqlDataReader dr2 = command.ExecuteReader();
					dr2 = command.ExecuteReader();
					while(dr2.Read())
					{
						Polygon tempPolygon = new Polygon();
						tempPolygon.id = (int) dr2["id"];
						tempPolygon.name = (string) dr2["name"];
						tempPolygon.showname = (string) dr2["showname"];
						tempPolygon.desc = (string) dr2["desc"];
						tempPolygon.shopid = (int) dr2["restaurantid"];

						ArrayList point = new ArrayList();

						// Get point of this polygon
						sqlQuery = "select * from Point where building_id = " + building_id +
							" AND polygon_id = " + tempPolygon.id;
						command = new NpgsqlCommand(sqlQuery, aConnect);
						NpgsqlDataReader dr3 = command.ExecuteReader();
						dr3 = command.ExecuteReader();
						while(dr3.Read())
						{
							InteriorPoint tempPoint = new InteriorPoint();
							tempPoint.x = (int) dr3["x"];
							tempPoint.y = (int) dr3["y"];

							point.Add(tempPoint);
						}

						tempPolygon.point = (InteriorPoint[])(point.ToArray(typeof(InteriorPoint)));
						polygon.Add(tempPolygon);
					}

					tempFloor.polygon = (Polygon[])(polygon.ToArray(typeof(Polygon)));
					floor.Add(tempFloor);
				}

				bd.floor = (Floor[])(floor.ToArray(typeof(Floor)));
				return bd;
			}
			catch(Exception e)
			{
				Console.Out.WriteLine(e.ToString());
				return null;
			}
			
		}

		[WebMethod]
		public int uploadBuilding(Building bd)
		{
			NpgsqlConnection aConnect;
			try
			{
				aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=Interior;");	
				aConnect.Open();  

				// Insert building to database
				int building_id = 0;
				string sqlQuery = "insert into Building(name) values ('"+
					bd.name + "')";
				NpgsqlCommand command = new NpgsqlCommand(sqlQuery,aConnect);
			
				NpgsqlDataReader dr = command.ExecuteReader();


				// Get id from of this building
				sqlQuery = "select * from Building where name = '"+bd.name+"'";
				command = new NpgsqlCommand(sqlQuery, aConnect);
				dr = command.ExecuteReader();
				while(dr.Read())
				{
					building_id = (int) dr["id"];
				}

				foreach(Floor fl in bd.floor)
				{
					// Insert floor information
					sqlQuery = "insert into Floor values(" +
						fl.id + ", '" +
						fl.name + "', :bytesData, " +
						building_id + ")";
					command = new NpgsqlCommand(sqlQuery, aConnect);
		
					NpgsqlParameter param = new NpgsqlParameter(":bytesData", DbType.Binary);
					byte[] tt = fl.background;

					param.Value = tt;
					command.Parameters.Add(param);
					command.ExecuteNonQuery();
				

					foreach(Polygon poly in fl.polygon)
					{
						// Polygon information
						sqlQuery = "insert into Polygon values ("+
							poly.id + ", '" +
							poly.name + "', '" +
							poly.showname + "', '" +
							poly.desc + "', " +
							fl.id + ", " +
							building_id + ")";
						command = new NpgsqlCommand(sqlQuery,aConnect);
						dr = command.ExecuteReader();

						foreach(InteriorPoint p in poly.point)
						{
							// Marker information
							sqlQuery = "insert into Point(x, y, polygon_id, building_id) values ("+
								p.x + ", " +
								p.y + ", " +
								poly.id + ", " +
								building_id + ")";
							command = new NpgsqlCommand(sqlQuery,aConnect);
							dr = command.ExecuteReader();
						}
					}
				}
			
				return building_id;
				
			}
			catch(Exception e)
			{
				Console.Out.WriteLine(e.ToString());
				return 0;
			}
		}

		[WebMethod]
		public int uploadFloor(Floor fl)
		{
			return 1;
		}

		[WebMethod]
		public int uploadPolygon(Polygon poly)
		{
			return 1;
		}

		[WebMethod]
		public int uploadPoint(InteriorPoint p)
		{
			return 1;
		}

		public int uploadIMG3(string userid,byte[] img)
		{
			NpgsqlConnection aConnect;
			try
			{
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=user;Password=password;Database=RestaurantService;");			
				aConnect = Database.connected();
				aConnect.Open();  
			
				NpgsqlCommand command = 
					new NpgsqlCommand("insert into currentpoint(idrestaurant, mapdata) values('" +
					userid + "',:bytesData)", aConnect);
		
				NpgsqlParameter param = new NpgsqlParameter(":bytesData", DbType.Binary);
				param.Value = img;
				command.Parameters.Add(param);
				command.ExecuteNonQuery();

				return 1;
				
			}
			catch
			{
				return 0;
			}
		}
		

		[WebMethod]//find restaurant in province
		[XmlInclude(typeof(Restaurant))]
		public Restaurant[] find_restaurant_P(string province,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}

			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=restaurant;");			
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select * from restaurant where province like '%"+province+"%'";
							

				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					int id = (int)dr["idrestaurant"];
					string rname = (string)dr["rname"];
					string pr = (string)dr["province"];
					string amphur = (string)(dr["amphur"]+"");
					string district = (string)(dr["district"]+"");
					string zone = (string)(dr["zone"]+"");
					int zipcode = 0;
					if(!dr.IsDBNull(dr.GetOrdinal("zipcode")))
						zipcode = (int)dr["zipcode"];
					string telephone = (string)(dr["telephone"]+"");
					double la =0;
					double lo =0;
					
					if(!dr.IsDBNull(dr.GetOrdinal("latitude"))) //check this field is empty ?
						la = (double)dr["latitude"];
					if(!dr.IsDBNull(dr.GetOrdinal("longitude"))) //check this field is empty ?
						lo = (double)dr["longitude"];

					string type = (string)(dr["type"]+"");
					Position p1 = new Position(la,lo);
					string road = (string)(dr["road"]+"");
					Address  a1 = new Address(pr,amphur,district,zone,zipcode,road);
					string valid = (string)(dr["valid"]+"");
					string reserve = (string)(dr["reserve"]+"");
					Restaurant restaurant = new Restaurant(id,rname,telephone,type,p1,a1,valid,reserve);					
					
					arr.Add(restaurant);
				}
				return (Restaurant[])arr.ToArray(typeof(Restaurant));
			}
			catch
			{
				return null;
			}
		}


		[WebMethod]//find restaurant in province/amphur
		public Restaurant[] find_restaurant_PA(string province,string amphur,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}

			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=restaurant;");			
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select * from restaurant where province like '%"+province+"%'"+
					"and amphur like '%"+amphur+"%'";
							

				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					int id = (int)dr["idrestaurant"];
					string rname = (string)dr["rname"];
					string pr = (string)dr["province"];
					string am = (string)(dr["amphur"]+"");
					string district = (string)(dr["district"]+"");
					string zone = (string)(dr["zone"]+"");
					int zipcode = 0;
					if(!dr.IsDBNull(dr.GetOrdinal("zipcode")))
						zipcode = (int)dr["zipcode"];
					string telephone = (string)(dr["telephone"]+"");
					double la =0;
					double lo =0;
					
					if(!dr.IsDBNull(dr.GetOrdinal("latitude"))) //check this field is empty ?
						la = (double)dr["latitude"];
					if(!dr.IsDBNull(dr.GetOrdinal("longitude"))) //check this field is empty ?
						lo = (double)dr["longitude"];

					string type = (string)(dr["type"]+"");
					Position p1 = new Position(la,lo);
					string road = (string)(dr["road"]+"");
					Address  a1 = new Address(pr,am,district,zone,zipcode,road);
					string valid = (string)(dr["valid"]+"");
					string reserve = (string)(dr["reserve"]+"");
					Restaurant restaurant = new Restaurant(id,rname,telephone,type,p1,a1,valid,reserve);					

					arr.Add(restaurant);
				}
				return (Restaurant[])arr.ToArray(typeof(Restaurant));
			}
			catch
			{
				return null;
			}
		}

	
		[WebMethod]//find restaurant in province/amphur/district
		public Restaurant[] find_restaurant_PAD(string province,string amphur,string district,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}

			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=restaurant;");			
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select * from restaurant where province like '%"+province+"%'"+
					" and district like '%"+ district+"%'  and amphur like '%"+amphur+"%'";
							

				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					int id = (int)dr["idrestaurant"];
					string rname = (string)dr["rname"];
					string pr = (string)dr["province"];
					string am = (string)(dr["amphur"]+"");
					string di = (string)(dr["district"]+"");
					string zone = (string)(dr["zone"]+"");
					int zipcode = 0;
					if(!dr.IsDBNull(dr.GetOrdinal("zipcode")))
						zipcode = (int)dr["zipcode"];
					string telephone = (string)(dr["telephone"]+"");
					double la =0;
					double lo =0;
					
					if(!dr.IsDBNull(dr.GetOrdinal("latitude"))) //check this field is empty ?
						la = (double)dr["latitude"];
					if(!dr.IsDBNull(dr.GetOrdinal("longitude"))) //check this field is empty ?
						lo = (double)dr["longitude"];

					string type = (string)(dr["type"]+"");
					Position p1 = new Position(la,lo);
					string road = (string)(dr["road"]+"");
					Address  a1 = new Address(pr,am,di,zone,zipcode,road);
					string valid = (string)(dr["valid"]+"");
					string reserve = (string)(dr["reserve"]+"");
					Restaurant restaurant = new Restaurant(id,rname,telephone,type,p1,a1,valid,reserve);					

					arr.Add(restaurant);
				}
				return (Restaurant[])arr.ToArray(typeof(Restaurant));
				
			}
			catch
			{
				return null;
			}
		}

		//.................................................
		//upload restaurant
		[WebMethod]
		[XmlInclude(typeof(Restaurant))]
		public bool uploadRestaurant(Restaurant res,string token)
		{

			bool check_sucess = false;

			return check_sucess;
		}

	
		//insert new Restaurant
		[WebMethod]
		public bool insert_res(Restaurant res,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				//return false;
			}
			bool check = false;
			string rname = "";
			string province = "";
			string amphur = "";
			string district = "";
			string zone = "";
			int zipcode = 0;
			string telephone = "";
			double latitude = 0;
			double longitude = 0;
			string type = "";
			string valid = "";
			string road = "";
			if(res.Name != null)
				rname = res.Name;
			if(res.Address.Province != null)
				province= res.Address.Province;
			if(res.Address.Amphur != null)
				amphur = res.Address.Amphur;
			if(res.Address.District != null)
				district = res.Address.District;
			if(res.Address.Zone != null)
				zone = res.Address.Zone;
			if(res.Address.Zipcode != 0)
				zipcode = res.Address.Zipcode;
			if(res.Telephone != null)
				telephone = res.Telephone;
			if(res.Position.Latitude != 0)
				latitude = res.Position.Latitude;
			if(res.Position.Longitude != 0)
				longitude = res.Position.Longitude;
			if(res.Type != null)
				type = res.Type;
			if(res.Valid != null)
				valid = res.Valid;
			if(res.Address.Road != null)
				road = res.Address.Road;
			//////////////////////////////////
			
			NpgsqlConnection aConnect;
						
			try
			{		
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "insert into restaurant "+
					"(rname,province,amphur,district,zone,zipcode,telephone,latitude,longitude,type,valid,road)values"+
					" ('"+rname+"','"+
					province+"','"+
					amphur+"','"+
					district+"','"+
					zone+"',"+
					zipcode+",'"+
					telephone+"',"+
					latitude+","+
					longitude+",'"+
					type+"','"+
					valid+"','"+
					road+"')";
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
				NpgsqlDataReader dr = command.ExecuteReader();
				check = true;
			}
			catch(Exception e)
			{
				check = false;
				return false;
			}
			//////////////////////////////////
			return check;
		}

		
		//get Picture from id restaurant  view of restaurant
		//return array of picture in restaurant
		[WebMethod]
		public RMap[]  getPicture(string id_restaurant,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}

			NpgsqlConnection aConnect;
			ArrayList arr = new ArrayList();
			
			try
			{
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=user;Password=password;Database=RestaurantService;");			
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select pic_res from res_pic where idrestaurant ="+id_restaurant;
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
				
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					RMap map = new RMap();
					map.map = (byte[])dr["pic_res"];
					arr.Add(map);
				}
				return (RMap[])arr.ToArray(typeof(RMap));
				
			}
			catch(Exception e)
			{
				return null;
			}
			
		}



		//FUNCTION FOR  BOOK RESTAURANT
		//check username and password befor process
		//Befor call Function must call Function check_res_PWD for get token 
		//and then pass token to every functions
		[WebMethod]
		public string check_res_PWD(string user,string pass)
		{
			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
			string token = null;
						
			try
			{		
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select iduser from restaurantuser where "+
					"username = '"+user+
					"' and password = '"+pass+"'";
				
				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				if(dr.Read())
				{
					//check = true;
					int iduser = (int)dr["iduser"];
					token = GetMyToken();
					SaveMyStuff(iduser.ToString(),token); 
					return token;
				}
				
				dr.Close();
				aConnect.Close();
			}
			catch
			{
				return null;
			}
			return token;
		}
		
		//FUNCTION GET IDUSER RESTAURANT FROM TOKEN
        

		//Function For Restaurant
		//id_user = ID who book restaurant
		//date_book = date to book
		//token = password get from  Function checkPassword
		//time fomat : TIMESTAMP '2004-10-19 10:23:54'
		[WebMethod]
		public bool add_book(string id_identity,string date_book,string date_end,int id_table,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return false;
			}

			bool check = false;
			string id_restaurant =  GetMyStuff(token);
			if(id_restaurant != null)
			{
				NpgsqlConnection aConnect;
						
				try
				{		
					aConnect = Database.connected();
					aConnect.Open();  
					//string sql = "insert into user_restaurant_book (identity,idrestaurant,datebook,idtable,date_end) values ("+id_identity+","+id_restaurant+",'"+date_book+"',"+id_table.ToString()+",'"+date_end+"')";
					string sql = "insert into user_restaurant_book (iduser,idrestaurant,datebook,idtable,date_end,identity) values ((select iduser from generaluser where identitycard = '"+id_identity+"'),'"+id_restaurant+"','"+date_book+"','"+id_table+"','"+date_end+"','"+id_identity+"')";
					NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
					NpgsqlDataReader dr = command.ExecuteReader();
					dr.Close();
					aConnect.Close();
					check = true;
				}
				catch
				{
					return check;
				}
			}
			
			return check;
		}
		//Update  time book  and table
		[WebMethod]
		public bool update_book(string id_identity,string date_book,int id_table,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return false;
			}
			bool check = false;
			string id_restaurant =  GetMyStuff(token);
			if(id_restaurant != null)
			{
				NpgsqlConnection aConnect;
						
				try
				{		
					aConnect = Database.connected();
					aConnect.Open();  
					string sql = "update user_restaurant_book set datebook = '"+date_book+"',idtable ="+id_table.ToString()+" where identity = "+id_identity+" and idrestaurant = "+id_restaurant;
					NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
					NpgsqlDataReader dr = command.ExecuteReader();
					dr.Close();
					aConnect.Close();
					check = true;
				}
				catch
				{
					return check;
				}
			}
			
			return check;
		}
		[WebMethod]
		public bool del_book(string id_identity,string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return false;
			}

			bool check = false;
			string id_restaurant =  GetMyStuff(token);
			if(id_restaurant != null)
			{
				NpgsqlConnection aConnect;
						
				try
				{		
					aConnect = Database.connected();
					aConnect.Open();  
					string sql = "delete from user_restaurant_book where identity = "+id_identity+" and idrestaurant = "+id_restaurant;
					NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
					NpgsqlDataReader dr = command.ExecuteReader();
					dr.Close();
					aConnect.Close();
					check = true;
				}
				catch
				{
					return check;
				}
			}
			
			return check;
		}


		//Function For Pocket PC  Get Informatio about Book Restaurant
		[WebMethod(EnableSession=true)]
		public Reserve[] get_Reserve(string token)
		{
			//check token before process function
			if(checkToken(token).Equals("false"))
			{
				return null;
			}
			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;
						
			try
			{
				string id_user = GetMyStuff(token);
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=restaurant;");			
				aConnect = Database.connected();
				aConnect.Open();  
				string sql = "select res.idrestaurant,res.rname,res.province,res.amphur,res.district,"+
					"res.zone,res.zipcode,res.telephone,res,latitude,res.longitude,res.type,"+
					"res.valid,res.reserve,res.road,book.datebook,book.date_end,book.idtable from "+
					"restaurant res,user_restaurant_book book where "+
					"book.iduser = "+id_user+// ID_USER
					" and book.idrestaurant = res.idrestaurant";

				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);
		
				NpgsqlDataReader dr = command.ExecuteReader();
				while(dr.Read())
				{
					int id = (int)dr["idrestaurant"];
					string rname = (string)dr["rname"];
					string pr = (string)dr["province"];
					string am = (string)(dr["amphur"]+"");
					string di = (string)(dr["district"]+"");
					string zone = (string)(dr["zone"]+"");
					int zipcode = 0;
					if(!dr.IsDBNull(dr.GetOrdinal("zipcode")))
						zipcode = (int)dr["zipcode"];
					string telephone = (string)(dr["telephone"]+"");
					double la =0;
					double lo =0;
					
					if(!dr.IsDBNull(dr.GetOrdinal("latitude"))) //check this field is empty ?
						la = Convert.ToDouble(dr["latitude"]);
					if(!dr.IsDBNull(dr.GetOrdinal("longitude"))) //check this field is empty ?
						lo = Convert.ToDouble(dr["longitude"]);

					string type = (string)(dr["type"]+"");
					Position p1 = new Position(la,lo);
					string road = (string)(dr["road"]+"");
					Address  a1 = new Address(pr,am,di,zone,zipcode,road);
					string valid = (string)(dr["valid"]+"");
					string r = (string)(dr["reserve"]+"");
					//string r = "aa";
					Restaurant restaurant = new Restaurant(id,rname,telephone,type,p1,a1,valid,r);					
					string time  = (string)(dr["datebook"]+"");
					string time_end  = (string)(dr["date_end"]+"");
					int table =  (int)dr["idtable"];
					Reserve reserve = new Reserve(restaurant,time,time_end,table);

					arr.Add(reserve);
				}
				return (Reserve[])arr.ToArray(typeof(Reserve));
				
			}
			catch
			{
				return null;
			}
		}

		public string query_building(string s)
		{
			return " and (lower(name) like '%" + s.ToLower() + "%') ";
		}

		[WebMethod(EnableSession=true)]
		[XmlInclude(typeof(Building2))]
		public Building2[] find_Building(string building_name)
		{
			ArrayList bd = new ArrayList();
			NpgsqlConnection aConnect;
			try
			{
				aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=interior;");
				//aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=placemark;");			
				aConnect.Open();

				// Get name from of this building
				//string sqlQuery = "select * from Building where lower(name) like '%" + building_name.ToLower() + "%'";
				string sqlQuery = "select * from Building where true";
				char[] sep = new char[] {' '};
				string[] query = building_name.Trim().Split(sep);
				for(int i=0;i<query.GetLength(0);i++)
				{
					sqlQuery += query_building(query[i]);
				}
				
				
				
				
				
				NpgsqlCommand command = new NpgsqlCommand(sqlQuery, aConnect);
				NpgsqlDataReader dr = command.ExecuteReader();
				while (dr.Read())
				{
					Building2 b = new Building2();
					b.id = (int)dr["id"];
					b.name = (string)("" + dr["name"]);
					if (!dr.IsDBNull(dr.GetOrdinal("latitude")))
						b.lat = Convert.ToDouble(dr["latitude"]);
					if (!dr.IsDBNull(dr.GetOrdinal("longitude")))
						b.lon = Convert.ToDouble(dr["longitude"]);
					bd.Add(b);
				}
				return (Building2[])(bd.ToArray(typeof(Building2)));
			}
			catch
			{                
				return null;
			}

		}
		
		public string query_restaurant(string s)
		{
			string ss = s.ToLower();
			string sql=" and ( false ";
			sql += "or (lower(rname) like '%" + ss + "%') ";
			sql += "or (lower(province) like '%" + ss + "%') ";
			sql += "or (lower(amphur) like '%" + ss + "%') ";
			sql += "or (lower(district) like '%" + ss + "%') ";
			sql += "or (lower(zone) like '%" + ss + "%') ";
			sql += "or (lower(zipcode) like '%" + ss + "%') ";
			sql += "or (lower(type) like '%" + ss + "%') ";
			sql += "or (lower(road) like '%" + ss + "%') ";
			sql += ")";
			return sql;
		}

		[WebMethod]//findn restaurant detail
		[XmlInclude(typeof(Restaurant))]
		public Restaurant[] find_Restaurant(string name, string token)
		{
			//check token before process function
			if (checkToken(token).Equals("false"))
			{
				return null;
			}

			NpgsqlConnection aConnect;
			ArrayList arr = new ArrayList();


			try
			{

				aConnect = Database.connected();
				aConnect.Open();
				//string sql = "select * FROM restaurant WHERE "
				//		   + "MATCH(name, province, amphur, district, type) AGAINST ('"
				//		   + name + "' IN BOOLEAN MODE)"; 

				string sql = "select * from restaurant where true";
				char[] sep = new char[] {' '};
				string[] query = name.Trim().Split(sep);
				for(int i=0;i<query.GetLength(0);i++)
				{
					sql += query_restaurant(query[i]);
				}


				//string query = 
				//sql += "((lower(rname) like '%" + name.ToLower() + "%') ";
				//sql += "or (lower(province) like '%" + name.ToLower() + "%') ";
				//sql += "or (lower(amphur) like '%" + name.ToLower() + "%') ";
				//sql += "or (lower(district) like '%" + name.ToLower() + "%') ";
				//sql += "or (lower(type) like '%" + name.ToLower() + "%')) ";

				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);

				NpgsqlDataReader dr = command.ExecuteReader();
				while (dr.Read())
				{
					int id = (int)dr["idrestaurant"];
					string rname = (string)dr["rname"];
					string pr = (string)dr["province"];
					string amphur = (string)(dr["amphur"] + "");
					string district = (string)(dr["district"] + "");
					string zone = (string)(dr["zone"] + "");
					int zipcode = 0;
					if (!dr.IsDBNull(dr.GetOrdinal("zipcode")))
						zipcode = (int)dr["zipcode"];
					string telephone = (string)(dr["telephone"] + "");
					double la = 0;
					double lo = 0;

					if (!dr.IsDBNull(dr.GetOrdinal("latitude"))) //check this field is empty ?
						la = Convert.ToDouble(dr["latitude"]);
					if (!dr.IsDBNull(dr.GetOrdinal("longitude"))) //check this field is empty ?
						lo = Convert.ToDouble(dr["longitude"]);

					string type = (string)(dr["type"] + "");
					Position p1 = new Position(la, lo);
					string road = (string)(dr["road"] + "");
					Address a1 = new Address(pr, amphur, district, zone, zipcode, road);
					string valid = (string)(dr["valid"] + "");
					string reserve = (string)(dr["reserve"] + "");
					Restaurant restaurant = new Restaurant(id, rname, telephone, type, p1, a1, valid, reserve);
					arr.Add(restaurant);
				}
				return (Restaurant[])(arr.ToArray(typeof(Restaurant)));
			}
			catch
			{
				return null;
			}
		}

		public string query_placemark(string s)
		{
			return " and (lower(nameplace) like '%" + s.ToLower() + "%') ";
		}

		[WebMethod]
		[XmlInclude(typeof(Placemark))]
		public Placemark[] find_Placemark(string name, string token)
		{
			//check token before process function
			if (checkToken(token).Equals("false"))
			{
				//return null;
			}

			ArrayList arr = new ArrayList();
			NpgsqlConnection aConnect;

			try
			{

				aConnect = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=placemark;");
				aConnect.Open();

				string sql = "select * from place where true";
				char[] sep = new char[] {' '};
				string[] query = name.Trim().Split(sep);
				for(int i=0;i<query.GetLength(0);i++)
				{
					sql += query_placemark(query[i]);
				}
				
				//string sql = "select * from place where lower(nameplace) like '%" + name.ToLower() + "%'";

				NpgsqlCommand command = new NpgsqlCommand(sql, aConnect);

				NpgsqlDataReader dr = command.ExecuteReader();
				while (dr.Read())
				{
					Placemark tempPlacemark = new Placemark();
					tempPlacemark.latitude = Convert.ToDouble(dr["latijude"]);
					tempPlacemark.longitude = Convert.ToDouble(dr["longtijude"]);
					tempPlacemark.name = (string)dr["nameplace"];
					tempPlacemark.type = (string)dr["type"];

					arr.Add(tempPlacemark);
				}
				return (Placemark[])arr.ToArray(typeof(Placemark));
			}
			catch
			{
				return null;
			}
		}

	}
	
}

