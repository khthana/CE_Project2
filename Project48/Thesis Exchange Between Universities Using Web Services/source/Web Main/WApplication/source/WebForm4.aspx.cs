using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


namespace WApplication
{
	public class WebForm4 : System.Web.UI.Page
	{
		//---------------------------------------------------------------------------
	//	WApplication.localhost1.Service1 KMITL = new WApplication.localhost1.Service1();
	//	WApplication.localhost2.Service1 KMITL2 = new WApplication.localhost2.Service1();
	//	WApplication.localhost3.Service1 KMITL3 = new WApplication.localhost3.Service1();
		//------------------------------------------------------------------------------
		//==============================================================================
		WApplication.WReference1.Service1 KMITL = new WApplication.WReference1.Service1();
		WApplication.WReference2.Service1 KMITL2 = new WApplication.WReference2.Service1();
		WApplication.WReference3.Service1 KMITL3 = new WApplication.WReference3.Service1();


		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.Label Label1;
		DataSet se=new DataSet();
		string search="",name="",fac="",dept="",year="",temp="",page="",kind = "",uni = "",hum = "";
		protected System.Web.UI.WebControls.DataList DataList_News;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label2;
		int temp2;

		private void Page_Load(object sender, System.EventArgs e)
		{

			WApplication.Components.WebDB webDB = new WApplication.Components.WebDB();
			DataSet newsDS = webDB.GetNews();
			DataList_News.DataSource=newsDS;
			DataList_News.DataBind();

			 page = Request.Params["page"];

//=============================run on page 1=============================
//======================================================================
			if (page == "1")
			{
				SqlDataAdapter sqlDataAdapter1 = new SqlDataAdapter();
				string university = Request.Params["university"].ToString();
				search = Request.Params["Search"];
				name = Request.Params["Name"];
				fac = Request.Params["Fac"];
				dept = Request.Params["Dept"];
				year = Request.Params["Year"];
				temp = Request.Params["Temp"];
				kind = Request.Params["Kind"];
				uni = Request.Params["uni"];
				temp2 = int.Parse(temp);

				if (kind=="ta")
				{
					switch(uni)
					{
						case "KMITL1":
							se=KMITL.TitleAll(search,fac,dept,year,temp2);
							break;
						case "KMITL2":
							se=KMITL2.TitleAll(search,fac,dept,year,temp2);
							break;
						case "KMITL3":
							se=KMITL3.TitleAll(search,fac,dept,year,temp2);
							break;
					}
				}
				else
					if (kind == "ts")
				{
					switch(uni )
					{
						case "KMITL1":
							se=KMITL.TitleSome(search,fac,dept,year,temp2);
							break;
						case "KMITL2":
							se=KMITL2.TitleSome(search,fac,dept,year,temp2);
							break;
						case "KMITL3":
							se=KMITL3.TitleSome(search,fac,dept,year,temp2);
							break;
					}

				}
				else
					if (kind == "ka")
				{
					switch(uni )
					{
						case "KMITL1":
							se=KMITL.KeywordAll(search,fac,dept,year,temp2);
							break;
						case "KMITL2":
							se=KMITL2.KeywordAll(search,fac,dept,year,temp2);
							break;
						case "KMITL3":
							se=KMITL3.KeywordAll(search,fac,dept,year,temp2);
							break;
					}

				}
				else
					if (kind == "ks")
				{
					switch(uni )
					{
						case "KMITL1":
							se=KMITL.KeywordSome(search,fac,dept,year,temp2);
							break;
						case "KMITL2":
							se=KMITL2.KeywordSome(search,fac,dept,year,temp2);
							break;
						case "KMITL3":
							se=KMITL3.KeywordSome(search,fac,dept,year,temp2);
							break;
					}
				}

				Label1.Text=university;
				if(fac!="")
				{
					Label2.Visible=true;
					Label2.Text="คณะ "+fac;
				}
				if(dept!="")
				{
					Label3.Visible=true;
					Label3.Text="ภาควิชา "+dept;
				}
				if(year!="")
				{
					Label4.Visible=true;
					Label4.Text="ปีการศึกษา "+year;
				}
				DataGrid1.DataSource=a();
				DataGrid1.DataBind();
			}

//========================run on page 2===================================
//===================================================================
			else if (page =="2")
			{
				string university = Request.Params["university"].ToString();
				search = Request.Params["Search"];
				hum = Request.Params["hum"];
				fac = Request.Params["Fac"];
				uni = Request.Params["uni"];
				switch(uni)
				{
					case "KMITL1":
						se = KMITL.Name(search,hum);
						break;
					case "KMITL2":
						se = KMITL2.Name(search,hum);
						break;
					case "KMITL3":
						se = KMITL3.Name(search,hum);
						break;
				}

			//	se = KMITL.Name(search,name);
				Label1.Text=university;
				DataGrid1.DataSource=a();
				DataGrid1.DataBind();
			}
		}

