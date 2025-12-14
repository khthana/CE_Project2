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
using System.Text;
namespace WebApplication1
{
	/// <summary>
	/// Summary description for Profile.
	/// </summary>
	public class Profile : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button fButtonCancel;
		protected System.Web.UI.WebControls.Button fButtonBuy;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Label Label4;

		private DataSet mDataSet;
	
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

			renderDataGrid();
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.DataGrid1.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand_1);
			this.fButtonCancel.Click += new System.EventHandler(this.fButtonCancel_Click);
			this.fButtonBuy.Click += new System.EventHandler(this.fButtonBuy_Click);
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		public void renderDataGrid()
		{
			string sqlCommand = constructString();
			NpgsqlConnection connection = DataAccess.getOlalaConnection();
			connection.Open();
			NpgsqlCommand command = new NpgsqlCommand(sqlCommand,connection);

			
			DataSet ds = new DataSet();
			
			NpgsqlDataAdapter da = new NpgsqlDataAdapter(sqlCommand,connection);
			da.Fill(ds);
			connection.Close();

			mDataSet = ds;
			
			DataGrid1.DataSource = ds;
			DataGrid1.DataBind();
			configDataGrid();
			
			
		}
		public string constructString()
		{
			string userName = (String)Session["userName"];
			//construct select * from transaction where username = "username email"
			StringBuilder str = new StringBuilder();
			str.Append("select \"TRANSACTION\".\"STATUS\",\"CLASS\".* from \"TRANSACTION\",\"CLASS\" where \"TRANSACTION\".\"COURSEID\" = \"CLASS\".\"CLASSID\"and \"TRANSACTION\".\"SCHOOL\" = \"CLASS\".\"SCHOOL\" and \"TRANSACTION\".\"USERNAME\" = '");
			//str.Append(userName+"'");
			
			//str.Append("select * from \"TRANSACTION\" where \"USERNAME\" = '");
			str.Append(userName+"'");
			return str.ToString();
		}

		private void fButtonBuy_Click(object sender, System.EventArgs e)
		{
			DataSet newDataSet = getSelectedDataSet();
			Session.Add("buyingDataSet",newDataSet);
			Response.Redirect("https://161.246.6.126/WebApplication1/Paying.aspx");
		}

		private void fButtonCancel_Click(object sender, System.EventArgs e)
		{
			DataSet newDataSet = getSelectedDataSet();	
			Session.Add("cancelDataSet",newDataSet);
			Response.Redirect("CancelReservation.aspx");
			
		}

		public DataSet getSelectedDataSet()
		{
			
			DataGridItemCollection items = DataGrid1.Items;
			DataTable dt =new DataTable();
			dt = mDataSet.Tables[0];
			DataRow tempRow = dt.NewRow();
			for (int i=DataGrid1.Items.Count-1; i >=0 ; i--)
			{
				CheckBox chkBox = (CheckBox)items[i].Cells[0].FindControl("CheckBox1");
				if (!chkBox.Checked)
				{
					dt.Rows.RemoveAt(i);
				}
			}
			DataSet newDataSet = new DataSet("new");
			newDataSet=mDataSet;
			return newDataSet;
		}

		public void configDataGrid()
		{	
			DataGridItemCollection items = DataGrid1.Items;
			DataTable dt =new DataTable();
			dt = mDataSet.Tables[0];
			DataRow tempRow = dt.NewRow();
			
			for (int i=0; i <DataGrid1.Items.Count ; i++)
			{
				//tempRow=dataSet1.Tables["myTable"].Rows[i];
				//items[i].Cells[2/*status column*/].Enabled=false;
				
				if (items[i].Cells[2/*status column*/].Text.ToString() == "Reserved")
				{
					CheckBox chkBox = (CheckBox)items[i].Cells[0].FindControl("CheckBox1");
					chkBox.Enabled = true;
				}
				
			}

			for (int i=0; i <DataGrid1.Items.Count ; i++)
			{
				//tempRow=dataSet1.Tables["myTable"].Rows[i];
				//items[i].Cells[2/*status column*/].Enabled=false;
				
				if (items[i].Cells[2/*status column*/].Text.ToString() != "Paid")
				{
					items[i].Cells[1/*status column*/].Text="";
					
					//ButtonColumn btC = (ButtonColumn)items[i].Cells[1].
					//chkBox.Enabled = true;
				}
				else
				{



				}
				
			}
		}

		private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			int row = e.Item.ItemIndex;
			DataGridItemCollection items = DataGrid1.Items;
			DataRow tempRow = mDataSet.Tables[0].Rows[row];
			DataTable tempTable = mDataSet.Tables[0];
			Session.Add("tempTable",tempTable);
			Session.Add("selectedRow",tempRow);
			Session.Add("tempDataSet",mDataSet);
			Session.Add("index",row);
			Response.Redirect("Print.aspx");
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("CourseChooser.aspx");
		}

		private void DataGrid1_DeleteCommand_1(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			int row = e.Item.ItemIndex;
			DataGridItemCollection items = DataGrid1.Items;
			DataRow tempRow = mDataSet.Tables[0].Rows[row];
			DataTable tempTable = mDataSet.Tables[0];
			Session.Add("tempTable",tempTable);
			Session.Add("selectedRow",tempRow);
			Session.Add("tempDataSet",mDataSet);
			Session.Add("index",row);
			Response.Redirect("Print.aspx");
		}

	
	}
}
