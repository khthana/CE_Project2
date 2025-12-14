using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.IO;

namespace Restaurant
{
	/// <summary>
	/// Summary description for addMenuForm.
	/// </summary>
	public class addMenuForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.PictureBox pMenu;
		private System.Windows.Forms.Button bSelect;
		private System.Windows.Forms.TextBox tPath;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label lMenuName;
		private System.Windows.Forms.TextBox tMenuName;
		private System.Windows.Forms.Label lMenuType;
		private System.Windows.Forms.Label lMenuOther;
		private System.Windows.Forms.Label lMenuCost;
		private System.Windows.Forms.TextBox tMenuType;
		private System.Windows.Forms.TextBox tMenuOther;
		private System.Windows.Forms.TextBox tMenuCost;
		private System.Windows.Forms.Button bAddd;
		private System.Windows.Forms.Button bCencel;
		private System.Windows.Forms.OpenFileDialog openFileDialog1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private int mode;		// 1 is add
								// 2 is edit
		public bool sucess;
		private int menuID;
		public addMenuForm()
		{
			//
			// Required for Windows Form Designer support
			//
			mode = 0;
			menuID = 0;
			sucess = false;
			menuDA.initialize();
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		public addMenuForm(int mode,int menuID)
		{
			//
			// Required for Windows Form Designer support
			//
			this.mode = mode;
			this.menuID = menuID;
			sucess = false;
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
			this.pMenu = new System.Windows.Forms.PictureBox();
			this.bSelect = new System.Windows.Forms.Button();
			this.tPath = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.lMenuName = new System.Windows.Forms.Label();
			this.tMenuName = new System.Windows.Forms.TextBox();
			this.lMenuType = new System.Windows.Forms.Label();
			this.lMenuOther = new System.Windows.Forms.Label();
			this.lMenuCost = new System.Windows.Forms.Label();
			this.tMenuType = new System.Windows.Forms.TextBox();
			this.tMenuOther = new System.Windows.Forms.TextBox();
			this.tMenuCost = new System.Windows.Forms.TextBox();
			this.bAddd = new System.Windows.Forms.Button();
			this.bCencel = new System.Windows.Forms.Button();
			this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
			this.SuspendLayout();
			// 
			// pMenu
			// 
			this.pMenu.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.pMenu.Location = new System.Drawing.Point(72, 144);
			this.pMenu.Name = "pMenu";
			this.pMenu.Size = new System.Drawing.Size(200, 200);
			this.pMenu.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pMenu.TabIndex = 0;
			this.pMenu.TabStop = false;
			// 
			// bSelect
			// 
			this.bSelect.Location = new System.Drawing.Point(72, 96);
			this.bSelect.Name = "bSelect";
			this.bSelect.Size = new System.Drawing.Size(80, 23);
			this.bSelect.TabIndex = 1;
			this.bSelect.Text = "เลือกรูปภาพ";
			this.bSelect.Click += new System.EventHandler(this.bSelect_Click);
			// 
			// tPath
			// 
			this.tPath.Location = new System.Drawing.Point(176, 96);
			this.tPath.Name = "tPath";
			this.tPath.Size = new System.Drawing.Size(376, 20);
			this.tPath.TabIndex = 2;
			this.tPath.Text = "";
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.Location = new System.Drawing.Point(200, 32);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(256, 40);
			this.label1.TabIndex = 3;
			this.label1.Text = "กำหนดรูปแบบภาพที่ต้องการ";
			// 
			// lMenuName
			// 
			this.lMenuName.Font = new System.Drawing.Font("Angsana New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lMenuName.Location = new System.Drawing.Point(296, 136);
			this.lMenuName.Name = "lMenuName";
			this.lMenuName.Size = new System.Drawing.Size(80, 23);
			this.lMenuName.TabIndex = 4;
			this.lMenuName.Text = "ชื่ออาหาร";
			// 
			// tMenuName
			// 
			this.tMenuName.Font = new System.Drawing.Font("Angsana New", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.tMenuName.Location = new System.Drawing.Point(424, 136);
			this.tMenuName.Name = "tMenuName";
			this.tMenuName.Size = new System.Drawing.Size(128, 29);
			this.tMenuName.TabIndex = 5;
			this.tMenuName.Text = "";
			// 
			// lMenuType
			// 
			this.lMenuType.Font = new System.Drawing.Font("Angsana New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lMenuType.Location = new System.Drawing.Point(296, 192);
			this.lMenuType.Name = "lMenuType";
			this.lMenuType.Size = new System.Drawing.Size(112, 23);
			this.lMenuType.TabIndex = 6;
			this.lMenuType.Text = "ประเภทอาหาร";
			// 
			// lMenuOther
			// 
			this.lMenuOther.Font = new System.Drawing.Font("Angsana New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lMenuOther.Location = new System.Drawing.Point(296, 248);
			this.lMenuOther.Name = "lMenuOther";
			this.lMenuOther.Size = new System.Drawing.Size(120, 23);
			this.lMenuOther.TabIndex = 7;
			this.lMenuOther.Text = "ชนิดของสินค้า";
			// 
			// lMenuCost
			// 
			this.lMenuCost.Font = new System.Drawing.Font("Angsana New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lMenuCost.Location = new System.Drawing.Point(296, 304);
			this.lMenuCost.Name = "lMenuCost";
			this.lMenuCost.Size = new System.Drawing.Size(56, 23);
			this.lMenuCost.TabIndex = 8;
			this.lMenuCost.Text = "ราคา";
			// 
			// tMenuType
			// 
			this.tMenuType.Font = new System.Drawing.Font("Angsana New", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.tMenuType.Location = new System.Drawing.Point(424, 192);
			this.tMenuType.Name = "tMenuType";
			this.tMenuType.Size = new System.Drawing.Size(128, 29);
			this.tMenuType.TabIndex = 9;
			this.tMenuType.Text = "";
			// 
			// tMenuOther
			// 
			this.tMenuOther.Font = new System.Drawing.Font("Angsana New", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.tMenuOther.Location = new System.Drawing.Point(424, 248);
			this.tMenuOther.Name = "tMenuOther";
			this.tMenuOther.Size = new System.Drawing.Size(128, 29);
			this.tMenuOther.TabIndex = 10;
			this.tMenuOther.Text = "";
			// 
			// tMenuCost
			// 
			this.tMenuCost.Font = new System.Drawing.Font("Angsana New", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.tMenuCost.Location = new System.Drawing.Point(424, 304);
			this.tMenuCost.Name = "tMenuCost";
			this.tMenuCost.Size = new System.Drawing.Size(128, 29);
			this.tMenuCost.TabIndex = 11;
			this.tMenuCost.Text = "";
			// 
			// bAddd
			// 
			this.bAddd.Location = new System.Drawing.Point(184, 392);
			this.bAddd.Name = "bAddd";
			this.bAddd.Size = new System.Drawing.Size(80, 23);
			this.bAddd.TabIndex = 12;
			this.bAddd.Text = "เพิ่มหรือแก้ไข";
			this.bAddd.Click += new System.EventHandler(this.bAddd_Click);
			// 
			// bCencel
			// 
			this.bCencel.Location = new System.Drawing.Point(304, 392);
			this.bCencel.Name = "bCencel";
			this.bCencel.Size = new System.Drawing.Size(80, 23);
			this.bCencel.TabIndex = 13;
			this.bCencel.Text = "ยกเลิก";
			this.bCencel.Click += new System.EventHandler(this.bCencel_Click);
			// 
			// addMenuForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(632, 438);
			this.Controls.Add(this.bCencel);
			this.Controls.Add(this.bAddd);
			this.Controls.Add(this.tMenuCost);
			this.Controls.Add(this.tMenuOther);
			this.Controls.Add(this.tMenuType);
			this.Controls.Add(this.tMenuName);
			this.Controls.Add(this.tPath);
			this.Controls.Add(this.lMenuCost);
			this.Controls.Add(this.lMenuOther);
			this.Controls.Add(this.lMenuType);
			this.Controls.Add(this.lMenuName);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.bSelect);
			this.Controls.Add(this.pMenu);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "addMenuForm";
			this.Text = "แก้ไขหรือเพิ่มเมนู";
			this.Load += new System.EventHandler(this.addMenuForm_Load);
			this.ResumeLayout(false);

		}
		#endregion

		private void bSelect_Click(object sender, System.EventArgs e)
		{
			//openFileDialog1.Filter = "Bitmap (*.bmp) | *.bmp | Jpeg (*.jpg)| *.jpg | Gif (*.gif) | *.gif";
			openFileDialog1.Filter = "All Pictures (*.bmp;*.ico;*.gif;*.jpg) | *.bmp;*.ico;*.gif;*.jpg";
			openFileDialog1.ShowDialog();
			tPath.Text = openFileDialog1.FileName;
			if(!openFileDialog1.FileName.Equals(""))
			{
				Bitmap img = new Bitmap(openFileDialog1.FileName);
				pMenu.Image = new Bitmap(img);
			}

		}

		private void addMenuForm_Load(object sender, System.EventArgs e)
		{
			if(mode==2)	// mode = 2 is Edit
			{
				menuDA.initialize();
				menu aMenu = new menu();
				aMenu = menuDA.find(this.menuID);
				menuDA.terminate();

				MemoryStream ms = new MemoryStream(aMenu.getPicture());	
				Bitmap b = new  Bitmap(ms);
				pMenu.Image = b;

				tMenuName.Text = aMenu.getMenuName().Trim();
				tMenuType.Text = aMenu.getMenuType().Trim();
				tMenuOther.Text = aMenu.getOther().Trim();
				tMenuCost.Text = aMenu.getCost().ToString();

			}
		}
		
		protected static byte[] ReadBitmap2ByteArray(Image bmp)
		{
			using(Bitmap image = new Bitmap(bmp))
			{
				MemoryStream stream = new MemoryStream();
				image.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
				return stream.ToArray();
			}
		}

		private void bCencel_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void bAddd_Click(object sender, System.EventArgs e)
		{
			byte[] img = null;
			int cost=0;
			bool check = true;
			if(tMenuName.Text.Equals("")||tMenuType.Text.Equals(""))
				check = false;
			try
			{
				cost = Convert.ToInt32(tMenuCost.Text);
				img = ReadBitmap2ByteArray(pMenu.Image);
			}
			catch(Exception ex)
			{
					
				check = false;
			}

			if(check)	// ถ้า check = true คือไม่เกิดข้อมูลถูกต้องพร้อมที่ทำการเพิ่มหรือแก้ไขเมนูลงฐานข้อมูล
			{
				if(mode!=0)
				{
					menuDA.initialize();
					if(mode==1)	// addMenu
					{
						
						if(menuDA.addMenu(tMenuName.Text,tMenuType.Text,tMenuOther.Text,cost,img))
						{
							MessageBox.Show("เพิ่มเมนูอาหารเข้าสู่ฐานข้อมูลเรียบร้อยแล้ว","แสดงสถานะการเพิ่มหรือแก้ไข");
							sucess = true;
							this.Close();
						}
						else MessageBox.Show("โปรดตรวจสอบความถูกต้องของข้อมูล","แสดงสถานะการเพิ่มหรือแก้ไข");
					}
					else		// editMenu
					{
						if(menuDA.editMenu(this.menuID,tMenuName.Text,tMenuType.Text,tMenuOther.Text,cost,img))
						{
							MessageBox.Show("แก้ไขข้อมูลเมนูอาหารเรียบร้อยแล้ว","แสดงสถานะการเพิ่มหรือแก้ไข");
							sucess = true;
							this.Close();
						}
						else MessageBox.Show("โปรดตรวจสอบความถูกต้องของข้อมูล","แสดงสถานะการเพิ่มหรือแก้ไข");
					}
					menuDA.terminate();
				}
			} else MessageBox.Show("กรุณากรอกข้อมูลให้ถูกต้องครบถ้วนด้วยค่ะ","ความผิดพลาด");
		}
	}
}
