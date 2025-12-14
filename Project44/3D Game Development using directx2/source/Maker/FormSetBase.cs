using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Maker
{
	/// <summary>
	/// Summary description for FormSetBase.
	/// </summary>
	public class FormSetBase : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.ListView listView1;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.ColumnHeader columnHeader2;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public FormSetBase()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//

			MyInitial();
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

		// programmer

		// user code
		private ArrayList res3d;
		private int	select;

		private void MyInitial()
		{
			res3d	= new ArrayList();
		}

		public ArrayList Res3D
		{
			get
			{
				return res3d;
			}
			set
			{
				res3d	= value;
			}
		}

		public int Selected
		{
			get
			{
				return select;
			}
		}

		public bool Update()
		{
			listView1.Items.Clear();
			for (int i=0; i<res3d.Count; i++)
			{
				Data3D	temp = (Data3D)res3d[i];
				listView1.Items.Add(temp.Name);
				listView1.Items[i].SubItems.Add(temp.FileName);
			}

			return true;
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.listView1 = new System.Windows.Forms.ListView();
			this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
			this.label1 = new System.Windows.Forms.Label();
			this.button1 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.listView1});
			this.groupBox1.Location = new System.Drawing.Point(8, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(464, 216);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Available Data 3D";
			// 
			// listView1
			// 
			this.listView1.BackColor = System.Drawing.Color.AliceBlue;
			this.listView1.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																						this.columnHeader1,
																						this.columnHeader2});
			this.listView1.FullRowSelect = true;
			this.listView1.GridLines = true;
			this.listView1.Location = new System.Drawing.Point(8, 24);
			this.listView1.MultiSelect = false;
			this.listView1.Name = "listView1";
			this.listView1.Size = new System.Drawing.Size(448, 184);
			this.listView1.TabIndex = 0;
			this.listView1.View = System.Windows.Forms.View.Details;
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Name";
			this.columnHeader1.Width = 150;
			// 
			// columnHeader2
			// 
			this.columnHeader2.Text = "From";
			this.columnHeader2.Width = 300;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(16, 232);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(248, 32);
			this.label1.TabIndex = 1;
			this.label1.Text = "Base Model be used most data (vertex, index, material etc.) to implement model u " +
				"want.";
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(296, 232);
			this.button1.Name = "button1";
			this.button1.TabIndex = 2;
			this.button1.Text = "Accept";
			this.button1.Click += new System.EventHandler(this.Accept);
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(384, 232);
			this.button2.Name = "button2";
			this.button2.TabIndex = 3;
			this.button2.Text = "Cancel";
			this.button2.Click += new System.EventHandler(this.Cancel);
			// 
			// FormSetBase
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 14);
			this.ClientSize = new System.Drawing.Size(480, 269);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.button2,
																		  this.button1,
																		  this.label1,
																		  this.groupBox1});
			this.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
			this.Name = "FormSetBase";
			this.Opacity = 0.9;
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "Set Base Model";
			this.groupBox1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void Accept(object sender, System.EventArgs e)
		{
			if (listView1.SelectedIndices.Count>0)
				select = listView1.SelectedIndices[0];
			else
				select = -1;
			this.Close();
		}

		private void Cancel(object sender, System.EventArgs e)
		{
			select = -1;
			this.Close();
		}
	}
}
