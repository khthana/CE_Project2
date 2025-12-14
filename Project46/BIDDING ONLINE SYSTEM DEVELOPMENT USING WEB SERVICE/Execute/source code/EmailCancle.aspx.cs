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
using System.Web.Mail;

namespace project
{
	/// <summary>
	/// Summary description for EmailCancle.
	/// </summary>
	public class EmailCancle : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.TextBox txtsubject;
		protected System.Web.UI.WebControls.TextBox txtnews;
		protected System.Web.UI.WebControls.LinkButton LinkButton1;
		protected System.Web.UI.WebControls.Label Label3;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql0="SELECT NameBidding FROM DetailBidding "
				+"WHERE IDBidding=" + Session["idb1"] ;
			sqlconn.Open();
			SqlCommand comm =new SqlCommand(strsql0,sqlconn);
			SqlDataReader dr =comm.ExecuteReader();
			dr.Read();
			Label4.Text=dr.GetString(0);
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
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.LinkButton1.Click += new System.EventHandler(this.LinkButton1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);

			string strsql="SELECT DISTINCT C.IDCompany,D.Email,D.Name FROM DetailCompany D,CompareCompany C "
				+" WHERE  C.IDBidding=" + Session["idb1"] 
				+" AND C.IDCompany=D.IDCompany ";
						
			SqlCommand comm= new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			SqlDataReader dr =comm.ExecuteReader();
			MailMessage mail = new MailMessage();
			
			while(dr.Read())
			{	
				mail.From="aaa@hotmail.com";	
				mail.To=dr["Email"].ToString();
				mail.Subject = "To " + dr["Name"].ToString() + ":" + this.txtsubject.Text.Trim();
				mail.Body = this.txtnews.Text.Trim();
				SmtpMail.SmtpServer = "161.246.4.3";//"net1.ji-net.com";// 
				SmtpMail.Send(mail);
			}
			dr.Close();
			sqlconn.Close();
			Response.Redirect("main.aspx");

		
		}

		private void LinkButton1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("main.aspx");
		}
	}
}
