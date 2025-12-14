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
	/// Summary description for technic.
	/// </summary>
	public class technic : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.LinkButton lnkAddNewRow;
		protected System.Web.UI.WebControls.LinkButton lnkmain;
		protected System.Web.UI.WebControls.LinkButton LinkButton1;
		protected System.Web.UI.WebControls.DataGrid dg;

		int small =-1;
		int equal =0;
		protected System.Web.UI.WebControls.DataGrid dg1;
		protected System.Web.UI.WebControls.LinkButton LinkButton2;
		protected System.Web.UI.WebControls.DataGrid dg2;
		int gather =1;

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
			this.dg1.SelectedIndexChanged += new System.EventHandler(this.dg1_SelectedIndexChanged);
			this.lnkmain.Click += new System.EventHandler(this.lnkmain_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void lnkmain_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("index.aspx");
		}

	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			if(!Page.IsPostBack)
			{
//				BindData();
//				BindData1();
				
//				string x;
//				Label1.Text=Request.QueryString["id2"];
//				Label2.Text=Request.QueryString["hide"];
			}
		
		}
		
		
		//----------------this is for first datagrid----------------
		public void BindData()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT * "
				+"FROM Spect "
				+"WHERE IDBidding=" + Session["bidding"] 
				+" AND  Type=" + gather;
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Spect1");
			DataView dv=new DataView(ds.Tables["Spect1"]);
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
			int spectid=0;
			TextBox firstvalue;
			TextBox secondvalue;
			TextBox thirdvalue;
			spectid = (int) dg.DataKeys[e.Item.ItemIndex];
			firstvalue = (TextBox) e.Item.Cells[1].Controls[0];
			secondvalue = (TextBox) e.Item.Cells[2].Controls[0];
			thirdvalue = (TextBox) e.Item.Cells[3].Controls[0];

			

			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="UPDATE Spect SET "
				+"Detail =" + "'" + firstvalue.Text + "'"
				+",Number =" + "'" + secondvalue.Text + "'"//number ='',
				+",Unit =" + "'" + thirdvalue.Text + "'"
				+",Type =" + "'" + gather + "'"
				
				
				+" WHERE IDSpect=" + spectid;
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
			object spectid;
			spectid = (int) dg.DataKeys[e.Item.ItemIndex];
			
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="DELETE FROM Spect WHERE IDSpect=" + spectid;
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
	
		public void DataGrid_AddNewRow(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="INSERT INTO Spect"
				+ "(Detail,IDBidding,Type) "    //valuea('','')
				+ "VALUES('','"+ Session["bidding"] +"','"
				+ gather 
				+  "')";
			SqlCommand sqlcomm=new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm.ExecuteNonQuery();
			sqlconn.Close();
			dg.EditItemIndex = -1;
			BindData();

		}
		

	
		public void DataGrid_Page(object sender, DataGridPageChangedEventArgs e)
		{
			dg.CurrentPageIndex = e.NewPageIndex;
			BindData();
		}
		
		public void DataGrid_Sort(object sender, DataGridSortCommandEventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT * "
				+"FROM Spect";
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Employee1");
			DataView dv=new DataView(ds.Tables["Employee1"]);
			dv.Sort=e.SortExpression;
			dg.DataSource=dv;
			dg.DataBind();
		}


