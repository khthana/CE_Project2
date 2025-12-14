using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace HospitalApp
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.TabControl tabControl1;
		private System.Windows.Forms.TabPage tabPage1;
		private System.Windows.Forms.TabPage tabPage2;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label7;
		private String conStr;
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
			this.tabPage1 = new System.Windows.Forms.TabPage();
			this.button1 = new System.Windows.Forms.Button();
			this.tabPage2 = new System.Windows.Forms.TabPage();
			this.label7 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.label4 = new System.Windows.Forms.Label();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.button2 = new System.Windows.Forms.Button();
			this.label3 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.tabControl1.SuspendLayout();
			this.tabPage1.SuspendLayout();
			this.tabPage2.SuspendLayout();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			// 
			// tabControl1
			// 
			this.tabControl1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					  this.tabPage1,
																					  this.tabPage2});
			this.tabControl1.Location = new System.Drawing.Point(8, 8);
			this.tabControl1.Name = "tabControl1";
			this.tabControl1.SelectedIndex = 0;
			this.tabControl1.Size = new System.Drawing.Size(360, 208);
			this.tabControl1.TabIndex = 0;
			// 
			// tabPage1
			// 
			this.tabPage1.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.button1});
			this.tabPage1.Location = new System.Drawing.Point(4, 22);
			this.tabPage1.Name = "tabPage1";
			this.tabPage1.Size = new System.Drawing.Size(352, 182);
			this.tabPage1.TabIndex = 0;
			this.tabPage1.Text = "Report";
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(64, 72);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(224, 32);
			this.button1.TabIndex = 0;
			this.button1.Text = "Report Clearing Per Month";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// tabPage2
			// 
			this.tabPage2.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.label7,
																				   this.label6,
																				   this.label5,
																				   this.groupBox1,
																				   this.label3,
																				   this.label2,
																				   this.label1});
			this.tabPage2.Location = new System.Drawing.Point(4, 22);
			this.tabPage2.Name = "tabPage2";
			this.tabPage2.Size = new System.Drawing.Size(352, 182);
			this.tabPage2.TabIndex = 1;
			this.tabPage2.Text = "Config Information";
			// 
			// label7
			// 
			this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label7.ForeColor = System.Drawing.Color.Red;
			this.label7.Location = new System.Drawing.Point(151, 56);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(152, 24);
			this.label7.TabIndex = 9;
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(24, 56);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(88, 16);
			this.label6.TabIndex = 8;
			this.label6.Text = "Province ID";
			// 
			// label5
			// 
			this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label5.ForeColor = System.Drawing.Color.Red;
			this.label5.Location = new System.Drawing.Point(152, 88);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(176, 24);
			this.label5.TabIndex = 7;
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.label4,
																					this.textBox1,
																					this.button2});
			this.groupBox1.Location = new System.Drawing.Point(24, 120);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(304, 48);
			this.groupBox1.TabIndex = 6;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Change Hospital";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(22, 20);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(90, 16);
			this.label4.TabIndex = 4;
			this.label4.Text = "New Hospital ID";
			// 
			// textBox1
			// 
			this.textBox1.Location = new System.Drawing.Point(112, 16);
			this.textBox1.Name = "textBox1";
			this.textBox1.Size = new System.Drawing.Size(112, 20);
			this.textBox1.TabIndex = 1;
			this.textBox1.Text = "";
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(233, 15);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(55, 24);
			this.button2.TabIndex = 5;
			this.button2.Text = "Change";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(24, 88);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(88, 24);
			this.label3.TabIndex = 3;
			this.label3.Text = "Hospital Name :";
			// 
			// label2
			// 
			this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label2.ForeColor = System.Drawing.Color.Red;
			this.label2.Location = new System.Drawing.Point(152, 24);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(144, 24);
			this.label2.TabIndex = 2;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(24, 24);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(72, 16);
			this.label1.TabIndex = 0;
			this.label1.Text = "Hospital ID :";
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(376, 222);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.tabControl1});
			this.Name = "Form1";
			this.Text = "Hospital";
			this.Load += new System.EventHandler(this.Form1_Load);
			this.tabControl1.ResumeLayout(false);
			this.tabPage1.ResumeLayout(false);
			this.tabPage2.ResumeLayout(false);
			this.groupBox1.ResumeLayout(false);
			this.ResumeLayout(false);

			//
			conStr="";
			try
			{
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

		private void button2_Click(object sender, System.EventArgs e)
		{

			//			String strConn="data source=EKOC;initial catalog=datahospital;password=kucoke;persist security info=True;user id=dbhospital;workstation id=EKOC;packet size=4096";
			SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From HOSPITAL_INFO",conStr);
			SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

			DataSet dataSet1=new DataSet();
			DataTable logtable=new DataTable();
			logfileAdapter.Fill(dataSet1);
			logtable=dataSet1.Tables[0];
			if(logtable.Rows.Count!=0)
			{
				DataRow getAttr=logtable.Rows[0];
				getAttr["HMAIN"]=textBox1.Text;
				DataSet dataChange2=new DataSet();
				dataChange2=dataSet1.GetChanges(DataRowState.Modified);
				logfileAdapter.Update(dataChange2);	
			}
			else
			{
				DataRow createRows=logtable.NewRow();
				createRows[0]=textBox1.Text;
				logtable.Rows.Add(createRows);
				DataSet dataChange1=new DataSet();
				dataChange1=dataSet1.GetChanges(DataRowState.Added);
				logfileAdapter.Update(dataChange1);	
			}
			this.Form1_Load(this,null);
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{
			//String strConn="data source=EKOC;initial catalog=datahospital;password=kucoke;persist security info=True;user id=dbhospital;workstation id=EKOC;packet size=4096";
			SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From HOSPITAL_INFO",conStr);
			SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

			DataSet dataSet1=new DataSet();
			DataTable logtable=new DataTable();
			logfileAdapter.Fill(dataSet1);
			logtable=dataSet1.Tables[0];

			String hmain="";
			if(logtable.Rows.Count!=0)
			{
				DataRow getAttr=logtable.Rows[0];
				if(!getAttr["HMAIN"].ToString().Equals(""))
				{
					hmain=(String)getAttr["HMAIN"];
				}
				else{hmain="00001";}
			}
			else{hmain="00001";}

			label2.Text=hmain;


			SqlDataAdapter logfileAdapter2=new SqlDataAdapter("Select * From HOSPITALMAIN",conStr);
			SqlCommandBuilder buildCommand2=new SqlCommandBuilder(logfileAdapter2);

			DataSet dataSet2=new DataSet();
			DataTable logtable2=new DataTable();
			logfileAdapter2.Fill(dataSet2);
			logtable2=dataSet2.Tables[0];

			String hmain_name="";
			String hmain_province="";
			DataRow[] getAttr2=logtable2.Select("HMAIN="+hmain);
			if(getAttr2.Length!=0)
			{
				if(!getAttr2[0]["HMAIN"].ToString().Equals(""))
				{
					hmain_name=(String)getAttr2[0]["HNAME"];
					hmain_province=(String)getAttr2[0]["PURCHASEPROVINCE"];
				}
			}
			else{hmain_name="noname"; hmain_province="noprovince";}
			label5.Text=hmain_name;
			label7.Text=hmain_province;
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			monthreport m = new monthreport();
			m.Show();
			m.Focus();
		}		

	}
}
