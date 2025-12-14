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
	/// Summary description for result.
	/// </summary>
	public class result : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.LinkButton LinkButton1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
	
			
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT  c.Name,b.Winner " 
							+"FROM DetailCompany c ,DetailBidding b "
							+"WHERE b.Winner=c.IDCompany "
							+" AND IDBidding = " + Session["idb1"];
		
			SqlCommand comm=new  SqlCommand(strsql,sqlconn);
			SqlDataAdapter da2=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds2=new DataSet();
			da2.Fill(ds2, "Spect2");
			DataView dv2=new DataView(ds2.Tables["Spect2"]);
			int x;
			x=dv2.Count;
			sqlconn.Open();
			SqlDataReader dr =comm.ExecuteReader();
			dr.Read();

			if(x==1)
			{
				Label1.Visible=true;
				Label2.Visible=true;
				Label2.Text=dr.GetString(0);	
			}
			else
			{

				Label9.Visible=true;
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
			this.LinkButton1.Click += new System.EventHandler(this.LinkButton1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void LinkButton1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("index.aspx");
		}
	}
}
