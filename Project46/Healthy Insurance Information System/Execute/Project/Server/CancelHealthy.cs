using System;
using System.Threading;
using System.Data;
using System.Data.SqlClient;
using HealthyData;
using System.IO;

namespace Server
{
	/// <summary>
	/// Summary description for CancelHealthy.
	/// </summary>
	public class CancelHealthy
	{
		public CancelHealthy()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public static void verifyAndDeleteSocial(Object state)
		{
			//---for logfile
//			String strConn="data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";

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

			SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From Logfile",conStr);
			SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

			DataSet dataSet1=new DataSet();
			DataSet dataChange1=new DataSet();
			DataTable logtable=new DataTable();
			logfileAdapter.Fill(dataSet1);
			logtable=dataSet1.Tables[0];
			//--------------
			DataSet rubDataset=new DataSet();
			DataHealthy kucoke= new DataHealthy();
			Server.WebReference1.Service1 socialService=new Server.WebReference1.Service1();

			IFormatProvider cultureEng = new System.Globalization.CultureInfo("en-US",true);
			DateTime time=new DateTime();
			time=DateTime.Today;
			String[] tmp=time.GetDateTimeFormats('d',cultureEng);			

			rubDataset=socialService.updateSocial(tmp[3]);
//			rubDataset=socialService.updateSocial("12/09/2003");
			Console.WriteLine();
			Console.WriteLine();
			Console.WriteLine("####################################################################");
			Console.WriteLine("--------------- Result of Auto Run UpdateSocial --------------------");
			Console.WriteLine("####################################################################");
			Console.WriteLine();
			if(rubDataset.Tables[0].Rows.Count==0){	Console.WriteLine("Not Found");}
			foreach(DataTable table in rubDataset.Tables)
				foreach(DataRow row in table.Rows)
				{	//ตรวจสอบว่า ที่ส่งมานั้น ยังอยู่ในฐานข้อมูลจริง
					if(socialService.querySocial((String)row[0]).Tables[0].Rows.Count!=0)
					{
						DataRow logrow=logtable.NewRow();
						logrow["PID"]=row[0];
						logrow["Day_Change"]=tmp[5];
						logrow["Status_Change"]='1';
						logtable.Rows.Add(logrow);
						dataChange1=dataSet1.GetChanges(DataRowState.Added);
						logfileAdapter.Update(dataChange1);

						String kucoke1=kucoke.removeHealthy((String)row[0]);
						Console.WriteLine("Recieve Social:  "+row[0]+" Result of Remove >>"+kucoke1);
					}
				}
			Console.WriteLine();
			Console.WriteLine("####################################################################");
			Console.Write("Please Select Number(press m to menu,press q to exit):");
		}

