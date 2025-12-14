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
	/// Summary description for _2.
	/// </summary>
	public class _2 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Label Label15;
		protected System.Web.UI.WebControls.Label Label16;
		protected System.Web.UI.WebControls.LinkButton lnkbuy;
		protected System.Web.UI.WebControls.LinkButton lnkhome;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			Session["idp1"]=Request.QueryString["idp"];
			Session["idb1"]=Request.QueryString["idb"];
			
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT *"
				+"FROM DetailOffice "
				+"WHERE IDPlace= " + Request.QueryString["idp"]; 

			string strsql2="SELECT *"
				+"FROM DetailBidding "
				+"WHERE IDBidding= " + Request.QueryString["idb"];  //

			string strsql3="SELECT *"
				+"FROM SpectBidding "
				+"WHERE IDBidding= "+ Request.QueryString["idb"];//2
			


			
			//render to paper
			sqlconn.Open();
			SqlCommand sqlcomm = new SqlCommand(strsql,sqlconn);
			SqlDataReader dr=sqlcomm.ExecuteReader();
			dr.Read();
			Label1.Text=dr.GetString(1);
			Label4.Text=dr.GetString(1);
			Label11.Text=dr.GetString(3);
			Label15.Text=dr.GetString(4);
			dr.Close();
			
			
			
			sqlconn.Close();

			sqlconn.Open();
			SqlCommand sqlcomm2 = new SqlCommand(strsql2,sqlconn);
			SqlDataReader dr2=sqlcomm2.ExecuteReader();
			dr2.Read();
			Label2.Text=dr2.GetString(2);
			Label3.Text=dr2.GetString(16);
			Label5.Text=dr2.GetString(2);
			Label7.Text=dr2.GetDateTime(6).ToShortDateString();
			Label8.Text=dr2.GetDateTime(7).ToShortDateString();
			Label9.Text=dr2.GetDateTime(11).ToShortDateString();
			Label16.Text=dr2.GetDateTime(3).ToShortDateString();
			Label6.Text=dr2.GetString(19);
			Label10.Text=dr2.GetInt32(15).ToString();
			dr2.Close();
			
			sqlconn.Close();
			
			sqlconn.Open();
			SqlCommand sqlcomm3 = new SqlCommand(strsql3,sqlconn);
			SqlDataReader dr3=sqlcomm3.ExecuteReader();
			dr3.Read();

			dr3.Close();
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
			this.lnkhome.Click += new System.EventHandler(this.lnkhome_Click);
			this.lnkbuy.Click += new System.EventHandler(this.lnkbuy_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion



		private void lnkbuy_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("3.aspx");
		}

		private void lnkhome_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("index.aspx");
		}
	}
}
