using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.IO;

namespace Maker
{
	/// <summary>
	/// Summary description for FormMtrlTexture.
	/// </summary>
	public class FormMtrlTexture : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Panel panel3;
		private System.Windows.Forms.PictureBox pbPreview;
		private System.Windows.Forms.Button button4;
		private System.Windows.Forms.ListView listView1;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.ColumnHeader columnHeader2;
		private System.Windows.Forms.ColumnHeader columnHeader3;
		private System.Windows.Forms.Label label1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public FormMtrlTexture()
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

		int   sel;
		ArrayList texture;
		bool OK;

		public void SetData(ArrayList s)
		{
			texture = s;
			updateData();
			updateView();
			updatePreview();
		}

		public string Texture
		{
			get 
			{
				if (sel>=texture.Count)
					return "null";
				return ((Data2D)texture[sel]).Name;
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
			/*
			sel = listBox1.SelectedIndex;
			if (sel<0)
			{
				textBox1.Text = "";
				textBox2.Text = "";
				textBox6.Text = "";
				return;
			}
			textBox1.Text = ((Data2D)texture[sel]).Name;
			textBox2.Text = ((Data2D)texture[sel]).Images.Count.ToString();
			textBox6.Text = ((Data2D)texture[sel]).FPS.ToString();*/
			

		}

		public void updateView()
		{
			/*listBox1.Items.Clear();

			for (int i=0; i<texture.Count; i++)
				listBox1.Items.Add(((Data2D)texture[i]).Name);*/

			listView1.Items.Clear();

			for (int i=0; i<texture.Count; i++)
			{
				listView1.Items.Add(((Data2D)texture[i]).Name);
				listView1.Items[i].SubItems.Add(((Data2D)texture[i]).Images.Count.ToString());
				listView1.Items[i].SubItems.Add(((Data2D)texture[i]).FPS.ToString());
			}

			listView1.Items.Add("null");
		}

		public void updatePreview()
		{
			
			Image image;

			if (listView1.SelectedIndices.Count==0)
				return;
            
			sel = listView1.SelectedIndices[0];
			
			if (sel<0)
			{
				pbPreview.BackColor = Color.Black;
				return ;
			}
			else if (sel>=texture.Count)
			{
				pbPreview.BackColor	= Color.Black;
				return;
			}
			else
			{
				image = (Image)((Data2D)texture[sel]).Default;
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
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.button3 = new System.Windows.Forms.Button();
			this.panel3 = new System.Windows.Forms.Panel();
			this.pbPreview = new System.Windows.Forms.PictureBox();
			this.button4 = new System.Windows.Forms.Button();
			this.listView1 = new System.Windows.Forms.ListView();
			this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader3 = new System.Windows.Forms.ColumnHeader();
			this.label1 = new System.Windows.Forms.Label();
			this.groupBox2.SuspendLayout();
			this.panel3.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.listView1,
																					this.panel3});
			this.groupBox2.Location = new System.Drawing.Point(8, 8);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(696, 280);
			this.groupBox2.TabIndex = 10;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Texture set";
			// 
			// button3
			// 
			this.button3.Location = new System.Drawing.Point(520, 296);
			this.button3.Name = "button3";
			this.button3.TabIndex = 12;
			this.button3.Text = "Accept";
			this.button3.Click += new System.EventHandler(this.Accept);
			// 
			// panel3
			// 
			this.panel3.AutoScroll = true;
			this.panel3.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.pbPreview});
			this.panel3.Location = new System.Drawing.Point(432, 16);
			this.panel3.Name = "panel3";
			this.panel3.Size = new System.Drawing.Size(256, 256);
			this.panel3.TabIndex = 14;
			// 
			// pbPreview
			// 
			this.pbPreview.BackColor = System.Drawing.Color.Black;
			this.pbPreview.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.pbPreview.Name = "pbPreview";
			this.pbPreview.Size = new System.Drawing.Size(256, 256);
			this.pbPreview.TabIndex = 7;
			this.pbPreview.TabStop = false;
			// 
			// button4
			// 
			this.button4.Location = new System.Drawing.Point(608, 296);
			this.button4.Name = "button4";
			this.button4.TabIndex = 11;
			this.button4.Text = "Cancel";
			this.button4.Click += new System.EventHandler(this.Cancel);
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
			this.listView1.Size = new System.Drawing.Size(416, 256);
			this.listView1.TabIndex = 0;
			this.listView1.View = System.Windows.Forms.View.Details;
			this.listView1.SelectedIndexChanged += new System.EventHandler(this.TextureChange);
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Name";
			this.columnHeader1.Width = 200;
			// 
			// columnHeader2
			// 
			this.columnHeader2.Text = "No. Texture";
			this.columnHeader2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader2.Width = 100;
			// 
			// columnHeader3
			// 
			this.columnHeader3.Text = "FPS";
			this.columnHeader3.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader3.Width = 100;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(16, 296);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(488, 23);
			this.label1.TabIndex = 13;
			this.label1.Text = "Available texture to set for each layer of material.";
			// 
			// FormMtrlTexture
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(712, 325);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.label1,
																		  this.groupBox2,
																		  this.button3,
																		  this.button4});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
			this.Name = "FormMtrlTexture";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "FormMtrlTexture";
			this.groupBox2.ResumeLayout(false);
			this.panel3.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void TextureChange(object sender, System.EventArgs e)
		{
			updateData();
			updatePreview();
		}

		private void Accept(object sender, System.EventArgs e)
		{
			OK = true;
			this.Close();
		}

		private void Cancel(object sender, System.EventArgs e)
		{
			OK = false;
			this.Close();
		}
	}
}
