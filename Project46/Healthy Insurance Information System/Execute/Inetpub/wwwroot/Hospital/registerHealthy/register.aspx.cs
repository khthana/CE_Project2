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

namespace queryHealthy.register
{
	/// <summary>
	/// Summary description for register2.
	/// </summary>
	public class register2 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label15;
		protected System.Web.UI.WebControls.Label Label17;
		protected System.Web.UI.WebControls.Label Label19;
		protected System.Web.UI.WebControls.Label Label21;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.DropDownList StatusList;
		protected System.Web.UI.WebControls.DropDownList HmainList;
		protected System.Web.UI.WebControls.DropDownList HsubList;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Label Label16;
		protected System.Web.UI.WebControls.Label Label18;
		protected System.Web.UI.WebControls.Label BDATE;
		protected System.Web.UI.HtmlControls.HtmlForm WebForm2;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			String temp = Request.Form["PIDText"]; //รับค่า PID มา
			if(temp!=null)
			{
				String tempstatus="";
				HospitalComponent.Hospital pomme = new HospitalComponent.Hospital();
				DataSet dataset = new DataSet(); //สร้าง DataSet
				try
				{
					dataset = pomme.queryHealthy(temp);
					tempstatus = dataset.Tables[0].Rows[0]["HSTATUS"].ToString();
				}
				catch{
				}
			
			
			
				if (tempstatus.Equals("0")){
					Label2.Text = dataset.Tables[0].Rows[0]["PID"].ToString();
					Label4.Text = dataset.Tables[0].Rows[0]["TITLE"].ToString();
					Label6.Text = dataset.Tables[0].Rows[0]["FNAME"].ToString();
					Label8.Text = dataset.Tables[0].Rows[0]["LNAME"].ToString();

					String sex = dataset.Tables[0].Rows[0]["SEX"].ToString();
					if(sex == "0") Label10.Text = "ชาย";
					if(sex == "1") Label10.Text = "หญิง";

					//STATUS
					String[] tstatus = new String[4];
					tstatus[0] = "โสด";
					tstatus[1] = "แต่งงาน";
					tstatus[2] = "หม้าย";
					tstatus[3] = "หย่า";
					for(int i=0; i < tstatus.Length; i++)
					{
						StatusList.Items.Add(tstatus[i]);
					}

					String tempcut=dataset.Tables[0].Rows[0]["DOB"].ToString();

					String day = tempcut.Substring(0,2);
					String month = tempcut.Substring(3,2);
					String year = tempcut.Substring(6,2);
					BDATE.Text=day+"/"+month+"/20"+year;

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


					Label12.Text=day+"  "+month+"  "+"20"+year;


					Label14.Text = dataset.Tables[0].Rows[0]["HID"].ToString();
				
					//เลือกจังหวัด
					String tmppro = dataset.Tables[0].Rows[0]["CCAATTMM"].ToString();
					String cc = tmppro.Substring(0,2);
					Label16.Text = pomme.queryProvince(cc);
				
				
					//เลือกโรงพยาบาลหลัก
					String tmpprov = pomme.getCurrentProvince();
					String[] tmpmain = pomme.queryHospitalInProject(tmpprov);
					int b = tmpmain.Length;
					for(int i=0; i<b; i++)
					{
						HmainList.Items.Add(tmpmain[i]);
					}

					//เลือกโรงพยาบาลรอง
					String[] tmpsub = pomme.queryHospitalInProject(tmpprov);
					int c = tmpsub.Length;
					for(int i=0; i<c; i++)
					{ 
						HsubList.Items.Add(tmpsub[i]);
					}

					Label18.Text = dataset.Tables[0].Rows[0]["CCAATTMM"].ToString();//เก็บรหัส หมู่ จังหวัด ตำบล อำเภอ
				}//status=0
				else 
				{
					if(tempstatus.Equals(""))Label2.Text = "ไม่พบ หมายเลขประจำตัวประชาชนดังกล่าวภายในระบบ";	
					else if(tempstatus.Equals("1")) Label2.Text = "ท่านไม่มีสิทธิในการสมัครประกันสุขภาพถ้วนหน้า เนื่องจากท่านได้รับสิทธิประกันสุขภาพถ้วนหน้าอยู่ก่อนแล้ว";				
					else if(tempstatus.Equals("2")) Label2.Text = "ท่านไม่มีสิทธิในการสมัครประกันสุขภาพถ้วนหน้า เนื่องจากท่านได้รับสิทธิประกันสังคม";				
					else if(tempstatus.Equals("3")) Label2.Text = "ท่านไม่มีสิทธิในการสมัครประกันสุขภาพถ้วนหน้า เนื่องจากท่านได้รับสิทธิข้าราชการ";				
					clearscreen();
				}
			}
		}

		private void clearscreen()
		{
			Label1.Visible = false;
			Label3.Visible = false;
			Label4.Visible=false;
			Label5.Visible = false;
			Label6.Visible=false;
			Label7.Visible = false;
			Label8.Visible=false;
			Label9.Visible = false;
			Label10.Visible=false;
			Label11.Visible = false;
			Label12.Visible=false;
			Label13.Visible = false;
			Label14.Visible=false;
			Label15.Visible = false;
			Label16.Visible=false;
			Label17.Visible = false;
			Label19.Visible = false;
			Label21.Visible = false;
			StatusList.Visible = false;
			HmainList.Visible = false;
			HsubList.Visible = false;
			Button1.Visible = false;
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
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{	
			try
			{
				HospitalComponent.Hospital pomme2 = new HospitalComponent.Hospital();
				HospitalComponent.WebReference1.RegisterDataset pomme1 = new HospitalComponent.WebReference1.RegisterDataset();
				HospitalComponent.WebReference1.RegisterDataset dataChange1 = new HospitalComponent.WebReference1.RegisterDataset();
				DataRow createRows=pomme1.Tables[0].NewRow();
				createRows["PID"] = Label2.Text;
				createRows["PROCODE"] = pomme2.getCurrentProvince();
				//createRows["RESULT"]
				createRows["TITLE"] = Label4.Text;
				createRows["FNAME"] = Label6.Text;
				createRows["LNAME"] = Label8.Text;
				createRows["BDATE"] = BDATE.Text;
				//createRows["CARDID"]
				//createRows["INSCL"]
				createRows["HOSPMAIN"] =pomme2.getHospitalId(HmainList.SelectedItem.Value);
				createRows["HOSPSUB"] = pomme2.getHospitalId(HsubList.SelectedItem.Value);
				//createRows["IDATE"]
				//createRows["EDATE"]

				if (Label10.Text == "ชาย")
					createRows["SEX"] = "0";
				if (Label10.Text == "หญิง")
					createRows["SEX"] = "1";

				//createRows["NATION"]
				//createRows["OCCUPA"]
				createRows["ADDRESS"] = Label14.Text;

				String tempcut = Label18.Text;
				String moo = tempcut.Substring(6,2);
				String tambon = tempcut.Substring(4,2);
				String amphur = tempcut.Substring(2,2);
				String province = tempcut.Substring(0,2);
				createRows["MOO"] = moo;
				createRows["TAMBON"] = tambon;
				createRows["AMPHUR"] = amphur;
				createRows["PROVINCE"] = province;
				createRows["STATUS"] = StatusList.SelectedItem.Value;

				pomme1.Tables[0].Rows.Add(createRows);
				dataChange1 =(HospitalComponent.WebReference1.RegisterDataset)pomme1.GetChanges(DataRowState.Added);
				String result = pomme2.registerHealthy(dataChange1);
				Label2.Text="ทำการสมัครประกันสุขภาพถ้วนหน้าเรียบร้อยแล้ว";
				clearscreen();
			}
			catch(Exception a)
			{
				Label2.Text="ไม่สามารถสมัครประกันสุขภาพถ้วนหน้าได้";
				Console.Write(a.StackTrace);
			}
		}
				
	}
}
