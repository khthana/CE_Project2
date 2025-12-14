using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using HospitalComponent;
using System.IO;

namespace Hospital.clearing
{
	/// <summary>
	/// Summary description for clearing.
	/// </summary>
	public class clearing : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.Label Label27;
		protected System.Web.UI.WebControls.Label Label25;
		protected System.Web.UI.WebControls.Label Label23;
		protected System.Web.UI.WebControls.Label Label21;
		protected System.Web.UI.WebControls.Label Label19;
		protected System.Web.UI.WebControls.Label Label17;
		protected System.Web.UI.WebControls.Label Label15;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label29;
		protected System.Web.UI.WebControls.TextBox TextBox3;
		protected System.Web.UI.WebControls.TextBox TextBox4;
		protected System.Web.UI.WebControls.TextBox TextBox5;
		protected System.Web.UI.WebControls.TextBox TextBox6;
		protected System.Web.UI.WebControls.TextBox TextBox7;
		protected System.Web.UI.WebControls.TextBox TextBox8;
		protected System.Web.UI.WebControls.TextBox TextBox9;
		protected System.Web.UI.WebControls.CheckBox CheckBox1;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label codemain;
		protected System.Web.UI.WebControls.Label codesub;
		protected System.Web.UI.WebControls.Label tempstatus;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Web.UI.WebControls.Label Label16;
		protected System.Web.UI.WebControls.Label codehos;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			String pid = Request.Form["PIDText"]; //รับค่า PID มา
			if((pid!=null)&&(pid.Length==13)){
				CheckBox1.Visible=false;
				DataSet dataset = new DataSet(); //สร้าง DataSet
				HospitalComponent.Hospital coke=new HospitalComponent.Hospital();
				dataset = coke.queryHealthy(pid); //เรียกใช้ Service
				try{
					tempstatus.Text = dataset.Tables[0].Rows[0]["HSTATUS"].ToString();
					Label2.Text=dataset.Tables[0].Rows[0]["PID"].ToString();
					Label4.Text=dataset.Tables[0].Rows[0]["FNAME"].ToString();
					Label6.Text=dataset.Tables[0].Rows[0]["LNAME"].ToString();
					IFormatProvider cultureEng = new System.Globalization.CultureInfo("en-US",true);
					DateTime time=new DateTime();
					time=DateTime.Today;
					String[] tmp=time.GetDateTimeFormats('d',cultureEng);			
					String tempcut=tmp[5];

					String day = tempcut.Substring(8,2);
					String month = tempcut.Substring(5,2);
					String year = tempcut.Substring(0,4);

					if(month.Equals("01")){month="มกราคม";}
					else if(month.Equals("02")){month="กุมภาพันธ์";}
					else if(month.Equals("03")){month="มีนาคม";}
					else if(month.Equals("04")){month="เมษายน";}
					else if(month.Equals("05")){month="พฤษภาคม";}
					else if(month.Equals("06")){month="มิถุนายน";}
					else if(month.Equals("07")){month="กรกฎาคม";}
					else if(month.Equals("08")){month="สิงคมคม";}
					else if(month.Equals("09")){month="กันยายน";}
					else if(month.Equals("10")){month="ตุลาคม";}
					else if(month.Equals("11")){month="พฤศจิกายน";}
					else if(month.Equals("12")){month="ธันวาคม";}


					Label14.Text=day+"  "+month+"  "+year;

//					String strConn="data source=EKOC;initial catalog=datahospital;password=kucoke;persist security info=True;user id=dbhospital;workstation id=EKOC;packet size=4096";
					String conStr="";
					try{
						FileStream aFile=new FileStream(@"C:\Inetpub\configDBHospital.txt",FileMode.Open);
						StreamReader sr=new StreamReader(aFile);
						conStr=sr.ReadToEnd();
						sr.Close();
					}
					catch(IOException ea){
						Console.WriteLine("An IO exception has been thrown!");
						Console.WriteLine(ea.ToString());
					}
					SqlDataAdapter forcard=new SqlDataAdapter("SELECT MAX(CONVERT(numeric, BILL_ID))FROM CLEARING",conStr);
					DataSet rubidcard=new DataSet();
					forcard.Fill(rubidcard);
					String x=rubidcard.Tables[0].Rows[0][0].ToString();
					int cardid=0;
					if(!x.Equals("")){
						cardid=Int32.Parse(x);
					}
					cardid++;
					Label16.Text=cardid.ToString();
				}

				catch
				{
					clearScreen();
					Label1.Visible=true;
					Label1.Width=400;
					Label1.Text="ไม่พบ หมายเลขประจำตัวประชาชนดังกล่าว ภายในระบบ";
				}

				if (tempstatus.Text.Equals("1")){
				
					Label8.Text="ประกันสุขภาพถ้วนหน้า";
					codemain.Text= dataset.Tables[0].Rows[0]["HOSPMAIN"].ToString();
					codesub.Text = dataset.Tables[0].Rows[0]["HOSPSUB"].ToString();
					codehos.Text=coke.getCurrentHosId();
					
					if(!(codemain.Text.Equals(codehos.Text)||codesub.Text.Equals(codehos.Text))){
						int checknumber=Int32.Parse(coke.checkPrivilegeAccident(Label2.Text));
						if(checknumber>0){
							CheckBox1.Visible=true;
						}
					}
					
					Label9.Text="โรงพยาบาลหลัก :";
					Label10.Text=coke.getHospitalName(codemain.Text);
					Label11.Text="โรงพยาบาลรอง :";
					Label12.Text=coke.getHospitalName(codesub.Text);
				}
				else if(tempstatus.Text.Equals("2")){
					Label8.Text="ประกันสังคม";
				}
				else if(tempstatus.Text.Equals("3")){
					Label8.Text="ข้าราชการ";
				}
				else{
					Label8.Text="ไม่ได้รับสิทธิ์ประกันสุขภาพ";
				}
			}
			else{
				clearScreen();
				Label1.Visible=true;
				Label1.Text="กรุณาใส่ input";
			}
		}
		public void clearScreen()
		{
			Label1.Visible=false;
			Label2.Visible=false;
			Label3.Visible=false;
			Label4.Visible=false;
			Label5.Visible=false;
			Label6.Visible=false;
			Label7.Visible=false;
			Label8.Visible=false;
			Label9.Visible=false;
			Label10.Visible=false;	
			Label11.Visible=false;
			Label12.Visible=false;
			Label13.Visible=false;
			Label14.Visible=false;
			Label15.Visible=false;
			Label16.Visible=false;
			Label17.Visible=false;
			Label19.Visible=false;
			Label21.Visible=false;	
			Label23.Visible=false;
			Label25.Visible=false;
			Label27.Visible=false;	
			Label29.Visible=false;
			TextBox3.Visible=false;
			TextBox4.Visible=false;
			TextBox5.Visible=false;
			TextBox6.Visible=false;
			TextBox7.Visible=false;
			TextBox8.Visible=false;
			TextBox9.Visible=false;
			CheckBox1.Visible=false;
			Button1.Visible=false;
		}
		public void cmd1_click(object sender, System.EventArgs e)
		{
			Label3.Text="";
			//ประกันสุขภาพถ้วนหน้า
			HospitalComponent.Hospital coke=new HospitalComponent.Hospital();
			HospitalClearing datasetClearing=new HospitalClearing();
			
			IFormatProvider cultureEng = new System.Globalization.CultureInfo("en-US",true);
			DateTime time=new DateTime();
			time=DateTime.Today;
			String[] tmp=time.GetDateTimeFormats('d',cultureEng);			



			DataTable table1=datasetClearing.Tables["CLEARING"];
			DataRow createRows=table1.NewRow();
			createRows["PID"]=Label2.Text;
			createRows["BILL_ID"]=Label16.Text;
			createRows["DATE_BILL"]=tmp[5];
			createRows["DISEASE"]=TextBox3.Text;
			createRows["COST_MEDICINE"]=TextBox4.Text;
			createRows["COST_DOCTOR"]=TextBox5.Text;
			createRows["COST_ROOM"]=TextBox6.Text;
			createRows["COST_TREAT"]=TextBox7.Text;
			createRows["COST_OTHER"]=TextBox9.Text;
			createRows["COST_SUM"]=TextBox8.Text;
			createRows["HSTATUS"]=tempstatus.Text;


			if(tempstatus.Text.Equals("1"))
			{
				createRows["HOSPMAIN"]=codemain.Text;
				createRows["HOSPSUB"]=codesub.Text;

//--------------operation------------------
				if(codemain.Text.Equals(codehos.Text))//เท่ากับ main
				{
					createRows["HOSPSTATUS"]="1";
				}
				else if(codesub.Text.Equals(codehos.Text)) //เท่ากับ sub
				{
					createRows["HOSPSTATUS"]="2";
					//ส่ง clearing
					HospitalComponent.WebReference1.ClearingDataset sendclearing=new HospitalComponent.WebReference1.ClearingDataset();
					DataTable table2=sendclearing.Tables["CLEARING"];
					DataRow createRows2=table2.NewRow();
					createRows2["HOSPMAIN"]=codemain.Text;
					createRows2["HOSPSUB"]=codesub.Text;
					createRows2["PID"]=Label2.Text;
					createRows2["BILL_ID"]="0";
					createRows2["DATE_BILL"]=tmp[5];
					createRows2["DISEASE"]=TextBox3.Text;
					createRows2["COST_MEDICINE"]=TextBox4.Text;
					createRows2["COST_DOCTOR"]=TextBox5.Text;
					createRows2["COST_ROOM"]=TextBox6.Text;
					createRows2["COST_TREAT"]=TextBox7.Text;
					createRows2["COST_OTHER"]=TextBox9.Text;
					createRows2["COST_SUM"]=TextBox8.Text;
					table2.Rows.Add(createRows2);
					HospitalComponent.WebReference1.ClearingDataset datachange2=new HospitalComponent.WebReference1.ClearingDataset();
					datachange2=(HospitalComponent.WebReference1.ClearingDataset)sendclearing.GetChanges(DataRowState.Added);
					Label3.Text=coke.sendClearing(datachange2);

				}
				else //ไม่เท่ากันเลย
				{
					if(CheckBox1.Checked)//ใช้อุบัติเหตุ
					{
						createRows["HOSPSTATUS"]="3";
						createRows["HOSPSUB"]=codehos.Text;

						//ส่งclearing
						HospitalComponent.WebReference1.ClearingDataset sendclearing=new HospitalComponent.WebReference1.ClearingDataset();
						DataTable table2=sendclearing.Tables["CLEARING"];
						DataRow createRows2=table2.NewRow();
						createRows2["HOSPMAIN"]=codemain.Text;
						createRows2["HOSPSUB"]=codehos.Text;
						createRows2["PID"]=Label2.Text;
						createRows2["BILL_ID"]="0";
						createRows2["DATE_BILL"]=tmp[5];
						createRows2["DISEASE"]=TextBox3.Text;
						createRows2["COST_MEDICINE"]=TextBox4.Text;
						createRows2["COST_DOCTOR"]=TextBox5.Text;
						createRows2["COST_ROOM"]=TextBox6.Text;
						createRows2["COST_TREAT"]=TextBox7.Text;
						createRows2["COST_OTHER"]=TextBox9.Text;
						createRows2["COST_SUM"]=TextBox8.Text;
						table2.Rows.Add(createRows2);
						HospitalComponent.WebReference1.ClearingDataset datachange2=new HospitalComponent.WebReference1.ClearingDataset();
						datachange2=(HospitalComponent.WebReference1.ClearingDataset)sendclearing.GetChanges(DataRowState.Added);
						Label3.Text=coke.sendClearing(datachange2);
					}
					else //ไม่ได้ใช้
					{
						createRows["HOSPSTATUS"]="0";
					}
				}
			}
			else//อื่นๆ
			{
				createRows["HOSPMAIN"]="";
				createRows["HOSPSUB"]="";
				createRows["HOSPSTATUS"]="";
			}
				clearScreen();
				table1.Rows.Add(createRows);
				HospitalClearing datachange=new HospitalClearing();
				datachange=(HospitalClearing)datasetClearing.GetChanges(DataRowState.Added);
				Label1.Visible=true;
				String x=coke.insertClearing(datachange);
				if(x.Equals("Insert Success")){Label1.Text="บันทึกข้อมูลเรียบร้อยแล้ว";}
				else {Label1.Text="บันทึกข้อมูลไม่สำเร็จ";}
		}
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
