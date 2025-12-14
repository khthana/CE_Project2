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
using System.Text;

namespace project
{
	/// <summary>
	/// Summary description for _4.
	/// </summary>
	public class _4 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox TextBox10;
		protected System.Web.UI.WebControls.TextBox TextBox12;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Web.UI.WebControls.Label Label15;
		protected System.Web.UI.WebControls.TextBox TextBox13;
		protected System.Web.UI.WebControls.LinkButton lnkcontact;
		protected System.Web.UI.WebControls.LinkButton lnkhome;
		protected System.Web.UI.WebControls.TextBox TextBox3;
		protected System.Web.UI.WebControls.TextBox TextBox5;
		protected System.Web.UI.WebControls.TextBox TextBox9;
		protected System.Web.UI.WebControls.TextBox TextBox15;
		protected System.Web.UI.WebControls.TextBox TextBox16;
		protected System.Web.UI.WebControls.Label Label16;
		protected System.Web.UI.WebControls.Label Label17;
		protected System.Web.UI.WebControls.Label Label18;
		protected System.Web.UI.WebControls.Calendar Calendar1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.TextBox TextBox17;
		protected System.Web.UI.WebControls.Label Label19;
		protected System.Web.UI.WebControls.TextBox TextBox18;
		protected System.Web.UI.WebControls.Label Label20;
		protected System.Web.UI.WebControls.DataGrid dg1;
		protected System.Web.UI.WebControls.DataGrid dg2;
		protected System.Web.UI.WebControls.Label Label1;

		int small=-1;
		int equal=0;
		protected System.Web.UI.WebControls.Label txtName;
		protected System.Web.UI.WebControls.Label txtAddress;
		protected System.Web.UI.WebControls.DataGrid dg3;
		protected System.Web.UI.WebControls.Label txtTelephone;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.Label Label21;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator3;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator4;
		protected System.Web.UI.WebControls.Calendar nonVisible;
		protected System.Web.UI.WebControls.Label Label22;
		protected System.Web.UI.WebControls.DataGrid dg;
		protected System.Web.UI.WebControls.Button Button1;
		int gather=1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here

			

			


			// bind detail of Company-----------

