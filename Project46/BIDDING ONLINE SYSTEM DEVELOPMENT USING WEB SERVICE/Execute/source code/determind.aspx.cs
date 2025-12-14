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
	/// Summary description for determind.
	/// </summary>
	public class determind : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button btnsearch;
		protected System.Web.UI.WebControls.DataGrid dgshow;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.DropDownList txtat_year;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.DataGrid dgCancle;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label7;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			if(!Page.IsPostBack)
			{
				BindData();
				//BindDataCancle();
			}

		}
		private void BindData()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT NameOffice,Address,Phone "
				+"FROM DetailOffice  "
				+"WHERE IDPlace= " + Session["govermentid"] ;
			
			sqlconn.Open();
			SqlCommand comm=new SqlCommand(strsql,sqlconn);
			SqlDataReader dr=comm.ExecuteReader();
			dr.Read();
			Label7.Text=dr.GetString(0);
			dr.Close();
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
			this.txtat_year.SelectedIndexChanged += new System.EventHandler(this.txtat_year_SelectedIndexChanged);
			this.btnsearch.Click += new System.EventHandler(this.btnsearch_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnsearch_Click(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT O.NameOffice,B.NameBidding,B.IDBuying,B.AtYear,B.EndSubmit,B.IDBidding "
				+"FROM DetailOffice O,DetailBidding B "
				+"WHERE B.IDPlace=O.IDPlace AND "
				+"O.IDPlace =" + Session["Govermentid"]
				+"AND B.AtYear=" + txtat_year.SelectedItem 
				+"AND B.Cancle=" + 0;
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Spect1");
			DataView dv=new DataView(ds.Tables["Spect1"]);
			if(dv.Count>=1)
			{
				Label4.Visible=true;
				dgshow.Visible=true;
			}
			dgshow.DataSource=dv;
			dgshow.DataBind();


		//bind Datagrid Cancle
			string strsql1="SELECT O.NameOffice,B.NameBidding,B.IDBuying,B.AtYear,B.EndSubmit,B.IDBidding "
				+"FROM DetailOffice O,DetailBidding B "
				+"WHERE B.IDPlace=O.IDPlace AND "
				+"O.IDPlace =" + Session["Govermentid"]
				+"AND B.AtYear=" + txtat_year.SelectedItem 
				+"AND B.Cancle=" + 1;
			SqlDataAdapter da1=new SqlDataAdapter(strsql1,sqlconn);
			DataSet ds1=new DataSet();
			da1.Fill(ds1, "Spect1");
			DataView dv1=new DataView(ds1.Tables["Spect1"]);
			if(dv1.Count>=1)
			{
				Label3.Visible=true;
				dgCancle.Visible=true;
			}
			dgCancle.DataSource=dv1;
			dgCancle.DataBind(); 


			
		}

		private void txtat_year_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}

	}
}
