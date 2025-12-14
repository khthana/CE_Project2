using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using System.IO;

namespace socialService
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
		private socialService.DataSet1 dataSet11;
		private System.Data.SqlClient.SqlCommand sqlSelectCommand2;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand2;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand2;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand2;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter2;
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
			this.dataSet11 = new socialService.DataSet1();
			this.sqlSelectCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter2 = new System.Data.SqlClient.SqlDataAdapter();
			((System.ComponentModel.ISupportInitialize)(this.dataSet11)).BeginInit();
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
			this.sqlSelectCommand2.CommandText = "SELECT PID, DATE FROM dbo.UPDATE_SOCIAL";
			this.sqlSelectCommand2.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand2
			// 
			this.sqlInsertCommand2.CommandText = "INSERT INTO dbo.UPDATE_SOCIAL(PID, DATE) VALUES (@PID, @DATE); SELECT PID, DATE F" +
				"ROM dbo.UPDATE_SOCIAL WHERE (PID = @PID)";
			this.sqlInsertCommand2.Connection = this.sqlConnection1;
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE", System.Data.SqlDbType.VarChar, 8, "DATE"));
			// 
			// sqlUpdateCommand2
			// 
			this.sqlUpdateCommand2.CommandText = "UPDATE dbo.UPDATE_SOCIAL SET PID = @PID, DATE = @DATE WHERE (PID = @Original_PID)" +
				" AND (DATE = @Original_DATE OR @Original_DATE IS NULL AND DATE IS NULL); SELECT " +
				"PID, DATE FROM dbo.UPDATE_SOCIAL WHERE (PID = @PID)";
			this.sqlUpdateCommand2.Connection = this.sqlConnection1;
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE", System.Data.SqlDbType.VarChar, 8, "DATE"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE", System.Data.SqlDbType.VarChar, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand2
			// 
			this.sqlDeleteCommand2.CommandText = "DELETE FROM dbo.UPDATE_SOCIAL WHERE (PID = @Original_PID) AND (DATE = @Original_D" +
				"ATE OR @Original_DATE IS NULL AND DATE IS NULL)";
			this.sqlDeleteCommand2.Connection = this.sqlConnection1;
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE", System.Data.SqlDbType.VarChar, 8, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter2
			// 
			this.sqlDataAdapter2.DeleteCommand = this.sqlDeleteCommand2;
			this.sqlDataAdapter2.InsertCommand = this.sqlInsertCommand2;
			this.sqlDataAdapter2.SelectCommand = this.sqlSelectCommand2;
			this.sqlDataAdapter2.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "UPDATE_SOCIAL", new System.Data.Common.DataColumnMapping[] {
																																																					   new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																					   new System.Data.Common.DataColumnMapping("DATE", "DATE")})});
			this.sqlDataAdapter2.UpdateCommand = this.sqlUpdateCommand2;
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
		public DataSet querySocial(String pid)
		{
			String tmp="SELECT * FROM SSS WHERE PID=\'"+pid+"\'";
			DataSet kucoke3=new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke3);
			return kucoke3;
		}
		[WebMethod]
		public DataSet updateSocial(String r_date)
		{
			/*
			DataSet kucoke =new DataSet();
			sqlDataAdapter2.Fill(kucoke);
			return kucoke;
			*/
			String tmp="SELECT PID FROM UPDATE_SOCIAL WHERE DATE=\'"+r_date+"\'";
			DataSet kucoke=new DataSet();
			SqlDataAdapter kucoke4=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke4.Fill(kucoke);
			return kucoke;
		}

	}
}
