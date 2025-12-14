using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace PictureViewer
{
	/// <summary>
	/// Summary description for AreaInformation.
	/// </summary>
	public class AreaInformation : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox txtName;
		private System.Windows.Forms.TextBox txtDesc;
		private System.Windows.Forms.TextBox txtShowName;
		private System.Windows.Forms.Button button2;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public AreaInformation()
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
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.txtName = new System.Windows.Forms.TextBox();
			this.txtDesc = new System.Windows.Forms.TextBox();
			this.txtShowName = new System.Windows.Forms.TextBox();
			this.button2 = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// button1
			// 
			this.button1.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.button1.Location = new System.Drawing.Point(64, 120);
			this.button1.Name = "button1";
			this.button1.TabIndex = 0;
			this.button1.Text = "OK";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(64, 23);
			this.label1.TabIndex = 1;
			this.label1.Text = "Name";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(8, 48);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(64, 23);
			this.label2.TabIndex = 2;
			this.label2.Text = "Show name";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(8, 80);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(64, 23);
			this.label3.TabIndex = 3;
			this.label3.Text = "Description";
			// 
			// txtName
			// 
			this.txtName.Location = new System.Drawing.Point(88, 16);
			this.txtName.Name = "txtName";
			this.txtName.Size = new System.Drawing.Size(168, 20);
			this.txtName.TabIndex = 4;
			this.txtName.Text = "";
			// 
			// txtDesc
			// 
			this.txtDesc.Location = new System.Drawing.Point(88, 80);
			this.txtDesc.Name = "txtDesc";
			this.txtDesc.Size = new System.Drawing.Size(168, 20);
			this.txtDesc.TabIndex = 5;
			this.txtDesc.Text = "";
			// 
			// txtShowName
			// 
			this.txtShowName.Location = new System.Drawing.Point(88, 48);
			this.txtShowName.Name = "txtShowName";
			this.txtShowName.Size = new System.Drawing.Size(168, 20);
			this.txtShowName.TabIndex = 6;
			this.txtShowName.Text = "";
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(160, 120);
			this.button2.Name = "button2";
			this.button2.TabIndex = 7;
			this.button2.Text = "Reset";
			// 
			// AreaInformation
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(280, 158);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.txtShowName);
			this.Controls.Add(this.txtDesc);
			this.Controls.Add(this.txtName);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.button1);
			this.Name = "AreaInformation";
			this.Text = "AreaInformation";
			this.ResumeLayout(false);

		}
		#endregion

		private void button1_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		public string AreaName
		{
			set
			{
				txtName.Text = value;
			}
			get
			{
				return txtName.Text;
			}
		}

		public string AreaShowName
		{
			set
			{
				txtShowName.Text = value;
			}
			get
			{
				return txtShowName.Text;
			}
		}

		public string AreaDesc
		{
			set
			{
				txtDesc.Text = value;
			}
			get
			{
				return txtDesc.Text;
			}
		}
	}
}
