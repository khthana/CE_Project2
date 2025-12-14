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
namespace WebApplication1
{
	/// <summary>
	/// Summary description for index.
	/// </summary>
	public class index : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.DataGrid Datagrid2;
		protected System.Web.UI.WebControls.ImageButton ImageButton1;
		protected System.Web.UI.WebControls.Button Button1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			Session.Clear();
			
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
			this.ImageButton1.Click += new System.Web.UI.ImageClickEventHandler(this.ImageButton1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{
			
			string sqlCommand = "select * from \"MEMBER\" where \"USERNAME\" = '"+TextBox1.Text.ToString()+"' and \"PASSWORD\"='"+TextBox2.Text+"'";
			NpgsqlConnection connection = DataAccess.getOlalaConnection();
			connection.Open();
			NpgsqlCommand command = new NpgsqlCommand(sqlCommand,connection);

			
			DataSet ds = new DataSet();

			
			NpgsqlDataAdapter da = new NpgsqlDataAdapter(sqlCommand,connection);
			da.Fill(ds);

			connection.Close();
			if(ds.Tables[0].Rows.Count>0)
			{
				Session.Add("userName",TextBox1.Text);
				Response.Redirect("Profile.aspx");
			}
			//DataGrid1.DataSource=ds;
			//DataGrid1.DataBind();
		}

		private void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			Response.Redirect("CourseChooser.aspx");
		}
	}
}
