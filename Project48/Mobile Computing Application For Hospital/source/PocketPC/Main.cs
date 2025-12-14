using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace MobileHospital1
{
	/// <summary>
	/// Summary description for Main.
	/// </summary>
	public class Main : System.Windows.Forms.Form
	{
		private System.Windows.Forms.TextBox TextIDPatient;
		private System.Windows.Forms.Button CmdOK;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button CmdBiography;
		private System.Windows.Forms.Button CmdHistory;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.TextBox TextRoomNo;
		private System.Windows.Forms.TextBox TextPatientName;
		private System.Windows.Forms.TextBox TextBed;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox TextRoomType;
		private System.Windows.Forms.TextBox TextSex;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.TextBox TextDisease;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.TextBox TextAdmission;
		public string RN,RTI;   //Global Variable
	
		public Main()
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
			this.label1 = new System.Windows.Forms.Label();
			this.TextIDPatient = new System.Windows.Forms.TextBox();
			this.CmdOK = new System.Windows.Forms.Button();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.TextRoomNo = new System.Windows.Forms.TextBox();
			this.TextPatientName = new System.Windows.Forms.TextBox();
			this.button1 = new System.Windows.Forms.Button();
			this.CmdBiography = new System.Windows.Forms.Button();
			this.CmdHistory = new System.Windows.Forms.Button();
			this.TextBed = new System.Windows.Forms.TextBox();
			this.label7 = new System.Windows.Forms.Label();
			this.TextRoomType = new System.Windows.Forms.TextBox();
			this.TextSex = new System.Windows.Forms.TextBox();
			this.button2 = new System.Windows.Forms.Button();
			this.TextDisease = new System.Windows.Forms.TextBox();
			this.TextAdmission = new System.Windows.Forms.TextBox();
			this.label8 = new System.Windows.Forms.Label();
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(32, 24);
			this.label1.Size = new System.Drawing.Size(64, 20);
			this.label1.Text = "RoomNo";
			// 
			// TextIDPatient
			// 
			this.TextIDPatient.BackColor = System.Drawing.SystemColors.Control;
			this.TextIDPatient.Location = new System.Drawing.Point(96, 104);
			this.TextIDPatient.Size = new System.Drawing.Size(112, 20);
			this.TextIDPatient.Text = "";
			// 
			// CmdOK
			// 
			this.CmdOK.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular);
			this.CmdOK.Location = new System.Drawing.Point(176, 24);
			this.CmdOK.Size = new System.Drawing.Size(32, 20);
			this.CmdOK.Text = "OK";
			this.CmdOK.Click += new System.EventHandler(this.CmdOK_Click);
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(32, 104);
			this.label2.Size = new System.Drawing.Size(64, 20);
			this.label2.Text = "Patient ID";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(24, 56);
			this.label3.Size = new System.Drawing.Size(72, 20);
			this.label3.Text = "Room Type";
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(40, 176);
			this.label6.Size = new System.Drawing.Size(56, 20);
			this.label6.Text = "Disease";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(8, 128);
			this.label4.Size = new System.Drawing.Size(88, 20);
			this.label4.Text = "Patient\'s Name";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(56, 152);
			this.label5.Size = new System.Drawing.Size(32, 16);
			this.label5.Text = "Sex";
			// 
			// TextRoomNo
			// 
			this.TextRoomNo.BackColor = System.Drawing.SystemColors.Window;
			this.TextRoomNo.Location = new System.Drawing.Point(96, 24);
			this.TextRoomNo.Size = new System.Drawing.Size(72, 20);
			this.TextRoomNo.Text = "";
			this.TextRoomNo.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
			// 
			// TextPatientName
			// 
			this.TextPatientName.BackColor = System.Drawing.SystemColors.Control;
			this.TextPatientName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular);
			this.TextPatientName.Location = new System.Drawing.Point(96, 128);
			this.TextPatientName.Size = new System.Drawing.Size(112, 22);
			this.TextPatientName.Text = "";
			// 
			// button1
			// 
			this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular);
			this.button1.Location = new System.Drawing.Point(136, 232);
			this.button1.Size = new System.Drawing.Size(56, 20);
			this.button1.Text = "Clinical";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// CmdBiography
			// 
			this.CmdBiography.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular);
			this.CmdBiography.Location = new System.Drawing.Point(64, 232);
			this.CmdBiography.Text = "Biography";
			this.CmdBiography.Click += new System.EventHandler(this.CmdBiography_Click);
			// 
			// CmdHistory
			// 
			this.CmdHistory.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular);
			this.CmdHistory.Location = new System.Drawing.Point(8, 232);
			this.CmdHistory.Size = new System.Drawing.Size(56, 20);
			this.CmdHistory.Text = "History";
			this.CmdHistory.Click += new System.EventHandler(this.CmdHistory_Click);
			// 
			// TextBed
			// 
			this.TextBed.BackColor = System.Drawing.SystemColors.Control;
			this.TextBed.Location = new System.Drawing.Point(96, 80);
			this.TextBed.Size = new System.Drawing.Size(112, 20);
			this.TextBed.Text = "";
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(56, 80);
			this.label7.Size = new System.Drawing.Size(40, 20);
			this.label7.Text = "Bed";
			// 
			// TextRoomType
			// 
			this.TextRoomType.BackColor = System.Drawing.SystemColors.Control;
			this.TextRoomType.Location = new System.Drawing.Point(96, 56);
			this.TextRoomType.Size = new System.Drawing.Size(112, 20);
			this.TextRoomType.Text = "";
			// 
			// TextSex
			// 
			this.TextSex.BackColor = System.Drawing.SystemColors.Control;
			this.TextSex.Location = new System.Drawing.Point(96, 155);
			this.TextSex.Size = new System.Drawing.Size(112, 20);
			this.TextSex.Text = "";
			// 
			// button2
			// 
			this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular);
			this.button2.Location = new System.Drawing.Point(192, 232);
			this.button2.Size = new System.Drawing.Size(40, 20);
			this.button2.Text = "Exit";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// TextDisease
			// 
			this.TextDisease.BackColor = System.Drawing.SystemColors.Control;
			this.TextDisease.Location = new System.Drawing.Point(96, 180);
			this.TextDisease.Size = new System.Drawing.Size(112, 20);
			this.TextDisease.Text = "";
			// 
			// TextAdmission
			// 
			this.TextAdmission.BackColor = System.Drawing.SystemColors.Control;
			this.TextAdmission.Location = new System.Drawing.Point(96, 205);
			this.TextAdmission.Size = new System.Drawing.Size(112, 20);
			this.TextAdmission.Text = "";
			// 
			// label8
			// 
			this.label8.Location = new System.Drawing.Point(8, 202);
			this.label8.Size = new System.Drawing.Size(88, 20);
			this.label8.Text = "DateAdmission";
			// 
			// Main
			// 
			this.Controls.Add(this.label8);
			this.Controls.Add(this.TextAdmission);
			this.Controls.Add(this.TextDisease);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.TextSex);
			this.Controls.Add(this.TextRoomType);
			this.Controls.Add(this.label7);
			this.Controls.Add(this.TextBed);
			this.Controls.Add(this.CmdBiography);
			this.Controls.Add(this.CmdHistory);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.TextPatientName);
			this.Controls.Add(this.TextRoomNo);
			this.Controls.Add(this.label6);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.CmdOK);
			this.Controls.Add(this.TextIDPatient);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label5);
			this.Menu = this.mainMenu1;
			this.Text = "Main";
			this.Load += new System.EventHandler(this.Main_Load);

		}
		#endregion

		public void CmdOK_Click(object sender, System.EventArgs e)
		{
			bool CheckLogin;

			MHWS.Service1 service = new MHWS.Service1();
			RN = TextRoomNo.Text;
			CheckLogin = service.CheckRoomNo(RN);
			if(CheckLogin==true)
			{
				string PID;
				MHWS.tblpatientbasicdata data;
				MHWS.tbltreathistory his;
				MHWS.tblroom room;
				MHWS.tbldisease disease;

				//data = service.GetPatient(RN);		 // tblpatientbasicdata		
				his = service.GetHistoryOrder(RN);  // tbltreathistory			
				room = service.GetRoomTypeName(RN); // tblroom,tbltreathistory
				disease = service.GetDisease(RN);   // tbldisease,tbltreathistory

				TextRoomType.Text    = room.RoomTypeName;
				TextIDPatient.Text	 = his.PatientID;				
				TextBed.Text         = his.Bed;
				//TextPatientName.Text = data.PatientName;				
				//TextSex.Text		 = data.Sex;
				TextDisease.Text     = disease.DiseaseName;
				TextAdmission.Text   = his.DateAdmission;

				//MHWS.tblpatientbasicdata data;
				PID = TextIDPatient.Text;
				RTI = his.RoomTypeID;
				data = service.GetPatient(PID);
				TextPatientName.Text = data.Name;				
				TextSex.Text		 = data.Sex;
			} 
			else
			{
				MessageBox.Show("InCorrect","ERROR");
			}		
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			//ClinicalRecord st = new ClinicalRecord();
			//st.Show();
			ClinicalRecord st = new ClinicalRecord();
			st.GetData(TextIDPatient.Text,TextRoomNo.Text,RTI,TextBed.Text);
			st.Show();

			TextIDPatient.Text = "";
			TextRoomType.Text = "";
			TextRoomNo.Text = "";
			TextBed.Text = "";
			TextPatientName.Text = "";
			TextSex.Text = "";
			TextDisease.Text = "";
			TextAdmission.Text = "";

		}

	    private void CmdBiography_Click(object sender, System.EventArgs e)
		{
			Biography st = new Biography();
			st.GetPID(TextIDPatient.Text);
			//st.Show();
		}

		private void CmdHistory_Click(object sender, System.EventArgs e)
		{
			History st = new History();
			st.GetPID(TextIDPatient.Text);
			//st.Show();	
		}

		private void Main_Load(object sender, System.EventArgs e)
		{

		}

		private void textBox1_TextChanged(object sender, System.EventArgs e)
		{
		
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			Application.Exit();
		}
	}
}
