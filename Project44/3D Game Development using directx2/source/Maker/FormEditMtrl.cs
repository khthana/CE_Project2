using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Maker
{
	/// <summary>
	/// Summary description for FormEditMtrl.
	/// </summary>
	public class FormEditMtrl : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.TextBox textBox2;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Button set;
		private System.Windows.Forms.TextBox textBox3;
		private System.Windows.Forms.Panel panel2;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.TextBox textBox4;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.TextBox textBox5;
		private System.Windows.Forms.Label label16;
		private System.Windows.Forms.TrackBar trackBar1;
		private System.Windows.Forms.TextBox textBox8;
		private System.Windows.Forms.Label label13;
		private System.Windows.Forms.TextBox textBox6;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.TextBox textBox7;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.PictureBox pictureBox3;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.PictureBox pictureBox2;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.TextBox textBox9;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.PictureBox pictureBox1;
		private System.Windows.Forms.Label label11;
		private System.Windows.Forms.TextBox textBox10;
		private System.Windows.Forms.Label label12;
		private System.Windows.Forms.Button button5;
		private System.Windows.Forms.Button button4;
		private System.Windows.Forms.GroupBox groupBox3;
		private System.Windows.Forms.TreeView treeView1;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Label label14;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public FormEditMtrl()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//

			//MyInitial();
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
		private MtrlSet ms;
		private ArrayList texture;
		int		lb1;
		int		lb2;
		bool	OK;

		private void MyInitial()
		{
			lb1 = 0;
			lb2	= 0;
			trackBar1.Enabled = false;
			updateView();
			updateData();
		}
		
		public MtrlSet Data
		{
			get
			{
				return ms;
			}
			set
			{
				ms = value;
			}
		}

		public void SetData(MtrlSet m, ArrayList tex)
		{
			ms = m;
			texture = tex;
			MyInitial();
		}

		private void updateView()
		{
			treeView1.Nodes.Clear();
			treeView1.Nodes.Add(new TreeNode("Default material"));
			treeView1.Nodes[0].Nodes.Add(new TreeNode(ms.defmtrl.name));

			for (int i=0; i<ms.mtrlkeys.Count; i++)
			{
				MtrlKey mk = (MtrlKey)ms.mtrlkeys[i];
				treeView1.Nodes.Add(new TreeNode(mk.name));
				for (int j=0; j<mk.Length; j++)
				{
					if ((j>0)&&(mk.Key[j-1]>mk.Key[j]))
						treeView1.Nodes[i+1].Nodes.Add(new TreeNode(mk.Mtrl[j].name+ " <" + mk.Key[j].ToString()+">" + " loss!!!"));
					else
						treeView1.Nodes[i+1].Nodes.Add(new TreeNode(mk.Mtrl[j].name+ " <" + mk.Key[j].ToString()+">"));
				}
			}
			treeView1.ExpandAll();
		}
		
		private void updateData()
		{
			material mtrl;
			int key;
			TreeNode tn = treeView1.SelectedNode;

			if (tn==null)
				return;

			if (tn.Parent==null)
			{
				lb1 = tn.Index;
				lb2 = -1;
			}
			else
			{
				lb1 = tn.Parent.Index;
				lb2 = tn.Index;
			}

			if (lb1<0)
			{
				textBox9.Text = "";
				textBox10.Text = "";
				mtrl = ms.defmtrl;
				key = 0;
			}
			else if (lb1==0)
			{
				mtrl = ms.defmtrl;
				key  = 0;
				textBox2.Text = "0";
				textBox1.Text = "Default material";

				textBox3.Text = ms.texture0;
				textBox4.Text = ms.texture1;
			}
			else
			{
				MtrlKey mk = (MtrlKey)ms.mtrlkeys[lb1-1];

				textBox2.Text = mk.Length.ToString();
				textBox1.Text = mk.name;

				textBox3.Text = mk.Tex0;
				textBox4.Text = mk.Tex1;

				if (lb2<0)
				{
					mtrl = ms.defmtrl;
					key = 0;
				}
				else
				{
					mtrl = (material)mk.Mtrl[lb2];
					key	 = (int)mk.Key[lb2];
				}
			}

			if (lb2<0)
			{
				textBox10.Text = "";
				textBox9.Text = "";
				textBox5.Text = "";
				textBox7.Text = "";
				textBox6.Text = "";
				textBox8.Text = "";
				pictureBox1.BackColor = Color.Black;
				pictureBox2.BackColor = Color.Black;
				pictureBox3.BackColor = Color.Black;
				trackBar1.Value = 0;
				trackBar1.Enabled = false;
				return;
			}

			textBox10.Text = mtrl.name;
			textBox9.Text = mtrl.diffuse.ToStringB();
			textBox5.Text = mtrl.specular.ToStringB();
			textBox7.Text = mtrl.emissive.ToStringB();
			textBox6.Text = mtrl.power.ToString();
			textBox8.Text = key.ToString();
			trackBar1.Value = (int)(mtrl.diffuse.a*255);
			trackBar1.Enabled = true;

			pictureBox1.BackColor = Color.FromArgb((int)(mtrl.diffuse.r*255), (int)(mtrl.diffuse.g*255), (int)(mtrl.diffuse.b*255));
			pictureBox2.BackColor = Color.FromArgb((int)(mtrl.specular.r*255), (int)(mtrl.specular.g*255), (int)(mtrl.specular.b*255));
			pictureBox3.BackColor = Color.FromArgb((int)(mtrl.emissive.r*255), (int)(mtrl.emissive.g*255), (int)(mtrl.emissive.b*255));
		}

		public bool Ok
		{
			get
			{
				return OK;
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
			this.panel2 = new System.Windows.Forms.Panel();
			this.button1 = new System.Windows.Forms.Button();
			this.textBox4 = new System.Windows.Forms.TextBox();
			this.panel1 = new System.Windows.Forms.Panel();
			this.set = new System.Windows.Forms.Button();
			this.textBox3 = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.textBox2 = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.textBox5 = new System.Windows.Forms.TextBox();
			this.label16 = new System.Windows.Forms.Label();
			this.trackBar1 = new System.Windows.Forms.TrackBar();
			this.textBox8 = new System.Windows.Forms.TextBox();
			this.label13 = new System.Windows.Forms.Label();
			this.textBox6 = new System.Windows.Forms.TextBox();
			this.label10 = new System.Windows.Forms.Label();
			this.textBox7 = new System.Windows.Forms.TextBox();
			this.label8 = new System.Windows.Forms.Label();
			this.pictureBox3 = new System.Windows.Forms.PictureBox();
			this.label9 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			this.pictureBox2 = new System.Windows.Forms.PictureBox();
			this.label7 = new System.Windows.Forms.Label();
			this.textBox9 = new System.Windows.Forms.TextBox();
			this.label5 = new System.Windows.Forms.Label();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.label11 = new System.Windows.Forms.Label();
			this.textBox10 = new System.Windows.Forms.TextBox();
			this.label12 = new System.Windows.Forms.Label();
			this.button5 = new System.Windows.Forms.Button();
			this.button4 = new System.Windows.Forms.Button();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.treeView1 = new System.Windows.Forms.TreeView();
			this.button3 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.label14 = new System.Windows.Forms.Label();
			this.groupBox1.SuspendLayout();
			this.panel2.SuspendLayout();
			this.panel1.SuspendLayout();
			this.groupBox2.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.trackBar1)).BeginInit();
			this.groupBox3.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.panel2,
																					this.panel1,
																					this.label4,
																					this.label3,
																					this.textBox2,
																					this.label2,
																					this.textBox1,
																					this.label1});
			this.groupBox1.Location = new System.Drawing.Point(8, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(256, 136);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Material Set";
			// 
			// panel2
			// 
			this.panel2.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.button1,
																				 this.textBox4});
			this.panel2.Location = new System.Drawing.Point(88, 104);
			this.panel2.Name = "panel2";
			this.panel2.Size = new System.Drawing.Size(160, 24);
			this.panel2.TabIndex = 9;
			// 
			// button1
			// 
			this.button1.Dock = System.Windows.Forms.DockStyle.Fill;
			this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.button1.Location = new System.Drawing.Point(128, 0);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(32, 24);
			this.button1.TabIndex = 10;
			this.button1.Text = "set";
			this.button1.Click += new System.EventHandler(this.SetTexture1);
			// 
			// textBox4
			// 
			this.textBox4.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox4.Dock = System.Windows.Forms.DockStyle.Left;
			this.textBox4.Name = "textBox4";
			this.textBox4.ReadOnly = true;
			this.textBox4.Size = new System.Drawing.Size(128, 21);
			this.textBox4.TabIndex = 9;
			this.textBox4.Text = "";
			// 
			// panel1
			// 
			this.panel1.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.set,
																				 this.textBox3});
			this.panel1.Location = new System.Drawing.Point(88, 72);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(160, 24);
			this.panel1.TabIndex = 8;
			// 
			// set
			// 
			this.set.Dock = System.Windows.Forms.DockStyle.Fill;
			this.set.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.set.Location = new System.Drawing.Point(128, 0);
			this.set.Name = "set";
			this.set.Size = new System.Drawing.Size(32, 24);
			this.set.TabIndex = 10;
			this.set.Text = "set";
			this.set.Click += new System.EventHandler(this.SetTexture0);
			// 
			// textBox3
			// 
			this.textBox3.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox3.Dock = System.Windows.Forms.DockStyle.Left;
			this.textBox3.Name = "textBox3";
			this.textBox3.ReadOnly = true;
			this.textBox3.Size = new System.Drawing.Size(128, 21);
			this.textBox3.TabIndex = 9;
			this.textBox3.Text = "";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(8, 104);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(72, 23);
			this.label4.TabIndex = 6;
			this.label4.Text = "Tex1 Name:";
			this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(8, 72);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(72, 23);
			this.label3.TabIndex = 4;
			this.label3.Text = "Tex0 Name:";
			this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// textBox2
			// 
			this.textBox2.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox2.Location = new System.Drawing.Point(88, 40);
			this.textBox2.Name = "textBox2";
			this.textBox2.ReadOnly = true;
			this.textBox2.Size = new System.Drawing.Size(160, 21);
			this.textBox2.TabIndex = 3;
			this.textBox2.Text = "";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(8, 40);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(72, 23);
			this.label2.TabIndex = 2;
			this.label2.Text = "No. Keys:";
			this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// textBox1
			// 
			this.textBox1.BackColor = System.Drawing.Color.MistyRose;
			this.textBox1.Location = new System.Drawing.Point(88, 16);
			this.textBox1.Name = "textBox1";
			this.textBox1.Size = new System.Drawing.Size(160, 21);
			this.textBox1.TabIndex = 1;
			this.textBox1.Text = "";
			this.textBox1.KeyDown += new System.Windows.Forms.KeyEventHandler(this.MtrlSetNameEnter);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(48, 23);
			this.label1.TabIndex = 0;
			this.label1.Text = "Name:";
			this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.textBox5,
																					this.label16,
																					this.trackBar1,
																					this.textBox8,
																					this.label13,
																					this.textBox6,
																					this.label10,
																					this.textBox7,
																					this.label8,
																					this.pictureBox3,
																					this.label9,
																					this.label6,
																					this.pictureBox2,
																					this.label7,
																					this.textBox9,
																					this.label5,
																					this.pictureBox1,
																					this.label11,
																					this.textBox10,
																					this.label12});
			this.groupBox2.Location = new System.Drawing.Point(8, 144);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(256, 272);
			this.groupBox2.TabIndex = 3;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Material Key";
			// 
			// textBox5
			// 
			this.textBox5.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox5.Location = new System.Drawing.Point(88, 120);
			this.textBox5.Name = "textBox5";
			this.textBox5.ReadOnly = true;
			this.textBox5.Size = new System.Drawing.Size(160, 21);
			this.textBox5.TabIndex = 1;
			this.textBox5.Text = "";
			// 
			// label16
			// 
			this.label16.Location = new System.Drawing.Point(16, 88);
			this.label16.Name = "label16";
			this.label16.Size = new System.Drawing.Size(48, 16);
			this.label16.TabIndex = 2;
			this.label16.Text = "Opacity";
			this.label16.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// trackBar1
			// 
			this.trackBar1.AutoSize = false;
			this.trackBar1.Location = new System.Drawing.Point(88, 88);
			this.trackBar1.Maximum = 255;
			this.trackBar1.Name = "trackBar1";
			this.trackBar1.Size = new System.Drawing.Size(160, 34);
			this.trackBar1.TabIndex = 4;
			this.trackBar1.TickStyle = System.Windows.Forms.TickStyle.None;
			this.trackBar1.Scroll += new System.EventHandler(this.OpacityChange);
			// 
			// textBox8
			// 
			this.textBox8.BackColor = System.Drawing.Color.MistyRose;
			this.textBox8.Location = new System.Drawing.Point(88, 240);
			this.textBox8.Name = "textBox8";
			this.textBox8.Size = new System.Drawing.Size(160, 21);
			this.textBox8.TabIndex = 1;
			this.textBox8.Text = "";
			this.textBox8.KeyDown += new System.Windows.Forms.KeyEventHandler(this.KeyEnter);
			// 
			// label13
			// 
			this.label13.Location = new System.Drawing.Point(8, 240);
			this.label13.Name = "label13";
			this.label13.Size = new System.Drawing.Size(72, 16);
			this.label13.TabIndex = 2;
			this.label13.Text = "Key (1-1M):";
			this.label13.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// textBox6
			// 
			this.textBox6.BackColor = System.Drawing.Color.MistyRose;
			this.textBox6.Location = new System.Drawing.Point(88, 216);
			this.textBox6.Name = "textBox6";
			this.textBox6.Size = new System.Drawing.Size(160, 21);
			this.textBox6.TabIndex = 1;
			this.textBox6.Text = "";
			this.textBox6.KeyDown += new System.Windows.Forms.KeyEventHandler(this.PowerEnter);
			// 
			// label10
			// 
			this.label10.Location = new System.Drawing.Point(8, 216);
			this.label10.Name = "label10";
			this.label10.Size = new System.Drawing.Size(88, 16);
			this.label10.TabIndex = 2;
			this.label10.Text = "Power (0-100):";
			this.label10.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// textBox7
			// 
			this.textBox7.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox7.Location = new System.Drawing.Point(88, 168);
			this.textBox7.Name = "textBox7";
			this.textBox7.ReadOnly = true;
			this.textBox7.Size = new System.Drawing.Size(160, 21);
			this.textBox7.TabIndex = 1;
			this.textBox7.Text = "";
			// 
			// label8
			// 
			this.label8.Location = new System.Drawing.Point(16, 192);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(48, 16);
			this.label8.TabIndex = 2;
			this.label8.Text = "Color";
			this.label8.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// pictureBox3
			// 
			this.pictureBox3.BackColor = System.Drawing.Color.Black;
			this.pictureBox3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.pictureBox3.Location = new System.Drawing.Point(88, 192);
			this.pictureBox3.Name = "pictureBox3";
			this.pictureBox3.Size = new System.Drawing.Size(160, 16);
			this.pictureBox3.TabIndex = 3;
			this.pictureBox3.TabStop = false;
			this.pictureBox3.DoubleClick += new System.EventHandler(this.EmissiveChange);
			// 
			// label9
			// 
			this.label9.Location = new System.Drawing.Point(8, 168);
			this.label9.Name = "label9";
			this.label9.Size = new System.Drawing.Size(56, 16);
			this.label9.TabIndex = 2;
			this.label9.Text = "Emissive:";
			this.label9.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(8, 120);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(56, 16);
			this.label6.TabIndex = 2;
			this.label6.Text = "Specular:";
			this.label6.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// pictureBox2
			// 
			this.pictureBox2.BackColor = System.Drawing.Color.Black;
			this.pictureBox2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.pictureBox2.Location = new System.Drawing.Point(88, 144);
			this.pictureBox2.Name = "pictureBox2";
			this.pictureBox2.Size = new System.Drawing.Size(160, 16);
			this.pictureBox2.TabIndex = 3;
			this.pictureBox2.TabStop = false;
			this.pictureBox2.DoubleClick += new System.EventHandler(this.SpecularChange);
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(16, 144);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(48, 16);
			this.label7.TabIndex = 2;
			this.label7.Text = "Color";
			this.label7.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// textBox9
			// 
			this.textBox9.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox9.Location = new System.Drawing.Point(88, 40);
			this.textBox9.Name = "textBox9";
			this.textBox9.ReadOnly = true;
			this.textBox9.Size = new System.Drawing.Size(160, 21);
			this.textBox9.TabIndex = 1;
			this.textBox9.Text = "";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(16, 64);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(48, 16);
			this.label5.TabIndex = 2;
			this.label5.Text = "Color";
			this.label5.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// pictureBox1
			// 
			this.pictureBox1.BackColor = System.Drawing.Color.Black;
			this.pictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.pictureBox1.Location = new System.Drawing.Point(88, 64);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(160, 16);
			this.pictureBox1.TabIndex = 3;
			this.pictureBox1.TabStop = false;
			this.pictureBox1.DoubleClick += new System.EventHandler(this.DiffuseChange);
			// 
			// label11
			// 
			this.label11.Location = new System.Drawing.Point(8, 40);
			this.label11.Name = "label11";
			this.label11.Size = new System.Drawing.Size(48, 16);
			this.label11.TabIndex = 2;
			this.label11.Text = "Diffuse:";
			this.label11.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// textBox10
			// 
			this.textBox10.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox10.Location = new System.Drawing.Point(88, 16);
			this.textBox10.Name = "textBox10";
			this.textBox10.ReadOnly = true;
			this.textBox10.Size = new System.Drawing.Size(160, 21);
			this.textBox10.TabIndex = 1;
			this.textBox10.Text = "";
			// 
			// label12
			// 
			this.label12.Location = new System.Drawing.Point(8, 16);
			this.label12.Name = "label12";
			this.label12.Size = new System.Drawing.Size(64, 16);
			this.label12.TabIndex = 0;
			this.label12.Text = "Name:";
			this.label12.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// button5
			// 
			this.button5.Location = new System.Drawing.Point(408, 424);
			this.button5.Name = "button5";
			this.button5.Size = new System.Drawing.Size(88, 23);
			this.button5.TabIndex = 6;
			this.button5.Text = "Cancel";
			this.button5.Click += new System.EventHandler(this.Cancel);
			// 
			// button4
			// 
			this.button4.Location = new System.Drawing.Point(312, 424);
			this.button4.Name = "button4";
			this.button4.Size = new System.Drawing.Size(80, 23);
			this.button4.TabIndex = 4;
			this.button4.Text = "Accept";
			this.button4.Click += new System.EventHandler(this.Accept);
			// 
			// groupBox3
			// 
			this.groupBox3.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.treeView1,
																					this.button3,
																					this.button2});
			this.groupBox3.Location = new System.Drawing.Point(272, 8);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(240, 408);
			this.groupBox3.TabIndex = 5;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "Material Set";
			// 
			// treeView1
			// 
			this.treeView1.BackColor = System.Drawing.Color.LightCyan;
			this.treeView1.HideSelection = false;
			this.treeView1.ImageIndex = -1;
			this.treeView1.Location = new System.Drawing.Point(8, 16);
			this.treeView1.Name = "treeView1";
			this.treeView1.SelectedImageIndex = -1;
			this.treeView1.Size = new System.Drawing.Size(224, 352);
			this.treeView1.TabIndex = 6;
			this.treeView1.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.SelectMaterial);
			// 
			// button3
			// 
			this.button3.Location = new System.Drawing.Point(128, 376);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(104, 23);
			this.button3.TabIndex = 4;
			this.button3.Text = "Remove";
			this.button3.Click += new System.EventHandler(this.Remove);
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(8, 376);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(104, 23);
			this.button2.TabIndex = 3;
			this.button2.Text = "Add";
			this.button2.Click += new System.EventHandler(this.Add);
			// 
			// label14
			// 
			this.label14.Location = new System.Drawing.Point(8, 424);
			this.label14.Name = "label14";
			this.label14.Size = new System.Drawing.Size(296, 32);
			this.label14.TabIndex = 7;
			this.label14.Text = "Edit material attribute eg. key for materail transform and texture for each textu" +
				"re layer.";
			// 
			// FormEditMtrl
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 14);
			this.ClientSize = new System.Drawing.Size(520, 453);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.label14,
																		  this.button5,
																		  this.button4,
																		  this.groupBox3,
																		  this.groupBox2,
																		  this.groupBox1});
			this.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
			this.Name = "FormEditMtrl";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "FormEditMtrl";
			this.groupBox1.ResumeLayout(false);
			this.panel2.ResumeLayout(false);
			this.panel1.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.trackBar1)).EndInit();
			this.groupBox3.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void Add(object sender, System.EventArgs e)
		{
			TreeNode tn = treeView1.SelectedNode;
			if (tn==null)
				return;
			if (tn.Parent==null)
			{
				// Add set
				MtrlKey mk = new MtrlKey();
				material mtrl = new material();
				int index = tn.Index+1;
				mk.name = "material"+index.ToString();
				mtrl.name = "key" + mk.Length.ToString();
				mk.Add(mtrl, 0);
				ms.mtrlkeys.Add(mk);
			}
			else
			{
				// Add key
				lb1 = tn.Parent.Index;
				if (lb1==0)
					return;
				MtrlKey mk = (MtrlKey)ms.mtrlkeys[lb1-1];
				material mtrl = new material();
				mtrl.name = "key" + mk.Length.ToString();
				mk.Add(mtrl, 0);
			}
			updateView();
		}

		private void SelectMaterial(object sender, System.Windows.Forms.TreeViewEventArgs e)
		{
			updateData();
		}

		private void OpacityChange(object sender, System.EventArgs e)
		{
			material mtrl;
			TreeNode tn = treeView1.SelectedNode;
			if (tn.Parent==null)
			{
				lb1 = tn.Index;
				lb2 = -1;
			}
			else
			{
				lb1 = tn.Parent.Index;
				lb2 = tn.Index;
			}

			if (lb1<0)
				return;
			if (lb2<0)
				return;

			if (lb1==0)
			{
				ms.defmtrl.diffuse.a = ((float)trackBar1.Value)/255;
			}
			else
			{
				MtrlKey mk = (MtrlKey)ms.mtrlkeys[lb1-1];
				mk.Mtrl[lb2].diffuse.a = ((float)trackBar1.Value)/255;
			}

			updateData();
		}

		private void DiffuseChange(object sender, System.EventArgs e)
		{
			ColorDialog cd = new ColorDialog();

			TreeNode tn = treeView1.SelectedNode;
			if (tn.Parent==null)
			{
				lb1 = tn.Index;
				lb2 = -1;
			}
			else
			{
				lb1 = tn.Parent.Index;
				lb2 = tn.Index;
			}

			if (lb1 < 0)
			{
				return;
			}

			if(cd.ShowDialog() != DialogResult.OK)
				return;

			MtrlKey m1;
			material m2;
			if (lb1 == 0)
			{
				ms.defmtrl.diffuse.r = ((float)cd.Color.R)/255;
				ms.defmtrl.diffuse.g = ((float)cd.Color.G)/255;
				ms.defmtrl.diffuse.b = ((float)cd.Color.B)/255;
			}
			else
			{
				m1 = (MtrlKey)ms.mtrlkeys[lb1-1];
				if (lb1 < 0)
					return;

				(m1.Mtrl[lb2]).diffuse.r = ((float)cd.Color.R)/255;
				(m1.Mtrl[lb2]).diffuse.g = ((float)cd.Color.G)/255;
				(m1.Mtrl[lb2]).diffuse.b = ((float)cd.Color.B)/255;
			}
			updateData();
		}

		private void SpecularChange(object sender, System.EventArgs e)
		{
			ColorDialog cd = new ColorDialog();

			TreeNode tn = treeView1.SelectedNode;
			if (tn.Parent==null)
			{
				lb1 = tn.Index;
				lb2 = -1;
			}
			else
			{
				lb1 = tn.Parent.Index;
				lb2 = tn.Index;
			}

			if (lb1 < 0)
			{
				return;
			}

			if(cd.ShowDialog() != DialogResult.OK)
				return;

			MtrlKey m1;
			material m2;
			if (lb1 == 0)
			{
				ms.defmtrl.specular.r = ((float)cd.Color.R)/255;
				ms.defmtrl.specular.g = ((float)cd.Color.G)/255;
				ms.defmtrl.specular.b = ((float)cd.Color.B)/255;
			}
			else
			{
				m1 = (MtrlKey)ms.mtrlkeys[lb1-1];
				if (lb1 < 0)
					return;

				(m1.Mtrl[lb2]).specular.r = ((float)cd.Color.R)/255;
				(m1.Mtrl[lb2]).specular.g = ((float)cd.Color.G)/255;
				(m1.Mtrl[lb2]).specular.b = ((float)cd.Color.B)/255;
			}
			updateData();
		}

		private void Remove(object sender, System.EventArgs e)
		{
			TreeNode tn = treeView1.SelectedNode;
			if (tn==null)
				return;
			if (tn.Parent==null)
			{
				// Remove set
				if (tn.Index==0)
					return;
				ms.mtrlkeys.RemoveAt(tn.Index-1);
			}
			else
			{
				// Remove key
			}
			updateView();
		}

		private void MtrlSetNameEnter(object sender, System.Windows.Forms.KeyEventArgs e)
		{
			if (e.KeyCode != Keys.Enter)
				return;

			material mtrl;
			TreeNode tn = treeView1.SelectedNode;
			if (tn==null)
				return;
			if (tn.Parent==null)
			{
				lb1 = tn.Index;
				lb2 = -1;
			}
			else
			{
				lb1 = tn.Parent.Index;
				lb2 = tn.Index;
			}
			if (lb1<=0)
				return;

			MtrlKey mk = (MtrlKey)ms.mtrlkeys[lb1-1];
			mk.name = textBox1.Text;
			ms.mtrlkeys[lb1-1] = mk;

			for (int i=0; i<mk.Length; i++)
				mk.Mtrl[i].name = "key" + i.ToString();

			updateData();
			updateView();
		}

		private void EmissiveChange(object sender, System.EventArgs e)
		{
			ColorDialog cd = new ColorDialog();

			TreeNode tn = treeView1.SelectedNode;
			if (tn.Parent==null)
			{
				lb1 = tn.Index;
				lb2 = -1;
			}
			else
			{
				lb1 = tn.Parent.Index;
				lb2 = tn.Index;
			}

			if (lb1 < 0)
			{
				return;
			}

			if(cd.ShowDialog() != DialogResult.OK)
				return;

			MtrlKey m1;
			material m2;
			if (lb1 == 0)
			{
				ms.defmtrl.emissive.r = ((float)cd.Color.R)/255;
				ms.defmtrl.emissive.g = ((float)cd.Color.G)/255;
				ms.defmtrl.emissive.b = ((float)cd.Color.B)/255;
			}
			else
			{
				m1 = (MtrlKey)ms.mtrlkeys[lb1-1];
				if (lb1 < 0)
					return;

				(m1.Mtrl[lb2]).emissive.r = ((float)cd.Color.R)/255;
				(m1.Mtrl[lb2]).emissive.g = ((float)cd.Color.G)/255;
				(m1.Mtrl[lb2]).emissive.b = ((float)cd.Color.B)/255;
			}
			updateData();
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

		private void SetTexture0(object sender, System.EventArgs e)
		{
			FormMtrlTexture femt = new FormMtrlTexture();
			femt.SetData(texture);
			femt.ShowDialog(this);

			if (femt.Ok)
			{
				material mtrl;
				TreeNode tn = treeView1.SelectedNode;
				if (tn.Parent==null)
				{
					lb1 = tn.Index;
					lb2 = -1;
				}
				else
				{
					lb1 = tn.Parent.Index;
					lb2 = tn.Index;
				}
				if (lb1<0)
					return;

				if (lb1==0)
				{
					ms.texture0 = femt.Texture;
					
					for (int i=0; i<ms.mtrlkeys.Count; i++)
					{
						MtrlKey mk = (MtrlKey)ms.mtrlkeys[i];
						mk.Tex0 = femt.Texture;
					}
				}
				else
				{
					MtrlKey mk = (MtrlKey)ms.mtrlkeys[lb1-1];
					mk.Tex0 = femt.Texture;
				}

				updateData();
			}
		}

		private void SetTexture1(object sender, System.EventArgs e)
		{
			FormMtrlTexture femt = new FormMtrlTexture();
			femt.SetData(texture);
			femt.ShowDialog(this);

			if (femt.Ok)
			{
				material mtrl;
				TreeNode tn = treeView1.SelectedNode;
				if (tn.Parent==null)
				{
					lb1 = tn.Index;
					lb2 = -1;
				}
				else
				{
					lb1 = tn.Parent.Index;
					lb2 = tn.Index;
				}
				if (lb1<0)
					return;

				if (lb1==0)
				{
					ms.texture1 = femt.Texture;
					
					for (int i=0; i<ms.mtrlkeys.Count; i++)
					{
						MtrlKey mk = (MtrlKey)ms.mtrlkeys[i];
						mk.Tex1 = femt.Texture;
					}
				}
				else
				{
					MtrlKey mk = (MtrlKey)ms.mtrlkeys[lb1-1];
					mk.Tex1 = femt.Texture;
				}

				updateData();
			}
		}

		private void PowerEnter(object sender, System.Windows.Forms.KeyEventArgs e)
		{
			if (e.KeyCode != Keys.Enter)
				return;

			TreeNode tn = treeView1.SelectedNode;
			if (tn==null)
				return;
			if (tn.Parent==null)
			{
				lb1 = tn.Index;
				lb2 = -1;
			}
			else
			{
				lb1 = tn.Parent.Index;
				lb2 = tn.Index;
			}

			if (lb1<0)
				return;
			if (lb2<0)
				return;

			if (lb1==0)
			{
				ms.defmtrl.diffuse.a = ((float)trackBar1.Value)/255;
			}
			else
			{
				MtrlKey mk = (MtrlKey)ms.mtrlkeys[lb1-1];
				float f;
				try
				{
					f = float.Parse(textBox6.Text);
				}
				catch (Exception)
				{
					return;
				}
				if (f<0)
					return;
				if (f>100)
					return;
				mk.Mtrl[lb2].power = f;
				updateData();
			}
		}

		private void KeyEnter(object sender, System.Windows.Forms.KeyEventArgs e)
		{
			if (e.KeyCode != Keys.Enter)
				return;

			TreeNode tn = treeView1.SelectedNode;
			if (tn == null)
				return;
			if (tn.Parent==null)
			{
				lb1 = tn.Index;
				lb2 = -1;
			}
			else
			{
				lb1 = tn.Parent.Index;
				lb2 = tn.Index;
			}

			if (lb1<0)
				return;
			if (lb2<0)
				return;

			if (lb1==0)
			{
				ms.defmtrl.diffuse.a = ((float)trackBar1.Value)/255;
			}
			else
			{
				MtrlKey mk = (MtrlKey)ms.mtrlkeys[lb1-1];
				int i;
				try
				{
					i = int.Parse(textBox8.Text);
				}
				catch (Exception)
				{
					return;
				}
				if (i<0)
					return;
				if (i>1000000)
					return;
				mk.Key[lb2] = i;
				updateData();
				updateView();
			}
		}
	}
}
