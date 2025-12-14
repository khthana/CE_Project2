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
using System.Text;

namespace project
{
	/// <summary>
	/// Summary description for bid_product.
	/// </summary>
	public class bid_product : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.DataGrid dgG1;
		protected System.Web.UI.WebControls.Label Label4;
		int gather=1;
		int equal=0;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.DataGrid dgC1;
		protected System.Web.UI.WebControls.DataGrid dgG2;
		protected System.Web.UI.WebControls.DataGrid dgC2;
		protected System.Web.UI.WebControls.DataGrid dgG3;
		protected System.Web.UI.WebControls.DataGrid dgC3;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Button Button2;
		int minus=-1;
	

		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			if(!Page.IsPostBack)
			{
				
				string strconn="server=(local);database=project;uid=sa;password=;";
				SqlConnection sqlconn=new SqlConnection(strconn);
				if(!Page.IsPostBack)
				{
					BindData_G1();
					BindData_C1();
					BindData_G2();
					BindData_C2();
					BindData_G3();
					BindData_C3();
					
					sqlconn.Open();
					string str="SELECT* FROM DetailBidding "
						+"WHERE IDBidding= " + Session["idb1"];
					SqlCommand comm0=new SqlCommand(str,sqlconn);
					SqlDataReader dr0=comm0.ExecuteReader();
					dr0.Read();
						Label3.Text=dr0["NameProduct"].ToString();
					dr0.Close();
					


					string strsql="SELECT DetailCompany.Name "
						+"FROM    SpectCompany INNER JOIN DetailCompany "
						+"ON SpectCompany.IDCompany=DetailCompany.IDCompany  "
						+"AND DetailCompany.IDCompany=" + Request.QueryString["idcompany"];
					SqlCommand comm1=new SqlCommand(strsql,sqlconn);
					SqlDataReader dr1=comm1.ExecuteReader();
					dr1.Read();
					Label4.Text=dr1["Name"].ToString();
					dr1.Close();
					sqlconn.Close();
				}

			}
		}
		private void BindData_G1()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
				string strsql="SELECT Detail,Number,Unit "
					+"FROM Spect "
					+"WHERE IDBidding=" + Session["idb1"] 
					+"AND Type=" + gather.ToString()
					
					+"ORDER BY Detail";
				SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
				DataSet ds=new DataSet();
				da.Fill(ds, "Spect1");
				DataView dv=new DataView(ds.Tables["Spect1"]);
				dgG1.DataSource=dv;
				dgG1.DataBind();
		}	

		private void BindData_C1()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT Detail,Number,Unit "
				+"FROM CompareCompany "
				+"WHERE IDBidding=" + Session["idb1"]
				+"AND IDCompany= "+ Request.QueryString["idcompany"]
				+"AND Type=" + gather
				+"ORDER BY Detail";
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Spect1");
			DataView dv=new DataView(ds.Tables["Spect1"]);
			dgC1.DataSource=dv;
			dgC1.DataBind();
		}	
		private void BindData_G2()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT Detail,Number,Unit "
				+"FROM Spect "
				+"WHERE IDBidding=" + Session["idb1"] 
				+"AND Type=" + minus
				
				+"ORDER BY Detail";
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Spect1");
			DataView dv=new DataView(ds.Tables["Spect1"]);
			dgG2.DataSource=dv;
			dgG2.DataBind();
		}
		private void BindData_C2()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT Detail,Number,Unit "
				+"FROM CompareCompany "
				+"WHERE IDBidding=" + Session["idb1"] 
				+"AND Type=" + minus
				+"AND IDCompany= "+ Request.QueryString["idcompany"]
				+"ORDER BY Detail";
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Spect1");
			DataView dv=new DataView(ds.Tables["Spect1"]);
			dgC2.DataSource=dv;
			dgC2.DataBind();
		}
		private void BindData_G3()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT Detail "
				+"FROM Spect "
				+"WHERE IDBidding=" + Session["idb1"] 
				+"AND Type=" + equal
				
				+"ORDER BY Detail";
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Spect1");
			DataView dv=new DataView(ds.Tables["Spect1"]);
			dgG3.DataSource=dv;
			dgG3.DataBind();
		}
		private void BindData_C3()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT Detail "
				+"FROM CompareCompany "
				+"WHERE IDBidding=" + Session["idb1"] 
				+"AND Type=" + equal
				+"AND IDCompany= "+ Request.QueryString["idcompany"]
				+"AND Number=1"
				+"ORDER BY Detail";
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Spect1");
			DataView dv=new DataView(ds.Tables["Spect1"]);
			dgC3.DataSource=dv;
			dgC3.DataBind();
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
			this.Button2.Click += new System.EventHandler(this.Button2_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void dgshow_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			
		}

		private void LinkButton1_Click(object sender, System.EventArgs e)
		{
			
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("winner.aspx");
		}

		private void Button2_Click(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql1="SELECT Winner FROM DetailBidding "
							+"WHERE IDBidding =" + Session["idb1"] ;
			sqlconn.Open();
			SqlCommand comm1 =new SqlCommand(strsql1,sqlconn);
			SqlDataReader dr1 =comm1.ExecuteReader();
			dr1.Read();
			int x=0;
			x=dr1.GetInt32(0);
			dr1.Close();
			sqlconn.Close();

			if(x == 0)
			{
				string strsql2="UPDATE DetailBidding SET "
					+"Winner='" + Request.QueryString["idcompany"] +"'"
					+"WHERE IDBidding =" + Session["idb1"];
				sqlconn.Open();
				SqlCommand comm2 =new SqlCommand(strsql2,sqlconn);
				comm2.ExecuteNonQuery();
				sqlconn.Close();

				StringBuilder msg1 = new StringBuilder();
				msg1.Append("<script>\r\n");
				msg1.Append("alert(\"ท่านได้เลือกผู้ประกอบการรายนี้เป็นผู้ชนะการประกวด !\");\r\n");
				msg1.Append("window.location.href='determind.aspx';\r\n");
				msg1.Append("</script>\r\n");
				this.RegisterClientScriptBlock("clientScript",msg1.ToString());
			}
			else
			{
				StringBuilder msg2 = new StringBuilder();
				msg2.Append("<script>\r\n");
				msg2.Append("alert(\"การประกวดนนี้ท่านได้เลือกผู้ชนะไปแล้ว !\");\r\n");
				msg2.Append("window.location.href='determind.aspx';\r\n");
				msg2.Append("</script>\r\n");
				this.RegisterClientScriptBlock("clientScript",msg2.ToString());

			}
		}


	}
}