		public static void verifyAndDeletePeople(Object state)
		{
			//for logfile
			//String strConn="data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";
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
			SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From Logfile",conStr);
			SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

			DataSet dataSet1=new DataSet();
			DataSet dataChange1=new DataSet();
			DataTable logtable=new DataTable();
			logfileAdapter.Fill(dataSet1);
			logtable=dataSet1.Tables[0];
			//---------------------

			DataSet rubDataset=new DataSet();
			DataHealthy kucoke= new DataHealthy();
			Server.WebReference2.Service1 peopleService=new Server.WebReference2.Service1();

			IFormatProvider cultureEng = new System.Globalization.CultureInfo("en-US",true);
			DateTime time=new DateTime();
			time=DateTime.Today;
			String[] tmp=time.GetDateTimeFormats('d',cultureEng);			

			rubDataset=peopleService.updateOffice(tmp[3]);
//			rubDataset=peopleService.updateOffice("12/03/2003");
			Console.WriteLine();
			Console.WriteLine();
			Console.WriteLine("####################################################################");
			Console.WriteLine("--------------- Result of Auto Run UpdateOffice --------------------");
			Console.WriteLine("####################################################################");
			DataSet datasetInput=new DataSet();
			Console.WriteLine();
			if(rubDataset.Tables[0].Rows.Count==0){Console.WriteLine("Not Found");}
			foreach(DataTable table in rubDataset.Tables)
				foreach(DataRow row in table.Rows)
				{
					datasetInput=kucoke.queryPeople((String)row[0]);
					int tableIndex=datasetInput.Tables.Count-1;//เพราะว่า dataset ที่return มีตารางที่ไดนามิก มันเลยสร้างตารางใหม่
					//ตรวจสอบว่า ที่ส่งมานั้น ยังอยู่ในฐานข้อมูลจริง
					if(tableIndex==0)
					{
						DataRow logrow=logtable.NewRow();
						logrow["PID"]=row[0];
						logrow["Day_Change"]=tmp[5];
						logrow["Status_Change"]='2';
						logtable.Rows.Add(logrow);
						dataChange1=dataSet1.GetChanges(DataRowState.Added);
						logfileAdapter.Update(dataChange1);

						String kucoke1=kucoke.removeHealthy((String)row[0]);
						Console.WriteLine("Recieve Officer:  "+row[0]+" Result of Remove In Data Healthy >>"+kucoke1);
					}
					else if(datasetInput.Tables[tableIndex].Rows.Count==0){Console.WriteLine("Recieve Input"+row[0]+"is not People");}
					else{Console.WriteLine("Recieve Input"+row[0]+"is not Officer");}
				}
			Console.WriteLine();
			Console.WriteLine("####################################################################");
			Console.Write("Please Select Number(press m to menu,press q to exit):");
		}
		[STAThread]
		static void Main(string[] args)
		{
			char rubChar;
			String timeSocial="00:00";
			String timeOfficer="00:00";
			String timePeople="00:01";
			String timeRefresh="00:00";
			CancelHealthy cancelHealthy=new CancelHealthy();
			UpdateHealthy updateHealthy=new UpdateHealthy();
			Refreshright  refreshright=new Refreshright();
			int initinterval=solveInterval("00:00");
			Timer timerSocial=new Timer(new TimerCallback(CancelHealthy.verifyAndDeleteSocial),null,initinterval,86400000);
			Timer timerOfficer=new Timer(new TimerCallback(CancelHealthy.verifyAndDeletePeople),null,initinterval,86400000);
			Timer timerPeople=new Timer(new TimerCallback(UpdateHealthy.verifyAndUpdate),null,initinterval,86400000);
			Timer timerRefresh=new Timer(new TimerCallback(Refreshright.Refreshrightfn),null,initinterval,86400000);
			do
			{
				Console.WriteLine("####################################################################");
				Console.WriteLine("############################   SERVER   ############################");
				Console.WriteLine("####################################################################");
				Console.WriteLine("1. To Call Delete Data from UpdateSocial");
				Console.WriteLine("2. To Call Delete Data from UpdateOfficer");
				Console.WriteLine("3. To Call Update Data from UpdatePeople");
				Console.WriteLine("4. To Call Refresh Right");
				Console.WriteLine("5. Change Auto runtime of Call UpdateSocial");
				Console.WriteLine("6. Change Auto runtime of Call UpdateOfficer");
				Console.WriteLine("7. Change Auto runtime of Call UpdatePeople");
				Console.WriteLine("--------------------------------------------------------------------");
				Console.WriteLine("UpdateSocial["+timeSocial+"] UpdateOfficer["+timeOfficer+"] UpdatePeople["+timePeople+"]");// RefreshRight["+timeRefresh+"]");				
				Console.WriteLine("--------------------------------------------------------------------");
				Console.Write("Please Select Number(press m to menu,press q to exit):");
				String rubinput=Console.ReadLine();
				if(rubinput.Length==1)
				{
					rubChar=rubinput[0]; 
					switch(rubChar)
					{
						case '1':CancelHealthy.verifyAndDeleteSocial(null);break;						
						case '2':CancelHealthy.verifyAndDeletePeople(null);break;						
						case '3':UpdateHealthy.verifyAndUpdate(null) ;break;
						case '4':Refreshright.Refreshrightdirectfn(null) ;break;
						case '5':{
							Console.Write("What time do you want:");			
							String rubtime=Console.ReadLine();
							int rubinterval=solveInterval(rubtime);
							if (rubinterval>=0)
							{
								timeSocial=rubtime;
								timerSocial.Change(rubinterval,86400000);
							}
							break;
						}
						case '6':{
							Console.Write("What time do you want:");			
							String rubtime=Console.ReadLine();
							int rubinterval=solveInterval(rubtime);
							if (rubinterval>=0)
							{							
								timeOfficer=rubtime;
								timerOfficer.Change(rubinterval,86400000);
							}
							break;
						}
						case '7':{
							Console.Write("What time do you want:");			
							String rubtime=Console.ReadLine();
							int rubinterval=solveInterval(rubtime);
							if (rubinterval>=0)
							{
								timePeople=rubtime;
								timerPeople.Change(rubinterval,86400000);
							}
							break;
						}
						case 'q':break;
						case 'm':break;
						default:Console.WriteLine(">> !!! Please Input Not Match");break;
					}
				}
				else{rubChar='0';Console.WriteLine(">> !!! Please Input One Character");}
				Console.WriteLine();
				Console.WriteLine("--------------------------------------------------------------------");
				Console.WriteLine();Console.WriteLine();
			}while(rubChar!='q');
			timerOfficer.Dispose();
			timerPeople.Dispose();
			timerSocial.Dispose();
		}



