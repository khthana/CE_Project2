using System;
using System.Data;
using System.Data.SqlClient;
using HealthyData;
using System.IO;

namespace Server
{
	/// <summary>
	/// Summary description for UpdateHealthy.
	/// </summary>
	public class UpdateHealthy
	{
		public UpdateHealthy()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public static void verifyAndUpdate(Object state)
		{			
			DataSet rubDataset=new DataSet();
			DataHealthy kucoke= new DataHealthy();
			Server.WebReference2.Service1 peopleService=new Server.WebReference2.Service1();


			IFormatProvider cultureEng = new System.Globalization.CultureInfo("en-US",true);
			DateTime time=new DateTime();
			time=DateTime.Today;
			String[] tmp=time.GetDateTimeFormats('d',cultureEng);			

			rubDataset=peopleService.updatePeople(tmp[3]);
			//รับว่าวันนั้นมีข้อมูลอะไรถูก updateบ้าง
//			rubDataset=peopleService.updatePeople("12/09/2003");

			Console.WriteLine();
			Console.WriteLine();
			Console.WriteLine("####################################################################");
			Console.WriteLine("--------------- Result of Auto Run UpdatePeople --------------------");
			Console.WriteLine("####################################################################");

			Console.WriteLine();
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
			SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From Logfile",conStr);
			SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

			DataSet dataSet1=new DataSet();
			DataSet dataChange1=new DataSet();
			DataTable logtable=new DataTable();
			logfileAdapter.Fill(dataSet1);
			logtable=dataSet1.Tables[0];

			if(rubDataset.Tables[0].Rows.Count==0){Console.WriteLine("Not Found");}

			foreach(DataTable table in rubDataset.Tables)
				foreach(DataRow row in table.Rows)
				{
					DataSet datasetInput=new DataSet();
					DataSet datasetOutput=new DataSet();
					datasetInput=kucoke.queryPeople((String)row[0]);
					int tableIndex=datasetInput.Tables.Count-1;//เพราะว่า dataset ที่return มีตารางที่ไดนามิก มันเลยสร้างตารางใหม่
					//ถ้าไม่เท่ากับ 0 แสดงว่ายังอยู่ในฐานข้อมูล ถ้าเท่า0แสดงว่าโดน delete ไปแล้ว
					if(datasetInput.Tables[tableIndex].Rows.Count!=0)
					{	//for send to method
						DataSet1 datasetUpdate=new DataSet1();
						
						datasetOutput=kucoke.queryHealthy((String)row[0]);
						if(datasetOutput.Tables[0].Rows.Count!=0)
						{
							
							DataRow rowInput=datasetInput.Tables[tableIndex].Rows[0];
							DataRow rowoutput=datasetOutput.Tables[0].Rows[0];

							// insert old input
							DataTable table1=datasetUpdate.Tables[0];
							DataRow updateRows=table1.NewRow();

							for(int i=0;i<22;i++)
							{
								updateRows[i]=rowoutput[i];
							}

							DataRow logrow=logtable.NewRow();
							logrow["PID"]=row[0];
							logrow["Day_Change"]=tmp[5];
							logrow["Status_Change"]='3';
							logrow["TITLE"]=rowoutput["TITLE"];
							logrow["FNAME"]=rowoutput["FNAME"];
							logrow["LNAME"]=rowoutput["LNAME"];
							logrow["SEX"]=rowoutput["SEX"];
							logrow["BDATE"]=rowoutput["BDATE"];
							logrow["ADDRESS"]=rowoutput["ADDRESS"];
							logrow["MOO"]=rowoutput["MOO"];
							logrow["TAMBON"]=rowoutput["TAMBON"];
							logrow["AMPHUR"]=rowoutput["AMPHUR"];							
							logrow["PROVINCE"]=rowoutput["PROVINCE"];		
							logtable.Rows.Add(logrow);
							dataChange1=dataSet1.GetChanges(DataRowState.Added);
							logfileAdapter.Update(dataChange1);


							// update new input
							if(!rowInput["TITLE"].Equals(rowoutput["TITLE"])){updateRows["TITLE"]=rowInput["TITLE"];}
							if(!rowInput["FNAME"].Equals(rowoutput["FNAME"])){updateRows["FNAME"]=rowInput["FNAME"];}
							if(!rowInput["LNAME"].Equals(rowoutput["LNAME"])){updateRows["LNAME"]=rowInput["LNAME"];}
							if(!rowInput["SEX"].Equals(rowoutput["SEX"])){updateRows["SEX"]=rowInput["SEX"];}
							//เปลี่ยนวันเกิด เปลี่ยนที่อยู่ มีรหัสมาก ต้อง map
							if(!rowInput["DOB"].Equals(rowoutput["BDATE"]))
							{
								String bdate=(String)rowInput["DOB"];
								String year = bdate.Substring(6,2);
								String month = bdate.Substring(3,2);
								String day = bdate.Substring(0,2);

								updateRows["BDATE"]=day+"/"+month+"/20"+year;
							}	

							String temp_address="";
							temp_address+=" "+(String)rowInput["HID"];
							temp_address+=" "+(String)rowInput["HNO"];
							temp_address+=" "+(String)rowInput["TROK"];
							temp_address+=" "+(String)rowInput["SOI"];
							temp_address+=" "+(String)rowInput["THANON"];
							
							updateRows["ADDRESS"]=temp_address;

							String tempcut=(String)rowInput["CCAATTMM"];

							String moo = tempcut.Substring(6,2);
							String tambon = tempcut.Substring(4,2);
							String amphur = tempcut.Substring(2,2);
							String province = tempcut.Substring(0,2);

							updateRows["MOO"] = moo;
							updateRows["TAMBON"] = tambon;
							updateRows["AMPHUR"] = amphur;
							updateRows["PROVINCE"] = province;

							table1.Rows.Add(updateRows);
							DataSet test1=new DataSet();
//							datasetUpdate=(DataSet1)datasetUpdate.GetChanges(DataRowState.Modified);
							String kucoke1=kucoke.updateHealthy(datasetUpdate);
							Console.WriteLine("Update Data in Healthy :  "+row[0]+" Result of Update >>"+kucoke1);
						}// if have data output
						else{Console.WriteLine("Don't Found:"+row[0]+" in Healthy Station");}

					}//if have datainput to update
					//ไม่แสดงดีกว่า  else{Console.WriteLine("Don't Found:"+row[0]+" in People Station");}

				}//foreach
			Console.WriteLine();
			Console.WriteLine("####################################################################");
			Console.Write("Please Select Number(press m to menu,press q to exit):");
		}//ฟังก์ฉัน
	}
}
