using System;
using System.Data;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Restaurant
{
	/// <summary>
	/// Summary description for viewTableForm.
	/// </summary>
	public class viewTableForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.DataGrid dTable;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Label label1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label lTotals;
		private DataTable dt;
		private System.Windows.Forms.Button bRemove;
		private System.Windows.Forms.PictureBox pictureBox1;
		private DataRow dr;
		public viewTableForm()
		{
			//
			// Required for Windows Form Designer support
			//
			dt = new DataTable();
			dt.Columns.Add(new DataColumn("หมายเลขโต๊ะ",typeof(Int32)));
			dt.Columns.Add(new DataColumn("คำอธิบาย",typeof(string)));
			dt.Columns.Add(new DataColumn("จำนวนที่นั่ง",typeof(Int32)));

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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(viewTableForm));
			this.dTable = new System.Windows.Forms.DataGrid();
			this.button1 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.button3 = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.lTotals = new System.Windows.Forms.Label();
			this.bRemove = new System.Windows.Forms.Button();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			((System.ComponentModel.ISupportInitialize)(this.dTable)).BeginInit();
			this.SuspendLayout();
			// 
			// dTable
			// 
			this.dTable.AlternatingBackColor = System.Drawing.Color.GhostWhite;
			this.dTable.BackColor = System.Drawing.Color.GhostWhite;
			this.dTable.BackgroundColor = System.Drawing.Color.Lavender;
			this.dTable.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.dTable.CaptionBackColor = System.Drawing.Color.RoyalBlue;
			this.dTable.CaptionForeColor = System.Drawing.Color.White;
			this.dTable.CaptionVisible = false;
			this.dTable.DataMember = "";
			this.dTable.FlatMode = true;
			this.dTable.Font = new System.Drawing.Font("Tahoma", 8F);
			this.dTable.ForeColor = System.Drawing.Color.MidnightBlue;
			this.dTable.GridLineColor = System.Drawing.Color.RoyalBlue;
			this.dTable.HeaderBackColor = System.Drawing.Color.MidnightBlue;
			this.dTable.HeaderFont = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
			this.dTable.HeaderForeColor = System.Drawing.Color.Lavender;
			this.dTable.LinkColor = System.Drawing.Color.Teal;
			this.dTable.Location = new System.Drawing.Point(480, 208);
			this.dTable.Name = "dTable";
			this.dTable.ParentRowsBackColor = System.Drawing.Color.Lavender;
			this.dTable.ParentRowsForeColor = System.Drawing.Color.MidnightBlue;
			this.dTable.PreferredColumnWidth = 120;
			this.dTable.PreferredRowHeight = 20;
			this.dTable.ReadOnly = true;
			this.dTable.RowHeadersVisible = false;
			this.dTable.SelectionBackColor = System.Drawing.Color.Teal;
			this.dTable.SelectionForeColor = System.Drawing.Color.PaleGreen;
			this.dTable.Size = new System.Drawing.Size(377, 195);
			this.dTable.TabIndex = 1;
			this.dTable.CurrentCellChanged += new System.EventHandler(this.dTable_CurrentCellChanged);
			// 
			// button1
			// 
			this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.button1.Location = new System.Drawing.Point(480, 480);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(88, 24);
			this.button1.TabIndex = 2;
			this.button1.Text = "เพิ่มโตีะอาหาร";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// button2
			// 
			this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.button2.Location = new System.Drawing.Point(624, 480);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(88, 24);
			this.button2.TabIndex = 3;
			this.button2.Text = "แก้ไขข้อมูล";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// button3
			// 
			this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.button3.Location = new System.Drawing.Point(800, 544);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(56, 24);
			this.button3.TabIndex = 4;
			this.button3.Text = "ยกเลิก";
			this.button3.Click += new System.EventHandler(this.button3_Click);
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.Location = new System.Drawing.Point(344, 88);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(360, 56);
			this.label1.TabIndex = 5;
			this.label1.Text = "ข้อมูลโต๊ะทั้งหมดในร้านอาหาร";
			// 
			// label2
			// 
			this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label2.Location = new System.Drawing.Point(480, 432);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(104, 23);
			this.label2.TabIndex = 6;
			this.label2.Text = "จำนวนโต๊ะทั้งหมด :";
			// 
			// lTotals
			// 
			this.lTotals.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lTotals.Location = new System.Drawing.Point(592, 432);
			this.lTotals.Name = "lTotals";
			this.lTotals.Size = new System.Drawing.Size(48, 23);
			this.lTotals.TabIndex = 7;
			// 
			// bRemove
			// 
			this.bRemove.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bRemove.Location = new System.Drawing.Point(760, 480);
			this.bRemove.Name = "bRemove";
			this.bRemove.Size = new System.Drawing.Size(96, 24);
			this.bRemove.TabIndex = 8;
			this.bRemove.Text = "ลบโต๊ะอาหารทิ้ง";
			this.bRemove.Click += new System.EventHandler(this.bRemove_Click);
			// 
			// pictureBox1
			// 
			this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
			this.pictureBox1.Location = new System.Drawing.Point(72, 208);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(336, 312);
			this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pictureBox1.TabIndex = 9;
			this.pictureBox1.TabStop = false;
			// 
			// viewTableForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(944, 542);
			this.Controls.Add(this.pictureBox1);
			this.Controls.Add(this.bRemove);
			this.Controls.Add(this.lTotals);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.button3);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.dTable);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "viewTableForm";
			this.Text = "โต๊ะอาหาร";
			this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
			this.Load += new System.EventHandler(this.viewTableForm_Load);
			((System.ComponentModel.ISupportInitialize)(this.dTable)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		private void viewTableForm_Load(object sender, System.EventArgs e)
		{
			tableDA.initialize();
			ArrayList tableGroup = new ArrayList();
			tableGroup = tableDA.getAll();
			lTotals.Text = tableGroup.Count.ToString();
			tableDA.terminate();
			for(int i=0; i<tableGroup.Count;i++)
			{
				table temp = (table)tableGroup[i];
				dr = dt.NewRow();
				
				dr[0] = temp.getTableID();
				dr[1] = temp.getNote().Trim();
				dr[2] = temp.getCovers();
				dt.Rows.Add(dr);
			}
			
			DataView dv = new DataView(dt);
			dTable.DataSource = dv;
			dTable.Select(0);
			
		}

		private void dTable_CurrentCellChanged(object sender, System.EventArgs e)
		{
			dTable.Select(dTable.CurrentRowIndex);
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			addTableForm addForm = new addTableForm("เพิ่ม",0);
			addForm.ShowDialog();
			if(addForm.sucess)
			{
				dt.Clear();
				tableDA.initialize();
				ArrayList tableGroup = new ArrayList();
				tableGroup = tableDA.getAll();
				lTotals.Text = tableGroup.Count.ToString();
				tableDA.terminate();
				for(int i=0; i<tableGroup.Count;i++)
				{
					table temp = (table)tableGroup[i];
					dr = dt.NewRow();
				
					dr[0] = temp.getTableID();
					dr[1] = temp.getNote().Trim();
					dr[2] = temp.getCovers();
					dt.Rows.Add(dr);
				}
			
				DataView dv = new DataView(dt);
				dTable.DataSource = dv;
				dTable.Select(0);
			}
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			addTableForm editForm = new addTableForm("แก้ไข",(int)dTable[dTable.CurrentRowIndex,0]);
			editForm.ShowDialog();
			if(editForm.sucess)
			{
				dt.Clear();
				tableDA.initialize();
				ArrayList tableGroup = new ArrayList();
				tableGroup = tableDA.getAll();
				lTotals.Text = tableGroup.Count.ToString();
				tableDA.terminate();
				for(int i=0; i<tableGroup.Count;i++)
				{
					table temp = (table)tableGroup[i];
					dr = dt.NewRow();
				
					dr[0] = temp.getTableID();
					dr[1] = temp.getNote().Trim();
					dr[2] = temp.getCovers();
					dt.Rows.Add(dr);
				}
			
				DataView dv = new DataView(dt);
				dTable.DataSource = dv;
				dTable.Select(0);
			}
		}

		private void button3_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void bRemove_Click(object sender, System.EventArgs e)
		{
			int iRows = dTable.CurrentRowIndex;
			int tableID = (int)dTable[iRows,0];
			YesNoForm ynForm  = new YesNoForm("คุณต้องการจะลบโต๊ะอาหารหมายเลข " + tableID + " ใช่หรือไม่?");
			ynForm.ShowDialog();
			if(ynForm.check)
			{
				tableDA.initialize();
				if(tableDA.remove(tableID))
				{
					MessageBox.Show("ข้อมูลถูกลบทิ้งเรียบร้อยแล้ว","สถานะการลบข้อมูล");
					dt.Rows.RemoveAt(iRows);
					DataView dv = new DataView(dt);
					dTable.DataSource = dv;
					lTotals.Text = dTable.VisibleRowCount.ToString();
				}
				else MessageBox.Show("ไม่สามารถลบข้อมูลได้","สถานะการลบข้อมูล");
				tableDA.terminate();
			}
		}
	}
}