		static int solveInterval(String wantedtime)
		{
			DateTime time=new DateTime();
			time=DateTime.Now;
			String[] tmp=time.GetDateTimeFormats('t');
			//Console.WriteLine(tmp[1]);
			//Console.WriteLine(wantedtime);

			String temp1,temp2;
			temp1=tmp[1].Substring(0,2);
			temp2=tmp[1].Substring(3,2);

			int realhour=Int32.Parse(temp1);
			int realminute=Int32.Parse(temp2);

//			Console.WriteLine(realhour);
//			Console.WriteLine(realminute);
			
			int rubhour;
			int rubminute;
			int countinterval=0;

			if((wantedtime[2]==':')&&(wantedtime.Length==5))
			{
				String tmp1,tmp2;
				tmp1=wantedtime.Substring(0,2);
				tmp2=wantedtime.Substring(3,2);
				rubhour=Int32.Parse(tmp1);
				rubminute=Int32.Parse(tmp2);
//				Console.WriteLine(rubhour);
//				Console.WriteLine(rubminute);
				int counthour,countminute;

				if(realhour<rubhour)
				{
					int sead=(60-realminute);
					realhour++;
					if(rubhour==realhour){countinterval=rubminute+sead;countinterval*=60000;}
					else
					{
						counthour=rubhour-realhour;
						countminute=sead+rubminute;
						countinterval=(counthour*60)+countminute;
						countinterval*=60000;					
					}
				}
				else if(realhour>rubhour)
				{
					int sead=(60-realminute);
					realhour++;
					counthour=(24-realhour)+rubhour;
					countminute=sead+rubminute;
					countinterval=(counthour*60)+countminute;
					countinterval*=60000;					
				}
				else//realhour=rubminute
				{
					if(realminute<rubminute)
					{
						countinterval=rubminute-realminute;
						countinterval*=60000;					
					}
					else if(realminute>rubminute)
					{
						countinterval=(60-realminute)+rubminute+(60*23);						
						countinterval*=60000;					
					}
					else{countinterval=0;}
				}

				if(countinterval>=60000)
				{
					time=DateTime.Now;
					countinterval-=(time.Second*1000);
				}

			}
			else{Console.WriteLine(">>No Format"); countinterval=-1;}
			//Console.WriteLine("test"+countinterval);
			return countinterval;
		}

	}
}
