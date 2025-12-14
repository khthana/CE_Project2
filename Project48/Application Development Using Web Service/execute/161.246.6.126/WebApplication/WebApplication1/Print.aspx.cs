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

namespace WebApplication1
{
	/// <summary>
	/// Summary description for Print.
	/// </summary>
	public class Print : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Data.DataSet dataSet1;
		DataTable selectedCourseDataTable = new DataTable();
	
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

		
			DataSet ds = (DataSet)Session["tempDataSet"];
			for(int i =0;i<Convert.ToInt16(ds.Tables[0].Rows.Count.ToString());i++)
			{
				if(i!=(int)Session["index"])
					ds.Tables[0].Rows[i].Delete();
			}
			

			DataGrid1.DataSource = ds;
			//DataGrid1.DataMember="mymymy";
			DataGrid1.DataBind();
			
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.dataSet1 = new System.Data.DataSet();
			((System.ComponentModel.ISupportInitialize)(this.dataSet1)).BeginInit();
			// 
			// dataSet1
			// 
			this.dataSet1.DataSetName = "NewDataSet";
			this.dataSet1.Locale = new System.Globalization.CultureInfo("th-TH");
			this.Load += new System.EventHandler(this.Page_Load);
			((System.ComponentModel.ISupportInitialize)(this.dataSet1)).EndInit();

		}
		#endregion
	}
}
