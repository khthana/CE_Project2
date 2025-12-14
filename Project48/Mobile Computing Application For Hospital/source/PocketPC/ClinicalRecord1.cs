using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace MobileHospital1
{
	/// <summary>
	/// Summary description for ClinicalRecord1.
	/// </summary>
	public class ClinicalRecord1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button CmdNext;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox TextC;
		private System.Windows.Forms.TextBox TextPulse;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.TextBox textBox3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.Button CmdBack;
	
		public ClinicalRecord1()
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
			this.CmdNext = new System.Windows.Forms.Button();
			this.CmdBack = new System.Windows.Forms.Button();
			this.label2 = new System.Windows.Forms.Label();
			this.TextC = new System.Windows.Forms.TextBox();
			this.TextPulse = new System.Windows.Forms.TextBox();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.label5 = new System.Windows.Forms.Label();
			this.textBox3 = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.label9 = new System.Windows.Forms.Label();
			this.label10 = new System.Windows.Forms.Label();
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Size = new System.Drawing.Size(224, 20);
			this.label1.Text = "CLINICAL  RECORD";
			this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// CmdNext
			// 
			this.CmdNext.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.CmdNext.Location = new System.Drawing.Point(128, 232);
			this.CmdNext.Text = "Next>>";
			this.CmdNext.Click += new System.EventHandler(this.CmdNext_Click);
			// 
			// CmdBack
			// 
			this.CmdBack.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.CmdBack.Location = new System.Drawing.Point(40, 232);
			this.CmdBack.Text = "<<Back";
			this.CmdBack.Click += new System.EventHandler(this.CmdBack_Click);
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(16, 40);
			this.label2.Size = new System.Drawing.Size(64, 20);
			this.label2.Text = "Date/Time";
			// 
			// TextC
			// 
			this.TextC.Location = new System.Drawing.Point(112, 72);
			this.TextC.Size = new System.Drawing.Size(112, 20);
			this.TextC.Text = "";
			// 
			// TextPulse
			// 
			this.TextPulse.Location = new System.Drawing.Point(112, 104);
			this.TextPulse.Size = new System.Drawing.Size(112, 20);
			this.TextPulse.Text = "";
			// 
			// textBox1
			// 
			this.textBox1.BackColor = System.Drawing.SystemColors.Control;
			this.textBox1.Location = new System.Drawing.Point(80, 40);
			this.textBox1.Size = new System.Drawing.Size(144, 20);
			this.textBox1.Text = "";
			this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(40, 136);
			this.label5.Size = new System.Drawing.Size(72, 20);
			this.label5.Text = "Respirations";
			// 
			// textBox3
			// 
			this.textBox3.Location = new System.Drawing.Point(112, 136);
			this.textBox3.Size = new System.Drawing.Size(112, 20);
			this.textBox3.Text = "";
			// 
			// label4
			// 
			this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label4.Location = new System.Drawing.Point(40, 104);
			this.label4.Size = new System.Drawing.Size(72, 20);
			this.label4.Text = "Diastolic";
			// 
			// label9
			// 
			this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label9.Location = new System.Drawing.Point(48, 72);
			this.label9.Size = new System.Drawing.Size(56, 20);
			this.label9.Text = "Systolic";
			// 
			// label10
			// 
			this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label10.Location = new System.Drawing.Point(16, 72);
			this.label10.Size = new System.Drawing.Size(32, 20);
			this.label10.Text = "B.P.";
			// 
			// ClinicalRecord1
			// 
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label9);
			this.Controls.Add(this.label10);
			this.Controls.Add(this.textBox3);
			this.Controls.Add(this.label5);
			this.Controls.Add(this.textBox1);
			this.Controls.Add(this.TextPulse);
			this.Controls.Add(this.TextC);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.CmdBack);
			this.Controls.Add(this.CmdNext);
			this.Controls.Add(this.label1);
			this.Menu = this.mainMenu1;
			this.Text = "ClinicalRecord1";
			this.Load += new System.EventHandler(this.ClinicalRecord1_Load);

		}
		#endregion

		private void CmdNext_Click(object sender, System.EventArgs e)
		{
			ClinicalRecord2 st = new ClinicalRecord2();
			st.Show();
		}

		private void CmdBack_Click(object sender, System.EventArgs e)
		{
			Main st = new Main();
			st.Show();
		}

		private void ClinicalRecord1_Load(object sender, System.EventArgs e)
		{
			DateTime dt=DateTime.Now;
			textBox1.Text=dt.ToString();
		}

		private void textBox1_TextChanged(object sender, System.EventArgs e)
		{
		
		}	
	}
}
