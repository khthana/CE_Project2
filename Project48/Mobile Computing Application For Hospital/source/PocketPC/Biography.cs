using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace MobileHospital1
{
	/// <summary>
	/// Summary description for Biography.
	/// </summary>
	public class Biography : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.TextBox textBox2;
		private System.Windows.Forms.TextBox textBox3;
		private System.Windows.Forms.TextBox textBox4;
		private System.Windows.Forms.TextBox textBox5;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.Label label1;
	
		public Biography()
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
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.textBox2 = new System.Windows.Forms.TextBox();
			this.textBox3 = new System.Windows.Forms.TextBox();
			this.textBox4 = new System.Windows.Forms.TextBox();
			this.textBox5 = new System.Windows.Forms.TextBox();
			this.label8 = new System.Windows.Forms.Label();
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Size = new System.Drawing.Size(224, 20);
			this.label1.Text = "BIOGRAPHY   PATIENT";
			this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(24, 40);
			this.label2.Size = new System.Drawing.Size(64, 20);
			this.label2.Text = "ID Patient";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(24, 72);
			this.label3.Size = new System.Drawing.Size(64, 20);
			this.label3.Text = "BirthDate";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(16, 120);
			this.label4.Size = new System.Drawing.Size(72, 20);
			this.label4.Text = "BloodGroup";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(16, 152);
			this.label5.Size = new System.Drawing.Size(72, 20);
			this.label5.Text = "AllertCollect";
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(8, 184);
			this.label6.Size = new System.Drawing.Size(72, 20);
			this.label6.Text = "Heredopathia";
			// 
			// textBox1
			// 
			this.textBox1.BackColor = System.Drawing.SystemColors.Control;
			this.textBox1.Location = new System.Drawing.Point(88, 40);
			this.textBox1.Size = new System.Drawing.Size(112, 20);
			this.textBox1.Text = "";
			// 
			// textBox2
			// 
			this.textBox2.BackColor = System.Drawing.SystemColors.Control;
			this.textBox2.Location = new System.Drawing.Point(88, 72);
			this.textBox2.Size = new System.Drawing.Size(112, 20);
			this.textBox2.Text = "";
			// 
			// textBox3
			// 
			this.textBox3.BackColor = System.Drawing.SystemColors.Control;
			this.textBox3.Location = new System.Drawing.Point(88, 120);
			this.textBox3.Size = new System.Drawing.Size(112, 20);
			this.textBox3.Text = "";
			// 
			// textBox4
			// 
			this.textBox4.BackColor = System.Drawing.SystemColors.Control;
			this.textBox4.Location = new System.Drawing.Point(88, 152);
			this.textBox4.Size = new System.Drawing.Size(112, 20);
			this.textBox4.Text = "";
			// 
			// textBox5
			// 
			this.textBox5.BackColor = System.Drawing.SystemColors.Control;
			this.textBox5.Location = new System.Drawing.Point(88, 184);
			this.textBox5.Size = new System.Drawing.Size(112, 20);
			this.textBox5.Text = "";
			// 
			// label8
			// 
			this.label8.Location = new System.Drawing.Point(32, 96);
			this.label8.Size = new System.Drawing.Size(192, 20);
			this.label8.Text = "e.g.  dd/mm/yyyy 25/5/2549";
			this.label8.ParentChanged += new System.EventHandler(this.label8_ParentChanged);
			// 
			// Biography
			// 
			this.Controls.Add(this.label8);
			this.Controls.Add(this.textBox5);
			this.Controls.Add(this.textBox4);
			this.Controls.Add(this.textBox3);
			this.Controls.Add(this.textBox2);
			this.Controls.Add(this.textBox1);
			this.Controls.Add(this.label6);
			this.Controls.Add(this.label5);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Text = "Biography";
			this.Load += new System.EventHandler(this.Biography_Load);

		}
		#endregion


		private void Biography_Load(object sender, System.EventArgs e)
		{

		}

		private void label8_ParentChanged(object sender, System.EventArgs e)
		{
		
		}

		public void GetPID(String id) 
		{
			textBox1.Text = id;
			GetData();
		}

		private void GetData() 
		{
			string PID;
			bool CheckLogin;

			MHWS.Service1 service = new MHWS.Service1();
			PID = textBox1.Text;
			CheckLogin = service.CheckPatient(PID);
			if(CheckLogin==true)
			{
				this.Show();
				MHWS.tblpatientbasicdata data;	
				MHWS.tblallertcollect allert;
				MHWS.tblheredity here;
				//MHWS.tbldoctor doc;

				data = service.GetPatient(PID);	
				allert = service.GetAllertCollect(PID);
				here = service.GetHeredity(PID);
				//doc = service.GetDoctor(PID);
				
				textBox2.Text = data.BirthDay;
				textBox3.Text = data.BloodGroup;
				textBox4.Text = allert.AllertcollectName;
				textBox5.Text = here.HeredityName;
				//textBox6.Text = doc.DoctorName;
			} 
			else
			{
				MessageBox.Show("Please ID Patient","NO Patient");
			}
		}
	}
}
