using System;
using System.IO;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Maker
{
	/// <summary>
	/// Summary description for FormEditTexture.
	/// </summary>
	public class FormEditTexture : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.PictureBox pbPreview;
		private System.Windows.Forms.ListView lvData;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.ColumnHeader columnHeader2;
		private System.Windows.Forms.ColumnHeader columnHeader3;
		private System.Windows.Forms.ColumnHeader columnHeader6;
		private System.Windows.Forms.ColumnHeader columnHeader5;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Button button4;
		private System.Windows.Forms.Button button5;
		private System.Windows.Forms.Button button6;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.TextBox textBox2;
		private System.Windows.Forms.Label label3;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public FormEditTexture()
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

		Data2D texture;
		int   sel;
		ArrayList res2d;
		bool OK;

		public void SetData(Data2D s)
		{
			texture = s;
			updateData();
			updateView();
			updatePreview();
		}

		public Data2D Texture
		{
			get 
			{
				return texture;
			}
		}

		public ArrayList Res2D
		{
			set
			{
				res2d = value;
			}
		}

		public bool Ok
		{
			get
			{
				return OK;
			}
		}

		public void updateData()
		{
			textBox1.Text = texture.Name;
			textBox2.Text = texture.FPS.ToString();
		}

		public void updateView()
		{
			lvData.Items.Clear();

			lvData.Items.Add(texture.Default.name + " <Default>");
			lvData.Items[0].SubItems.Add(texture.Default.surdesc.bitcount.ToString());
			lvData.Items[0].SubItems.Add(texture.Default.surdesc.width.ToString() + " x " + texture.Default.surdesc.height.ToString());
			lvData.Items[0].SubItems.Add(texture.Default.surdesc.size.ToString());
			lvData.Items[0].SubItems.Add(texture.Default.filename);

			for (int i=0; i<texture.Images.Count; i++)
			{
				Image	image = (Image)texture.Images[i];
				lvData.Items.Add(image.name);
				lvData.Items[i+1].SubItems.Add(image.surdesc.bitcount.ToString());
				lvData.Items[i+1].SubItems.Add(image.surdesc.width.ToString() + " x " + image.surdesc.height.ToString());
				lvData.Items[i+1].SubItems.Add(image.surdesc.size.ToString());
				lvData.Items[i+1].SubItems.Add(image.filename);
			}
		}

		public void updatePreview()
		{
			
			Image image;
			if (lvData.SelectedIndices.Count<=0)
				return;
			
			sel = lvData.SelectedIndices[0];
			if (sel<0)
			{
				pbPreview.BackColor = Color.Black;
				return ;
			}
			else if (sel==0)
			{
				image = texture.Default;
			}
			else
			{
				image = (Image)texture.Images[sel-1];
			}

			uint bit	= image.surdesc.bitcount;
			uint width	= image.surdesc.width;
			uint height	= image.surdesc.height;
			uint size	= bit*width*height/8;
			int[] data32;
					
					
			MemoryStream ms = new MemoryStream(image.data[0]);
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
		}


		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.button6 = new System.Windows.Forms.Button();
			this.button5 = new System.Windows.Forms.Button();
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
			this.button3 = new System.Windows.Forms.Button();
			this.button4 = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.textBox2 = new System.Windows.Forms.TextBox();
			this.label3 = new System.Windows.Forms.Label();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.groupBox1.SuspendLayout();
			this.panel1.SuspendLayout();
			this.groupBox2.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.button6,
																					this.button5,
																					this.panel1,
																					this.lvData});
			this.groupBox1.Location = new System.Drawing.Point(8, 88);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(728, 280);
			this.groupBox1.TabIndex = 1;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Texture Set";
			// 
			// button6
			// 
			this.button6.Location = new System.Drawing.Point(424, 144);
			this.button6.Name = "button6";
			this.button6.Size = new System.Drawing.Size(32, 23);
			this.button6.TabIndex = 4;
			this.button6.Text = "down";
			// 
			// button5
			// 
			this.button5.Location = new System.Drawing.Point(424, 120);
			this.button5.Name = "button5";
			this.button5.Size = new System.Drawing.Size(32, 23);
			this.button5.TabIndex = 3;
			this.button5.Text = "up";
			this.button5.Click += new System.EventHandler(this.DoUp);
			// 
			// panel1
			// 
			this.panel1.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.pbPreview});
			this.panel1.Location = new System.Drawing.Point(464, 16);
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
			this.button1.Location = new System.Drawing.Point(368, 384);
			this.button1.Name = "button1";
			this.button1.TabIndex = 3;
			this.button1.Text = "Add";
			this.button1.Click += new System.EventHandler(this.Add);
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(448, 384);
			this.button2.Name = "button2";
			this.button2.TabIndex = 4;
			this.button2.Text = "Remove";
			this.button2.Click += new System.EventHandler(this.Remove);
			// 
			// button3
			// 
			this.button3.Location = new System.Drawing.Point(568, 384);
			this.button3.Name = "button3";
			this.button3.TabIndex = 5;
			this.button3.Text = "Accept";
			this.button3.Click += new System.EventHandler(this.Accept);
			// 
			// button4
			// 
			this.button4.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.button4.Location = new System.Drawing.Point(648, 384);
			this.button4.Name = "button4";
			this.button4.TabIndex = 6;
			this.button4.Text = "Cancel";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 376);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(352, 32);
			this.label1.TabIndex = 7;
			this.label1.Text = "Sprite texture is a sequence of texture that be showed each frame.";
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.textBox2,
																					this.label3,
																					this.textBox1,
																					this.label2});
			this.groupBox2.Location = new System.Drawing.Point(8, 8);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(728, 80);
			this.groupBox2.TabIndex = 8;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Texture Attribute";
			// 
			// textBox2
			// 
			this.textBox2.BackColor = System.Drawing.Color.MistyRose;
			this.textBox2.Location = new System.Drawing.Point(96, 48);
			this.textBox2.Name = "textBox2";
			this.textBox2.Size = new System.Drawing.Size(224, 21);
			this.textBox2.TabIndex = 3;
			this.textBox2.Text = "";
			this.textBox2.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Enter);
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(8, 48);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(100, 24);
			this.label3.TabIndex = 2;
			this.label3.Text = "FPS <0-10>:";
			this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// textBox1
			// 
			this.textBox1.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox1.Location = new System.Drawing.Point(96, 24);
			this.textBox1.Name = "textBox1";
			this.textBox1.ReadOnly = true;
			this.textBox1.Size = new System.Drawing.Size(224, 21);
			this.textBox1.TabIndex = 1;
			this.textBox1.Text = "";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(8, 24);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(100, 24);
			this.label2.TabIndex = 0;
			this.label2.Text = "Name:";
			this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// FormEditTexture
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 14);
			this.CancelButton = this.button4;
			this.ClientSize = new System.Drawing.Size(744, 413);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.groupBox2,
																		  this.label1,
																		  this.button4,
																		  this.button3,
																		  this.groupBox1,
																		  this.button1,
																		  this.button2});
			this.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
			this.Name = "FormEditTexture";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "FormEditTexture";
			this.groupBox1.ResumeLayout(false);
			this.panel1.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void SelectTexture(object sender, System.EventArgs e)
		{
			updatePreview();
			updateData();
		}

		private void Accept(object sender, System.EventArgs e)
		{
			OK = true;
			this.Close();
		}

		private void Add(object sender, System.EventArgs e)
		{
			FormCreateTexture fct = new FormCreateTexture();
			fct.SetTitle("Add Texture");
			fct.Res2D = res2d;
			fct.ListData.MultiSelect = false;
			fct.Update();
			fct.ShowDialog(this);
			if (fct.Selected.Count>0)
				texture.Images.Add(((Data2D)res2d[(int)fct.Selected[0]]).Default);
			updateData();
			updateView();
			updatePreview();
		}

		private void Remove(object sender, System.EventArgs e)
		{
			if (lvData.SelectedIndices.Count<=0)
				return;
				
			sel = lvData.SelectedIndices[0];

			if (sel<0)
			{
				return ;
			}
			else if (sel==0)
			{
				return;
			}
			else
			{
				texture.Images.RemoveAt(sel-1);
				updateData();
				updateView();
				updatePreview();
			}
		}

		private void Enter(object sender, System.Windows.Forms.KeyEventArgs e)
		{
			if (e.KeyCode != Keys.Enter)
				return;

			int x;
			try
			{
				x = int.Parse(textBox2.Text);
			}
			catch
			{
				textBox2.Text = texture.FPS.ToString();
				return;
			}

			if ((x<0)||(x>10))
			{
				textBox2.Text = texture.FPS.ToString();
				return; 
			}
			texture.FPS = x;
			updateData();
		}

		private void DoUp(object sender, System.EventArgs e)
		{
			if (lvData.SelectedIndices.Count<=0)
				return;
				
			sel = lvData.SelectedIndices[0];
			
			if (sel<=1)
			{
				return ;
			}
			else
			{
				Image tmp = (Image)texture.Images[sel-1];
				texture.Images[sel-1] = texture.Images[sel-2];
				texture.Images[sel-2] = tmp;
				lvData.Items[sel-1].Selected = true;
				updateData();
				updateView();
				updatePreview();
			}
		}
	}
}
