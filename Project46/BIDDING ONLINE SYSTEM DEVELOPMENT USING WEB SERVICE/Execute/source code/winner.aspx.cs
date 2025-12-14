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

namespace project
{
	/// <summary>
	/// Summary description for manage.
	/// </summary>
	public class manage : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid dgshow;
		protected System.Web.UI.WebControls.Label Label16;
		protected System.Web.UI.WebControls.Label Label60;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label28;
		protected System.Web.UI.WebControls.Label Label30;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label32;
		protected System.Web.UI.WebControls.Label Label63;
		protected System.Web.UI.WebControls.Label Label62;
		protected System.Web.UI.WebControls.Label Label27;
		protected System.Web.UI.WebControls.Label Label18;
		protected System.Web.UI.WebControls.Label Label22;
		protected System.Web.UI.WebControls.Label Label23;
		protected System.Web.UI.WebControls.Label Label26;
		protected System.Web.UI.WebControls.Label Label35;
		protected System.Web.UI.WebControls.Label Label37;
		protected System.Web.UI.WebControls.Label Label39;
		protected System.Web.UI.WebControls.Label Label40;
		protected System.Web.UI.WebControls.Label Label43;
		protected System.Web.UI.WebControls.Label Label50;
		protected System.Web.UI.WebControls.Label Label51;
		protected System.Web.UI.WebControls.Label Label54;
		protected System.Web.UI.WebControls.Label Label56;
		protected System.Web.UI.WebControls.Label Label58;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Web.UI.WebControls.Label Label15;
		protected System.Web.UI.WebControls.Label Label61;
		protected System.Web.UI.WebControls.Label Label19;
		protected System.Web.UI.WebControls.Label Label21;
		protected System.Web.UI.WebControls.Label Label20;
		protected System.Web.UI.WebControls.Label Label25;
		protected System.Web.UI.WebControls.Label Label24;
		protected System.Web.UI.WebControls.Label Label36;
		protected System.Web.UI.WebControls.Label Label38;
		protected System.Web.UI.WebControls.Label Label42;
		protected System.Web.UI.WebControls.Label Label44;
		protected System.Web.UI.WebControls.Label Label52;
		protected System.Web.UI.WebControls.Label Label53;
		protected System.Web.UI.WebControls.Label Label55;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.Label Label17;
		protected System.Web.UI.WebControls.Label Label29;
		protected System.Web.UI.WebControls.Label Label31;
		protected System.Web.UI.WebControls.Label Label33;
		protected System.Web.UI.WebControls.Label Label34;
		protected System.Web.UI.WebControls.Label Label41;
		protected System.Web.UI.WebControls.Label Label45;
		protected System.Web.UI.WebControls.Label Label46;
		protected System.Web.UI.WebControls.Label Label47;
		protected System.Web.UI.WebControls.Label Label48;
		protected System.Web.UI.WebControls.Label Label49;
		protected System.Web.UI.WebControls.Label Label57;
		protected System.Web.UI.WebControls.Label Label59;
		protected System.Web.UI.WebControls.Label Label64;
		protected System.Web.UI.WebControls.Label Label65;
		protected System.Web.UI.WebControls.Label Label66;
		protected System.Web.UI.WebControls.Label Label67;
		protected System.Web.UI.WebControls.Label Label68;
		protected System.Web.UI.WebControls.Label Label69;
		protected System.Web.UI.WebControls.Label Label70;
		protected System.Web.UI.WebControls.Label Label71;
		protected System.Web.UI.WebControls.Label Label72;
		protected System.Web.UI.WebControls.Label Label73;
		protected System.Web.UI.WebControls.Label Label74;
		protected System.Web.UI.WebControls.Label Label75;
		protected System.Web.UI.WebControls.Label Label76;
		protected System.Web.UI.WebControls.Label Label77;
		protected System.Web.UI.WebControls.Label Label78;
		protected System.Web.UI.WebControls.Label Label79;
		protected System.Web.UI.WebControls.Label Label80;
		protected System.Web.UI.WebControls.Label Label81;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label82;
		protected System.Web.UI.WebControls.Label Label83;
		protected System.Web.UI.WebControls.Label Label84;
		protected System.Web.UI.WebControls.Label Label85;
		protected System.Web.UI.WebControls.Label Label86;
		protected System.Web.UI.WebControls.Label Label87;
		protected System.Web.UI.WebControls.Label Label88;
		protected System.Web.UI.WebControls.Label Label89;
		protected System.Web.UI.WebControls.LinkButton LinkButton1;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.DataGrid dgCancle;
		protected System.Web.UI.WebControls.Label Label90;
		protected System.Web.UI.WebControls.Label Label1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			if(!Page.IsPostBack)
			{
				BindData();
				sqlconn.Open();
				string str="SELECT* FROM DetailBidding "
					+"WHERE IDBidding= " + Session["idb1"];
				SqlCommand comm0=new SqlCommand(str,sqlconn);
				SqlDataReader dr0=comm0.ExecuteReader();
				dr0.Read();
				Label9.Text=dr0.GetString(2);
				Label12.Text=dr0.GetString(14);
				Label17.Text=dr0.GetInt32(15).ToString();
				Label29.Text=dr0.GetString(16);
				Label31.Text=dr0.GetDateTime(4).ToShortDateString();
				Label33.Text=dr0.GetDateTime(5).ToShortDateString();
				Label34.Text=dr0.GetDateTime(6).ToShortDateString();
				Label41.Text=dr0.GetDateTime(7).ToShortDateString();
				Label45.Text=dr0.GetDateTime(8).ToShortDateString();
				Label46.Text=dr0.GetString(9);
				Label47.Text=dr0.GetDateTime(11).ToShortDateString();
				Label48.Text=dr0.GetDateTime(10).ToShortDateString();
				Label49.Text=dr0.GetString(12);
				Label59.Text=dr0.GetString(13);
				Label79.Text=dr0.GetDateTime(3).ToShortDateString();
				Label80.Text=dr0.GetString(17);
				Label81.Text=dr0.GetString(18);

				dr0.Close();


				string str1="SELECT* FROM SpectBidding "
					+"WHERE IDBidding= " + Session["idb1"];
				SqlCommand comm1=new SqlCommand(str1,sqlconn);
				SqlDataReader dr1=comm1.ExecuteReader();
				dr1.Read();
				Label57.Text=dr1.GetString(6);
				Label64.Text=dr1.GetInt32(2).ToString();
				Label65.Text=dr1.GetInt32(14).ToString();
				Label66.Text=dr1.GetString(11);
				Label67.Text=dr1.GetInt32(15).ToString();
				Label68.Text=dr1.GetInt32(3).ToString();
				Label69.Text=dr1.GetInt32(10).ToString();
				Label70.Text=dr1.GetDouble(12).ToString();
				Label71.Text=dr1.GetString(13);
				Label72.Text=dr1.GetInt32(4).ToString();
				Label73.Text=dr1.GetDouble(5).ToString();
				Label74.Text=dr1.GetInt32(7).ToString();
				Label75.Text=dr1.GetInt32(8).ToString();
				Label76.Text=dr1.GetDouble(9).ToString();
				Label77.Text=dr1.GetString(17);
				Label78.Text=dr1.GetString(18);
				dr1.Close();
				
				
				
				string secret="SELECT* FROM SecretData "
							+"WHERE IDBidding= " + Session["idb1"];
				SqlCommand CommSecret =new SqlCommand(secret,sqlconn);
				SqlDataReader dr3=CommSecret.ExecuteReader();
				dr3.Read();
				Label85.Text=dr3.GetString(1);
				Label86.Text=dr3["Destination"].ToString();
				Label87.Text=dr3["Budget"].ToString();
				Label88.Text=dr3["DetailActivity"].ToString();
				Label89.Text=dr3["Comment"].ToString();
				dr3.Close();

				
				sqlconn.Close();
				
			}


		}
		public void BindData()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
