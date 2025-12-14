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
	/// Summary description for ViewCustomerForm.
	/// </summary>
	public class ViewCustomerForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label lHeader;
		private System.Windows.Forms.DataGrid gridCustomer;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		

		private DataTable dt;
		private System.Windows.Forms.Label lText;
		private System.Windows.Forms.Label lTotals;
		private System.Windows.Forms.Label lText2;
		private System.Windows.Forms.Button bAddCustomer;
		private System.Windows.Forms.Button bEditCustomer;
		private System.Windows.Forms.Button bDelCustomer;
		private DataRow dr;
		public ViewCustomerForm()
		{
			//
			// Required for Windows Form Designer support
			//
			dt = new DataTable();
			dt.Columns.Add(new DataColumn("ชื่อ",typeof(string)));
			dt.Columns.Add(new DataColumn("นามสกุล",typeof(string)));
			dt.Columns.Add(new DataColumn("ที่อยู่",typeof(string)));
			dt.Columns.Add(new DataColumn("อีเมลล์",typeof(string)));
			dt.Columns.Add(new DataColumn("โทรศัพท์",typeof(string)));
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
			this.lHeader = new System.Windows.Forms.Label();
			this.gridCustomer = new System.Windows.Forms.DataGrid();
			this.lText = new System.Windows.Forms.Label();
			this.lTotals = new System.Windows.Forms.Label();
			this.lText2 = new System.Windows.Forms.Label();
			this.bAddCustomer = new System.Windows.Forms.Button();
			this.bEditCustomer = new System.Windows.Forms.Button();
			this.bDelCustomer = new System.Windows.Forms.Button();
			((System.ComponentModel.ISupportInitialize)(this.gridCustomer)).BeginInit();
			this.SuspendLayout();
			// 
			// lHeader
			// 
			this.lHeader.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lHeader.ForeColor = System.Drawing.Color.Red;
			this.lHeader.Location = new System.Drawing.Point(456, 24);
			this.lHeader.Name = "lHeader";
			this.lHeader.Size = new System.Drawing.Size(144, 23);
			this.lHeader.TabIndex = 0;
			this.lHeader.Text = "รายชื่อลูกค้าทั้งหมด";
			// 
			// gridCustomer
			// 
			this.gridCustomer.AlternatingBackColor = System.Drawing.Color.GhostWhite;
			this.gridCustomer.BackColor = System.Drawing.Color.GhostWhite;
			this.gridCustomer.BackgroundColor = System.Drawing.Color.Lavender;
			this.gridCustomer.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.gridCustomer.CaptionBackColor = System.Drawing.Color.RoyalBlue;
			this.gridCustomer.CaptionForeColor = System.Drawing.Color.White;
			this.gridCustomer.CausesValidation = false;
			this.gridCustomer.DataMember = "";
			this.gridCustomer.FlatMode = true;
			this.gridCustomer.Font = new System.Drawing.Font("Tahoma", 8F);
			this.gridCustomer.ForeColor = System.Drawing.Color.MidnightBlue;
			this.gridCustomer.GridLineColor = System.Drawing.Color.RoyalBlue;
			this.gridCustomer.HeaderBackColor = System.Drawing.Color.MidnightBlue;
			this.gridCustomer.HeaderFont = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
			this.gridCustomer.HeaderForeColor = System.Drawing.Color.Lavender;
			this.gridCustomer.LinkColor = System.Drawing.Color.Teal;
			this.gridCustomer.Location = new System.Drawing.Point(128, 72);
			this.gridCustomer.Name = "gridCustomer";
			this.gridCustomer.ParentRowsBackColor = System.Drawing.Color.Lavender;
			this.gridCustomer.ParentRowsForeColor = System.Drawing.Color.MidnightBlue;
			this.gridCustomer.PreferredColumnWidth = 140;
			this.gridCustomer.PreferredRowHeight = 20;
			this.gridCustomer.ReadOnly = true;
			this.gridCustomer.RowHeadersVisible = false;
			this.gridCustomer.SelectionBackColor = System.Drawing.Color.Teal;
			this.gridCustomer.SelectionForeColor = System.Drawing.Color.PaleGreen;
			this.gridCustomer.Size = new System.Drawing.Size(700, 415);
			this.gridCustomer.TabIndex = 1;
			this.gridCustomer.CurrentCellChanged += new System.EventHandler(this.selectRow);
			// 
			// lText
			// 
			this.lText.Location = new System.Drawing.Point(128, 504);
			this.lText.Name = "lText";
			this.lText.TabIndex = 2;
			this.lText.Text = "จำนวนลูกค้าทั้งหมด";
			// 
			// lTotals
			// 
			this.lTotals.Location = new System.Drawing.Point(240, 504);
			this.lTotals.Name = "lTotals";
			this.lTotals.Size = new System.Drawing.Size(56, 23);
			this.lTotals.TabIndex = 3;
			this.lTotals.Text = "Totals";
			// 
			// lText2
			// 
			this.lText2.Location = new System.Drawing.Point(296, 504);
			this.lText2.Name = "lText2";
			this.lText2.TabIndex = 4;
			this.lText2.Text = "คน";
			// 
			// bAddCustomer
			// 
			this.bAddCustomer.Location = new System.Drawing.Point(128, 584);
			this.bAddCustomer.Name = "bAddCustomer";
			this.bAddCustomer.Size = new System.Drawing.Size(120, 23);
			this.bAddCustomer.TabIndex = 5;
			this.bAddCustomer.Text = "เพิ่มรายชื่อลูกค้า";
			this.bAddCustomer.Click += new System.EventHandler(this.bAddCustomer_Click);
			// 
			// bEditCustomer
			// 
			this.bEditCustomer.Location = new System.Drawing.Point(296, 584);
			this.bEditCustomer.Name = "bEditCustomer";
			this.bEditCustomer.Size = new System.Drawing.Size(112, 23);
			this.bEditCustomer.TabIndex = 6;
			this.bEditCustomer.Text = "ดูรายละเอียดลูกค้า";
			this.bEditCustomer.Click += new System.EventHandler(this.bEditCustomer_Click);
			// 
			// bDelCustomer
			// 
			this.bDelCustomer.Location = new System.Drawing.Point(464, 584);
			this.bDelCustomer.Name = "bDelCustomer";
			this.bDelCustomer.Size = new System.Drawing.Size(104, 23);
			this.bDelCustomer.TabIndex = 7;
			this.bDelCustomer.Text = "ลบรายชื่อลูกค้า";
			this.bDelCustomer.Click += new System.EventHandler(this.bDelCustomer_Click);
			// 
			// ViewCustomerForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(904, 654);
			this.Controls.Add(this.bDelCustomer);
			this.Controls.Add(this.bEditCustomer);
			this.Controls.Add(this.bAddCustomer);
			this.Controls.Add(this.lText2);
			this.Controls.Add(this.lTotals);
			this.Controls.Add(this.lText);
			this.Controls.Add(this.gridCustomer);
			this.Controls.Add(this.lHeader);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "ViewCustomerForm";
			this.Text = "รายชื่อลูกค้า";
			this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
			this.Load += new System.EventHandler(this.ViewCustomerForm_Load);
			((System.ComponentModel.ISupportInitialize)(this.gridCustomer)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		private void ViewCustomerForm_Load(object sender, System.EventArgs e)
		{
		
			gridCustomer.CaptionVisible = false;
			customerDA.initialize();
			ArrayList customerGroup = new ArrayList();
			customerGroup = customerDA.getAll();
			lTotals.Text = customerGroup.Count.ToString();
			customerDA.terminate();
			for(int i=0; i<customerGroup.Count;i++)
			{
				customer temp = (customer)customerGroup[i];
				dr = dt.NewRow();
				
				dr[0] = temp.getName().Trim();
				dr[1] = temp.getLastName().Trim();
				dr[2] = temp.getAddress().Trim();
				dr[3] = temp.getEmail().Trim();
				dr[4] = temp.getTelephone().Trim();
				dt.Rows.Add(dr);
			}
			
			DataView dv = new DataView(dt);
			gridCustomer.DataSource = dv;
			gridCustomer.Select(0);
			
		}
		private void selectRow(object sender, System.EventArgs e)
		{
			gridCustomer.Select(gridCustomer.CurrentRowIndex);
		}

		private void bAddCustomer_Click(object sender, System.EventArgs e)
		{
			
			ProfileCustomerForm customerForm = new ProfileCustomerForm(1,"",""); 
			customerForm.ShowDialog();
			if(customerForm.sucess)
			{
				dt.Clear();
				ArrayList customerGroup = new ArrayList();
				customerDA.initialize();
				customerGroup = customerDA.getAll();
				lTotals.Text = customerGroup.Count.ToString();
				customerDA.terminate();
				for(int i=0; i<customerGroup.Count;i++)
				{
					customer temp = (customer)customerGroup[i];
					dr = dt.NewRow();
				
					dr[0] = temp.getName().Trim();
					dr[1] = temp.getLastName().Trim();
					dr[2] = temp.getAddress().Trim();
					dr[3] = temp.getEmail().Trim();
					dr[4] = temp.getTelephone().Trim();
					dt.Rows.Add(dr);
				}
			
				DataView dv = new DataView(dt);
				gridCustomer.DataSource = dv;
				gridCustomer.Select(0);
			}
		}

		private void bDelCustomer_Click(object sender, System.EventArgs e)
		{
			string name,lastname,address,email,telephone;
			int iRows = gridCustomer.CurrentRowIndex;
			name = (string)gridCustomer[iRows,0];
			lastname = (string)gridCustomer[iRows,1];
			address = (string)gridCustomer[iRows,2];
			email = (string)gridCustomer[iRows,3];
			telephone = (string)gridCustomer[iRows,4];
			YesNoForm ynForm  = new YesNoForm("คุณต้องการจะลบลูกค้าชื่อ " + name + " ใช่หรือไม่?");
			ynForm.ShowDialog();
			if(ynForm.check)
			{
				customerDA.initialize();
				if(customerDA.deleteName(name,lastname))
				{
					// delete sucess
				
					MessageBox.Show("ข้อมูลถูกลบทิ้งเรียบร้อยแล้ว","สถานะการลบข้อมูล");
					lTotals.Text = customerDA.totalCustomers().ToString();
					dt.Rows.RemoveAt(iRows);
					DataView dv = new DataView(dt);
					gridCustomer.DataSource = dv;
				
				
				}
				else 
				{
					// delete non-sucess
					MessageBox.Show("ไม่สามารถลบข้อมูลได้","สถานะการลบข้อมูล");

				}
				customerDA.terminate();
			}
		}

		private void bEditCustomer_Click(object sender, System.EventArgs e)
		{
			int iRows = gridCustomer.CurrentRowIndex;
			string name = (string)gridCustomer[iRows,0];
			string lastname = (string)gridCustomer[iRows,1];
			ProfileCustomerForm customerForm = new ProfileCustomerForm(2,name,lastname);
			customerForm.ShowDialog();
			if(customerForm.sucess)
			{
				dt.Clear();
				ArrayList customerGroup = new ArrayList();
				customerDA.initialize();
				customerGroup = customerDA.getAll();
				lTotals.Text = customerGroup.Count.ToString();
				customerDA.terminate();
				for(int i=0; i<customerGroup.Count;i++)
				{
					customer temp = (customer)customerGroup[i];
					dr = dt.NewRow();
				
					dr[0] = temp.getName().Trim();
					dr[1] = temp.getLastName().Trim();
					dr[2] = temp.getAddress().Trim();
					dr[3] = temp.getEmail().Trim();
					dr[4] = temp.getTelephone().Trim();
					dt.Rows.Add(dr);
				}
			
				DataView dv = new DataView(dt);
				gridCustomer.DataSource = dv;
				gridCustomer.Select(0);
			}
		}

		
	}
}
