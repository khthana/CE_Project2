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
using System.IO;

namespace SocialApp
{
	/// <summary>
	/// Summary description for insert.
	/// </summary>
	public class insert : System.Web.UI.Page
	{	

		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.TextBox TextBox5;
		protected System.Web.UI.WebControls.TextBox TextBox6;
		protected System.Web.UI.WebControls.TextBox TextBox7;
		protected System.Web.UI.WebControls.TextBox TextBox8;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Button Button2;
		protected System.Web.UI.WebControls.Button Button4;
		protected System.Web.UI.WebControls.Button Button5;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		protected System.Data.SqlClient.SqlConnection sqlConnection1;
		protected System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
		protected System.Web.UI.WebControls.TextBox nametxt;
		protected System.Web.UI.WebControls.TextBox surnametxt;
		protected System.Web.UI.WebControls.TextBox cctxt;
		protected System.Web.UI.WebControls.TextBox brancetxt;
		protected SocialApp.DataSet1 dataSet11;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand2;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand2;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand2;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand2;
		protected System.Data.SqlClient.SqlDataAdapter sqlDataAdapter2;
		protected SocialApp.DataSet2 dataSet21;
		protected System.Web.UI.WebControls.TextBox pidtxt;
		private String conStr;
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			sqlDataAdapter2.Fill(dataSet21);
			sqlDataAdapter1.Fill(dataSet11);
			if(!IsPostBack)
			{
				DataGrid1.DataBind();
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
			this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlConnection1 = new System.Data.SqlClient.SqlConnection();
			this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter1 = new System.Data.SqlClient.SqlDataAdapter();
			this.dataSet11 = new SocialApp.DataSet1();
			this.sqlSelectCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter2 = new System.Data.SqlClient.SqlDataAdapter();
			this.dataSet21 = new SocialApp.DataSet2();
			((System.ComponentModel.ISupportInitialize)(this.dataSet11)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.dataSet21)).BeginInit();
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Button2.Click += new System.EventHandler(this.Button2_Click);
			this.Button4.Click += new System.EventHandler(this.Button4_Click);
			this.Button5.Click += new System.EventHandler(this.Button5_Click);
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "SELECT PID, FNAME, LNAME, CC, BRANCH, HMAIN, HNAME, STARTDATE, EXPDATE FROM dbo.S" +
				"SS";
			this.sqlSelectCommand1.Connection = this.sqlConnection1;
			// 
			// sqlConnection1
			// 
			conStr="";
			try
			{
				//String kucoke=Directory.GetCurrentDirectory();
				FileStream aFile=new FileStream(@"C:\Inetpub\configDBSocial.txt",FileMode.Open);
				StreamReader sr=new StreamReader(aFile);
				conStr=sr.ReadToEnd();
				sr.Close();
			}
			catch(IOException ea)
			{
				Console.WriteLine("An IO exception has been thrown!");
				Console.WriteLine(ea.ToString());
			}
			
			this.sqlConnection1.ConnectionString =conStr;

