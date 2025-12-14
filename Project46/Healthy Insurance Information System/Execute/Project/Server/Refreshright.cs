using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Server
{
	/// <summary>
	/// Summary description for Refreshright.
	/// </summary>
	public class Refreshright
	{
		public Refreshright()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static void Refreshrightdirectfn(Object state)
		{			

			//รับว่าวันนั้นมีข้อมูลอะไรถูก updateบ้าง
			//			rubDataset=peopleService.updatePeople("12/09/2003");


			IFormatProvider cultureEng = new System.Globalization.CultureInfo("en-US",true);
			DateTime time=new DateTime();
			time=DateTime.Today;
			String[] tmp=time.GetDateTimeFormats('d',cultureEng);			
			String tmpcut=tmp[3].Substring(0,5);

			Console.WriteLine();
			Console.WriteLine();
			Console.WriteLine("########################### DIRECT #################################");
			Console.WriteLine("-----------------------[ Refresh Right ]----------------------------");
			Console.WriteLine("####################################################################");

			Console.WriteLine();
			try
			{

				//for logfile
				String conStr="";
				try
				{
					//String kucoke=Directory.GetCurrentDirectory();
					FileStream aFile=new FileStream(@"C:\Inetpub\configDBHealthy.txt",FileMode.Open);
					StreamReader sr=new StreamReader(aFile);
					conStr=sr.ReadToEnd();
					sr.Close();
				}
				catch(IOException ea)
				{
					Console.WriteLine("An IO exception has been thrown!");
					Console.WriteLine(ea.ToString());
				}
				//String strConn="data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";
				SqlConnection Conn=new SqlConnection(conStr);
				Conn.Open();
				SqlCommand command1=new SqlCommand("DELETE FROM Count_Edit_HOS",Conn);
				command1.ExecuteNonQuery();
				Conn.Close();
			}
			catch(Exception e)
			{
				Console.WriteLine("Error");
				Console.WriteLine(e.StackTrace);
			}
			Console.WriteLine("####################################################################");
			Console.Write("Please Select Number(press m to menu,press q to exit):");
		}//ฟังก์ฉัน

		public static void Refreshrightfn(Object state)
		{			

			//รับว่าวันนั้นมีข้อมูลอะไรถูก updateบ้าง
			//			rubDataset=peopleService.updatePeople("12/09/2003");

			IFormatProvider cultureEng = new System.Globalization.CultureInfo("en-US",true);
			DateTime time=new DateTime();
			time=DateTime.Today;
			String[] tmp=time.GetDateTimeFormats('d',cultureEng);			
			String tmpcut=tmp[3].Substring(0,5);


			if(tmpcut.Equals("01/01"))
			{

				Console.WriteLine();
				Console.WriteLine();
				Console.WriteLine("##########################   Auto   ###############################");
				Console.WriteLine("-----------------------[ Refresh Right ]----------------------------");
				Console.WriteLine("####################################################################");

				Console.WriteLine();
				try
				{

					//for logfile
					String conStr="";
					try
					{
						//String kucoke=Directory.GetCurrentDirectory();
						FileStream aFile=new FileStream(@"C:\Inetpub\configDBHealthy.txt",FileMode.Open);
						StreamReader sr=new StreamReader(aFile);
						conStr=sr.ReadToEnd();
						sr.Close();
					}
					catch(IOException ea)
					{
						Console.WriteLine("An IO exception has been thrown!");
						Console.WriteLine(ea.ToString());
					}
					//String strConn="data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";
					SqlConnection Conn=new SqlConnection(conStr);
					Conn.Open();
					SqlCommand command1=new SqlCommand("DELETE FROM Count_Edit_HOS",Conn);
					command1.ExecuteNonQuery();
					Conn.Close();
				}
				catch(Exception e)
				{
					Console.WriteLine("Error");
					Console.WriteLine(e.StackTrace);
				}
				Console.WriteLine("####################################################################");
				Console.Write("Please Select Number(press m to menu,press q to exit):");
			}
		}//ฟังก์ฉัน


	}
}
