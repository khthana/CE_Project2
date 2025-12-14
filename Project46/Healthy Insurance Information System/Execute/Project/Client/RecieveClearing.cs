using System;
using System.Data;
using System.IO;
using System.Threading;
using HospitalComponent;
using System.Data.SqlClient;

namespace Client
{
	/// <summary>
	/// Summary description for RecieveClearing.
	/// </summary>
	public class RecieveClearing
	{
		public RecieveClearing()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static void recieveClearingFn(Object state)
		{
			
			Hospital hospitalcomponent=new Hospital();

			IFormatProvider cultureEng = new System.Globalization.CultureInfo("en-US",true);
			DateTime time=new DateTime();
			time=DateTime.Today;
			String[] tmp=time.GetDateTimeFormats('d',cultureEng);			
//เตรียมข้อมูล
			HospitalComponent.WebReference1.ClearingDataset rubDataset=new HospitalComponent.WebReference1.ClearingDataset();
			HospitalClearing targetdataset=new HospitalClearing();
			HospitalClearing dataChange1=new HospitalClearing();
//เรียก service
			String hosid=hospitalcomponent.getCurrentHosId();
			rubDataset=hospitalcomponent.receiveClearing(hosid,tmp[5]);

			Console.WriteLine();
			Console.WriteLine();
			Console.WriteLine("####################################################################");
			Console.WriteLine("--------------- Result of Auto RecieveClearing --------------------");
			Console.WriteLine("####################################################################");
			Console.WriteLine();
			if(rubDataset.Tables[0].Rows.Count==0){	Console.WriteLine("Not Found");}
			DataSet detect=new DataSet();
			DataSet detectalreadyhave=new DataSet();
			foreach(DataTable table in rubDataset.Tables)
				foreach(DataRow row in table.Rows)
				{
					detect=hospitalcomponent.queryHealthy((String)row["PID"]);

					if(detect.Tables[0].Rows.Count!=0)
					{
						//ตรวจสอบว่า ที่ส่งมานั้น ยังอยู่ในฐานข้อมูลจริง							
						if(detect.Tables[0].Rows[0]["HSTATUS"].Equals("1"))
						{
								String hossubreal=detect.Tables[0].Rows[0]["HOSPSUB"].ToString();
								//copyเข้าฐานข้อมูลจาก rubdataset to targetdataset
								DataRow createRows=targetdataset.Tables[0].NewRow();
								createRows["PID"]=row["PID"];
								//-----------------------------------
								//String strConn="data source=EKOC;initial catalog=datahospital;password=kucoke;persist security info=True;user id=dbhospital;workstation id=EKOC;packet size=4096";
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

									SqlDataAdapter forcard=new SqlDataAdapter("SELECT MAX(CONVERT(numeric, BILL_ID)) FROM CLEARING",conStr);
									DataSet rubidcard=new DataSet();
									forcard.Fill(rubidcard);
									String x=rubidcard.Tables[0].Rows[0][0].ToString();
									int cardid=0;
									if(!x.Equals(""))
									{
										cardid=Int32.Parse(x);
									}
									cardid++;
									createRows["BILL_ID"]=cardid;								
								//-----------------------------------
								createRows["DATE_BILL"]=row["DATE_BILL"];
								createRows["DISEASE"]=row["DISEASE"];
								createRows["COST_MEDICINE"]=row["COST_MEDICINE"];
								createRows["COST_DOCTOR"]=row["COST_DOCTOR"];
								createRows["COST_ROOM"]=row["COST_ROOM"];
								createRows["COST_TREAT"]=row["COST_TREAT"];
								createRows["COST_OTHER"]=row["COST_OTHER"];
								createRows["COST_SUM"]=row["COST_SUM"];
								createRows["HSTATUS"]="1";
								createRows["HOSPMAIN"]=row["HOSPMAIN"];
								createRows["HOSPSUB"]=row["HOSPSUB"];
								String hosdataid=row["HOSPSUB"].ToString();
								if(hosdataid.Equals(hossubreal))
								{
									createRows["HOSPSTATUS"]="4";
								}
								else
								{
									createRows["HOSPSTATUS"]="5";
								}

								targetdataset.Tables[0].Rows.Add(createRows);
								dataChange1 =(HospitalComponent.HospitalClearing)targetdataset.GetChanges(DataRowState.Added);
								String result=hospitalcomponent.insertClearing(dataChange1);
								Console.WriteLine("Recieve Clearing:  "+row["PID"]+" Result of Insert >>"+result);
						}
					}
				}
			Console.WriteLine();
			Console.WriteLine("####################################################################");
			Console.Write("Please Select Number(press m to menu,press q to exit):");
		}

		[STAThread]
		static void Main(string[] args)
		{
			char rubChar;
			String timeClearing="00:00";
			RecieveClearing receieveClearing=new RecieveClearing();
			int initinterval=solveInterval(timeClearing);
			Timer timerClearing=new Timer(new TimerCallback(RecieveClearing.recieveClearingFn),null,initinterval,86400000);
			do
			{
				Console.WriteLine("####################################################################");
				Console.WriteLine("############################   Client   ############################");
				Console.WriteLine("####################################################################");
				Console.WriteLine("1. To Call Recieve Clearing Data from Server");
				Console.WriteLine("2. Change Auto runtime of Call Recieve Clearing Data");
				Console.WriteLine("--------------------------------------------------------------------");
				Console.WriteLine("Clearing Time :"+timeClearing);				
				Console.WriteLine("--------------------------------------------------------------------");
				Console.Write("Please Select Number(press m to menu,press q to exit):");
				String rubinput=Console.ReadLine();
				if(rubinput.Length==1)
				{
					rubChar=rubinput[0]; 
					switch(rubChar)
					{
						case '1':RecieveClearing.recieveClearingFn(null);break;						
						case '2':
						{
							Console.Write("What time do you want:");			
							String rubtime=Console.ReadLine();
							int rubinterval=solveInterval(rubtime);
							if (rubinterval>=0)
							{
								timeClearing=rubtime;
								timerClearing.Change(rubinterval,86400000);
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
			timerClearing.Dispose();
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
