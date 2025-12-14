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

namespace project
{
	/// <summary>
	/// Summary description for detail_person.
	/// </summary>
	public class detail_person : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Web.UI.WebControls.Label Label17;
		protected System.Web.UI.WebControls.Label Label15;
		protected System.Web.UI.WebControls.Label Label19;
		protected System.Web.UI.WebControls.Label Label20;
		protected System.Web.UI.WebControls.Label Label18;
		protected System.Web.UI.WebControls.Label Label21;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label16;
		protected System.Web.UI.WebControls.Label Label22;
		protected System.Web.UI.WebControls.Label Label23;
		protected System.Web.UI.WebControls.Label Label24;
		protected System.Web.UI.WebControls.Label Label25;
		protected System.Web.UI.WebControls.Label Label26;
		protected System.Web.UI.WebControls.Label Label27;
		protected System.Web.UI.WebControls.Label Label28;
		protected System.Web.UI.WebControls.Label Label29;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label31;
		protected System.Web.UI.WebControls.Label Label32;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.LinkButton LinkButton1;
		protected System.Web.UI.WebControls.Label Label30;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			
			// Put user code to initialize the page here
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);

			string strsql="SELECT* "
						+"FROM DetailCompany  "
						+"WHERE IDCompany=" + Request.QueryString["idcompany"];
			
			string strsql0="SELECT* FROM SpectCompany "
							+"WHERE IDCompany=" + Request.QueryString["idcompany"];
			sqlconn.Open();
			SqlCommand comm =new SqlCommand(strsql,sqlconn);
			SqlDataReader dr=comm.ExecuteReader();
			dr.Read();
				Label7.Text=dr.GetString(1);
				Label1.Text=dr.GetString(2);
				Label8.Text=dr.GetString(3);
				Label9.Text=dr.GetString(4);
			dr.Close();

			SqlCommand comm0 =new SqlCommand(strsql0,sqlconn);
			SqlDataReader dr0=comm0.ExecuteReader();
			dr0.Read();
			Label5.Text=dr0.GetInt32(2).ToString();
			Label16.Text=dr0.GetInt32(3).ToString();
			Label22.Text=dr0.GetInt32(4).ToString();
			Label32.Text=dr0.GetString(5);
			Label23.Text=dr0.GetDateTime(6).ToShortDateString();
			Label24.Text=dr0.GetDateTime(7).ToShortDateString();
			Label25.Text=dr0.GetString(8).ToString();
			Label26.Text=dr0.GetString(9).ToString();
			Label27.Text=dr0.GetString(10).ToString();
			Label28.Text=dr0.GetString(11).ToString();
			Label29.Text=dr0.GetString(12).ToString();
			Label30.Text=dr0.GetString(13).ToString();



			dr0.Close();

			sqlconn.Close();
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
			this.LinkButton1.Click += new System.EventHandler(this.LinkButton1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("winner.aspx");
		}

		private void LinkButton1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("index.aspx");
		}
	}
}
