using System;
using System.Drawing;
using System.Collections;
using System.Data;
using System.ComponentModel;
using System.Windows.Forms;
using System.IO;

namespace HealthyApp
{
	/// <summary>
	/// Summary description for LogfilePerMonth.
	/// </summary>
	public class LogfilePerMonth : System.Windows.Forms.Form
	{
		private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer1;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.Form mainForm;
		private System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		private System.Data.SqlClient.SqlCommand sqlUpdateCommand1;
		private System.Data.SqlClient.SqlCommand sqlDeleteCommand1;
		private System.Data.SqlClient.SqlConnection sqlConnection1;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
		private HealthyApp.MonthDataset monthDataset1;
		private String conStr;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public LogfilePerMonth(System.Windows.Forms.Form mainForm)
		{
			//
			// Required for Windows Form Designer support
			//
			this.mainForm=mainForm;
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}
		public LogfilePerMonth()
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
			mainForm.Enabled=true;
			mainForm.Focus();
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
			this.crystalReportViewer1 = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.label1 = new System.Windows.Forms.Label();
			this.button1 = new System.Windows.Forms.Button();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlConnection1 = new System.Data.SqlClient.SqlConnection();
			this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlUpdateCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDeleteCommand1 = new System.Data.SqlClient.SqlCommand();
			this.sqlDataAdapter1 = new System.Data.SqlClient.SqlDataAdapter();
			this.monthDataset1 = new HealthyApp.MonthDataset();
			this.groupBox1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.monthDataset1)).BeginInit();
			this.SuspendLayout();
			// 
			// crystalReportViewer1
			// 
			this.crystalReportViewer1.ActiveViewIndex = -1;
			this.crystalReportViewer1.DisplayGroupTree = false;
			this.crystalReportViewer1.Location = new System.Drawing.Point(8, 64);
			this.crystalReportViewer1.Name = "crystalReportViewer1";
			this.crystalReportViewer1.ReportSource = "C:\\Documents and Settings\\Soowit\\My Documents\\Visual Studio Projects\\HealthyApp\\L" +
				"ogfileMonth.rpt";
			this.crystalReportViewer1.Size = new System.Drawing.Size(776, 496);
			this.crystalReportViewer1.TabIndex = 3;
			this.crystalReportViewer1.Visible = false;
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.label1,
																					this.button1,
																					this.textBox1});
			this.groupBox1.Location = new System.Drawing.Point(16, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(328, 48);
			this.groupBox1.TabIndex = 2;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Input";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(16, 19);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(72, 16);
			this.label1.TabIndex = 2;
			this.label1.Text = "Month - Year";
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(248, 16);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(64, 24);
			this.button1.TabIndex = 1;
			this.button1.Text = "Report";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// textBox1
			// 
			this.textBox1.Location = new System.Drawing.Point(96, 16);
			this.textBox1.Name = "textBox1";
			this.textBox1.Size = new System.Drawing.Size(136, 20);
			this.textBox1.TabIndex = 0;
			this.textBox1.Text = "";
			// 
			// sqlSelectCommand1
			// 
			this.sqlSelectCommand1.CommandText = "SELECT PID, Day_Change, Status_Change, TITLE, FNAME, LNAME, SEX, BDATE, ADDRESS, " +
				"MOO, TAMBON, AMPHUR, PROVINCE FROM dbo.Logfile";
			this.sqlSelectCommand1.Connection = this.sqlConnection1;
			// 
			// sqlInsertCommand1
			// 
			this.sqlInsertCommand1.CommandText = @"INSERT INTO dbo.Logfile(PID, Day_Change, Status_Change, TITLE, FNAME, LNAME, SEX, BDATE, ADDRESS, MOO, TAMBON, AMPHUR, PROVINCE) VALUES (@PID, @Day_Change, @Status_Change, @TITLE, @FNAME, @LNAME, @SEX, @BDATE, @ADDRESS, @MOO, @TAMBON, @AMPHUR, @PROVINCE); SELECT PID, Day_Change, Status_Change, TITLE, FNAME, LNAME, SEX, BDATE, ADDRESS, MOO, TAMBON, AMPHUR, PROVINCE FROM dbo.Logfile WHERE (Day_Change = @Day_Change) AND (PID = @PID) AND (Status_Change = @Status_Change)";
			this.sqlInsertCommand1.Connection = this.sqlConnection1;
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Day_Change", System.Data.SqlDbType.VarChar, 10, "Day_Change"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Status_Change", System.Data.SqlDbType.VarChar, 1, "Status_Change"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TITLE", System.Data.SqlDbType.VarChar, 3, "TITLE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 30, "FNAME"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 30, "LNAME"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SEX", System.Data.SqlDbType.VarChar, 1, "SEX"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@BDATE", System.Data.SqlDbType.VarChar, 10, "BDATE"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADDRESS", System.Data.SqlDbType.VarChar, 75, "ADDRESS"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MOO", System.Data.SqlDbType.VarChar, 3, "MOO"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TAMBON", System.Data.SqlDbType.VarChar, 6, "TAMBON"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@AMPHUR", System.Data.SqlDbType.VarChar, 6, "AMPHUR"));
			this.sqlInsertCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PROVINCE", System.Data.SqlDbType.VarChar, 6, "PROVINCE"));
			// 
			// sqlUpdateCommand1
			// 
			this.sqlUpdateCommand1.CommandText = @"UPDATE dbo.Logfile SET PID = @PID, Day_Change = @Day_Change, Status_Change = @Status_Change, TITLE = @TITLE, FNAME = @FNAME, LNAME = @LNAME, SEX = @SEX, BDATE = @BDATE, ADDRESS = @ADDRESS, MOO = @MOO, TAMBON = @TAMBON, AMPHUR = @AMPHUR, PROVINCE = @PROVINCE WHERE (Day_Change = @Original_Day_Change) AND (PID = @Original_PID) AND (Status_Change = @Original_Status_Change) AND (ADDRESS = @Original_ADDRESS OR @Original_ADDRESS IS NULL AND ADDRESS IS NULL) AND (AMPHUR = @Original_AMPHUR OR @Original_AMPHUR IS NULL AND AMPHUR IS NULL) AND (BDATE = @Original_BDATE OR @Original_BDATE IS NULL AND BDATE IS NULL) AND (FNAME = @Original_FNAME OR @Original_FNAME IS NULL AND FNAME IS NULL) AND (LNAME = @Original_LNAME OR @Original_LNAME IS NULL AND LNAME IS NULL) AND (MOO = @Original_MOO OR @Original_MOO IS NULL AND MOO IS NULL) AND (PROVINCE = @Original_PROVINCE OR @Original_PROVINCE IS NULL AND PROVINCE IS NULL) AND (SEX = @Original_SEX OR @Original_SEX IS NULL AND SEX IS NULL) AND (TAMBON = @Original_TAMBON OR @Original_TAMBON IS NULL AND TAMBON IS NULL) AND (TITLE = @Original_TITLE OR @Original_TITLE IS NULL AND TITLE IS NULL); SELECT PID, Day_Change, Status_Change, TITLE, FNAME, LNAME, SEX, BDATE, ADDRESS, MOO, TAMBON, AMPHUR, PROVINCE FROM dbo.Logfile WHERE (Day_Change = @Day_Change) AND (PID = @PID) AND (Status_Change = @Status_Change)";
			this.sqlUpdateCommand1.Connection = this.sqlConnection1;
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PID", System.Data.SqlDbType.VarChar, 13, "PID"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Day_Change", System.Data.SqlDbType.VarChar, 10, "Day_Change"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Status_Change", System.Data.SqlDbType.VarChar, 1, "Status_Change"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TITLE", System.Data.SqlDbType.VarChar, 3, "TITLE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 30, "FNAME"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 30, "LNAME"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SEX", System.Data.SqlDbType.VarChar, 1, "SEX"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@BDATE", System.Data.SqlDbType.VarChar, 10, "BDATE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ADDRESS", System.Data.SqlDbType.VarChar, 75, "ADDRESS"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MOO", System.Data.SqlDbType.VarChar, 3, "MOO"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TAMBON", System.Data.SqlDbType.VarChar, 6, "TAMBON"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@AMPHUR", System.Data.SqlDbType.VarChar, 6, "AMPHUR"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PROVINCE", System.Data.SqlDbType.VarChar, 6, "PROVINCE"));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_Day_Change", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "Day_Change", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_Status_Change", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "Status_Change", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_ADDRESS", System.Data.SqlDbType.VarChar, 75, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "ADDRESS", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_AMPHUR", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "AMPHUR", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_BDATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "BDATE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FNAME", System.Data.SqlDbType.VarChar, 30, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_LNAME", System.Data.SqlDbType.VarChar, 30, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "LNAME", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_MOO", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "MOO", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PROVINCE", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PROVINCE", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_SEX", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "SEX", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TAMBON", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TAMBON", System.Data.DataRowVersion.Original, null));
			this.sqlUpdateCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TITLE", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TITLE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDeleteCommand1
			// 
			this.sqlDeleteCommand1.CommandText = @"DELETE FROM dbo.Logfile WHERE (Day_Change = @Original_Day_Change) AND (PID = @Original_PID) AND (Status_Change = @Original_Status_Change) AND (ADDRESS = @Original_ADDRESS OR @Original_ADDRESS IS NULL AND ADDRESS IS NULL) AND (AMPHUR = @Original_AMPHUR OR @Original_AMPHUR IS NULL AND AMPHUR IS NULL) AND (BDATE = @Original_BDATE OR @Original_BDATE IS NULL AND BDATE IS NULL) AND (FNAME = @Original_FNAME OR @Original_FNAME IS NULL AND FNAME IS NULL) AND (LNAME = @Original_LNAME OR @Original_LNAME IS NULL AND LNAME IS NULL) AND (MOO = @Original_MOO OR @Original_MOO IS NULL AND MOO IS NULL) AND (PROVINCE = @Original_PROVINCE OR @Original_PROVINCE IS NULL AND PROVINCE IS NULL) AND (SEX = @Original_SEX OR @Original_SEX IS NULL AND SEX IS NULL) AND (TAMBON = @Original_TAMBON OR @Original_TAMBON IS NULL AND TAMBON IS NULL) AND (TITLE = @Original_TITLE OR @Original_TITLE IS NULL AND TITLE IS NULL)";
			this.sqlDeleteCommand1.Connection = this.sqlConnection1;
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_Day_Change", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "Day_Change", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PID", System.Data.SqlDbType.VarChar, 13, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PID", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_Status_Change", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "Status_Change", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_ADDRESS", System.Data.SqlDbType.VarChar, 75, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "ADDRESS", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_AMPHUR", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "AMPHUR", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_BDATE", System.Data.SqlDbType.VarChar, 10, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "BDATE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_FNAME", System.Data.SqlDbType.VarChar, 30, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "FNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_LNAME", System.Data.SqlDbType.VarChar, 30, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "LNAME", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_MOO", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "MOO", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_PROVINCE", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "PROVINCE", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_SEX", System.Data.SqlDbType.VarChar, 1, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "SEX", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TAMBON", System.Data.SqlDbType.VarChar, 6, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TAMBON", System.Data.DataRowVersion.Original, null));
			this.sqlDeleteCommand1.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Original_TITLE", System.Data.SqlDbType.VarChar, 3, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "TITLE", System.Data.DataRowVersion.Original, null));
			// 
			// sqlDataAdapter1
			// 
			this.sqlDataAdapter1.DeleteCommand = this.sqlDeleteCommand1;
			this.sqlDataAdapter1.InsertCommand = this.sqlInsertCommand1;
			this.sqlDataAdapter1.SelectCommand = this.sqlSelectCommand1;
			this.sqlDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																									  new System.Data.Common.DataTableMapping("Table", "Logfile", new System.Data.Common.DataColumnMapping[] {
																																																				 new System.Data.Common.DataColumnMapping("PID", "PID"),
																																																				 new System.Data.Common.DataColumnMapping("Day_Change", "Day_Change"),
																																																				 new System.Data.Common.DataColumnMapping("Status_Change", "Status_Change"),
																																																				 new System.Data.Common.DataColumnMapping("TITLE", "TITLE"),
																																																				 new System.Data.Common.DataColumnMapping("FNAME", "FNAME"),
																																																				 new System.Data.Common.DataColumnMapping("LNAME", "LNAME"),
																																																				 new System.Data.Common.DataColumnMapping("SEX", "SEX"),
																																																				 new System.Data.Common.DataColumnMapping("BDATE", "BDATE"),
																																																				 new System.Data.Common.DataColumnMapping("ADDRESS", "ADDRESS"),
																																																				 new System.Data.Common.DataColumnMapping("MOO", "MOO"),
																																																				 new System.Data.Common.DataColumnMapping("TAMBON", "TAMBON"),
																																																				 new System.Data.Common.DataColumnMapping("AMPHUR", "AMPHUR"),
																																																				 new System.Data.Common.DataColumnMapping("PROVINCE", "PROVINCE")})});
			this.sqlDataAdapter1.UpdateCommand = this.sqlUpdateCommand1;
			// 
			// monthDataset1
			// 
			this.monthDataset1.DataSetName = "MonthDataset";
			this.monthDataset1.Locale = new System.Globalization.CultureInfo("th-TH");
			this.monthDataset1.Namespace = "http://www.tempuri.org/MonthDataset.xsd";
			// 
			// LogfilePerMonth
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(792, 566);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.crystalReportViewer1,
																		  this.groupBox1});
			this.Name = "LogfilePerMonth";
			this.Text = "Logfile For A Month";
			this.groupBox1.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.monthDataset1)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		private void button1_Click(object sender, System.EventArgs e)
		{
			String Temp = textBox1.Text;
			String YY = Temp.Substring(3,4);
			String MM = Temp.Substring(0,2);
			String MMYYYY = YY + "-"+ MM;
			String inputparam="{Logfile.Day_Change} in '"+MMYYYY+"-01' to '"+MMYYYY+"-31'";
			crystalReportViewer1.SelectionFormula=inputparam;
			crystalReportViewer1.RefreshReport();
			crystalReportViewer1.Visible=true;
			crystalReportViewer1.Show();
		}

	}
}
