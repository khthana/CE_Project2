using System;
using System.IO;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Maker
{
	/// <summary>
	/// Summary description for FormCreateTexture.
	/// </summary>
	public class FormCreateTexture : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.ListView lvData;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.ColumnHeader columnHeader2;
		private System.Windows.Forms.ColumnHeader columnHeader3;
		private System.Windows.Forms.ColumnHeader columnHeader5;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.PictureBox pbPreview;
		private System.Windows.Forms.ColumnHeader columnHeader6;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public FormCreateTexture()
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
		private ArrayList res2d;
		private ArrayList select;

		private void MyInitial()
		{
			res2d	= new ArrayList();
			select	= new ArrayList();
		}

		public ArrayList Res2D
		{
			get
			{
				return res2d;
			}
			set
			{
				res2d	= value;
			}
		}

		public ArrayList Selected
		{
			get
			{
				return select;
			}
		}

		public bool Update()
		{
			uint bit;
			uint width;
			uint height;
			uint size;
			for (int i=0; i<res2d.Count; i++)
			{
				Data2D image = (Data2D)res2d[i];
				//lvData.Items.Add(image.Name);
				//lvData.Items[0].SubItems[0].Text = image.Filename;
				lvData.Items.Add(image.Name);
				bit = image.Default.surdesc.bitcount;
				width = image.Default.surdesc.width;
				height = image.Default.surdesc.height;
				size = bit*width*height/8;
				lvData.Items[i].SubItems.Add(bit.ToString());
				lvData.Items[i].SubItems.Add(width.ToString() + "x" + height.ToString());
				lvData.Items[i].SubItems.Add(size.ToString());
				lvData.Items[i].SubItems.Add(image.Filename);
			}
			return true;
		}

		public void SetTitle(string t)
		{
			this.Text = t;
		}

		public ListView ListData
		{
			get
			{
				return lvData;
			}
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.panel1 = new System.Windows.Forms.Panel();
			this.pbPreview = new System.Windows.Forms.PictureBox();
			this.lvData = new System.Windows.Forms.ListView();
			this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader3 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader6 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader5 = new System.Windows.Forms.ColumnHeader();
			this.button1 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.groupBox1.SuspendLayout();
			this.panel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.panel1,
																					this.lvData});
			this.groupBox1.Location = new System.Drawing.Point(8, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(688, 280);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Available Data 2D";
			// 
			// panel1
			// 
			this.panel1.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.pbPreview});
			this.panel1.Location = new System.Drawing.Point(424, 16);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(256, 256);
			this.panel1.TabIndex = 2;
			// 
			// pbPreview
			// 
			this.pbPreview.BackColor = System.Drawing.SystemColors.ControlDarkDark;
			this.pbPreview.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.pbPreview.Name = "pbPreview";
			this.pbPreview.Size = new System.Drawing.Size(256, 256);
			this.pbPreview.TabIndex = 3;
			this.pbPreview.TabStop = false;
			// 
			// lvData
			// 
			this.lvData.BackColor = System.Drawing.Color.Azure;
			this.lvData.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																					 this.columnHeader1,
																					 this.columnHeader2,
																					 this.columnHeader3,
																					 this.columnHeader6,
																					 this.columnHeader5});
			this.lvData.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lvData.FullRowSelect = true;
			this.lvData.GridLines = true;
			this.lvData.Location = new System.Drawing.Point(8, 16);
			this.lvData.Name = "lvData";
			this.lvData.Size = new System.Drawing.Size(408, 256);
			this.lvData.TabIndex = 1;
			this.lvData.View = System.Windows.Forms.View.Details;
			this.lvData.SelectedIndexChanged += new System.EventHandler(this.SelectTexture);
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Name";
			this.columnHeader1.Width = 100;
			// 
			// columnHeader2
			// 
			this.columnHeader2.Text = "BPP";
			this.columnHeader2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader2.Width = 40;
			// 
			// columnHeader3
			// 
			this.columnHeader3.Text = "Width x Height";
			this.columnHeader3.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader3.Width = 100;
			// 
			// columnHeader6
			// 
			this.columnHeader6.Text = "Size (Byte)";
			this.columnHeader6.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			this.columnHeader6.Width = 80;
			// 
			// columnHeader5
			// 
			this.columnHeader5.Text = "From";
			this.columnHeader5.Width = 200;
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(520, 296);
			this.button1.Name = "button1";
			this.button1.TabIndex = 1;
			this.button1.Text = "Accept";
			this.button1.Click += new System.EventHandler(this.Accept);
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(608, 296);
			this.button2.Name = "button2";
			this.button2.TabIndex = 2;
			this.button2.Text = "Cancel";
			this.button2.Click += new System.EventHandler(this.Cancel);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 296);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(488, 32);
			this.label1.TabIndex = 3;
			this.label1.Text = "Texture from DDS file will be translate to be a 2d resource then we can modify se" +
				"vere attributes we want.";
			// 
			// FormCreateTexture
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 14);
			this.ClientSize = new System.Drawing.Size(704, 325);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.label1,
																		  this.button2,
																		  this.button1,
																		  this.groupBox1});
			this.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
			this.Name = "FormCreateTexture";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "FormCreateTexture";
			this.groupBox1.ResumeLayout(false);
			this.panel1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion


		private void Accept(object sender, System.EventArgs e)
		{
			ListView.SelectedIndexCollection sic = lvData.SelectedIndices;

			if (sic.Count<=0)
				return;

			select.Clear();
			
			for (int i=0; i<lvData.Items.Count; i++)
			{
				if (sic.Contains(i))
				{
					select.Add(i);
				}
			}
			this.Close();
		}

		private void Cancel(object sender, System.EventArgs e)
		{
			select.Clear();
			this.Close();
		}

		private void SelectTexture(object sender, System.EventArgs e)
		{
			ListView.SelectedIndexCollection sic = lvData.SelectedIndices;

			if (sic.Count<=0)
				return;
			
			for (int i=0; i<lvData.Items.Count; i++)
			{
				if (sic.Contains(i))
				{
					Data2D image = (Data2D)res2d[i];
					uint bit	= image.Default.surdesc.bitcount;
					uint width	= image.Default.surdesc.width;
					uint height	= image.Default.surdesc.height;
					uint size	= bit*width*height/8;
					int[] data32;
					
					
					MemoryStream ms = new MemoryStream(image.Default.data[0]);
					BinaryReader br = new BinaryReader(ms);
					data32 = new int[size];
					if (bit==32)
					{
						for (int j=0; j<size/4; j++)
							data32[j] = br.ReadInt32();
					}
					else if (bit==16)
					{
						short data16;
						for (int j=0; j<size/4; j++)
						{
							data16 = br.ReadInt16();
							data32[j] = (int)data16;
						}
					}
					else
					{
						for (int j=0; j<size/4; j++)
						{
							data32[j] = 0;
						}
					}

					br.Close();
					Bitmap bmp;
					int x,y;
					Color c;
					
					bmp = new Bitmap((int)width,(int)height);
					for (int j=0; j<size/4; j++)
					{
						y = j/(int)width;
						x = (int)j - y*(int)width;
						c = Color.FromArgb((int)data32[j]);
						bmp.SetPixel(x,y,c);
					}				
					Size s = new Size((int)width, (int)height);
					pbPreview.Size = s;
					pbPreview.Image = bmp;
					break;
				}
			}
		}
	}
}
