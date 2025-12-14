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
	/// Summary description for SelectedSummary.
	/// </summary>
	public class SelectedSummary : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.HtmlControls.HtmlForm Form1;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Button Button3;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label4;
		private DataSet selectedDataSet;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			
			DataGridItemCollection items = DataGrid1.Items;
			DataTable dt =new DataTable();
			dt = selectedDataSet.Tables[0];
			DataRow tempRow = dt.NewRow();
			for (int i=DataGrid1.Items.Count-1; i >=0 ; i--)
			{
				
				//if (!chkBox.Checked)
				//{
					tempRow=selectedDataSet.Tables[0].Rows[i];
					double firstDigit = Convert.ToDouble(tempRow.ItemArray.GetValue(11).ToString());
					double secondDigit =Convert.ToDouble(TextBox1.Text);
					double sum =(firstDigit+secondDigit);
					TextBox1.Text=sum.ToString();

				//}
				//TextBox1.Text+=tempRow.ItemArray.GetValue(11).ToString();

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
			
			
			selectedDataSet = (DataSet)Session["SelectedDataSet2"];
			DataGrid1.DataSource = selectedDataSet;
			DataGrid1.DataBind();
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.DataGrid1.SelectedIndexChanged += new System.EventHandler(this.DataGrid1_SelectedIndexChanged);
			this.Button3.Click += new System.EventHandler(this.Button3_Click);
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

	

		private void Button3_Click(object sender, System.EventArgs e)
		{
			DataGridItemCollection items = DataGrid1.Items;
			DataTable dt =new DataTable();
			dt = selectedDataSet.Tables[0];
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
			newDataSet=selectedDataSet;
			Session.Add("confirmDataSet",newDataSet);
			Session.Add("isBuyOrReserve",false);
			Session.Add("reservedDataSet",newDataSet);
			Response.Redirect("conFirmLogin.aspx");
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("index.aspx");
		}

		private void DataGrid1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}



	}
}