		DataView a()
		{
			int hh= 0, kk=0 ;
			if (page =="1") 
			{
				if (kind=="ta")
				{
					switch(uni)
					{
						case "KMITL1":
							se=KMITL.TitleAll(search,fac,dept,year,temp2);
							break;
						case "KMITL2":
							se=KMITL2.TitleAll(search,fac,dept,year,temp2);
							break;
						case "KMITL3":
							se=KMITL3.TitleAll(search,fac,dept,year,temp2);
							break;
					}
				}
				else
					if (kind == "ts")
				{
					switch(uni )
					{
						case "KMITL1":
							se=KMITL.TitleSome(search,fac,dept,year,temp2);
							break;
						case "KMITL2":
							se=KMITL2.TitleSome(search,fac,dept,year,temp2);
							break;
						case "KMITL3":
							se=KMITL3.TitleSome(search,fac,dept,year,temp2);
							break;
					}

				}
				else
					if (kind == "ka")
				{
					switch(uni )
					{
						case "KMITL1":
							se=KMITL.KeywordAll(search,fac,dept,year,temp2);
							break;
						case "KMITL2":
							se=KMITL2.KeywordAll(search,fac,dept,year,temp2);
							break;
						case "KMITL3":
							se=KMITL3.KeywordAll(search,fac,dept,year,temp2);
							break;
					}

				}
				else
					if (kind == "ks")
				{
					switch(uni )
					{
						case "KMITL1":
							se=KMITL.KeywordSome(search,fac,dept,year,temp2);
							break;
						case "KMITL2":
							se=KMITL2.KeywordSome(search,fac,dept,year,temp2);
							break;
						case "KMITL3":
							se=KMITL3.KeywordSome(search,fac,dept,year,temp2);
							break;
					}
				}
				hh = 2;
				kk = 11;
			}
			if (page =="2")
			{
				switch(uni)
				{
					case "KMITL1":
						se = KMITL.Name(search,hum);
						break;
					case "KMITL2":
						se = KMITL2.Name(search,hum);
						break;
					case "KMITL3":
						se = KMITL3.Name(search,hum);
						break;
				}
				if (hum=="AUTHOR")
				{
					hh = 2;
					kk = 11;
				}
				else
				{
					hh = 2;
					 kk= 11;
				 }

			//	se = KMITL.Name(search,name);
			}

			TableRow r = new TableRow();
			DataTable dt = new DataTable();
			DataTable nt = new DataTable();
			dt = se.Tables[0];
			string c1 = "";
			string c2 = "";
			string c3 = "";
			string before="";
			string after="";
			nt.Columns.Add("<center> อันดับ </center>", typeof(string));
			nt.Columns.Add("<center> ผลการค้นหา </center>", typeof(string));
					
			int n =0;
			int ii= 1;
			for (int i = 0 ; i< dt.Rows.Count ;i++)
			{
				c1 = dt.Rows[i].ItemArray[hh].ToString();
				for ( int y = i ; y<= dt.Rows.Count ;y++)
				{
					if ( y != dt.Rows.Count)
					{
						if (c1 == dt.Rows[y].ItemArray[hh].ToString())
						{
							after=dt.Rows[y].ItemArray[kk].ToString();
							if(before!= after)
							{
								before=after;
								c2+=after;
								c3 = c2;
								c2+= ", ";
							}

						}
						else
						{		
							n = y-1;
							y = dt.Rows.Count;
						}
					}
					else 
					n = y-1;			
				}
				i = n ;
				string aa,bb;
				aa =   "<a href=\"WebForm5.aspx?title=" + c1+"&author="+c3+"&uni="+uni+"&hum="+hum+"\">"+c1+"</a>" + " / " + c3;
				bb = "<center>" + (ii++) + "</center>";
				nt.Rows.Add(new object[]{bb,aa});
				
				c2 = "";
			}
			DataView source = new DataView(nt);
			return source;
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
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged_1);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void DataGrid1_PageIndexChanged_1(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGrid1.CurrentPageIndex = e.NewPageIndex;
			DataGrid1.DataSource=a();
			DataGrid1.DataBind();
		}
	}
}
