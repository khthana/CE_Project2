using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Maker
{
	/// <summary>
	/// Summary description for FormAddLayer.
	/// </summary>
	public class FormAddLayer : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button btCancel;
		private System.Windows.Forms.Button btOK;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.ListView listView1;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.ColumnHeader columnHeader2;
		private System.Windows.Forms.ColumnHeader columnHeader3;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public FormAddLayer()
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
		private ArrayList res3d;
		private ArrayList frame;
		private int select;

		private void MyInitial()
		{
			res3d	= new ArrayList();
			frame	= new ArrayList();
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

		public Frame Selected
		{
			get
			{
				if (select>=0)
					return (Frame)frame[select];
				return null;
			}
		}

		public void UpdateList(string target)
		{
			listView1.Items.Clear();
			for (int i=0; i<res3d.Count; i++)
			{
				Data3D	temp = (Data3D)res3d[i];
				//listView1.Items.Add(temp.Name + " (" + temp.FileName + ")");
				for (int j=0; j<temp.Frames.Count; j++)
				{
					Frame f = (Frame)temp.Frames[j];
					if (f.Name==target)
					{
						listView1.Items.Add(f.Name);
						listView1.Items[i].SubItems.Add(temp.Name);
						listView1.Items[i].SubItems.Add(temp.FileName);
						frame.Add(f);
					}
				}
			}
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.btCancel = new System.Windows.Forms.Button();
			this.btOK = new System.Windows.Forms.Button();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.label1 = new System.Windows.Forms.Label();
			this.listView1 = new System.Windows.Forms.ListView();
			this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader3 = new System.Windows.Forms.ColumnHeader();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			// 
			// btCancel
			// 
			this.btCancel.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.btCancel.Location = new System.Drawing.Point(448, 232);
			this.btCancel.Name = "btCancel";
			this.btCancel.TabIndex = 5;
			this.btCancel.Text = "Cancel";
			this.btCancel.Click += new System.EventHandler(this.Cancel);
			// 
			// btOK
			// 
			this.btOK.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.btOK.Location = new System.Drawing.Point(344, 232);
			this.btOK.Name = "btOK";
			this.btOK.TabIndex = 4;
			this.btOK.Text = "Accept";
			this.btOK.Click += new System.EventHandler(this.Accept);
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.listView1});
			this.groupBox1.Location = new System.Drawing.Point(8, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(528, 216);
			this.groupBox1.TabIndex = 3;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Available Texture Coordinate";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 232);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(328, 23);
			this.label1.TabIndex = 6;
			this.label1.Text = "Layer texture is used to create a special effect eg. shadow.";
			// 
			// listView1
			// 
			this.listView1.BackColor = System.Drawing.Color.Lavender;
			this.listView1.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																						this.columnHeader1,
																						this.columnHeader2,
																						this.columnHeader3});
			this.listView1.FullRowSelect = true;
			this.listView1.GridLines = true;
			this.listView1.Location = new System.Drawing.Point(8, 16);
			this.listView1.Name = "listView1";
			this.listView1.Size = new System.Drawing.Size(512, 192);
			this.listView1.TabIndex = 0;
			this.listView1.View = System.Windows.Forms.View.Details;
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Frame";
			this.columnHeader1.Width = 103;
			// 
			// columnHeader2
			// 
			this.columnHeader2.Text = "Name";
			this.columnHeader2.Width = 177;
			// 
			// columnHeader3
			// 
			this.columnHeader3.Text = "From";
			this.columnHeader3.Width = 306;
			// 
			// FormAddLayer
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(544, 261);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.label1,
																		  this.btCancel,
																		  this.btOK,
																		  this.groupBox1});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
			this.Name = "FormAddLayer";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "FormAddLayer";
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