			if(!Page.IsPostBack)
			{
				BindData();
				Initial();
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
			this.lnkhome.Click += new System.EventHandler(this.lnkhome_Click);
			this.lnkcontact.Click += new System.EventHandler(this.lnkcontact_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
		private void Initial()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			
			string strsql="SELECT *"
				+"FROM DetailOffice "
				+"WHERE IDPlace=" + Session["idp1"];
			
			string strsql2="SELECT *"
				+"FROM DetailBidding "
				+"WHERE IDBidding=" + Session["idb1"];

			string strsql3="SELECT *"
				+"FROM SpectBidding "
				+"WHERE IDBidding=" + Session["idb1"];




			string strsql9="SELECT * "
				+ "FROM Spect "
				+ "WHERE IDBidding=" +Session["idb1"]
				+ "AND Type= " +gather ;
			string strsql10="SELECT * "
				+ "FROM Spect "
				+ "WHERE IDBidding=" +Session["idb1"]
				+ "AND Type= " + small ;
			string strsql11="SELECT * "
				+ "FROM Spect "
				+ "WHERE IDBidding=" +Session["idb1"]
				+ "AND Type= " +equal ;



			sqlconn.Open();
			SqlCommand sqlcomm = new SqlCommand(strsql,sqlconn);
			SqlDataReader dr=sqlcomm.ExecuteReader();
			dr.Read();
			Label15.Text=dr.GetString(2);
			Label13.Text=dr.GetString(2);
			Label8.Text=dr.GetString(2);
			Label9.Text=dr.GetString(2);
			Label10.Text=dr.GetString(2);
			Label4.Text=dr.GetString(2);
			Label5.Text=dr.GetString(2);
			Label6.Text=dr.GetString(2);
			Label7.Text=dr.GetString(2);
			dr.Close();

			
			
			SqlCommand sqlcomm2 = new SqlCommand(strsql2,sqlconn);
			SqlDataReader dr2=sqlcomm2.ExecuteReader();
			dr2.Read();
			Label1.Text=dr2.GetString(2);
			Label18.Text=dr2.GetInt32(15).ToString();
			Label16.Text=dr2.GetString(14);
			Label17.Text=dr2.GetString(19);
			dr2.Close();



			SqlCommand sqlcomm3 = new SqlCommand(strsql3,sqlconn);
			SqlDataReader dr3=sqlcomm3.ExecuteReader();
			dr3.Read();
			Label14.Text=dr3.GetInt32(10).ToString();
			Label12.Text=dr3.GetDouble(12).ToString();
			dr3.Close();
			
			//bind data to samll equal gather---------
			SqlDataAdapter da3=new SqlDataAdapter(strsql9,sqlconn);
			DataSet ds3=new DataSet();
			da3.Fill(ds3, "Employee3");
			DataView dv3=new DataView(ds3.Tables["Employee3"]);
			dg3.DataSource=dv3;
			dg3.DataBind();

			SqlDataAdapter da1=new SqlDataAdapter(strsql10,sqlconn);
			DataSet ds1=new DataSet();
			da1.Fill(ds1, "Employee1");
			DataView dv1=new DataView(ds1.Tables["Employee1"]);
			dg1.DataSource=dv1;
			dg1.DataBind();

			SqlDataAdapter da2=new SqlDataAdapter(strsql11,sqlconn);
			DataSet ds2=new DataSet();
			da2.Fill(ds2, "Employee2");
			DataView dv2=new DataView(ds2.Tables["Employee2"]);
			dg2.DataSource=dv2;
			dg2.DataBind();
			


			//			TextBox3.Text="100"; 
			//			TextBox5.Text="3"; 
			//			TextBox9.Text="300"; 
			//			TextBox13.Text="สามร้อยบาทถ้วน"; 
			//			TextBox15.Text="asus"; 
			//			TextBox16.Text="low weight"; 
			//			TextBox17.Text="asus company"; 
			//			TextBox18.Text="เกาหลี"; 
			//			TextBox12.Text="วิทวัส"; 
			//			TextBox10.Text="ฝ่ายขาย"; 
			string strsql4="SELECT Name,Address,Telephone "
				+"FROM DetailCompany "
				+"WHERE IDCompany= " +Session["iduser"] ;

			SqlCommand sqlcomm4 = new SqlCommand(strsql4,sqlconn);
			SqlDataReader dr4=sqlcomm4.ExecuteReader();
			dr4.Read();
			txtName.Text=dr4.GetString(0);
			txtAddress.Text=dr4.GetString(1);
			txtTelephone.Text=dr4.GetString(2);
			dr4.Close();

			sqlconn.Close();

		}

		private void lnkcontact_Click(object sender, System.EventArgs e)
		{
			if(Convert.ToString(nonVisible.SelectedDate)==Convert.ToString(Calendar1.SelectedDate))
			{
				Label22.Visible=true;
			}
			else
			{
				InsertDetail();
				InsertGather();
				InsertMinus();
				InsertEqual();
			}

		}
		//====================================================
		private void InsertDetail()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);




			sqlconn.Open();
			string strsql5_0 = "SELECT max(IDCompany) FROM DetailCompany ";
			SqlCommand sqlcomm5_0 = new SqlCommand(strsql5_0,sqlconn);
			string maxid = sqlcomm5_0.ExecuteScalar().ToString();
			
			
			
