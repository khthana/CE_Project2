using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace MobileHospital1
{
	/// <summary>
	/// Summary description for ClinicalRecord2.
	/// </summary>
	public class ClinicalRecord2 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.TextBox textBox5;
		private System.Windows.Forms.TextBox textBox6;
		private System.Windows.Forms.TextBox textBox4;
		private System.Windows.Forms.TextBox textBox2;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.MainMenu mainMenu1;
	
		public ClinicalRecord2()
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
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.button1 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.label7 = new System.Windows.Forms.Label();
			this.label8 = new System.Windows.Forms.Label();
			this.textBox5 = new System.Windows.Forms.TextBox();
			this.textBox6 = new System.Windows.Forms.TextBox();
			this.textBox4 = new System.Windows.Forms.TextBox();
			this.textBox2 = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Size = new System.Drawing.Size(224, 20);
			this.label1.Text = "CLINICAL  RECORD";
			this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// button1
			// 
			this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.button1.Location = new System.Drawing.Point(40, 232);
			this.button1.Text = "<<Back";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// button2
			// 
			this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.button2.Location = new System.Drawing.Point(128, 232);
			this.button2.Text = "Next>>";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(24, 104);
			this.label7.Size = new System.Drawing.Size(40, 20);
			this.label7.Text = "Stools";
			// 
			// label8
			// 
			this.label8.Location = new System.Drawing.Point(24, 136);
			this.label8.Size = new System.Drawing.Size(32, 20);
			this.label8.Text = "Urine";
			// 
			// textBox5
			// 
			this.textBox5.Location = new System.Drawing.Point(64, 104);
			this.textBox5.Size = new System.Drawing.Size(152, 20);
			this.textBox5.Text = "";
			// 
			// textBox6
			// 
			this.textBox6.Location = new System.Drawing.Point(64, 136);
			this.textBox6.Size = new System.Drawing.Size(152, 20);
			this.textBox6.Text = "";
			// 
			// textBox4
			// 
			this.textBox4.Location = new System.Drawing.Point(64, 72);
			this.textBox4.Size = new System.Drawing.Size(152, 20);
			this.textBox4.Text = "";
			// 
			// textBox2
			// 
			this.textBox2.Location = new System.Drawing.Point(64, 40);
			this.textBox2.Size = new System.Drawing.Size(152, 20);
			this.textBox2.Text = "";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(16, 40);
			this.label2.Size = new System.Drawing.Size(40, 16);
			this.label2.Text = "Pulse";
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(40, 72);
			this.label6.Size = new System.Drawing.Size(16, 20);
			this.label6.Text = "C    ";
			// 
			// ClinicalRecord2
			// 
			this.Controls.Add(this.textBox4);
			this.Controls.Add(this.textBox2);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label6);
			this.Controls.Add(this.textBox6);
			this.Controls.Add(this.textBox5);
			this.Controls.Add(this.label8);
			this.Controls.Add(this.label7);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.label1);
			this.Menu = this.mainMenu1;
			this.Text = "ClinicalRecord2";

		}
		#endregion

		private void CmdHistory_Click(object sender, System.EventArgs e)
		{
			History st = new History();
			st.Show();
		}

		private void CmdBack_Click(object sender, System.EventArgs e)
		{
			ClinicalRecord1 st = new ClinicalRecord1();
			st.Show();
		}

		private void CmdSubmit_Click(object sender, System.EventArgs e)
		{
			//if(MessageBox.Show("Do you want Medicine?","Word for Sure",
			//	MessageBoxButtons.OKCancel,MessageBoxIcon.Question,
			//	MessageBoxDefaultButton.Button1)==DialogResult.Yes)
			//{
				MedicationRecord st = new MedicationRecord();
				st.Show();
			//}
			//MessageBox.Show("Clinical Complete");
			//this.Close();
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			ClinicalRecord3 st = new ClinicalRecord3();
			st.Show();
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			ClinicalRecord1 st = new ClinicalRecord1();
			st.Show();
		}	
	}
}
