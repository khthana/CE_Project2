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

namespace WebService1
{
	/// <summary>
	/// Summary description for detail.
	/// </summary>
	public class detail : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Button btnsubmit;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Web.UI.HtmlControls.HtmlTextArea TEXTAREA1;
		protected System.Web.UI.HtmlControls.HtmlTextArea TEXTAREA2;
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.HtmlControls.HtmlTextArea TEXTAREA3;
		protected System.Web.UI.HtmlControls.HtmlTextArea TEXTAREA4;
		protected System.Web.UI.WebControls.LinkButton lnktomain;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator1;
		protected System.Web.UI.WebControls.Label Label2;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here

			//test to select form database
//			string strconn="server=(local);database=project;uid=sa;password=;";
//			SqlConnection sqlconn=new SqlConnection(strconn);
//			 string str="SELECT * FROM DetailBidding "
//						+ "WHERE IDBidding =11 ";
//			sqlconn.Open();
//			SqlCommand comm= new SqlCommand(str,sqlconn);
//			SqlDataReader dr=comm.ExecuteReader();
//			dr.Read();
//			
//			Label1.Text=dr.GetDateTime(3).ToString();
//			dr.Close();
//			sqlconn.Close();
			if(!Page.IsPostBack)
			{
//				TEXTAREA1.InnerText="เพื่อใช้งานในภาค "; 
//				TEXTAREA2.InnerText="นักศึกษา"; 
//				TextBox1.Text="1000000";  
//				TEXTAREA3.InnerText="ตั้งในห้องภาคและใช้งาน"; 
//				TEXTAREA4.InnerText="เครื่องใช้ในภาคปัจจุบันมีไม่พอ";  
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
			this.btnsubmit.Click += new System.EventHandler(this.btnsubmit_Click);
			this.TEXTAREA1.ServerChange += new System.EventHandler(this.TEXTAREA1_ServerChange);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion




		private void lnktomain_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("main.aspx");
		}

		private void TEXTAREA1_ServerChange(object sender, System.EventArgs e)
		{
		
		}

		private void btnsubmit_Click(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);

			string strsql5="INSERT INTO SecretData "
							+ "(IDBidding,Objective,Destination,Budget,DetailActivity,Comment) "
							+ "VALUES(" + Session["bidding"]+ ",'"
							+ TEXTAREA1.InnerText + "','"
							+ TEXTAREA2.InnerText + "','" 
							+ TextBox1.Text + "','"
							+ TEXTAREA3.InnerText + "','"
							+ TEXTAREA4.InnerText + "')";
			sqlconn.Open();
			SqlCommand comm = new SqlCommand(strsql5,sqlconn);
			comm.ExecuteNonQuery();

			sqlconn.Close();
			Response.Redirect("technic.aspx?");
			


		}




	}
}