			string strsql6="INSERT INTO SpectCompany "
				+"(IDBidding,IDCompany,PricePerUnit,Unit,TotalPrice, "
				+"TotalPriceLetter,DayBidding,DaySentProduct,"
				+"Brand,Pattern,Producter,CountryProducter,"
				+"Name,Possition )"
				+"VALUES(" + Session["idb1"] + ","
				//+ maxid + "','"
				+ Session["iduser"] +",'"
				+TextBox3.Text + "','"
				+ TextBox5.Text + "','" 
				+ TextBox9.Text + "','" 
				+ TextBox13.Text + "','"
				+ System.DateTime.Now +"','"
				+ Calendar1.SelectedDate.ToShortDateString() +  "','"
				+ TextBox15.Text + "','"
				+ TextBox16.Text + "','"
				+ TextBox17.Text + "','"
				+ TextBox18.Text + "','"
				+ TextBox12.Text + "','"
				+ TextBox10.Text +"')";

	
			SqlCommand sqlcomm6 = new SqlCommand(strsql6,sqlconn);
			sqlcomm6.ExecuteNonQuery();
			sqlconn.Close();

			///////---------------------------begin to insert data bidding---------

			//
			//			int spectid=0;
			//			TextBox firstvalue;
			//			dg3.CurrentPageIndex = e.NewPageIndex;
			//			dg3.EditItemIndex = e.Item.ItemIndex;
			//			spectid = (int) dg3.DataKeys[e.Item.ItemIndex];
			//			firstvalue = (TextBox) e.Item.Cells[3].Controls[0];
			//
			//
			//			
			//
			//
			//			string strsql10="INSERT INTO CompareCompany  "
			//							+"(IDCompany,IDBidding,Detail,Type) "
			//							+ "Values(" + Session["iduser"] + ","
			//							+ Session["idb1"] + ",'"
			//							+ firstvalue.Text + "','"
			//							+ gather 
			//							+ "')";
			//
			//			
			//				
			//				
			//				
			//			SqlCommand sqlcomm10=new SqlCommand(strsql10,sqlconn);
			//
			//			sqlcomm10.ExecuteNonQuery();
			//			sqlconn.Close();
			//			dg3.EditItemIndex = -1;
			//			BindData();

			

			/////-----------------------------end to insert databidding----------
			//Response.Redirect("SubmitCompany.aspx?idcom=" + maxid);
			

