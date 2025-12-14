using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Maker
{
	/// <summary>
	/// Summary description for FormAddAnime.
	/// </summary>
	public class FormAddAnime : System.Windows.Forms.Form
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public FormAddAnime()
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
		private ArrayList anime;
		private System.Windows.Forms.ListView listView1;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.ColumnHeader columnHeader2;
		private System.Windows.Forms.Label label1;
		private int select;

		private void MyInitial()
		{
			res3d	= new ArrayList();
			anime	= new ArrayList();
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

		public Anime Selected
		{
			get
			{
				if (select>=0)
					return (Anime)anime[select];
				return null;
			}
		}

		public void UpdateList()
		{
			listView1.Items.Clear();
			for (int i=0; i<res3d.Count; i++)
			{
				Data3D	temp = (Data3D)res3d[i];
				for (int j=0; j<temp.Animes.Count; j++)
				{
					Anime an = (Anime)temp.Animes[j];
					listView1.Items.Add(an.Name);
					listView1.Items[j].SubItems.Add(temp.FileName);
					anime.Add(an);
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
			this.listView1 = new System.Windows.Forms.ListView();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.button1 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
			this.label1 = new System.Windows.Forms.Label();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			// 
			// listView1
			// 
			this.listView1.BackColor = System.Drawing.Color.MintCream;
			this.listView1.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																						this.columnHeader1,
																						this.columnHeader2});
			this.listView1.FullRowSelect = true;
			this.listView1.GridLines = true;
			this.listView1.Location = new System.Drawing.Point(8, 16);
			this.listView1.Name = "listView1";
			this.listView1.Size = new System.Drawing.Size(464, 160);
			this.listView1.TabIndex = 0;
			this.listView1.View = System.Windows.Forms.View.Details;
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.listView1});
			this.groupBox1.Location = new System.Drawing.Point(8, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(480, 184);
			this.groupBox1.TabIndex = 1;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Available Animation";
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(312, 200);
			this.button1.Name = "button1";
			this.button1.TabIndex = 2;
			this.button1.Text = "Accept";
			this.button1.Click += new System.EventHandler(this.Accept);
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(400, 200);
			this.button2.Name = "button2";
			this.button2.TabIndex = 3;
			this.button2.Text = "Cancel";
			this.button2.Click += new System.EventHandler(this.Cancel);
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Name";
			this.columnHeader1.Width = 160;
			// 
			// columnHeader2
			// 
			this.columnHeader2.Text = "From";
			this.columnHeader2.Width = 300;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 200);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(296, 24);
			this.label1.TabIndex = 4;
			this.label1.Text = "Animation is formed in set. So play animation is to play each set.";
			// 
			// FormAddAnime
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(496, 229);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.label1,
																		  this.button2,
																		  this.button1,
																		  this.groupBox1});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
			this.Name = "FormAddAnime";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "FormAddAnime";
			this.groupBox1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void Accept(object sender, System.EventArgs e)
		{
			if (listView1.SelectedIndices.Count==0)
				select = -1;
			select = listView1.SelectedIndices[0];
			this.Close();
		}

		private void Cancel(object sender, System.EventArgs e)
		{
			select = -1;
			this.Close();
		}
	}
}
