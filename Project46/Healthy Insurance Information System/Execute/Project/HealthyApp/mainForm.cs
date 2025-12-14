using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace HealthyApp
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.TabControl tabControl1;
		private System.Windows.Forms.TabPage tabPage2;
		private System.Windows.Forms.TabPage tabPage3;
		private System.Windows.Forms.Button button4;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.ComboBox comboBox1;
		private System.Windows.Forms.ComboBox comboBox2;
		private System.Windows.Forms.Button button5;
		private String Changhos;
		private String Accident;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form1()
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
				if (components != null) 
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
			this.tabControl1 = new System.Windows.Forms.TabControl();
			this.tabPage3 = new System.Windows.Forms.TabPage();
			this.button5 = new System.Windows.Forms.Button();
			this.button4 = new System.Windows.Forms.Button();
			this.tabPage2 = new System.Windows.Forms.TabPage();
			this.comboBox2 = new System.Windows.Forms.ComboBox();
			this.comboBox1 = new System.Windows.Forms.ComboBox();
			this.label2 = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.tabControl1.SuspendLayout();
			this.tabPage3.SuspendLayout();
			this.tabPage2.SuspendLayout();
			this.SuspendLayout();
			// 
			// tabControl1
			// 
			this.tabControl1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					  this.tabPage3,
																					  this.tabPage2});
			this.tabControl1.Location = new System.Drawing.Point(8, 8);
			this.tabControl1.Name = "tabControl1";
			this.tabControl1.SelectedIndex = 0;
			this.tabControl1.Size = new System.Drawing.Size(344, 176);
			this.tabControl1.TabIndex = 0;
			// 
			// tabPage3
			// 
			this.tabPage3.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.button5,
																				   this.button4});
			this.tabPage3.Location = new System.Drawing.Point(4, 22);
			this.tabPage3.Name = "tabPage3";
			this.tabPage3.Size = new System.Drawing.Size(336, 150);
			this.tabPage3.TabIndex = 2;
			this.tabPage3.Text = "Report Healthy Insurance";
			// 
			// button5
			// 
			this.button5.Location = new System.Drawing.Point(48, 88);
			this.button5.Name = "button5";
			this.button5.Size = new System.Drawing.Size(248, 40);
			this.button5.TabIndex = 2;
			this.button5.Text = "Log File For A Month";
			this.button5.Click += new System.EventHandler(this.button5_Click);
			// 
			// button4
			// 
			this.button4.Location = new System.Drawing.Point(48, 32);
			this.button4.Name = "button4";
			this.button4.Size = new System.Drawing.Size(248, 40);
			this.button4.TabIndex = 0;
			this.button4.Text = "Register For A Month";
			this.button4.Click += new System.EventHandler(this.button4_Click);
			// 
			// tabPage2
			// 
			this.tabPage2.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.comboBox2,
																				   this.comboBox1,
																				   this.label2,
																				   this.label1});
			this.tabPage2.Location = new System.Drawing.Point(4, 22);
			this.tabPage2.Name = "tabPage2";
			this.tabPage2.Size = new System.Drawing.Size(336, 150);
			this.tabPage2.TabIndex = 1;
			this.tabPage2.Text = "Config Information";
			// 
			// comboBox2
			// 
			this.comboBox2.Items.AddRange(new object[] {
														   "0",
														   "1",
														   "2",
														   "3",
														   "4",
														   "5"});
			this.comboBox2.Location = new System.Drawing.Point(248, 72);
			this.comboBox2.Name = "comboBox2";
			this.comboBox2.Size = new System.Drawing.Size(64, 21);
			this.comboBox2.TabIndex = 4;
			this.comboBox2.SelectedIndexChanged += new System.EventHandler(this.comboBox2_SelectedIndexChanged);
			// 
			// comboBox1
			// 
			this.comboBox1.Items.AddRange(new object[] {
														   "0",
														   "1",
														   "2",
														   "3",
														   "4",
														   "5"});
			this.comboBox1.Location = new System.Drawing.Point(248, 32);
			this.comboBox1.Name = "comboBox1";
			this.comboBox1.Size = new System.Drawing.Size(64, 21);
			this.comboBox1.TabIndex = 3;
			this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(32, 80);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(184, 16);
			this.label2.TabIndex = 2;
			this.label2.Text = "จำนวนครั้งในการเปลี่ยนโรงพยาบาลต่อปี";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(32, 40);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(168, 16);
			this.label1.TabIndex = 1;
			this.label1.Text = "จำนวนครั้งในการใช้สิทธิ์อุบัติเหตุต่อปี";
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(368, 198);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.tabControl1});
			this.Name = "Form1";
			this.Text = "Healthy Insurance Information System";
			this.Load += new System.EventHandler(this.Form1_Load);
			this.tabControl1.ResumeLayout(false);
			this.tabPage3.ResumeLayout(false);
			this.tabPage2.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}

		private void button5_Click(object sender, System.EventArgs e)
		{
			LogfilePerMonth perMonth=new LogfilePerMonth(this);
			this.Enabled=false;
			perMonth.Show();
			perMonth.Focus();
		}

		private void button4_Click(object sender, System.EventArgs e)
		{
			RegisterPerMonth rperMonth=new RegisterPerMonth(this);
			this.Enabled=false;
			rperMonth.Show();
			rperMonth.Focus();
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{
			//String strConn="data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";
			String conStr="";
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

			SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From HEALTHY_INFO",conStr);
			SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

			DataSet dataSet1=new DataSet();
			DataTable logtable=new DataTable();
			logfileAdapter.Fill(dataSet1);
			logtable=dataSet1.Tables[0];


			DataRow[] getAttr=logtable.Select("ID=0");
			if(!getAttr[0]["CHANGE_HOS"].ToString().Equals(""))
			{
				Changhos=(String)getAttr[0]["CHANGE_HOS"];
			}
			else{Changhos="0";}

			if(!getAttr[0]["ACCIDENT"].ToString().Equals(""))
			{
				Accident=(String)getAttr[0]["ACCIDENT"];
			}
			else{Accident="0";}

			comboBox1.SelectedIndex=Int32.Parse(Accident);
			comboBox2.SelectedIndex=Int32.Parse(Changhos);
		}

		private void comboBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			comboBoxChanged();
		}

		private void comboBox2_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			comboBoxChanged();		
		}
		private void comboBoxChanged()
		{
						
			//String strConn="data source=EKOC;initial catalog=datahealthy;password=kucoke;persist security info=True;user id=dbhealthy;workstation id=EKOC;packet size=4096";
			String conStr="";
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
			SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From HEALTHY_INFO",conStr);
			SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

			DataSet dataSet1=new DataSet();
			DataSet dataChange1=new DataSet();
			DataTable logtable=new DataTable();
			logfileAdapter.Fill(dataSet1);
			logtable=dataSet1.Tables[0];

			DataRow[] getAttr=logtable.Select("ID=0");

			getAttr[0]["CHANGE_HOS"]=comboBox2.SelectedIndex.ToString();
			getAttr[0]["ACCIDENT"]=comboBox1.SelectedIndex.ToString();
			dataChange1=dataSet1.GetChanges(DataRowState.Modified);
			logfileAdapter.Update(dataChange1);	
			
		}
	}
}
