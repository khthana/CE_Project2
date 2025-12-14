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

namespace PeopleApp
{
	/// <summary>
	/// Summary description for officer.
	/// </summary>
	public class officer : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.TextBox TextBox3;
		protected System.Web.UI.WebControls.TextBox TextBox4;
		protected System.Web.UI.WebControls.TextBox TextBox5;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Button Button2;
		protected System.Web.UI.WebControls.Button Button3;
		protected System.Web.UI.WebControls.Button Button4;
		protected System.Web.UI.WebControls.TextBox TextBox6;
		protected System.Web.UI.WebControls.TextBox TextBox7;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Button Button5;
		protected System.Web.UI.WebControls.Button Button6;
		protected System.Web.UI.WebControls.Button Button7;
		protected System.Web.UI.WebControls.Button Button8;
		protected System.Web.UI.WebControls.TextBox TextBox8;
		protected System.Web.UI.WebControls.TextBox TextBox9;
		protected System.Web.UI.WebControls.TextBox TextBox10;
		protected System.Web.UI.WebControls.TextBox TextBox11;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Button Button9;
		protected System.Web.UI.WebControls.Button Button10;
		protected System.Web.UI.WebControls.Button Button11;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		protected System.Data.SqlClient.SqlConnection sqlConnection1;
		protected System.Data.SqlClient.SqlDataAdapter departmentAdap;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand3;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand3;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand3;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand3;
		protected System.Data.SqlClient.SqlDataAdapter officerAdap;
		protected PeopleApp.departmentDataset departmentDataset1;
		protected PeopleApp.officerDataset officerDataset1;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand4;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand4;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand4;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand4;
		protected PeopleApp.updateOfficeDataset updateOfficeDataset1;
		protected System.Data.SqlClient.SqlDataAdapter updateofficeAdap;
		protected System.Data.SqlClient.SqlCommand sqlSelectCommand2;
		protected System.Data.SqlClient.SqlCommand sqlInsertCommand2;
		protected System.Data.SqlClient.SqlCommand sqlUpdateCommand2;
		protected System.Data.SqlClient.SqlCommand sqlDeleteCommand2;
		protected System.Data.SqlClient.SqlDataAdapter dependentAdap;
		protected PeopleApp.dependentDataset dependentDataset1;
		protected System.Web.UI.WebControls.Button Button12;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			departmentAdap.Fill(departmentDataset1);
			officerAdap.Fill(officerDataset1);
			dependentAdap.Fill(dependentDataset1);
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
			this.departmentAdap = new System.Data.SqlClient.SqlDataAdapter();
			this.sqlSelectCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand3 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand3 = new System.Data.SqlClient.SqlCommand();
			this.officerAdap = new System.Data.SqlClient.SqlDataAdapter();
			this.departmentDataset1 = new PeopleApp.departmentDataset();
			this.officerDataset1 = new PeopleApp.officerDataset();
			this.sqlSelectCommand4 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand4 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand4 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand4 = new System.Data.SqlClient.SqlCommand();
			this.updateofficeAdap = new System.Data.SqlClient.SqlDataAdapter();
			this.updateOfficeDataset1 = new PeopleApp.updateOfficeDataset();
			this.sqlSelectCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand2 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand2 = new System.Data.SqlClient.SqlCommand();
			this.dependentAdap = new System.Data.SqlClient.SqlDataAdapter();
			this.dependentDataset1 = new PeopleApp.dependentDataset();
			((System.ComponentModel.ISupportInitialize)(this.departmentDataset1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.officerDataset1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.updateOfficeDataset1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.dependentDataset1)).BeginInit();
			this.Button12.Click += new System.EventHandler(this.Button12_Click);
			this.Button11.Click += new System.EventHandler(this.Button11_Click);
			this.Button10.Click += new System.EventHandler(this.Button10_Click);
			this.Button8.Click += new System.EventHandler(this.Button8_Click);
			this.Button7.Click += new System.EventHandler(this.Button7_Click);
			this.Button6.Click += new System.EventHandler(this.Button6_Click);
			this.Button5.Click += new System.EventHandler(this.Button5_Click);
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Button2.Click += new System.EventHandler(this.Button2_Click);
			this.Button3.Click += new System.EventHandler(this.Button3_Click);
			this.Button4.Click += new System.EventHandler(this.Button4_Click);
			this.Button9.Click += new System.EventHandler(this.Button9_Click);
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "SELECT MINISTRY_CODE, DEPT, DEPT_DESC, DEPT_ABBR FROM dbo.DEPARTMENT";
			this.sqlSelectCommand1.Connection = this.sqlConnection1;
			// 
			// sqlConnection1
			// 
			this.sqlConnection1.ConnectionString = "data source=EKOC;initial catalog=datapeople;password=pomme;persist security info=" +
				"True;user id=dbpeople;workstation id=EKOC;packet size=4096";
			// 
			// sqlInsertCommand1
			// 
			this.sqlInsertCommand1.CommandText = "INSERT INTO dbo.DEPARTMENT(MINISTRY_CODE, DEPT, DEPT_DESC, DEPT_ABBR) VALUES (@MI" +
				"NISTRY_CODE, @DEPT, @DEPT_DESC, @DEPT_ABBR); SELECT MINISTRY_CODE, DEPT, DEPT_DE" +
				"SC, DEPT_ABBR FROM dbo.DEPARTMENT WHERE (DEPT = @DEPT)";
			this.sqlInsertCommand1.Connection = this.sqlConnection1;
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MINISTRY_CODE", System.Data.SqlDbType.VarChar, 2, "MINISTRY_CODE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DEPT", System.Data.SqlDbType.VarChar, 6, "DEPT"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DEPT_DESC", System.Data.SqlDbType.VarChar, 100, "DEPT_DESC"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DEPT_ABBR", System.Data.SqlDbType.VarChar, 20, "DEPT_ABBR"));
			// 
			// sqlUpdateCommand1
			// 
			this.sqlUpdateCommand1.CommandText = @"UPDATE dbo.DEPARTMENT SET MINISTRY_CODE = @MINISTRY_CODE, DEPT = @DEPT, DEPT_DESC = @DEPT_DESC, DEPT_ABBR = @DEPT_ABBR WHERE (DEPT = @Original_DEPT) AND (DEPT_ABBR = @Original_DEPT_ABBR OR @Original_DEPT_ABBR IS NULL AND DEPT_ABBR IS NULL) AND (DEPT_DESC = @Original_DEPT_DESC OR @Original_DEPT_DESC IS NULL AND DEPT_DESC IS NULL) AND (MINISTRY_CODE = @Original_MINISTRY_CODE OR @Original_MINISTRY_CODE IS NULL AND MINISTRY_CODE IS NULL); SELECT MINISTRY_CODE, DEPT, DEPT_DESC, DEPT_ABBR FROM dbo.DEPARTMENT WHERE (DEPT = @DEPT)";
			this.sqlUpdateCommand1.Connection = this.sqlConnection1;
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MINISTRY_CODE", System.Data.SqlDbType.VarChar, 2, "MINISTRY_CODE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DEPT", System.Data.SqlDbType.VarChar, 6, "DEPT"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DEPT_DESC", System.Data.SqlDbType.VarChar, 100, "DEPT_DESC"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DEPT_ABBR", System.Data.SqlDbType.VarChar, 20, "DEPT_ABBR"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DEPT", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DEPT", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DEPT_ABBR", System.Data.SqlDbType.VarChar, 20, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DEPT_ABBR", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DEPT_DESC", System.Data.SqlDbType.VarChar, 100, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DEPT_DESC", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_MINISTRY_CODE", System.Data.SqlDbType.VarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "MINISTRY_CODE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand1
			// 
			this.sqlDeleteCommand1.CommandText = @"DELETE FROM dbo.DEPARTMENT WHERE (DEPT = @Original_DEPT) AND (DEPT_ABBR = @Original_DEPT_ABBR OR @Original_DEPT_ABBR IS NULL AND DEPT_ABBR IS NULL) AND (DEPT_DESC = @Original_DEPT_DESC OR @Original_DEPT_DESC IS NULL AND DEPT_DESC IS NULL) AND (MINISTRY_CODE = @Original_MINISTRY_CODE OR @Original_MINISTRY_CODE IS NULL AND MINISTRY_CODE IS NULL)";
			this.sqlDeleteCommand1.Connection = this.sqlConnection1;
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DEPT", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DEPT", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DEPT_ABBR", System.Data.SqlDbType.VarChar, 20, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DEPT_ABBR", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DEPT_DESC", System.Data.SqlDbType.VarChar, 100, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DEPT_DESC", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_MINISTRY_CODE", System.Data.SqlDbType.VarChar, 2, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "MINISTRY_CODE", System.Data.DataRowVersion.Original, null));
			// 
			// departmentAdap
			// 
			this.departmentAdap.DeleteCommand = this.sqlDeleteCommand1;
			this.departmentAdap.InsertCommand = this.sqlInsertCommand1;
			this.departmentAdap.SelectCommand = this.sqlSelectCommand1;
			this.departmentAdap.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									 new System.Data.Common.DataTableMapping("Table", "DEPARTMENT", new System.Data.Common.DataColumnMapping[] {
																																																				   new System.Data.Common.DataColumnMapping("MINISTRY_CODE", "MINISTRY_CODE"),
																																																				   new System.Data.Common.DataColumnMapping("DEPT", "DEPT"),
																																																				   new System.Data.Common.DataColumnMapping("DEPT_DESC", "DEPT_DESC"),
																																																				   new System.Data.Common.DataColumnMapping("DEPT_ABBR", "DEPT_ABBR")})});
			this.departmentAdap.UpdateCommand = this.sqlUpdateCommand1;
			// 
			// sqlSelectCommand3
			// 
			this.sqlSelectCommand3.CommandText = "SELECT PID, DEPT FROM dbo.OFFICER";
			this.sqlSelectCommand3.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand3
			// 
			this.sqlInsertCommand3.CommandText = "INSERT INTO dbo.OFFICER(PID, DEPT) VALUES (@PID, @DEPT); SELECT PID, DEPT FROM db" +
				"o.OFFICER WHERE (PID = @PID)";
			this.sqlInsertCommand3.Connection = this.sqlConnection1;
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DEPT", System.Data.SqlDbType.VarChar, 6, "DEPT"));
			// 
			// sqlUpdateCommand3
			// 
			this.sqlUpdateCommand3.CommandText = "UPDATE dbo.OFFICER SET PID = @PID, DEPT = @DEPT WHERE (PID = @Original_PID) AND (" +
				"DEPT = @Original_DEPT OR @Original_DEPT IS NULL AND DEPT IS NULL); SELECT PID, D" +
				"EPT FROM dbo.OFFICER WHERE (PID = @PID)";
			this.sqlUpdateCommand3.Connection = this.sqlConnection1;
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DEPT", System.Data.SqlDbType.VarChar, 6, "DEPT"));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DEPT", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DEPT", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand3
			// 
			this.sqlDeleteCommand3.CommandText = "DELETE FROM dbo.OFFICER WHERE (PID = @Original_PID) AND (DEPT = @Original_DEPT OR" +
				" @Original_DEPT IS NULL AND DEPT IS NULL)";
			this.sqlDeleteCommand3.Connection = this.sqlConnection1;
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand3.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DEPT", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DEPT", System.Data.DataRowVersion.Original, null));
			// 
			// officerAdap
			// 
			this.officerAdap.DeleteCommand = this.sqlDeleteCommand3;
			this.officerAdap.InsertCommand = this.sqlInsertCommand3;
			this.officerAdap.SelectCommand = this.sqlSelectCommand3;
			this.officerAdap.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																								  new System.Data.Common.DataTableMapping("Table", "OFFICER", new System.Data.Common.DataColumnMapping[] {
																																																			 new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																			 new System.Data.Common.DataColumnMapping("DEPT", "DEPT")})});
			this.officerAdap.UpdateCommand = this.sqlUpdateCommand3;
			// 
			// departmentDataset1
			// 
			this.departmentDataset1.DataSetName = "departmentDataset";
			this.departmentDataset1.Locale = new System.Globalization.CultureInfo("th-TH");
			this.departmentDataset1.Namespace = "http://www.tempuri.org/departmentDataset.xsd";
			// 
			// officerDataset1
			// 
			this.officerDataset1.DataSetName = "officerDataset";
			this.officerDataset1.Locale = new System.Globalization.CultureInfo("th-TH");
			this.officerDataset1.Namespace = "http://www.tempuri.org/officerDataset.xsd";
			// 
			// sqlSelectCommand4
			// 
			this.sqlSelectCommand4.CommandText = "SELECT PID, DATE FROM dbo.UPDATE_OFFICE";
			this.sqlSelectCommand4.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand4
			// 
			this.sqlInsertCommand4.CommandText = "INSERT INTO dbo.UPDATE_OFFICE(PID, DATE) VALUES (@PID, @DATE); SELECT PID, DATE F" +
				"ROM dbo.UPDATE_OFFICE WHERE (DATE = @DATE) AND (PID = @PID)";
			this.sqlInsertCommand4.Connection = this.sqlConnection1;
			this.sqlInsertCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE", System.Data.SqlDbType.VarChar, 10, "DATE"));
			// 
			// sqlUpdateCommand4
			// 
			this.sqlUpdateCommand4.CommandText = "UPDATE dbo.UPDATE_OFFICE SET PID = @PID, DATE = @DATE WHERE (DATE = @Original_DAT" +
				"E) AND (PID = @Original_PID); SELECT PID, DATE FROM dbo.UPDATE_OFFICE WHERE (DAT" +
				"E = @DATE) AND (PID = @PID)";
			this.sqlUpdateCommand4.Connection = this.sqlConnection1;
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DATE", System.Data.SqlDbType.VarChar, 10, "DATE"));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand4
			// 
			this.sqlDeleteCommand4.CommandText = "DELETE FROM dbo.UPDATE_OFFICE WHERE (DATE = @Original_DATE) AND (PID = @Original_" +
				"PID)";
			this.sqlDeleteCommand4.Connection = this.sqlConnection1;
			this.sqlDeleteCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_DATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "DATE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand4.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			// 
			// updateofficeAdap
			// 
			this.updateofficeAdap.DeleteCommand = this.sqlDeleteCommand4;
			this.updateofficeAdap.InsertCommand = this.sqlInsertCommand4;
			this.updateofficeAdap.SelectCommand = this.sqlSelectCommand4;
			this.updateofficeAdap.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									   new System.Data.Common.DataTableMapping("Table", "UPDATE_OFFICE", new System.Data.Common.DataColumnMapping[] {
																																																						new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																						new System.Data.Common.DataColumnMapping("DATE", "DATE")})});
			this.updateofficeAdap.UpdateCommand = this.sqlUpdateCommand4;
			// 
			// updateOfficeDataset1
			// 
			this.updateOfficeDataset1.DataSetName = "updateOfficeDataset";
			this.updateOfficeDataset1.Locale = new System.Globalization.CultureInfo("th-TH");
			this.updateOfficeDataset1.Namespace = "http://www.tempuri.org/updateOfficeDataset.xsd";
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
			this.sqlUpdateCommand2.CommandText = @"UPDATE dbo.DEPENDENT SET PID = @PID, FPID = @FPID, MPID = @MPID, PID_SELECT = @PID_SELECT, FLAG = @FLAG WHERE (PID = @Original_PID) AND (FLAG = @Original_FLAG OR @Original_FLAG IS NULL AND FLAG IS NULL) AND (FPID = @Original_FPID OR @Original_FPID IS NULL AND FPID IS NULL) AND (MPID = @Original_MPID OR @Original_MPID IS NULL AND MPID IS NULL) AND (PID_SELECT = @Original_PID_SELECT OR @Original_PID_SELECT IS NULL AND PID_SELECT IS NULL); SELECT PID, FPID, MPID, PID_SELECT, FLAG FROM dbo.DEPENDENT WHERE (PID = @PID)";
			this.sqlUpdateCommand2.Connection = this.sqlConnection1;
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FPID", System.Data.SqlDbType.VarChar, 13, "FPID"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MPID", System.Data.SqlDbType.VarChar, 13, "MPID"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID_SELECT", System.Data.SqlDbType.VarChar, 13, "PID_SELECT"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FLAG", System.Data.SqlDbType.VarChar, 1, "FLAG"));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FLAG", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FLAG", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FPID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FPID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_MPID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "MPID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID_SELECT", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID_SELECT", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand2
			// 
			this.sqlDeleteCommand2.CommandText = @"DELETE FROM dbo.DEPENDENT WHERE (PID = @Original_PID) AND (FLAG = @Original_FLAG OR @Original_FLAG IS NULL AND FLAG IS NULL) AND (FPID = @Original_FPID OR @Original_FPID IS NULL AND FPID IS NULL) AND (MPID = @Original_MPID OR @Original_MPID IS NULL AND MPID IS NULL) AND (PID_SELECT = @Original_PID_SELECT OR @Original_PID_SELECT IS NULL AND PID_SELECT IS NULL)";
			this.sqlDeleteCommand2.Connection = this.sqlConnection1;
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FLAG", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FLAG", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FPID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FPID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_MPID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "MPID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID_SELECT", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID_SELECT", System.Data.DataRowVersion.Original, null));
			// 
			// dependentAdap
			// 
			this.dependentAdap.DeleteCommand = this.sqlDeleteCommand2;
			this.dependentAdap.InsertCommand = this.sqlInsertCommand2;
			this.dependentAdap.SelectCommand = this.sqlSelectCommand2;
			this.dependentAdap.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									new System.Data.Common.DataTableMapping("Table", "DEPENDENT", new System.Data.Common.DataColumnMapping[] {
																																																				 new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																				 new System.Data.Common.DataColumnMapping("FPID", "FPID"),
																																																				 new System.Data.Common.DataColumnMapping("MPID", "MPID"),
																																																				 new System.Data.Common.DataColumnMapping("PID_SELECT", "PID_SELECT"),
																																																				 new System.Data.Common.DataColumnMapping("FLAG", "FLAG")})});
			this.dependentAdap.UpdateCommand = this.sqlUpdateCommand2;
			// 
			// dependentDataset1
			// 
			this.dependentDataset1.DataSetName = "dependentDataset";
			this.dependentDataset1.Locale = new System.Globalization.CultureInfo("th-TH");
			this.dependentDataset1.Namespace = "http://www.tempuri.org/dependentDataset.xsd";
			this.Load += new System.EventHandler(this.Page_Load);
			((System.ComponentModel.ISupportInitialize)(this.departmentDataset1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.officerDataset1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.updateOfficeDataset1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.dependentDataset1)).EndInit();

		}
		#endregion

		private void txt1clear()
		{
			TextBox1.Text="";
			TextBox2.Text="";
			TextBox3.Text="";
			TextBox4.Text="";
			TextBox5.Text="";
			Label12.Text="";
		}

		private void txt2clear()
		{
			TextBox6.Text="";
			TextBox7.Text="";
			Label13.Text="";
		}
		private void txt3clear()
		{
			TextBox8.Text="";
			TextBox9.Text="";
			TextBox10.Text="";
			TextBox11.Text="";
			Label14.Text="";
		}
		private void Button4_Click(object sender, System.EventArgs e)
		{
			txt1clear();
		}

		private void Button8_Click(object sender, System.EventArgs e)
		{
			txt2clear();
		}

		private void Button12_Click(object sender, System.EventArgs e)
		{
			txt3clear();
		}

		private void Button3_Click(object sender, System.EventArgs e)
		{
			DataSet datachange =new DataSet();
			DataTable table1=dependentDataset1.DEPENDENT;
			String sqlstr="pid=\'"+TextBox1.Text+"\'";
			DataRow[] queryRows=table1.Select(sqlstr);
			if (queryRows.Length!=0)
			{//delete
				queryRows[0].Delete();
				datachange=dependentDataset1.GetChanges(DataRowState.Deleted);
				dependentAdap.Update(datachange,"DEPENDENT");
				Label12.Text="Success";
			}
			else{Label12.Text="Not Found";}		
		}

		private void Button7_Click(object sender, System.EventArgs e)
		{
			DataSet datachange =new DataSet();
			DataTable table1=officerDataset1.OFFICER;
			String sqlstr="pid=\'"+TextBox6.Text+"\'";
			DataRow[] queryRows=table1.Select(sqlstr);
			if (queryRows.Length!=0)
			{//delete
				queryRows[0].Delete();
				datachange=officerDataset1.GetChanges(DataRowState.Deleted);
				officerAdap.Update(datachange,"OFFICER");
				Label13.Text="Success";
			}
			else{Label13.Text="Not Found";}			
		}

		private void Button11_Click(object sender, System.EventArgs e)
		{
			DataSet datachange =new DataSet();
			DataTable table1=departmentDataset1.DEPARTMENT;
			String sqlstr="DEPT=\'"+TextBox8.Text+"\'";
			DataRow[] queryRows=table1.Select(sqlstr);
			if (queryRows.Length!=0)
			{//delete
				queryRows[0].Delete();
				datachange=departmentDataset1.GetChanges(DataRowState.Deleted);
				departmentAdap.Update(datachange,"DEPARTMENT");
				Label14.Text="Success";
			}
			else{Label14.Text="Not Found";}			
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			if(TextBox1.Text.Length==13)
			{
				DataTable table1=dependentDataset1.DEPENDENT;
				String sqlstr="pid=\'"+TextBox1.Text+"\'";
				DataRow[] queryRows=table1.Select(sqlstr);
				
				if (queryRows.Length!=0)
				{
					Label12.Text="";
					TextBox2.Text=(String)queryRows[0][1];
					TextBox3.Text=(String)queryRows[0][2];
					TextBox4.Text=(String)queryRows[0][3];
					TextBox5.Text=(String)queryRows[0][4];
				}
				else 
				{
					String temp="ID: ["+ TextBox1.Text + "]  Not Found";
					txt1clear();
					Label12.Text=temp;
				}
				
			}
			else
			{
				txt1clear();
				Label12.Text="Press Insert PID 13 Charecter";
			}
			
		}

		private void Button5_Click(object sender, System.EventArgs e)
		{
			if(TextBox6.Text.Length==13)
			{
				DataTable table1=officerDataset1.OFFICER;
				String sqlstr="pid=\'"+TextBox6.Text+"\'";
				DataRow[] queryRows=table1.Select(sqlstr);
				
				if (queryRows.Length!=0)
				{
					Label13.Text="";
					TextBox7.Text=(String)queryRows[0][1];
				}
				else 
				{
					String temp="ID: ["+ TextBox6.Text + "]  Not Found";
					txt2clear();
					Label13.Text=temp;
				}
				
			}
			else
			{
				txt2clear();
				Label13.Text="Press Insert PID 13 Charecter";
			}					
		}

		private void Button9_Click(object sender, System.EventArgs e)
		{
			if(TextBox8.Text.Length==6)
			{
				DataTable table1=departmentDataset1.DEPARTMENT;
				String sqlstr="DEPT=\'"+TextBox8.Text+"\'";
				DataRow[] queryRows=table1.Select(sqlstr);
				
				if (queryRows.Length!=0)
				{
					Label13.Text="";
					TextBox9.Text=(String)queryRows[0][0];
					TextBox10.Text=(String)queryRows[0][2];
					TextBox11.Text=(String)queryRows[0][3];
				}
				else 
				{
					String temp="ID: ["+ TextBox8.Text + "]  Not Found";
					txt3clear();
					Label14.Text=temp;
				}
				
			}
			else
			{
				txt3clear();
				Label14.Text="Press Insert PID 6 Charecter";
			}					
		}

		private void Button2_Click(object sender, System.EventArgs e)
		{
			DataSet datachange =new DataSet();
			DataTable table1=dependentDataset1.DEPENDENT;
			String sqlstr="pid=\'"+TextBox1.Text+"\'";
			DataRow[] queryRows=table1.Select(sqlstr);
			if (queryRows.Length!=0)
			{//update
				queryRows[0][0]=TextBox1.Text;
				queryRows[0][1]=TextBox2.Text;
				queryRows[0][2]=TextBox3.Text;
				queryRows[0][3]=TextBox4.Text;
				queryRows[0][4]=TextBox5.Text;
				datachange=dependentDataset1.GetChanges(DataRowState.Modified);
				dependentAdap.Update(datachange,"DEPENDENT");
			}
			else
			{//create new rows
				DataRow createRows=table1.NewRow();
				if(TextBox1.Text.Length==13)
				{
					createRows[0]=TextBox1.Text;
					createRows[1]=TextBox2.Text;
					createRows[2]=TextBox3.Text;
					createRows[3]=TextBox4.Text;
					createRows[4]=TextBox5.Text;
					table1.Rows.Add(createRows);
					datachange=dependentDataset1.GetChanges(DataRowState.Added);
					dependentAdap.Update(datachange,"DEPENDENT");

					DateTime time=new DateTime();
					time=DateTime.Today;
					String[] tmp3=time.GetDateTimeFormats('d');			


					DataSet datachange2 =new DataSet();
					DataTable table2=updateOfficeDataset1.UPDATE_OFFICE;

					String sqlstr2="pid=\'"+TextBox1.Text+"\' AND DATE=\'"+tmp3[3]+"\'";
					DataRow[] queryRowsrep=table2.Select(sqlstr2);
					if(queryRowsrep.Length==0)
					{
						DataRow updateRows=table2.NewRow();
						updateRows[0]=TextBox1.Text;
						updateRows[1]=tmp3[3];
						table2.Rows.Add(updateRows);
						datachange2=updateOfficeDataset1.GetChanges(DataRowState.Added);
						updateofficeAdap.Update(datachange2,"UPDATE_OFFICE");
					}
				}
			}			
		}

		private void Button6_Click(object sender, System.EventArgs e)
		{
			DataSet datachange =new DataSet();
			DataTable table1=officerDataset1.OFFICER;
			String sqlstr="pid=\'"+TextBox6.Text+"\'";
			DataRow[] queryRows=table1.Select(sqlstr);
			if (queryRows.Length!=0)
			{//update
				queryRows[0][0]=TextBox6.Text;
				queryRows[0][1]=TextBox7.Text;
				datachange=officerDataset1.GetChanges(DataRowState.Modified);
				officerAdap.Update(datachange,"OFFICER");
			}
			else
			{//create new rows
				DataRow createRows=table1.NewRow();
				if(TextBox6.Text.Length==13)
				{
					createRows[0]=TextBox6.Text;
					createRows[1]=TextBox7.Text;
					table1.Rows.Add(createRows);
					datachange=officerDataset1.GetChanges(DataRowState.Added);
					officerAdap.Update(datachange,"OFFICER");
				}
			}		
		}

		private void Button10_Click(object sender, System.EventArgs e)
		{
			DataSet datachange =new DataSet();
			DataTable table1=departmentDataset1.DEPARTMENT;
			String sqlstr="DEPT=\'"+TextBox8.Text+"\'";
			DataRow[] queryRows=table1.Select(sqlstr);
			if (queryRows.Length!=0)
			{//update
				queryRows[0][0]=TextBox9.Text;
				queryRows[0][1]=TextBox8.Text;
				queryRows[0][2]=TextBox10.Text;
				queryRows[0][3]=TextBox11.Text;
				datachange=departmentDataset1.GetChanges(DataRowState.Modified);
				departmentAdap.Update(datachange,"DEPARTMENT");
			}
			else
			{//create new rows
				DataRow createRows=table1.NewRow();
				if(TextBox8.Text.Length==13)
				{
					createRows[0]=TextBox9.Text;
					createRows[1]=TextBox8.Text;
					createRows[2]=TextBox10.Text;
					createRows[3]=TextBox11.Text;
					table1.Rows.Add(createRows);
					datachange=departmentDataset1.GetChanges(DataRowState.Added);
					departmentAdap.Update(datachange,"DEPARTMENT");
				}
			}				
		}
	}
}
