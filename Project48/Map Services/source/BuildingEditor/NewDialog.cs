using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace PictureViewer
{
	/// <summary>
	/// Summary description for NewDialog.
	/// </summary>
	public class NewDialog : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.NumericUpDown nudFloor;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private System.Windows.Forms.Label label1;

		private int nFloor = 0;

		public NewDialog()
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
				if(components != null)
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
			this.button1 = new System.Windows.Forms.Button();
			this.nudFloor = new System.Windows.Forms.NumericUpDown();
			this.label1 = new System.Windows.Forms.Label();
			((System.ComponentModel.ISupportInitialize)(this.nudFloor)).BeginInit();
			this.SuspendLayout();
			// 
			// button1
			// 
			this.button1.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.button1.Location = new System.Drawing.Point(56, 64);
			this.button1.Name = "button1";
			this.button1.TabIndex = 1;
			this.button1.Text = "OK";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// nudFloor
			// 
			this.nudFloor.Location = new System.Drawing.Point(136, 24);
			this.nudFloor.Name = "nudFloor";
			this.nudFloor.Size = new System.Drawing.Size(40, 20);
			this.nudFloor.TabIndex = 2;
			this.nudFloor.Value = new System.Decimal(new int[] {
																   3,
																   0,
																   0,
																   0});
			this.nudFloor.ValueChanged += new System.EventHandler(this.nudFloor_ValueChanged);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 24);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(128, 23);
			this.label1.TabIndex = 3;
			this.label1.Text = "Enter number of floor.";
			this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			this.label1.Click += new System.EventHandler(this.label1_Click);
			// 
			// NewDialog
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(192, 102);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.nudFloor);
			this.Controls.Add(this.button1);
			this.Name = "NewDialog";
			this.Text = "NewDialog";
			this.Load += new System.EventHandler(this.NewDialog_Load);
			((System.ComponentModel.ISupportInitialize)(this.nudFloor)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		private void button1_Click(object sender, System.EventArgs e)
		{
			nFloor = (int)nudFloor.Value;
			this.Close();
		}

		private void nudFloor_ValueChanged(object sender, System.EventArgs e)
		{
		
		}

		private void label1_Click(object sender, System.EventArgs e)
		{
		
		}

		private void NewDialog_Load(object sender, System.EventArgs e)
		{
		
		}

		public int NumFloor
		{
			get{return nFloor;}
			set{nudFloor.Value = value;}
		}
	
	}
}
