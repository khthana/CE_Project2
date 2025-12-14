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
	/// Summary description for SubmitGoverment.
	/// </summary>
	public class SubmitGoverment : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label lll;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.TextBox txtPhone;
		protected System.Web.UI.WebControls.TextBox txtName;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Button Button2;
		protected System.Web.UI.WebControls.TextBox txtUser;
		protected System.Web.UI.WebControls.TextBox txtPass;
		protected System.Web.UI.WebControls.TextBox txtConfirmPass;
		protected System.Web.UI.WebControls.Label Label17;
		protected System.Web.UI.WebControls.TextBox txtCall;
		protected System.Web.UI.WebControls.RegularExpressionValidator regPhone;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvpwd1;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvpwd2;
		protected System.Web.UI.WebControls.CompareValidator cmppwd;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator3;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator5;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator6;
		protected System.Web.UI.WebControls.CompareValidator CompareValidator1;
		protected System.Web.UI.HtmlControls.HtmlTextArea areaAddress;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			if(!Page.IsPostBack)
			{
//				txtName.Text="สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง";
//				txtCall.Text="สถาบัน";
//				areaAddress.InnerText="ลำปลาทิว กรุงเทพ";
//				txtPhone.Text="02-712-7000";
//				txtUser.Text="ss";
//				txtPass.Text="ss";
//				txtConfirmPass.Text="ss";
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
			string strsql="INSERT INTO DetailOffice "
				+ "(NameOffice,NicknameOffice,Address,Phone,Username,Password,CanclePassword) "
				+ "VALUES('" + txtName.Text + "','" 
				+ txtCall.Text + "','"
				+ areaAddress.InnerText + "','" 
				+ txtPhone.Text +"','"
				+ txtUser.Text + "','" 
				+ txtPass.Text + "','"
				+ TextBox1.Text + 
				
				"')";

	

			SqlCommand sqlcomm1 = new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm1.ExecuteNonQuery();
			sqlconn.Close();

			StringBuilder msg = new StringBuilder();
			msg.Append("<script>\r\n");
			msg.Append("alert(\"บันทึกข้อมูลเรียบร้อยแล้ว !\");\r\n");
			msg.Append("window.location.href='index.aspx';\r\n");
			msg.Append("</script>\r\n");
			this.RegisterClientScriptBlock("clientScript",msg.ToString());

			//Response.Redirect("index.aspx");
		}

	

	}
}
