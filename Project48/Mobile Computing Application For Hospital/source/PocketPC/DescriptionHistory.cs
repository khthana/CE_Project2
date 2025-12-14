using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace MobileHospital1
{
	/// <summary>
	/// Summary description for DescriptionHistory.
	/// </summary>
	public class DescriptionHistory : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.TextBox textBox2;
		private System.Windows.Forms.TextBox textBox3;
		private System.Windows.Forms.TextBox textBox4;
		private System.Windows.Forms.TextBox textBox5;
		private System.Windows.Forms.TextBox textBox6;
		private System.Windows.Forms.TextBox textBox7;
		private System.Windows.Forms.TextBox textBox8;
		private System.Windows.Forms.Button CmdBack;
		private System.Windows.Forms.Label label9;
	
		public DescriptionHistory()
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
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			this.label7 = new System.Windows.Forms.Label();
			this.label8 = new System.Windows.Forms.Label();
			this.CmdBack = new System.Windows.Forms.Button();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.textBox2 = new System.Windows.Forms.TextBox();
			this.textBox3 = new System.Windows.Forms.TextBox();
			this.textBox4 = new System.Windows.Forms.TextBox();
			this.textBox5 = new System.Windows.Forms.TextBox();
			this.textBox6 = new System.Windows.Forms.TextBox();
			this.textBox7 = new System.Windows.Forms.TextBox();
			this.textBox8 = new System.Windows.Forms.TextBox();
			this.label9 = new System.Windows.Forms.Label();
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(52, 40);
			this.label1.Size = new System.Drawing.Size(64, 20);
			this.label1.Text = "Admission";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(52, 64);
			this.label2.Size = new System.Drawing.Size(64, 20);
			this.label2.Text = "Discharge";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(60, 88);
			this.label3.Size = new System.Drawing.Size(56, 20);
			this.label3.Text = "Disease";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(36, 112);
			this.label4.Size = new System.Drawing.Size(80, 20);
			this.label4.Text = "Disease Type";
			this.label4.ParentChanged += new System.EventHandler(this.label4_ParentChanged);
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(16, 136);
			this.label5.Size = new System.Drawing.Size(104, 20);
			this.label5.Text = "Type of Admission";
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(16, 160);
			this.label6.Size = new System.Drawing.Size(104, 20);
			this.label6.Text = "Type of Discharge";
			this.label6.ParentChanged += new System.EventHandler(this.label6_ParentChanged);
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(40, 184);
			this.label7.Size = new System.Drawing.Size(80, 20);
			this.label7.Text = "Doctor Name";
			// 
			// label8
			// 
			this.label8.Location = new System.Drawing.Point(52, 208);
			this.label8.Size = new System.Drawing.Size(64, 20);
			this.label8.Text = "Room NO.";
			// 
			// CmdBack
			// 
			this.CmdBack.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.CmdBack.Location = new System.Drawing.Point(152, 240);
			this.CmdBack.Text = "<< Back";
			this.CmdBack.Click += new System.EventHandler(this.CmdBack_Click);
			// 
			// textBox1
			// 
			this.textBox1.BackColor = System.Drawing.SystemColors.Control;
			this.textBox1.Location = new System.Drawing.Point(120, 40);
			this.textBox1.Size = new System.Drawing.Size(104, 20);
			this.textBox1.Text = "";
			// 
			// textBox2
			// 
			this.textBox2.BackColor = System.Drawing.SystemColors.Control;
			this.textBox2.Location = new System.Drawing.Point(120, 64);
			this.textBox2.Size = new System.Drawing.Size(104, 20);
			this.textBox2.Text = "";
			// 
			// textBox3
			// 
			this.textBox3.BackColor = System.Drawing.SystemColors.Control;
			this.textBox3.Location = new System.Drawing.Point(120, 88);
			this.textBox3.Size = new System.Drawing.Size(104, 20);
			this.textBox3.Text = "";
			// 
			// textBox4
			// 
			this.textBox4.BackColor = System.Drawing.SystemColors.Control;
			this.textBox4.Location = new System.Drawing.Point(120, 112);
			this.textBox4.Size = new System.Drawing.Size(104, 20);
			this.textBox4.Text = "";
			// 
			// textBox5
			// 
			this.textBox5.BackColor = System.Drawing.SystemColors.Control;
			this.textBox5.Location = new System.Drawing.Point(120, 136);
			this.textBox5.Size = new System.Drawing.Size(104, 20);
			this.textBox5.Text = "";
			// 
			// textBox6
			// 
			this.textBox6.BackColor = System.Drawing.SystemColors.Control;
			this.textBox6.Location = new System.Drawing.Point(120, 160);
			this.textBox6.Size = new System.Drawing.Size(104, 20);
			this.textBox6.Text = "";
			// 
			// textBox7
			// 
			this.textBox7.BackColor = System.Drawing.SystemColors.Control;
			this.textBox7.Location = new System.Drawing.Point(120, 184);
			this.textBox7.Size = new System.Drawing.Size(104, 20);
			this.textBox7.Text = "";
			// 
			// textBox8
			// 
			this.textBox8.BackColor = System.Drawing.SystemColors.Control;
			this.textBox8.Location = new System.Drawing.Point(120, 208);
			this.textBox8.Size = new System.Drawing.Size(104, 20);
			this.textBox8.Text = "";
			// 
			// label9
			// 
			this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label9.Location = new System.Drawing.Point(8, 8);
			this.label9.Size = new System.Drawing.Size(224, 20);
			this.label9.Text = "HOSTORY  PATIENT";
			this.label9.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// DescriptionHistory
			// 
			this.Controls.Add(this.label9);
			this.Controls.Add(this.textBox8);
			this.Controls.Add(this.textBox7);
			this.Controls.Add(this.textBox6);
			this.Controls.Add(this.textBox5);
			this.Controls.Add(this.textBox4);
			this.Controls.Add(this.textBox3);
			this.Controls.Add(this.textBox2);
			this.Controls.Add(this.textBox1);
			this.Controls.Add(this.CmdBack);
			this.Controls.Add(this.label8);
			this.Controls.Add(this.label7);
			this.Controls.Add(this.label6);
			this.Controls.Add(this.label5);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Text = "DescriptionHistory";

		}
		#endregion

		private void CmdBack_Click(object sender, System.EventArgs e)
		{
			History st = new History();
			st.Show();
		}

		private void label4_ParentChanged(object sender, System.EventArgs e)
		{
		
		}

		private void label6_ParentChanged(object sender, System.EventArgs e)
		{
		
		}
	}
}
