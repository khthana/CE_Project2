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
	/// Summary description for index.
	/// </summary>
	public class index : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.DataGrid dg1;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.TextBox UserName;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.TextBox Password;
		protected System.Web.UI.WebControls.LinkButton LinkButton1;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.DataGrid dg2;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.TextBox txtUserName;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.TextBox txtPassword;
		protected System.Web.UI.WebControls.LinkButton submitCompany;
		protected System.Web.UI.WebControls.Button Button2;
		protected System.Web.UI.WebControls.Label lblName;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Button btnLogout;
		protected System.Web.UI.WebControls.HyperLink lnkrecommend;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			Session["id"]=Session.SessionID;
			// Put user code to initialize the page here
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);

			if(!Page.IsPostBack)
			{
				BindData1();
				BindData2();
				
			}
			
			if(Session["complete"]=="1")
			{
				lblName.Visible=true;
				Label8.Visible=true;
				btnLogout.Visible=true;
				lblName.Text=Session["welcome"].ToString();
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
			this.btnLogout.Click += new System.EventHandler(this.btnLogout_Click);
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.LinkButton1.Click += new System.EventHandler(this.LinkButton1_Click);
			this.Button2.Click += new System.EventHandler(this.Button2_Click);
			this.submitCompany.Click += new System.EventHandler(this.submitCompany_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		//begin bind dg1 ----------------------
		public void BindData1()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql1="SELECT *"
				+"FROM DetailBidding  "
				+"Where Cancle=0";// IDBidding";
				
			SqlDataAdapter da1=new SqlDataAdapter(strsql1,sqlconn);
			
			
			sqlconn.Open();

			string x;
			x="3/3/2547";
		
			
			
			
			DataSet ds1=new DataSet();
			da1.Fill(ds1, "Spect1");
			DataView dv1=new DataView(ds1.Tables["Spect1"]);
			
			dv1.RowFilter="EndSubmit>='"+ Convert.ToDateTime(System.DateTime.Today.ToShortDateString()) +"'";
			
			dg1.DataSource=dv1;
			dg1.DataBind();
			
			sqlconn.Close();
		}
		
		public void DataGrid_Page1(object sender, DataGridPageChangedEventArgs e)
		{
			dg1.CurrentPageIndex = e.NewPageIndex;
			BindData1();
		}

		
		//begin dg2---------------

		public void BindData2()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql2="SELECT *"
				+"FROM DetailBidding "
				+"WHERE Cancle=0";
			SqlDataAdapter da2=new SqlDataAdapter(strsql2,sqlconn);
			DataSet ds2=new DataSet();
			da2.Fill(ds2, "Spect2");
			DataView dv2=new DataView(ds2.Tables["Spect2"]);
			dv2.RowFilter="EndSubmit<='"+ Convert.ToDateTime(System.DateTime.Today.ToShortDateString()) +"'";
			dg2.DataSource=dv2;
			dg2.DataBind();
		}
		
		public void DataGrid_Page2(object sender, DataGridPageChangedEventArgs e)
		{
			dg2.CurrentPageIndex = e.NewPageIndex;
			BindData2();
		}
		
		private void Button1_Click(object sender, System.EventArgs e)
		{
			if(Session["complete"]=="1")
			{


				StringBuilder msg1 = new StringBuilder();
				msg1.Append("<script>\r\n");
				msg1.Append("alert(\"ขณะนี้ท่านได้ login ในฐานะอื่นอยู่แล้ว กรุณาออกก่อน !\");\r\n");
				msg1.Append("window.location.href='index.aspx';\r\n");
				msg1.Append("</script>\r\n");
				this.RegisterClientScriptBlock("clientScript",msg1.ToString());
			}
			else
			{
				string strconn="server=(local);database=project;uid=sa;password=;";
				SqlConnection sqlconn=new SqlConnection(strconn);

				string strsql="SELECT IDPlace,Username,Password "
					+"FROM DetailOffice ";
				//+"WHERE IDPlace= 18 "; 

				sqlconn.Open();
				SqlCommand sqlcomm = new SqlCommand(strsql,sqlconn);
				SqlDataReader dr=sqlcomm.ExecuteReader();
				bool bo=false;
			 
				while(dr.Read())
				{
					if(UserName.Text==dr.GetString(1))
					{
						if(Password.Text==dr.GetString(2))
						{
						
							Session["Govermentid"]=dr.GetInt32(0);
						
							Response.Redirect("main.aspx?idplace=" + dr.GetInt32(0).ToString() );
						
							bo=true;
						
						}
					}


				}
				if(!bo)
				{
					StringBuilder msg = new StringBuilder();
					msg.Append("<script>\r\n");
					msg.Append("alert(\"password หรือ  username ผิด กรุณาใส่ใหม่ !\");\r\n");
					msg.Append("window.location.href='index.aspx';\r\n");
					msg.Append("</script>\r\n");
					this.RegisterClientScriptBlock("clientScript",msg.ToString());
				}

				dr.Close();
			}
		}
		private void LinkButton1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("SubmitGoverment.aspx");
		}

		public void lnk_click(object sender, System.EventArgs e)
		{
			//dg1.Items[i].Cells[0].Text;
//		for(int i=0; i<dg1.Items.Count; i++)
//			Response.Write(dg1.Items[i].Cells[1].Text);
//			string strconn="server=(local);database=project;uid=sa;password=;";
//			SqlConnection sqlconn=new SqlConnection(strconn);
//			string strsql9="SELECT IDBidding,IDPlace FROM DetailBidding "
//							+ " 
		}
		private void test(object sender, System.EventArgs e)
		{
			Response.Write("jing");
		}

		//---------begin login and submit company
		



		private void submitCompany_Click(object sender, System.EventArgs e)
		{
				Response.Redirect("SubmitCompany.aspx");
		}

		private void Button2_Click(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);

			string strsql="SELECT UserName,Password,IDCompany,Name FROM DetailCompany " ;
				
		 
			if(Session["complete"]=="1")
			{


				StringBuilder msg1 = new StringBuilder();
				msg1.Append("<script>\r\n");
				msg1.Append("alert(\"ขณะนี้ท่านได้ login อยู่แล้ว กรุณาออกก่อน !\");\r\n");
				msg1.Append("window.location.href='index.aspx';\r\n");
				msg1.Append("</script>\r\n");
				this.RegisterClientScriptBlock("clientScript",msg1.ToString());
			}
			else 
			{


				sqlconn.Open();
				SqlCommand sqlcomm = new SqlCommand(strsql,sqlconn);
				SqlDataReader dr=sqlcomm.ExecuteReader();

				bool bo=false;
				while(dr.Read())
				{
					if(txtUserName.Text==dr.GetString(0))
					{
						if(txtPassword.Text==dr.GetString(1))
						{

							Session["complete"]="1";
							Session["iduser"]=dr.GetInt32(2).ToString();
							Session["welcome"]=dr.GetString(3);
							dr.Close();
							sqlconn.Close();
							bo=true;
						string strsql7="INSERT INTO Login "
							+ "(IDCompany,TimeLogin) "
							+ "VALUES(" + 10 + ",'"//Session["iduser"]
							+ System.DateTime.Now + "')";
						sqlconn.Open();
						SqlCommand comm7= new SqlCommand(strsql7,sqlconn);
						comm7.ExecuteNonQuery();
							sqlconn.Close();						
							Response.Redirect("index.aspx");
						
						}
					}


				}
				if(!bo)
				{
					StringBuilder msg = new StringBuilder();
					msg.Append("<script>\r\n");
					msg.Append("alert(\"password หรือ  username ผิด กรุณาใส่ใหม่ !\");\r\n");
					msg.Append("window.location.href='index.aspx';\r\n");
					msg.Append("</script>\r\n");
					this.RegisterClientScriptBlock("clientScript",msg.ToString());
				}
			}
		}

		private void btnLogout_Click(object sender, System.EventArgs e)
		{
			Session["complete"]="0";
			Response.Redirect("index.aspx");
		}

	
	}
}
