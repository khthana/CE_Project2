using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Restaurant
{
	/// <summary>
	/// Summary description for YesNoForm.
	/// </summary>
	public class YesNoForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button bYes;
		private System.Windows.Forms.Button bNo;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private string caption;
		public bool check;
		public YesNoForm()
		{
			//
			// Required for Windows Form Designer support
			//
			caption = "";
			InitializeComponent();
			
			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}
		
		public YesNoForm(string text)
		{
			//
			// Required for Windows Form Designer support
			//
			caption = text;
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
			this.bYes = new System.Windows.Forms.Button();
			this.bNo = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// bYes
			// 
			this.bYes.Location = new System.Drawing.Point(64, 24);
			this.bYes.Name = "bYes";
			this.bYes.TabIndex = 0;
			this.bYes.Text = "ใช่";
			this.bYes.Click += new System.EventHandler(this.bYes_Click);
			// 
			// bNo
			// 
			this.bNo.Location = new System.Drawing.Point(176, 24);
			this.bNo.Name = "bNo";
			this.bNo.TabIndex = 1;
			this.bNo.Text = "ไม่ใช่";
			this.bNo.Click += new System.EventHandler(this.bNo_Click);
			// 
			// YesNoForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(320, 70);
			this.Controls.Add(this.bNo);
			this.Controls.Add(this.bYes);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "YesNoForm";
			this.Text = caption;
			this.Load += new System.EventHandler(this.YesNoForm_Load);
			this.ResumeLayout(false);

		}
		#endregion

		private void bYes_Click(object sender, System.EventArgs e)
		{
			check = true;
			this.Close();
		}

		private void bNo_Click(object sender, System.EventArgs e)
		{
			check = false;
			this.Close();
		}

		private void YesNoForm_Load(object sender, System.EventArgs e)
		{
		
		}
	}
}
