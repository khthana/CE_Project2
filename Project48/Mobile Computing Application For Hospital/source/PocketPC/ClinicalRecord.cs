using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace MobileHospital1
{
	/// <summary>
	/// Summary description for ClinicalRecord.
	/// </summary>
	public class ClinicalRecord : System.Windows.Forms.Form
	{
		private System.Windows.Forms.TabControl tabControl1;
		private System.Windows.Forms.TabPage tabPage1;
		private System.Windows.Forms.TabPage tabPage2;
		private System.Windows.Forms.TabPage tabPage3;
		private System.Windows.Forms.TabPage tabPage4;
		private System.Windows.Forms.Label label15;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label29;
		private System.Windows.Forms.Label label28;
		private System.Windows.Forms.Label label27;
		private System.Windows.Forms.TextBox TextTime;
		private System.Windows.Forms.TextBox TextDateTime;
		private System.Windows.Forms.TextBox TextBlood;
		private System.Windows.Forms.Label label36;
		private System.Windows.Forms.TextBox TextC;
		private System.Windows.Forms.TextBox TextPulse;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.TextBox TextDiastolic;
		private System.Windows.Forms.TextBox TextSystolic;
		private System.Windows.Forms.TextBox TextRespirations;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Label label11;
		private System.Windows.Forms.TextBox TextUrine;
		private System.Windows.Forms.TextBox TextStools;
		private System.Windows.Forms.Label label13;
		private System.Windows.Forms.Label label14;
		private System.Windows.Forms.Label label16;
		private System.Windows.Forms.TextBox TextEat;
		private System.Windows.Forms.TextBox TextDiagnosis;
		private System.Windows.Forms.TextBox TextState;
		private System.Windows.Forms.Label label17;
		private System.Windows.Forms.Label label18;
		private System.Windows.Forms.Label label22;
		private System.Windows.Forms.TextBox TextID;
		private System.Windows.Forms.Label label21;
		private System.Windows.Forms.Label label35;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox TextMedication;
		private System.Windows.Forms.TabPage tabPage5;

		string PID,RoomNo,RoomTypeID,Bed;
		private System.Windows.Forms.MainMenu mainMenu1;
	
		public ClinicalRecord()
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
			this.tabControl1 = new System.Windows.Forms.TabControl();
			this.tabPage1 = new System.Windows.Forms.TabPage();
			this.TextBlood = new System.Windows.Forms.TextBox();
			this.label36 = new System.Windows.Forms.Label();
			this.TextC = new System.Windows.Forms.TextBox();
			this.TextPulse = new System.Windows.Forms.TextBox();
			this.label9 = new System.Windows.Forms.Label();
			this.label10 = new System.Windows.Forms.Label();
			this.label15 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.label29 = new System.Windows.Forms.Label();
			this.label28 = new System.Windows.Forms.Label();
			this.label27 = new System.Windows.Forms.Label();
			this.TextTime = new System.Windows.Forms.TextBox();
			this.TextDateTime = new System.Windows.Forms.TextBox();
			this.tabPage2 = new System.Windows.Forms.TabPage();
			this.label6 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.TextDiastolic = new System.Windows.Forms.TextBox();
			this.TextSystolic = new System.Windows.Forms.TextBox();
			this.TextRespirations = new System.Windows.Forms.TextBox();
			this.label7 = new System.Windows.Forms.Label();
			this.label11 = new System.Windows.Forms.Label();
			this.TextUrine = new System.Windows.Forms.TextBox();
			this.TextStools = new System.Windows.Forms.TextBox();
			this.label13 = new System.Windows.Forms.Label();
			this.label14 = new System.Windows.Forms.Label();
			this.tabPage3 = new System.Windows.Forms.TabPage();
			this.label16 = new System.Windows.Forms.Label();
			this.TextEat = new System.Windows.Forms.TextBox();
			this.TextDiagnosis = new System.Windows.Forms.TextBox();
			this.TextState = new System.Windows.Forms.TextBox();
			this.label17 = new System.Windows.Forms.Label();
			this.label18 = new System.Windows.Forms.Label();
			this.label22 = new System.Windows.Forms.Label();
			this.tabPage4 = new System.Windows.Forms.TabPage();
			this.TextMedication = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.tabPage5 = new System.Windows.Forms.TabPage();
			this.TextID = new System.Windows.Forms.TextBox();
			this.label21 = new System.Windows.Forms.Label();
			this.label35 = new System.Windows.Forms.Label();
			this.button1 = new System.Windows.Forms.Button();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			// 
			// tabControl1
			// 
			this.tabControl1.Controls.Add(this.tabPage1);
			this.tabControl1.Controls.Add(this.tabPage2);
			this.tabControl1.Controls.Add(this.tabPage3);
			this.tabControl1.Controls.Add(this.tabPage4);
			this.tabControl1.Controls.Add(this.tabPage5);
			this.tabControl1.SelectedIndex = 0;
			this.tabControl1.Size = new System.Drawing.Size(240, 272);
			// 
			// tabPage1
			// 
			this.tabPage1.Controls.Add(this.TextBlood);
			this.tabPage1.Controls.Add(this.label36);
			this.tabPage1.Controls.Add(this.TextC);
			this.tabPage1.Controls.Add(this.TextPulse);
			this.tabPage1.Controls.Add(this.label9);
			this.tabPage1.Controls.Add(this.label10);
			this.tabPage1.Controls.Add(this.label15);
			this.tabPage1.Controls.Add(this.label4);
			this.tabPage1.Controls.Add(this.label29);
			this.tabPage1.Controls.Add(this.label28);
			this.tabPage1.Controls.Add(this.label27);
			this.tabPage1.Controls.Add(this.TextTime);
			this.tabPage1.Controls.Add(this.TextDateTime);
			this.tabPage1.Location = new System.Drawing.Point(4, 4);
			this.tabPage1.Size = new System.Drawing.Size(232, 246);
			this.tabPage1.Text = "Page1";
			// 
			// TextBlood
			// 
			this.TextBlood.Location = new System.Drawing.Point(112, 184);
			this.TextBlood.Size = new System.Drawing.Size(104, 20);
			this.TextBlood.Text = "";
			// 
			// label36
			// 
			this.label36.Location = new System.Drawing.Point(24, 184);
			this.label36.Size = new System.Drawing.Size(80, 20);
			this.label36.Text = "BloodPressure";
			// 
			// TextC
			// 
			this.TextC.Location = new System.Drawing.Point(112, 136);
			this.TextC.Size = new System.Drawing.Size(104, 20);
			this.TextC.Text = "";
			// 
			// TextPulse
			// 
			this.TextPulse.Location = new System.Drawing.Point(112, 160);
			this.TextPulse.Size = new System.Drawing.Size(104, 20);
			this.TextPulse.Text = "";
			// 
			// label9
			// 
			this.label9.Location = new System.Drawing.Point(64, 160);
			this.label9.Size = new System.Drawing.Size(40, 16);
			this.label9.Text = "Pulse";
			// 
			// label10
			// 
			this.label10.Location = new System.Drawing.Point(24, 136);
			this.label10.Size = new System.Drawing.Size(81, 20);
			this.label10.Text = "Tempperature";
			// 
			// label15
			// 
			this.label15.Location = new System.Drawing.Point(40, 40);
			this.label15.Size = new System.Drawing.Size(40, 20);
			this.label15.Text = "Date";
			// 
			// label4
			// 
			this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label4.Location = new System.Drawing.Point(8, 8);
			this.label4.Size = new System.Drawing.Size(216, 20);
			this.label4.Text = "CLINICAL  RECORD";
			this.label4.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// label29
			// 
			this.label29.Location = new System.Drawing.Point(56, 112);
			this.label29.Size = new System.Drawing.Size(112, 20);
			this.label29.Text = "e.g. hh.mm 24 hr.";
			// 
			// label28
			// 
			this.label28.Location = new System.Drawing.Point(24, 64);
			this.label28.Size = new System.Drawing.Size(192, 20);
			this.label28.Text = "e.g.  dd/mm/yyyy 25/5/2549";
			// 
			// label27
			// 
			this.label27.Location = new System.Drawing.Point(40, 88);
			this.label27.Size = new System.Drawing.Size(40, 20);
			this.label27.Text = "Time";
			// 
			// TextTime
			// 
			this.TextTime.Location = new System.Drawing.Point(80, 88);
			this.TextTime.Size = new System.Drawing.Size(104, 20);
			this.TextTime.Text = "";
			// 
			// TextDateTime
			// 
			this.TextDateTime.BackColor = System.Drawing.SystemColors.Window;
			this.TextDateTime.Location = new System.Drawing.Point(80, 40);
			this.TextDateTime.Size = new System.Drawing.Size(104, 20);
			this.TextDateTime.Text = "";
			// 
			// tabPage2
			// 
			this.tabPage2.Controls.Add(this.label6);
			this.tabPage2.Controls.Add(this.label5);
			this.tabPage2.Controls.Add(this.TextDiastolic);
			this.tabPage2.Controls.Add(this.TextSystolic);
			this.tabPage2.Controls.Add(this.TextRespirations);
			this.tabPage2.Controls.Add(this.label7);
			this.tabPage2.Controls.Add(this.label11);
			this.tabPage2.Controls.Add(this.TextUrine);
			this.tabPage2.Controls.Add(this.TextStools);
			this.tabPage2.Controls.Add(this.label13);
			this.tabPage2.Controls.Add(this.label14);
			this.tabPage2.Location = new System.Drawing.Point(4, 4);
			this.tabPage2.Size = new System.Drawing.Size(232, 246);
			this.tabPage2.Text = "Page2";
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(48, 88);
			this.label6.Size = new System.Drawing.Size(54, 20);
			this.label6.Text = "Diastolic";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(32, 64);
			this.label5.Size = new System.Drawing.Size(72, 20);
			this.label5.Text = "B.P. Systolic";
			// 
			// TextDiastolic
			// 
			this.TextDiastolic.Location = new System.Drawing.Point(104, 88);
			this.TextDiastolic.Size = new System.Drawing.Size(112, 20);
			this.TextDiastolic.Text = "";
			// 
			// TextSystolic
			// 
			this.TextSystolic.Location = new System.Drawing.Point(104, 64);
			this.TextSystolic.Size = new System.Drawing.Size(112, 20);
			this.TextSystolic.Text = "";
			// 
			// TextRespirations
			// 
			this.TextRespirations.Location = new System.Drawing.Point(104, 40);
			this.TextRespirations.Size = new System.Drawing.Size(112, 20);
			this.TextRespirations.Text = "";
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(32, 40);
			this.label7.Size = new System.Drawing.Size(72, 20);
			this.label7.Text = "Respirations";
			// 
			// label11
			// 
			this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label11.Location = new System.Drawing.Point(8, 8);
			this.label11.Size = new System.Drawing.Size(216, 20);
			this.label11.Text = "CLINICAL  RECORD";
			this.label11.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// TextUrine
			// 
			this.TextUrine.Location = new System.Drawing.Point(72, 160);
			this.TextUrine.Multiline = true;
			this.TextUrine.Size = new System.Drawing.Size(144, 40);
			this.TextUrine.Text = "";
			// 
			// TextStools
			// 
			this.TextStools.Location = new System.Drawing.Point(72, 112);
			this.TextStools.Multiline = true;
			this.TextStools.Size = new System.Drawing.Size(144, 40);
			this.TextStools.Text = "";
			// 
			// label13
			// 
			this.label13.Location = new System.Drawing.Point(24, 160);
			this.label13.Size = new System.Drawing.Size(40, 20);
			this.label13.Text = "Urine";
			// 
			// label14
			// 
			this.label14.Location = new System.Drawing.Point(24, 112);
			this.label14.Size = new System.Drawing.Size(40, 20);
			this.label14.Text = "Stools";
			// 
			// tabPage3
			// 
			this.tabPage3.Controls.Add(this.label16);
			this.tabPage3.Controls.Add(this.TextEat);
			this.tabPage3.Controls.Add(this.TextDiagnosis);
			this.tabPage3.Controls.Add(this.TextState);
			this.tabPage3.Controls.Add(this.label17);
			this.tabPage3.Controls.Add(this.label18);
			this.tabPage3.Controls.Add(this.label22);
			this.tabPage3.Location = new System.Drawing.Point(4, 4);
			this.tabPage3.Size = new System.Drawing.Size(232, 246);
			this.tabPage3.Text = "Page3";
			// 
			// label16
			// 
			this.label16.Location = new System.Drawing.Point(8, 152);
			this.label16.Size = new System.Drawing.Size(56, 20);
			this.label16.Text = "Don\'t eat";
			// 
			// TextEat
			// 
			this.TextEat.Location = new System.Drawing.Point(64, 152);
			this.TextEat.Size = new System.Drawing.Size(144, 20);
			this.TextEat.Text = "";
			// 
			// TextDiagnosis
			// 
			this.TextDiagnosis.Location = new System.Drawing.Point(64, 96);
			this.TextDiagnosis.Multiline = true;
			this.TextDiagnosis.Size = new System.Drawing.Size(144, 48);
			this.TextDiagnosis.Text = "";
			// 
			// TextState
			// 
			this.TextState.Location = new System.Drawing.Point(64, 40);
			this.TextState.Multiline = true;
			this.TextState.Size = new System.Drawing.Size(144, 48);
			this.TextState.Text = "";
			// 
			// label17
			// 
			this.label17.Location = new System.Drawing.Point(8, 96);
			this.label17.Size = new System.Drawing.Size(56, 20);
			this.label17.Text = "Diagnosis";
			// 
			// label18
			// 
			this.label18.Location = new System.Drawing.Point(24, 40);
			this.label18.Size = new System.Drawing.Size(32, 20);
			this.label18.Text = "State";
			// 
			// label22
			// 
			this.label22.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label22.Location = new System.Drawing.Point(0, 8);
			this.label22.Size = new System.Drawing.Size(224, 20);
			this.label22.Text = "CLINICAL  RECORD";
			this.label22.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// tabPage4
			// 
			this.tabPage4.Controls.Add(this.TextMedication);
			this.tabPage4.Controls.Add(this.label1);
			this.tabPage4.Location = new System.Drawing.Point(4, 4);
			this.tabPage4.Size = new System.Drawing.Size(232, 246);
			this.tabPage4.Text = "Page4";
			// 
			// TextMedication
			// 
			this.TextMedication.Location = new System.Drawing.Point(16, 40);
			this.TextMedication.Multiline = true;
			this.TextMedication.Size = new System.Drawing.Size(200, 192);
			this.TextMedication.Text = "";
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Size = new System.Drawing.Size(216, 20);
			this.label1.Text = "MEDICATION  RECORD";
			this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// tabPage5
			// 
			this.tabPage5.Controls.Add(this.TextID);
			this.tabPage5.Controls.Add(this.label21);
			this.tabPage5.Controls.Add(this.label35);
			this.tabPage5.Controls.Add(this.button1);
			this.tabPage5.Location = new System.Drawing.Point(4, 4);
			this.tabPage5.Size = new System.Drawing.Size(232, 246);
			this.tabPage5.Text = "Page5";
			// 
			// TextID
			// 
			this.TextID.Location = new System.Drawing.Point(88, 40);
			this.TextID.Size = new System.Drawing.Size(120, 20);
			this.TextID.Text = "";
			// 
			// label21
			// 
			this.label21.Location = new System.Drawing.Point(24, 40);
			this.label21.Size = new System.Drawing.Size(72, 20);
			this.label21.Text = "ID Doctor";
			// 
			// label35
			// 
			this.label35.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label35.Location = new System.Drawing.Point(8, 8);
			this.label35.Size = new System.Drawing.Size(216, 20);
			this.label35.Text = "CLINICAL  RECORD";
			this.label35.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// button1
			// 
			this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular);
			this.button1.Location = new System.Drawing.Point(120, 72);
			this.button1.Size = new System.Drawing.Size(80, 20);
			this.button1.Text = "Submit";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// ClinicalRecord
			// 
			this.Controls.Add(this.tabControl1);
			this.Menu = this.mainMenu1;
			this.Text = "ClinicalRecord";

		}
		#endregion

		/*public void GetPID(string id,string RoomNo,string RoomTypeName,string Bed) 
		{
			//textBox1.Text = id;
			string PID,RoomNo,RoomTypeName,Bed;
			PID = id;
			RoomNo = RoomNo;
			RoomTypeName = RoomTypeName;
			Bed = Bed;
			GetData();
		}*/

		public void GetData(string ID,string RN,string RTI,string B) 
		{
			//string PID,RoomNo,RoomTypeID,Bed;
			PID = ID;
			RoomNo = RN;
			RoomTypeID = RTI;
			Bed = B;
	
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			MHWS.Service1 service = new MHWS.Service1();
			service.ClinicalRecord(PID,RoomNo,RoomTypeID,Bed,TextDateTime.Text,TextTime.Text,TextSystolic.Text,TextDiastolic.Text,TextBlood.Text,TextRespirations.Text,TextPulse.Text,TextC.Text,TextStools.Text,TextUrine.Text,TextState.Text,TextDiagnosis.Text,TextEat.Text,TextID.Text,TextMedication.Text,1);
			this.Close();
		}
	}
}
