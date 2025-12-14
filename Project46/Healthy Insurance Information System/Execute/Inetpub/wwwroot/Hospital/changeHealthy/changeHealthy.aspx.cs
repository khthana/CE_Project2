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

namespace Hospital.changeHealthy
{
	/// <summary>
	/// Summary description for changeHealthy.
	/// </summary>
	public class Form1 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.DropDownList DropDownList1;
		protected System.Web.UI.WebControls.DropDownList DropDownList2;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Button Button1;
		private String pid;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			String temp = Request.Form["PIDText"]; //รับค่า PID มา
			pid=temp;
			DataSet dataset = new DataSet(); //สร้าง DataSet
			HospitalComponent.Hospital coke=new HospitalComponent.Hospital();

			dataset = coke.queryHealthy(temp); //เรียกใช้ Service
			String tempstatus = "";
			try
			{
				tempstatus = dataset.Tables[0].Rows[0]["HSTATUS"].ToString();
			}
			catch
			{
			}
			if (tempstatus.Equals("1"))
			{
				Label2.Text=dataset.Tables[0].Rows[0]["PID"].ToString();
				Label4.Text=dataset.Tables[0].Rows[0]["FNAME"].ToString();
				Label6.Text=dataset.Tables[0].Rows[0]["LNAME"].ToString();
				String codemain= dataset.Tables[0].Rows[0]["HOSPMAIN"].ToString();
				String codesub = dataset.Tables[0].Rows[0]["HOSPSUB"].ToString();
				Label8.Text=coke.getHospitalName(codemain);
				Label10.Text=coke.getHospitalName(codesub);

				
				String province=coke.getCurrentProvince();
				String[] allhosp=coke.queryHospitalInProject(province);
				for(int i=0;i<allhosp.Length;i++)
				{
					DropDownList1.Items.Add(allhosp[i]);
				}
				String[] projhosp=coke.queryHospitalInProject(province);
				for(int i=0;i<projhosp.Length;i++)
				{
					DropDownList2.Items.Add(projhosp[i]);
				}
			}
			else
			{
				clearScreen();
				Label1.Visible=true;
				Label1.Width=400;
				if(tempstatus.Equals(""))Label1.Text = "ไม่พบ หมายเลขประจำตัวประชาชนดังกล่าวภายในระบบ";	
				else Label1.Text = "ท่านไม่มีสิทธิในการเปลี่ยนสถานพยาบาล เนื่องจากท่านไม่ได้รับสิทธิประกันสุขภาพถ้วนหน้า";				
			}

		}
		public void cmd1_Click(object sender, System.EventArgs e)
		{
			String keepnewMain=DropDownList1.SelectedItem.Value;
			String keepnewSub=DropDownList2.SelectedItem.Value;
			if(!(keepnewMain.Equals(Label8.Text)&& keepnewSub.Equals(Label10.Text)))
			{
				HospitalComponent.Hospital coke=new HospitalComponent.Hospital();
				String pid = (String)Label2.Text; //รับค่า PID มา
				clearScreen();
				Label1.Visible=true;
				Label1.Width=400;
				String result=coke.updateHealthy(pid,coke.getHospitalId(keepnewMain),coke.getHospitalId(keepnewSub));			
				if(result.Equals("Success"))
				{
					Label1.Text="เปลี่ยนแปลงโรงพยาบาลเรียบร้อยแล้ว";
				}
				else Label1.Text=result;
			}else Label1.Text="สถานพยาบาลที่ต้องการเปลี่ยนซ้ำกับสถานพยาบาลเดิม";

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
			Label13.Visible=false;
			DropDownList1.Visible=false;
			DropDownList2.Visible=false;
			Button1.Visible=false;
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
			this.ID = "Form1";
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
