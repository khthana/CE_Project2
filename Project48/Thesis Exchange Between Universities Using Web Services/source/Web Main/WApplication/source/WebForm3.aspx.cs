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
using System.Threading;

namespace WApplication
{
	public class WebForm3 : System.Web.UI.Page
	{
		//----------------------------------------------------------------------------
	//	WApplication.localhost1.Service1 KMITL = new WApplication.localhost1.Service1();
	//	WApplication.localhost2.Service1 KMITL2 = new WApplication.localhost2.Service1();
	//	WApplication.localhost3.Service1 KMITL3 = new WApplication.localhost3.Service1();
		//-------------------------------------------------------------------------------

		//==============================================================================
		WApplication.WReference1.Service1 KMITL = new WApplication.WReference1.Service1();
		WApplication.WReference2.Service1 KMITL2 = new WApplication.WReference2.Service1();
		WApplication.WReference3.Service1 KMITL3 = new WApplication.WReference3.Service1();


		DataSet se =new DataSet();
		DataSet se2 =new DataSet();
		DataSet se3 =new DataSet();
		int count1,count2,count3 = 0;
		string Uni,Uni2,Uni3;
		protected System.Web.UI.WebControls.HyperLink HyperLink1;
		protected System.Web.UI.WebControls.HyperLink HyperLink2;
		protected System.Web.UI.WebControls.HyperLink HyperLink3;
		protected System.Web.UI.WebControls.DataList DataList_News;
		protected System.Web.UI.WebControls.Label Label1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			WApplication.Components.WebDB webDB = new WApplication.Components.WebDB();
			//From Web DB			
			//Get News From Web Database----------------------------------
			DataSet newsDS = webDB.GetNews();
			DataList_News.DataSource=newsDS;
			DataList_News.DataBind();


