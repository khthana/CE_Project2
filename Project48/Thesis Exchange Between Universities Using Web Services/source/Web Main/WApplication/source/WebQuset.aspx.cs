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

namespace WApplication
{
	/// <summary>
	/// Summary description for WebQuset.
	/// </summary>
	public class WebQuset : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.HyperLink HyperLink1;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		WApplication.Components.WebDB webDB = new WApplication.Components.WebDB();
		DataSet se = new DataSet();

		private void Page_Load(object sender, System.EventArgs e)
		{
			se = webDB.GetQust();
			DataGrid1.DataSource=a();
			DataGrid1.DataBind();
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
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGrid1.CurrentPageIndex = e.NewPageIndex;
			DataGrid1.DataSource=a();
			DataGrid1.DataBind();
		}

		
		DataView a()
		{
			TableRow r = new TableRow();
			DataTable dt = new DataTable();
			DataTable nt = new DataTable();
			dt = se.Tables[0];
			
			nt.Columns.Add("<center> คำถาม </center>", typeof(string));
			nt.Columns.Add("<center> ผู้ตอบ </center>", typeof(string));

			for (int i = 0;i< se.Tables[0].Rows.Count;i++)
			{
				//	string aa,bb;
				//	aa =   "<a href=\"WebForm5.aspx?title=" + c1+"&author="+c3+"&uni="+uni+"&hum="+hum+"\">"+c1+"</a>" + " / " + c3;
				//	bb = "<center>" + (ii++) + "</center>";
				string aa,bb;
				DataSet he = new DataSet();
				he = webDB.GetAns( int.Parse(se.Tables[0].Rows[i].ItemArray[0].ToString()));
				
				bb = "<a href=\"WebAns.aspx?QID=" +se.Tables[0].Rows[i].ItemArray[0].ToString()+"\">" +se.Tables[0].Rows[i].ItemArray[1].ToString()+ "</a>";
				aa =" <center>" +he.Tables[0].Rows[0].ItemArray[0].ToString()+ "</center>";
				nt.Rows.Add(new object[]{bb,aa});

			}
			DataView source = new DataView(nt);
			return source;
					
		}
	}
}
