using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace MobileHospital1
{
	/// <summary>
	/// Summary description for MedicationRecord2.
	/// </summary>
	public class MedicationRecord2 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.ComboBox TextQuantity;
		private System.Windows.Forms.ComboBox TextMedicine;
		private System.Windows.Forms.Button CmdSubmit;
		private System.Windows.Forms.Button CmdBack;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.ComboBox comboBox1;
		private System.Windows.Forms.ComboBox comboBox2;
		private System.Windows.Forms.ComboBox comboBox3;
		private System.Windows.Forms.ComboBox comboBox4;
		private System.Windows.Forms.ComboBox comboBox5;
		private System.Windows.Forms.ComboBox comboBox6;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Label label5;
	
		public MedicationRecord2()
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
			this.TextQuantity = new System.Windows.Forms.ComboBox();
			this.TextMedicine = new System.Windows.Forms.ComboBox();
			this.CmdSubmit = new System.Windows.Forms.Button();
			this.CmdBack = new System.Windows.Forms.Button();
			this.label6 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.comboBox1 = new System.Windows.Forms.ComboBox();
			this.comboBox2 = new System.Windows.Forms.ComboBox();
			this.comboBox3 = new System.Windows.Forms.ComboBox();
			this.comboBox4 = new System.Windows.Forms.ComboBox();
			this.comboBox5 = new System.Windows.Forms.ComboBox();
			this.comboBox6 = new System.Windows.Forms.ComboBox();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.label7 = new System.Windows.Forms.Label();
			// 
			// TextQuantity
			// 
			this.TextQuantity.Location = new System.Drawing.Point(160, 72);
			this.TextQuantity.Size = new System.Drawing.Size(64, 21);
			// 
			// TextMedicine
			// 
			this.TextMedicine.Location = new System.Drawing.Point(48, 72);
			this.TextMedicine.Size = new System.Drawing.Size(96, 21);
			// 
			// CmdSubmit
			// 
			this.CmdSubmit.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.CmdSubmit.Location = new System.Drawing.Point(128, 216);
			this.CmdSubmit.Text = "Submit";
			this.CmdSubmit.Click += new System.EventHandler(this.CmdSubmit_Click);
			// 
			// CmdBack
			// 
			this.CmdBack.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.CmdBack.Location = new System.Drawing.Point(40, 216);
			this.CmdBack.Text = "<< Back";
			this.CmdBack.Click += new System.EventHandler(this.CmdBack_Click);
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(160, 40);
			this.label6.Size = new System.Drawing.Size(48, 20);
			this.label6.Text = "Quantity";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(80, 40);
			this.label5.Size = new System.Drawing.Size(56, 20);
			this.label5.Text = "Medicine";
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Size = new System.Drawing.Size(224, 20);
			this.label1.Text = "MEDICATION  RECORD";
			this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// comboBox1
			// 
			this.comboBox1.Location = new System.Drawing.Point(48, 136);
			this.comboBox1.Size = new System.Drawing.Size(96, 21);
			// 
			// comboBox2
			// 
			this.comboBox2.Location = new System.Drawing.Point(48, 104);
			this.comboBox2.Size = new System.Drawing.Size(96, 21);
			// 
			// comboBox3
			// 
			this.comboBox3.Location = new System.Drawing.Point(160, 104);
			this.comboBox3.Size = new System.Drawing.Size(64, 21);
			// 
			// comboBox4
			// 
			this.comboBox4.Location = new System.Drawing.Point(160, 136);
			this.comboBox4.Size = new System.Drawing.Size(64, 21);
			// 
			// comboBox5
			// 
			this.comboBox5.Location = new System.Drawing.Point(48, 168);
			this.comboBox5.Size = new System.Drawing.Size(96, 21);
			// 
			// comboBox6
			// 
			this.comboBox6.Location = new System.Drawing.Point(160, 168);
			this.comboBox6.Size = new System.Drawing.Size(64, 21);
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(16, 72);
			this.label2.Size = new System.Drawing.Size(16, 20);
			this.label2.Text = "5.";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(16, 168);
			this.label3.Size = new System.Drawing.Size(16, 20);
			this.label3.Text = "8.";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(16, 136);
			this.label4.Size = new System.Drawing.Size(16, 20);
			this.label4.Text = "7.";
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(16, 104);
			this.label7.Size = new System.Drawing.Size(16, 20);
			this.label7.Text = "6.";
			// 
			// MedicationRecord2
			// 
			this.Controls.Add(this.label7);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.comboBox6);
			this.Controls.Add(this.comboBox5);
			this.Controls.Add(this.comboBox4);
			this.Controls.Add(this.comboBox3);
			this.Controls.Add(this.comboBox2);
			this.Controls.Add(this.comboBox1);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.TextQuantity);
			this.Controls.Add(this.TextMedicine);
			this.Controls.Add(this.CmdSubmit);
			this.Controls.Add(this.CmdBack);
			this.Controls.Add(this.label6);
			this.Controls.Add(this.label5);
			this.Text = "MedicationRecord2";

		}
		#endregion

		private void CmdBack_Click(object sender, System.EventArgs e)
		{
			MedicationRecord st = new MedicationRecord();
			st.Show();
		}

		private void CmdSubmit_Click(object sender, System.EventArgs e)
		{
			//MessageBoxButtons.OKCancel("DO you want to Exit Program","","COMPLETE");
			//MessageBoxButtons.OKCancel
			if(MessageBox.Show("Do you want to exit program ?","CLINICAL COMPLETE",
				MessageBoxButtons.OKCancel,MessageBoxIcon.Question,
				MessageBoxDefaultButton.Button1)==DialogResult.Yes)
			{
				//Close();
				//Application.Exit();
			}
		}
	}
}
