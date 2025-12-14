using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace MobileHospital1
{
	/// <summary>
	/// Summary description for History.
	/// </summary>
	public class History : System.Windows.Forms.Form
	{
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.ListView listView1;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.ColumnHeader columnHeader2;
		private System.Windows.Forms.ColumnHeader columnHeader3;
		private System.Windows.Forms.ColumnHeader columnHeader4;
		private System.Windows.Forms.ColumnHeader columnHeader5;
		private System.Windows.Forms.ColumnHeader columnHeader6;
		private System.Windows.Forms.ColumnHeader columnHeader7;
		private System.Windows.Forms.ColumnHeader columnHeader8;
		private System.Windows.Forms.ColumnHeader columnHeader9;
		private System.Windows.Forms.ColumnHeader columnHeader10;
		private System.Windows.Forms.ColumnHeader columnHeader11;
		private System.Windows.Forms.ColumnHeader columnHeader12;
		private System.Windows.Forms.ColumnHeader columnHeader13;
		private System.Windows.Forms.ColumnHeader columnHeader14;
		private System.Windows.Forms.ColumnHeader columnHeader15;
		private System.Windows.Forms.ColumnHeader columnHeader16;
		private System.Windows.Forms.ColumnHeader columnHeader17;
		private System.Windows.Forms.ColumnHeader columnHeader18;
		private System.Windows.Forms.ColumnHeader columnHeader19;
		private System.Windows.Forms.ColumnHeader columnHeader20;
		private System.Windows.Forms.ColumnHeader columnHeader21;
		private System.Windows.Forms.ColumnHeader columnHeader22;
		private System.Windows.Forms.ColumnHeader columnHeader23;
		private System.Windows.Forms.ColumnHeader columnHeader24;
		private System.Windows.Forms.ColumnHeader columnHeader25;
		private System.Windows.Forms.ColumnHeader columnHeader26;
		private System.Windows.Forms.ColumnHeader columnHeader27;
		private System.Windows.Forms.ColumnHeader columnHeader28;
		private System.Windows.Forms.ColumnHeader columnHeader29;
		private System.Windows.Forms.ColumnHeader columnHeader30;
		private System.Windows.Forms.ColumnHeader columnHeader31;
		private System.Windows.Forms.ColumnHeader columnHeader32;
		private System.Windows.Forms.ColumnHeader columnHeader33;
		private System.Windows.Forms.ColumnHeader columnHeader34;
		private System.Windows.Forms.ColumnHeader columnHeader35;
		private System.Windows.Forms.Label label1;
		//public string PID;
	
		public History()
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
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.label9 = new System.Windows.Forms.Label();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.listView1 = new System.Windows.Forms.ListView();
			this.columnHeader31 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader33 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader34 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader35 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader3 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader4 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader5 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader6 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader7 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader8 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader9 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader10 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader11 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader12 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader13 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader14 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader15 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader16 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader17 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader18 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader19 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader20 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader21 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader22 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader23 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader24 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader25 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader26 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader27 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader28 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader29 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader30 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader32 = new System.Windows.Forms.ColumnHeader();
			this.label1 = new System.Windows.Forms.Label();
			// 
			// label9
			// 
			this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label9.Location = new System.Drawing.Point(8, 8);
			this.label9.Size = new System.Drawing.Size(224, 20);
			this.label9.Text = "HOSTORY  CLINICAL";
			this.label9.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// textBox1
			// 
			this.textBox1.BackColor = System.Drawing.SystemColors.Control;
			this.textBox1.Location = new System.Drawing.Point(120, 40);
			this.textBox1.Text = "";
			this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
			// 
			// listView1
			// 
			this.listView1.Columns.Add(this.columnHeader31);
			this.listView1.Columns.Add(this.columnHeader1);
			this.listView1.Columns.Add(this.columnHeader2);
			this.listView1.Columns.Add(this.columnHeader33);
			this.listView1.Columns.Add(this.columnHeader34);
			this.listView1.Columns.Add(this.columnHeader35);
			this.listView1.Columns.Add(this.columnHeader3);
			this.listView1.Columns.Add(this.columnHeader4);
			this.listView1.Columns.Add(this.columnHeader5);
			this.listView1.Columns.Add(this.columnHeader6);
			this.listView1.Columns.Add(this.columnHeader7);
			this.listView1.Columns.Add(this.columnHeader8);
			this.listView1.Columns.Add(this.columnHeader9);
			this.listView1.Columns.Add(this.columnHeader10);
			this.listView1.Columns.Add(this.columnHeader11);
			this.listView1.Columns.Add(this.columnHeader12);
			this.listView1.Columns.Add(this.columnHeader13);
			this.listView1.Columns.Add(this.columnHeader14);
			this.listView1.Columns.Add(this.columnHeader15);
			this.listView1.Columns.Add(this.columnHeader16);
			this.listView1.Columns.Add(this.columnHeader17);
			this.listView1.Columns.Add(this.columnHeader18);
			this.listView1.Columns.Add(this.columnHeader19);
			this.listView1.Columns.Add(this.columnHeader20);
			this.listView1.Columns.Add(this.columnHeader21);
			this.listView1.Columns.Add(this.columnHeader22);
			this.listView1.Columns.Add(this.columnHeader23);
			this.listView1.Columns.Add(this.columnHeader24);
			this.listView1.Columns.Add(this.columnHeader25);
			this.listView1.Columns.Add(this.columnHeader26);
			this.listView1.Columns.Add(this.columnHeader27);
			this.listView1.Columns.Add(this.columnHeader28);
			this.listView1.Columns.Add(this.columnHeader29);
			this.listView1.Columns.Add(this.columnHeader30);
			this.listView1.Columns.Add(this.columnHeader32);
			this.listView1.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
			this.listView1.Location = new System.Drawing.Point(16, 72);
			this.listView1.Size = new System.Drawing.Size(208, 176);
			this.listView1.View = System.Windows.Forms.View.Details;
			// 
			// columnHeader31
			// 
			this.columnHeader31.Text = "No.";
			this.columnHeader31.Width = 35;
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Date";
			this.columnHeader1.Width = 80;
			// 
			// columnHeader2
			// 
			this.columnHeader2.Text = "Time";
			this.columnHeader2.Width = 50;
			// 
			// columnHeader33
			// 
			this.columnHeader33.Text = "RoomNo";
			this.columnHeader33.Width = 60;
			// 
			// columnHeader34
			// 
			this.columnHeader34.Text = "RoomType";
			this.columnHeader34.Width = 60;
			// 
			// columnHeader35
			// 
			this.columnHeader35.Text = "Bed";
			this.columnHeader35.Width = 35;
			// 
			// columnHeader3
			// 
			this.columnHeader3.Text = "Degree";
			this.columnHeader3.Width = 60;
			// 
			// columnHeader4
			// 
			this.columnHeader4.Text = "Pulse";
			this.columnHeader4.Width = 40;
			// 
			// columnHeader5
			// 
			this.columnHeader5.Text = "Respiration";
			this.columnHeader5.Width = 60;
			// 
			// columnHeader6
			// 
			this.columnHeader6.Text = "Systolic";
			this.columnHeader6.Width = 60;
			// 
			// columnHeader7
			// 
			this.columnHeader7.Text = "Diastolic";
			this.columnHeader7.Width = 60;
			// 
			// columnHeader8
			// 
			this.columnHeader8.Text = "BloodPress";
			this.columnHeader8.Width = 60;
			// 
			// columnHeader9
			// 
			this.columnHeader9.Text = "Stools";
			this.columnHeader9.Width = 60;
			// 
			// columnHeader10
			// 
			this.columnHeader10.Text = "Urine";
			this.columnHeader10.Width = 60;
			// 
			// columnHeader11
			// 
			this.columnHeader11.Text = "State";
			this.columnHeader11.Width = 60;
			// 
			// columnHeader12
			// 
			this.columnHeader12.Text = "Diagnosis";
			this.columnHeader12.Width = 60;
			// 
			// columnHeader13
			// 
			this.columnHeader13.Text = "NotEat";
			this.columnHeader13.Width = 60;
			// 
			// columnHeader14
			// 
			this.columnHeader14.Text = "DoctorID";
			this.columnHeader14.Width = 60;
			// 
			// columnHeader15
			// 
			this.columnHeader15.Text = "DoctorName";
			this.columnHeader15.Width = 60;
			// 
			// columnHeader16
			// 
			this.columnHeader16.Text = "Midicine1";
			this.columnHeader16.Width = 60;
			// 
			// columnHeader17
			// 
			this.columnHeader17.Text = "Quantity1";
			this.columnHeader17.Width = 60;
			// 
			// columnHeader18
			// 
			this.columnHeader18.Text = "Midicine2";
			this.columnHeader18.Width = 60;
			// 
			// columnHeader19
			// 
			this.columnHeader19.Text = "Quantity2";
			this.columnHeader19.Width = 60;
			// 
			// columnHeader20
			// 
			this.columnHeader20.Text = "Midicine3";
			this.columnHeader20.Width = 60;
			// 
			// columnHeader21
			// 
			this.columnHeader21.Text = "Quantity3";
			this.columnHeader21.Width = 60;
			// 
			// columnHeader22
			// 
			this.columnHeader22.Text = "Midicine4";
			this.columnHeader22.Width = 60;
			// 
			// columnHeader23
			// 
			this.columnHeader23.Text = "Quantity4";
			this.columnHeader23.Width = 60;
			// 
			// columnHeader24
			// 
			this.columnHeader24.Text = "Midicine5";
			this.columnHeader24.Width = 60;
			// 
			// columnHeader25
			// 
			this.columnHeader25.Text = "Quantity5";
			this.columnHeader25.Width = 60;
			// 
			// columnHeader26
			// 
			this.columnHeader26.Text = "Midicine6";
			this.columnHeader26.Width = 60;
			// 
			// columnHeader27
			// 
			this.columnHeader27.Text = "Quantity6";
			this.columnHeader27.Width = 60;
			// 
			// columnHeader28
			// 
			this.columnHeader28.Text = "Midicine7";
			this.columnHeader28.Width = 60;
			// 
			// columnHeader29
			// 
			this.columnHeader29.Text = "Quantity7";
			this.columnHeader29.Width = 60;
			// 
			// columnHeader30
			// 
			this.columnHeader30.Text = "Midicine8";
			this.columnHeader30.Width = 60;
			// 
			// columnHeader32
			// 
			this.columnHeader32.Text = "Quantity8";
			this.columnHeader32.Width = 60;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(24, 40);
			this.label1.Size = new System.Drawing.Size(96, 20);
			this.label1.Text = "History Clinical of";
			// 
			// History
			// 
			this.Controls.Add(this.label1);
			this.Controls.Add(this.listView1);
			this.Controls.Add(this.textBox1);
			this.Controls.Add(this.label9);
			this.Text = "History";
			this.Load += new System.EventHandler(this.History_Load);

		}
		#endregion

		private void textBox1_TextChanged(object sender, System.EventArgs e)
		{
		
		}
		public void GetPID(String id) 
		{
			//PID = id;
			textBox1.Text = id;
			GetData();			
		}

		private void GetData() 
		{
			//int count;
			string PID;
			bool CheckLogin;
		

			MHWS.Service1 service = new MHWS.Service1();
			PID = textBox1.Text;
			CheckLogin = service.CheckPatient(PID);
			if(CheckLogin==true)
			{
				this.Show();
				//MHWS.tbltestrecord[] data;	
				MHWS.tbltestrecord[] data = service.GetHistoryClinical(PID);	
				
				//data = service.GetHistoryClinical(PID);
				int count = data.Length;
				for(int i=count;i>0;i--)
				{
					string[] a = new string[] {((count-i)+1).ToString(),data[i-1].Date,data[i-1].Time,data[i-1].RoomNo,data[i-1].RoomTypeID,data[i-1].Bed,data[i-1].Degree,data[i-1].Pulse,data[i-1].Respiration,data[i-1].Systolic,data[i-1].Diastolic,data[i-1].BloodPress,data[i-1].Stools,data[i-1].Urine,data[i-1].State,data[i-1].Diagnosis,data[i-1].NotEat,data[i-1].DoctorID,data[i-1].MedicationRecord};
					//string[] a = new string[] {data[i].Date,data[i].Time};
					ListViewItem b = new ListViewItem(a);
					listView1.Items.Add(b);
				}
				
			} 
			else
			{
				MessageBox.Show("Please ID Patient","NO Patient");
			}
		}

		private void History_Load(object sender, System.EventArgs e)
		{
			//ColumnHeader colFirst = listView1.Columns.Add("
			//Application.Exit();
		}
	}
}
