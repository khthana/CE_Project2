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
	/// Summary description for SubmitCompany.
	/// </summary>
	public class SubmitCompany : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.TextBox txtName;
		protected System.Web.UI.WebControls.TextBox txtAddress;
		protected System.Web.UI.WebControls.TextBox txtTelephone;
		protected System.Web.UI.WebControls.TextBox txtEmail;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.TextBox txtConfirmPass;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.TextBox txtPassword;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.TextBox txtUserName;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator3;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator4;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator5;
		protected System.Web.UI.WebControls.CompareValidator CompareValidator1;
		protected System.Web.UI.WebControls.RegularExpressionValidator regPhone;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator7;
		protected System.Web.UI.WebControls.RegularExpressionValidator RegularExpressionValidator1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator6;
		protected System.Web.UI.WebControls.Label Label6;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			if(!Page.IsPostBack)
			{
//				txtName.Text="∫√‘…—∑ “¡“√∂";
//				txtAddress.Text="√“™‡∑«’";
//				txtTelephone.Text="00-000-0000";
//				txtEmail.Text="jing@hotmail.com";
//				txtUserName.Text="aa";
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
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion


		
	
		
		private void Button1_Click(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);

			string strsql5="INSERT INTO DetailCompany  "
							+ " (Name,Address,Telephone, " 
							+ "Email,UserName,Password) "
							+ "VALUES('" + txtName.Text + "','"
							+ txtAddress.Text + "','"
							+ txtTelephone.Text + "','"
							+ txtEmail.Text + "','"
							+ txtUserName.Text + "','"
							+ txtPassword.Text 
							+"')";
			sqlconn.Open();
			SqlCommand comm =new SqlCommand(strsql5,sqlconn);
			comm.ExecuteNonQuery();
			sqlconn.Close();


	



			Response.Redirect("index.aspx");
		}
	}
}
