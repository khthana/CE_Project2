using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Restaurant
{
	/// <summary>
	/// Summary description for ProfileCusomterForm.
	/// </summary>
	public class ProfileCustomerForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.TextBox fEmail;
		private System.Windows.Forms.TextBox fTelephone;
		private System.Windows.Forms.TextBox fPostcode;
		private System.Windows.Forms.Label lEmail;
		private System.Windows.Forms.Label lTelephone;
		private System.Windows.Forms.Label lPostcode;
		private System.Windows.Forms.Label lProvince;
		private System.Windows.Forms.Label lAddress;
		private System.Windows.Forms.Label lAge;
		private System.Windows.Forms.GroupBox lSex;
		private System.Windows.Forms.RadioButton fFemale;
		private System.Windows.Forms.RadioButton fMale;
		private System.Windows.Forms.Label lCardID;
		private System.Windows.Forms.Label lLastName;
		private System.Windows.Forms.Label lName;
		private System.Windows.Forms.TextBox fProvince;
		private System.Windows.Forms.TextBox fAddress;
		private System.Windows.Forms.TextBox fAge;
		private System.Windows.Forms.TextBox fCardID;
		private System.Windows.Forms.TextBox fLastName;
		private System.Windows.Forms.TextBox fName;
		private System.Windows.Forms.Button bAdd;
		private System.Windows.Forms.Button bCancel;
		private System.Windows.Forms.Label label1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		
		private string name;
		private string lastname;
		
		private int addEdit; // check Add or Edit 
							  // 1 is Add
							  // 2 is Edit
		public bool sucess;
		public ProfileCustomerForm()
		{
			//
			// Required for Windows Form Designer support
			//
			addEdit = 0;
			name = "";
			lastname = "";
			sucess = false;
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}
		

		public ProfileCustomerForm(int n,string name,string lastname)
		{
			//
			// Required for Windows Form Designer support
			//
			addEdit = n;
			this.name = name;
			this.lastname = lastname;
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
			this.fEmail = new System.Windows.Forms.TextBox();
			this.fTelephone = new System.Windows.Forms.TextBox();
			this.fPostcode = new System.Windows.Forms.TextBox();
			this.lEmail = new System.Windows.Forms.Label();
			this.lTelephone = new System.Windows.Forms.Label();
			this.lPostcode = new System.Windows.Forms.Label();
			this.lProvince = new System.Windows.Forms.Label();
			this.lAddress = new System.Windows.Forms.Label();
			this.lAge = new System.Windows.Forms.Label();
			this.lSex = new System.Windows.Forms.GroupBox();
			this.fFemale = new System.Windows.Forms.RadioButton();
			this.fMale = new System.Windows.Forms.RadioButton();
			this.lCardID = new System.Windows.Forms.Label();
			this.lLastName = new System.Windows.Forms.Label();
			this.lName = new System.Windows.Forms.Label();
			this.fProvince = new System.Windows.Forms.TextBox();
			this.fAddress = new System.Windows.Forms.TextBox();
			this.fAge = new System.Windows.Forms.TextBox();
			this.fCardID = new System.Windows.Forms.TextBox();
			this.fLastName = new System.Windows.Forms.TextBox();
			this.fName = new System.Windows.Forms.TextBox();
			this.bAdd = new System.Windows.Forms.Button();
			this.bCancel = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.lSex.SuspendLayout();
			this.SuspendLayout();
			// 
			// fEmail
			// 
			this.fEmail.Location = new System.Drawing.Point(208, 312);
			this.fEmail.Name = "fEmail";
			this.fEmail.TabIndex = 54;
			this.fEmail.Text = "";
			// 
			// fTelephone
			// 
			this.fTelephone.Location = new System.Drawing.Point(208, 280);
			this.fTelephone.Name = "fTelephone";
			this.fTelephone.TabIndex = 53;
			this.fTelephone.Text = "";
			// 
			// fPostcode
			// 
			this.fPostcode.Location = new System.Drawing.Point(208, 248);
			this.fPostcode.Name = "fPostcode";
			this.fPostcode.TabIndex = 52;
			this.fPostcode.Text = "";
			// 
			// lEmail
			// 
			this.lEmail.Location = new System.Drawing.Point(120, 312);
			this.lEmail.Name = "lEmail";
			this.lEmail.Size = new System.Drawing.Size(48, 23);
			this.lEmail.TabIndex = 51;
			this.lEmail.Text = "อีเมลล์";
			// 
			// lTelephone
			// 
			this.lTelephone.Location = new System.Drawing.Point(120, 280);
			this.lTelephone.Name = "lTelephone";
			this.lTelephone.Size = new System.Drawing.Size(48, 23);
			this.lTelephone.TabIndex = 50;
			this.lTelephone.Text = "โทรศัพท์";
			// 
			// lPostcode
			// 
			this.lPostcode.Location = new System.Drawing.Point(120, 248);
			this.lPostcode.Name = "lPostcode";
			this.lPostcode.Size = new System.Drawing.Size(72, 23);
			this.lPostcode.TabIndex = 49;
			this.lPostcode.Text = "รหัสไปรษณีย์";
			// 
			// lProvince
			// 
			this.lProvince.Location = new System.Drawing.Point(120, 216);
			this.lProvince.Name = "lProvince";
			this.lProvince.Size = new System.Drawing.Size(48, 23);
			this.lProvince.TabIndex = 48;
			this.lProvince.Text = "จังหวัด";
			// 
			// lAddress
			// 
			this.lAddress.Location = new System.Drawing.Point(120, 184);
			this.lAddress.Name = "lAddress";
			this.lAddress.Size = new System.Drawing.Size(48, 23);
			this.lAddress.TabIndex = 47;
			this.lAddress.Text = "ที่อยู่";
			// 
			// lAge
			// 
			this.lAge.Location = new System.Drawing.Point(120, 152);
			this.lAge.Name = "lAge";
			this.lAge.Size = new System.Drawing.Size(48, 23);
			this.lAge.TabIndex = 46;
			this.lAge.Text = "อายุ";
			// 
			// lSex
			// 
			this.lSex.Controls.Add(this.fFemale);
			this.lSex.Controls.Add(this.fMale);
			this.lSex.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
			this.lSex.Location = new System.Drawing.Point(328, 120);
			this.lSex.Name = "lSex";
			this.lSex.Size = new System.Drawing.Size(176, 48);
			this.lSex.TabIndex = 45;
			this.lSex.TabStop = false;
			this.lSex.Text = "เพศ";
			// 
			// fFemale
			// 
			this.fFemale.Location = new System.Drawing.Point(104, 16);
			this.fFemale.Name = "fFemale";
			this.fFemale.Size = new System.Drawing.Size(56, 24);
			this.fFemale.TabIndex = 1;
			this.fFemale.Text = "หญิง";
			// 
			// fMale
			// 
			this.fMale.Checked = true;
			this.fMale.Location = new System.Drawing.Point(32, 16);
			this.fMale.Name = "fMale";
			this.fMale.Size = new System.Drawing.Size(56, 24);
			this.fMale.TabIndex = 0;
			this.fMale.TabStop = true;
			this.fMale.Text = "ชาย";
			// 
			// lCardID
			// 
			this.lCardID.Location = new System.Drawing.Point(120, 120);
			this.lCardID.Name = "lCardID";
			this.lCardID.Size = new System.Drawing.Size(64, 23);
			this.lCardID.TabIndex = 44;
			this.lCardID.Text = "รหัสประจำตัว";
			// 
			// lLastName
			// 
			this.lLastName.Location = new System.Drawing.Point(328, 88);
			this.lLastName.Name = "lLastName";
			this.lLastName.Size = new System.Drawing.Size(48, 23);
			this.lLastName.TabIndex = 43;
			this.lLastName.Text = "นามสกุล";
			// 
			// lName
			// 
			this.lName.Location = new System.Drawing.Point(120, 88);
			this.lName.Name = "lName";
			this.lName.Size = new System.Drawing.Size(48, 23);
			this.lName.TabIndex = 42;
			this.lName.Text = "ชื่อ";
			// 
			// fProvince
			// 
			this.fProvince.Location = new System.Drawing.Point(208, 216);
			this.fProvince.Name = "fProvince";
			this.fProvince.TabIndex = 41;
			this.fProvince.Text = "";
			// 
			// fAddress
			// 
			this.fAddress.Location = new System.Drawing.Point(208, 184);
			this.fAddress.Name = "fAddress";
			this.fAddress.Size = new System.Drawing.Size(296, 20);
			this.fAddress.TabIndex = 40;
			this.fAddress.Text = "";
			// 
			// fAge
			// 
			this.fAge.Location = new System.Drawing.Point(208, 152);
			this.fAge.Name = "fAge";
			this.fAge.Size = new System.Drawing.Size(56, 20);
			this.fAge.TabIndex = 39;
			this.fAge.Text = "";
			// 
			// fCardID
			// 
			this.fCardID.Location = new System.Drawing.Point(208, 120);
			this.fCardID.MaxLength = 13;
			this.fCardID.Name = "fCardID";
			this.fCardID.TabIndex = 38;
			this.fCardID.Text = "";
			// 
			// fLastName
			// 
			this.fLastName.Location = new System.Drawing.Point(400, 88);
			this.fLastName.Name = "fLastName";
			this.fLastName.TabIndex = 37;
			this.fLastName.Text = "";
			// 
			// fName
			// 
			this.fName.Location = new System.Drawing.Point(208, 88);
			this.fName.Name = "fName";
			this.fName.TabIndex = 36;
			this.fName.Text = "";
			// 
			// bAdd
			// 
			this.bAdd.Location = new System.Drawing.Point(208, 368);
			this.bAdd.Name = "bAdd";
			this.bAdd.TabIndex = 55;
			this.bAdd.Text = "เพิ่ม/แก้ไข";
			this.bAdd.Click += new System.EventHandler(this.bAdd_Click);
			// 
			// bCancel
			// 
			this.bCancel.Location = new System.Drawing.Point(352, 368);
			this.bCancel.Name = "bCancel";
			this.bCancel.TabIndex = 56;
			this.bCancel.Text = "ยกเลิก";
			this.bCancel.Click += new System.EventHandler(this.bCancel_Click);
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.ForeColor = System.Drawing.Color.MidnightBlue;
			this.label1.Location = new System.Drawing.Point(232, 40);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(160, 24);
			this.label1.TabIndex = 57;
			this.label1.Text = "รายละเอียดของลูกค้า";
			// 
			// ProfileCustomerForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(672, 414);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.bCancel);
			this.Controls.Add(this.bAdd);
			this.Controls.Add(this.fEmail);
			this.Controls.Add(this.fTelephone);
			this.Controls.Add(this.fPostcode);
			this.Controls.Add(this.lEmail);
			this.Controls.Add(this.lTelephone);
			this.Controls.Add(this.lPostcode);
			this.Controls.Add(this.lProvince);
			this.Controls.Add(this.lAddress);
			this.Controls.Add(this.lAge);
			this.Controls.Add(this.lSex);
			this.Controls.Add(this.lCardID);
			this.Controls.Add(this.lLastName);
			this.Controls.Add(this.lName);
			this.Controls.Add(this.fProvince);
			this.Controls.Add(this.fAddress);
			this.Controls.Add(this.fAge);
			this.Controls.Add(this.fCardID);
			this.Controls.Add(this.fLastName);
			this.Controls.Add(this.fName);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "ProfileCustomerForm";
			this.Text = "ข้อมูลลูกค้า";
			this.Load += new System.EventHandler(this.ProfileCustomerForm_Load);
			this.lSex.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void bAdd_Click(object sender, System.EventArgs e)
		{
			if(addEdit!=0)
			{
				
				int age=0;
				bool sex;
				bool check = true;
				if(fMale.Checked)
					sex = true;
				else sex = false;
				try
				{
					age = Convert.ToInt32(fAge.Text);
				}
				catch(Exception ex)
				{
					
					check = false;
				}
				if(check)
				{
					customerDA.initialize();
					if(addEdit==1)	// add
					{
						if( customerDA.addCustomer(fCardID.Text,fName.Text,fLastName.Text,age,
							sex,fAddress.Text,fProvince.Text,fPostcode.Text,
							fTelephone.Text,fEmail.Text) )
						{
							MessageBox.Show("เพิ่มรายชื่อเข้าสู่ฐานข้อมูลเรียบร้อยแล้ว","แสดงสถานะการเพิ่มหรือแก้ไข");
							sucess = true;
							this.Close();
						}
						else MessageBox.Show("โปรดตรวจสอบความถูกต้องของข้อมูล","แสดงสถานะการเพิ่มหรือแก้ไข");
						
					}
					else	// edit
					{
						if( customerDA.editCustomer(fCardID.Text,fName.Text,fLastName.Text,age,
							sex,fAddress.Text,fProvince.Text,fPostcode.Text,
							fTelephone.Text,fEmail.Text) )
						{
							MessageBox.Show("แก้ไขข้อมูลเรียบร้อยแล้ว","แสดงสถานะการเพิ่มหรือแก้ไข");
							sucess = true;
							this.Close();
						}
						else MessageBox.Show("โปรดตรวจสอบความถูกต้องของข้อมูล","แสดงสถานะการเพิ่มหรือแก้ไข");

					}
					customerDA.terminate();
					
				} else MessageBox.Show("กรุณากรอกข้อมูลอายุให้ถูกต้องค่ะ","เกิดความผิดพลาด");
			}
		}

		private void bCancel_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void ProfileCustomerForm_Load(object sender, System.EventArgs e)
		{
			if(addEdit==2)
			{
				customerDA.initialize();
				customer c = customerDA.find(name,lastname);
				customerDA.terminate();
				fCardID.Text = c.getCardID().Trim();
				fName.Text = c.getName().Trim();
				fLastName.Text = c.getLastName().Trim();
				fAge.Text = c.getAge().ToString();
				if(c.getSex())
					fMale.Checked = true;
				else fFemale.Checked = true;
				fAddress.Text = c.getAddress().Trim();
				fProvince.Text = c.getProvince().Trim();
				fPostcode.Text = c.getPostCode().Trim();
				fTelephone.Text = c.getTelephone().Trim();
				fEmail.Text = c.getEmail().Trim();


			}
		}
	}
}
