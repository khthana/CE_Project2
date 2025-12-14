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
	/// Summary description for viewReserv.
	/// </summary>
	public class viewTable : System.Windows.Forms.Form
	{
		private System.Windows.Forms.DataGrid dViewReserv;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private ArrayList aTable;
			
		
		private DataTable dt;
		private DataRow dr;
		
		private System.Windows.Forms.Label lCaption;
		private System.Windows.Forms.Button bReserv;

		public int tableID;
		public string note;
		public int covers;
		public viewTable()
		{
			//
			// Required for Windows Form Designer support
			//
			
			tableID = 0;
			note = "";
			covers = 0;
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}
		public viewTable(ArrayList aTable)
		{
			//
			// Required for Windows Form Designer support
			//
			tableID = 0;
			note = "";
			covers = 0;
			this.aTable = aTable;
			dt = new DataTable();
			dt.Columns.Add(new DataColumn("หมายเลขโต๊ะ",typeof(Int32)));
			dt.Columns.Add(new DataColumn("ลักษณะโต๊ะ",typeof(string)));
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
			this.dViewReserv = new System.Windows.Forms.DataGrid();
			this.lCaption = new System.Windows.Forms.Label();
			this.bReserv = new System.Windows.Forms.Button();
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
			this.dViewReserv.DataMember = "";
			this.dViewReserv.FlatMode = true;
			this.dViewReserv.Font = new System.Drawing.Font("Tahoma", 8F);
			this.dViewReserv.ForeColor = System.Drawing.Color.MidnightBlue;
			this.dViewReserv.GridLineColor = System.Drawing.Color.RoyalBlue;
			this.dViewReserv.HeaderBackColor = System.Drawing.Color.MidnightBlue;
			this.dViewReserv.HeaderFont = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
			this.dViewReserv.HeaderForeColor = System.Drawing.Color.Lavender;
			this.dViewReserv.LinkColor = System.Drawing.Color.Teal;
			this.dViewReserv.Location = new System.Drawing.Point(96, 64);
			this.dViewReserv.Name = "dViewReserv";
			this.dViewReserv.ParentRowsBackColor = System.Drawing.Color.Lavender;
			this.dViewReserv.ParentRowsForeColor = System.Drawing.Color.MidnightBlue;
			this.dViewReserv.PreferredColumnWidth = 100;
			this.dViewReserv.PreferredRowHeight = 20;
			this.dViewReserv.ReadOnly = true;
			this.dViewReserv.RowHeadersVisible = false;
			this.dViewReserv.SelectionBackColor = System.Drawing.Color.Teal;
			this.dViewReserv.SelectionForeColor = System.Drawing.Color.PaleGreen;
			this.dViewReserv.Size = new System.Drawing.Size(317, 135);
			this.dViewReserv.TabIndex = 0;
			this.dViewReserv.Click += new System.EventHandler(this.dViewReserv_Click);
			this.dViewReserv.CurrentCellChanged += new System.EventHandler(this.dViewReserv_CurrentCellChanged);
			// 
			// lCaption
			// 
			this.lCaption.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lCaption.ForeColor = System.Drawing.Color.Teal;
			this.lCaption.Location = new System.Drawing.Point(120, 24);
			this.lCaption.Name = "lCaption";
			this.lCaption.Size = new System.Drawing.Size(256, 23);
			this.lCaption.TabIndex = 1;
			this.lCaption.Text = "เลือกโต๊ะที่ท่านต้องการจอง";
			// 
			// bReserv
			// 
			this.bReserv.Location = new System.Drawing.Point(192, 240);
			this.bReserv.Name = "bReserv";
			this.bReserv.TabIndex = 2;
			this.bReserv.Text = "ตกลง";
			this.bReserv.Click += new System.EventHandler(this.bReserv_Click);
			// 
			// viewTable
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(520, 278);
			this.Controls.Add(this.bReserv);
			this.Controls.Add(this.lCaption);
			this.Controls.Add(this.dViewReserv);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "viewTable";
			this.Text = "โต๊ะที่ยังว่างอยู่";
			this.Load += new System.EventHandler(this.viewReserv_Load);
			((System.ComponentModel.ISupportInitialize)(this.dViewReserv)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		private void viewReserv_Load(object sender, System.EventArgs e)
		{
			dViewReserv.CaptionVisible = false;
			reservationDA.initialize();
			ArrayList reservGroup = new ArrayList();
			reservGroup = reservationDA.getAll();
			reservationDA.terminate();
		//	DataTable dt = new DataTable();
		//	DataRow dr;
			
			
			
			
			for(int i=0;i<aTable.Count;i++)
			{
				table temp = (table)aTable[i];
				dr = dt.NewRow();
				dr[0] = temp.getTableID();
				dr[1] = temp.getNote().Trim();
				dr[2] = temp.getCovers();
				dt.Rows.Add(dr);
			}
			DataView dv = new DataView(dt);
			dViewReserv.DataSource = dv;
			dViewReserv.Select(0);
		
		}

		private void dViewReserv_Click(object sender, System.EventArgs e)
		{
			
		
			
		}

		private void bReserv_Click(object sender, System.EventArgs e)
		{
			int iRows = dViewReserv.CurrentRowIndex;
			tableID = (int)dViewReserv[iRows,0];
			note = (string)dViewReserv[iRows,1];
			covers = (int)dViewReserv[iRows,2];
			this.Close();
		}

		private void dViewReserv_CurrentCellChanged(object sender, System.EventArgs e)
		{
			dViewReserv.Select(dViewReserv.CurrentRowIndex);
		}


	}
}
