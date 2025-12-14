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

namespace WApplication
{
	public class WebForm1 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.DropDownList ddl_fac;
		protected System.Web.UI.WebControls.DropDownList ddl_year;
		protected System.Web.UI.WebControls.DropDownList ddl_dept;
		protected System.Web.UI.WebControls.TextBox tb_title;
		protected System.Web.UI.WebControls.DataList DataList1;
		protected System.Web.UI.WebControls.DropDownList ddl_uname;
		protected System.Web.UI.WebControls.RadioButton Rdb2;
		protected System.Web.UI.WebControls.Label Label2;	
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.RadioButton Rdb1;
		WApplication.Components.WebFunction func = new WApplication.Components.WebFunction();
		int temp = 0;
		string kind;
		//===================================================================
	//	WApplication.localhost1.Service1 KMITL1 = new WApplication.localhost1.Service1();
	//	WApplication.localhost2.Service1 KMITL2 = new WApplication.localhost2.Service1();
	//	WApplication.localhost3.Service1 KMITL3 = new WApplication.localhost3.Service1();
		//==============================================================================
		WApplication.WReference1.Service1 KMITL1 = new WApplication.WReference1.Service1();
		WApplication.WReference2.Service1 KMITL2 = new WApplication.WReference2.Service1();
		WApplication.WReference3.Service1 KMITL3 = new WApplication.WReference3.Service1();
		//==============================================================
		protected System.Web.UI.WebControls.DataList DataList_News;
		protected System.Web.UI.WebControls.RadioButton Rdb3;
		protected System.Web.UI.WebControls.RadioButton Rdb4;
		WApplication.Components.WebDB webDB = new WApplication.Components.WebDB();

//-------------------------------------------------------------------------------------	
		private void Page_Load(object sender, System.EventArgs e)
		{	
			//------------------------------------------------------------------------
//From Web DB			
			//Get News From Web Database----------------------------------
			DataSet newsDS = webDB.GetNews();
			DataList_News.DataSource=newsDS;
			DataList_News.DataBind();
			
			//Get University Name From Web Database----------------------------------
			if(ddl_uname.Items.Count==1)
			{
				DataSet unameDS,valueDS = new DataSet();
				DataTable unameTB,valueTB = new DataTable();
				unameDS = webDB.GetUname();
				valueDS = webDB.GetValue();
				unameTB = unameDS.Tables[0];
				valueTB = valueDS.Tables[0];
				for (int i=0;i<unameTB.Rows.Count;i++)
				{
					ddl_uname.Items.Add(unameTB.Rows[i].ItemArray[0].ToString());
					ddl_uname.Items[i+1].Value = valueTB.Rows[i].ItemArray[0].ToString();
				}
			}
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		private void InitializeComponent()
		{    
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.ddl_uname.SelectedIndexChanged += new System.EventHandler(this.ddl_uname_SelectedIndexChanged);
			this.ddl_fac.SelectedIndexChanged += new System.EventHandler(this.ddl_fac_SelectedIndexChanged);
			this.ddl_dept.SelectedIndexChanged += new System.EventHandler(this.ddl_dept_SelectedIndexChanged);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion


// ===============================================================
//   ถ้ามีการเลือก มหาลัยจะทำให้มีการ load หน้าเว็บมา
//   เเละทำการ เเสดง ช่อง ของคณะ , ภาควิชาเเละ ปีการศึกษาขึ้นมา
//================================================================
		private void ddl_uname_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			func.defaultDDL(ddl_dept);
			
			// เช็คว่า university ได้ถูกเลือกเเล้วหรือยัง
			if(ddl_uname.SelectedValue=="none_set")
			{
				ddl_fac.Visible = false;
				ddl_dept.Visible = false;
				ddl_year.Visible = false;
				Label4.Visible = false;
				Label5.Visible = false;
				Label6.Visible = false;
			}
			else
			{
				ddl_fac.Visible = true;
				ddl_dept.Visible = true;
				ddl_year.Visible = true;
				Label4.Visible = true;
				Label5.Visible = true;
				Label6.Visible = true;

					//facDS is Dataset keep Dataset from University
				DataSet facDS=new DataSet(); 


					if(ddl_uname.SelectedValue==ddl_uname.Items[1].Value)
					{
						facDS = KMITL1.listFac();
					}
					else
						if(ddl_uname.SelectedValue==ddl_uname.Items[2].Value)
					{
						facDS = KMITL2.listFac();
					}
					else
						if(ddl_uname.SelectedValue==ddl_uname.Items[3].Value)
					{
						facDS = KMITL3.listFac();
					}

					func.addDDL(facDS,ddl_fac);
					DataSet yearDS=new DataSet();

				//Modity this position-------------------------------
				if(ddl_uname.SelectedValue==ddl_uname.Items[1].Value)
				{
					yearDS = KMITL1.listYear();
				}
				else
					if(ddl_uname.SelectedValue==ddl_uname.Items[2].Value)
					yearDS = KMITL2.listYear();
				else
					if(ddl_uname.SelectedValue==ddl_uname.Items[3].Value)
					yearDS = KMITL3.listYear();

				//-----------------------------------------------------
			
				func.addDDL(yearDS,ddl_year);

				}
			}

		//============================================================
		// เมื่อมีการเลือกจะทำาการ load ค่าที่มี ออกมาเเสดง โดยสอดคล้องกับ Database
		//=====================================================
		private void ddl_fac_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			DataSet yearDS = new DataSet();
			DataSet deptDS = new DataSet();

			if(ddl_fac.SelectedValue!= "none_set")
			{
				
				if(ddl_uname.SelectedValue==ddl_uname.Items[1].Value)
				{
					deptDS = KMITL1.listDept(ddl_fac.SelectedValue);
					yearDS = KMITL1.listYear(ddl_fac.SelectedValue);
				}
				else
					if(ddl_uname.SelectedValue==ddl_uname.Items[2].Value)
				{
					deptDS = KMITL2.listDept(ddl_fac.SelectedValue);
					yearDS = KMITL2.listYear(ddl_fac.SelectedValue);
				}
				else
				{
					deptDS = KMITL3.listDept(ddl_fac.SelectedValue);
					yearDS = KMITL3.listYear(ddl_fac.SelectedValue);
				}
	
				func.addDDL(deptDS,ddl_dept);
			}
			else
			{
	
				if(ddl_uname.SelectedValue==ddl_uname.Items[1].Value)
				{
					yearDS = KMITL1.listYear();
				}
				else
					if(ddl_uname.SelectedValue==ddl_uname.Items[2].Value)
				{
					yearDS = KMITL2.listYear();
				}
				else
				{
					yearDS = KMITL3.listYear();
				}
	
				func.defaultDDL(ddl_dept);
			}		
			func.CheckIn(yearDS,ddl_year);

		}

