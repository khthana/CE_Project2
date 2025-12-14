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
	public class WebForm6 : System.Web.UI.Page
	{
		//1.add this position------------------------------------------------------------
	//	WApplication.localhost1.Service1 KMITL1 = new WApplication.localhost1.Service1();
	//	WApplication.localhost2.Service1 KMITL2 = new WApplication.localhost2.Service1();
	//	WApplication.localhost3.Service1 KMITL3 = new WApplication.localhost3.Service1();
		//-------------------------------------------------------------------------------	

		//==============================================================================
		WApplication.WReference1.Service1 KMITL1 = new WApplication.WReference1.Service1();
		WApplication.WReference2.Service1 KMITL2 = new WApplication.WReference2.Service1();
		WApplication.WReference3.Service1 KMITL3 = new WApplication.WReference3.Service1();


		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
	
		DataSet se = new DataSet();
		string page,search,name,fac,dept,year,temp,kind,uname,uni ,hum;
		protected System.Web.UI.WebControls.DataList DataList_News;
		int temp2;

		//  เเสดงข้อมูลที่ได้จากการค้นหา
		private void Page_Load(object sender, System.EventArgs e)
		{

			WApplication.Components.WebDB webDB = new WApplication.Components.WebDB();
			DataSet newsDS = webDB.GetNews();
			DataList_News.DataSource=newsDS;
			DataList_News.DataBind();
			//รับค่า page ที่ส่งมา 

			page = Request.Params["page"].ToString();
			
			//-------------run on page 1-----------------------------------
			if(page=="1")
			{
				SqlDataAdapter sqlDataAdapter1 = new SqlDataAdapter();
				search = Request.Params["Search"].ToString();  //รับค่า คำที่ต้องการค้นหา มาไว้ใน search
				name = Request.Params["Name"].ToString();	   //รับค่า  key ของมหาลัย
				fac = Request.Params["Fac"].ToString();		   //รับค่า ข้อความภาควิชาที่เลื่อกมาเก็บไว้ใน Fac
				dept = Request.Params["Dept"].ToString();      //รับค่า สาขาที่เลือกที่จะค้นหามาเก็บไว้ใน Dept
				year = Request.Params["Year"].ToString();      //รับค่า ปีของ Thesis มาเก็บไว้ที่ year
				temp = Request.Params["Temp"].ToString();      
				kind = Request.Params["Kind"].ToString();     //เช็คว่า เป็นการหาจาก Thesis หรือ keyword
				temp2 = int.Parse(temp);
				
				//เช็คว่ามีการเลือก มหาลัยหรือไม่
				// เเล้วทำการเซ็ตค่าเริ่มต้น
				//=========================================================
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
					else
					{
						Label2.Visible=true;
						Label2.Text="คณะ "+fac;
					}
					if(dept=="none_set")
						dept="";
					else
					{
						Label3.Visible=true;
						Label3.Text="ภาควิชา "+dept;
					}
					if(year=="none_set")
						year="";
					else
					{
						Label4.Visible=true;
						Label4.Text="ปีการศึกษา "+year;
					}		
				}
			//=======================================================================

			// เช็คว่า search จาก Thesis หรือ keyword
			//================================================================
				if(kind=="ta")
				{
					//เช็คว่ามาจากมหาลัยอะไรเเล้วเรียกให้ตรง service
					switch(name)
					{
						case "KMITL1":
							se = KMITL1.TitleAll(search,fac,dept,year,temp2); 
							uname = KMITL1.Uname(); break;
						case "KMITL2":
							se = KMITL2.TitleAll(search,fac,dept,year,temp2); 
							uname = KMITL2.Uname(); break;
						case "KMITL3":
							se = KMITL3.TitleAll(search,fac,dept,year,temp2);
							uname = KMITL3.Uname(); break;
					}
				}
				else
					if(kind=="ts")
				{
					switch(name)
					{
						case "KMITL1":
							se = KMITL1.TitleSome(search,fac,dept,year,temp2);
							uname = KMITL1.Uname(); break;
						case "KMITL2":
							se = KMITL2.TitleSome(search,fac,dept,year,temp2);
							uname = KMITL2.Uname(); break;
						case "KMITL3":
							se = KMITL3.TitleSome(search,fac,dept,year,temp2);
							uname = KMITL3.Uname(); break;
					}
				}
				else
					if(kind=="ka")
				{
					switch(name)
					{
						case "KMITL1":
							se = KMITL1.KeywordAll(search,fac,dept,year,temp2);
							uname = KMITL1.Uname(); break;
						case "KMITL2":
							se = KMITL2.KeywordAll(search,fac,dept,year,temp2);
							uname = KMITL2.Uname(); break;
						case "KMITL3":
							se = KMITL3.KeywordAll(search,fac,dept,year,temp2);
							uname = KMITL3.Uname(); break;
					}
				}
				else
					if(kind=="ks")
				{
					switch(name)
					{
						case "KMITL1":
							se = KMITL1.KeywordSome(search,fac,dept,year,temp2);
							uname = KMITL1.Uname(); break;
						case "KMITL2":
							se = KMITL2.KeywordSome(search,fac,dept,year,temp2);
							uname = KMITL2.Uname(); break;
						case "KMITL3":
							se = KMITL3.KeywordSome(search,fac,dept,year,temp2);
							uname = KMITL3.Uname(); break;
					}
				}
				//================================================================
				int count = se.Tables[0].Rows.Count; 
				
				//เช็คว่าได้ข้อมูลที่ต้องการหรือไม่ 
				if(count == 0)
				{
					Label1.Text = "ไม่พบข้อมูลที่ต้องการค้นหา";
					Label2.Visible=false;
					Label3.Visible=false;
					Label4.Visible=false;
				}
				else
				{
					Label1.Text=uname;
					DataGrid1.DataSource=a();
					DataGrid1.DataBind();
					DataGrid1.Visible = true;
				}
			}

				//------------------run on page 2---------------------------------
			else if (page =="2")
			{
		//		string university = Request.Params["university"].ToString();
				search = Request.Params["Search"].ToString(); 
				hum = Request.Params["hum"];
				name = Request.Params["Name"];
		//		uni = Request.Params["uni"];
				
				switch(name)
				{
					case "KMITL1":
						se = KMITL1.Name(search,hum); 
						uname = KMITL1.Uname(); break;
					case "KMITL2":
						se = KMITL2.Name(search,hum);
						uname = KMITL2.Uname(); break;
					case "KMITL3":
						se = KMITL3.Name(search,hum);
						uname = KMITL3.Uname(); break;
				}
				if ( se.Tables[0].Rows.Count==0)
				{
					Label1.Text="ไม่พบข้อมูลที่ต้องการ";
				}
				else
				{

					Label1.Text=uname;
					DataGrid1.DataSource=a();
					DataGrid1.DataBind();
					DataGrid1.Visible = true;
				}
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
							se=KMITL1.TitleAll(search,fac,dept,year,temp2);
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
							se=KMITL1.TitleSome(search,fac,dept,year,temp2);
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
							se=KMITL1.KeywordAll(search,fac,dept,year,temp2);
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
							se=KMITL1.KeywordSome(search,fac,dept,year,temp2);
							break;
						case "KMITL2":
							se=KMITL2.KeywordSome(search,fac,dept,year,temp2);
							break;
						case "KMITL3":
							se=KMITL3.KeywordSome(search,fac,dept,year,temp2);
							break;
					}
				}
				hh =2;
				kk = 11;
			}
			if (page =="2")
			{
				switch(uni)
				{
					case "KMITL1":
						se = KMITL1.Name(search,hum);
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
					hh =2;
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
				aa =   "<a href=\"WebForm5.aspx?title=" + c1+"&author="+c3+"&uni="+name+"&hum="+hum+"\">"+c1+"</a>" + " / " + c3;
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
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
			this.DataGrid1.SelectedIndexChanged += new System.EventHandler(this.DataGrid1_SelectedIndexChanged);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGrid1.CurrentPageIndex = e.NewPageIndex;
			DataGrid1.DataSource=a();
			DataGrid1.DataBind();
		}

		private void DataGrid1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}

	



	}
}
