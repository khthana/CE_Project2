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
using Npgsql;
using System.Web.Mail;

namespace WebApplication1
{
	/// <summary>
	/// Summary description for SendMail.
	/// </summary>
	public class SendMail : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.Button Button1;
		private string mMail;
		private string mPassword;
	
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
			mMail = TextBox1.Text;
			mPassword = "badd";//getPassword(mMail);
			doSendMail();
		}
//		public string getPassword(string mMail)
//		{
//			string sqlCommand = "select password from member where username = "+mMail;
//			NpgsqlConnection connection = DataAccess.getOlalaConnection();
//			connection.Open();
//			NpgsqlCommand command = new NpgsqlCommand(sqlCommand,connection);
//			
//			NpgsqlDataReader reader = command.ExecuteReader();
//			reader.Read();
//			connection.Close();
//			return reader[0].ToString();
//		}

		public void doSendMail()
		{
			SmtpMail.SmtpServer = "mail.olalaedu.com";//mail.OlalaEdu.com
			MailMessage mail = new MailMessage();
			mail.To = mMail;
			mail.From = "krisda2u@hotmail.com";
			mail.Subject = "your olala edu portal password";
			mail.Body = mPassword;// ตรงนี้ใส่ เนื้อหา + password
			SmtpMail.Send(mail);
			Response.Flush();
			Response.Redirect("sendMailSucceeded.html");

		}
	}
}
