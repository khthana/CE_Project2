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
	/// Summary description for cancle.
	/// </summary>
	public class cancle : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Button Button1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);

			string strsql="SELECT CanclePassword FROM DetailOffice "
						+"WHERE IDPlace= " + Session["idp1"];
			
			sqlconn.Open();
			SqlCommand comm =new SqlCommand(strsql,sqlconn);
			SqlDataReader dr=comm.ExecuteReader();
			dr.Read();
			if(dr.GetString(0)==TextBox2.Text)
			{
				dr.Close();

				string strsql1="UPDATE DetailBidding SET "
					+"Cancle='" + 1 +"'"
					+"WHERE IDBidding =" + Session["idb1"];
				string strsql2="UPDATE DetailBidding SET "
					+"Cancle='" + 1 +"'"
					+"WHERE IDBidding =" + Session["idb1"];
				SqlCommand comm1 =new SqlCommand(strsql1,sqlconn);
				comm1.ExecuteNonQuery();
				SqlCommand comm2 =new SqlCommand(strsql2,sqlconn);
				comm2.ExecuteNonQuery();
				
				
				StringBuilder msg1 = new StringBuilder();
				msg1.Append("<script>\r\n");
				msg1.Append("alert(\"ขณะนี้การประกวดนี้ได้ถูกยกเลิกแล้ว !\");\r\n");
				msg1.Append("window.location.href='EmailCancle.aspx';\r\n");
				msg1.Append("</script>\r\n");
				this.RegisterClientScriptBlock("clientScript",msg1.ToString());






			}
			else
			{
				StringBuilder msg = new StringBuilder();
				msg.Append("<script>\r\n");
				msg.Append("alert(\"password ผิด !\");\r\n");
				msg.Append("window.location.href='winner.aspx';\r\n");
				msg.Append("</script>\r\n");
				this.RegisterClientScriptBlock("clientScript",msg.ToString());
			}
			
		}
	}
}
