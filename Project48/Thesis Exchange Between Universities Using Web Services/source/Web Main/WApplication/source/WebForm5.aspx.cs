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

namespace WApplication
{
	public class WebForm5 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataList DataList_News;
		protected System.Web.UI.WebControls.Table Table1;
		int i=0,j=0;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
//
	//	WApplication.localhost1.Service1 KMITL = new WApplication.localhost1.Service1();
	//	WApplication.localhost1.Service1 KMITL2 = new WApplication.localhost1.Service1();
	//	WApplication.localhost1.Service1 KMITL3 = new WApplication.localhost1.Service1();
		//----------------------------------------------------	
			//==============================================================================
			WApplication.WReference1.Service1 KMITL = new WApplication.WReference1.Service1();
			WApplication.WReference2.Service1 KMITL2 = new WApplication.WReference2.Service1();
	    	WApplication.WReference3.Service1 KMITL3 = new WApplication.WReference3.Service1();


			WApplication.Components.WebDB webDB = new WApplication.Components.WebDB();
			DataSet newsDS = webDB.GetNews();
			DataList_News.DataSource=newsDS;
			DataList_News.DataBind();


			string title = Request.Params["title"];
			string name = Request.Params["author"];
			string hum = Request.Params["hum"];
			string uni = Request.Params["uni"];
			DataSet Show = new DataSet();
			string ANAME="",PNAME="";

			if (hum == "PROFESSOR")
			{
				switch(uni)
				{
					case "KMITL1":
						Show = KMITL.DetailA(title);
						break;
					case "KMITL2":
						Show = KMITL2.DetailA(title);
						break;
					case "KMITL3":
						Show = KMITL3.DetailA(title);
						break;
				}
				PNAME = name;
				ANAME = calname(Show);
			}
			else
			{
				switch(uni)
				{
					case "KMITL1":
						Show = KMITL.DetailP(title); break;
					case "KMITL2":
						Show = KMITL2.DetailP(title); break;
					case "KMITL3":
						Show = KMITL3.DetailP(title); break;
				}
				PNAME = calname(Show);
				ANAME = name;

			}
			
		 //--------------------------------------------------
			
			string aa = "<tr><td>หัวข้อ </td><td>"+ Show.Tables[0].Rows[0].ItemArray[2]+ "</td></tr>";
			string bb  = "<tr><td>ผู้เเต่ง </td><td>" + ANAME +"</td></tr>";
			string cc  = "<tr><td>อาจารย์ที่ปรึกษา</td><td>" + PNAME +"</td></tr>";
			string dd  = "<tr><td>ISBN</td><td>"	+ Show.Tables[0].Rows[0].ItemArray[1]+"</td></tr>";
			string ee  = "<tr><td>ปีการศึกษา</td><td>"	+ Show.Tables[0].Rows[0].ItemArray[3]+"</td></tr>";
			string ff  = "<tr><td>Abstract</td><td>" + Show.Tables[0].Rows[0].ItemArray[5]+"</td></tr>";
	//	
			string gg = "<tr><td>คณะ  </td><td>" + Show.Tables[0].Rows[0].ItemArray[4] +"</td></tr>";
			string hh = "<tr><td>ภาควิชา  </td><td>" + Show.Tables[0].Rows[0].ItemArray[5]+"</td></tr>";
		//=======================================================================
		TableRow tr = new TableRow();
		TableCell tc = new TableCell();

			tc.Controls.Add(new LiteralControl("<th ></br><h3>รายละเอียดข้อมูล</h3></th><tr></tr>"));
	
			tc.Controls.Add(new LiteralControl(aa));
			tr.Cells.Add(tc);
			Table1.Rows.Add(tr);
			
			tc.Controls.Add(new LiteralControl(bb));
			tr.Cells.Add(tc);
			Table1.Rows.Add(tr);

			tc.Controls.Add(new LiteralControl(gg));
			tr.Cells.Add(tc);
			Table1.Rows.Add(tr);

			tc.Controls.Add(new LiteralControl(hh));
			tr.Cells.Add(tc);
			Table1.Rows.Add(tr);
			
			tc.Controls.Add(new LiteralControl(cc));
			tr.Cells.Add(tc);
			Table1.Rows.Add(tr);
			
			tc.Controls.Add(new LiteralControl(dd));
			tr.Cells.Add(tc);
			Table1.Rows.Add(tr);
			
			tc.Controls.Add(new LiteralControl(ee));
			tr.Cells.Add(tc);
			Table1.Rows.Add(tr);
			
			tc.Controls.Add(new LiteralControl("<center><table cellSpacing=\"1\" cellPadding=\"1\" border=\"1\"><br><tr><td>Location </td><td>CALL# </td><td>STATUS</td></tr>"));
			tr.Cells.Add(tc);

//===================================================================================================
			if (Show.Tables[0].Rows[0].ItemArray[7].ToString().Trim()== "")
			{
				tc.Controls.Add(new LiteralControl("<tr><td>-</td>" ));
				tr.Cells.Add(tc);
			}
			else
			{
				tc.Controls.Add(new LiteralControl("<tr><td>"+Show.Tables[0].Rows[0].ItemArray[7]+"</td>" ));
				tr.Cells.Add(tc);
			}
			if (Show.Tables[0].Rows[0].ItemArray[8].ToString().Trim()== "")
			{
				tc.Controls.Add(new LiteralControl("<td>-</td>"));
				tr.Cells.Add(tc);
			}
			else
			{
				tc.Controls.Add(new LiteralControl("<td>"+Show.Tables[0].Rows[0].ItemArray[8]+"</td>"));
				tr.Cells.Add(tc);
			}
			if (Show.Tables[0].Rows[0].ItemArray[9].ToString().Trim() == "")
			{
				tc.Controls.Add(new LiteralControl("<td>-</td></tr></table></center>"));
				tr.Cells.Add(tc);
			}
			else 
			{
				tc.Controls.Add(new LiteralControl("<td>"+Show.Tables[0].Rows[0].ItemArray[9]+"</td></tr></table></center>"));
				tr.Cells.Add(tc);
			}
//============================================================================================

			if (Show.Tables[0].Rows[0].ItemArray[6].ToString().Trim() != "")
			{
				tc.Controls.Add(new LiteralControl("</br><center><a href= \"" +Show.Tables[0].Rows[0].ItemArray[6]+"\">ดูรายละเอียดของ วิทยานิพนธ์</a> </center>" ));
				tr.Cells.Add(tc);
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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		public string calname(DataSet Show)
		{
			TableRow r = new TableRow();
			DataTable dt = new DataTable();
			DataTable nt = new DataTable();
			dt = Show.Tables[0];
			string c1 = "";
			string c2 = "";
			string before="";
			string after="";
			c1 = dt.Rows[0].ItemArray[2].ToString();  //position of Title //rows[i]
			for ( int y = 0 ; y< dt.Rows.Count ;y++) 
			{
				after=dt.Rows[y].ItemArray[11].ToString(); //position of Professor name
				if(before!= after)
				{
					before=after;
					c2+=after;
					if(y+1<dt.Rows.Count)
						c2+= ", ";
				}
			}
			return c2;
		}

	}

}