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
using System.IO;

namespace PeopleApp
{
	/// <summary>
	/// Summary description for WebForm1.
	/// </summary>
	public class WebForm1 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label IDLabel;
		protected System.Web.UI.WebControls.TextBox IDTextBox;
		protected System.Web.UI.WebControls.Label FnameLabel;
		protected System.Web.UI.WebControls.TextBox FnameTextBox;
		protected System.Web.UI.WebControls.Label TitleLabel;
		protected System.Web.UI.WebControls.TextBox TitleTextBox;
		protected System.Web.UI.WebControls.Label LnameLabel;
		protected System.Web.UI.WebControls.TextBox LnameTextBox;
		protected System.Web.UI.WebControls.Label SexLabel;
		protected System.Web.UI.WebControls.TextBox SexTextBox;
		protected System.Web.UI.WebControls.Label DobLabel;
		protected System.Web.UI.WebControls.TextBox DobTextBox;
		protected System.Web.UI.WebControls.Label POP_STLabel;
		protected System.Web.UI.WebControls.TextBox POP_STTextBox;
		protected System.Web.UI.WebControls.Label HidLabel;
		protected System.Web.UI.WebControls.TextBox HidTextBox;
		protected System.Web.UI.WebControls.Label HnoLabel;
		protected System.Web.UI.WebControls.TextBox HnoTextBox;
		protected System.Web.UI.WebControls.Label TrokLabel;
		protected System.Web.UI.WebControls.TextBox TrokTextBox;
		protected System.Web.UI.WebControls.Label SoiLabel;
		protected System.Web.UI.WebControls.TextBox SoiTextBox;
		protected System.Web.UI.WebControls.Label ThanonLabel;
		protected System.Web.UI.WebControls.TextBox ThanonTextBox;
		protected System.Web.UI.WebControls.Label CCAATTMMLabel;
		protected System.Web.UI.WebControls.TextBox CCAATTMMTextBox;
		protected System.Web.UI.WebControls.Label CCAA_OLDLabel;
		protected System.Web.UI.WebControls.TextBox CCAA_OLDTextBox;
		protected System.Web.UI.WebControls.Button ClearButton;
		protected System.Web.UI.WebControls.Button DeleteButton;
		protected System.Web.UI.WebControls.Button SearchButton;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand2;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand2;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand2;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand2;
		protected System.Data.SqlClient.SqlConnection sqlConnection1;
		protected System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
		protected PeopleApp.DataSet1 dataSet11;
		protected PeopleApp.DataSet2 dataSet21;
		protected System.Web.UI.WebControls.Label FoundLabel;
		protected System.Web.UI.WebControls.Button SaveButton;
		protected System.Web.UI.WebControls.HyperLink HyperLink1;
		protected System.Data.SqlClient.SqlDataAdapter sqlDataAdapter2;
		private String conStr;
		
		
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
            sqlDataAdapter1.Fill(dataSet11);
			sqlDataAdapter2.Fill(dataSet21);
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
			this.sqlSelectCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter1 = new System.Data.SqlClient.SqlDataAdapter();
			this.sqlDataAdapter2 = new System.Data.SqlClient.SqlDataAdapter();
			this.dataSet11 = new PeopleApp.DataSet1();
			this.dataSet21 = new PeopleApp.DataSet2();
			((System.ComponentModel.ISupportInitialize)(this.dataSet11)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.dataSet21)).BeginInit();
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "SELECT PID, TITLE, FNAME, LNAME, SEX, DOB, POP_ST, HID, HNO, TROK, SOI, THANON, C" +
				"CAATTMM, CCAA_OLD FROM dbo.OUT_ERR2ALL";
			this.sqlSelectCommand1.Connection = this.sqlConnection1;
			// 
			// sqlConnection1
			// 
			conStr="";
			try
			{
				//String kucoke=Directory.GetCurrentDirectory();
				FileStream aFile=new FileStream(@"C:\Inetpub\configDBPeople.txt",FileMode.Open);
				StreamReader sr=new StreamReader(aFile);
				conStr=sr.ReadToEnd();
				sr.Close();
			}
			catch(IOException ea)
			{
				Console.WriteLine("An IO exception has been thrown!");
				Console.WriteLine(ea.ToString());
			}
			this.sqlConnection1.ConnectionString = conStr;
			//			this.sqlConnection1.ConnectionString = "data source=EKOC;initial catalog=datapeople;password=pomme;persist security info=" +
			//				"True;user id=dbpeople;workstation id=EKOC;packet size=4096";
			// 
			// sqlInsertCommand1
			// 
			this.sqlInsertCommand1.CommandText = @"INSERT INTO dbo.OUT_ERR2ALL(PID, TITLE, FNAME, LNAME, SEX, DOB, POP_ST, HID, HNO, TROK, SOI, THANON, CCAATTMM, CCAA_OLD) VALUES (@PID, @TITLE, @FNAME, @LNAME, @SEX, @DOB, @POP_ST, @HID, @HNO, @TROK, @SOI, @THANON, @CCAATTMM, @CCAA_OLD); SELECT PID, TITLE, FNAME, LNAME, SEX, DOB, POP_ST, HID, HNO, TROK, SOI, THANON, CCAATTMM, CCAA_OLD FROM dbo.OUT_ERR2ALL WHERE (PID = @PID)";
			this.sqlInsertCommand1.Connection = this.sqlConnection1;
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TITLE", System.Data.SqlDbType.VarChar, 3, "TITLE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 24, "FNAME"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 24, "LNAME"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SEX", System.Data.SqlDbType.VarChar, 1, "SEX"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DOB", System.Data.SqlDbType.VarChar, 8, "DOB"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@POP_ST", System.Data.SqlDbType.VarChar, 1, "POP_ST"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HID", System.Data.SqlDbType.VarChar, 11, "HID"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HNO", System.Data.SqlDbType.VarChar, 16, "HNO"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TROK", System.Data.SqlDbType.VarChar, 4, "TROK"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SOI", System.Data.SqlDbType.VarChar, 4, "SOI"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@THANON", System.Data.SqlDbType.VarChar, 4, "THANON"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CCAATTMM", System.Data.SqlDbType.VarChar, 8, "CCAATTMM"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CCAA_OLD", System.Data.SqlDbType.VarChar, 4, "CCAA_OLD"));
			// 
			// sqlUpdateCommand1
			// 
			this.sqlUpdateCommand1.CommandText = @"UPDATE dbo.OUT_ERR2ALL SET PID = @PID, TITLE = @TITLE, FNAME = @FNAME, LNAME = @LNAME, SEX = @SEX, DOB = @DOB, POP_ST = @POP_ST, HID = @HID, HNO = @HNO, TROK = @TROK, SOI = @SOI, THANON = @THANON, CCAATTMM = @CCAATTMM, CCAA_OLD = @CCAA_OLD WHERE (PID = @Original_PID) AND (CCAATTMM = @Original_CCAATTMM OR @Original_CCAATTMM IS NULL AND CCAATTMM IS NULL) AND (CCAA_OLD = @Original_CCAA_OLD OR @Original_CCAA_OLD IS NULL AND CCAA_OLD IS NULL) AND (DOB = @Original_DOB OR @Original_DOB IS NULL AND DOB IS NULL) AND (FNAME = @Original_FNAME OR @Original_FNAME IS NULL AND FNAME IS NULL) AND (HID = @Original_HID OR @Original_HID IS NULL AND HID IS NULL) AND (HNO = @Original_HNO OR @Original_HNO IS NULL AND HNO IS NULL) AND (LNAME = @Original_LNAME OR @Original_LNAME IS NULL AND LNAME IS NULL) AND (POP_ST = @Original_POP_ST OR @Original_POP_ST IS NULL AND POP_ST IS NULL) AND (SEX = @Original_SEX OR @Original_SEX IS NULL AND SEX IS NULL) AND (SOI = @Original_SOI OR @Original_SOI IS NULL AND SOI IS NULL) AND (THANON = @Original_THANON OR @Original_THANON IS NULL AND THANON IS NULL) AND (TITLE = @Original_TITLE OR @Original_TITLE IS NULL AND TITLE IS NULL) AND (TROK = @Original_TROK OR @Original_TROK IS NULL AND TROK IS NULL); SELECT PID, TITLE, FNAME, LNAME, SEX, DOB, POP_ST, HID, HNO, TROK, SOI, THANON, CCAATTMM, CCAA_OLD FROM dbo.OUT_ERR2ALL WHERE (PID = @PID)";
			this.sqlUpdateCommand1.Connection = this.sqlConnection1;
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TITLE", System.Data.SqlDbType.VarChar, 3, "TITLE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 24, "FNAME"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 24, "LNAME"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SEX", System.Data.SqlDbType.VarChar, 1, "SEX"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DOB", System.Data.SqlDbType.VarChar, 8, "DOB"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@POP_ST", System.Data.SqlDbType.VarChar, 1, "POP_ST"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HID", System.Data.SqlDbType.VarChar, 11, "HID"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HNO", System.Data.SqlDbType.VarChar, 16, "HNO"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TROK", System.Data.SqlDbType.VarChar, 4, "TROK"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SOI", System.Data.SqlDbType.VarChar, 4, "SOI"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@THANON", System.Data.SqlDbType.VarChar, 4, "THANON"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CCAATTMM", System.Data.SqlDbType.VarChar, 8, "CCAATTMM"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CCAA_OLD", System.Data.SqlDbType.VarChar, 4, "CCAA_OLD"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_CCAATTMM", System.Data.SqlDbType.VarChar, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "CCAATTMM", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_CCAA_OLD", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "CCAA_OLD", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DOB", System.Data.SqlDbType.VarChar, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DOB", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FNAME", System.Data.SqlDbType.VarChar, 24, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HID", System.Data.SqlDbType.VarChar, 11, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HNO", System.Data.SqlDbType.VarChar, 16, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HNO", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_LNAME", System.Data.SqlDbType.VarChar, 24, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "LNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_POP_ST", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "POP_ST", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_SEX", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "SEX", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_SOI", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "SOI", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_THANON", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "THANON", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TITLE", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TITLE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TROK", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TROK", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand1
			// 
			this.sqlDeleteCommand1.CommandText = @"DELETE FROM dbo.OUT_ERR2ALL WHERE (PID = @Original_PID) AND (CCAATTMM = @Original_CCAATTMM OR @Original_CCAATTMM IS NULL AND CCAATTMM IS NULL) AND (CCAA_OLD = @Original_CCAA_OLD OR @Original_CCAA_OLD IS NULL AND CCAA_OLD IS NULL) AND (DOB = @Original_DOB OR @Original_DOB IS NULL AND DOB IS NULL) AND (FNAME = @Original_FNAME OR @Original_FNAME IS NULL AND FNAME IS NULL) AND (HID = @Original_HID OR @Original_HID IS NULL AND HID IS NULL) AND (HNO = @Original_HNO OR @Original_HNO IS NULL AND HNO IS NULL) AND (LNAME = @Original_LNAME OR @Original_LNAME IS NULL AND LNAME IS NULL) AND (POP_ST = @Original_POP_ST OR @Original_POP_ST IS NULL AND POP_ST IS NULL) AND (SEX = @Original_SEX OR @Original_SEX IS NULL AND SEX IS NULL) AND (SOI = @Original_SOI OR @Original_SOI IS NULL AND SOI IS NULL) AND (THANON = @Original_THANON OR @Original_THANON IS NULL AND THANON IS NULL) AND (TITLE = @Original_TITLE OR @Original_TITLE IS NULL AND TITLE IS NULL) AND (TROK = @Original_TROK OR @Original_TROK IS NULL AND TROK IS NULL)";
			this.sqlDeleteCommand1.Connection = this.sqlConnection1;
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_CCAATTMM", System.Data.SqlDbType.VarChar, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "CCAATTMM", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_CCAA_OLD", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "CCAA_OLD", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DOB", System.Data.SqlDbType.VarChar, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DOB", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FNAME", System.Data.SqlDbType.VarChar, 24, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HID", System.Data.SqlDbType.VarChar, 11, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HNO", System.Data.SqlDbType.VarChar, 16, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HNO", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_LNAME", System.Data.SqlDbType.VarChar, 24, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "LNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_POP_ST", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "POP_ST", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_SEX", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "SEX", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_SOI", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "SOI", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_THANON", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "THANON", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TITLE", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TITLE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TROK", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TROK", System.Data.DataRowVersion.Original, null));
			// 
			// sqlSelectCommand2
			// 
			this.sqlSelectCommand2.CommandText = "SELECT PID, DATE FROM dbo.UPDATE_PEOPLE";
			this.sqlSelectCommand2.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand2
			// 
			this.sqlInsertCommand2.CommandText = "INSERT INTO dbo.UPDATE_PEOPLE(PID, DATE) VALUES (@PID, @DATE); SELECT PID, DATE F" +
				"ROM dbo.UPDATE_PEOPLE WHERE (PID = @PID)AND(DATE=@DATE)";
			this.sqlInsertCommand2.Connection = this.sqlConnection1;
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE", System.Data.SqlDbType.VarChar, 10, "DATE"));
			// 
			// sqlUpdateCommand2
			// 
			this.sqlUpdateCommand2.CommandText = "UPDATE dbo.UPDATE_PEOPLE SET PID = @PID, DATE = @DATE WHERE (PID = @Original_PID)" +
				" AND (DATE = @Original_DATE); SELECT PID, DATE FROM dbo.UPDATE_PEOPLE WHERE (PID" +
				" = @PID)AND(DATE=@DATE)";
			this.sqlUpdateCommand2.Connection = this.sqlConnection1;
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE", System.Data.SqlDbType.VarChar, 10, "DATE"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand2
			// 
			this.sqlDeleteCommand2.CommandText = "DELETE FROM dbo.UPDATE_PEOPLE WHERE (PID = @Original_PID) AND (DATE = @Original_D" +
				"ATE)";
			this.sqlDeleteCommand2.Connection = this.sqlConnection1;
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter1
			// 
			this.sqlDataAdapter1.DeleteCommand = this.sqlDeleteCommand1;
			this.sqlDataAdapter1.InsertCommand = this.sqlInsertCommand1;
			this.sqlDataAdapter1.SelectCommand = this.sqlSelectCommand1;
			this.sqlDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "OUT_ERR2ALL", new System.Data.Common.DataColumnMapping[] {
																																																					 new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																					 new System.Data.Common.DataColumnMapping("TITLE", "TITLE"),
																																																					 new System.Data.Common.DataColumnMapping("FNAME", "FNAME"),
																																																					 new System.Data.Common.DataColumnMapping("LNAME", "LNAME"),
																																																					 new System.Data.Common.DataColumnMapping("SEX", "SEX"),
																																																					 new System.Data.Common.DataColumnMapping("DOB", "DOB"),
																																																					 new System.Data.Common.DataColumnMapping("POP_ST", "POP_ST"),
																																																					 new System.Data.Common.DataColumnMapping("HID", "HID"),
																																																					 new System.Data.Common.DataColumnMapping("HNO", "HNO"),
																																																					 new System.Data.Common.DataColumnMapping("TROK", "TROK"),
																																																					 new System.Data.Common.DataColumnMapping("SOI", "SOI"),
																																																					 new System.Data.Common.DataColumnMapping("THANON", "THANON"),
																																																					 new System.Data.Common.DataColumnMapping("CCAATTMM", "CCAATTMM"),
																																																					 new System.Data.Common.DataColumnMapping("CCAA_OLD", "CCAA_OLD")})});
			this.sqlDataAdapter1.UpdateCommand = this.sqlUpdateCommand1;
			// 
			// sqlDataAdapter2
			// 
			this.sqlDataAdapter2.DeleteCommand = this.sqlDeleteCommand2;
			this.sqlDataAdapter2.InsertCommand = this.sqlInsertCommand2;
			this.sqlDataAdapter2.SelectCommand = this.sqlSelectCommand2;
			this.sqlDataAdapter2.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "UPDATE_PEOPLE", new System.Data.Common.DataColumnMapping[] {
																																																					   new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																					   new System.Data.Common.DataColumnMapping("DATE", "DATE")})});
			this.sqlDataAdapter2.UpdateCommand = this.sqlUpdateCommand2;
			// 
			// dataSet11
			// 
			this.dataSet11.DataSetName = "DataSet1";
			this.dataSet11.Locale = new System.Globalization.CultureInfo("th-TH");
			this.dataSet11.Namespace = "http://www.tempuri.org/DataSet1.xsd";
			// 
			// dataSet21
			// 
			this.dataSet21.DataSetName = "DataSet2";
			this.dataSet21.Locale = new System.Globalization.CultureInfo("th-TH");
			this.dataSet21.Namespace = "http://www.tempuri.org/DataSet2.xsd";
			this.SaveButton.Click += new System.EventHandler(this.SaveButton_Click);
			this.SearchButton.Click += new System.EventHandler(this.SearchButton_Click);
			this.DeleteButton.Click += new System.EventHandler(this.DeleteButton_Click);
			this.ClearButton.Click += new System.EventHandler(this.ClearButton_Click);
			this.Load += new System.EventHandler(this.Page_Load);
			((System.ComponentModel.ISupportInitialize)(this.dataSet11)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.dataSet21)).EndInit();

		}
		#endregion

		//CLEAR TEXT//
		private void clearText()
		{
			IDTextBox.Text = "";
			TitleTextBox.Text = "";
			FnameTextBox.Text = "";
			LnameTextBox.Text = "";
			SexTextBox.Text = "";
			DobTextBox.Text = "";
			POP_STTextBox.Text = "";
			HidTextBox.Text = "";
			HnoTextBox.Text = "";
			TrokTextBox.Text = "";
			SoiTextBox.Text = "";
			ThanonTextBox.Text = "";
			CCAATTMMTextBox.Text = "";
			CCAA_OLDTextBox.Text = "";
			FoundLabel.Text = "";
		
		}
		
		//SEARCH BOTTON//
		private void SearchButton_Click(object sender, System.EventArgs e)
		{
			DataTable dataTable1 = new DataTable();
			dataTable1 = dataSet11.OUT_ERR2ALL;
			String sqlstr="PID=\'"+IDTextBox.Text+"\'"; //สร้างสตริงที่ใช้ search
			DataRow[] dataRow1 = dataTable1.Select(sqlstr);

			if (dataRow1.Length > 0)
			{
				clearText();
				IDTextBox.Text = (String)dataRow1[0][0];
				TitleTextBox.Text = (String)dataRow1[0][1];
				FnameTextBox.Text = (String)dataRow1[0][2];
				LnameTextBox.Text = (String)dataRow1[0][3];
				SexTextBox.Text = (String)dataRow1[0][4];
				DobTextBox.Text = (String)dataRow1[0][5];
				POP_STTextBox.Text = (String)dataRow1[0][6];
				HidTextBox.Text = (String)dataRow1[0][7];
				HnoTextBox.Text = (String)dataRow1[0][8];
				TrokTextBox.Text = (String)dataRow1[0][9];
				SoiTextBox.Text = (String)dataRow1[0][10];
				ThanonTextBox.Text = (String)dataRow1[0][11];
				CCAATTMMTextBox.Text = (String)dataRow1[0][12];
				CCAA_OLDTextBox.Text = (String)dataRow1[0][13];
			}

			if (dataRow1.Length == 0)
			{
				FoundLabel.Text = "Data Not Found";
			}
		}

		//CLEAR BUTTON//
		private void ClearButton_Click(object sender, System.EventArgs e)
		{
			clearText();
		}

		//SAVE BUTTON//
		private void SaveButton_Click(object sender, System.EventArgs e)
		{
			DataSet dataChange1 = new DataSet();
			DataTable dataTable2 = new DataTable();
			dataTable2 = dataSet11.OUT_ERR2ALL;
			String sqlstr="PID=\'"+IDTextBox.Text+"\'"; //สร้างสตริงที่ใช้ search
			DataRow[] dataRow2 = dataTable2.Select(sqlstr);

			//EDIT DATA//
			if (dataRow2.Length > 0)
			{
				dataRow2[0][0] = IDTextBox.Text;
				dataRow2[0][1] = TitleTextBox.Text;
				dataRow2[0][2] = FnameTextBox.Text;
				dataRow2[0][3] = LnameTextBox.Text;
				dataRow2[0][4] = SexTextBox.Text;
				if(DobTextBox.Text.Length!=10)
				{
					dataRow2[0][5] = DobTextBox.Text;
				}
				else
				{

					String keepyear=DobTextBox.Text.Substring(8,2);
					String keepall=DobTextBox.Text.Substring(0,6);             
					dataRow2[0][5]=keepall+keepyear;
				}
				dataRow2[0][6] = POP_STTextBox.Text;
				dataRow2[0][7] = HidTextBox.Text;
				dataRow2[0][8] = HnoTextBox.Text;
				dataRow2[0][9] = TrokTextBox.Text;
				dataRow2[0][10] = SoiTextBox.Text;
				dataRow2[0][11] = ThanonTextBox.Text;
				dataRow2[0][12] = CCAATTMMTextBox.Text;
				dataRow2[0][13] = CCAA_OLDTextBox.Text;
				dataChange1 = dataSet11.GetChanges(DataRowState.Modified);
				sqlDataAdapter1.Update(dataChange1,"OUT_ERR2ALL");

				//นำ PID ที่เปลี่ยนแปลงลงตาราง Updatepeople
				DateTime time = new DateTime();
				time = DateTime.Today;
				String[]today = time.GetDateTimeFormats('d');

				DataSet dataChange2 =new DataSet();
				DataTable dataTable3 = dataSet21.UPDATE_PEOPLE;
				
				String sqlstr2 = "PID=\'"+IDTextBox.Text+"\' AND DATE=\'"+today[3]+"\'";
				DataRow[] dataRow4 = dataTable3.Select(sqlstr2);

				if (dataRow4.Length != 0)
				{
					dataRow4[0][0] = IDTextBox.Text;
					dataRow4[0][1] = today[3];

					dataChange2 = dataSet21.GetChanges(DataRowState.Modified);
					sqlDataAdapter2.Update(dataChange2,"UPDATE_PEOPLE");
				}
				else
				{
					DataRow updateRows = dataTable3.NewRow();
					updateRows[0] = IDTextBox.Text;
					updateRows[1] = today[3];
					
					dataTable3.Rows.Add(updateRows);
					dataChange2 = dataSet21.GetChanges(DataRowState.Added);
					sqlDataAdapter2.Update(dataChange2,"UPDATE_PEOPLE");
				}

			}

			//ADD DATA//
			if (dataRow2.Length == 0)
			{
				DataRow dataRow3 = dataTable2.NewRow();
				
				dataRow3[0] = IDTextBox.Text;
				dataRow3[1] = TitleTextBox.Text;
				dataRow3[2] = FnameTextBox.Text;
				dataRow3[3] = LnameTextBox.Text;
				dataRow3[4] = SexTextBox.Text;
				if(DobTextBox.Text.Length!=10)
				{
					dataRow3[5] =DobTextBox.Text;
				}
				else
				{

					String keepyear=DobTextBox.Text.Substring(8,2);
					String keepall=DobTextBox.Text.Substring(0,6);             
					dataRow3[5]=keepall+keepyear;
				}
				dataRow3[6] = POP_STTextBox.Text;
				dataRow3[7] = HidTextBox.Text;
				dataRow3[8] = HnoTextBox.Text;
				dataRow3[9] = TrokTextBox.Text;
				dataRow3[10] = SoiTextBox.Text;
				dataRow3[11] = ThanonTextBox.Text;
				dataRow3[12] = CCAATTMMTextBox.Text;
				dataRow3[13] = CCAA_OLDTextBox.Text;

				dataTable2.Rows.Add(dataRow3);
				dataChange1 = dataSet11.GetChanges(DataRowState.Added);
				sqlDataAdapter1.Update(dataChange1,"OUT_ERR2ALL");
/*
				//นำ PID ที่เปลี่ยนแปลงลงตาราง Updatepeople
				DateTime time = new DateTime();
				time = DateTime.Today;
				String[]today = time.GetDateTimeFormats('d');

				DataSet dataChange2 =new DataSet();
				DataTable dataTable3 = dataSet21.UPDATE_PEOPLE;
				
				String sqlstr2 = "PID=\'"+IDTextBox.Text+"\' AND DATE=\'"+today[3]+"\'";
				DataRow[] dataRow4 = dataTable3.Select(sqlstr2);

				if (dataRow4.Length != 0)
				{
					dataRow4[0][0] = IDTextBox.Text;
					dataRow4[0][1] = today[3];

					dataChange2 = dataSet21.GetChanges(DataRowState.Modified);
					sqlDataAdapter2.Update(dataChange2,"UPDATE_PEOPLE");
				}
				else
				{
					DataRow updateRows = dataTable3.NewRow();
					updateRows[0] = IDTextBox.Text;
					updateRows[1] = today[3];
					
					dataTable3.Rows.Add(updateRows);
					dataChange2 = dataSet21.GetChanges(DataRowState.Added);
					sqlDataAdapter2.Update(dataChange2,"UPDATE_PEOPLE");
				}
*/				

			}
		}

		//DELETE DATA//
		private void DeleteButton_Click(object sender, System.EventArgs e)
		{
			DataSet dataChange1 = new DataSet();
			DataTable dataTable2 = new DataTable();
			dataTable2 = dataSet11.OUT_ERR2ALL;
			String sqlstr="PID=\'"+IDTextBox.Text+"\'"; //สร้างสตริงที่ใช้ search
			DataRow[] dataRow2 = dataTable2.Select(sqlstr);

			if (dataRow2.Length > 0)
			{
				dataRow2[0].Delete();
				dataChange1 = dataSet11.GetChanges(DataRowState.Deleted);
				sqlDataAdapter1.Update(dataChange1,"OUT_ERR2ALL");
				
				clearText();
			}
		
		}
   	

		
	}
}
