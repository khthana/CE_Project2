using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Restaurant
{
	/// <summary>
	/// Summary description for addTableForm.
	/// </summary>
	public class addTableForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label4;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private string mode;
		private int tableID;
		private System.Windows.Forms.Label lTableID;
		private System.Windows.Forms.Label lNote;
		private System.Windows.Forms.Label lCovers;
		private System.Windows.Forms.TextBox tTableID;
		private System.Windows.Forms.TextBox tNote;
		private System.Windows.Forms.TextBox tCovers;
		private System.Windows.Forms.Button bAdd;
		private System.Windows.Forms.Button bCancel;
		private System.Windows.Forms.PictureBox pictureBox1;
		public bool sucess;
		public addTableForm()
		{
			//
			// Required for Windows Form Designer support
			//
			sucess = false;
			mode = "";
			tableID = 0;
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}
		

		public addTableForm(string mode,int tableID)
		{
			this.mode = mode;
			this.tableID = tableID;
			sucess = false;
			InitializeComponent();
			
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(addTableForm));
			this.lTableID = new System.Windows.Forms.Label();
			this.lNote = new System.Windows.Forms.Label();
			this.lCovers = new System.Windows.Forms.Label();
			this.tTableID = new System.Windows.Forms.TextBox();
			this.tNote = new System.Windows.Forms.TextBox();
			this.tCovers = new System.Windows.Forms.TextBox();
			this.bAdd = new System.Windows.Forms.Button();
			this.bCancel = new System.Windows.Forms.Button();
			this.label4 = new System.Windows.Forms.Label();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.SuspendLayout();
			// 
			// lTableID
			// 
			this.lTableID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lTableID.Location = new System.Drawing.Point(248, 88);
			this.lTableID.Name = "lTableID";
			this.lTableID.Size = new System.Drawing.Size(112, 24);
			this.lTableID.TabIndex = 0;
			this.lTableID.Text = "หมายเลขโต๊ะ :";
			// 
			// lNote
			// 
			this.lNote.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lNote.Location = new System.Drawing.Point(248, 144);
			this.lNote.Name = "lNote";
			this.lNote.Size = new System.Drawing.Size(112, 24);
			this.lNote.TabIndex = 1;
			this.lNote.Text = "คำอฺธิบาย :";
			// 
			// lCovers
			// 
			this.lCovers.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lCovers.Location = new System.Drawing.Point(248, 200);
			this.lCovers.Name = "lCovers";
			this.lCovers.Size = new System.Drawing.Size(112, 24);
			this.lCovers.TabIndex = 2;
			this.lCovers.Text = "จำนวนที่นั่ง :";
			// 
			// tTableID
			// 
			this.tTableID.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.tTableID.Location = new System.Drawing.Point(384, 88);
			this.tTableID.Name = "tTableID";
			this.tTableID.TabIndex = 3;
			this.tTableID.Text = "";
			// 
			// tNote
			// 
			this.tNote.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.tNote.Location = new System.Drawing.Point(384, 144);
			this.tNote.Name = "tNote";
			this.tNote.TabIndex = 4;
			this.tNote.Text = "";
			// 
			// tCovers
			// 
			this.tCovers.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.tCovers.Location = new System.Drawing.Point(384, 200);
			this.tCovers.Name = "tCovers";
			this.tCovers.TabIndex = 5;
			this.tCovers.Text = "";
			// 
			// bAdd
			// 
			this.bAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bAdd.Location = new System.Drawing.Point(248, 264);
			this.bAdd.Name = "bAdd";
			this.bAdd.Size = new System.Drawing.Size(104, 24);
			this.bAdd.TabIndex = 6;
			this.bAdd.Text = "เพิ่มหรือแก้ไข";
			this.bAdd.Click += new System.EventHandler(this.button1_Click);
			// 
			// bCancel
			// 
			this.bCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bCancel.Location = new System.Drawing.Point(384, 264);
			this.bCancel.Name = "bCancel";
			this.bCancel.Size = new System.Drawing.Size(64, 24);
			this.bCancel.TabIndex = 7;
			this.bCancel.Text = "ยกเลิก";
			this.bCancel.Click += new System.EventHandler(this.button2_Click);
			// 
			// label4
			// 
			this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label4.ForeColor = System.Drawing.SystemColors.ActiveCaption;
			this.label4.Location = new System.Drawing.Point(280, 24);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(168, 24);
			this.label4.TabIndex = 8;
			this.label4.Text = "รายละเอียดของโต๊ะ";
			// 
			// pictureBox1
			// 
			this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
			this.pictureBox1.Location = new System.Drawing.Point(32, 88);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(192, 152);
			this.pictureBox1.TabIndex = 9;
			this.pictureBox1.TabStop = false;
			// 
			// addTableForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(568, 318);
			this.Controls.Add(this.pictureBox1);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.bCancel);
			this.Controls.Add(this.bAdd);
			this.Controls.Add(this.tCovers);
			this.Controls.Add(this.tNote);
			this.Controls.Add(this.tTableID);
			this.Controls.Add(this.lCovers);
			this.Controls.Add(this.lNote);
			this.Controls.Add(this.lTableID);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "addTableForm";
			this.Text = "แก้ไขหรือเพิ่มโต๊ะอาหาร";
			this.Load += new System.EventHandler(this.addTableForm_Load);
			this.ResumeLayout(false);

		}
		#endregion

		private void addTableForm_Load(object sender, System.EventArgs e)
		{
			if(mode.Equals("แก้ไข"))
			{
				
				tableDA.initialize();
				table t = tableDA.find(this.tableID);
				tableDA.terminate();
                tTableID.Text = t.getTableID().ToString();
				tNote.Text = t.getNote().Trim();
				tCovers.Text = t.getCovers().ToString();
			}
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			int covers=0;
			bool check = true;
			try
			{
				tableID = Convert.ToInt32(tTableID.Text);
				covers = Convert.ToInt32(tCovers.Text);
			}
			catch(Exception ex)
			{
				check = false;
			}
			if(check)
			{
				tableDA.initialize();
				if(mode.Equals("เพิ่ม"))
				{
					if(tableDA.addTable(tableID,tNote.Text,covers))
					{
						MessageBox.Show("เพิ่มโต๊ะอาหารเข้าร้านอาหารเสร็จแล้ว","สถานะการแก้ไข");
						sucess = true;
						this.Close();
					} else MessageBox.Show("ไม่สามารถเพิ่มโต๊ะอาหารได้","สถานะการแก้ไข");
				
				}
				if(mode.Equals("แก้ไข"))
				{
					if(tableDA.editTable(tableID,tNote.Text,covers))
					{
						MessageBox.Show("แก้ไขข้อมูลโต๊ะอาหารเรียบร้อยแล้ว","สถานะการแก้ไข");
						sucess = true;
						this.Close();
					} 
					else MessageBox.Show("ไม่สามารถแก้ไขข้อมูลได้","สถานะการแก้ไข");
				}
				tableDA.terminate();
			} else MessageBox.Show("กรุณากรอกข้อมูลให้ถูกต้อง","เกิดข้อผิดพลาด");
			
		}
	}
}
