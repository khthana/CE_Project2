using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Restaurant
{
	/// <summary>
	/// Summary description for addPromotionForm.
	/// </summary>
	public class addPromotionForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.TextBox tDiscription;
		private System.Windows.Forms.TextBox tPromotionName;
		private System.Windows.Forms.Label lCovers;
		private System.Windows.Forms.Label lNote;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.DateTimePicker dBegin;
		private System.Windows.Forms.DateTimePicker dEnd;
		private System.Windows.Forms.Button bAdd;
		private System.Windows.Forms.Button bCancel;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private string mode;
		private int promotionID;
		private System.Windows.Forms.Label label4;
		public bool sucess;
		public addPromotionForm()
		{
			//
			// Required for Windows Form Designer support
			//
			sucess = false;
			mode = "";
			promotionID = 0;
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}
		
		public addPromotionForm(string mode,int id)
		{
			//
			// Required for Windows Form Designer support
			//
			sucess = false;
			this.mode = mode;
			promotionID = id;
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
			this.tDiscription = new System.Windows.Forms.TextBox();
			this.tPromotionName = new System.Windows.Forms.TextBox();
			this.lCovers = new System.Windows.Forms.Label();
			this.lNote = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.dBegin = new System.Windows.Forms.DateTimePicker();
			this.dEnd = new System.Windows.Forms.DateTimePicker();
			this.bAdd = new System.Windows.Forms.Button();
			this.bCancel = new System.Windows.Forms.Button();
			this.label4 = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// tDiscription
			// 
			this.tDiscription.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.tDiscription.Location = new System.Drawing.Point(328, 152);
			this.tDiscription.Name = "tDiscription";
			this.tDiscription.TabIndex = 11;
			this.tDiscription.Text = "";
			// 
			// tPromotionName
			// 
			this.tPromotionName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.tPromotionName.Location = new System.Drawing.Point(328, 96);
			this.tPromotionName.Name = "tPromotionName";
			this.tPromotionName.TabIndex = 10;
			this.tPromotionName.Text = "";
			// 
			// lCovers
			// 
			this.lCovers.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lCovers.Location = new System.Drawing.Point(160, 152);
			this.lCovers.Name = "lCovers";
			this.lCovers.Size = new System.Drawing.Size(112, 24);
			this.lCovers.TabIndex = 8;
			this.lCovers.Text = "คำอธิบาย :";
			// 
			// lNote
			// 
			this.lNote.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lNote.Location = new System.Drawing.Point(160, 96);
			this.lNote.Name = "lNote";
			this.lNote.Size = new System.Drawing.Size(112, 24);
			this.lNote.TabIndex = 7;
			this.lNote.Text = "ชื่อโปรโมชั่น :";
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.Location = new System.Drawing.Point(160, 208);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(136, 24);
			this.label1.TabIndex = 12;
			this.label1.Text = "วันเริ่มโปรโมชั่น :";
			// 
			// label2
			// 
			this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label2.Location = new System.Drawing.Point(160, 256);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(136, 24);
			this.label2.TabIndex = 13;
			this.label2.Text = "วันสิ้นสุดโปรโมชั่น :";
			// 
			// dBegin
			// 
			this.dBegin.Format = System.Windows.Forms.DateTimePickerFormat.Short;
			this.dBegin.Location = new System.Drawing.Point(328, 208);
			this.dBegin.Name = "dBegin";
			this.dBegin.Size = new System.Drawing.Size(104, 20);
			this.dBegin.TabIndex = 14;
			this.dBegin.Value = new System.DateTime(2006, 2, 10, 12, 0, 0, 0);
			// 
			// dEnd
			// 
			this.dEnd.Format = System.Windows.Forms.DateTimePickerFormat.Short;
			this.dEnd.Location = new System.Drawing.Point(328, 256);
			this.dEnd.Name = "dEnd";
			this.dEnd.Size = new System.Drawing.Size(104, 20);
			this.dEnd.TabIndex = 15;
			this.dEnd.Value = new System.DateTime(2006, 2, 10, 12, 0, 0, 0);
			// 
			// bAdd
			// 
			this.bAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bAdd.Location = new System.Drawing.Point(168, 336);
			this.bAdd.Name = "bAdd";
			this.bAdd.Size = new System.Drawing.Size(88, 32);
			this.bAdd.TabIndex = 16;
			this.bAdd.Text = "เพิ่มหรือแก้ไข";
			this.bAdd.Click += new System.EventHandler(this.bAdd_Click);
			// 
			// bCancel
			// 
			this.bCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.bCancel.Location = new System.Drawing.Point(304, 336);
			this.bCancel.Name = "bCancel";
			this.bCancel.Size = new System.Drawing.Size(88, 32);
			this.bCancel.TabIndex = 17;
			this.bCancel.Text = "ยกเลิก";
			this.bCancel.Click += new System.EventHandler(this.bCancel_Click);
			// 
			// label4
			// 
			this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label4.ForeColor = System.Drawing.SystemColors.ActiveCaption;
			this.label4.Location = new System.Drawing.Point(208, 32);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(224, 24);
			this.label4.TabIndex = 18;
			this.label4.Text = "รายละเอียดของโปรโมชั่น";
			// 
			// addPromotionForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(680, 422);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.bCancel);
			this.Controls.Add(this.bAdd);
			this.Controls.Add(this.dEnd);
			this.Controls.Add(this.dBegin);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.tDiscription);
			this.Controls.Add(this.tPromotionName);
			this.Controls.Add(this.lCovers);
			this.Controls.Add(this.lNote);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "addPromotionForm";
			this.Text = "แก้ไขหรือเพิ่มโปรโมชั่น";
			this.Load += new System.EventHandler(this.addPromotionForm_Load);
			this.ResumeLayout(false);

		}
		#endregion

		private void bCancel_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void addPromotionForm_Load(object sender, System.EventArgs e)
		{
			if(mode.Equals("แก้ไข"))
			{
				promotionDA.initialize();
				promotion p = promotionDA.find(this.promotionID);
				promotionDA.terminate();
				tPromotionName.Text = p.getPromotionName().Trim(); 
				tDiscription.Text = p.getDiscription().Trim();
				DateTime beginTime = Convert.ToDateTime(p.getBeginTime().Trim());
				DateTime endTime = Convert.ToDateTime(p.getEndTime().Trim());
				dBegin.Value = beginTime;
				dEnd.Value = endTime;
			}
		}

		private void bAdd_Click(object sender, System.EventArgs e)
		{
			if(dBegin.Value.Date<dEnd.Value.Date)
			{
				DateTime dateBegin = dBegin.Value.Date;
				DateTime dateEnd = dEnd.Value.Date;
				string beginTime = dateBegin.ToShortDateString()+ " " +dateBegin.ToShortTimeString();
				string endTime = dateEnd.ToShortDateString() +" " +dateEnd.ToShortTimeString();
				promotionDA.initialize();
				if(mode.Equals("เพิ่ม"))
				{
					if(promotionDA.addPromotion(tPromotionName.Text,tDiscription.Text,
						beginTime,endTime))
					{
						MessageBox.Show("เพิ่มโปรโมชั่นเรียบร้อยแล้ว","สถานะการเพิ่มโปรโมชั่น");
						sucess = true;
						this.Close();

					} else MessageBox.Show("ไม่สามารถเพิ่มโปรโมชั่นได้","สถานะการเพิ่มโปรโมชั่น");
				}
				if(mode.Equals("แก้ไข"))
				{
					if(promotionDA.editPromotion(this.promotionID,tPromotionName.Text,
						tDiscription.Text,beginTime,endTime))
					{
						MessageBox.Show("แก้ไขโปรโมชั่นเรียบร้อยแล้ว","สถานะการแก้ไขโปรโมชั่น");
						sucess = true;
						this.Close();
					} else MessageBox.Show("ไม่สามารถแก้ไขโปรโมชั่นได้","สถานะการแก้ไขโปรโมชั่น");
				}
				promotionDA.terminate();
			} else MessageBox.Show("กรุณากรอกช่วงเวลาให้ถูกต้องด้วยค่ะ","แจ้งข้อผิดพลาด");
		}
	}
}