			//			this.sqlConnection1.ConnectionString = "data source=EKOC;initial catalog=datasocial;password=kucoke;persist security info" +
			//				"=True;user id=dbsocial;workstation id=EKOC;packet size=4096";
			// 
			// sqlInsertCommand1
			// 
			this.sqlInsertCommand1.CommandText = @"INSERT INTO dbo.SSS(PID, FNAME, LNAME, CC, BRANCH, HMAIN, HNAME, STARTDATE, EXPDATE) VALUES (@PID, @FNAME, @LNAME, @CC, @BRANCH, @HMAIN, @HNAME, @STARTDATE, @EXPDATE); SELECT PID, FNAME, LNAME, CC, BRANCH, HMAIN, HNAME, STARTDATE, EXPDATE FROM dbo.SSS WHERE (PID = @PID)";
			this.sqlInsertCommand1.Connection = this.sqlConnection1;
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 20, "FNAME"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 30, "LNAME"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CC", System.Data.SqlDbType.VarChar, 2, "CC"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@BRANCH", System.Data.SqlDbType.VarChar, 2, "BRANCH"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HMAIN", System.Data.SqlDbType.VarChar, 7, "HMAIN"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HNAME", System.Data.SqlDbType.VarChar, 25, "HNAME"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@STARTDATE", System.Data.SqlDbType.VarChar, 8, "STARTDATE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@EXPDATE", System.Data.SqlDbType.VarChar, 8, "EXPDATE"));
			// 
			// sqlUpdateCommand1
			// 
			this.sqlUpdateCommand1.CommandText = @"UPDATE dbo.SSS SET PID = @PID, FNAME = @FNAME, LNAME = @LNAME, CC = @CC, BRANCH = @BRANCH, HMAIN = @HMAIN, HNAME = @HNAME, STARTDATE = @STARTDATE, EXPDATE = @EXPDATE WHERE (PID = @Original_PID) AND (BRANCH = @Original_BRANCH OR @Original_BRANCH IS NULL AND BRANCH IS NULL) AND (CC = @Original_CC OR @Original_CC IS NULL AND CC IS NULL) AND (EXPDATE = @Original_EXPDATE OR @Original_EXPDATE IS NULL AND EXPDATE IS NULL) AND (FNAME = @Original_FNAME OR @Original_FNAME IS NULL AND FNAME IS NULL) AND (HMAIN = @Original_HMAIN OR @Original_HMAIN IS NULL AND HMAIN IS NULL) AND (HNAME = @Original_HNAME OR @Original_HNAME IS NULL AND HNAME IS NULL) AND (LNAME = @Original_LNAME OR @Original_LNAME IS NULL AND LNAME IS NULL) AND (STARTDATE = @Original_STARTDATE OR @Original_STARTDATE IS NULL AND STARTDATE IS NULL); SELECT PID, FNAME, LNAME, CC, BRANCH, HMAIN, HNAME, STARTDATE, EXPDATE FROM dbo.SSS WHERE (PID = @PID)";
			this.sqlUpdateCommand1.Connection = this.sqlConnection1;
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 20, "FNAME"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 30, "LNAME"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CC", System.Data.SqlDbType.VarChar, 2, "CC"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@BRANCH", System.Data.SqlDbType.VarChar, 2, "BRANCH"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HMAIN", System.Data.SqlDbType.VarChar, 7, "HMAIN"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HNAME", System.Data.SqlDbType.VarChar, 25, "HNAME"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@STARTDATE", System.Data.SqlDbType.VarChar, 8, "STARTDATE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@EXPDATE", System.Data.SqlDbType.VarChar, 8, "EXPDATE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_BRANCH", System.Data.SqlDbType.VarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "BRANCH", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_CC", System.Data.SqlDbType.VarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "CC", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_EXPDATE", System.Data.SqlDbType.VarChar, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "EXPDATE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FNAME", System.Data.SqlDbType.VarChar, 20, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HMAIN", System.Data.SqlDbType.VarChar, 7, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HNAME", System.Data.SqlDbType.VarChar, 25, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_LNAME", System.Data.SqlDbType.VarChar, 30, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "LNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_STARTDATE", System.Data.SqlDbType.VarChar, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "STARTDATE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand1
			// 
			this.sqlDeleteCommand1.CommandText = @"DELETE FROM dbo.SSS WHERE (PID = @Original_PID) AND (BRANCH = @Original_BRANCH OR @Original_BRANCH IS NULL AND BRANCH IS NULL) AND (CC = @Original_CC OR @Original_CC IS NULL AND CC IS NULL) AND (EXPDATE = @Original_EXPDATE OR @Original_EXPDATE IS NULL AND EXPDATE IS NULL) AND (FNAME = @Original_FNAME OR @Original_FNAME IS NULL AND FNAME IS NULL) AND (HMAIN = @Original_HMAIN OR @Original_HMAIN IS NULL AND HMAIN IS NULL) AND (HNAME = @Original_HNAME OR @Original_HNAME IS NULL AND HNAME IS NULL) AND (LNAME = @Original_LNAME OR @Original_LNAME IS NULL AND LNAME IS NULL) AND (STARTDATE = @Original_STARTDATE OR @Original_STARTDATE IS NULL AND STARTDATE IS NULL)";
			this.sqlDeleteCommand1.Connection = this.sqlConnection1;
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_BRANCH", System.Data.SqlDbType.VarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "BRANCH", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_CC", System.Data.SqlDbType.VarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "CC", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_EXPDATE", System.Data.SqlDbType.VarChar, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "EXPDATE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FNAME", System.Data.SqlDbType.VarChar, 20, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HMAIN", System.Data.SqlDbType.VarChar, 7, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HNAME", System.Data.SqlDbType.VarChar, 25, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_LNAME", System.Data.SqlDbType.VarChar, 30, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "LNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_STARTDATE", System.Data.SqlDbType.VarChar, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "STARTDATE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter1
			// 
			this.sqlDataAdapter1.DeleteCommand = this.sqlDeleteCommand1;
			this.sqlDataAdapter1.InsertCommand = this.sqlInsertCommand1;
			this.sqlDataAdapter1.SelectCommand = this.sqlSelectCommand1;
			this.sqlDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "SSS", new System.Data.Common.DataColumnMapping[] {
																																																			 new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																			 new System.Data.Common.DataColumnMapping("FNAME", "FNAME"),
																																																			 new System.Data.Common.DataColumnMapping("LNAME", "LNAME"),
																																																			 new System.Data.Common.DataColumnMapping("CC", "CC"),
																																																			 new System.Data.Common.DataColumnMapping("BRANCH", "BRANCH"),
																																																			 new System.Data.Common.DataColumnMapping("HMAIN", "HMAIN"),
																																																			 new System.Data.Common.DataColumnMapping("HNAME", "HNAME"),
																																																			 new System.Data.Common.DataColumnMapping("STARTDATE", "STARTDATE"),
																																																			 new System.Data.Common.DataColumnMapping("EXPDATE", "EXPDATE")})});
			this.sqlDataAdapter1.UpdateCommand = this.sqlUpdateCommand1;
			// 
			// dataSet11
			// 
			this.dataSet11.DataSetName = "DataSet1";
			this.dataSet11.Locale = new System.Globalization.CultureInfo("th-TH");
			this.dataSet11.Namespace = "http://www.tempuri.org/DataSet1.xsd";
			// 
			// sqlSelectCommand2
			// 
			this.sqlSelectCommand2.CommandText = "SELECT PID, DATE, COUNTER FROM dbo.UPDATE_SOCIAL";
			this.sqlSelectCommand2.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand2
			// 
			this.sqlInsertCommand2.CommandText = "INSERT INTO dbo.UPDATE_SOCIAL(PID, DATE, COUNTER) VALUES (@PID, @DATE, @COUNTER);" +
				" SELECT PID, DATE, COUNTER FROM dbo.UPDATE_SOCIAL WHERE (DATE = @DATE) AND (PID " +
				"= @PID)";
			this.sqlInsertCommand2.Connection = this.sqlConnection1;
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE", System.Data.SqlDbType.VarChar, 10, "DATE"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COUNTER", System.Data.SqlDbType.Int, 4, "COUNTER"));
			// 
			// sqlUpdateCommand2
			// 
			this.sqlUpdateCommand2.CommandText = @"UPDATE dbo.UPDATE_SOCIAL SET PID = @PID, DATE = @DATE, COUNTER = @COUNTER WHERE (DATE = @Original_DATE) AND (PID = @Original_PID) AND (COUNTER = @Original_COUNTER OR @Original_COUNTER IS NULL AND COUNTER IS NULL); SELECT PID, DATE, COUNTER FROM dbo.UPDATE_SOCIAL WHERE (DATE = @DATE) AND (PID = @PID)";
			this.sqlUpdateCommand2.Connection = this.sqlConnection1;
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE", System.Data.SqlDbType.VarChar, 10, "DATE"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COUNTER", System.Data.SqlDbType.Int, 4, "COUNTER"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COUNTER", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COUNTER", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand2
			// 
			this.sqlDeleteCommand2.CommandText = "DELETE FROM dbo.UPDATE_SOCIAL WHERE (DATE = @Original_DATE) AND (PID = @Original_" +
				"PID) AND (COUNTER = @Original_COUNTER OR @Original_COUNTER IS NULL AND COUNTER I" +
				"S NULL)";
			this.sqlDeleteCommand2.Connection = this.sqlConnection1;
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COUNTER", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COUNTER", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter2
			// 
			this.sqlDataAdapter2.DeleteCommand = this.sqlDeleteCommand2;
			this.sqlDataAdapter2.InsertCommand = this.sqlInsertCommand2;
			this.sqlDataAdapter2.SelectCommand = this.sqlSelectCommand2;
			this.sqlDataAdapter2.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "UPDATE_SOCIAL", new System.Data.Common.DataColumnMapping[] {
																																																					   new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																					   new System.Data.Common.DataColumnMapping("DATE", "DATE"),
																																																					   new System.Data.Common.DataColumnMapping("COUNTER", "COUNTER")})});
			this.sqlDataAdapter2.UpdateCommand = this.sqlUpdateCommand2;
			// 
			// dataSet21
			// 
			this.dataSet21.DataSetName = "DataSet2";
			this.dataSet21.Locale = new System.Globalization.CultureInfo("th-TH");
			this.dataSet21.Namespace = "http://www.tempuri.org/DataSet2.xsd";
			this.Load += new System.EventHandler(this.Page_Load);
			((System.ComponentModel.ISupportInitialize)(this.dataSet11)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.dataSet21)).EndInit();

		}
		#endregion

		private void Button5_Click(object sender, System.EventArgs e)
		{
			if(pidtxt.Text.Length==13)
			{
				/*
				String tmp="SELECT * FROM SSS WHERE PID=\'"+pidtxt.Text+"\'";
				SqlCommand mycmd= new SqlCommand(tmp,sqlConnection1);
				sqlConnection1.Open();
				SqlDataReader myreader=mycmd.ExecuteReader();
				if (myreader.Read())
				*/
				DataTable table1=dataSet11.SSS;
				String sqlstr="pid=\'"+pidtxt.Text+"\'";
				DataRow[] queryRows=table1.Select(sqlstr);
				
				if (queryRows.Length!=0)
				{
					Label10.Text="";
					nametxt.Text=(String)queryRows[0][1];
					surnametxt.Text=(String)queryRows[0][2];
					cctxt.Text=(String)queryRows[0][3];
					brancetxt.Text=(String)queryRows[0][4];
					TextBox5.Text=(String)queryRows[0][5];
					TextBox6.Text=(String)queryRows[0][6];
					TextBox7.Text=(String)queryRows[0][7];
					TextBox8.Text= (String)queryRows[0][8];
				}
				else 
				{
					String temp="ID: ["+ pidtxt.Text + "]  Not Found";
					txtclear();
					Label10.Text=temp;
				}
				
			}
			else
			{
				txtclear();
				Label10.Text="Press Insert PID 13 Charecter";
			}
			
		}
		private void txtclear()
		{
			pidtxt.Text="";
			nametxt.Text="";
			surnametxt.Text="";
			cctxt.Text="";
			brancetxt.Text="";
			TextBox5.Text="";
			TextBox6.Text="";
			TextBox7.Text="";
			TextBox8.Text="";
			Label10.Text="";
		}

		private void Button2_Click(object sender, System.EventArgs e)
		{
			txtclear();

			/*
			String tmp2="";
		


			DateTime time=new DateTime();
			time=DateTime.Today;
			String[] tmp=time.GetDateTimeFormats('d');			
			//foreach (string format in tmp) 
			//{
			//		tmp2=tmp2+"#"+format;
			//}
			//String tmp1=time.ToShortDateString();
			Label10.Text="fuck:"+tmp[4];
			*/
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			DataSet datachange =new DataSet();
			DataTable table1=dataSet11.SSS;
			String sqlstr="pid=\'"+pidtxt.Text+"\'";
			DataRow[] queryRows=table1.Select(sqlstr);
			if (queryRows.Length!=0)
			{//update
					queryRows[0][0]=pidtxt.Text;
					queryRows[0][1]=nametxt.Text;
					queryRows[0][2]=surnametxt.Text;					
					queryRows[0][3]=cctxt.Text;
					queryRows[0][4]=brancetxt.Text;
					queryRows[0][5]=TextBox5.Text;
					queryRows[0][6]=TextBox6.Text;
					queryRows[0][7]=TextBox7.Text;
					queryRows[0][8]=TextBox8.Text;
					datachange=dataSet11.GetChanges(DataRowState.Modified);
					sqlDataAdapter1.Update(datachange,"SSS");
			}
			else
			{//create new rows
				DataRow createRows=table1.NewRow();
				if(pidtxt.Text.Length==13)
				{
					createRows[0]=pidtxt.Text;
					createRows[1]=nametxt.Text;
					createRows[2]=surnametxt.Text;					
					createRows[3]=cctxt.Text;
					createRows[4]=brancetxt.Text;
					createRows[5]=TextBox5.Text;
					createRows[6]=TextBox6.Text;
					createRows[7]=TextBox7.Text;
					createRows[8]=TextBox8.Text;
					table1.Rows.Add(createRows);
					datachange=dataSet11.GetChanges(DataRowState.Added);
					sqlDataAdapter1.Update(datachange,"SSS");

					//foreach (string format in tmp) 
					//{
					//		tmp2=tmp2+"#"+format;
					//}
					//String tmp1=time.ToShortDateString();
					DateTime time=new DateTime();
					time=DateTime.Today;
					String[] tmp3=time.GetDateTimeFormats('d');			


					DataSet datachange2 =new DataSet();
					DataTable table2=dataSet21.UPDATE_SOCIAL;

					String sqlstr2="pid=\'"+pidtxt.Text+"\' AND DATE=\'"+tmp3[3]+"\'";
					DataRow[] queryRowsrep=table2.Select(sqlstr2);
					if(queryRowsrep.Length!=0)
					{
						int x=0;
						queryRowsrep[0][0]=pidtxt.Text;
						queryRowsrep[0][1]=tmp3[3];
						x=(int)queryRowsrep[0][2];
						x=x+1;
						queryRowsrep[0][2]=x;
						datachange2=dataSet21.GetChanges(DataRowState.Modified);
						sqlDataAdapter2.Update(datachange2,"UPDATE_SOCIAL");
					}
					else
					{
						DataRow updateRows=table2.NewRow();
						updateRows[0]=pidtxt.Text;
						updateRows[1]=tmp3[3];
						updateRows[2]=0;
						table2.Rows.Add(updateRows);
						datachange2=dataSet21.GetChanges(DataRowState.Added);
						sqlDataAdapter2.Update(datachange2,"UPDATE_SOCIAL");
					}					
				}
			}
			Page.DataBind();

		}
		private void Button4_Click(object sender, System.EventArgs e)
		{
			DataSet datachange =new DataSet();
			DataTable table1=dataSet11.SSS;
			String sqlstr="pid=\'"+pidtxt.Text+"\'";
			DataRow[] queryRows=table1.Select(sqlstr);
			if (queryRows.Length!=0)
			{//delete
				queryRows[0].Delete();
				datachange=dataSet11.GetChanges(DataRowState.Deleted);
				sqlDataAdapter1.Update(datachange,"SSS");
				Label10.Text="Success";
			}
			else{Label10.Text="Not Found";}
			Page.DataBind();
		}
	}
}
