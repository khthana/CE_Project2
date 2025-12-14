using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace MobileHospital1
{
	/// <summary>
	/// Summary description for ClinicalRecord3.
	/// </summary>
	public class ClinicalRecord3 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button CmdSubmit;
		private System.Windows.Forms.Button CmdBack;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox textBox2;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.Label Label3;
		private System.Windows.Forms.Label Label2;
		private System.Windows.Forms.MainMenu mainMenu1;
	
		public ClinicalRecord3()
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
			this.CmdSubmit = new System.Windows.Forms.Button();
			this.CmdBack = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.textBox2 = new System.Windows.Forms.TextBox();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.Label3 = new System.Windows.Forms.Label();
			this.Label2 = new System.Windows.Forms.Label();
			// 
			// CmdSubmit
			// 
			this.CmdSubmit.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.CmdSubmit.Location = new System.Drawing.Point(128, 232);
			this.CmdSubmit.Text = "Next>>";
			this.CmdSubmit.Click += new System.EventHandler(this.CmdSubmit_Click);
			// 
			// CmdBack
			// 
			this.CmdBack.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.CmdBack.Location = new System.Drawing.Point(40, 232);
			this.CmdBack.Text = "<<Back";
			this.CmdBack.Click += new System.EventHandler(this.CmdBack_Click);
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Size = new System.Drawing.Size(224, 20);
			this.label1.Text = "CLINICAL  RECORD";
			this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// textBox2
			// 
			this.textBox2.Location = new System.Drawing.Point(72, 104);
			this.textBox2.Multiline = true;
			this.textBox2.Size = new System.Drawing.Size(152, 56);
			this.textBox2.Text = "";
			// 
			// textBox1
			// 
			this.textBox1.Location = new System.Drawing.Point(72, 40);
			this.textBox1.Multiline = true;
			this.textBox1.Size = new System.Drawing.Size(152, 56);
			this.textBox1.Text = "";
			// 
			// Label3
			// 
			this.Label3.Location = new System.Drawing.Point(16, 104);
			this.Label3.Size = new System.Drawing.Size(56, 20);
			this.Label3.Text = "Diagnosis";
			// 
			// Label2
			// 
			this.Label2.Location = new System.Drawing.Point(32, 40);
			this.Label2.Size = new System.Drawing.Size(32, 20);
			this.Label2.Text = "State";
			// 
			// ClinicalRecord3
			// 
			this.Controls.Add(this.textBox2);
			this.Controls.Add(this.textBox1);
			this.Controls.Add(this.Label3);
			this.Controls.Add(this.Label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.CmdSubmit);
			this.Controls.Add(this.CmdBack);
			this.Menu = this.mainMenu1;
			this.Text = "ClinicalRecord3";

		}
		#endregion

		private void CmdSubmit_Click(object sender, System.EventArgs e)
		{
			ClinicalRecord4 st = new ClinicalRecord4();
			st.Show();
		}

		private void CmdBack_Click(object sender, System.EventArgs e)
		{
			ClinicalRecord2 st = new ClinicalRecord2();
			st.Show();
		}

		private void CmdHistory_Click(object sender, System.EventArgs e)
		{
			History st = new History();
			st.Show();
		}

		private void CmdBiography_Click(object sender, System.EventArgs e)
		{
			Biography st = new Biography();
			st.Show();
		}
	}
}
