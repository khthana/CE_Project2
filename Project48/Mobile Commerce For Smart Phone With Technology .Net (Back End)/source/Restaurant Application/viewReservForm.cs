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
	/// Summary description for viewReservForm.
	/// </summary>
	public class viewReservForm : System.Windows.Forms.Form
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		
		
		private System.Windows.Forms.DataGrid dViewReserv;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label lTotal;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.CheckBox fCheckall;
		private System.Windows.Forms.Button bReserv;
		private System.Windows.Forms.Button bEdit;
		private System.Windows.Forms.Button bConfirm;
		private System.Windows.Forms.Button bRemove;

		private ArrayList listID;
		private DataTable dt;
		private DataRow dr;
		

		public viewReservForm()
		{
			//
			// Required for Windows Form Designer support
			//
			listID = new ArrayList();
			dt = new DataTable();
			dt.Columns.Add(new DataColumn("หมายเลขลำดับ",typeof(Int32)));
			dt.Columns.Add(new DataColumn("เวลาที่จอง",typeof(string)));
			dt.Columns.Add(new DataColumn("ชื่อผู้จอง",typeof(string)));
			dt.Columns.Add(new DataColumn("จำนวนที่นั่ง",typeof(Int32)));
			dt.Columns.Add(new DataColumn("หมายเลขโต๊ะ",typeof(Int32)));
			dt.Columns.Add(new DataColumn("สถานะการจอง",typeof(string)));
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
			this.dViewReserv = new System.Windows.Forms.DataGrid();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.lTotal = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.fCheckall = new System.Windows.Forms.CheckBox();
			this.bReserv = new System.Windows.Forms.Button();
			this.bEdit = new System.Windows.Forms.Button();
			this.bConfirm = new System.Windows.Forms.Button();
			this.bRemove = new System.Windows.Forms.Button();
			((System.ComponentModel.ISupportInitialize)(this.dViewReserv)).BeginInit();
			this.SuspendLayout();
			// 
			// dViewReserv
			// 
			this.dViewReserv.AlternatingBackColor = System.Drawing.Color.GhostWhite;
			this.dViewReserv.BackColor = System.Drawing.Color.GhostWhite;
			this.dViewReserv.BackgroundColor = System.Drawing.Color.Lavender;
			this.dViewReserv.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.dViewReserv.CaptionBackColor = System.Drawing.Color.RoyalBlue;
			this.dViewReserv.CaptionForeColor = System.Drawing.Color.White;
			this.dViewReserv.CausesValidation = false;
			this.dViewReserv.DataMember = "";
			this.dViewReserv.FlatMode = true;
			this.dViewReserv.Font = new System.Drawing.Font("Tahoma", 8F);
			this.dViewReserv.ForeColor = System.Drawing.Color.MidnightBlue;
			this.dViewReserv.GridLineColor = System.Drawing.Color.RoyalBlue;
			this.dViewReserv.HeaderBackColor = System.Drawing.Color.MidnightBlue;
			this.dViewReserv.HeaderFont = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
			this.dViewReserv.HeaderForeColor = System.Drawing.Color.Lavender;
			this.dViewReserv.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			this.dViewReserv.LinkColor = System.Drawing.Color.Teal;
			this.dViewReserv.Location = new System.Drawing.Point(128, 88);
			this.dViewReserv.Name = "dViewReserv";
			this.dViewReserv.ParentRowsBackColor = System.Drawing.Color.Lavender;
			this.dViewReserv.ParentRowsForeColor = System.Drawing.Color.MidnightBlue;
			this.dViewReserv.PreferredColumnWidth = 130;
			this.dViewReserv.PreferredRowHeight = 30;
			this.dViewReserv.ReadOnly = true;
			this.dViewReserv.RowHeadersVisible = false;
			this.dViewReserv.SelectionBackColor = System.Drawing.Color.Teal;
			this.dViewReserv.SelectionForeColor = System.Drawing.Color.PaleGreen;
			this.dViewReserv.Size = new System.Drawing.Size(780, 420);
			this.dViewReserv.TabIndex = 0;
			this.dViewReserv.TabStop = false;
			this.dViewReserv.CurrentCellChanged += new System.EventHandler(this.dViewReserv_CurrentCellChanged);
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.Location = new System.Drawing.Point(304, 24);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(376, 24);
			this.label1.TabIndex = 3;
			this.label1.Text = "รายการจองที่นั่งภายในร้านอาหาร";
			// 
			// label2
			// 
			this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label2.Location = new System.Drawing.Point(128, 528);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(104, 23);
			this.label2.TabIndex = 4;
			this.label2.Text = "จำนวนการจอง :";
			// 
			// lTotal
			// 
			this.lTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lTotal.Location = new System.Drawing.Point(240, 528);
			this.lTotal.Name = "lTotal";
			this.lTotal.Size = new System.Drawing.Size(48, 23);
			this.lTotal.TabIndex = 5;
			// 
			// label3
			// 
			this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label3.Location = new System.Drawing.Point(304, 528);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(56, 23);
			this.label3.TabIndex = 6;
			this.label3.Text = "รายการ";
			// 
			// fCheckall
			// 
			this.fCheckall.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.fCheckall.Location = new System.Drawing.Point(672, 528);
			this.fCheckall.Name = "fCheckall";
			this.fCheckall.Size = new System.Drawing.Size(144, 24);
			this.fCheckall.TabIndex = 7;
			this.fCheckall.Text = "   แสดงรายการทั้งหมด";
			this.fCheckall.CheckedChanged += new System.EventHandler(this.fCheckall_CheckedChanged);
			// 
			// bReserv
			// 
			this.bReserv.Location = new System.Drawing.Point(168, 592);
			this.bReserv.Name = "bReserv";
			this.bReserv.Size = new System.Drawing.Size(80, 23);
			this.bReserv.TabIndex = 8;
			this.bReserv.Text = "จองที่นั่ง";
			this.bReserv.Click += new System.EventHandler(this.bReserv_Click);
			// 
			// bEdit
			// 
			this.bEdit.Location = new System.Drawing.Point(288, 592);
			this.bEdit.Name = "bEdit";
			this.bEdit.Size = new System.Drawing.Size(112, 23);
			this.bEdit.TabIndex = 9;
			this.bEdit.Text = "แก้ไขข้อมูลกานจอง";
			this.bEdit.Click += new System.EventHandler(this.bEdit_Click);
			// 
			// bConfirm
			// 
			this.bConfirm.Location = new System.Drawing.Point(752, 592);
			this.bConfirm.Name = "bConfirm";
			this.bConfirm.Size = new System.Drawing.Size(80, 23);
			this.bConfirm.TabIndex = 10;
			this.bConfirm.Text = "ยืนยันกานจอง";
			this.bConfirm.Click += new System.EventHandler(this.bConfirm_Click);
			// 
			// bRemove
			// 
			this.bRemove.Location = new System.Drawing.Point(432, 592);
			this.bRemove.Name = "bRemove";
			this.bRemove.TabIndex = 11;
			this.bRemove.Text = "ยกเลิกการจอง";
			this.bRemove.Click += new System.EventHandler(this.bRemove_Click);
			// 
			// viewReservForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(944, 654);
			this.Controls.Add(this.bRemove);
			this.Controls.Add(this.bConfirm);
			this.Controls.Add(this.bEdit);
			this.Controls.Add(this.bReserv);
			this.Controls.Add(this.fCheckall);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.lTotal);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.dViewReserv);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "viewReservForm";
			this.Text = "ข้อมูลการจอง";
			this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
			this.Load += new System.EventHandler(this.viewReservForm_Load);
			((System.ComponentModel.ISupportInitialize)(this.dViewReserv)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		private void viewReservForm_Load(object sender, System.EventArgs e)
		{
			dViewReserv.CaptionVisible = false;
			ArrayList reservGroup = new ArrayList();
			reservationDA.initialize();
			if(fCheckall.Checked)
				reservGroup = reservationDA.getAll();
			else reservGroup = reservationDA.getCurrentAll();
			reservationDA.terminate();
		
			for(int i=0;i<reservGroup.Count;i++)
			{
				reservation temp = (reservation)reservGroup[i];
				dr = dt.NewRow();
				dr[0] = i+1;
				listID.Add(temp.getReservationID());
				dr[1] = temp.getReservTime().Trim() + "\n" + temp.getEndTime().Trim();
				dr[2] = temp.getName().Trim();
				tableDA.initialize();
				table t = tableDA.find(temp.getTableID());
				tableDA.terminate();
                dr[3] = t.getCovers();
				dr[4] = temp.getTableID();
				dr[5] = temp.getStatus().Trim();
				dt.Rows.Add(dr);
			}
			DataView dv = new DataView(dt);
			lTotal.Text = dv.Count.ToString();
			if(dv.Count>13)
					this.dViewReserv.Size = new System.Drawing.Size(800, 420);
			else	 this.dViewReserv.Size = new System.Drawing.Size(780, 420);
			dViewReserv.DataSource = dv;
			dViewReserv.Select(0);
		}

		private void fCheckall_CheckedChanged(object sender, System.EventArgs e)
		{
			
			ArrayList reservGroup = new ArrayList();
			reservationDA.initialize();
			if(fCheckall.Checked)
				reservGroup = reservationDA.getAll();
			else reservGroup = reservationDA.getCurrentAll();
			reservationDA.terminate();
			dt.Clear();
			listID.Clear();
			for(int i=0;i<reservGroup.Count;i++)
			{
				reservation temp = (reservation)reservGroup[i];
				dr = dt.NewRow();
				dr[0] = i+1;
				listID.Add(temp.getReservationID());
				dr[1] = temp.getReservTime().Trim() + "\n" + temp.getEndTime().Trim();
				dr[2] = temp.getName().Trim();
				tableDA.initialize();
				table t = tableDA.find(temp.getTableID());
				tableDA.terminate();
				dr[3] = t.getCovers();
				dr[4] = temp.getTableID();
				dr[5] = temp.getStatus().Trim();
				dt.Rows.Add(dr);
			}
			DataView dv = new DataView(dt);
			lTotal.Text = dv.Count.ToString();
			if(dv.Count>13)
				this.dViewReserv.Size = new System.Drawing.Size(800, 420);
			else	 this.dViewReserv.Size = new System.Drawing.Size(780, 420);
			dViewReserv.DataSource = dv;
			dViewReserv.Select(0);

		}

		private void dViewReserv_CurrentCellChanged(object sender, System.EventArgs e)
		{
			dViewReserv.Select(dViewReserv.CurrentRowIndex);
		}

		private void bConfirm_Click(object sender, System.EventArgs e)
		{
			int iRows = dViewReserv.CurrentRowIndex;
			int id = (int)listID[iRows];
			string time = (string)dViewReserv[iRows,1];
			string name = (string)dViewReserv[iRows,2];
			int tableID = (int)dViewReserv[iRows,3];
			int cover = (int)dViewReserv[iRows,4];
			string status = (string)dViewReserv[iRows,5];
			status = status.Trim();
			if(status.Equals("ยังไม่มา"))
			{
				reservationDA.initialize();
				if(reservationDA.confirm(id))
				{
					// remove and insert row 
					/*
					dt.Rows.RemoveAt(iRows);
					dr = dt.NewRow();
					dr[0] = id;
					dr[1] = time;
					dr[2] = name;
					dr[3] = cover;
					dr[4] = tableID;
					dr[5] = "ยืนยัน";
					dt.Rows.InsertAt(dr,1);	
					DataView dv = new DataView(dt);
					dViewReserv.DataSource = dv;
					dViewReserv.Select(iRows);
					*/
					
					MessageBox.Show("ยืนยันเรียบร้อยแล้ว","แจ้งการยืนยัน");
					// clear table for update dataGrid
                    ArrayList reservGroup = new ArrayList();
                    if(fCheckall.Checked)
						reservGroup = reservationDA.getAll();
					else reservGroup = reservationDA.getCurrentAll();
					dt.Clear();
					listID.Clear();
					for(int i=0;i<reservGroup.Count;i++)
					{
						reservation temp = (reservation)reservGroup[i];
						dr = dt.NewRow();
						dr[0] = i+1;
						listID.Add(temp.getReservationID());
						dr[1] = temp.getReservTime().Trim() + "\n" + temp.getEndTime().Trim();
						dr[2] = temp.getName().Trim();
						tableDA.initialize();
						table t = tableDA.find(temp.getTableID());
						tableDA.terminate();
						dr[3] = t.getCovers();
						dr[4] = temp.getTableID();
						dr[5] = temp.getStatus().Trim();
						dt.Rows.Add(dr);
					}
					DataView dv = new DataView(dt);
					lTotal.Text = dv.Count.ToString();
					if(dv.Count>13)
						this.dViewReserv.Size = new System.Drawing.Size(800, 420);
					else	 this.dViewReserv.Size = new System.Drawing.Size(780, 420);
					dViewReserv.DataSource = dv;
					dViewReserv.Select(iRows);
					
					
				
				}
				else MessageBox.Show("ไม่สามารถยืนยันได้","แจ้งข้อผิดพลาด"); 
				reservationDA.terminate();
			}
			else MessageBox.Show("กรุณาเลือกยืนยันที่ยังไม่มา","หมายเหตุ");

			
			
		}

		private void bRemove_Click(object sender, System.EventArgs e)
		{
			int iRows = dViewReserv.CurrentRowIndex;
			int reservationID = (int)listID[iRows];
			YesNoForm ynForm  = new YesNoForm("คุณต้องการจะลบการจองหมายเลข " + dViewReserv[iRows,0].ToString() + " ใช่หรือไม่?");
			ynForm.ShowDialog();
			if(ynForm.check)
			{
				reservationDA.initialize();
				if(reservationDA.remove(reservationID))
				{
					// delete sucess
				
					MessageBox.Show("ข้อมูลถูกลบทิ้งเรียบร้อยแล้ว","สถานะการลบข้อมูล");
					listID.RemoveAt(iRows);
					dt.Rows.RemoveAt(iRows);
					DataView dv = new DataView(dt);
					dViewReserv.DataSource = dv;
					lTotal.Text = dViewReserv.VisibleRowCount.ToString();
					if(dv.Count>13)
						this.dViewReserv.Size = new System.Drawing.Size(800, 420);
					else	 this.dViewReserv.Size = new System.Drawing.Size(780, 420);
				
				}
				else 
				{
					// delete non-sucess
					MessageBox.Show("ไม่สามารถลบข้อมูลได้","สถานะการลบข้อมูล");

				}
				reservationDA.terminate();
			
			}
		}

		private void bReserv_Click(object sender, System.EventArgs e)
		{
			reservForm makeReservForm = new reservForm(1,0);
			makeReservForm.ShowDialog();
			if(makeReservForm.sucess)
			{
				dt.Clear();
				listID.Clear();
				ArrayList reservGroup = new ArrayList();
				reservationDA.initialize();
				if(fCheckall.Checked)
					reservGroup = reservationDA.getAll();
				else reservGroup = reservationDA.getCurrentAll();
				lTotal.Text = reservGroup.Count.ToString();

				reservationDA.terminate();
				for(int i=0; i<reservGroup.Count;i++)
				{
					reservation temp = (reservation)reservGroup[i];
					dr = dt.NewRow();
					dr[0] = i+1;
					listID.Add(temp.getReservationID());
					dr[1] = temp.getReservTime().Trim() + "\n" + temp.getEndTime().Trim();
					dr[2] = temp.getName().Trim();
					tableDA.initialize();
					table t = tableDA.find(temp.getTableID());
					tableDA.terminate();
					dr[3] = t.getCovers();
					dr[4] = temp.getTableID();
					dr[5] = temp.getStatus().Trim();
					dt.Rows.Add(dr);
				}
			
				DataView dv = new DataView(dt);
				dViewReserv.DataSource = dv;
				if(dv.Count>13)
					this.dViewReserv.Size = new System.Drawing.Size(800, 420);
				else	 this.dViewReserv.Size = new System.Drawing.Size(780, 420);
				dViewReserv.Select(0);
			}
			
		}

		private void bEdit_Click(object sender, System.EventArgs e)
		{
			int iRows = dViewReserv.CurrentRowIndex;
			int id = (int)listID[iRows];
			reservForm editReservForm = new reservForm(2,id);
			editReservForm.ShowDialog();
			if(editReservForm.sucess)
			{
				dt.Clear();
				listID.Clear();
				ArrayList reservGroup = new ArrayList();
				reservationDA.initialize();
				if(fCheckall.Checked)
					reservGroup = reservationDA.getAll();
				else reservGroup = reservationDA.getCurrentAll();
				lTotal.Text = reservGroup.Count.ToString();
				reservationDA.terminate();
				for(int i=0; i<reservGroup.Count;i++)
				{
					reservation temp = (reservation)reservGroup[i];
					dr = dt.NewRow();
					dr[0] = i+1;
					listID.Add(temp.getReservationID());
					dr[1] = temp.getReservTime().Trim() + "\n" + temp.getEndTime().Trim();
					dr[2] = temp.getName().Trim();
					tableDA.initialize();
					table t = tableDA.find(temp.getTableID());
					tableDA.terminate();
					dr[3] = t.getCovers();
					dr[4] = temp.getTableID();
					dr[5] = temp.getStatus().Trim();
					dt.Rows.Add(dr);
				}
			
				DataView dv = new DataView(dt);
				dViewReserv.DataSource = dv;
				if(dv.Count>13)
					this.dViewReserv.Size = new System.Drawing.Size(800, 420);
				else	 this.dViewReserv.Size = new System.Drawing.Size(780, 420);
				dViewReserv.Select(0);
			}
		}
	}
}
