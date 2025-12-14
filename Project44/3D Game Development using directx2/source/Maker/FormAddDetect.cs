using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Maker
{
	/// <summary>
	/// Summary description for FormAddDetect.
	/// </summary>
	public class FormAddDetect : System.Windows.Forms.Form
	{
		private System.Windows.Forms.ListBox listBox2;
		private System.Windows.Forms.ListBox listBox1;
		private System.Windows.Forms.Button button4;
		private System.Windows.Forms.Button button5;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.TextBox textBox6;
		private System.Windows.Forms.TextBox textBox7;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.TextBox textBox8;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.Button button6;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.CheckBox checkBox1;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.TextBox textBox9;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.TextBox textBox2;
		private System.Windows.Forms.TextBox textBox3;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox textBox4;
		private System.Windows.Forms.TextBox textBox5;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public FormAddDetect()
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

		// programmer
		ArrayList frame;
		ArrayList collide;
		bool OK;

		public void SetData(ArrayList f, ArrayList c)
		{
			frame = f;
			collide =c;

			updateView();
			updateData();
		}

		public ArrayList Collide
		{
			get 
			{
				return collide;
			}
		}
		
		public bool Ok
		{
			get
			{
				return OK;
			}
		}

		private void updateData()
		{
			int sel = listBox1.SelectedIndex;
			int sel2= listBox2.SelectedIndex;

			if (sel<0)
			{
				textBox8.Text = "";
				textBox6.Text = "";
				textBox7.Text = "";
			}
			else if (sel==0)
			{
				textBox8.Text = "Model";
				textBox6.Text = "Model";
				textBox7.Text = "null";
			}
			else
			{
				textBox8.Text = ((Frame)frame[sel-1]).Name;
				if (((Frame)frame[sel-1]).Mesh)
					textBox6.Text = "Mesh";
				else
					textBox6.Text = "non-Mesh";
				if (((Frame)frame[sel-1]).Parent == null)
					textBox7.Text = "null";
				else
					textBox7.Text = ((Frame)frame[sel-1]).Parent.Name;
			}

			if (sel2<0)
			{
				textBox1.Text = "";
				textBox2.Text = "";
				textBox3.Text = "";
				textBox4.Text = "";
				textBox5.Text = "";
				textBox9.Text = "";
			}
			else
			{
				textBox1.Text = ((colliser)collide[sel2]).name;
				switch (((colliser)collide[sel2]).type)
				{
					case 0:
						textBox2.Text = "";
						textBox3.Text = "";
						textBox4.Text = "";
						textBox5.Text = "";
						textBox9.Text = "";
						break;
					case 1: // wall
						textBox2.Text = "wall";
						textBox3.Text = ((colliser)collide[sel2]).parent;
						textBox4.Text = "";
						textBox5.Text = "";
						textBox9.Text = ((colliser)collide[sel2]).data.Index.Length.ToString();
						break;
					case 2: // ground
						textBox2.Text = "ground";
						textBox3.Text = ((colliser)collide[sel2]).parent;
						textBox4.Text = "";
						textBox5.Text = "";
						textBox9.Text = ((colliser)collide[sel2]).data.Index.Length.ToString();
						break;
					case 3: // cylinder
						textBox2.Text = "cylinder";
						textBox3.Text = ((colliser)collide[sel2]).parent;
						textBox4.Text = ((colliser)collide[sel2]).radius.ToString();
						textBox5.Text = ((colliser)collide[sel2]).height.ToString();
						textBox9.Text = "";
						break;
					case 4: // sphere
						textBox2.Text = "sphere";
						textBox3.Text = ((colliser)collide[sel2]).parent;
						textBox4.Text = ((colliser)collide[sel2]).radius.ToString();
						textBox5.Text = "";
						textBox9.Text = "";
						break;
				}
			}
		}

		private void updateView()
		{
			listBox1.Items.Clear();
			listBox2.Items.Clear();

			listBox1.Items.Add("<null>");

			int i;
			for (i=0; i<frame.Count; i++)
				listBox1.Items.Add(((Frame)frame[i]).Name);

			for (i=0; i<collide.Count; i++)
				listBox2.Items.Add(((colliser)collide[i]).name);
		}


		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.listBox2 = new System.Windows.Forms.ListBox();
			this.listBox1 = new System.Windows.Forms.ListBox();
			this.button4 = new System.Windows.Forms.Button();
			this.button5 = new System.Windows.Forms.Button();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.label7 = new System.Windows.Forms.Label();
			this.textBox6 = new System.Windows.Forms.TextBox();
			this.textBox7 = new System.Windows.Forms.TextBox();
			this.label8 = new System.Windows.Forms.Label();
			this.textBox8 = new System.Windows.Forms.TextBox();
			this.label9 = new System.Windows.Forms.Label();
			this.button6 = new System.Windows.Forms.Button();
			this.button3 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.button1 = new System.Windows.Forms.Button();
			this.checkBox1 = new System.Windows.Forms.CheckBox();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.textBox9 = new System.Windows.Forms.TextBox();
			this.label10 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			this.textBox2 = new System.Windows.Forms.TextBox();
			this.textBox3 = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.textBox4 = new System.Windows.Forms.TextBox();
			this.textBox5 = new System.Windows.Forms.TextBox();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.groupBox1.SuspendLayout();
			this.groupBox2.SuspendLayout();
			this.SuspendLayout();
			// 
			// listBox2
			// 
			this.listBox2.BackColor = System.Drawing.Color.Beige;
			this.listBox2.IntegralHeight = false;
			this.listBox2.Location = new System.Drawing.Point(208, 24);
			this.listBox2.Name = "listBox2";
			this.listBox2.Size = new System.Drawing.Size(176, 376);
			this.listBox2.TabIndex = 9;
			this.listBox2.SelectedIndexChanged += new System.EventHandler(this.List2Change);
			// 
			// listBox1
			// 
			this.listBox1.BackColor = System.Drawing.Color.Beige;
			this.listBox1.IntegralHeight = false;
			this.listBox1.Location = new System.Drawing.Point(16, 152);
			this.listBox1.Name = "listBox1";
			this.listBox1.Size = new System.Drawing.Size(168, 168);
			this.listBox1.TabIndex = 8;
			this.listBox1.SelectedIndexChanged += new System.EventHandler(this.List1Change);
			// 
			// button4
			// 
			this.button4.Location = new System.Drawing.Point(368, 416);
			this.button4.Name = "button4";
			this.button4.Size = new System.Drawing.Size(80, 23);
			this.button4.TabIndex = 6;
			this.button4.Text = "Accept";
			this.button4.Click += new System.EventHandler(this.Accept);
			// 
			// button5
			// 
			this.button5.Location = new System.Drawing.Point(464, 416);
			this.button5.Name = "button5";
			this.button5.Size = new System.Drawing.Size(88, 23);
			this.button5.TabIndex = 7;
			this.button5.Text = "Cancel";
			this.button5.Click += new System.EventHandler(this.Cancel);
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.label7,
																					this.textBox6,
																					this.textBox7,
																					this.label8,
																					this.textBox8,
																					this.label9,
																					this.button6,
																					this.button3,
																					this.button2,
																					this.button1,
																					this.checkBox1});
			this.groupBox1.Location = new System.Drawing.Point(8, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(184, 400);
			this.groupBox1.TabIndex = 11;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Frame";
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(8, 56);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(100, 16);
			this.label7.TabIndex = 0;
			this.label7.Text = "Type";
			// 
			// textBox6
			// 
			this.textBox6.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox6.Location = new System.Drawing.Point(8, 72);
			this.textBox6.Name = "textBox6";
			this.textBox6.ReadOnly = true;
			this.textBox6.Size = new System.Drawing.Size(168, 20);
			this.textBox6.TabIndex = 1;
			this.textBox6.Text = "";
			// 
			// textBox7
			// 
			this.textBox7.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox7.Location = new System.Drawing.Point(8, 112);
			this.textBox7.Name = "textBox7";
			this.textBox7.ReadOnly = true;
			this.textBox7.Size = new System.Drawing.Size(168, 20);
			this.textBox7.TabIndex = 1;
			this.textBox7.Text = "";
			// 
			// label8
			// 
			this.label8.Location = new System.Drawing.Point(8, 96);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(100, 16);
			this.label8.TabIndex = 0;
			this.label8.Text = "Parent";
			// 
			// textBox8
			// 
			this.textBox8.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox8.Location = new System.Drawing.Point(8, 32);
			this.textBox8.Name = "textBox8";
			this.textBox8.ReadOnly = true;
			this.textBox8.Size = new System.Drawing.Size(168, 20);
			this.textBox8.TabIndex = 1;
			this.textBox8.Text = "";
			// 
			// label9
			// 
			this.label9.Location = new System.Drawing.Point(8, 16);
			this.label9.Name = "label9";
			this.label9.Size = new System.Drawing.Size(100, 16);
			this.label9.TabIndex = 0;
			this.label9.Text = "Name";
			// 
			// button6
			// 
			this.button6.Location = new System.Drawing.Point(96, 368);
			this.button6.Name = "button6";
			this.button6.Size = new System.Drawing.Size(80, 23);
			this.button6.TabIndex = 0;
			this.button6.Text = "Add Sphere";
			this.button6.Click += new System.EventHandler(this.AddSphere);
			// 
			// button3
			// 
			this.button3.Location = new System.Drawing.Point(8, 368);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(80, 23);
			this.button3.TabIndex = 0;
			this.button3.Text = "Add Cylinder";
			this.button3.Click += new System.EventHandler(this.AddCylinder);
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(96, 336);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(80, 23);
			this.button2.TabIndex = 0;
			this.button2.Text = "Add Wall";
			this.button2.Click += new System.EventHandler(this.AddWall);
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(8, 336);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(80, 23);
			this.button1.TabIndex = 0;
			this.button1.Text = "Add Ground";
			this.button1.Click += new System.EventHandler(this.AddGround);
			// 
			// checkBox1
			// 
			this.checkBox1.Checked = true;
			this.checkBox1.CheckState = System.Windows.Forms.CheckState.Checked;
			this.checkBox1.Location = new System.Drawing.Point(8, 312);
			this.checkBox1.Name = "checkBox1";
			this.checkBox1.Size = new System.Drawing.Size(168, 24);
			this.checkBox1.TabIndex = 0;
			this.checkBox1.Text = "Use model as parent (null)";
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.textBox9,
																					this.label10,
																					this.label6,
																					this.textBox2,
																					this.textBox3,
																					this.label2,
																					this.label3,
																					this.textBox4,
																					this.textBox5,
																					this.textBox1,
																					this.label4,
																					this.label5});
			this.groupBox2.Location = new System.Drawing.Point(200, 8);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(360, 400);
			this.groupBox2.TabIndex = 10;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Collision Detector";
			// 
			// textBox9
			// 
			this.textBox9.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox9.Location = new System.Drawing.Point(192, 232);
			this.textBox9.Name = "textBox9";
			this.textBox9.ReadOnly = true;
			this.textBox9.Size = new System.Drawing.Size(160, 20);
			this.textBox9.TabIndex = 1;
			this.textBox9.Text = "";
			// 
			// label10
			// 
			this.label10.Location = new System.Drawing.Point(192, 216);
			this.label10.Name = "label10";
			this.label10.Size = new System.Drawing.Size(160, 16);
			this.label10.TabIndex = 0;
			this.label10.Text = "Number of elements (w+g)";
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(192, 176);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(100, 16);
			this.label6.TabIndex = 0;
			this.label6.Text = "Height (Cylinder)";
			// 
			// textBox2
			// 
			this.textBox2.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox2.Location = new System.Drawing.Point(192, 72);
			this.textBox2.Name = "textBox2";
			this.textBox2.ReadOnly = true;
			this.textBox2.Size = new System.Drawing.Size(160, 20);
			this.textBox2.TabIndex = 1;
			this.textBox2.Text = "";
			// 
			// textBox3
			// 
			this.textBox3.BackColor = System.Drawing.Color.AntiqueWhite;
			this.textBox3.Location = new System.Drawing.Point(192, 112);
			this.textBox3.Name = "textBox3";
			this.textBox3.ReadOnly = true;
			this.textBox3.Size = new System.Drawing.Size(160, 20);
			this.textBox3.TabIndex = 1;
			this.textBox3.Text = "";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(192, 16);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(100, 16);
			this.label2.TabIndex = 0;
			this.label2.Text = "Name";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(192, 56);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(100, 16);
			this.label3.TabIndex = 0;
			this.label3.Text = "Type";
			// 
			// textBox4
			// 
			this.textBox4.BackColor = System.Drawing.Color.MistyRose;
			this.textBox4.Location = new System.Drawing.Point(192, 152);
			this.textBox4.Name = "textBox4";
			this.textBox4.Size = new System.Drawing.Size(160, 20);
			this.textBox4.TabIndex = 1;
			this.textBox4.Text = "";
			this.textBox4.KeyDown += new System.Windows.Forms.KeyEventHandler(this.RadiusEnter);
			// 
			// textBox5
			// 
			this.textBox5.BackColor = System.Drawing.Color.MistyRose;
			this.textBox5.Location = new System.Drawing.Point(192, 192);
			this.textBox5.Name = "textBox5";
			this.textBox5.Size = new System.Drawing.Size(160, 20);
			this.textBox5.TabIndex = 1;
			this.textBox5.Text = "";
			this.textBox5.KeyDown += new System.Windows.Forms.KeyEventHandler(this.HeightEnter);
			// 
			// textBox1
			// 
			this.textBox1.BackColor = System.Drawing.Color.MistyRose;
			this.textBox1.Location = new System.Drawing.Point(192, 32);
			this.textBox1.Name = "textBox1";
			this.textBox1.Size = new System.Drawing.Size(160, 20);
			this.textBox1.TabIndex = 1;
			this.textBox1.Text = "";
			this.textBox1.KeyDown += new System.Windows.Forms.KeyEventHandler(this.NameEnter);
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(192, 96);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(100, 16);
			this.label4.TabIndex = 0;
			this.label4.Text = "Parent";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(192, 136);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(152, 16);
			this.label5.TabIndex = 0;
			this.label5.Text = "Radius (Sphere+Cylinder)";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 416);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(344, 32);
			this.label1.TabIndex = 12;
			this.label1.Text = "Create data that will be used as element to detection eg. wall, ground, cylinder " +
				"and sphere.";
			// 
			// FormAddDetect
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(568, 445);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.label1,
																		  this.listBox2,
																		  this.listBox1,
																		  this.button4,
																		  this.button5,
																		  this.groupBox1,
																		  this.groupBox2});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
			this.Name = "FormAddDetect";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "FormAddDetect";
			this.groupBox1.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

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

		private void List2Change(object sender, System.EventArgs e)
		{
			updateData();
		}

		private void List1Change(object sender, System.EventArgs e)
		{
			updateData();
		}

		private void AddGround(object sender, System.EventArgs e)
		{
			// add ground
			colliser c = new colliser();
			int sel = listBox1.SelectedIndex;

			if (sel<=0)
			{
				return;
			}
			else
			{
				if (!((Frame)frame[sel-1]).Mesh)
					return;
				c.name = ((Frame)frame[sel-1]).Name + "_ground";
				c.type = 2;
				if (checkBox1.Checked)
					c.parent = "null";
				else
					c.parent = ((Frame)frame[sel-1]).Parent.Name;
				c.data = ((Frame)frame[sel-1]);
				collide.Add(c);
				updateData();
				updateView();
			}
		}

		private void AddWall(object sender, System.EventArgs e)
		{
			colliser c = new colliser();
			int sel = listBox1.SelectedIndex;

			if (sel<=0)
			{
				return;
			}
			else
			{
				if (!((Frame)frame[sel-1]).Mesh)
					return;
				c.name = ((Frame)frame[sel-1]).Name + "_wall";
				c.type = 1;
				if (checkBox1.Checked)
					c.parent = "null";
				else
					c.parent = ((Frame)frame[sel-1]).Parent.Name;
				c.data = ((Frame)frame[sel-1]);
				collide.Add(c);
				updateData();
				updateView();
			}
		}

		private void AddCylinder(object sender, System.EventArgs e)
		{
			colliser c = new colliser();
			int sel = listBox1.SelectedIndex;

			if (sel<0)
			{
				return;
			}
			else if (sel==0)
			{
				c.name = "Model_cylinder";
				c.type = 3;
				c.parent = "null";
				c.height = 0;
				c.radius = 0;
				collide.Add(c);
				updateData();
				updateView();
			}
			else
			{
				c.name = ((Frame)frame[sel-1]).Name + "_cylinder";
				c.type = 3;
				if (checkBox1.Checked)
					c.parent = "null";
				else
					c.parent = ((Frame)frame[sel-1]).Name;
				c.height = 0;
				c.radius = 0;
				collide.Add(c);
				updateData();
				updateView();
			}
		}

		private void AddSphere(object sender, System.EventArgs e)
		{
			colliser c = new colliser();
			int sel = listBox1.SelectedIndex;

			if (sel<0)
			{
				return;
			}
			else if (sel==0)
			{
				c.name = "Model_sphere";
				c.type = 4;
				c.parent = "null";
				c.radius = 0;
				collide.Add(c);
				updateData();
				updateView();
			}
			else
			{
				c.name = ((Frame)frame[sel-1]).Name + "_sphere";
				c.type = 4;
				if (checkBox1.Checked)
					c.parent = "null";
				else
					c.parent = ((Frame)frame[sel-1]).Name;
				c.radius = 0;
				collide.Add(c);
				updateData();
				updateView();
			}
		}

		private void NameEnter(object sender, System.Windows.Forms.KeyEventArgs e)
		{
			if (e.KeyCode != Keys.Enter)
				return;
			
			int sel = listBox2.SelectedIndex;

			if ((sel<0)||(sel>collide.Count))
				return;

			((colliser)collide[sel]).name = textBox1.Text;
			updateView();
		}

		private void RadiusEnter(object sender, System.Windows.Forms.KeyEventArgs e)
		{
			if (e.KeyCode != Keys.Enter)
				return;
			
			int sel = listBox2.SelectedIndex;

			if ((sel<0)||(sel>collide.Count))
				return;

			float r;
			try
			{
				r = float.Parse(textBox4.Text);
			}
			catch
			{
				return;
			}
			if (((colliser)collide[sel]).type<3)
			{
				textBox4.Text = "";
				return;
			}
			((colliser)collide[sel]).radius = r;
		}

		private void HeightEnter(object sender, System.Windows.Forms.KeyEventArgs e)
		{
			if (e.KeyCode != Keys.Enter)
				return;
			
			int sel = listBox2.SelectedIndex;

			if ((sel<0)||(sel>collide.Count))
				return;

			float h;
			try
			{
				h = float.Parse(textBox5.Text);
			}
			catch
			{
				return;
			}
			if (((colliser)collide[sel]).type!=3)
			{
				textBox5.Text = "";
				return;
			}
			((colliser)collide[sel]).height = h;
		}
	}
}
