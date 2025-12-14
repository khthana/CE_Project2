using System;
using System.Data;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;

namespace Restaurant
{
	/// <summary>
	/// Summary description for viewMenu.
	/// </summary>
	public class viewMenuForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.PictureBox pMenu;
		private System.Windows.Forms.Label lCaption;
		private System.Windows.Forms.Label lName;
		private System.Windows.Forms.Label lType;
		private System.Windows.Forms.Label lCost;
		private System.Windows.Forms.Label lMenuName;
		private System.Windows.Forms.Label lMenuType;
		private System.Windows.Forms.Label lMenuCost;
		private System.Windows.Forms.Label lBath;
		private System.Windows.Forms.DataGrid dMenu;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label lTotals;
		private System.Windows.Forms.Label label3;
		private DataTable dt;
		private DataRow dr;
		private ArrayList imgList;
		private System.Windows.Forms.Button bAdd;
		private System.Windows.Forms.Button bRemove;
		private System.Windows.Forms.Button bEdt;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		/// 
		private System.ComponentModel.Container components = null;
		private ArrayList listID;
		public viewMenuForm()
		{
			//
			// Required for Windows Form Designer support
			//
			
			dt = new DataTable();
			imgList = new ArrayList();
			listID = new ArrayList();
			dt.Columns.Add(new DataColumn("ลำดับ",typeof(Int32)));
			dt.Columns.Add(new DataColumn("ชื่ออาหาร",typeof(string)));
			dt.Columns.Add(new DataColumn("ประเภทอาหาร",typeof(string)));
			dt.Columns.Add(new DataColumn("ราคา",typeof(Int32)));
		

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
			this.lCaption = new System.Windows.Forms.Label();
			this.lName = new System.Windows.Forms.Label();
			this.lType = new System.Windows.Forms.Label();
			this.lCost = new System.Windows.Forms.Label();
			this.lMenuName = new System.Windows.Forms.Label();
			this.lMenuType = new System.Windows.Forms.Label();
			this.lMenuCost = new System.Windows.Forms.Label();
			this.lBath = new System.Windows.Forms.Label();
			this.dMenu = new System.Windows.Forms.DataGrid();
			this.bAdd = new System.Windows.Forms.Button();
			this.bRemove = new System.Windows.Forms.Button();
			this.bEdt = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.lTotals = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			((System.ComponentModel.ISupportInitialize)(this.dMenu)).BeginInit();
			this.SuspendLayout();
			// 
			// pMenu
			// 
			this.pMenu.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.pMenu.Location = new System.Drawing.Point(80, 80);
			this.pMenu.Name = "pMenu";
			this.pMenu.Size = new System.Drawing.Size(150, 150);
			this.pMenu.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pMenu.TabIndex = 0;
			this.pMenu.TabStop = false;
			// 
			// lCaption
			// 
			this.lCaption.Location = new System.Drawing.Point(232, 24);
			this.lCaption.Name = "lCaption";
			this.lCaption.Size = new System.Drawing.Size(192, 32);
			this.lCaption.TabIndex = 1;
			this.lCaption.Text = "เมนูอาหารภายในร้าน";
			// 
			// lName
			// 
			this.lName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lName.Location = new System.Drawing.Point(304, 96);
			this.lName.Name = "lName";
			this.lName.Size = new System.Drawing.Size(80, 24);
			this.lName.TabIndex = 2;
			this.lName.Text = "ชื่ออาหาร :";
			// 
			// lType
			// 
			this.lType.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lType.Location = new System.Drawing.Point(304, 144);
			this.lType.Name = "lType";
			this.lType.Size = new System.Drawing.Size(112, 24);
			this.lType.TabIndex = 3;
			this.lType.Text = "ประเภทอาหาร :";
			// 
			// lCost
			// 
			this.lCost.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lCost.Location = new System.Drawing.Point(304, 192);
			this.lCost.Name = "lCost";
			this.lCost.Size = new System.Drawing.Size(80, 24);
			this.lCost.TabIndex = 4;
			this.lCost.Text = "ราคา :";
			// 
			// lMenuName
			// 
			this.lMenuName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lMenuName.Location = new System.Drawing.Point(424, 96);
			this.lMenuName.Name = "lMenuName";
			this.lMenuName.Size = new System.Drawing.Size(176, 24);
			this.lMenuName.TabIndex = 5;
			// 
			// lMenuType
			// 
			this.lMenuType.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lMenuType.Location = new System.Drawing.Point(424, 144);
			this.lMenuType.Name = "lMenuType";
			this.lMenuType.Size = new System.Drawing.Size(176, 24);
			this.lMenuType.TabIndex = 6;
			// 
			// lMenuCost
			// 
			this.lMenuCost.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lMenuCost.Location = new System.Drawing.Point(424, 192);
			this.lMenuCost.Name = "lMenuCost";
			this.lMenuCost.Size = new System.Drawing.Size(72, 24);
			this.lMenuCost.TabIndex = 7;
			// 
			// lBath
			// 
			this.lBath.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lBath.Location = new System.Drawing.Point(512, 192);
			this.lBath.Name = "lBath";
			this.lBath.Size = new System.Drawing.Size(48, 24);
			this.lBath.TabIndex = 8;
			this.lBath.Text = "บาท";
			// 
			// dMenu
			// 
			this.dMenu.AlternatingBackColor = System.Drawing.Color.GhostWhite;
			this.dMenu.BackColor = System.Drawing.Color.GhostWhite;
			this.dMenu.BackgroundColor = System.Drawing.Color.Lavender;
			this.dMenu.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.dMenu.CaptionBackColor = System.Drawing.Color.RoyalBlue;
			this.dMenu.CaptionForeColor = System.Drawing.Color.White;
			this.dMenu.CausesValidation = false;
			this.dMenu.DataMember = "";
			this.dMenu.FlatMode = true;
			this.dMenu.Font = new System.Drawing.Font("Tahoma", 8F);
			this.dMenu.ForeColor = System.Drawing.Color.MidnightBlue;
			this.dMenu.GridLineColor = System.Drawing.Color.RoyalBlue;
			this.dMenu.HeaderBackColor = System.Drawing.Color.MidnightBlue;
			this.dMenu.HeaderFont = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
			this.dMenu.HeaderForeColor = System.Drawing.Color.Lavender;
			this.dMenu.LinkColor = System.Drawing.Color.Teal;
			this.dMenu.Location = new System.Drawing.Point(56, 256);
			this.dMenu.Name = "dMenu";
			this.dMenu.ParentRowsBackColor = System.Drawing.Color.Lavender;
			this.dMenu.ParentRowsForeColor = System.Drawing.Color.MidnightBlue;
			this.dMenu.PreferredColumnWidth = 140;
			this.dMenu.PreferredRowHeight = 20;
			this.dMenu.ReadOnly = true;
			this.dMenu.RowHeadersVisible = false;
			this.dMenu.SelectionBackColor = System.Drawing.Color.Teal;
			this.dMenu.SelectionForeColor = System.Drawing.Color.PaleGreen;
			this.dMenu.Size = new System.Drawing.Size(580, 285);
			this.dMenu.TabIndex = 9;
			this.dMenu.CurrentCellChanged += new System.EventHandler(this.dMenu_CurrentCellChanged);
			// 
			// bAdd
			// 
			this.bAdd.Font = new System.Drawing.Font("Angsana New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bAdd.Location = new System.Drawing.Point(56, 632);
			this.bAdd.Name = "bAdd";
			this.bAdd.Size = new System.Drawing.Size(144, 40);
			this.bAdd.TabIndex = 10;
			this.bAdd.Text = "เพิ่มรายการอาหาร";
			this.bAdd.Click += new System.EventHandler(this.button1_Click);
			// 
			// bRemove
			// 
			this.bRemove.Font = new System.Drawing.Font("Angsana New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bRemove.Location = new System.Drawing.Point(464, 632);
			this.bRemove.Name = "bRemove";
			this.bRemove.Size = new System.Drawing.Size(144, 40);
			this.bRemove.TabIndex = 11;
			this.bRemove.Text = "ลบรายการอาหาร";
			this.bRemove.Click += new System.EventHandler(this.button2_Click);
			// 
			// bEdt
			// 
			this.bEdt.Font = new System.Drawing.Font("Angsana New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bEdt.Location = new System.Drawing.Point(256, 632);
			this.bEdt.Name = "bEdt";
			this.bEdt.Size = new System.Drawing.Size(144, 40);
			this.bEdt.TabIndex = 12;
			this.bEdt.Text = "แก้ไขรายการอาหาร";
			this.bEdt.Click += new System.EventHandler(this.button3_Click);
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.Location = new System.Drawing.Point(56, 560);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(192, 23);
			this.label1.TabIndex = 13;
			this.label1.Text = "จำนวนรายการอาหารทั้งหมด :";
			// 
			// lTotals
			// 
			this.lTotals.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lTotals.Location = new System.Drawing.Point(264, 560);
			this.lTotals.Name = "lTotals";
			this.lTotals.Size = new System.Drawing.Size(88, 23);
			this.lTotals.TabIndex = 14;
			// 
			// label3
			// 
			this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label3.Location = new System.Drawing.Point(368, 560);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(88, 23);
			this.label3.TabIndex = 15;
			this.label3.Text = "รายการ";
			// 
			// viewMenuForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(10, 24);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(952, 686);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.lTotals);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.bEdt);
			this.Controls.Add(this.bRemove);
			this.Controls.Add(this.bAdd);
			this.Controls.Add(this.dMenu);
			this.Controls.Add(this.lBath);
			this.Controls.Add(this.lMenuCost);
			this.Controls.Add(this.lMenuType);
			this.Controls.Add(this.lMenuName);
			this.Controls.Add(this.lCost);
			this.Controls.Add(this.lType);
			this.Controls.Add(this.lName);
			this.Controls.Add(this.lCaption);
			this.Controls.Add(this.pMenu);
			this.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "viewMenuForm";
			this.Text = "เมนูอาหาร";
			this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
			this.Load += new System.EventHandler(this.viewMenu_Load);
			((System.ComponentModel.ISupportInitialize)(this.dMenu)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		private void viewMenu_Load(object sender, System.EventArgs e)
		{
			dMenu.CaptionVisible = false;
			
			ArrayList menuGroup = new ArrayList();
			menuDA.initialize();
			menuGroup = menuDA.getAll();
			menuDA.terminate();
			lTotals.Text = menuGroup.Count.ToString();
			
			for(int i=0; i<menuGroup.Count;i++)
			{
				menu temp = (menu)menuGroup[i];
				dr = dt.NewRow();
				
				dr[0] = i+1;
				listID.Add(temp.getMenuID());
				dr[1] = temp.getMenuName().Trim();
				dr[2] = temp.getMenuType().Trim();
				dr[3] = temp.getCost();
				imgList.Add(temp.getPicture());
				dt.Rows.Add(dr);
			}
			
			DataView dv = new DataView(dt);
			dMenu.DataSource = dv;
			dMenu.Select(0);
			try
			{
				byte[] img = (byte[])imgList[0];

				MemoryStream ms = new MemoryStream(img);	
				Bitmap b = new  Bitmap(ms);
				pMenu.Image = b;
				lMenuName.Text = (string)dMenu[0,1];
				lMenuType.Text = (string)dMenu[0,2];
				lMenuCost.Text = (string)dMenu[0,3].ToString();
			}
			catch(ArgumentException ex)
			{
				throw ex;
			}
			
		}

		private void dMenu_CurrentCellChanged(object sender, System.EventArgs e)
		{
			dMenu.Select(dMenu.CurrentRowIndex);
			byte[] img = (byte[])imgList[dMenu.CurrentRowIndex];

			MemoryStream ms = new MemoryStream(img);	
			Bitmap b = new  Bitmap(ms);
			pMenu.Image = b;
			lMenuName.Text = (string)dMenu[dMenu.CurrentRowIndex,1];
			lMenuType.Text = (string)dMenu[dMenu.CurrentRowIndex,2];
			lMenuCost.Text = (string)dMenu[dMenu.CurrentRowIndex,3].ToString();
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			addMenuForm addForm = new addMenuForm(1,0);
			addForm.ShowDialog();
			
			if(addForm.sucess)
			{
				dt.Clear();
				imgList.Clear();
				listID.Clear();
				ArrayList menuGroup = new ArrayList();
				menuDA.initialize();
				menuGroup = menuDA.getAll();
				menuDA.terminate();
				lTotals.Text = menuGroup.Count.ToString();
				for(int i=0; i<menuGroup.Count;i++)
				{
					menu temp = (menu)menuGroup[i];
					dr = dt.NewRow();
				
					dr[0] = i+1;
					listID.Add(temp.getMenuID());
					dr[1] = temp.getMenuName().Trim();
					dr[2] = temp.getMenuType().Trim();
					dr[3] = temp.getCost();
					imgList.Add(temp.getPicture());
					dt.Rows.Add(dr);
				}
			
				DataView dv = new DataView(dt);
				dMenu.DataSource = dv;
				dMenu.Select(0);
				
				byte[] img = (byte[])imgList[0];

				MemoryStream ms = new MemoryStream(img);	
				Bitmap b = new  Bitmap(ms);
				pMenu.Image = b;

				lMenuName.Text = (string)dMenu[0,1];
				lMenuType.Text = (string)dMenu[0,2];
				lMenuCost.Text = (string)dMenu[0,3].ToString();
				
				
			}

		}

		private void button3_Click(object sender, System.EventArgs e)
		{
			int iRows = dMenu.CurrentRowIndex;
			int menuID = (int)listID[iRows];
			addMenuForm addForm = new addMenuForm(2,menuID);
			addForm.ShowDialog();
			if(addForm.sucess)
			{
				dt.Clear();
				imgList.Clear();
				listID.Clear();
				ArrayList menuGroup = new ArrayList();
				menuDA.initialize();
				menuGroup = menuDA.getAll();
				menuDA.terminate();
				lTotals.Text = menuGroup.Count.ToString();
				for(int i=0; i<menuGroup.Count;i++)
				{
					menu temp = (menu)menuGroup[i];
					dr = dt.NewRow();
				
					dr[0] = i+1;
					listID.Add(temp.getMenuID());
					dr[1] = temp.getMenuName().Trim();
					dr[2] = temp.getMenuType().Trim();
					dr[3] = temp.getCost();
					imgList.Add(temp.getPicture());
					dt.Rows.Add(dr);
				}
			
				DataView dv = new DataView(dt);
				dMenu.DataSource = dv;
				dMenu.Select(0);
				
				byte[] img = (byte[])imgList[0];

				MemoryStream ms = new MemoryStream(img);	
				Bitmap b = new  Bitmap(ms);
				pMenu.Image = b;

				lMenuName.Text = (string)dMenu[0,1];
				lMenuType.Text = (string)dMenu[0,2];
				lMenuCost.Text = (string)dMenu[0,3].ToString();
				
			}
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			int iRows = dMenu.CurrentRowIndex;
			int menuID = (int)listID[iRows];
			string menuName = (string)dMenu[iRows,1];
			YesNoForm ynForm  = new YesNoForm("คุณต้องการจะลบเมนูชื่อ " + menuName + " ใช่หรือไม่?");
			ynForm.ShowDialog();
			
			if(ynForm.check)
			{
				menuDA.initialize();
				if(menuDA.remove(menuID))
				{
				
					MessageBox.Show("ลบเมนูอาหารเรียบร้อยแล้ว","สถานะการลบข้อมูล");
					
					
					dt.Rows.RemoveAt(iRows);
					DataView dv = new DataView(dt);
					dMenu.DataSource = dv;
					lTotals.Text = dMenu.VisibleRowCount.ToString();
				}
				else	MessageBox.Show("ไม่สามารถลบข้อมูลได้","แจ้งข้อผิดพลาด");
				menuDA.terminate();
			}
			
			
		}
	}
}