//  คำสั่ง sql คนละแบบแต่ใช้งานได้เหมือนกัน
//			string strsql="SELECT C.Name,S.TotalPrice "
//				+"FROM DetailCompany C,SpectCompany S  "
//				+"WHERE S.IDCompany=C.IDCompany  "
//				+"AND IDBidding=" + Session["idb1"];
			
//string x;
//x=Session["fromz"].ToString();

			string str="SELECT EndSubmit FROM DetailBidding "
				+"WHERE IDBidding= " + Session["idb1"];
			sqlconn.Open();
			SqlCommand comm0=new SqlCommand(str,sqlconn);
			SqlDataReader dr0=comm0.ExecuteReader();
			dr0.Read();

			if(dr0.GetDateTime(0)<System.DateTime.Today)//หมดเวลาการประกวดแล้ว
			{

				Button1.Visible=true;
				sqlconn.Close();
				if(Session["fromz"].ToString()=="1")//Request.QueryString["fromz"]=="1")
				{

					BindWinner();
					dgshow.Visible=true;
					dgshow.Visible=true;
					
				}
				else
				{
					dgCancle.Visible=true;
					string strsql1="SELECT DetailCompany.Name,DetailCompany.IDCompany "
						+"FROM DetailCompany  INNER JOIN SpectCompany  "
						+"ON SpectCompany.IDCompany=DetailCompany.IDCompany  "
						+"AND IDBidding=" + Session["idb1"]
						+"ORDER BY  SpectCompany.TotalPrice" ;
					SqlDataAdapter da1=new SqlDataAdapter(strsql1,sqlconn);
					DataSet ds1=new DataSet();
					da1.Fill(ds1, "Spect2");
					DataView dv1=new DataView(ds1.Tables["Spect2"]);
					dgCancle.DataSource=dv1;
					dgCancle.DataBind();

				}
			}
			else
			{
				sqlconn.Close();
				Label90.Visible=true;
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
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.LinkButton1.Click += new System.EventHandler(this.LinkButton1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void LinkButton1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("main.aspx");
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("Cancle.aspx");
		}
		private void BindWinner()
		{
//			string strconn="server=(local);database=project;uid=sa;password=;";
//			SqlConnection sqlconn=new SqlConnection(strconn);
//			dgshow.Visible=true;
//			Button1.Visible=true;
//			string strsql="SELECT DetailCompany.Name,DetailCompany.IDCompany,SpectCompany.TotalPrice "
//				+"FROM DetailCompany  INNER JOIN SpectCompany  "
//				+"ON SpectCompany.IDCompany=DetailCompany.IDCompany  "
//				+"AND IDBidding=" + Session["idb1"]
//				+"ORDER BY  SpectCompany.TotalPrice" ;
//			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
//			DataSet ds=new DataSet();
//			da.Fill(ds, "Spect1");
//			DataView dv=new DataView(ds.Tables["Spect1"]);
//			dgshow.DataSource=dv;
//			dgshow.DataBind();


			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);

			//clear  in Db
			string strsql5=" DELETE FROM Result "
				+" WHERE bidid>1" ; 
			SqlCommand comm5 = new SqlCommand(strsql5, sqlconn);
			sqlconn.Open();
			comm5.ExecuteNonQuery();
			sqlconn.Close();

			string strsql0 = "select distinct cc.idcompany, [name] "
				+"from comparecompany cc, detailcompany dc "
				+"where IDbidding= " + Session["idb1"]
				+"and cc.idcompany=dc.idcompany ";

			
			SqlDataAdapter da0 = new SqlDataAdapter(strsql0,sqlconn);
			DataSet ds0 = new DataSet();
			da0.Fill(ds0,"Dist");
			
			DataView dv0 = ds0.Tables["Dist"].DefaultView;
			int v = dv0.Count;
			int[,] a = new int[v,3];
			int j = 0;
			int bidid = Convert.ToInt32(Session["idb1"]);

			for (int i =0; i< dv0.Count;i++)
			{
						
				string strsql =
					"select cc.idcompany, s.detail, cc.type, s.number, cc.number  "
					+"from comparecompany cc, spect s "
					+"where cc.IDbidding = s.IDbidding "
					+"and s.detail=cc.detail "
					+"and cc.type =1 "
					+"and cc.number >= s.number "
					+"and s.IDbidding =  " + Session["idb1"]
					+"and cc.idcompany=" + ds0.Tables["Dist"].Rows[i]["idcompany"].ToString()
					//+"--order by cc.idcompany "
					//+"--and cc.idcompany=68 "
					+" UNION ( "
					//+"-- pass spec of -1 "
					+"select cc.idcompany, s.detail, cc.type, s.number, cc.number  "
					+"from comparecompany cc, spect s "
					+"where cc.IDbidding = s.IDbidding "
					+"and s.detail=cc.detail "
					+"and cc.type = -1 "
					+"and cc.number <= s.number "
					+"and s.IDbidding = " + Session["idb1"]
					+"and cc.idcompany="+ ds0.Tables["Dist"].Rows[i]["idcompany"].ToString()
					//+"--order by cc.idcompany "
					+") "
					+" UNION( "
					//+"--pass spec of 0 "
					+"select cc.idcompany, s.detail, cc.type, s.number, cc.number "//--distinct(cc.idcompany) "
					+"from comparecompany cc, spect s "
					+"where cc.IDbidding = s.IDbidding "
					+"and s.detail=cc.detail "
					+"and cc.type = 0 "
					+"and cc.number = s.number "
					+"and s.IDbidding =  " + Session["idb1"]
					+"and cc.idcompany="+ ds0.Tables["Dist"].Rows[i]["idcompany"].ToString()
					//+"--order by cc.idcompany "
					+")";
				//int x, y;
				//				int[][] a;
				//string cx;
				SqlDataAdapter da = new SqlDataAdapter(strsql,sqlconn);
				DataSet ds = new DataSet();
				da.Fill(ds,"Pass");
				DataView dv = ds.Tables["Pass"].DefaultView;
				
				a[i,0]=Convert.ToInt32(ds0.Tables["Dist"].Rows[i]["idcompany"].ToString());
				//Company Name
				a[i,1]=dv.Count;
				//Pass Specs

				string strsql1 = "select * from spect s where s.IDbidding=" + Session["idb1"];
				da.SelectCommand.CommandText=strsql1;
				da.Fill(ds,"SpecCount");
				DataView dv1 = ds.Tables["SpecCount"].DefaultView;
				a[i,2]=dv1.Count;
				//All Specs
				
			//	Label1.Text+=a[i,0] + "," + a[i,1] + "," + a[i,2] + ";" ;
				
				

				if (a[i,1]==a[i,2])
				{
					
					//dg.Items[i].Cells[0].Text= Convert.ToString(i+1);
					//					dg.Items[j].Cells[0].Text=ds0.Tables["Dist"].Rows[i]["idcompany"].ToString();
					//					dg.Items[j].Cells[1].Text=a[i,1].ToString();
					//					dg.Items[j].Cells[2].Text=a[i,2].ToString();


					string strsql2 = "select Totalprice "
						+"from spectcompany "
						+"where idbidding=  " + Session["idb1"]
						+"and idcompany=" + a[i,0];
					da.SelectCommand.CommandText=strsql2;
					da.Fill(ds,"totalprice");

					//					dg.Items[j].Cells[3].Text = ds.Tables["totalprice"].Rows[0]["totalprice"].ToString();
				
					//	j++;	




					string strsql3 = "INSERT INTO Result(companyname, passspecs, totalspecs, totalprice, bidid,idcompany) "
						+ " VALUES(" + "'" +  ds0.Tables["Dist"].Rows[i]["name"].ToString() +"'"
						+ "," + a[i,1]
						+ "," + a[i,2]
						+ "," + ds.Tables["totalprice"].Rows[0]["totalprice"]
						+ "," + bidid
						+ "," + a[i,0]
						+ ")" ;
					SqlCommand sqlcomm = new SqlCommand(strsql3, sqlconn);
					sqlconn.Open();
					sqlcomm.ExecuteNonQuery();
					sqlconn.Close();

					//BIND GRID
					//					string strconn="server=(local);database=project;uid=sa;password=;";
					//					SqlConnection sqlconn=new SqlConnection(strconn);

					
					string strsql4="SELECT * "//r.companyname,r.passspecs,r.totalspecs,r.totalprice,r.bidid,r.idcompany "
						+"FROM Result "
						+"WHERE bidid= " + bidid 
						+" ORDER by totalprice";
					SqlDataAdapter da4=new SqlDataAdapter(strsql4,sqlconn);
					DataSet ds4=new DataSet();
					da4.Fill(ds4, "Result");
					DataView dv4=new DataView(ds4.Tables["Result"]);
					dgshow.DataSource=dv4;
					dgshow.DataBind();
					




								

				}
			
			}		
				
				

			sqlconn.Close();

		
		}

	}
}
