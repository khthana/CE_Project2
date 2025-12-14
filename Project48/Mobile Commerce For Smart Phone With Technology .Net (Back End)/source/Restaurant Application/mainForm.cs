using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Restaurant
{
	/// <summary>
	/// Summary description for mainForm.
	/// </summary>
	public class mainForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Button button4;
		private System.Windows.Forms.Button button5;
		private System.Windows.Forms.PictureBox pictureBox1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public mainForm()
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

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(mainForm));
			this.button1 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.button3 = new System.Windows.Forms.Button();
			this.button4 = new System.Windows.Forms.Button();
			this.button5 = new System.Windows.Forms.Button();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// button1
			// 
			this.button1.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
			this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.button1.Location = new System.Drawing.Point(80, 296);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(184, 40);
			this.button1.TabIndex = 0;
			this.button1.Text = "รายชื่อลูกค้า";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// button2
			// 
			this.button2.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
			this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.button2.Location = new System.Drawing.Point(80, 152);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(184, 40);
			this.button2.TabIndex = 1;
			this.button2.Text = "รายการจองที่นั่ง";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// button3
			// 
			this.button3.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
			this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.button3.Location = new System.Drawing.Point(80, 224);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(184, 40);
			this.button3.TabIndex = 2;
			this.button3.Text = "เมนูอาหาร";
			this.button3.Click += new System.EventHandler(this.button3_Click);
			// 
			// button4
			// 
			this.button4.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
			this.button4.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.button4.Location = new System.Drawing.Point(80, 368);
			this.button4.Name = "button4";
			this.button4.Size = new System.Drawing.Size(184, 40);
			this.button4.TabIndex = 3;
			this.button4.Text = "รายละเอียดโต๊ะ";
			this.button4.Click += new System.EventHandler(this.button4_Click);
			// 
			// button5
			// 
			this.button5.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
			this.button5.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.button5.Location = new System.Drawing.Point(80, 440);
			this.button5.Name = "button5";
			this.button5.Size = new System.Drawing.Size(184, 40);
			this.button5.TabIndex = 4;
			this.button5.Text = "โปรโมชั่น";
			this.button5.Click += new System.EventHandler(this.button5_Click);
			// 
			// pictureBox1
			// 
			this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
			this.pictureBox1.Location = new System.Drawing.Point(368, 144);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(456, 344);
			this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pictureBox1.TabIndex = 5;
			this.pictureBox1.TabStop = false;
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("JasmineUPC", 36F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.ForeColor = System.Drawing.SystemColors.Desktop;
			this.label1.Location = new System.Drawing.Point(232, 56);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(448, 48);
			this.label1.TabIndex = 6;
			this.label1.Text = "MCL FOOD RESTAURANT";
			// 
			// label2
			// 
			this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label2.ForeColor = System.Drawing.Color.FromArgb(((System.Byte)(64)), ((System.Byte)(0)), ((System.Byte)(0)));
			this.label2.Location = new System.Drawing.Point(368, 528);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(424, 48);
			this.label2.TabIndex = 7;
			this.label2.Text = "ร้านอาหาร เอ็ม ซี แอล ยินต้อนรับค่ะ  ร้านอาหารของเรามีอาหารรสเด็ดมากมาย บริการด้ว" +
				"ยใจ ";
			// 
			// label3
			// 
			this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label3.ForeColor = System.Drawing.Color.FromArgb(((System.Byte)(64)), ((System.Byte)(0)), ((System.Byte)(0)));
			this.label3.Location = new System.Drawing.Point(712, 616);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(208, 24);
			this.label3.TabIndex = 8;
			this.label3.Text = " ติดต่อได้ ที่  02-7749211";
			// 
			// label4
			// 
			this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label4.ForeColor = System.Drawing.Color.FromArgb(((System.Byte)(64)), ((System.Byte)(0)), ((System.Byte)(0)));
			this.label4.Location = new System.Drawing.Point(720, 648);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(160, 24);
			this.label4.TabIndex = 9;
			this.label4.Text = "mcl@kmitl.ac.th";
			// 
			// mainForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(920, 678);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.pictureBox1);
			this.Controls.Add(this.button5);
			this.Controls.Add(this.button4);
			this.Controls.Add(this.button3);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.button1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.Name = "mainForm";
			this.Text = "ร้านอาหาร MCL FOOD";
			this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
			this.ResumeLayout(false);

		}
		#endregion

		private void button2_Click(object sender, System.EventArgs e)
		{
			viewReservForm reservForm = new viewReservForm();
			reservForm.Show();
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			ViewCustomerForm customerForm = new ViewCustomerForm();
			customerForm.Show();
		}

		private void button3_Click(object sender, System.EventArgs e)
		{
			viewMenuForm menuForm = new viewMenuForm();
			menuForm.Show();
		}

		private void button4_Click(object sender, System.EventArgs e)
		{
			viewTableForm tableForm = new viewTableForm();
			tableForm.Show();
		}

		private void button5_Click(object sender, System.EventArgs e)
		{
			viewPromotionForm promotionForm = new viewPromotionForm();
			promotionForm.Show();
		}
	}
}
