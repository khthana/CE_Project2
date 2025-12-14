using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.IO;

namespace HospitalApp
{
	/// <summary>
	/// Summary description for monthreport.
	/// </summary>
	public class monthreport : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox Monthgroup;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button reportbutton;
		private System.Windows.Forms.TextBox monthtextBox;
		private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer1;
		private MonthReport oRpt = new MonthReport(); 
		private System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		private System.Data.SqlClient.SqlConnection sqlConnection1;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
		private HospitalApp.DataSet1 dataSet11;
		private String conStr;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public monthreport()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.Monthgroup = new System.Windows.Forms.GroupBox();
			this.label1 = new System.Windows.Forms.Label();
			this.reportbutton = new System.Windows.Forms.Button();
			this.monthtextBox = new System.Windows.Forms.TextBox();
			this.crystalReportViewer1 = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
			this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlConnection1 = new System.Data.SqlClient.SqlConnection();
			this.sqlDataAdapter1 = new System.Data.SqlClient.SqlDataAdapter();
			this.dataSet11 = new HospitalApp.DataSet1();
			this.Monthgroup.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.dataSet11)).BeginInit();
			this.SuspendLayout();
			// 
			// Monthgroup
			// 
			this.Monthgroup.Controls.AddRange(new System.Windows.Forms.Control[] {
																					 this.label1,
																					 this.reportbutton,
																					 this.monthtextBox});
			this.Monthgroup.Location = new System.Drawing.Point(8, 16);
			this.Monthgroup.Name = "Monthgroup";
			this.Monthgroup.Size = new System.Drawing.Size(248, 72);
			this.Monthgroup.TabIndex = 6;
			this.Monthgroup.TabStop = false;
			this.Monthgroup.Text = "Month Report";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(32, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(80, 24);
			this.label1.TabIndex = 4;
			this.label1.Text = "MM-YYYY";
			// 
			// reportbutton
			// 
			this.reportbutton.Location = new System.Drawing.Point(136, 40);
			this.reportbutton.Name = "reportbutton";
			this.reportbutton.Size = new System.Drawing.Size(80, 24);
			this.reportbutton.TabIndex = 3;
			this.reportbutton.Text = "Report";
			this.reportbutton.Click += new System.EventHandler(this.reportbutton_Click);
			// 
			// monthtextBox
			// 
			this.monthtextBox.Location = new System.Drawing.Point(32, 40);
			this.monthtextBox.Name = "monthtextBox";
			this.monthtextBox.Size = new System.Drawing.Size(96, 20);
			this.monthtextBox.TabIndex = 2;
			this.monthtextBox.Text = "";
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "SELECT PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, COST_ROOM, C" +
				"OST_TREAT, COST_OTHER, COST_SUM, HSTATUS, HOSPMAIN, HOSPSUB, HOSPSTATUS FROM CLE" +
				"ARING";
			this.sqlSelectCommand1.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand1
			// 
			this.sqlInsertCommand1.CommandText = @"INSERT INTO CLEARING(PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, COST_ROOM, COST_TREAT, COST_OTHER, COST_SUM, HSTATUS, HOSPMAIN, HOSPSUB, HOSPSTATUS) VALUES (@PID, @BILL_ID, @DATE_BILL, @DISEASE, @COST_MEDICINE, @COST_DOCTOR, @COST_ROOM, @COST_TREAT, @COST_OTHER, @COST_SUM, @HSTATUS, @HOSPMAIN, @HOSPSUB, @HOSPSTATUS); SELECT PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, COST_ROOM, COST_TREAT, COST_OTHER, COST_SUM, HSTATUS, HOSPMAIN, HOSPSUB, HOSPSTATUS FROM CLEARING WHERE (BILL_ID = @BILL_ID) AND (DATE_BILL = @DATE_BILL) AND (PID = @PID)";
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
			this.sqlUpdateCommand1.CommandText = "UPDATE CLEARING SET PID = @PID, BILL_ID = @BILL_ID, DATE_BILL = @DATE_BILL, DISEA" +
				"SE = @DISEASE, COST_MEDICINE = @COST_MEDICINE, COST_DOCTOR = @COST_DOCTOR, COST_" +
				"ROOM = @COST_ROOM, COST_TREAT = @COST_TREAT, COST_OTHER = @COST_OTHER, COST_SUM " +
				"= @COST_SUM, HSTATUS = @HSTATUS, HOSPMAIN = @HOSPMAIN, HOSPSUB = @HOSPSUB, HOSPS" +
				"TATUS = @HOSPSTATUS WHERE (BILL_ID = @Original_BILL_ID) AND (DATE_BILL = @Origin" +
				"al_DATE_BILL) AND (PID = @Original_PID) AND (COST_DOCTOR = @Original_COST_DOCTOR" +
				" OR @Original_COST_DOCTOR IS NULL AND COST_DOCTOR IS NULL) AND (COST_MEDICINE = " +
				"@Original_COST_MEDICINE OR @Original_COST_MEDICINE IS NULL AND COST_MEDICINE IS " +
				"NULL) AND (COST_OTHER = @Original_COST_OTHER OR @Original_COST_OTHER IS NULL AND" +
				" COST_OTHER IS NULL) AND (COST_ROOM = @Original_COST_ROOM OR @Original_COST_ROOM" +
				" IS NULL AND COST_ROOM IS NULL) AND (COST_SUM = @Original_COST_SUM OR @Original_" +
				"COST_SUM IS NULL AND COST_SUM IS NULL) AND (COST_TREAT = @Original_COST_TREAT OR" +
				" @Original_COST_TREAT IS NULL AND COST_TREAT IS NULL) AND (DISEASE = @Original_D" +
				"ISEASE OR @Original_DISEASE IS NULL AND DISEASE IS NULL) AND (HOSPMAIN = @Origin" +
				"al_HOSPMAIN OR @Original_HOSPMAIN IS NULL AND HOSPMAIN IS NULL) AND (HOSPSTATUS " +
				"= @Original_HOSPSTATUS OR @Original_HOSPSTATUS IS NULL AND HOSPSTATUS IS NULL) A" +
				"ND (HOSPSUB = @Original_HOSPSUB OR @Original_HOSPSUB IS NULL AND HOSPSUB IS NULL" +
				") AND (HSTATUS = @Original_HSTATUS OR @Original_HSTATUS IS NULL AND HSTATUS IS N" +
				"ULL); SELECT PID, BILL_ID, DATE_BILL, DISEASE, COST_MEDICINE, COST_DOCTOR, COST_" +
				"ROOM, COST_TREAT, COST_OTHER, COST_SUM, HSTATUS, HOSPMAIN, HOSPSUB, HOSPSTATUS F" +
				"ROM CLEARING WHERE (BILL_ID = @BILL_ID) AND (DATE_BILL = @DATE_BILL) AND (PID = " +
				"@PID)";
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
			this.sqlDeleteCommand1.CommandText = @"DELETE FROM CLEARING WHERE (BILL_ID = @Original_BILL_ID) AND (DATE_BILL = @Original_DATE_BILL) AND (PID = @Original_PID) AND (COST_DOCTOR = @Original_COST_DOCTOR OR @Original_COST_DOCTOR IS NULL AND COST_DOCTOR IS NULL) AND (COST_MEDICINE = @Original_COST_MEDICINE OR @Original_COST_MEDICINE IS NULL AND COST_MEDICINE IS NULL) AND (COST_OTHER = @Original_COST_OTHER OR @Original_COST_OTHER IS NULL AND COST_OTHER IS NULL) AND (COST_ROOM = @Original_COST_ROOM OR @Original_COST_ROOM IS NULL AND COST_ROOM IS NULL) AND (COST_SUM = @Original_COST_SUM OR @Original_COST_SUM IS NULL AND COST_SUM IS NULL) AND (COST_TREAT = @Original_COST_TREAT OR @Original_COST_TREAT IS NULL AND COST_TREAT IS NULL) AND (DISEASE = @Original_DISEASE OR @Original_DISEASE IS NULL AND DISEASE IS NULL) AND (HOSPMAIN = @Original_HOSPMAIN OR @Original_HOSPMAIN IS NULL AND HOSPMAIN IS NULL) AND (HOSPSTATUS = @Original_HOSPSTATUS OR @Original_HOSPSTATUS IS NULL AND HOSPSTATUS IS NULL) AND (HOSPSUB = @Original_HOSPSUB OR @Original_HOSPSUB IS NULL AND HOSPSUB IS NULL) AND (HSTATUS = @Original_HSTATUS OR @Original_HSTATUS IS NULL AND HSTATUS IS NULL)";
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

			//			this.sqlConnection1.ConnectionString = "data source=EKOC;initial catalog=datahospital;integrated security=SSPI;persist se" +
			//				"curity info=False;user id=dbhospital;workstation id=EKOC;packet size=4096";
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
			// 
			// dataSet11
			// 
			sqlDataAdapter1.Fill(dataSet11);
			oRpt.SetDataSource(dataSet11);
 
			this.dataSet11.DataSetName = "DataSet1";
			this.dataSet11.Locale = new System.Globalization.CultureInfo("th-TH");
			this.dataSet11.Namespace = "http://www.tempuri.org/DataSet1.xsd";
			// 
			// crystalReportViewer1
			// 
			this.crystalReportViewer1.ActiveViewIndex = -1;
			this.crystalReportViewer1.Location = new System.Drawing.Point(0, 96);
			this.crystalReportViewer1.Name = "crystalReportViewer1";
//			this.crystalReportViewer1.ReportSource = "C:\\Documents and Settings\\Soowit\\My Documents\\Visual Studio Projects\\HospitalApp\\" +
//				"MonthReport.rpt";
			this.crystalReportViewer1.ReportSource = oRpt;
			this.crystalReportViewer1.Size = new System.Drawing.Size(1024, 700);
			this.crystalReportViewer1.TabIndex = 7;
			this.crystalReportViewer1.Visible = false;
			// 
			// monthreport
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(1016, 734);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.crystalReportViewer1,
																		  this.Monthgroup});
			this.Location = new System.Drawing.Point(0, 96);
			this.Name = "monthreport";
			this.Text = "monthreport";
			this.Monthgroup.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.dataSet11)).EndInit();
			this.ResumeLayout(false);


		}
		#endregion

		private void reportbutton_Click(object sender, System.EventArgs e)
		{
			String temp1 = monthtextBox.Text;
			String MM = temp1.Substring(0,2);
			String YYYY = temp1.Substring(3,4);
			String temp01 = YYYY + "-" + MM + "-" + "01";
			String temp31 = YYYY + "-" + MM + "-" + "31";
			String input = "{CLEARING.DATE_BILL} ='" + temp01 + "'" + "to" + "'" + temp31 + "'";
			crystalReportViewer1.SelectionFormula = input;
			crystalReportViewer1.Visible=true;
			crystalReportViewer1.Show();	
		}
	}
}
