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
	/// Summary description for WebAns.
	/// </summary>
	public class WebAns : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataList DataList_News;
		protected System.Web.UI.WebControls.Table Table1;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.Button Button1;
		WApplication.Components.WebDB webDB = new WApplication.Components.WebDB();
		string Qid;

		DataSet se = new DataSet();
		DataSet he = new DataSet();

		private void Page_Load(object sender, System.EventArgs e)
		{
		//	DataSet newsDS = webDB.GetNews();
		//	DataList_News.DataSource=newsDS;
		//	DataList_News.DataBind();
			Qid = Request.Params["QID"];

			he = webDB.GetAnsAll(int.Parse(Qid.ToString()));
			se = webDB.GetQuest(int.Parse(Qid.ToString()));

			//============================================================
			TableRow tr = new TableRow();
			TableCell tc = new TableCell();

			tc.Controls.Add(new LiteralControl("<th style=\"FONT-WEIGHT: bold; FONT-SIZE: 24px; COLOR: blue; FONT-STYLE: italic\">ถาม - ตอบ</th><br>"));
	
			tc.Controls.Add(new LiteralControl("<tr ><table width = \"80%\" cellSpacing=\"1\" cellPadding=\"1\" align=\"center\" border=\"1\" bgColor = \"#f0e68c\"><tr> <td ><br> <center><h3>ถาม</h3></center>Title :" + se.Tables[0].Rows[0].ItemArray[1]+ "</br> detail :"+se.Tables[0].Rows[0].ItemArray[2] + " </br> Name " +se.Tables[0].Rows[0].ItemArray[3] + " <br></td></tr></table><br>"));


			for (int i = 0; i<he.Tables[0].Rows.Count ; i++)
			{
				string uu = he.Tables[0].Rows[i].ItemArray[2].ToString();

				if (he.Tables[0].Rows[i].ItemArray[2].ToString().Length > 40)
				{
					int aa,bb;
					bb = he.Tables[0].Rows[i].ItemArray[2].ToString().Length;
					aa = ( bb / 40);
					for (int jj=1; jj <= aa; jj++)
					{
						uu = uu.Insert(jj*40,"<br>");
					}
				}
				tc.Controls.Add(new LiteralControl(" <table width = \"80%\" cellSpacing=\"1\" cellPadding=\"1\" align=\"center\" border=\"1\" bgColor = \"#eee8aa\"><tr><td> <center><h3>ตอบ</h3></center> ตอบ :&nbsp;&nbsp;&nbsp; " + uu.ToString() +  " </br> ชื่อ : &nbsp;&nbsp;&nbsp;" +he.Tables[0].Rows[i].ItemArray[1] + "<br><br> </td></tr></table><br>"));
			}
			tr.Cells.Add(tc);
			Table1.Rows.Add(tr);
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
			webDB.AddAns(TextBox2.Text,TextBox1.Text,int.Parse(Qid.ToString()));
					Response.Redirect("WebAns.aspx?QID=" + Qid );
		
		}
	}
}
