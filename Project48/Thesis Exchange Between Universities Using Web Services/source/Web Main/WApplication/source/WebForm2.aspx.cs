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

namespace WApplication
{
	/// <summary>
	/// Summary description for WebForm2.
	/// </summary>
	public class WebForm2 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DropDownList ddl_uname;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.RadioButton Rdb2;
		protected System.Web.UI.WebControls.RadioButton Rdb1;
		protected System.Web.UI.WebControls.Button btn_search;
		protected System.Web.UI.WebControls.TextBox tb_title;
		protected System.Web.UI.WebControls.DataList DataList_News;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			//ส่วนที่เเสดงข่าวสารต่าง
			//=============================================================
			WApplication.Components.WebDB webDB = new WApplication.Components.WebDB();
			DataSet newsDS = webDB.GetNews();
			DataList_News.DataSource=newsDS;
			DataList_News.DataBind();
			//==============================================================


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
			this.btn_search.Click += new System.EventHandler(this.btn_search_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion


	//เมื่อกดปุ่ม ค้นหาจากหน้านี้
		//chk = เช็คว่า ต้องการค้นหาจกา ผู้เเต่ง หรือ อาจารย์ที่ปรึกษา
		// hum = ค่าที่ไว้ส่งข้อมูลว่าเป็น ผู้เเต่ง หรือ อาจารยฺที่ปรึกษา
		// search = คำที่ต้องการค้นหา
		// page = เป็นตัวเช็คว่ามาจากหน้า 1 หรือ 2

		private void btn_search_Click(object sender, System.EventArgs e)
		{
			string chk = "" ;
			if (tb_title.Text  == "")
			{
				Label2.Visible= true;
			}
			else
			{
				if (Rdb1.Checked == true)
				{
					chk = "AUTHOR";
				}
				if (Rdb2.Checked == true)
				{
					chk = "PROFESSOR";
				}
	//			Response.Redirect("WebForm3.aspx?Search="+tb_title.Text+"&hum="+chk+"&page=2&fac="+ddl_uname.SelectedValue);
				if(ddl_uname.SelectedValue == "none_set")
					Response.Redirect("WebForm3.aspx?Search="+tb_title.Text+"&hum="+chk+"&page=2&Name="+ddl_uname.SelectedValue);
				else
					Response.Redirect("WebForm6.aspx?Search="+tb_title.Text+"&hum="+chk+"&page=2&Name="+ddl_uname.SelectedValue);

			}
		}
	}
}
