using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
namespace HospitalComponent
{
	/// <summary>
	/// Summary description for MyDB.
	/// </summary>
	class MyDB
	{
		//about clearing
		private System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		private System.Data.SqlClient.SqlConnection sqlConnection1;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
		//about province
		private System.Data.SqlClient.SqlCommand sqlSelectCommand2;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand2;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand2;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand2;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter2;
		//about ampher
		private System.Data.SqlClient.SqlCommand sqlSelectCommand3;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand3;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand3;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand3;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter3;
		//about tumbon
		private System.Data.SqlClient.SqlCommand sqlSelectCommand4;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand4;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand4;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand4;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter4;
		//about allhospital
		private System.Data.SqlClient.SqlCommand sqlSelectCommand5;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand5;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand5;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand5;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter5;
		//about hospitalinproject
		private System.Data.SqlClient.SqlCommand sqlSelectCommand6;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand6;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand6;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand6;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter6;
		public String conStr;
		public MyDB()
		{
			this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlConnection1 = new System.Data.SqlClient.SqlConnection();
			this.sqlDataAdapter1 = new System.Data.SqlClient.SqlDataAdapter();
			this.sqlSelectCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter2 = new System.Data.SqlClient.SqlDataAdapter();
			this.sqlSelectCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter3 = new System.Data.SqlClient.SqlDataAdapter();
			this.sqlSelectCommand4 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand4 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand4 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand4 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter4 = new System.Data.SqlClient.SqlDataAdapter();
			this.sqlSelectCommand5 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand5 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand5 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand5 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter5 = new System.Data.SqlClient.SqlDataAdapter();
			this.sqlSelectCommand6 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand6 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand6 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand6 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter6 = new System.Data.SqlClient.SqlDataAdapter();
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "SELECT PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, COST_ROOM, C" +
				"OST_TREAT, COST_OTHER, COST_SUM, HSTATUS, HOSPMAIN, HOSPSUB, HOSPSTATUS FROM dbo" +
				".CLEARING";
			this.sqlSelectCommand1.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand1
			// 
			this.sqlInsertCommand1.CommandText = @"INSERT INTO dbo.CLEARING(PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, COST_ROOM, COST_TREAT, COST_OTHER, COST_SUM, HSTATUS, HOSPMAIN, HOSPSUB, HOSPSTATUS) VALUES (@PID, @BILL_ID, @DATE_BILL, @DISEASE, @COST_MEDICINE, @COST_DOCTOR, @COST_ROOM, @COST_TREAT, @COST_OTHER, @COST_SUM, @HSTATUS, @HOSPMAIN, @HOSPSUB, @HOSPSTATUS); SELECT PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, COST_ROOM, COST_TREAT, COST_OTHER, COST_SUM, HSTATUS, HOSPMAIN, HOSPSUB, HOSPSTATUS FROM dbo.CLEARING WHERE (BILL_ID = @BILL_ID) AND (DATE_BILL = @DATE_BILL) AND (PID = @PID)";
			this.sqlInsertCommand1.Connection = this.sqlConnection1;
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@BILL_ID", System.Data.SqlDbType.VarChar, 20, "BILL_ID"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE_BILL", System.Data.SqlDbType.VarChar, 10, "DATE_BILL"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DISEASE", System.Data.SqlDbType.VarChar, 50, "DISEASE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_MEDICINE", System.Data.SqlDbType.Int, 4, "COST_MEDICINE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_DOCTOR", System.Data.SqlDbType.Int, 4, "COST_DOCTOR"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_ROOM", System.Data.SqlDbType.Int, 4, "COST_ROOM"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_TREAT", System.Data.SqlDbType.Int, 4, "COST_TREAT"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_OTHER", System.Data.SqlDbType.VarChar, 50, "COST_OTHER"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_SUM", System.Data.SqlDbType.Int, 4, "COST_SUM"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HSTATUS", System.Data.SqlDbType.VarChar, 1, "HSTATUS"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPMAIN", System.Data.SqlDbType.VarChar, 5, "HOSPMAIN"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPSUB", System.Data.SqlDbType.VarChar, 5, "HOSPSUB"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPSTATUS", System.Data.SqlDbType.VarChar, 1, "HOSPSTATUS"));
			// 
			// sqlUpdateCommand1
			// 
			this.sqlUpdateCommand1.CommandText = "UPDATE dbo.CLEARING SET PID = @PID, BILL_ID = @BILL_ID, DATE_BILL = @DATE_BILL, D" +
				"ISEASE = @DISEASE, COST_MEDICINE = @COST_MEDICINE, COST_DOCTOR = @COST_DOCTOR, C" +
				"OST_ROOM = @COST_ROOM, COST_TREAT = @COST_TREAT, COST_OTHER = @COST_OTHER, COST_" +
				"SUM = @COST_SUM, HSTATUS = @HSTATUS, HOSPMAIN = @HOSPMAIN, HOSPSUB = @HOSPSUB, H" +
				"OSPSTATUS = @HOSPSTATUS WHERE (BILL_ID = @Original_BILL_ID) AND (DATE_BILL = @Or" +
				"iginal_DATE_BILL) AND (PID = @Original_PID) AND (COST_DOCTOR = @Original_COST_DO" +
				"CTOR OR @Original_COST_DOCTOR IS NULL AND COST_DOCTOR IS NULL) AND (COST_MEDICIN" +
				"E = @Original_COST_MEDICINE OR @Original_COST_MEDICINE IS NULL AND COST_MEDICINE" +
				" IS NULL) AND (COST_OTHER = @Original_COST_OTHER OR @Original_COST_OTHER IS NULL" +
				" AND COST_OTHER IS NULL) AND (COST_ROOM = @Original_COST_ROOM OR @Original_COST_" +
				"ROOM IS NULL AND COST_ROOM IS NULL) AND (COST_SUM = @Original_COST_SUM OR @Origi" +
				"nal_COST_SUM IS NULL AND COST_SUM IS NULL) AND (COST_TREAT = @Original_COST_TREA" +
				"T OR @Original_COST_TREAT IS NULL AND COST_TREAT IS NULL) AND (DISEASE = @Origin" +
				"al_DISEASE OR @Original_DISEASE IS NULL AND DISEASE IS NULL) AND (HOSPMAIN = @Or" +
				"iginal_HOSPMAIN OR @Original_HOSPMAIN IS NULL AND HOSPMAIN IS NULL) AND (HOSPSTA" +
				"TUS = @Original_HOSPSTATUS OR @Original_HOSPSTATUS IS NULL AND HOSPSTATUS IS NUL" +
				"L) AND (HOSPSUB = @Original_HOSPSUB OR @Original_HOSPSUB IS NULL AND HOSPSUB IS " +
				"NULL) AND (HSTATUS = @Original_HSTATUS OR @Original_HSTATUS IS NULL AND HSTATUS " +
				"IS NULL); SELECT PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, C" +
				"OST_ROOM, COST_TREAT, COST_OTHER, COST_SUM, HSTATUS, HOSPMAIN, HOSPSUB, HOSPSTAT" +
				"US FROM dbo.CLEARING WHERE (BILL_ID = @BILL_ID) AND (DATE_BILL = @DATE_BILL) AND" +
				" (PID = @PID)";
			this.sqlUpdateCommand1.Connection = this.sqlConnection1;
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@BILL_ID", System.Data.SqlDbType.VarChar, 20, "BILL_ID"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE_BILL", System.Data.SqlDbType.VarChar, 10, "DATE_BILL"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DISEASE", System.Data.SqlDbType.VarChar, 50, "DISEASE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_MEDICINE", System.Data.SqlDbType.Int, 4, "COST_MEDICINE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_DOCTOR", System.Data.SqlDbType.Int, 4, "COST_DOCTOR"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_ROOM", System.Data.SqlDbType.Int, 4, "COST_ROOM"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_TREAT", System.Data.SqlDbType.Int, 4, "COST_TREAT"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_OTHER", System.Data.SqlDbType.VarChar, 50, "COST_OTHER"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_SUM", System.Data.SqlDbType.Int, 4, "COST_SUM"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HSTATUS", System.Data.SqlDbType.VarChar, 1, "HSTATUS"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPMAIN", System.Data.SqlDbType.VarChar, 5, "HOSPMAIN"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPSUB", System.Data.SqlDbType.VarChar, 5, "HOSPSUB"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPSTATUS", System.Data.SqlDbType.VarChar, 1, "HOSPSTATUS"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_BILL_ID", System.Data.SqlDbType.VarChar, 20, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "BILL_ID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE_BILL", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE_BILL", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_DOCTOR", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_DOCTOR", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_MEDICINE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_MEDICINE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_OTHER", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_OTHER", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_ROOM", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_ROOM", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_SUM", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_SUM", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_TREAT", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_TREAT", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DISEASE", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DISEASE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPMAIN", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPSTATUS", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPSTATUS", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPSUB", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPSUB", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HSTATUS", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HSTATUS", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand1
			// 
			this.sqlDeleteCommand1.CommandText = @"DELETE FROM dbo.CLEARING WHERE (BILL_ID = @Original_BILL_ID) AND (DATE_BILL = @Original_DATE_BILL) AND (PID = @Original_PID) AND (COST_DOCTOR = @Original_COST_DOCTOR OR @Original_COST_DOCTOR IS NULL AND COST_DOCTOR IS NULL) AND (COST_MEDICINE = @Original_COST_MEDICINE OR @Original_COST_MEDICINE IS NULL AND COST_MEDICINE IS NULL) AND (COST_OTHER = @Original_COST_OTHER OR @Original_COST_OTHER IS NULL AND COST_OTHER IS NULL) AND (COST_ROOM = @Original_COST_ROOM OR @Original_COST_ROOM IS NULL AND COST_ROOM IS NULL) AND (COST_SUM = @Original_COST_SUM OR @Original_COST_SUM IS NULL AND COST_SUM IS NULL) AND (COST_TREAT = @Original_COST_TREAT OR @Original_COST_TREAT IS NULL AND COST_TREAT IS NULL) AND (DISEASE = @Original_DISEASE OR @Original_DISEASE IS NULL AND DISEASE IS NULL) AND (HOSPMAIN = @Original_HOSPMAIN OR @Original_HOSPMAIN IS NULL AND HOSPMAIN IS NULL) AND (HOSPSTATUS = @Original_HOSPSTATUS OR @Original_HOSPSTATUS IS NULL AND HOSPSTATUS IS NULL) AND (HOSPSUB = @Original_HOSPSUB OR @Original_HOSPSUB IS NULL AND HOSPSUB IS NULL) AND (HSTATUS = @Original_HSTATUS OR @Original_HSTATUS IS NULL AND HSTATUS IS NULL)";
			this.sqlDeleteCommand1.Connection = this.sqlConnection1;
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_BILL_ID", System.Data.SqlDbType.VarChar, 20, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "BILL_ID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE_BILL", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE_BILL", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_DOCTOR", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_DOCTOR", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_MEDICINE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_MEDICINE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_OTHER", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_OTHER", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_ROOM", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_ROOM", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_SUM", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_SUM", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_TREAT", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_TREAT", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DISEASE", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DISEASE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPMAIN", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPSTATUS", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPSTATUS", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPSUB", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPSUB", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HSTATUS", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HSTATUS", System.Data.DataRowVersion.Original, null));
			// 
			// sqlConnection1
			// 
			conStr="";
			try
			{
				//String kucoke=Directory.GetCurrentDirectory();
				FileStream aFile=new FileStream(@"C:\Inetpub\configDBHospital.txt",FileMode.Open);
				StreamReader sr=new StreamReader(aFile);
				conStr=sr.ReadToEnd();
				sr.Close();
			}
			catch(IOException ea)
			{
				Console.WriteLine("An IO exception has been thrown!");
				Console.WriteLine(ea.ToString());
			}
			this.sqlConnection1.ConnectionString=conStr;

//			this.sqlConnection1.ConnectionString = "data source=EKOC;initial catalog=datahospital;password=kucoke;persist security info=True;user id=" +
//				"dbhospital;workstation id=EKOC;packet size=4096";
			// 
			// sqlDataAdapter1
			// 
			this.sqlDataAdapter1.DeleteCommand = this.sqlDeleteCommand1;
			this.sqlDataAdapter1.InsertCommand = this.sqlInsertCommand1;
			this.sqlDataAdapter1.SelectCommand = this.sqlSelectCommand1;
			this.sqlDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "CLEARING", new System.Data.Common.DataColumnMapping[] {
																																																				  new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																				  new System.Data.Common.DataColumnMapping("BILL_ID", "BILL_ID"),
																																																				  new System.Data.Common.DataColumnMapping("DATE_BILL", "DATE_BILL"),
																																																				  new System.Data.Common.DataColumnMapping("DISEASE", "DISEASE"),
																																																				  new System.Data.Common.DataColumnMapping("COST_MEDICINE", "COST_MEDICINE"),
																																																				  new System.Data.Common.DataColumnMapping("COST_DOCTOR", "COST_DOCTOR"),
																																																				  new System.Data.Common.DataColumnMapping("COST_ROOM", "COST_ROOM"),
																																																				  new System.Data.Common.DataColumnMapping("COST_TREAT", "COST_TREAT"),
																																																				  new System.Data.Common.DataColumnMapping("COST_OTHER", "COST_OTHER"),
																																																				  new System.Data.Common.DataColumnMapping("COST_SUM", "COST_SUM"),
																																																				  new System.Data.Common.DataColumnMapping("HSTATUS", "HSTATUS"),
																																																				  new System.Data.Common.DataColumnMapping("HOSPMAIN", "HOSPMAIN"),
																																																				  new System.Data.Common.DataColumnMapping("HOSPSUB", "HOSPSUB"),
																																																				  new System.Data.Common.DataColumnMapping("HOSPSTATUS", "HOSPSTATUS")})});
			this.sqlDataAdapter1.UpdateCommand = this.sqlUpdateCommand1;
			// sqlSelectCommand2
			// 
			this.sqlSelectCommand2.CommandText = "SELECT pvcode, name FROM province";
			this.sqlSelectCommand2.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand2
			// 
			this.sqlInsertCommand2.CommandText = "INSERT INTO province(pvcode, name) VALUES (@pvcode, @name); SELECT pvcode, name F" +
				"ROM province WHERE (pvcode = @pvcode)";
			this.sqlInsertCommand2.Connection = this.sqlConnection1;
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pvcode", System.Data.SqlDbType.NVarChar, 2, "pvcode"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@name", System.Data.SqlDbType.NVarChar, 50, "name"));
			// 
			// sqlUpdateCommand2
			// 
			this.sqlUpdateCommand2.CommandText = "UPDATE province SET pvcode = @pvcode, name = @name WHERE (pvcode = @Original_pvco" +
				"de) AND (name = @Original_name OR @Original_name IS NULL AND name IS NULL); SELE" +
				"CT pvcode, name FROM province WHERE (pvcode = @pvcode)";
			this.sqlUpdateCommand2.Connection = this.sqlConnection1;
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pvcode", System.Data.SqlDbType.NVarChar, 2, "pvcode"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@name", System.Data.SqlDbType.NVarChar, 50, "name"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_pvcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "pvcode", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_name", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "name", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand2
			// 
			this.sqlDeleteCommand2.CommandText = "DELETE FROM province WHERE (pvcode = @Original_pvcode) AND (name = @Original_name" +
				" OR @Original_name IS NULL AND name IS NULL)";
			this.sqlDeleteCommand2.Connection = this.sqlConnection1;
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_pvcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "pvcode", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_name", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "name", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter2
			// 
			this.sqlDataAdapter2.DeleteCommand = this.sqlDeleteCommand2;
			this.sqlDataAdapter2.InsertCommand = this.sqlInsertCommand2;
			this.sqlDataAdapter2.SelectCommand = this.sqlSelectCommand2;
			this.sqlDataAdapter2.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "province", new System.Data.Common.DataColumnMapping[] {
																																																				  new System.Data.Common.DataColumnMapping("pvcode", "pvcode"),
																																																				  new System.Data.Common.DataColumnMapping("name", "name")})});
			this.sqlDataAdapter2.UpdateCommand = this.sqlUpdateCommand2;
			// 
			// sqlSelectCommand3
			// 
			this.sqlSelectCommand3.CommandText = "SELECT pvcode, amcode, name FROM ampher";
			this.sqlSelectCommand3.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand3
			// 
			this.sqlInsertCommand3.CommandText = "INSERT INTO ampher(pvcode, amcode, name) VALUES (@pvcode, @amcode, @name); SELECT" +
				" pvcode, amcode, name FROM ampher WHERE (amcode = @amcode) AND (pvcode = @pvcode" +
				")";
			this.sqlInsertCommand3.Connection = this.sqlConnection1;
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pvcode", System.Data.SqlDbType.NVarChar, 2, "pvcode"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@amcode", System.Data.SqlDbType.NVarChar, 2, "amcode"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@name", System.Data.SqlDbType.NVarChar, 50, "name"));
			// 
			// sqlUpdateCommand3
			// 
			this.sqlUpdateCommand3.CommandText = @"UPDATE ampher SET pvcode = @pvcode, amcode = @amcode, name = @name WHERE (amcode = @Original_amcode) AND (pvcode = @Original_pvcode) AND (name = @Original_name OR @Original_name IS NULL AND name IS NULL); SELECT pvcode, amcode, name FROM ampher WHERE (amcode = @amcode) AND (pvcode = @pvcode)";
			this.sqlUpdateCommand3.Connection = this.sqlConnection1;
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pvcode", System.Data.SqlDbType.NVarChar, 2, "pvcode"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@amcode", System.Data.SqlDbType.NVarChar, 2, "amcode"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@name", System.Data.SqlDbType.NVarChar, 50, "name"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_amcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "amcode", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_pvcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "pvcode", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_name", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "name", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand3
			// 
			this.sqlDeleteCommand3.CommandText = "DELETE FROM ampher WHERE (amcode = @Original_amcode) AND (pvcode = @Original_pvco" +
				"de) AND (name = @Original_name OR @Original_name IS NULL AND name IS NULL)";
			this.sqlDeleteCommand3.Connection = this.sqlConnection1;
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_amcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "amcode", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_pvcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "pvcode", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_name", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "name", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter3
			// 
			this.sqlDataAdapter3.DeleteCommand = this.sqlDeleteCommand3;
			this.sqlDataAdapter3.InsertCommand = this.sqlInsertCommand3;
			this.sqlDataAdapter3.SelectCommand = this.sqlSelectCommand3;
			this.sqlDataAdapter3.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "ampher", new System.Data.Common.DataColumnMapping[] {
																																																				new System.Data.Common.DataColumnMapping("pvcode", "pvcode"),
																																																				new System.Data.Common.DataColumnMapping("amcode", "amcode"),
																																																				new System.Data.Common.DataColumnMapping("name", "name")})});
			this.sqlDataAdapter3.UpdateCommand = this.sqlUpdateCommand3;
			// 
			// sqlSelectCommand4
			// 
			this.sqlSelectCommand4.CommandText = "SELECT pvcode, amcode, ttcode, moucode, name FROM tumbon";
			this.sqlSelectCommand4.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand4
			// 
			this.sqlInsertCommand4.CommandText = "INSERT INTO tumbon(pvcode, amcode, ttcode, moucode, name) VALUES (@pvcode, @amcod" +
				"e, @ttcode, @moucode, @name); SELECT pvcode, amcode, ttcode, moucode, name FROM " +
				"tumbon WHERE (amcode = @amcode) AND (pvcode = @pvcode) AND (ttcode = @ttcode)";
			this.sqlInsertCommand4.Connection = this.sqlConnection1;
			this.sqlInsertCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pvcode", System.Data.SqlDbType.NVarChar, 2, "pvcode"));
			this.sqlInsertCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@amcode", System.Data.SqlDbType.NVarChar, 2, "amcode"));
			this.sqlInsertCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ttcode", System.Data.SqlDbType.NVarChar, 2, "ttcode"));
			this.sqlInsertCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@moucode", System.Data.SqlDbType.NVarChar, 2, "moucode"));
			this.sqlInsertCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@name", System.Data.SqlDbType.NVarChar, 50, "name"));
			// 
			// sqlUpdateCommand4
			// 
			this.sqlUpdateCommand4.CommandText = @"UPDATE tumbon SET pvcode = @pvcode, amcode = @amcode, ttcode = @ttcode, moucode = @moucode, name = @name WHERE (amcode = @Original_amcode) AND (pvcode = @Original_pvcode) AND (ttcode = @Original_ttcode) AND (moucode = @Original_moucode) AND (name = @Original_name OR @Original_name IS NULL AND name IS NULL); SELECT pvcode, amcode, ttcode, moucode, name FROM tumbon WHERE (amcode = @amcode) AND (pvcode = @pvcode) AND (ttcode = @ttcode)";
			this.sqlUpdateCommand4.Connection = this.sqlConnection1;
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pvcode", System.Data.SqlDbType.NVarChar, 2, "pvcode"));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@amcode", System.Data.SqlDbType.NVarChar, 2, "amcode"));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ttcode", System.Data.SqlDbType.NVarChar, 2, "ttcode"));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@moucode", System.Data.SqlDbType.NVarChar, 2, "moucode"));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@name", System.Data.SqlDbType.NVarChar, 50, "name"));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_amcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "amcode", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_pvcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "pvcode", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_ttcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "ttcode", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_moucode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "moucode", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_name", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "name", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand4
			// 
			this.sqlDeleteCommand4.CommandText = "DELETE FROM tumbon WHERE (amcode = @Original_amcode) AND (pvcode = @Original_pvco" +
				"de) AND (ttcode = @Original_ttcode) AND (moucode = @Original_moucode) AND (name " +
				"= @Original_name OR @Original_name IS NULL AND name IS NULL)";
			this.sqlDeleteCommand4.Connection = this.sqlConnection1;
			this.sqlDeleteCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_amcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "amcode", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_pvcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "pvcode", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_ttcode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "ttcode", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_moucode", System.Data.SqlDbType.NVarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "moucode", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_name", System.Data.SqlDbType.NVarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "name", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter4
			// 
			this.sqlDataAdapter4.DeleteCommand = this.sqlDeleteCommand4;
			this.sqlDataAdapter4.InsertCommand = this.sqlInsertCommand4;
			this.sqlDataAdapter4.SelectCommand = this.sqlSelectCommand4;
			this.sqlDataAdapter4.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "tumbon", new System.Data.Common.DataColumnMapping[] {
																																																				new System.Data.Common.DataColumnMapping("pvcode", "pvcode"),
																																																				new System.Data.Common.DataColumnMapping("amcode", "amcode"),
																																																				new System.Data.Common.DataColumnMapping("ttcode", "ttcode"),
																																																				new System.Data.Common.DataColumnMapping("moucode", "moucode"),
																																																				new System.Data.Common.DataColumnMapping("name", "name")})});
			this.sqlDataAdapter4.UpdateCommand = this.sqlUpdateCommand4;

			// 
			// sqlSelectCommand5
			// 
			this.sqlSelectCommand5.CommandText = "SELECT HMAIN, HNAME, pvcode FROM dbo.HOSPITAL";
			this.sqlSelectCommand5.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand5
			// 
			this.sqlInsertCommand5.CommandText = "INSERT INTO dbo.HOSPITAL(HMAIN, HNAME, pvcode) VALUES (@HMAIN, @HNAME, @pvcode); " +
				"SELECT HMAIN, HNAME, pvcode FROM dbo.HOSPITAL WHERE (HMAIN = @HMAIN)";
			this.sqlInsertCommand5.Connection = this.sqlConnection1;
			this.sqlInsertCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HMAIN", System.Data.SqlDbType.VarChar, 5, "HMAIN"));
			this.sqlInsertCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HNAME", System.Data.SqlDbType.VarChar, 200, "HNAME"));
			this.sqlInsertCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pvcode", System.Data.SqlDbType.VarChar, 2, "pvcode"));
			// 
			// sqlUpdateCommand5
			// 
			this.sqlUpdateCommand5.CommandText = @"UPDATE dbo.HOSPITAL SET HMAIN = @HMAIN, HNAME = @HNAME, pvcode = @pvcode WHERE (HMAIN = @Original_HMAIN) AND (HNAME = @Original_HNAME OR @Original_HNAME IS NULL AND HNAME IS NULL) AND (pvcode = @Original_pvcode OR @Original_pvcode IS NULL AND pvcode IS NULL); SELECT HMAIN, HNAME, pvcode FROM dbo.HOSPITAL WHERE (HMAIN = @HMAIN)";
			this.sqlUpdateCommand5.Connection = this.sqlConnection1;
			this.sqlUpdateCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HMAIN", System.Data.SqlDbType.VarChar, 5, "HMAIN"));
			this.sqlUpdateCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HNAME", System.Data.SqlDbType.VarChar, 200, "HNAME"));
			this.sqlUpdateCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pvcode", System.Data.SqlDbType.VarChar, 2, "pvcode"));
			this.sqlUpdateCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HMAIN", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HNAME", System.Data.SqlDbType.VarChar, 200, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_pvcode", System.Data.SqlDbType.VarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "pvcode", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand5
			// 
			this.sqlDeleteCommand5.CommandText = "DELETE FROM dbo.HOSPITAL WHERE (HMAIN = @Original_HMAIN) AND (HNAME = @Original_H" +
				"NAME OR @Original_HNAME IS NULL AND HNAME IS NULL) AND (pvcode = @Original_pvcod" +
				"e OR @Original_pvcode IS NULL AND pvcode IS NULL)";
			this.sqlDeleteCommand5.Connection = this.sqlConnection1;
			this.sqlDeleteCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HMAIN", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HNAME", System.Data.SqlDbType.VarChar, 200, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand5.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_pvcode", System.Data.SqlDbType.VarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "pvcode", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter5
			// 
			this.sqlDataAdapter5.DeleteCommand = this.sqlDeleteCommand5;
			this.sqlDataAdapter5.InsertCommand = this.sqlInsertCommand5;
			this.sqlDataAdapter5.SelectCommand = this.sqlSelectCommand5;
			this.sqlDataAdapter5.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "HOSPITAL", new System.Data.Common.DataColumnMapping[] {
																																																				  new System.Data.Common.DataColumnMapping("HMAIN", "HMAIN"),
																																																				  new System.Data.Common.DataColumnMapping("HNAME", "HNAME"),
																																																				  new System.Data.Common.DataColumnMapping("pvcode", "pvcode")})});
			this.sqlDataAdapter5.UpdateCommand = this.sqlUpdateCommand5;
			// 
			// sqlSelectCommand6
			// 
			this.sqlSelectCommand6.CommandText = "SELECT PURCHASEPROVINCE, HMAIN, HNAME, HTYPE FROM dbo.HOSPITALMAIN";
			this.sqlSelectCommand6.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand6
			// 
			this.sqlInsertCommand6.CommandText = "INSERT INTO dbo.HOSPITALMAIN(PURCHASEPROVINCE, HMAIN, HNAME, HTYPE) VALUES (@PURC" +
				"HASEPROVINCE, @HMAIN, @HNAME, @HTYPE); SELECT PURCHASEPROVINCE, HMAIN, HNAME, HT" +
				"YPE FROM dbo.HOSPITALMAIN WHERE (HMAIN = @HMAIN) AND (PURCHASEPROVINCE = @PURCHA" +
				"SEPROVINCE)";
			this.sqlInsertCommand6.Connection = this.sqlConnection1;
			this.sqlInsertCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PURCHASEPROVINCE", System.Data.SqlDbType.VarChar, 4, "PURCHASEPROVINCE"));
			this.sqlInsertCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HMAIN", System.Data.SqlDbType.VarChar, 5, "HMAIN"));
			this.sqlInsertCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HNAME", System.Data.SqlDbType.VarChar, 200, "HNAME"));
			this.sqlInsertCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HTYPE", System.Data.SqlDbType.VarChar, 4, "HTYPE"));
			// 
			// sqlUpdateCommand6
			// 
			this.sqlUpdateCommand6.CommandText = @"UPDATE dbo.HOSPITALMAIN SET PURCHASEPROVINCE = @PURCHASEPROVINCE, HMAIN = @HMAIN, HNAME = @HNAME, HTYPE = @HTYPE WHERE (HMAIN = @Original_HMAIN) AND (PURCHASEPROVINCE = @Original_PURCHASEPROVINCE) AND (HNAME = @Original_HNAME OR @Original_HNAME IS NULL AND HNAME IS NULL) AND (HTYPE = @Original_HTYPE OR @Original_HTYPE IS NULL AND HTYPE IS NULL); SELECT PURCHASEPROVINCE, HMAIN, HNAME, HTYPE FROM dbo.HOSPITALMAIN WHERE (HMAIN = @HMAIN) AND (PURCHASEPROVINCE = @PURCHASEPROVINCE)";
			this.sqlUpdateCommand6.Connection = this.sqlConnection1;
			this.sqlUpdateCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PURCHASEPROVINCE", System.Data.SqlDbType.VarChar, 4, "PURCHASEPROVINCE"));
			this.sqlUpdateCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HMAIN", System.Data.SqlDbType.VarChar, 5, "HMAIN"));
			this.sqlUpdateCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HNAME", System.Data.SqlDbType.VarChar, 200, "HNAME"));
			this.sqlUpdateCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HTYPE", System.Data.SqlDbType.VarChar, 4, "HTYPE"));
			this.sqlUpdateCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HMAIN", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PURCHASEPROVINCE", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PURCHASEPROVINCE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HNAME", System.Data.SqlDbType.VarChar, 200, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HTYPE", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HTYPE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand6
			// 
			this.sqlDeleteCommand6.CommandText = @"DELETE FROM dbo.HOSPITALMAIN WHERE (HMAIN = @Original_HMAIN) AND (PURCHASEPROVINCE = @Original_PURCHASEPROVINCE) AND (HNAME = @Original_HNAME OR @Original_HNAME IS NULL AND HNAME IS NULL) AND (HTYPE = @Original_HTYPE OR @Original_HTYPE IS NULL AND HTYPE IS NULL)";
			this.sqlDeleteCommand6.Connection = this.sqlConnection1;
			this.sqlDeleteCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HMAIN", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PURCHASEPROVINCE", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PURCHASEPROVINCE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HNAME", System.Data.SqlDbType.VarChar, 200, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand6.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HTYPE", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HTYPE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter6
			// 
			this.sqlDataAdapter6.DeleteCommand = this.sqlDeleteCommand6;
			this.sqlDataAdapter6.InsertCommand = this.sqlInsertCommand6;
			this.sqlDataAdapter6.SelectCommand = this.sqlSelectCommand6;
			this.sqlDataAdapter6.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "HOSPITALMAIN", new System.Data.Common.DataColumnMapping[] {
																																																					  new System.Data.Common.DataColumnMapping("PURCHASEPROVINCE", "PURCHASEPROVINCE"),
																																																					  new System.Data.Common.DataColumnMapping("HMAIN", "HMAIN"),
																																																					  new System.Data.Common.DataColumnMapping("HNAME", "HNAME"),
																																																					  new System.Data.Common.DataColumnMapping("HTYPE", "HTYPE")})});
			this.sqlDataAdapter6.UpdateCommand = this.sqlUpdateCommand6;		
			//
			// TODO: Add constructor logic here
			//
		}

		public DataSet queryHealthy(String pid,String dateBill)
		{
			String tmp="SELECT * FROM CLEARING WHERE PID='"+pid+"' and DATE_BILL='"+dateBill+"'";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			return kucoke1;
		}

		public String insertClearing(HospitalClearing datainsert)
		{
			int tableIndex=0;
			DataSet olddata=new DataSet();
			sqlDataAdapter1.Fill(olddata);
			DataSet datachange =new DataSet();
			DataTable table1=olddata.Tables["CLEARING"];
			if(datainsert.Tables.Count>0)tableIndex=(datainsert.Tables.Count)-1;//เพราะว่า dataset ที่return มีตารางที่ไดนามิก มันเลยสร้างตารางใหม่
			String keep_pid=(String)datainsert.Tables[tableIndex].Rows[0][0];
			String keep_datebill=(String) datainsert.Tables[tableIndex].Rows[0][1];
			String sqlstr2 ="PID='"+keep_pid+"' and DATE_BILL='"+keep_datebill+"'";
			DataRow[] queryRows=table1.Select(sqlstr2);
			if (queryRows.Length==0)
			{
				DataRow createRows=table1.NewRow();
				//0 PID
				if(!datainsert.Tables[tableIndex].Rows[0][0].ToString().Equals("")){createRows[0]=(String)datainsert.Tables[tableIndex].Rows[0][0];}
				else{createRows[0]="";}
				//1 BILL_ID
				if(!datainsert.Tables[tableIndex].Rows[0][1].ToString().Equals("")){createRows[1]=(String)datainsert.Tables[tableIndex].Rows[0][1];}
				else{createRows[1]="";}
				//2 DATE_BILL
				if(!datainsert.Tables[tableIndex].Rows[0][2].ToString().Equals("")){createRows[2]=(String)datainsert.Tables[tableIndex].Rows[0][2];}
				else{createRows[2]="";}
				//3 DISEASE
				if(!datainsert.Tables[tableIndex].Rows[0][3].ToString().Equals("")){createRows[3]=(String)datainsert.Tables[tableIndex].Rows[0][3];}
				else{createRows[3]="";}
				//4 COST_MEDICINE
				if(!datainsert.Tables[tableIndex].Rows[0][4].ToString().Equals("")){createRows[4]=(int)datainsert.Tables[tableIndex].Rows[0][4];}
				else{createRows[4]="";}
				//5 COST_DOCTOR
				if(!datainsert.Tables[tableIndex].Rows[0][5].ToString().Equals("")){createRows[5]=(int)datainsert.Tables[tableIndex].Rows[0][5];}
				else{createRows[5]="";}
				//6 COST_ROOM
				if(!datainsert.Tables[tableIndex].Rows[0][6].ToString().Equals("")){createRows[6]=(int)datainsert.Tables[tableIndex].Rows[0][6];}
				else{createRows[6]="";}
				//7 COST_TREAT
				if(!datainsert.Tables[tableIndex].Rows[0][7].ToString().Equals("")){createRows[7]=(int)datainsert.Tables[tableIndex].Rows[0][7];}
				else{createRows[7]="";}
				//8 COST_OTHER
				if(!datainsert.Tables[tableIndex].Rows[0][8].ToString().Equals("")){createRows[8]=(String)datainsert.Tables[tableIndex].Rows[0][8];}
				else{createRows[8]="";}
				//9 COST_SUM
				if(!datainsert.Tables[tableIndex].Rows[0][9].ToString().Equals("")){createRows[9]=(int)datainsert.Tables[tableIndex].Rows[0][9];}
				else{createRows[9]="";}
				//10 HSTATUS
				if(!datainsert.Tables[tableIndex].Rows[0][10].ToString().Equals("")){createRows[10]=(String)datainsert.Tables[tableIndex].Rows[0][10];}
				else{createRows[10]="";}
				//11 HOSPMAIN
				if(!datainsert.Tables[tableIndex].Rows[0][11].ToString().Equals("")){createRows[11]=(String)datainsert.Tables[tableIndex].Rows[0][11];}
				else{createRows[11]="";}
				//12 HOSPSUB
				if(!datainsert.Tables[tableIndex].Rows[0][12].ToString().Equals("")){createRows[12]=(String)datainsert.Tables[tableIndex].Rows[0][12];}
				else{createRows[12]="";}
				//12 HOSPSTATUS
				if(!datainsert.Tables[tableIndex].Rows[0][13].ToString().Equals("")){createRows[13]=(String)datainsert.Tables[tableIndex].Rows[0][13];}
				else{createRows[13]="";}
				table1.Rows.Add(createRows);
				datachange=olddata.GetChanges(DataRowState.Added);
				sqlDataAdapter1.Update(datachange,"CLEARING");
			}

			return "Insert Success";
		}
		public String updateHealthy(HospitalClearing dataupdate)
		{

			int tableIndex=0;
			DataSet olddata=new DataSet();
			sqlDataAdapter1.Fill(olddata);
			DataSet datachange =new DataSet();
			DataTable table1=olddata.Tables["CLEARING"];
			if(dataupdate.Tables.Count>0)tableIndex=(dataupdate.Tables.Count)-1;//เพราะว่า dataset ที่return มีตารางที่ไดนามิก มันเลยสร้างตารางใหม่
			String keep_pid=(String)dataupdate.Tables[tableIndex].Rows[0][0];
			String keep_datebill=(String) dataupdate.Tables[tableIndex].Rows[0][1];
			String sqlstr2 ="PID='"+keep_pid+"' and DATE_BILL='"+keep_datebill+"'";
			DataRow[] queryRows=table1.Select(sqlstr2);
			if (queryRows.Length!=0)
			{
				if(dataupdate.Tables[tableIndex].Rows[0][0]!=null){queryRows[0][0]=(String)dataupdate.Tables[tableIndex].Rows[0][0];}
				else{queryRows[0][0]="";}
				//1 PROCODE
				if(dataupdate.Tables[tableIndex].Rows[0][1]!=null){queryRows[0][1]=(String)dataupdate.Tables[tableIndex].Rows[0][1];}
				else{queryRows[0][1]="";}
				//2 RESULT
				if(dataupdate.Tables[tableIndex].Rows[0][2]!=null){queryRows[0][2]=(String)dataupdate.Tables[tableIndex].Rows[0][2];}
				else{queryRows[0][2]="";}
				//3 TITLE
				if(dataupdate.Tables[tableIndex].Rows[0][3]!=null){queryRows[0][3]=(String)dataupdate.Tables[tableIndex].Rows[0][3];}
				else{queryRows[0][3]="";}
				//4 FNAME
				if(dataupdate.Tables[tableIndex].Rows[0][4]!=null){queryRows[0][4]=(String)dataupdate.Tables[tableIndex].Rows[0][4];}
				else{queryRows[0][4]="";}
				//5 LNAME
				if(dataupdate.Tables[tableIndex].Rows[0][5]!=null){queryRows[0][5]=(String)dataupdate.Tables[tableIndex].Rows[0][5];}
				else{queryRows[0][5]="";}
				//6 BDATE
				if(dataupdate.Tables[tableIndex].Rows[0][6]!=null){queryRows[0][6]=(String)dataupdate.Tables[tableIndex].Rows[0][6];}
				else{queryRows[0][6]="";}
				//7 CARDID
				if(dataupdate.Tables[tableIndex].Rows[0][7]!=null){queryRows[0][7]=(String)dataupdate.Tables[tableIndex].Rows[0][7];}
				else{queryRows[0][7]="";}
				//8 INSCL
				if(dataupdate.Tables[tableIndex].Rows[0][8]!=null){queryRows[0][8]=(String)dataupdate.Tables[tableIndex].Rows[0][8];}
				else{queryRows[0][8]="";}
				//9 HOSPMAIN
				if(dataupdate.Tables[tableIndex].Rows[0][9]!=null){queryRows[0][9]=(String)dataupdate.Tables[tableIndex].Rows[0][9];}
				else{queryRows[0][9]="";}
				//10 HOSPMAIN
				if(dataupdate.Tables[tableIndex].Rows[0][10]!=null){queryRows[0][10]=(String)dataupdate.Tables[tableIndex].Rows[0][10];}
				else{queryRows[0][10]="";}
				//11 IDATE
				if(dataupdate.Tables[tableIndex].Rows[0][11]!=null){queryRows[0][11]=(String)dataupdate.Tables[tableIndex].Rows[0][11];}
				else{queryRows[0][11]="";}
		
				datachange=olddata.GetChanges(DataRowState.Modified);
				sqlDataAdapter1.Update(datachange,"CLEARING");
			}			
			return "Update Success";
		}
		public String removeHealthy(String pid,String dateBill)
		{
			String sReturn="";
			DataSet olddata=new DataSet();
			sqlDataAdapter1.Fill(olddata);
			DataSet datachange =new DataSet();
			DataTable table1=olddata.Tables["CLEARING"];
			String sqlstr="PID='"+pid+"' and DATE_BILL='"+dateBill+"'";
			DataRow[] queryRows=table1.Select(sqlstr);
			if (queryRows.Length!=0)
			{//delete
				queryRows[0].Delete();
				datachange=olddata.GetChanges(DataRowState.Deleted);
				sqlDataAdapter1.Update(datachange,"CLEARING");
				sReturn="Remove Success";
			}
			else{sReturn="Not Found";}
			return sReturn;
		}


		public String getCurrentHosId()
		{
			String tmp="SELECT HMAIN FROM HOSPITAL_INFO";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			String result="";
			if (kucoke1.Tables[0].Rows.Count!=0) 
			{
				result=(String)kucoke1.Tables[0].Rows[0]["HMAIN"];			
			}
			return result;
		}
		public String getCurrentProvince()
		{
			String tmp="SELECT PURCHASEPROVINCE FROM HOSPITALMAIN WHERE (HMAIN =(SELECT HMAIN FROM  HOSPITAL_INFO))";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			String result="";
			if (kucoke1.Tables[0].Rows.Count!=0) 
			{
				result=(String)kucoke1.Tables[0].Rows[0]["PURCHASEPROVINCE"];			
			}
			return result;
		}
		
		//---------------------------- DATABASE About Detail -------------------------------
		public String queryProvince(String provinceId)
		{
			String tmp="SELECT name FROM province WHERE pvcode='"+provinceId+"'";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			String result="";
			if (kucoke1.Tables[0].Rows.Count!=0) 
			{
					result=(String)kucoke1.Tables[0].Rows[0]["name"];			
			}
			return result;
		}
		public String queryAmpher(String provinceId,String AmpherId)
		{
			String tmp="SELECT name FROM ampher WHERE pvcode='"+provinceId+"' and amcode='"+AmpherId+"'";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			String result="";
			if(kucoke1.Tables[0].Rows.Count!=0) result=(String)kucoke1.Tables[0].Rows[0]["name"];			
			return result;
		}
		public String queryTumbon(String provinceId,String AmpherId,String TumbonId)
		{
			String tmp="SELECT name FROM tumbon WHERE pvcode='"+provinceId+"' and amcode='"+AmpherId+"' and ttcode='"+TumbonId+"'";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			String result="";
			if(kucoke1.Tables[0].Rows.Count!=0) result=(String)kucoke1.Tables[0].Rows[0]["name"];			
			return result;
		}
		public String[] queryAllHospital()
		{
			String tmp="SELECT HNAME FROM HOSPITAL";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			int lengthofhos=kucoke1.Tables[0].Rows.Count;
			String[] result=new String[lengthofhos];
			for(int i=0;i<lengthofhos;i++)
			{
				if(kucoke1.Tables[0].Rows.Count!=0) result[i]=(String)kucoke1.Tables[0].Rows[i]["HNAME"];
				else result[i]="";
			}
			return result;
		}

		public String[] queryHospitalInProject(String pvcode)
		{
			String tmp="SELECT HNAME FROM HOSPITALMAIN WHERE PURCHASEPROVINCE='"+pvcode+"'";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			int lengthofhos=kucoke1.Tables[0].Rows.Count;
			String[] result=new String[lengthofhos];
			for(int i=0;i<lengthofhos;i++)
			{
				if(kucoke1.Tables[0].Rows.Count!=0) result[i]=(String)kucoke1.Tables[0].Rows[i]["HNAME"];
				else result[i]="";
			}
			return result;
		}

		public String getHospitalId(String hosName)
		{
			String tmp="SELECT HMAIN FROM HOSPITALMAIN WHERE HNAME='"+hosName+"'";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			String result="";
			if(kucoke1.Tables[0].Rows.Count!=0) result=(String)kucoke1.Tables[0].Rows[0]["HMAIN"];			
			return result;
		}
		public String getHospitalName(String hosId)
		{
			String tmp="SELECT HNAME FROM HOSPITALMAIN WHERE HMAIN='"+hosId+"'";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			String result="";
			if(kucoke1.Tables[0].Rows.Count!=0) result=(String)kucoke1.Tables[0].Rows[0]["HNAME"];			
			return result;
		}
		//-------------------------------------------------------------------------------
	}
}
