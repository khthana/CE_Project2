using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using HealthyData;
using HealthyService;
using System.IO;

namespace HealthyInsurance
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
		private System.Data.SqlClient.SqlCommand sqlSelectCommand3;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand3;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand3;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand3;
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
			this.sqlSelectCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter3 = new System.Data.SqlClient.SqlDataAdapter();
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "SELECT PID, PROCODE, RESULT, TITLE, FNAME, LNAME, BDATE, CARDID, INSCL, HOSPMAIN," +
				" HOSPSUB, IDATE, EDATE, SEX, NATION, OCCUPA, ADDRESS, MOO, TAMBON, AMPHUR, PROVI" +
				"NCE, STATUS FROM dbo.UCS_HEALTHY";
			this.sqlSelectCommand1.Connection = this.sqlConnection1;
			// 
			// sqlConnection1
			// 
			conStr="";
			try
			{
				String kucoke=Directory.GetCurrentDirectory();
				FileStream aFile=new FileStream(@"C:\Inetpub\configDBHealthy.txt",FileMode.Open);
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

//			this.sqlConnection1.ConnectionString = "data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security inf" +
//				"o=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";
			// 
			// sqlInsertCommand1
			// 
			this.sqlInsertCommand1.CommandText = @"INSERT INTO dbo.UCS_HEALTHY(PID, PROCODE, RESULT, TITLE, FNAME, LNAME, BDATE, CARDID, INSCL, HOSPMAIN, HOSPSUB, IDATE, EDATE, SEX, NATION, OCCUPA, ADDRESS, MOO, TAMBON, AMPHUR, PROVINCE, STATUS) VALUES (@PID, @PROCODE, @RESULT, @TITLE, @FNAME, @LNAME, @BDATE, @CARDID, @INSCL, @HOSPMAIN, @HOSPSUB, @IDATE, @EDATE, @SEX, @NATION, @OCCUPA, @ADDRESS, @MOO, @TAMBON, @AMPHUR, @PROVINCE, @STATUS); SELECT PID, PROCODE, RESULT, TITLE, FNAME, LNAME, BDATE, CARDID, INSCL, HOSPMAIN, HOSPSUB, IDATE, EDATE, SEX, NATION, OCCUPA, ADDRESS, MOO, TAMBON, AMPHUR, PROVINCE, STATUS FROM dbo.UCS_HEALTHY WHERE (PID = @PID)";
			this.sqlInsertCommand1.Connection = this.sqlConnection1;
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PROCODE", System.Data.SqlDbType.VarChar, 4, "PROCODE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RESULT", System.Data.SqlDbType.VarChar, 1, "RESULT"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TITLE", System.Data.SqlDbType.VarChar, 3, "TITLE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 30, "FNAME"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 30, "LNAME"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@BDATE", System.Data.SqlDbType.VarChar, 10, "BDATE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CARDID", System.Data.SqlDbType.VarChar, 15, "CARDID"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@INSCL", System.Data.SqlDbType.VarChar, 2, "INSCL"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPMAIN", System.Data.SqlDbType.VarChar, 5, "HOSPMAIN"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPSUB", System.Data.SqlDbType.VarChar, 5, "HOSPSUB"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@IDATE", System.Data.SqlDbType.VarChar, 10, "IDATE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@EDATE", System.Data.SqlDbType.VarChar, 10, "EDATE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SEX", System.Data.SqlDbType.VarChar, 1, "SEX"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@NATION", System.Data.SqlDbType.VarChar, 3, "NATION"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@OCCUPA", System.Data.SqlDbType.VarChar, 3, "OCCUPA"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADDRESS", System.Data.SqlDbType.VarChar, 75, "ADDRESS"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MOO", System.Data.SqlDbType.VarChar, 3, "MOO"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TAMBON", System.Data.SqlDbType.VarChar, 6, "TAMBON"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@AMPHUR", System.Data.SqlDbType.VarChar, 6, "AMPHUR"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PROVINCE", System.Data.SqlDbType.VarChar, 6, "PROVINCE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@STATUS", System.Data.SqlDbType.VarChar, 10, "STATUS"));
			// 
			// sqlUpdateCommand1
			// 
			this.sqlUpdateCommand1.CommandText = "UPDATE dbo.UCS_HEALTHY SET PID = @PID, PROCODE = @PROCODE, RESULT = @RESULT, TITL" +
				"E = @TITLE, FNAME = @FNAME, LNAME = @LNAME, BDATE = @BDATE, CARDID = @CARDID, IN" +
				"SCL = @INSCL, HOSPMAIN = @HOSPMAIN, HOSPSUB = @HOSPSUB, IDATE = @IDATE, EDATE = " +
				"@EDATE, SEX = @SEX, NATION = @NATION, OCCUPA = @OCCUPA, ADDRESS = @ADDRESS, MOO " +
				"= @MOO, TAMBON = @TAMBON, AMPHUR = @AMPHUR, PROVINCE = @PROVINCE, STATUS = @STAT" +
				"US WHERE (PID = @Original_PID) AND (ADDRESS = @Original_ADDRESS OR @Original_ADD" +
				"RESS IS NULL AND ADDRESS IS NULL) AND (AMPHUR = @Original_AMPHUR OR @Original_AM" +
				"PHUR IS NULL AND AMPHUR IS NULL) AND (BDATE = @Original_BDATE OR @Original_BDATE" +
				" IS NULL AND BDATE IS NULL) AND (CARDID = @Original_CARDID OR @Original_CARDID I" +
				"S NULL AND CARDID IS NULL) AND (EDATE = @Original_EDATE OR @Original_EDATE IS NU" +
				"LL AND EDATE IS NULL) AND (FNAME = @Original_FNAME OR @Original_FNAME IS NULL AN" +
				"D FNAME IS NULL) AND (HOSPMAIN = @Original_HOSPMAIN OR @Original_HOSPMAIN IS NUL" +
				"L AND HOSPMAIN IS NULL) AND (HOSPSUB = @Original_HOSPSUB OR @Original_HOSPSUB IS" +
				" NULL AND HOSPSUB IS NULL) AND (IDATE = @Original_IDATE OR @Original_IDATE IS NU" +
				"LL AND IDATE IS NULL) AND (INSCL = @Original_INSCL OR @Original_INSCL IS NULL AN" +
				"D INSCL IS NULL) AND (LNAME = @Original_LNAME OR @Original_LNAME IS NULL AND LNA" +
				"ME IS NULL) AND (MOO = @Original_MOO OR @Original_MOO IS NULL AND MOO IS NULL) A" +
				"ND (NATION = @Original_NATION OR @Original_NATION IS NULL AND NATION IS NULL) AN" +
				"D (OCCUPA = @Original_OCCUPA OR @Original_OCCUPA IS NULL AND OCCUPA IS NULL) AND" +
				" (PROCODE = @Original_PROCODE OR @Original_PROCODE IS NULL AND PROCODE IS NULL) " +
				"AND (PROVINCE = @Original_PROVINCE OR @Original_PROVINCE IS NULL AND PROVINCE IS" +
				" NULL) AND (RESULT = @Original_RESULT OR @Original_RESULT IS NULL AND RESULT IS " +
				"NULL) AND (SEX = @Original_SEX OR @Original_SEX IS NULL AND SEX IS NULL) AND (ST" +
				"ATUS = @Original_STATUS OR @Original_STATUS IS NULL AND STATUS IS NULL) AND (TAM" +
				"BON = @Original_TAMBON OR @Original_TAMBON IS NULL AND TAMBON IS NULL) AND (TITL" +
				"E = @Original_TITLE OR @Original_TITLE IS NULL AND TITLE IS NULL); SELECT PID, P" +
				"ROCODE, RESULT, TITLE, FNAME, LNAME, BDATE, CARDID, INSCL, HOSPMAIN, HOSPSUB, ID" +
				"ATE, EDATE, SEX, NATION, OCCUPA, ADDRESS, MOO, TAMBON, AMPHUR, PROVINCE, STATUS " +
				"FROM dbo.UCS_HEALTHY WHERE (PID = @PID)";
			this.sqlUpdateCommand1.Connection = this.sqlConnection1;
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PROCODE", System.Data.SqlDbType.VarChar, 4, "PROCODE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@RESULT", System.Data.SqlDbType.VarChar, 1, "RESULT"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TITLE", System.Data.SqlDbType.VarChar, 3, "TITLE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 30, "FNAME"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 30, "LNAME"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@BDATE", System.Data.SqlDbType.VarChar, 10, "BDATE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CARDID", System.Data.SqlDbType.VarChar, 15, "CARDID"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@INSCL", System.Data.SqlDbType.VarChar, 2, "INSCL"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPMAIN", System.Data.SqlDbType.VarChar, 5, "HOSPMAIN"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPSUB", System.Data.SqlDbType.VarChar, 5, "HOSPSUB"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@IDATE", System.Data.SqlDbType.VarChar, 10, "IDATE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@EDATE", System.Data.SqlDbType.VarChar, 10, "EDATE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SEX", System.Data.SqlDbType.VarChar, 1, "SEX"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@NATION", System.Data.SqlDbType.VarChar, 3, "NATION"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@OCCUPA", System.Data.SqlDbType.VarChar, 3, "OCCUPA"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADDRESS", System.Data.SqlDbType.VarChar, 75, "ADDRESS"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MOO", System.Data.SqlDbType.VarChar, 3, "MOO"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TAMBON", System.Data.SqlDbType.VarChar, 6, "TAMBON"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@AMPHUR", System.Data.SqlDbType.VarChar, 6, "AMPHUR"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PROVINCE", System.Data.SqlDbType.VarChar, 6, "PROVINCE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@STATUS", System.Data.SqlDbType.VarChar, 10, "STATUS"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_ADDRESS", System.Data.SqlDbType.VarChar, 75, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "ADDRESS", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_AMPHUR", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "AMPHUR", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_BDATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "BDATE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_CARDID", System.Data.SqlDbType.VarChar, 15, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "CARDID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_EDATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "EDATE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FNAME", System.Data.SqlDbType.VarChar, 30, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPMAIN", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPSUB", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPSUB", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_IDATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "IDATE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_INSCL", System.Data.SqlDbType.VarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "INSCL", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_LNAME", System.Data.SqlDbType.VarChar, 30, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "LNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_MOO", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "MOO", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_NATION", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "NATION", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_OCCUPA", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "OCCUPA", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PROCODE", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PROCODE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PROVINCE", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PROVINCE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_RESULT", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "RESULT", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_SEX", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "SEX", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_STATUS", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "STATUS", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TAMBON", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TAMBON", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TITLE", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TITLE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand1
			// 
			this.sqlDeleteCommand1.CommandText = "DELETE FROM dbo.UCS_HEALTHY WHERE (PID = @Original_PID) AND (ADDRESS = @Original_" +
				"ADDRESS OR @Original_ADDRESS IS NULL AND ADDRESS IS NULL) AND (AMPHUR = @Origina" +
				"l_AMPHUR OR @Original_AMPHUR IS NULL AND AMPHUR IS NULL) AND (BDATE = @Original_" +
				"BDATE OR @Original_BDATE IS NULL AND BDATE IS NULL) AND (CARDID = @Original_CARD" +
				"ID OR @Original_CARDID IS NULL AND CARDID IS NULL) AND (EDATE = @Original_EDATE " +
				"OR @Original_EDATE IS NULL AND EDATE IS NULL) AND (FNAME = @Original_FNAME OR @O" +
				"riginal_FNAME IS NULL AND FNAME IS NULL) AND (HOSPMAIN = @Original_HOSPMAIN OR @" +
				"Original_HOSPMAIN IS NULL AND HOSPMAIN IS NULL) AND (HOSPSUB = @Original_HOSPSUB" +
				" OR @Original_HOSPSUB IS NULL AND HOSPSUB IS NULL) AND (IDATE = @Original_IDATE " +
				"OR @Original_IDATE IS NULL AND IDATE IS NULL) AND (INSCL = @Original_INSCL OR @O" +
				"riginal_INSCL IS NULL AND INSCL IS NULL) AND (LNAME = @Original_LNAME OR @Origin" +
				"al_LNAME IS NULL AND LNAME IS NULL) AND (MOO = @Original_MOO OR @Original_MOO IS" +
				" NULL AND MOO IS NULL) AND (NATION = @Original_NATION OR @Original_NATION IS NUL" +
				"L AND NATION IS NULL) AND (OCCUPA = @Original_OCCUPA OR @Original_OCCUPA IS NULL" +
				" AND OCCUPA IS NULL) AND (PROCODE = @Original_PROCODE OR @Original_PROCODE IS NU" +
				"LL AND PROCODE IS NULL) AND (PROVINCE = @Original_PROVINCE OR @Original_PROVINCE" +
				" IS NULL AND PROVINCE IS NULL) AND (RESULT = @Original_RESULT OR @Original_RESUL" +
				"T IS NULL AND RESULT IS NULL) AND (SEX = @Original_SEX OR @Original_SEX IS NULL " +
				"AND SEX IS NULL) AND (STATUS = @Original_STATUS OR @Original_STATUS IS NULL AND " +
				"STATUS IS NULL) AND (TAMBON = @Original_TAMBON OR @Original_TAMBON IS NULL AND T" +
				"AMBON IS NULL) AND (TITLE = @Original_TITLE OR @Original_TITLE IS NULL AND TITLE" +
				" IS NULL)";
			this.sqlDeleteCommand1.Connection = this.sqlConnection1;
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_ADDRESS", System.Data.SqlDbType.VarChar, 75, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "ADDRESS", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_AMPHUR", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "AMPHUR", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_BDATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "BDATE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_CARDID", System.Data.SqlDbType.VarChar, 15, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "CARDID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_EDATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "EDATE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FNAME", System.Data.SqlDbType.VarChar, 30, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPMAIN", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPSUB", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPSUB", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_IDATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "IDATE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_INSCL", System.Data.SqlDbType.VarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "INSCL", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_LNAME", System.Data.SqlDbType.VarChar, 30, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "LNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_MOO", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "MOO", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_NATION", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "NATION", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_OCCUPA", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "OCCUPA", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PROCODE", System.Data.SqlDbType.VarChar, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PROCODE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PROVINCE", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PROVINCE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_RESULT", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "RESULT", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_SEX", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "SEX", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_STATUS", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "STATUS", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TAMBON", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TAMBON", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TITLE", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TITLE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter1
			// 
			this.sqlDataAdapter1.DeleteCommand = this.sqlDeleteCommand1;
			this.sqlDataAdapter1.InsertCommand = this.sqlInsertCommand1;
			this.sqlDataAdapter1.SelectCommand = this.sqlSelectCommand1;
			this.sqlDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "UCS_HEALTHY", new System.Data.Common.DataColumnMapping[] {
																																																					 new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																					 new System.Data.Common.DataColumnMapping("PROCODE", "PROCODE"),
																																																					 new System.Data.Common.DataColumnMapping("RESULT", "RESULT"),
																																																					 new System.Data.Common.DataColumnMapping("TITLE", "TITLE"),
																																																					 new System.Data.Common.DataColumnMapping("FNAME", "FNAME"),
																																																					 new System.Data.Common.DataColumnMapping("LNAME", "LNAME"),
																																																					 new System.Data.Common.DataColumnMapping("BDATE", "BDATE"),
																																																					 new System.Data.Common.DataColumnMapping("CARDID", "CARDID"),
																																																					 new System.Data.Common.DataColumnMapping("INSCL", "INSCL"),
																																																					 new System.Data.Common.DataColumnMapping("HOSPMAIN", "HOSPMAIN"),
																																																					 new System.Data.Common.DataColumnMapping("HOSPSUB", "HOSPSUB"),
																																																					 new System.Data.Common.DataColumnMapping("IDATE", "IDATE"),
																																																					 new System.Data.Common.DataColumnMapping("EDATE", "EDATE"),
																																																					 new System.Data.Common.DataColumnMapping("SEX", "SEX"),
																																																					 new System.Data.Common.DataColumnMapping("NATION", "NATION"),
																																																					 new System.Data.Common.DataColumnMapping("OCCUPA", "OCCUPA"),
																																																					 new System.Data.Common.DataColumnMapping("ADDRESS", "ADDRESS"),
																																																					 new System.Data.Common.DataColumnMapping("MOO", "MOO"),
																																																					 new System.Data.Common.DataColumnMapping("TAMBON", "TAMBON"),
																																																					 new System.Data.Common.DataColumnMapping("AMPHUR", "AMPHUR"),
																																																					 new System.Data.Common.DataColumnMapping("PROVINCE", "PROVINCE"),
																																																					 new System.Data.Common.DataColumnMapping("STATUS", "STATUS")})});
			this.sqlDataAdapter1.UpdateCommand = this.sqlUpdateCommand1;
			// 
			// sqlSelectCommand2
			// 
			this.sqlSelectCommand2.CommandText = "SELECT PID, changeHos, ACCIDENT FROM dbo.Count_Edit_HOS";
			this.sqlSelectCommand2.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand2
			// 
			this.sqlInsertCommand2.CommandText = "INSERT INTO dbo.Count_Edit_HOS(PID, changeHos, ACCIDENT) VALUES (@PID, @changeHos" +
				", @ACCIDENT); SELECT PID, changeHos, ACCIDENT FROM dbo.Count_Edit_HOS WHERE (PID" +
				" = @PID)";
			this.sqlInsertCommand2.Connection = this.sqlConnection1;
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@changeHos", System.Data.SqlDbType.Int, 4, "changeHos"));
			this.sqlInsertCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ACCIDENT", System.Data.SqlDbType.Int, 4, "ACCIDENT"));
			// 
			// sqlUpdateCommand2
			// 
			this.sqlUpdateCommand2.CommandText = @"UPDATE dbo.Count_Edit_HOS SET PID = @PID, changeHos = @changeHos, ACCIDENT = @ACCIDENT WHERE (PID = @Original_PID) AND (ACCIDENT = @Original_ACCIDENT OR @Original_ACCIDENT IS NULL AND ACCIDENT IS NULL) AND (changeHos = @Original_changeHos OR @Original_changeHos IS NULL AND changeHos IS NULL); SELECT PID, changeHos, ACCIDENT FROM dbo.Count_Edit_HOS WHERE (PID = @PID)";
			this.sqlUpdateCommand2.Connection = this.sqlConnection1;
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@changeHos", System.Data.SqlDbType.Int, 4, "changeHos"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ACCIDENT", System.Data.SqlDbType.Int, 4, "ACCIDENT"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_ACCIDENT", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "ACCIDENT", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_changeHos", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "changeHos", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand2
			// 
			this.sqlDeleteCommand2.CommandText = "DELETE FROM dbo.Count_Edit_HOS WHERE (PID = @Original_PID) AND (ACCIDENT = @Origi" +
				"nal_ACCIDENT OR @Original_ACCIDENT IS NULL AND ACCIDENT IS NULL) AND (changeHos " +
				"= @Original_changeHos OR @Original_changeHos IS NULL AND changeHos IS NULL)";
			this.sqlDeleteCommand2.Connection = this.sqlConnection1;
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_ACCIDENT", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "ACCIDENT", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_changeHos", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "changeHos", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter2
			// 
			this.sqlDataAdapter2.DeleteCommand = this.sqlDeleteCommand2;
			this.sqlDataAdapter2.InsertCommand = this.sqlInsertCommand2;
			this.sqlDataAdapter2.SelectCommand = this.sqlSelectCommand2;
			this.sqlDataAdapter2.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "Count_Edit_HOS", new System.Data.Common.DataColumnMapping[] {
																																																						new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																						new System.Data.Common.DataColumnMapping("changeHos", "changeHos"),
																																																						new System.Data.Common.DataColumnMapping("ACCIDENT", "ACCIDENT")})});
			this.sqlDataAdapter2.UpdateCommand = this.sqlUpdateCommand2;
			// 
			// sqlSelectCommand3
			// 
			this.sqlSelectCommand3.CommandText = "SELECT HOSPMAIN, HOSPSUB, PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_D" +
				"OCTOR, COST_ROOM, COST_TREAT, COST_OTHER, COST_SUM FROM dbo.CLEARING";
			this.sqlSelectCommand3.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand3
			// 
			this.sqlInsertCommand3.CommandText = @"INSERT INTO dbo.CLEARING(HOSPMAIN, HOSPSUB, PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, COST_ROOM, COST_TREAT, COST_OTHER, COST_SUM) VALUES (@HOSPMAIN, @HOSPSUB, @PID, @BILL_ID, @DATE_BILL, @DISEASE, @COST_MEDICINE, @COST_DOCTOR, @COST_ROOM, @COST_TREAT, @COST_OTHER, @COST_SUM); SELECT HOSPMAIN, HOSPSUB, PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, COST_ROOM, COST_TREAT, COST_OTHER, COST_SUM FROM dbo.CLEARING WHERE (BILL_ID = @BILL_ID) AND (DATE_BILL = @DATE_BILL) AND (HOSPMAIN = @HOSPMAIN) AND (HOSPSUB = @HOSPSUB) AND (PID = @PID)";
			this.sqlInsertCommand3.Connection = this.sqlConnection1;
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPMAIN", System.Data.SqlDbType.VarChar, 5, "HOSPMAIN"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPSUB", System.Data.SqlDbType.VarChar, 5, "HOSPSUB"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@BILL_ID", System.Data.SqlDbType.VarChar, 20, "BILL_ID"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE_BILL", System.Data.SqlDbType.VarChar, 10, "DATE_BILL"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DISEASE", System.Data.SqlDbType.VarChar, 50, "DISEASE"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_MEDICINE", System.Data.SqlDbType.Int, 4, "COST_MEDICINE"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_DOCTOR", System.Data.SqlDbType.Int, 4, "COST_DOCTOR"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_ROOM", System.Data.SqlDbType.Int, 4, "COST_ROOM"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_TREAT", System.Data.SqlDbType.Int, 4, "COST_TREAT"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_OTHER", System.Data.SqlDbType.VarChar, 50, "COST_OTHER"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_SUM", System.Data.SqlDbType.Int, 4, "COST_SUM"));
			// 
			// sqlUpdateCommand3
			// 
			this.sqlUpdateCommand3.CommandText = @"UPDATE dbo.CLEARING SET HOSPMAIN = @HOSPMAIN, HOSPSUB = @HOSPSUB, PID = @PID, BILL_ID = @BILL_ID, DATE_BILL = @DATE_BILL, DISEASE = @DISEASE, COST_MEDICINE = @COST_MEDICINE, COST_DOCTOR = @COST_DOCTOR, COST_ROOM = @COST_ROOM, COST_TREAT = @COST_TREAT, COST_OTHER = @COST_OTHER, COST_SUM = @COST_SUM WHERE (BILL_ID = @Original_BILL_ID) AND (DATE_BILL = @Original_DATE_BILL) AND (HOSPMAIN = @Original_HOSPMAIN) AND (HOSPSUB = @Original_HOSPSUB) AND (PID = @Original_PID) AND (COST_DOCTOR = @Original_COST_DOCTOR OR @Original_COST_DOCTOR IS NULL AND COST_DOCTOR IS NULL) AND (COST_MEDICINE = @Original_COST_MEDICINE OR @Original_COST_MEDICINE IS NULL AND COST_MEDICINE IS NULL) AND (COST_OTHER = @Original_COST_OTHER OR @Original_COST_OTHER IS NULL AND COST_OTHER IS NULL) AND (COST_ROOM = @Original_COST_ROOM OR @Original_COST_ROOM IS NULL AND COST_ROOM IS NULL) AND (COST_SUM = @Original_COST_SUM OR @Original_COST_SUM IS NULL AND COST_SUM IS NULL) AND (COST_TREAT = @Original_COST_TREAT OR @Original_COST_TREAT IS NULL AND COST_TREAT IS NULL) AND (DISEASE = @Original_DISEASE OR @Original_DISEASE IS NULL AND DISEASE IS NULL); SELECT HOSPMAIN, HOSPSUB, PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, COST_ROOM, COST_TREAT, COST_OTHER, COST_SUM FROM dbo.CLEARING WHERE (BILL_ID = @BILL_ID) AND (DATE_BILL = @DATE_BILL) AND (HOSPMAIN = @HOSPMAIN) AND (HOSPSUB = @HOSPSUB) AND (PID = @PID)";
			this.sqlUpdateCommand3.Connection = this.sqlConnection1;
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPMAIN", System.Data.SqlDbType.VarChar, 5, "HOSPMAIN"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HOSPSUB", System.Data.SqlDbType.VarChar, 5, "HOSPSUB"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@BILL_ID", System.Data.SqlDbType.VarChar, 20, "BILL_ID"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE_BILL", System.Data.SqlDbType.VarChar, 10, "DATE_BILL"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DISEASE", System.Data.SqlDbType.VarChar, 50, "DISEASE"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_MEDICINE", System.Data.SqlDbType.Int, 4, "COST_MEDICINE"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_DOCTOR", System.Data.SqlDbType.Int, 4, "COST_DOCTOR"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_ROOM", System.Data.SqlDbType.Int, 4, "COST_ROOM"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_TREAT", System.Data.SqlDbType.Int, 4, "COST_TREAT"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_OTHER", System.Data.SqlDbType.VarChar, 50, "COST_OTHER"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@COST_SUM", System.Data.SqlDbType.Int, 4, "COST_SUM"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_BILL_ID", System.Data.SqlDbType.VarChar, 20, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "BILL_ID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE_BILL", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE_BILL", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPMAIN", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPSUB", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPSUB", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_DOCTOR", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_DOCTOR", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_MEDICINE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_MEDICINE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_OTHER", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_OTHER", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_ROOM", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_ROOM", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_SUM", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_SUM", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_TREAT", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_TREAT", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DISEASE", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DISEASE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand3
			// 
			this.sqlDeleteCommand3.CommandText = @"DELETE FROM dbo.CLEARING WHERE (BILL_ID = @Original_BILL_ID) AND (DATE_BILL = @Original_DATE_BILL) AND (HOSPMAIN = @Original_HOSPMAIN) AND (HOSPSUB = @Original_HOSPSUB) AND (PID = @Original_PID) AND (COST_DOCTOR = @Original_COST_DOCTOR OR @Original_COST_DOCTOR IS NULL AND COST_DOCTOR IS NULL) AND (COST_MEDICINE = @Original_COST_MEDICINE OR @Original_COST_MEDICINE IS NULL AND COST_MEDICINE IS NULL) AND (COST_OTHER = @Original_COST_OTHER OR @Original_COST_OTHER IS NULL AND COST_OTHER IS NULL) AND (COST_ROOM = @Original_COST_ROOM OR @Original_COST_ROOM IS NULL AND COST_ROOM IS NULL) AND (COST_SUM = @Original_COST_SUM OR @Original_COST_SUM IS NULL AND COST_SUM IS NULL) AND (COST_TREAT = @Original_COST_TREAT OR @Original_COST_TREAT IS NULL AND COST_TREAT IS NULL) AND (DISEASE = @Original_DISEASE OR @Original_DISEASE IS NULL AND DISEASE IS NULL)";
			this.sqlDeleteCommand3.Connection = this.sqlConnection1;
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_BILL_ID", System.Data.SqlDbType.VarChar, 20, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "BILL_ID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE_BILL", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE_BILL", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPMAIN", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPMAIN", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_HOSPSUB", System.Data.SqlDbType.VarChar, 5, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "HOSPSUB", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_DOCTOR", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_DOCTOR", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_MEDICINE", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_MEDICINE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_OTHER", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_OTHER", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_ROOM", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_ROOM", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_SUM", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_SUM", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_COST_TREAT", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "COST_TREAT", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DISEASE", System.Data.SqlDbType.VarChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DISEASE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter3
			// 
			this.sqlDataAdapter3.DeleteCommand = this.sqlDeleteCommand3;
			this.sqlDataAdapter3.InsertCommand = this.sqlInsertCommand3;
			this.sqlDataAdapter3.SelectCommand = this.sqlSelectCommand3;
			this.sqlDataAdapter3.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "CLEARING", new System.Data.Common.DataColumnMapping[] {
																																																				  new System.Data.Common.DataColumnMapping("HOSPMAIN", "HOSPMAIN"),
																																																				  new System.Data.Common.DataColumnMapping("HOSPSUB", "HOSPSUB"),
																																																				  new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																				  new System.Data.Common.DataColumnMapping("BILL_ID", "BILL_ID"),
																																																				  new System.Data.Common.DataColumnMapping("DATE_BILL", "DATE_BILL"),
																																																				  new System.Data.Common.DataColumnMapping("DISEASE", "DISEASE"),
																																																				  new System.Data.Common.DataColumnMapping("COST_MEDICINE", "COST_MEDICINE"),
																																																				  new System.Data.Common.DataColumnMapping("COST_DOCTOR", "COST_DOCTOR"),
																																																				  new System.Data.Common.DataColumnMapping("COST_ROOM", "COST_ROOM"),
																																																				  new System.Data.Common.DataColumnMapping("COST_TREAT", "COST_TREAT"),
																																																				  new System.Data.Common.DataColumnMapping("COST_OTHER", "COST_OTHER"),
																																																				  new System.Data.Common.DataColumnMapping("COST_SUM", "COST_SUM")})});
			this.sqlDataAdapter3.UpdateCommand = this.sqlUpdateCommand3;

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
		public DataSet queryHealthy(String pid)
		{
			int status=0;
			DataSet keepDataset =new DataSet();
			DataHealthy datahealthy= new DataHealthy();
			try
			{
				keepDataset=datahealthy.queryHealthy(pid);
				if(keepDataset.Tables[0].Rows.Count==0)
				{
					//Console.WriteLine("Not Found IN Data Healthy");
					keepDataset=datahealthy.querySocial(pid);
					if(keepDataset.Tables[0].Rows.Count==0)
					{
						//Console.WriteLine("Not Found IN Data Social");
						keepDataset=datahealthy.queryPeople(pid);
						int tableIndex=keepDataset.Tables.Count-1;//เพราะว่า dataset ที่return มีตารางที่ไดนามิก มันเลยสร้างตารางใหม่
						if((keepDataset.Tables[tableIndex].Rows.Count!=0)&&(tableIndex==0))
						{
							//has officer
							status=3;						
						}
						else
						{
							//Console.WriteLine("Not Found IN Data People");
							//status =0;
							keepDataset.Tables.RemoveAt(0);
						}					
					}
					else
					{//has social
						status=2;
					}
				}
				else
				{//has healthy
					status=1;
				}

				keepDataset.Tables[0].Columns.Add("HSTATUS");
				keepDataset.Tables[0].Rows[0]["HSTATUS"]=status;
			}
			catch(Exception e){Console.WriteLine(e.StackTrace);}
			return keepDataset;
		}

		[WebMethod]
		public string registerHealthy(RegisterDataset inputData)
		{
			String result="";
			try
			{


				int tableIndex=0;
				String pid=(String)inputData.Tables[tableIndex].Rows[0]["PID"];
				DataSet keepDataset=queryHealthy(pid);
				if (keepDataset.Tables[0].Rows[0]["HSTATUS"].ToString().Equals("0"))
				{	

					IFormatProvider cultureEng = new System.Globalization.CultureInfo("en-US",true);
					DateTime time=new DateTime();
					time=DateTime.Today;
					String[] tmp=time.GetDateTimeFormats('d',cultureEng);			


					RegisterDataset alldata=new RegisterDataset();
					DataSet datachange=new DataSet();
					sqlDataAdapter1.Fill(alldata);
					DataTable table1=alldata.Tables["UCS_HEALTHY"];
					DataRow createRows=table1.NewRow();
					//0 PID
					if(inputData.Tables[tableIndex].Rows[0][0].ToString().Length!=0){createRows[0]=(String)inputData.Tables[tableIndex].Rows[0][0];}
					else{createRows[0]="";}
					//1 PROCODE
					if(inputData.Tables[tableIndex].Rows[0][1].ToString().Length!=0){createRows[1]=(String)inputData.Tables[tableIndex].Rows[0][1];}
					else{createRows[1]="";}
					//2 RESULT################
					if(inputData.Tables[tableIndex].Rows[0][2].ToString().Length!=0){createRows[2]=(String)inputData.Tables[tableIndex].Rows[0][2];}
					else{createRows[2]="";}
					//3 TITLE
					if(inputData.Tables[tableIndex].Rows[0][3].ToString().Length!=0){createRows[3]=(String)inputData.Tables[tableIndex].Rows[0][3];}
					else{createRows[3]="";}
					//4 FNAME
					if(inputData.Tables[tableIndex].Rows[0][4].ToString().Length!=0){createRows[4]=(String)inputData.Tables[tableIndex].Rows[0][4];}
					else{createRows[4]="";}
					//5 LNAME
					if(inputData.Tables[tableIndex].Rows[0][5].ToString().Length!=0){createRows[5]=(String)inputData.Tables[tableIndex].Rows[0][5];}
					else{createRows[5]="";}
					//6 BDATE
					if(inputData.Tables[tableIndex].Rows[0][6].ToString().Length!=0){createRows[6]=(String)inputData.Tables[tableIndex].Rows[0][6];}
					else{createRows[6]="";}
					//7 CARDID---------------
					try
					{
						SqlDataAdapter forcard=new SqlDataAdapter("SELECT MAX(CONVERT(numeric, CARDID)) FROM UCS_HEALTHY",sqlConnection1);
						DataSet rubidcard=new DataSet();
						forcard.Fill(rubidcard);
						String x=rubidcard.Tables[0].Rows[0][0].ToString();
						int cardid=0;
						if(!x.Equals(""))
						{
							cardid=Int32.Parse(x);
						}
						cardid++;
						createRows[7]=cardid;
					}
					catch(Exception e)
					{
						createRows[7]=1;
						Console.WriteLine(e.StackTrace);
					}
					//8 INSCL#################
					if(inputData.Tables[tableIndex].Rows[0][8].ToString().Length!=0){createRows[8]=(String)inputData.Tables[tableIndex].Rows[0][8];}
					else{createRows[8]="";}
					//9 HOSPMAIN
					if(inputData.Tables[tableIndex].Rows[0][9].ToString().Length!=0){createRows[9]=(String)inputData.Tables[tableIndex].Rows[0][9];}
					else{createRows[9]="";}
					//10 HOSPSUB
					if(inputData.Tables[tableIndex].Rows[0][10].ToString().Length!=0){createRows[10]=(String)inputData.Tables[tableIndex].Rows[0][10];}
					else{createRows[10]="";}
					try
					{
						//11 IDATE----------------
						createRows[11]=tmp[3];

						//12 EDATE----------------

						String tempcut=tmp[3];

						int year =Int32.Parse(tempcut.Substring(6));
						year=year+5;
						String day = tempcut.Substring(3,2);
						String month = tempcut.Substring(0,2);

						createRows[12]=month+"/"+day+"/"+year;
					}
					catch
					{
						createRows[11]="";
						createRows[12]="";
					}

					//13 SEX
					if(inputData.Tables[tableIndex].Rows[0][13].ToString().Length!=0){createRows[13]=(String)inputData.Tables[tableIndex].Rows[0][13];}
					else{createRows[13]="";}
					//14 NATION#################
					if(inputData.Tables[tableIndex].Rows[0][14].ToString().Length!=0){createRows[14]=(String)inputData.Tables[tableIndex].Rows[0][14];}
					else{createRows[14]="";}
					//15 OCCUPA#################
					if(inputData.Tables[tableIndex].Rows[0][15].ToString().Length!=0){createRows[15]=(String)inputData.Tables[tableIndex].Rows[0][15];}
					else{createRows[15]="";}
					//16 ADDRESS
					if(inputData.Tables[tableIndex].Rows[0][16].ToString().Length!=0){createRows[16]=(String)inputData.Tables[tableIndex].Rows[0][16];}
					else{createRows[16]="";}
					//17 MOO
					if(inputData.Tables[tableIndex].Rows[0][17].ToString().Length!=0){createRows[17]=(String)inputData.Tables[tableIndex].Rows[0][17];}
					else{createRows[17]="";}
					//18 TAMBON
					if(inputData.Tables[tableIndex].Rows[0][18].ToString().Length!=0){createRows[18]=(String)inputData.Tables[tableIndex].Rows[0][18];}
					else{createRows[18]="";}
					//19 AMPHUR
					if(inputData.Tables[tableIndex].Rows[0][19].ToString().Length!=0){createRows[19]=(String)inputData.Tables[tableIndex].Rows[0][19];}
					else{createRows[19]="";}
					//20 PROVINCE
					if(inputData.Tables[tableIndex].Rows[0][20].ToString().Length!=0){createRows[20]=(String)inputData.Tables[tableIndex].Rows[0][20];}
					else{createRows[20]="";}
					//21 STATUS
					if(inputData.Tables[tableIndex].Rows[0][21].ToString().Length!=0){createRows[21]=(String)inputData.Tables[tableIndex].Rows[0][21];}
					else{createRows[21]="";}	
					table1.Rows.Add(createRows);
					datachange=alldata.GetChanges(DataRowState.Added);
					sqlDataAdapter1.Update(datachange,"UCS_HEALTHY");
					// for logfile regis
					//String strConn="data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";
					SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From LogfileRegister",conStr);
					SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

					DataSet dataSet1=new DataSet();
					DataSet dataChange1=new DataSet();
					DataTable logtable=new DataTable();
					logfileAdapter.Fill(dataSet1);
					logtable=dataSet1.Tables[0];

					DataRow logrow=logtable.NewRow();
					logrow["PID"]=createRows[0];
					logrow["DATE_REGIS"]=tmp[5];
					logtable.Rows.Add(logrow);
					dataChange1=dataSet1.GetChanges(DataRowState.Added);
					logfileAdapter.Update(dataChange1);
					//for logfile regis
				}
				else{result="You Can't Register because You have already insurance";}
			}
			catch(Exception e){Console.WriteLine(e.StackTrace);}
			return result;
		}

		[WebMethod]
		public string updateHealthy(String pid,String hmain,String hsub)
		{
			String result="";
			bool flag=false;
			//			try
		{
			//------------------------------ FOR GET RULE--------------------------------
					String Changhos;
					String Accident;
					//String strConn="data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";
					SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From HEALTHY_INFO",conStr);
					SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

					DataSet dataSet1=new DataSet();
					DataTable logtable=new DataTable();
					logfileAdapter.Fill(dataSet1);
					logtable=dataSet1.Tables[0];


					DataRow[] getAttr=logtable.Select("ID=0");
					if(getAttr[0]["CHANGE_HOS"]!=null)
					{
						Changhos=(String)getAttr[0]["CHANGE_HOS"];
					}
					else{Changhos="0";}

					if(getAttr[0]["CHANGE_HOS"]!=null)
					{
						Accident=(String)getAttr[0]["ACCIDENT"];
					}
					else{Accident="0";}						
					//-----------------------------------------------------------------

					DataSet testTimechangeDataset=new DataSet();
					sqlDataAdapter2.Fill(testTimechangeDataset);
					DataTable testTimechangeTable=testTimechangeDataset.Tables["Count_Edit_HOS"];
					String sqlstr="pid=\'"+pid+"\'";
					DataRow[] queryRows=testTimechangeTable.Select(sqlstr);
					if(queryRows.Length!=0)
					{
						//count < 2 flag =true;
						int tmp=(Int32)queryRows[0]["changeHos"];
						if(tmp>0)//ไว้ตรวจดูว่าตกลงได้กี่ครั้งแน่ในการเปลี่ยนโรงพยาบาล
						{ 
							flag=true;
							queryRows[0]["changeHos"]=tmp-1;
							DataSet datachange=new DataSet();
							datachange=testTimechangeDataset.GetChanges(DataRowState.Modified);
							sqlDataAdapter2.Update(datachange,"Count_Edit_HOS");
						}
					}
					else
					{
						flag=true;				
						//insert row  update ครั้งแรก สร้างตารางให้
						PrivilegeDataset datasetInsert=new PrivilegeDataset();
						DataTable tableInsert=datasetInsert.Count_Edit_HOS;
						DataRow addRow=tableInsert.NewRow();
						addRow["PID"]=pid;
						addRow["changeHos"]=Int32.Parse(Changhos)-1;	//ตั้งค่าเริ่มต้น
						addRow["ACCIDENT"]=Accident;					//ตั้งค่าเริ่มต้น
						tableInsert.Rows.Add(addRow);
						DataSet datachange=new DataSet();
						datachange=datasetInsert.GetChanges(DataRowState.Added);
						sqlDataAdapter2.Update(datachange,"Count_Edit_HOS");					
					}

					if(flag)
					{
						DataHealthy searchToUpdate=new DataHealthy();
						DataSet datasetOutput=searchToUpdate.queryHealthy(pid);
						if(datasetOutput.Tables[0].Rows.Count!=0)
						{
							DataRow rowoutput=datasetOutput.Tables[0].Rows[0];
							RegisterDataset datasetUpdate=new RegisterDataset();
							// insert old input
							DataTable table1=datasetUpdate.Tables[0];
							DataRow updateRows=table1.NewRow();

							for(int i=0;i<22;i++)
							{
								updateRows[i]=rowoutput[i];
							}
							if(rowoutput["HOSPMAIN"].ToString()!=hmain){updateRows["HOSPMAIN"]=hmain;}
							if(rowoutput["HOSPSUB"].ToString()!=hsub){updateRows["HOSPSUB"]=hsub;}
							datasetUpdate.Tables[0].Rows.Add(updateRows);
							result=searchToUpdate.updateHealthy(datasetUpdate);
						}
						else{result="Not Found In Healthy";}
					}
					else {result="Your privilege is only"+Changhos+" time/year";}//display
			}
					//			catch(Exception e){Console.WriteLine(e.StackTrace);}
					return result;
		}

		[WebMethod]
		public String checkPrivilegeAccident(String pid)
		{
			String result="";
			try
			{
				DataSet searchPid=queryHealthy(pid);
				if (searchPid.Tables[0].Rows[0]["HSTATUS"].ToString()=="1")
				{
					DataSet checkPrivilege= new DataSet();
					sqlDataAdapter2.Fill(checkPrivilege);
					DataTable privilegeTable=checkPrivilege.Tables["Count_Edit_HOS"];				
					String sql="pid='"+pid+"'";
					DataRow[] rub=privilegeTable.Select(sql);
					if(rub.Length!=0)
					{
						int tmp=(Int32)rub[0]["ACCIDENT"];
						result=tmp.ToString();
					}
					else
					{
						//ตั้งค่าเริ่มต้น แล้วคืนค่าที่ต้องการ
						String Changhos;
						String Accident;
						//String strConn="data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";
						SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From HEALTHY_INFO",conStr);
						SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

						DataSet dataSet1=new DataSet();
						DataTable logtable=new DataTable();
						logfileAdapter.Fill(dataSet1);
						logtable=dataSet1.Tables[0];


						DataRow[] getAttr=logtable.Select("ID=0");
						if(getAttr[0]["CHANGE_HOS"]!=null)
						{
							Changhos=(String)getAttr[0]["CHANGE_HOS"];
						}
						else{Changhos="0";}

						if(getAttr[0]["CHANGE_HOS"]!=null)
						{
							Accident=(String)getAttr[0]["ACCIDENT"];
						}
						else{Accident="0";}
						

						PrivilegeDataset datasetInsert=new PrivilegeDataset();
						DataTable tableInsert=datasetInsert.Count_Edit_HOS;
						DataRow addRow=tableInsert.NewRow();
						addRow["PID"]=pid;
						addRow["changeHos"]=Changhos;	//ตั้งค่าเริ่มต้น
						addRow["ACCIDENT"]=Accident;	//ตั้งค่าเริ่มต้น
						tableInsert.Rows.Add(addRow);
						DataSet datachange=new DataSet();
						datachange=datasetInsert.GetChanges(DataRowState.Added);
						sqlDataAdapter2.Update(datachange,"Count_Edit_HOS");
						result=Changhos;
					}
				}
				else {result="Not have Healthy Privilege";}
			}
			catch(Exception e){Console.WriteLine(e.StackTrace);}

			return result;
		}

		[WebMethod]
		public String sendClearing(ClearingDataset datasend)
		{
			String result="";
			try
			{
				ClearingDataset insertDataset=new ClearingDataset();
				DataSet datachange=new DataSet();
				DataSet datachange2=new DataSet();
				DataTable insertTable=insertDataset.Tables["CLEARING"];
				DataHealthy datahealthy= new DataHealthy();		
	
				foreach(DataTable table in datasend.Tables)
					foreach(DataRow row in table.Rows)
					{						
						DataSet keepDataset=datahealthy.queryHealthy((String)row["PID"]);
						String realSub=(String)keepDataset.Tables[0].Rows[0]["HOSPSUB"];
						String nowSub=(String)row["HOSPSUB"];

						if(!realSub.Equals(nowSub))
						{
							DataSet checkPrivilege= new DataSet();
							sqlDataAdapter2.Fill(checkPrivilege);
							DataTable privilegeTable=checkPrivilege.Tables["Count_Edit_HOS"];				
							String sql="pid='"+row["PID"]+"'";
							DataRow[] rub=privilegeTable.Select(sql);
							if((Int32)rub[0]["ACCIDENT"]>0)
							{
								int tmp=(Int32)rub[0]["ACCIDENT"];
								rub[0]["ACCIDENT"]=tmp-1;//decrement path
								datachange2=checkPrivilege.GetChanges(DataRowState.Modified);
								sqlDataAdapter2.Update(datachange2,"Count_Edit_HOS");
							}
						}

						DataRow insertRow=insertTable.NewRow();
						insertRow["HOSPMAIN"]=row["HOSPMAIN"];
						insertRow["HOSPSUB"]=row["HOSPSUB"];
						insertRow["PID"]=row["PID"];
						//-----------------------------------
						//String strConn="data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";
						SqlDataAdapter forcard=new SqlDataAdapter("SELECT MAX(CONVERT(numeric, BILL_ID)) FROM CLEARING",conStr);
						DataSet rubidcard=new DataSet();
						forcard.Fill(rubidcard);
						String x=rubidcard.Tables[0].Rows[0][0].ToString();
						int cardid=0;
						if(!x.Equals(""))
						{
							cardid=Int32.Parse(x);
						}
						cardid++;
						insertRow["BILL_ID"]=cardid.ToString();								
						//-----------------------------------
						insertRow["DATE_BILL"]=row["DATE_BILL"];
						insertRow["DISEASE"]=row["DISEASE"];
						insertRow["COST_MEDICINE"]=row["COST_MEDICINE"];
						insertRow["COST_DOCTOR"]=row["COST_DOCTOR"];
						insertRow["COST_ROOM"]=row["COST_ROOM"];
						insertRow["COST_TREAT"]=row["COST_TREAT"];
						insertRow["COST_OTHER"]=row["COST_OTHER"];
						insertRow["COST_SUM"]=row["COST_SUM"];
						insertTable.Rows.Add(insertRow);
						datachange=insertDataset.GetChanges(DataRowState.Added);
						sqlDataAdapter3.Update(datachange);						
					}
				result="Success";
			}
			catch(Exception e){Console.WriteLine(e.StackTrace);}
			return result;
		}

		[WebMethod]
		public ClearingDataset receiveClearing(String hnumber,String dateBill)
		{
			ClearingDataset wantToRecieve=new ClearingDataset();
			sqlDataAdapter3.Fill(wantToRecieve);
			DataTable RecieveTable=wantToRecieve.Tables["CLEARING"];
			String sqlstr="HOSPMAIN='"+hnumber+"' and DATE_BILL='"+dateBill+"'";
			DataRow[] queryRows=RecieveTable.Select(sqlstr);
			ClearingDataset dataclear=new ClearingDataset();
			try
			{
				dataclear.Merge(queryRows);
			}
			catch(Exception e){Console.WriteLine(e.StackTrace);}
			return dataclear;
		}
	}
}