//		//----------------begin to datagrid1----------------
		public void BindData1()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT * "
				+"FROM Spect "
				+"WHERE IDBidding=" + Session["bidding"] 
				+" AND  Type=" + small;
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Spect1");
			DataView dv=new DataView(ds.Tables["Spect1"]);
			dg1.DataSource=dv;
			dg1.DataBind();
		}
		public void DataGrid1_Edit(object sender, DataGridCommandEventArgs e)
		{
			dg1.EditItemIndex = e.Item.ItemIndex;
			BindData1();
		}

		public void DataGrid1_Update(object sender, DataGridCommandEventArgs e)
		{
			int spectid=0;
			TextBox firstvalue;
			TextBox secondvalue;
			TextBox thirdvalue;
			spectid = (int) dg1.DataKeys[e.Item.ItemIndex];
			firstvalue = (TextBox) e.Item.Cells[1].Controls[0];
			secondvalue = (TextBox) e.Item.Cells[2].Controls[0];
			thirdvalue = (TextBox) e.Item.Cells[3].Controls[0];

			

			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="UPDATE Spect SET "
				+"Detail =" + "'" + firstvalue.Text + "'"
				+",Number =" + "'" + secondvalue.Text + "'"//number ='',
				+",Unit =" + "'" + thirdvalue.Text + "'"
				+",Type =" + "'" + small + "'"
				
				
				+" WHERE IDSpect=" + spectid;
			SqlCommand sqlcomm=new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm.ExecuteNonQuery();
			dg1.EditItemIndex = -1;
			BindData1();

		}

		public void DataGrid1_Cancel(object sender, DataGridCommandEventArgs e)
		{
			dg1.EditItemIndex = -1;
			BindData1();
		}

		public void DataGrid1_Delete(object sender, DataGridCommandEventArgs e)
		{
			object spectid;
			spectid = (int) dg1.DataKeys[e.Item.ItemIndex];
			
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="DELETE FROM Spect WHERE IDSpect=" + spectid;
			SqlCommand sqlcomm=new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm.ExecuteNonQuery();
			sqlconn.Close();
			if ((dg1.CurrentPageIndex==dg1.PageCount-1) & (e.Item.ItemIndex==0))//กัน error ลบข้อมูลหมดในหน้าใดหน้าหนึ่ง
			{
				
				if(dg1.PageCount!=1)//กัน error ในกรณีที่ลบข้อมูลจนหมดทุกแถวจะไม่เกิด error
				{
					dg1.CurrentPageIndex--;
				}
			}
			BindData1();			
		}
	
		public void DataGrid1_AddNewRow(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="INSERT INTO Spect"
				+ "(Detail,IDBidding,Type) "    //valuea('','')
				+ "VALUES('','"+ Session["bidding"] + "','"
				+ small
				+  "')";
			SqlCommand sqlcomm=new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm.ExecuteNonQuery();
			sqlconn.Close();
			dg1.EditItemIndex = -1;
			BindData1();

		}
		
		private void lnkAddNewRow_Click(object sender, System.EventArgs e)
		{

		}
	
		public void DataGrid1_Page(object sender, DataGridPageChangedEventArgs e)
		{
			dg1.CurrentPageIndex = e.NewPageIndex;
			BindData1();
		}
		
		public void DataGrid1_Sort(object sender, DataGridSortCommandEventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT * "
				+"FROM Spect";
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Employee1");
			DataView dv=new DataView(ds.Tables["Employee1"]);
			dv.Sort=e.SortExpression;
			dg1.DataSource=dv;
			dg1.DataBind();
		}
		//---------------begin to datagrid 2----------
		public void BindData2()
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT * "
				+"FROM Spect "
				+"WHERE IDBidding=" + Session["bidding"] 
				+" AND  Type=" + equal;
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Spect1");
			DataView dv=new DataView(ds.Tables["Spect1"]);
			dg2.DataSource=dv;
			dg2.DataBind();
		}
		public void DataGrid2_Edit(object sender, DataGridCommandEventArgs e)
		{
			dg2.EditItemIndex = e.Item.ItemIndex;
			BindData2();
		}

		public void DataGrid2_Update(object sender, DataGridCommandEventArgs e)
		{
			int spectid=0;
			TextBox firstvalue;

			spectid = (int) dg2.DataKeys[e.Item.ItemIndex];
			firstvalue = (TextBox) e.Item.Cells[1].Controls[0];


			

			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="UPDATE Spect SET "
				+"Detail =" + "'" + firstvalue.Text + "'"
				+",Type =" + "'" + equal + "'"
				+",Number=" + "'" + 1 + "'"
				
				
				+" WHERE IDSpect=" + spectid;
			SqlCommand sqlcomm=new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm.ExecuteNonQuery();
			dg2.EditItemIndex = -1;
			BindData2();

		}

		public void DataGrid2_Cancel(object sender, DataGridCommandEventArgs e)
		{
			dg2.EditItemIndex = -1;
			BindData2();
		}

		public void DataGrid2_Delete(object sender, DataGridCommandEventArgs e)
		{
			object spectid;
			spectid = (int) dg2.DataKeys[e.Item.ItemIndex];
			
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="DELETE FROM Spect WHERE IDSpect=" + spectid;
			SqlCommand sqlcomm=new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm.ExecuteNonQuery();
			sqlconn.Close();
			if ((dg2.CurrentPageIndex==dg2.PageCount-1) & (e.Item.ItemIndex==0))//กัน error ลบข้อมูลหมดในหน้าใดหน้าหนึ่ง
			{
				
				if(dg2.PageCount!=1)//กัน error ในกรณีที่ลบข้อมูลจนหมดทุกแถวจะไม่เกิด error
				{
					dg2.CurrentPageIndex--;
				}
			}
			BindData2();			
		}
	
		public void DataGrid2_AddNewRow(object sender, System.EventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="INSERT INTO Spect "
				+ "(Detail,IDBidding,Type) "    //valuea('','')
				+ " VALUES('','"+ Session["bidding"] + "','"
				+ equal
				+  "')";
			SqlCommand sqlcomm=new SqlCommand(strsql,sqlconn);
			sqlconn.Open();
			sqlcomm.ExecuteNonQuery();
			sqlconn.Close();
			dg2.EditItemIndex = -1;
			BindData2();

		}
		

	
		public void DataGrid2_Page(object sender, DataGridPageChangedEventArgs e)
		{
			dg2.CurrentPageIndex = e.NewPageIndex;
			BindData2();
		}
		
		public void DataGrid2_Sort(object sender, DataGridSortCommandEventArgs e)
		{
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT * "
				+"FROM Spect";
			SqlDataAdapter da=new SqlDataAdapter(strsql,sqlconn);
			DataSet ds=new DataSet();
			da.Fill(ds, "Employee1");
			DataView dv=new DataView(ds.Tables["Employee1"]);
			dv.Sort=e.SortExpression;
			dg2.DataSource=dv;
			dg2.DataBind();
		}

		private void dg1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}

	





	

	}
}