		private void ddl_dept_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			DataSet yearDS = new DataSet();

			if(ddl_dept.SelectedValue != "none_set")
			{
		if(ddl_uname.SelectedValue==ddl_uname.Items[1].Value)
				{
					yearDS = KMITL1.listYear(ddl_fac.SelectedValue,ddl_dept.SelectedValue);
				}
				else
					if(ddl_uname.SelectedValue==ddl_uname.Items[2].Value)
				{
					yearDS = KMITL2.listYear(ddl_fac.SelectedValue,ddl_dept.SelectedValue);
				}
				else
				{
					yearDS = KMITL3.listYear(ddl_fac.SelectedValue,ddl_dept.SelectedValue);
				}
		
				func.CheckIn(yearDS,ddl_year);
			}
			else
			{
				if(ddl_uname.SelectedValue==ddl_uname.Items[1].Value)
				{
					yearDS = KMITL1.listYear(ddl_fac.SelectedValue);
				}
				else
					if(ddl_uname.SelectedValue==ddl_uname.Items[2].Value)
				{
					yearDS = KMITL2.listYear(ddl_fac.SelectedValue);
				}
				else
				{
					yearDS = KMITL3.listYear(ddl_fac.SelectedValue);
				}
		
				func.CheckIn(yearDS,ddl_year);
			}
		}

		// ==============================================================
		// เมื่อกดปุ่มค้นหา จะทำการเช็คเเละส่งค่า ไปยัง webform ที่กำหนดไว้
		//============================================================
		// search = คำที่ต้องการหา
		//  Kind = การเช็คว่า ผู้ใช้ต้องการค้นหาจาก title , keyword 
		//  Name = ชื่อมหาลัยที่เลื่อก ถ้ามี
		//  Fac = ชื่อของภาควิชาที่เลือก ถ้ามี
		//  Dept = ชื่อของสาขาที่มี
		// Year = เป็นปีของ THESIS
		// Page = เช็คว่ามาจากหน้าที่ค้นหาจากชื่อ Thesis(1) หรือมาจากการค้นหา จาก ชื่อผู้เเต่ง(2)
		//-----------------------------------------------------------------
		private void Button1_Click(object sender, System.EventArgs e)
		{
			if(ddl_uname.SelectedValue!="none_set")
			{
				if(ddl_fac.SelectedValue != "none_set")
					temp+=1;
				if(ddl_dept.SelectedValue != "none_set")
					temp+=1;
				if(ddl_year.SelectedValue != "none_set")
					temp+=1;
			}
			if(tb_title.Text != "")
				temp+=1;
			//แก้ตรงนี้
			kind=func.getKind(Rdb1.Checked,Rdb3.Checked);

			if(ddl_uname.SelectedValue == "none_set")
				Response.Redirect("WebForm3.aspx?Search="+tb_title.Text+"&Name="+ddl_uname.SelectedValue+"&Fac="+ddl_fac.SelectedValue+"&Dept="+ddl_dept.SelectedValue+"&Year="+ddl_year.SelectedValue+"&Temp="+temp+"&Kind="+kind+"&Page=1");
			else
				Response.Redirect("WebForm6.aspx?Search="+tb_title.Text+"&Name="+ddl_uname.SelectedValue+"&Fac="+ddl_fac.SelectedValue+"&Dept="+ddl_dept.SelectedValue+"&Year="+ddl_year.SelectedValue+"&Temp="+temp+"&Kind="+kind+"&Page=1");
	
		}
	}
}