			string page = Request.Params["page"].ToString();
			string search="",name="",fac="",dept="",year="",temp="",kind="",hum="";
			int temp2=0;
//==================== run on page 1 =========================================
//=============================================================================
			if (page == "1")
			{
				SqlDataAdapter sqlDataAdapter1 = new SqlDataAdapter();
				search = Request.Params["Search"].ToString();
				name = Request.Params["Name"].ToString();
				fac = Request.Params["Fac"].ToString();
				dept = Request.Params["Dept"].ToString();
				year = Request.Params["Year"].ToString();
				temp = Request.Params["Temp"].ToString();
				kind = Request.Params["Kind"].ToString();
				temp2 = int.Parse(temp);

				if(name=="none_set")
				{
					name="";
					fac="";
					dept="";
					year="";
				}
				else
				{
					if(fac=="none_set")
						fac="";
					if(dept=="none_set")
						dept="";
					if(year=="none_set")
						year="";
				}

			//===============search from title==============================
				if(name=="")
				{
					switch(kind)
					{
						case "ta":
							se = KMITL.TitleAll(search,fac,dept,year,temp2);
							se2 = KMITL2.TitleAll(search,fac,dept,year,temp2);
							se3 = KMITL3.TitleAll(search,fac,dept,year,temp2);
							break;

						case "ts":
							se = KMITL.TitleSome(search,fac,dept,year,temp2);
							se2 = KMITL2.TitleSome(search,fac,dept,year,temp2);
							se3 = KMITL3.TitleSome(search,fac,dept,year,temp2);
							break;

						case "ka":
							se = KMITL.KeywordAll(search,fac,dept,year,temp2);
							se2 = KMITL2.KeywordAll(search,fac,dept,year,temp2);
							se3 = KMITL3.KeywordAll(search,fac,dept,year,temp2);
							break;

						case "ks":
							se = KMITL.KeywordSome(search,fac,dept,year,temp2);
							se2 = KMITL2.KeywordSome(search,fac,dept,year,temp2);
							se3 = KMITL3.KeywordSome(search,fac,dept,year,temp2);
							break;
					}
					count1 = a(se);
					count2 = a(se2);
					count3 = a(se3);
			
					Uni = KMITL.Uname();
				}
			/*	else
				{
					switch(kind)
					{
						case "ta":
						switch(name)
						{
							case "KMITL1":
								se = KMITL.TitleAll(search,fac,dept,year,temp2); 
								Uni = KMITL.Uname();break;
							case "KMITL2":
								se = KMITL2.TitleAll(search,fac,dept,year,temp2);
								Uni = KMITL2.Uname();break;
							case "KMITL3":
								se = KMITL3.TitleAll(search,fac,dept,year,temp2);
								Uni = KMITL3.Uname();break;
						}
							break;
							
						case "ts":
						switch(name)
						{
							case "KMITL1":
								se = KMITL.TitleSome(search,fac,dept,year,temp2); 
								Uni = KMITL.Uname();break;
							case "KMITL2":
								se = KMITL2.TitleSome(search,fac,dept,year,temp2);
								Uni = KMITL2.Uname();break;
							case "KMITL3":
								se = KMITL3.TitleSome(search,fac,dept,year,temp2);
								Uni = KMITL3.Uname();break;
						}
							break;

						case "ka":
						switch(name)
						{
							case "KMITL1":
								se = KMITL.KeywordAll(search,fac,dept,year,temp2); 
								Uni = KMITL.Uname();break;
							case "KMITL2":
								se = KMITL2.KeywordAll(search,fac,dept,year,temp2);
								Uni = KMITL2.Uname();break;
							case "KMITL3":
								se = KMITL3.KeywordAll(search,fac,dept,year,temp2);
								Uni = KMITL3.Uname();break;
						}
							break;

						case "ks":
						switch(name)
						{
							case "KMITL1":
								se = KMITL.KeywordSome(search,fac,dept,year,temp2); 
								Uni = KMITL.Uname();break;
							case "KMITL2":
								se = KMITL2.KeywordSome(search,fac,dept,year,temp2);
								Uni = KMITL2.Uname();break;
							case "KMITL3":
								se = KMITL3.KeywordSome(search,fac,dept,year,temp2);
								Uni = KMITL3.Uname();break;
						}
						break;
					}
					count1 = se.Tables[0].Rows.Count;
				}*/
				
			//-------------------------------------------------

				if((count1==0)&&(count2==0)&&(count3==0))
					HyperLink1.Text = "ไม่พบคำที่ต้องการค้นหา";
				else
				{
					if(count1 > 0)
					{
						HyperLink1.Text = Uni;
						HyperLink1.Text += "("+count1+")" ;
						HyperLink1.NavigateUrl = "WebForm4.aspx?university="+Uni+"&Search="+search+"&uni=KMITL1&Fac="+fac+"&Dept="+dept+"&Year="+year+"&Temp="+temp+"&Kind="+kind+"&page=1";
					}
					if(count2 > 0)
					{
						Uni2 = KMITL2.Uname();
						HyperLink2.Visible = true;
						HyperLink2.Text = Uni2;
						HyperLink2.Text += "("+count2+")" ;
						HyperLink2.NavigateUrl = "WebForm4.aspx?university="+Uni2+"&Search="+search+"&uni=KMITL2&Fac="+fac+"&Dept="+dept+"&Year="+year+"&Temp="+temp+"&Kind="+kind+"&page=1";
					}
					if(count3 > 0)
					{
						Uni3 = KMITL3.Uname();
						HyperLink3.Visible = true;
						HyperLink3.Text = Uni3;
						HyperLink3.Text += "("+count3+")" ;
						HyperLink3.NavigateUrl = "WebForm4.aspx?university="+Uni3+"&Search="+search+"&uni=KMITL3&Fac="+fac+"&Dept="+dept+"&Year="+year+"&Temp="+temp+"&Kind="+kind+"&page=1";
					}
				}
			
			}
//==================== run on page 2 =========================================
//=============================================================================
			else if (page == "2")
			{
				//-------------recrive data on page 2 -----------------------
				search = Request.Params["Search"].ToString();
				hum = Request.Params["hum"].ToString();
				fac = Request.Params["Name"].ToString();

				if(fac=="none_set")
					fac="";
			
				if(fac=="")
				{
					se = KMITL.Name(search,hum);
					se2 = KMITL2.Name(search,hum);
					se3 = KMITL3.Name(search,hum);

					count1 = a(se);
					count2 = a(se2);
					count3 = a(se3);
			
					Uni = KMITL.Uname();
				}
			/*	else
				{
					switch(fac)
					{
						case "KMITL1":
							se = KMITL.Name(search,hum);
							Uni = KMITL.Uname();break;
						case "KMITL2":
							se = KMITL2.Name(search,hum);
							Uni = KMITL2.Uname();break;
						case "KMITL3":
							se = KMITL3.Name(search,hum);
							Uni = KMITL3.Uname();break;
					}
					count1 = se.Tables[0].Rows.Count;
				}
			*/
				if((count1==0)&&(count2==0)&&(count3==0))
					HyperLink1.Text = "ไม่พบคำที่ต้องการค้นหา";
				else
				{
					if(count1 > 0)
					{
						HyperLink1.Text = Uni;
						HyperLink1.Text += "("+count1+")" ;
						HyperLink1.NavigateUrl = "WebForm4.aspx?university="+Uni+"&Search="+search+"&hum="+hum+"&Fac="+fac+"&page=2&uni=KMITL1";
						//HyperLink1.NavigateUrl = "WebForm4.aspx?university="+Uni+"&Search="+search+"&Name=KMITL1&Fac="+fac+"&Dept="+dept+"&Year="+year+"&Temp="+temp+"&Kind="+kind;
					}
					if(count2 > 0)
					{
						Uni2 = KMITL2.Uname();
						HyperLink2.Visible = true;
						HyperLink2.Text = Uni2;
						HyperLink2.Text += "("+count2+")" ;
						HyperLink2.NavigateUrl = "WebForm4.aspx?university="+Uni2+"&Search="+search+"&hum="+hum+"&Fac="+fac+"&page=2&uni=KMITL2";
					//	HyperLink2.NavigateUrl = "WebForm4.aspx?university="+Uni2+"&Search="+search+"&Name=KMITL2&Fac="+fac+"&Dept="+dept+"&Year="+year+"&Temp="+temp+"&Kind="+kind;
					}
					if(count3 > 0)
					{
						Uni3 = KMITL3.Uname();
						HyperLink3.Visible = true;
						HyperLink3.Text = Uni3;
						HyperLink3.Text += "("+count3+")" ;
						HyperLink3.NavigateUrl = "WebForm4.aspx?university="+Uni3+"&Search="+search+"&hum="+hum+"&Fac="+fac+"&page=2&uni=KMITL3";
						//HyperLink3.NavigateUrl = "WebForm4.aspx?university="+Uni3+"&Search="+search+"&Name=KMITL3&Fac="+fac+"&Dept="+dept+"&Year="+year+"&Temp="+temp+"&Kind="+kind;
					}
				}	
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
		
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion


		int a( DataSet he)
		{
			int hh= 2, kk=11 ;
			
			
			TableRow r = new TableRow();
			DataTable dt = new DataTable();
			DataTable nt = new DataTable();
			dt = he.Tables[0];
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
			//	string aa,bb;
				//aa =   "<a href=\"WebForm5.aspx?title=" + c1+"&author="+c3+"&uni="+uni+"&hum="+hum+"\">"+c1+"</a>" + " / " + c3;
			//	bb = "<center>" + (ii++) + "</center>";
			//	nt.Rows.Add(new object[]{bb,aa});
				ii++;
				c2 = "";
			}
		//	DataView source = new DataView(nt);
			return ii-1;
		}
	}
}