			StringBuilder msg = new StringBuilder();
			msg.Append("<script>\r\n");
			msg.Append("alert(\"ข้อมูลของท่านได้ถูกเก็บไว้เรียบร้อยแล้ว  !\");\r\n");
			msg.Append("window.location.href='index.aspx';\r\n");
			msg.Append("</script>\r\n");
			this.RegisterClientScriptBlock("clientScript",msg.ToString());	
		}
		//====================================================
		private void InsertGather()
		{


			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			//DataGridColumn
			int x;
			
	

			string strsql1="SELECT * FROM Spect "
				+"WHERE IDBidding=" + Session["idb1"] 
				+"AND Type=1";
				//+"ORDER BY Detail";
			SqlDataAdapter da2=new SqlDataAdapter(strsql1,sqlconn);
			DataSet ds2=new DataSet();
			da2.Fill(ds2, "Employee2");
			DataView dv2=new DataView(ds2.Tables["Employee2"]);
			x=dv2.Count;
			

			sqlconn.Open();
			SqlCommand comm0=new SqlCommand(strsql1,sqlconn);
			SqlDataReader dr1=comm0.ExecuteReader();

			



			
			
		
			int[] dd=new int[x];
			
			string[] buffer1=new String[x];
			string[] buffer2=new String[x];
			int b=0;	
			TextBox t=new TextBox();
			//split data from textbox to array
			for(int i=0;i<x;i++)
			{
				t= (TextBox) dg3.Items[i].Cells[3].FindControl("Gather");
				dd[i]=Convert.ToInt32(t.Text);
			}
			//copy Detail and Unit to new table
			while(dr1.Read())
			{
				buffer1[b]=dr1["Detail"].ToString();
				buffer2[b]=dr1["Unit"].ToString();
				b++;
			}


			//write data to data base	
			for(int i=0;i<x;i++)
			{
				string SpectReturn="INSERT INTO CompareCompany "
					+"(IDCompany,IDBidding,Detail,Number,Unit,Type) "
					+"VALUES(" + Session["iduser"] +","
					+ Session["idb1"] + ",'"
					+ buffer1[i] + "','"
					+dd[i] +"','"
					+buffer2[i] + "','"
					+ 1 +"')";
		
				sqlconn.Close();
				sqlconn.Open();
				SqlCommand com =new SqlCommand(SpectReturn,sqlconn);
				com.ExecuteNonQuery();
								
			}
			sqlconn.Close();

		}
		//==================================================
		private void InsertMinus()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			//DataGridColumn
			int x;
			
	

			string strsql1="SELECT * FROM Spect "
				+"WHERE IDBidding=" + Session["idb1"]
				+"AND Type=-1";
				//+"ORDER BY Detail";
			SqlDataAdapter da2=new SqlDataAdapter(strsql1,sqlconn);
			DataSet ds2=new DataSet();
			da2.Fill(ds2, "Employee2");
			DataView dv2=new DataView(ds2.Tables["Employee2"]);
			x=dv2.Count;
			

			sqlconn.Open();
			SqlCommand comm0=new SqlCommand(strsql1,sqlconn);
			SqlDataReader dr1=comm0.ExecuteReader();

			



			
			
		
			int[] dd=new int[x];
			
			string[] buffer1=new String[x];
			string[] buffer2=new String[x];
			int b=0;	
			TextBox t=new TextBox();
			//split data from textbox to array
			for(int i=0;i<x;i++)
			{
				t= (TextBox) dg1.Items[i].Cells[3].FindControl("Minus");
				dd[i]=Convert.ToInt32(t.Text);
			}
			//copy Detail and Unit to new table
			while(dr1.Read())
			{
				buffer1[b]=dr1["Detail"].ToString();
				buffer2[b]=dr1["Unit"].ToString();
				b++;
			}


			//write data to data base	
			for(int i=0;i<x;i++)
			{
				string SpectReturn="INSERT INTO CompareCompany "
					+"(IDCompany,IDBidding,Detail,Number,Unit,Type) "
					+"VALUES(" + Session["iduser"] +","
					+ Session["idb1"] +",'"
					+ buffer1[i] + "','"
					+dd[i] +"','"
					+buffer2[i] + "','"
					+ -1 +"')";
		
				sqlconn.Close();
				sqlconn.Open();
				SqlCommand com =new SqlCommand(SpectReturn,sqlconn);
				com.ExecuteNonQuery();
								
			}
			sqlconn.Close();

		}
		//====================================================
		private void InsertEqual()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
		
			int x;
			
	

			string strsql3="SELECT * FROM Spect "
				+"WHERE IDBidding=" +Session["idb1"]
				+"AND Type=0";
				//+"ORDER BY Detail";
			SqlDataAdapter da3=new SqlDataAdapter(strsql3,sqlconn);
			DataSet ds3=new DataSet();
			da3.Fill(ds3, "Employee3");
			DataView dv3=new DataView(ds3.Tables["Employee3"]);
			x=dv3.Count;


			sqlconn.Open();
			SqlCommand comChk=new SqlCommand(strsql3,sqlconn);
			SqlDataReader dr3=comChk.ExecuteReader();

			

			//collect Check		
			int[] check=new int[x];
			CheckBox c=new CheckBox();
			for(int j=0;j<x;j++)
			{
				c=(CheckBox) dg2.Items[j].Cells[1].FindControl("Equal");
				check[j]=Convert.ToInt32(c.Checked);
			}
		

			int b=0;
			string[] buffer1=new string[x];
			while(dr3.Read())
			{
				buffer1[b]=dr3["Detail"].ToString();
				b++;
			}
			sqlconn.Close();
			for(int i=0;i<x;i++)
			{
				string writeCheck="INSERT INTO CompareCompany "
					+"(IDCompany,IDBidding,Detail,Number,Type) "
					+"VALUES(" + Session["iduser"] + "," 
					+ Session["idb1"] + ",'"
					+ buffer1[i] +"','"
					+ check[i] + "','"
					+ 0 + "')";
				sqlconn.Open();
				SqlCommand comInsert =new SqlCommand(writeCheck,sqlconn);
				comInsert.ExecuteNonQuery();
				sqlconn.Close();

			}

		}




		//========================================================


		private void lnkhome_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("index.aspx");
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			
		}
		// begin to insert dg of authentity--------
		public void BindData()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT *  "
				+"FROM Authority "
				+"WHERE IDCompany= " +Session["iduser"]
				+ " AND IDBidding= " + Session["idb1"];
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Employee1");
			DataView dv=new DataView(ds.Tables["Employee1"]);
			dg.DataSource=dv;
			dg.DataBind();
		}

		public void DataGrid_Edit(object sender, DataGridCommandEventArgs e)
		{
			dg.EditItemIndex = e.Item.ItemIndex;
			BindData();
		}

		public void DataGrid_Update(object sender, DataGridCommandEventArgs e)
		{
			int employeeid=0;
			TextBox firstname;
			TextBox lastname;

			employeeid = (int) dg.DataKeys[e.Item.ItemIndex];
			firstname = (TextBox) e.Item.Cells[1].Controls[0];
			lastname = (TextBox) e.Item.Cells[2].Controls[0];

			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="UPDATE Authority SET "
				+"NameDocument =" + "'" + firstname.Text+ "'"
				+",IDDocument =" + "'" + lastname.Text +"'" 
				+" WHERE IDAuthority=" + employeeid;
			SqlCommand sqlcomm=new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm.ExecuteNonQuery();
			dg.EditItemIndex = -1;
			BindData();

		}

		public void DataGrid_Cancel(object sender, DataGridCommandEventArgs e)
		{
			dg.EditItemIndex = -1;
			BindData();
		}

		public void DataGrid_Delete(object sender, DataGridCommandEventArgs e)

		
		
		
		
		{
			object authorityid;
			authorityid = (int) dg.DataKeys[e.Item.ItemIndex];
			
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="DELETE FROM Authority WHERE IDAuthority=" + authorityid;
			SqlCommand sqlcomm=new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm.ExecuteNonQuery();
			sqlconn.Close();
			if ((dg.CurrentPageIndex==dg.PageCount-1) & (e.Item.ItemIndex==0))//กัน error ลบข้อมูลหมดในหน้าใดหน้าหนึ่ง
				{
				
					if(dg.PageCount!=1)//กัน error ในกรณีที่ลบข้อมูลจนหมดทุกแถวจะไม่เกิด error
						{
							dg.CurrentPageIndex--;
						}
				}
			BindData();
		}

		public void DataGrid_Sort(object sender, DataGridSortCommandEventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT * "
				+"FROM Authority";
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Employee1");
			DataView dv=new DataView(ds.Tables["Employee1"]);
			dv.Sort=e.SortExpression;
			dg.DataSource=dv;
			dg.DataBind();
		}

		public void DataGrid_Page(object sender, DataGridPageChangedEventArgs e)
		{
			dg.CurrentPageIndex = e.NewPageIndex;
			BindData();
		}

		public void DataGrid_AddNewRow(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="INSERT INTO Authority"
				+ "(IDCompany,NameDocument,IDDocument,IDBidding) "    //valuea('','')
				+ "VALUES(" + Session["iduser"] +",'','',"
				
				+ Session["idb1"]
				   
				+  ")";
			SqlCommand sqlcomm=new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm.ExecuteNonQuery();
			sqlconn.Close();
			dg.EditItemIndex = -1;
			BindData();
		}

	}
}
