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
	/// Summary description for viewPromotionForm.
	/// </summary>
	public class viewPromotionForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private DataTable dt;
		private System.Windows.Forms.Button bAdd;
		private System.Windows.Forms.Button bEdit;
		private System.Windows.Forms.Button bCancel;
		private System.Windows.Forms.DataGrid dPromotion;
		private DataRow dr;
		private System.Windows.Forms.Label lTotals;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.CheckBox checkBox1;
		private ArrayList listID;
		public viewPromotionForm()
		{
			//
			// Required for Windows Form Designer support
			//
			listID = new ArrayList();
			dt = new DataTable();
			dt.Columns.Add(new DataColumn("ลำดับ",typeof(Int32)));
			dt.Columns.Add(new DataColumn("โปรโมชั่น",typeof(string)));
			dt.Columns.Add(new DataColumn("คำอธิบาย",typeof(string)));
			dt.Columns.Add(new DataColumn("ช่วงเวลา",typeof(string)));
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
			this.dPromotion = new System.Windows.Forms.DataGrid();
			this.label1 = new System.Windows.Forms.Label();
			this.bAdd = new System.Windows.Forms.Button();
			this.bEdit = new System.Windows.Forms.Button();
			this.bCancel = new System.Windows.Forms.Button();
			this.lTotals = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.checkBox1 = new System.Windows.Forms.CheckBox();
			((System.ComponentModel.ISupportInitialize)(this.dPromotion)).BeginInit();
			this.SuspendLayout();
			// 
			// dPromotion
			// 
			this.dPromotion.AlternatingBackColor = System.Drawing.Color.GhostWhite;
			this.dPromotion.BackColor = System.Drawing.Color.GhostWhite;
			this.dPromotion.BackgroundColor = System.Drawing.Color.Lavender;
			this.dPromotion.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.dPromotion.CaptionBackColor = System.Drawing.Color.RoyalBlue;
			this.dPromotion.CaptionForeColor = System.Drawing.Color.White;
			this.dPromotion.CaptionVisible = false;
			this.dPromotion.DataMember = "";
			this.dPromotion.FlatMode = true;
			this.dPromotion.Font = new System.Drawing.Font("Tahoma", 8F);
			this.dPromotion.ForeColor = System.Drawing.Color.MidnightBlue;
			this.dPromotion.GridLineColor = System.Drawing.Color.RoyalBlue;
			this.dPromotion.HeaderBackColor = System.Drawing.Color.MidnightBlue;
			this.dPromotion.HeaderFont = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
			this.dPromotion.HeaderForeColor = System.Drawing.Color.Lavender;
			this.dPromotion.LinkColor = System.Drawing.Color.Teal;
			this.dPromotion.Location = new System.Drawing.Point(104, 88);
			this.dPromotion.Name = "dPromotion";
			this.dPromotion.ParentRowsBackColor = System.Drawing.Color.Lavender;
			this.dPromotion.ParentRowsForeColor = System.Drawing.Color.MidnightBlue;
			this.dPromotion.PreferredColumnWidth = 150;
			this.dPromotion.PreferredRowHeight = 40;
			this.dPromotion.ReadOnly = true;
			this.dPromotion.RowHeadersVisible = false;
			this.dPromotion.SelectionBackColor = System.Drawing.Color.Teal;
			this.dPromotion.SelectionForeColor = System.Drawing.Color.PaleGreen;
			this.dPromotion.Size = new System.Drawing.Size(610, 275);
			this.dPromotion.TabIndex = 2;
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.Location = new System.Drawing.Point(224, 32);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(264, 32);
			this.label1.TabIndex = 6;
			this.label1.Text = "โปรโมชั่นทั้งหมดในร้านอาหาร";
			// 
			// bAdd
			// 
			this.bAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bAdd.Location = new System.Drawing.Point(104, 432);
			this.bAdd.Name = "bAdd";
			this.bAdd.Size = new System.Drawing.Size(88, 32);
			this.bAdd.TabIndex = 7;
			this.bAdd.Text = "เพิ่มโปรโมชั่น";
			this.bAdd.Click += new System.EventHandler(this.bAdd_Click);
			// 
			// bEdit
			// 
			this.bEdit.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bEdit.Location = new System.Drawing.Point(224, 432);
			this.bEdit.Name = "bEdit";
			this.bEdit.Size = new System.Drawing.Size(104, 32);
			this.bEdit.TabIndex = 8;
			this.bEdit.Text = "แก้ไขโปรโมชั่น";
			this.bEdit.Click += new System.EventHandler(this.bEdit_Click);
			// 
			// bCancel
			// 
			this.bCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bCancel.Location = new System.Drawing.Point(432, 432);
			this.bCancel.Name = "bCancel";
			this.bCancel.Size = new System.Drawing.Size(88, 32);
			this.bCancel.TabIndex = 10;
			this.bCancel.Text = "ยกเลิก";
			this.bCancel.Click += new System.EventHandler(this.bCancel_Click);
			// 
			// lTotals
			// 
			this.lTotals.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lTotals.Location = new System.Drawing.Point(256, 384);
			this.lTotals.Name = "lTotals";
			this.lTotals.Size = new System.Drawing.Size(48, 23);
			this.lTotals.TabIndex = 12;
			// 
			// label2
			// 
			this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label2.Location = new System.Drawing.Point(104, 384);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(144, 23);
			this.label2.TabIndex = 11;
			this.label2.Text = "จำนวนโปรโมชั่นทั้งหมด :";
			// 
			// checkBox1
			// 
			this.checkBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.checkBox1.Location = new System.Drawing.Point(592, 376);
			this.checkBox1.Name = "checkBox1";
			this.checkBox1.Size = new System.Drawing.Size(120, 24);
			this.checkBox1.TabIndex = 13;
			this.checkBox1.Text = "โปรโมชั่นทั้งหมด";
			this.checkBox1.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
			// 
			// viewPromotionForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(800, 638);
			this.Controls.Add(this.checkBox1);
			this.Controls.Add(this.lTotals);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.bCancel);
			this.Controls.Add(this.bEdit);
			this.Controls.Add(this.bAdd);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.dPromotion);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "viewPromotionForm";
			this.Text = "รายการโปรโมชั่น";
			this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
			this.Load += new System.EventHandler(this.viewPromotionForm_Load);
			((System.ComponentModel.ISupportInitialize)(this.dPromotion)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		private void viewPromotionForm_Load(object sender, System.EventArgs e)
		{
			promotionDA.initialize();
			ArrayList promotionGroup = new ArrayList();
			if(checkBox1.Checked)
				promotionGroup = promotionDA.getAll();
			else promotionGroup = promotionDA.currentPromotion();
			lTotals.Text = promotionGroup.Count.ToString();
			promotionDA.terminate();
			for(int i=0; i<promotionGroup.Count;i++)
			{
				promotion temp = (promotion)promotionGroup[i];
				dr = dt.NewRow();
				
				dr[0] = i+1;
				listID.Add(temp.getPromotionID());
				dr[1] = temp.getPromotionName().Trim();
				dr[2] = temp.getDiscription().Trim();
				dr[3] = temp.getBeginTime().Trim() + "\n" + temp.getEndTime().Trim();
				dt.Rows.Add(dr);
			}
			
			DataView dv = new DataView(dt);
			dPromotion.DataSource = dv;
			dPromotion.Select(0);
			
		}

		private void bAdd_Click(object sender, System.EventArgs e)
		{
			addPromotionForm addForm = new addPromotionForm("เพิ่ม",0);
			addForm.ShowDialog();
			if(addForm.sucess)
			{
				dt.Clear();
				listID.Clear();
				promotionDA.initialize();
				ArrayList promotionGroup = new ArrayList();
				promotionGroup = promotionDA.getAll();
				lTotals.Text = promotionGroup.Count.ToString();
				promotionDA.terminate();
				for(int i=0; i<promotionGroup.Count;i++)
				{
					promotion temp = (promotion)promotionGroup[i];
					dr = dt.NewRow();
				
					dr[0] = i+1;
					listID.Add(temp.getPromotionID());
					dr[1] = temp.getPromotionName().Trim();
					dr[2] = temp.getDiscription().Trim();
					dr[3] = temp.getBeginTime().Trim() + "\n" + temp.getEndTime().Trim();
					dt.Rows.Add(dr);
				}
			
				DataView dv = new DataView(dt);
				dPromotion.DataSource = dv;
				dPromotion.Select(0);
			}
		}

		private void bEdit_Click(object sender, System.EventArgs e)
		{
			int iRows = dPromotion.CurrentRowIndex;
			int id = (int)listID[iRows];
			addPromotionForm editForm = new addPromotionForm("แก้ไข",id);
			editForm.ShowDialog();
			if(editForm.sucess)
			{
				dt.Clear();
				listID.Clear();
				promotionDA.initialize();
				ArrayList promotionGroup = new ArrayList();
				promotionGroup = promotionDA.getAll();
				lTotals.Text = promotionGroup.Count.ToString();
				promotionDA.terminate();
				for(int i=0; i<promotionGroup.Count;i++)
				{
					promotion temp = (promotion)promotionGroup[i];
					dr = dt.NewRow();
				
					dr[0] = i+1;
					listID.Add(temp.getPromotionID());
					dr[1] = temp.getPromotionName().Trim();
					dr[2] = temp.getDiscription().Trim();
					dr[3] = temp.getBeginTime().Trim() + "\n" + temp.getEndTime().Trim();
					dt.Rows.Add(dr);
				}
			
				DataView dv = new DataView(dt);
				dPromotion.DataSource = dv;
				dPromotion.Select(0);
			}
		}

		private void bCancel_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void checkBox1_CheckedChanged(object sender, System.EventArgs e)
		{
			promotionDA.initialize();
			ArrayList promotionGroup = new ArrayList();
			if(checkBox1.Checked)
				promotionGroup = promotionDA.getAll();
			else promotionGroup = promotionDA.currentPromotion();
			lTotals.Text = promotionGroup.Count.ToString();
			promotionDA.terminate();
			dt.Clear();
			listID.Clear();
			for(int i=0; i<promotionGroup.Count;i++)
			{
				promotion temp = (promotion)promotionGroup[i];
				dr = dt.NewRow();
				
				dr[0] = i+1;
				listID.Add(temp.getPromotionID());
				dr[1] = temp.getPromotionName().Trim();
				dr[2] = temp.getDiscription().Trim();
				dr[3] = temp.getBeginTime().Trim() + "\n" + temp.getEndTime().Trim();
				dt.Rows.Add(dr);
			}
			
			DataView dv = new DataView(dt);
			dPromotion.DataSource = dv;
			dPromotion.Select(0);
		}
	}
}
