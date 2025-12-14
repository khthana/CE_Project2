using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.IO;

namespace peopleService
{
	/// <summary>
	/// Summary description for Service1.
	/// </summary>
	public class Service1 : System.Web.Services.WebService
	{
		public Service1()
		{
			//CODEGEN: This call is required by the ASP.NET Web Services Designer
			InitializeComponent();
		}

		private System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		private System.Data.SqlClient.SqlConnection sqlConnection1;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
		private System.Data.SqlClient.SqlCommand sqlSelectCommand2;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand2;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand2;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand2;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter2;
		private peopleService.DataSet1 dataSet11;
		private System.Data.SqlClient.SqlCommand sqlSelectCommand3;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand3;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter3;
		private String conStr;

		#region Component Designer generated code
		
		//Required by the Web Services Designer 
		private IContainer components = null;
				
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
			this.sqlSelectCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter2 = new System.Data.SqlClient.SqlDataAdapter();
			this.dataSet11 = new peopleService.DataSet1();
			this.sqlSelectCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter3 = new System.Data.SqlClient.SqlDataAdapter();
			((System.ComponentModel.ISupportInitialize)(this.dataSet11)).BeginInit();
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
			// sqlSelectCommand2
			// 
			this.sqlSelectCommand2.CommandText = "SELECT PID, FPID, MPID, PID_SELECT, FLAG FROM dbo.DEPENDENT";
			this.sqlSelectCommand2.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand2
			// 
			this.sqlInsertCommand2.CommandText = "INSERT INTO dbo.DEPENDENT(PID, FPID, MPID, PID_SELECT, FLAG) VALUES (@PID, @FPID," +
				" @MPID, @PID_SELECT, @FLAG); SELECT PID, FPID, MPID, PID_SELECT, FLAG FROM dbo.D" +
				"EPENDENT WHERE (PID = @PID)";
			this.sqlInsertCommand2.Connection = this.sqlConnection1;
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FPID", System.Data.SqlDbType.VarChar, 13, "FPID"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MPID", System.Data.SqlDbType.VarChar, 13, "MPID"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID_SELECT", System.Data.SqlDbType.VarChar, 13, "PID_SELECT"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FLAG", System.Data.SqlDbType.VarChar, 1, "FLAG"));
			// 
			// sqlUpdateCommand2
			// 
			this.sqlUpdateCommand2.CommandText = @"UPDATE dbo.DEPENDENT SET PID = @PID, FPID = @FPID, MPID = @MPID, PID_SELECT = @PID_SELECT, FLAG = @FLAG WHERE (PID = @Original_PID) AND (FPID = @Original_FPID OR @Original_FPID IS NULL AND FPID IS NULL) AND (FLAG = @Original_FLAG OR @Original_FLAG IS NULL AND FLAG IS NULL) AND (MPID = @Original_MPID OR @Original_MPID IS NULL AND MPID IS NULL) AND (PID_SELECT = @Original_PID_SELECT OR @Original_PID_SELECT IS NULL AND PID_SELECT IS NULL); SELECT PID, FPID, MPID, PID_SELECT, FLAG FROM dbo.DEPENDENT WHERE (PID = @PID)";
			this.sqlUpdateCommand2.Connection = this.sqlConnection1;
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FPID", System.Data.SqlDbType.VarChar, 13, "FPID"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MPID", System.Data.SqlDbType.VarChar, 13, "MPID"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID_SELECT", System.Data.SqlDbType.VarChar, 13, "PID_SELECT"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FLAG", System.Data.SqlDbType.VarChar, 1, "FLAG"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FPID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FPID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FLAG", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FLAG", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_MPID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "MPID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID_SELECT", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID_SELECT", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand2
			// 
			this.sqlDeleteCommand2.CommandText = @"DELETE FROM dbo.DEPENDENT WHERE (PID = @Original_PID) AND (FPID = @Original_FPID OR @Original_FPID IS NULL AND FPID IS NULL) AND (FLAG = @Original_FLAG OR @Original_FLAG IS NULL AND FLAG IS NULL) AND (MPID = @Original_MPID OR @Original_MPID IS NULL AND MPID IS NULL) AND (PID_SELECT = @Original_PID_SELECT OR @Original_PID_SELECT IS NULL AND PID_SELECT IS NULL)";
			this.sqlDeleteCommand2.Connection = this.sqlConnection1;
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FPID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FPID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FLAG", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FLAG", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_MPID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "MPID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID_SELECT", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID_SELECT", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter2
			// 
			this.sqlDataAdapter2.DeleteCommand = this.sqlDeleteCommand2;
			this.sqlDataAdapter2.InsertCommand = this.sqlInsertCommand2;
			this.sqlDataAdapter2.SelectCommand = this.sqlSelectCommand2;
			this.sqlDataAdapter2.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "DEPENDENT", new System.Data.Common.DataColumnMapping[] {
																																																				   new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																				   new System.Data.Common.DataColumnMapping("FPID", "FPID"),
																																																				   new System.Data.Common.DataColumnMapping("MPID", "MPID"),
																																																				   new System.Data.Common.DataColumnMapping("PID_SELECT", "PID_SELECT"),
																																																				   new System.Data.Common.DataColumnMapping("FLAG", "FLAG")})});
			this.sqlDataAdapter2.UpdateCommand = this.sqlUpdateCommand2;
			// 
			// dataSet11
			// 
			this.dataSet11.DataSetName = "DataSet1";
			this.dataSet11.Locale = new System.Globalization.CultureInfo("th-TH");
			this.dataSet11.Namespace = "http://www.tempuri.org/DataSet1.xsd";
			// 
			// sqlSelectCommand3
			// 
			this.sqlSelectCommand3.CommandText = "SELECT PID, TITLE, FNAME, LNAME, SEX, DOB, POP_ST, HID, HNO, TROK, SOI, THANON, C" +
				"CAATTMM, CCAA_OLD, FPID, MPID, PID_SELECT, FLAG FROM dbo.officerpeo";
			this.sqlSelectCommand3.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand3
			// 
			this.sqlInsertCommand3.CommandText = @"INSERT INTO dbo.officerpeo(PID, TITLE, FNAME, LNAME, SEX, DOB, POP_ST, HID, HNO, TROK, SOI, THANON, CCAATTMM, CCAA_OLD, FPID, MPID, PID_SELECT, FLAG) VALUES (@PID, @TITLE, @FNAME, @LNAME, @SEX, @DOB, @POP_ST, @HID, @HNO, @TROK, @SOI, @THANON, @CCAATTMM, @CCAA_OLD, @FPID, @MPID, @PID_SELECT, @FLAG); SELECT PID, TITLE, FNAME, LNAME, SEX, DOB, POP_ST, HID, HNO, TROK, SOI, THANON, CCAATTMM, CCAA_OLD, FPID, MPID, PID_SELECT, FLAG FROM dbo.officerpeo";
			this.sqlInsertCommand3.Connection = this.sqlConnection1;
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TITLE", System.Data.SqlDbType.VarChar, 3, "TITLE"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 24, "FNAME"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 24, "LNAME"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SEX", System.Data.SqlDbType.VarChar, 1, "SEX"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DOB", System.Data.SqlDbType.VarChar, 8, "DOB"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@POP_ST", System.Data.SqlDbType.VarChar, 1, "POP_ST"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HID", System.Data.SqlDbType.VarChar, 11, "HID"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HNO", System.Data.SqlDbType.VarChar, 16, "HNO"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TROK", System.Data.SqlDbType.VarChar, 4, "TROK"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SOI", System.Data.SqlDbType.VarChar, 4, "SOI"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@THANON", System.Data.SqlDbType.VarChar, 4, "THANON"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CCAATTMM", System.Data.SqlDbType.VarChar, 8, "CCAATTMM"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CCAA_OLD", System.Data.SqlDbType.VarChar, 4, "CCAA_OLD"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FPID", System.Data.SqlDbType.VarChar, 13, "FPID"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MPID", System.Data.SqlDbType.VarChar, 13, "MPID"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID_SELECT", System.Data.SqlDbType.VarChar, 13, "PID_SELECT"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FLAG", System.Data.SqlDbType.VarChar, 1, "FLAG"));
			// 
			// sqlDataAdapter3
			// 
			this.sqlDataAdapter3.InsertCommand = this.sqlInsertCommand3;
			this.sqlDataAdapter3.SelectCommand = this.sqlSelectCommand3;
			this.sqlDataAdapter3.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "officerpeo", new System.Data.Common.DataColumnMapping[] {
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
																																																					new System.Data.Common.DataColumnMapping("CCAA_OLD", "CCAA_OLD"),
																																																					new System.Data.Common.DataColumnMapping("FPID", "FPID"),
																																																					new System.Data.Common.DataColumnMapping("MPID", "MPID"),
																																																					new System.Data.Common.DataColumnMapping("PID_SELECT", "PID_SELECT"),
																																																					new System.Data.Common.DataColumnMapping("FLAG", "FLAG")})});
			((System.ComponentModel.ISupportInitialize)(this.dataSet11)).EndInit();

		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if(disposing && components != null)
			{
				components.Dispose();
			}
			base.Dispose(disposing);		
		}
		
		#endregion

		// WEB SERVICE EXAMPLE
		// The HelloWorld() example service returns the string Hello World
		// To build, uncomment the following lines then save and build the project
		// To test this web service, press F5
		[WebMethod]
		public DataSet1 queryPeople(String pid)
		{/*
			sqlDataAdapter1.Fill(dataSet11);
			sqlDataAdapter2.Fill(dataSet11);
			String output="";
			DataRow row1;
			row1=dataSet11.OUT_ERR2ALL.FindByPID(pid);
			DataRow[] row2;
			row2=row1.GetChildRows("OUT_ERR2ALLDEPENDENT");
			DataSet test4=new DataSet();
			test4.
			foreach(DataRow dr in row2)
			{
				output=output+(String)dr["FPID"]+":"+(String)dr["MPID"]+":"+(String)dr["PID_SELECT"]+":"+(String)dr["FLAG"];
			}
			return dataSet11;
		*/
			sqlDataAdapter3.Fill(dataSet11);
			DataSet1 kucoke2=new DataSet1();
			String sql="pid=\'"+pid+"\'";
			DataRow[] kucoke1=dataSet11.officerpeo.Select(sql);
			if(kucoke1.Length==0){
				String tmp="SELECT * FROM OUT_ERR2ALL WHERE PID=\'"+pid+"\'";
				SqlDataAdapter kucoke4=new SqlDataAdapter(tmp,sqlConnection1);
				kucoke4.Fill(kucoke2);
			}
			else kucoke2.Merge(kucoke1);
			return kucoke2;
		}
		[WebMethod]
		public DataSet updatePeople(String r_date)
		{
			String tmp="SELECT PID FROM UPDATE_PEOPLE WHERE DATE=\'"+r_date+"\'";
			DataSet kucoke=new DataSet();
			SqlDataAdapter kucoke4=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke4.Fill(kucoke);
			return kucoke;
		}
		[WebMethod]
		public DataSet updateOffice(String r_date)
		{
			String tmp="SELECT PID FROM UPDATE_OFFICE WHERE DATE=\'"+r_date+"\'";
			DataSet kucoke=new DataSet();
			SqlDataAdapter kucoke4=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke4.Fill(kucoke);
			return kucoke;
		}
	}
}
