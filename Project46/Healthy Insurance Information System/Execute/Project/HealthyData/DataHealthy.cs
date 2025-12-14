using System;
using System.IO;

namespace HealthyData
{
	using System.Data;
	using System.Data.SqlClient;
	/// <summary>
	/// Summary description for Class1.
	/// </summary>
	public class DataHealthy
	{
		private System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		private System.Data.SqlClient.SqlConnection sqlConnection1;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
		private String conStr;
//		private HealthyData.DataSet1 dataset11;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		public DataHealthy()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}
		private void InitializeComponent()
		{
			this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlConnection1 = new System.Data.SqlClient.SqlConnection();
			this.sqlDataAdapter1 = new System.Data.SqlClient.SqlDataAdapter();
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "SELECT PID, PROCODE, RESULT, TITLE, FNAME, LNAME, BDATE, CARDID, INSCL, HOSPMAIN," +
				" HOSPSUB, IDATE, EDATE, SEX, NATION, OCCUPA, ADDRESS, MOO, TAMBON, AMPHUR, PROVI" +
				"NCE, STATUS FROM dbo.UCS_HEALTHY";
			this.sqlSelectCommand1.Connection = this.sqlConnection1;
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
			// sqlConnection1
			// 
		    conStr="";
			try
			{
				//String kucoke=Directory.GetCurrentDirectory();
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

//			this.sqlConnection1.ConnectionString = "data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=" +
//				"dbhealthy;workstation id=EKOC;packet size=4096";
			// 
			// sqlDataAdapter1
			// 
			this.sqlDataAdapter1.DeleteCommand = this.sqlDeleteCommand1;
			this.sqlDataAdapter1.InsertCommand = this.sqlInsertCommand1;
			this.sqlDataAdapter1.SelectCommand = this.sqlSelectCommand1;
			this.sqlDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] 
	{
		new System.Data.Common.DataTableMapping("Table", "UCS_HEALTHY", new System.Data.Common.DataColumnMapping[] 
	{
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
		}

		public DataSet queryHealthy(String pid)
		{
			String tmp="SELECT * FROM UCS_HEALTHY WHERE PID=\'"+pid+"\'";
			DataSet kucoke1= new DataSet();
			SqlDataAdapter kucoke2=new SqlDataAdapter(tmp,sqlConnection1);
			kucoke2.Fill(kucoke1);
			return kucoke1;
		}

		public String updateHealthy(DataSet kucoke)
		{
			int tableIndex=0;
			DataSet olddata=new DataSet();
			sqlDataAdapter1.Fill(olddata);
			DataSet datachange =new DataSet();
			DataTable table1=olddata.Tables["UCS_HEALTHY"];
			if(kucoke.Tables.Count>0)tableIndex=(kucoke.Tables.Count)-1;//เพราะว่า dataset ที่return มีตารางที่ไดนามิก มันเลยสร้างตารางใหม่
			String sqlstr=(String)kucoke.Tables[tableIndex].Rows[0][0];
			String sqlstr2 = "pid=\'"+sqlstr+"\'";
			DataRow[] queryRows=table1.Select(sqlstr2);

			if (queryRows.Length!=0)
			{//update
				
				//0 PID
				if(kucoke.Tables[tableIndex].Rows[0][0]!=null){queryRows[0][0]=(String)kucoke.Tables[tableIndex].Rows[0][0];}else{queryRows[0][0]="";}
				//1 PROCODE
				if(kucoke.Tables[tableIndex].Rows[0][1]!=null){queryRows[0][1]=(String)kucoke.Tables[tableIndex].Rows[0][1];}else{queryRows[0][1]="";}
				//2 RESULT
				if(kucoke.Tables[tableIndex].Rows[0][2]!=null){queryRows[0][2]=(String)kucoke.Tables[tableIndex].Rows[0][2];}else{queryRows[0][2]="";}
				//3 TITLE
				if(kucoke.Tables[tableIndex].Rows[0][3]!=null){queryRows[0][3]=(String)kucoke.Tables[tableIndex].Rows[0][3];}else{queryRows[0][3]="";}
				//4 FNAME
				if(kucoke.Tables[tableIndex].Rows[0][4]!=null){queryRows[0][4]=(String)kucoke.Tables[tableIndex].Rows[0][4];}else{queryRows[0][4]="";}
				//5 LNAME
				if(kucoke.Tables[tableIndex].Rows[0][5]!=null){queryRows[0][5]=(String)kucoke.Tables[tableIndex].Rows[0][5];}else{queryRows[0][5]="";}
				//6 BDATE
				if(kucoke.Tables[tableIndex].Rows[0][6]!=null){queryRows[0][6]=(String)kucoke.Tables[tableIndex].Rows[0][6];}else{queryRows[0][6]="";}
				//7 CARDID
				if(kucoke.Tables[tableIndex].Rows[0][7]!=null){queryRows[0][7]=(String)kucoke.Tables[tableIndex].Rows[0][7];}else{queryRows[0][7]="";}
				//8 INSCL
				if(kucoke.Tables[tableIndex].Rows[0][8]!=null){queryRows[0][8]=(String)kucoke.Tables[tableIndex].Rows[0][8];}else{queryRows[0][8]="";}
				//9 HOSPMAIN
				if(kucoke.Tables[tableIndex].Rows[0][9]!=null){queryRows[0][9]=(String)kucoke.Tables[tableIndex].Rows[0][9];}else{queryRows[0][9]="";}
				//10 HOSPMAIN
				if(kucoke.Tables[tableIndex].Rows[0][10]!=null){queryRows[0][10]=(String)kucoke.Tables[tableIndex].Rows[0][10];}else{queryRows[0][10]="";}
				//11 IDATE
				if(kucoke.Tables[tableIndex].Rows[0][11]!=null){queryRows[0][11]=(String)kucoke.Tables[tableIndex].Rows[0][11];}else{queryRows[0][11]="";}
				//12 EDATE
				if(kucoke.Tables[tableIndex].Rows[0][12]!=null){queryRows[0][12]=(String)kucoke.Tables[tableIndex].Rows[0][12];}else{queryRows[0][12]="";}
				//13 SEX
				if(kucoke.Tables[tableIndex].Rows[0][13]!=null){queryRows[0][13]=(String)kucoke.Tables[tableIndex].Rows[0][13];}else{queryRows[0][13]="";}
				//14 NATION
				if(kucoke.Tables[tableIndex].Rows[0][14]!=null){queryRows[0][14]=(String)kucoke.Tables[tableIndex].Rows[0][14];}else{queryRows[0][14]="";}
				//15 OCCUPA
				if(kucoke.Tables[tableIndex].Rows[0][15]!=null){queryRows[0][15]=(String)kucoke.Tables[tableIndex].Rows[0][15];}else{queryRows[0][15]="";}
				//16 ADDRESS
				if(kucoke.Tables[tableIndex].Rows[0][16]!=null){queryRows[0][16]=(String)kucoke.Tables[tableIndex].Rows[0][16];}else{queryRows[0][16]="";}
				//17 MOO
				if(kucoke.Tables[tableIndex].Rows[0][17]!=null){queryRows[0][17]=(String)kucoke.Tables[tableIndex].Rows[0][17];}else{queryRows[0][17]="";}
				//18 TAMBON
				if(kucoke.Tables[tableIndex].Rows[0][18]!=null){queryRows[0][18]=(String)kucoke.Tables[tableIndex].Rows[0][18];}else{queryRows[0][18]="";}
				//19 AMPHUR
				if(kucoke.Tables[tableIndex].Rows[0][19]!=null){queryRows[0][19]=(String)kucoke.Tables[tableIndex].Rows[0][19];}else{queryRows[0][19]="";}
				//20 PROVINCE
				if(kucoke.Tables[tableIndex].Rows[0][20]!=null){queryRows[0][20]=(String)kucoke.Tables[tableIndex].Rows[0][20];}else{queryRows[0][20]="";}
				//21 STATUS
				if(kucoke.Tables[tableIndex].Rows[0][21]!=null){queryRows[0][21]=(String)kucoke.Tables[tableIndex].Rows[0][21];}else{queryRows[0][21]="";}				
				datachange=olddata.GetChanges(DataRowState.Modified);
				sqlDataAdapter1.Update(datachange,"UCS_HEALTHY");
			}
			else
			{//create new rows
				DataRow createRows=table1.NewRow();
//				if(sqlstr.Length==13)
				{
					if(kucoke.Tables[tableIndex].Rows[0][0]!=null){createRows[0]=(String)kucoke.Tables[tableIndex].Rows[0][0];}
					else{createRows[0]="";}
					//1 PROCODE
					if(kucoke.Tables[tableIndex].Rows[0][1]!=null){createRows[1]=(String)kucoke.Tables[tableIndex].Rows[0][1];}
					else{createRows[1]="";}
					//2 RESULT
					if(kucoke.Tables[tableIndex].Rows[0][2]!=null){createRows[2]=(String)kucoke.Tables[tableIndex].Rows[0][2];}
					else{createRows[2]="";}
					//3 TITLE
					if(kucoke.Tables[tableIndex].Rows[0][3]!=null){createRows[3]=(String)kucoke.Tables[tableIndex].Rows[0][3];}
					else{createRows[3]="";}
					//4 FNAME
					if(kucoke.Tables[tableIndex].Rows[0][4]!=null){createRows[4]=(String)kucoke.Tables[tableIndex].Rows[0][4];}
					else{createRows[4]="";}
					//5 LNAME
					if(kucoke.Tables[tableIndex].Rows[0][5]!=null){createRows[5]=(String)kucoke.Tables[tableIndex].Rows[0][5];}
					else{createRows[5]="";}
					//6 BDATE
					if(kucoke.Tables[tableIndex].Rows[0][6]!=null){createRows[6]=(String)kucoke.Tables[tableIndex].Rows[0][6];}
					else{createRows[6]="";}
					//7 CARDID
					if(kucoke.Tables[tableIndex].Rows[0][7]!=null){createRows[7]=(String)kucoke.Tables[tableIndex].Rows[0][7];}
					else{createRows[7]="";}
					//8 INSCL
					if(kucoke.Tables[tableIndex].Rows[0][8]!=null){createRows[8]=(String)kucoke.Tables[tableIndex].Rows[0][8];}
					else{createRows[8]="";}
					//9 HOSPMAIN
					if(kucoke.Tables[tableIndex].Rows[0][9]!=null){createRows[9]=(String)kucoke.Tables[tableIndex].Rows[0][9];}
					else{createRows[9]="";}
					//10 HOSPMAIN
					if(kucoke.Tables[tableIndex].Rows[0][10]!=null){createRows[10]=(String)kucoke.Tables[tableIndex].Rows[0][10];}
					else{createRows[10]="";}
					//11 IDATE
					if(kucoke.Tables[tableIndex].Rows[0][11]!=null){createRows[11]=(String)kucoke.Tables[tableIndex].Rows[0][11];}
					else{createRows[11]="";}
					//12 EDATE
					if(kucoke.Tables[tableIndex].Rows[0][12]!=null){createRows[12]=(String)kucoke.Tables[tableIndex].Rows[0][12];}
					else{createRows[12]="";}
					//13 SEX
					if(kucoke.Tables[tableIndex].Rows[0][13]!=null){createRows[13]=(String)kucoke.Tables[tableIndex].Rows[0][13];}
					else{createRows[13]="";}
					//14 NATION
					if(kucoke.Tables[tableIndex].Rows[0][14]!=null){createRows[14]=(String)kucoke.Tables[tableIndex].Rows[0][14];}
					else{createRows[14]="";}
					//15 OCCUPA
					if(kucoke.Tables[tableIndex].Rows[0][15]!=null){createRows[15]=(String)kucoke.Tables[tableIndex].Rows[0][15];}
					else{createRows[15]="";}
					//16 ADDRESS
					if(kucoke.Tables[tableIndex].Rows[0][16]!=null){createRows[16]=(String)kucoke.Tables[tableIndex].Rows[0][16];}
					else{createRows[16]="";}
					//17 MOO
					if(kucoke.Tables[tableIndex].Rows[0][17]!=null){createRows[17]=(String)kucoke.Tables[tableIndex].Rows[0][17];}
					else{createRows[17]="";}
					//18 TAMBON
					if(kucoke.Tables[tableIndex].Rows[0][18]!=null){createRows[18]=(String)kucoke.Tables[tableIndex].Rows[0][18];}
					else{createRows[18]="";}
					//19 AMPHUR
					if(kucoke.Tables[tableIndex].Rows[0][19]!=null){createRows[19]=(String)kucoke.Tables[tableIndex].Rows[0][19];}
					else{createRows[19]="";}
					//20 PROVINCE
					if(kucoke.Tables[tableIndex].Rows[0][20]!=null){createRows[20]=(String)kucoke.Tables[tableIndex].Rows[0][20];}
					else{createRows[20]="";}
					//21 STATUS
					if(kucoke.Tables[tableIndex].Rows[0][21]!=null){createRows[21]=(String)kucoke.Tables[tableIndex].Rows[0][21];}
					else{createRows[21]="";}				
					table1.Rows.Add(createRows);
					datachange=olddata.GetChanges(DataRowState.Added);
					sqlDataAdapter1.Update(datachange,"UCS_HEALTHY");
				}
			}
			return "Success";
		}
		public String removeHealthy(String pid)
		{
			String sReturn="";
			DataSet olddata=new DataSet();
			sqlDataAdapter1.Fill(olddata);
			DataSet datachange =new DataSet();
			DataTable table1=olddata.Tables["UCS_HEALTHY"];
			String sqlstr="pid=\'"+pid+"\'";
			DataRow[] queryRows=table1.Select(sqlstr);
			if (queryRows.Length!=0)
			{//delete
				queryRows[0].Delete();
				datachange=olddata.GetChanges(DataRowState.Deleted);
				sqlDataAdapter1.Update(datachange,"UCS_HEALTHY");
				sReturn="Success";
			}
			else{sReturn="Not Found";}
			return sReturn;
		}

		public DataSet queryPeople(String pid)
		{
			HealthyData.WebReference2.DataSet1 data1=new HealthyData.WebReference2.DataSet1();
			HealthyData.WebReference2.Service1 rubservice1=new HealthyData.WebReference2.Service1();
			data1=rubservice1.queryPeople(pid);
			return data1;
		}

		public DataSet querySocial(String pid)
		{
			DataSet query1=new DataSet();
			HealthyData.WebReference1.Service1 rubservice1=new HealthyData.WebReference1.Service1();
			query1=rubservice1.querySocial(pid);
			return query1;
		}
	}
}



