using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace MobileHospital1
{
	/// <summary>
	/// Summary description for ClinicalRecord4.
	/// </summary>
	public class ClinicalRecord4 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox TextName;
		private System.Windows.Forms.TextBox TextIDPhysician;
		private System.Windows.Forms.Label Label5;
		private System.Windows.Forms.Label Label4;
		private System.Windows.Forms.Button CmdSubmit;
		private System.Windows.Forms.Button CmdBack;
	
		public ClinicalRecord4()
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
			this.TextName = new System.Windows.Forms.TextBox();
			this.TextIDPhysician = new System.Windows.Forms.TextBox();
			this.Label5 = new System.Windows.Forms.Label();
			this.Label4 = new System.Windows.Forms.Label();
			this.CmdSubmit = new System.Windows.Forms.Button();
			this.CmdBack = new System.Windows.Forms.Button();
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Size = new System.Drawing.Size(224, 20);
			this.label1.Text = "CLINICAL  RECORD";
			this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// TextName
			// 
			this.TextName.Location = new System.Drawing.Point(88, 80);
			this.TextName.Size = new System.Drawing.Size(120, 20);
			this.TextName.Text = "";
			// 
			// TextIDPhysician
			// 
			this.TextIDPhysician.Location = new System.Drawing.Point(88, 48);
			this.TextIDPhysician.Size = new System.Drawing.Size(120, 20);
			this.TextIDPhysician.Text = "";
			// 
			// Label5
			// 
			this.Label5.Location = new System.Drawing.Point(40, 80);
			this.Label5.Size = new System.Drawing.Size(48, 20);
			this.Label5.Text = "Doctor";
			// 
			// Label4
			// 
			this.Label4.Location = new System.Drawing.Point(24, 48);
			this.Label4.Size = new System.Drawing.Size(72, 20);
			this.Label4.Text = "ID Doctor";
			// 
			// CmdSubmit
			// 
			this.CmdSubmit.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.CmdSubmit.Location = new System.Drawing.Point(128, 232);
			this.CmdSubmit.Size = new System.Drawing.Size(80, 20);
			this.CmdSubmit.Text = "Submit";
			this.CmdSubmit.Click += new System.EventHandler(this.CmdSubmit_Click);
			// 
			// CmdBack
			// 
			this.CmdBack.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.CmdBack.Location = new System.Drawing.Point(40, 232);
			this.CmdBack.Text = "<<Back";
			this.CmdBack.Click += new System.EventHandler(this.CmdBack_Click);
			// 
			// ClinicalRecord4
			// 
			this.Controls.Add(this.label1);
			this.Controls.Add(this.TextName);
			this.Controls.Add(this.TextIDPhysician);
			this.Controls.Add(this.Label5);
			this.Controls.Add(this.Label4);
			this.Controls.Add(this.CmdSubmit);
			this.Controls.Add(this.CmdBack);
			this.Text = "ClinicalRecord4";

		}
		#endregion

		private void CmdBack_Click(object sender, System.EventArgs e)
		{
			ClinicalRecord3 st = new ClinicalRecord3();
			st.Show();
		}

		private void CmdSubmit_Click(object sender, System.EventArgs e)
		{
			MedicationRecord st = new MedicationRecord();
			st.Show();
		}

		private void CmdBiography_Click(object sender, System.EventArgs e)
		{
			Biography st = new Biography();
			st.Show();
		}

		private void CmdHistory_Click(object sender, System.EventArgs e)
		{
			History st = new History();
			st.Show();
		}
	}
}
