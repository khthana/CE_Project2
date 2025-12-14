using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;


namespace Restaurant
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class reservForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.DateTimePicker fDate;
		private System.Windows.Forms.DateTimePicker fTime;
		private System.Windows.Forms.TextBox fCovers;
		private System.Windows.Forms.ComboBox fInterval;
		private System.Windows.Forms.Label lDate;
		private System.Windows.Forms.Label lTime;
		private System.Windows.Forms.Label lCovers;
		private System.Windows.Forms.Label lInterval;
		private System.Windows.Forms.Button bCheck;
		private System.Windows.Forms.TextBox fName;
		private System.Windows.Forms.TextBox fLastName;
		private System.Windows.Forms.TextBox fCardID;
		private System.Windows.Forms.TextBox fAge;
		private System.Windows.Forms.TextBox fAddress;
		private System.Windows.Forms.TextBox fProvince;
		private System.Windows.Forms.RadioButton fMale;
		private System.Windows.Forms.RadioButton fFemale;
		private System.Windows.Forms.TextBox fPostcode;
		private System.Windows.Forms.TextBox fTelephone;
		private System.Windows.Forms.TextBox fEmail;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.Label lName;
		private System.Windows.Forms.Label lLastName;
		private System.Windows.Forms.Label lCardID;
		private System.Windows.Forms.GroupBox lSex;
		private System.Windows.Forms.Label lAge;
		private System.Windows.Forms.Label lAddress;
		private System.Windows.Forms.Label lProvince;
		private System.Windows.Forms.Label lPostcode;
		private System.Windows.Forms.Label lTelephone;
		private System.Windows.Forms.Label lEmail;
		private System.Windows.Forms.Button bReserv;
		private System.Windows.Forms.Button bCancel;
		
		
		public  ArrayList aTable;
		public  bool sucess;
		private System.Windows.Forms.Label lTableNumber;
		private System.Windows.Forms.Label lDiscription1;
		private System.Windows.Forms.Label lDiscription2;
		private System.Windows.Forms.Label label1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private int numberOfTable;
		private int key;	// 1 is makeReservation
							// 2 is editReservation
		private int reservID;
		public reservForm()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			fInterval.Items.Add(30);
			fInterval.Items.Add(60);
			fInterval.Items.Add(120);
			fInterval.Items.Add(150);
			fInterval.Items.Add(180);
			fInterval.Items.Add(240);
		//	fInterval.Items.Add("ทั้งวัน");
			fInterval.SelectedIndex = 0;
			aTable = new ArrayList();
			numberOfTable = 0;
			key = 0;
			reservID = 0;
			sucess = false;
		}
		
		public reservForm(int n,int id)
		{
			InitializeComponent();
			fInterval.Items.Add(30);
			fInterval.Items.Add(60);
			fInterval.Items.Add(120);
			fInterval.Items.Add(150);
			fInterval.Items.Add(180);
			fInterval.Items.Add(240);
			//	fInterval.Items.Add("ทั้งวัน");
			fInterval.SelectedIndex = 0;
			
			aTable = new ArrayList();
			numberOfTable = 0;
			key = n;
			reservID = id;
			sucess = false;
		}
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
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
			this.fDate = new System.Windows.Forms.DateTimePicker();
			this.fTime = new System.Windows.Forms.DateTimePicker();
			this.fCovers = new System.Windows.Forms.TextBox();
			this.fInterval = new System.Windows.Forms.ComboBox();
			this.lDate = new System.Windows.Forms.Label();
			this.lTime = new System.Windows.Forms.Label();
			this.lCovers = new System.Windows.Forms.Label();
			this.lInterval = new System.Windows.Forms.Label();
			this.bCheck = new System.Windows.Forms.Button();
			this.fName = new System.Windows.Forms.TextBox();
			this.fLastName = new System.Windows.Forms.TextBox();
			this.fCardID = new System.Windows.Forms.TextBox();
			this.fAge = new System.Windows.Forms.TextBox();
			this.fAddress = new System.Windows.Forms.TextBox();
			this.fProvince = new System.Windows.Forms.TextBox();
			this.lName = new System.Windows.Forms.Label();
			this.lLastName = new System.Windows.Forms.Label();
			this.lCardID = new System.Windows.Forms.Label();
			this.lSex = new System.Windows.Forms.GroupBox();
			this.fFemale = new System.Windows.Forms.RadioButton();
			this.fMale = new System.Windows.Forms.RadioButton();
			this.lAge = new System.Windows.Forms.Label();
			this.lAddress = new System.Windows.Forms.Label();
			this.lProvince = new System.Windows.Forms.Label();
			this.lPostcode = new System.Windows.Forms.Label();
			this.lTelephone = new System.Windows.Forms.Label();
			this.lEmail = new System.Windows.Forms.Label();
			this.fPostcode = new System.Windows.Forms.TextBox();
			this.fTelephone = new System.Windows.Forms.TextBox();
			this.fEmail = new System.Windows.Forms.TextBox();
			this.label10 = new System.Windows.Forms.Label();
			this.bReserv = new System.Windows.Forms.Button();
			this.bCancel = new System.Windows.Forms.Button();
			this.lTableNumber = new System.Windows.Forms.Label();
			this.lDiscription1 = new System.Windows.Forms.Label();
			this.lDiscription2 = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.lSex.SuspendLayout();
			this.SuspendLayout();
			// 
			// fDate
			// 
			this.fDate.Format = System.Windows.Forms.DateTimePickerFormat.Short;
			this.fDate.Location = new System.Drawing.Point(144, 56);
			this.fDate.Name = "fDate";
			this.fDate.Size = new System.Drawing.Size(96, 20);
			this.fDate.TabIndex = 0;
			// 
			// fTime
			// 
			this.fTime.Format = System.Windows.Forms.DateTimePickerFormat.Time;
			this.fTime.Location = new System.Drawing.Point(144, 96);
			this.fTime.Name = "fTime";
			this.fTime.ShowUpDown = true;
			this.fTime.Size = new System.Drawing.Size(96, 20);
			this.fTime.TabIndex = 1;
			this.fTime.Value = new System.DateTime(2005, 12, 29, 21, 28, 0, 0);
			// 
			// fCovers
			// 
			this.fCovers.Location = new System.Drawing.Point(144, 176);
			this.fCovers.Name = "fCovers";
			this.fCovers.Size = new System.Drawing.Size(96, 20);
			this.fCovers.TabIndex = 2;
			this.fCovers.Text = "";
			// 
			// fInterval
			// 
			this.fInterval.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.fInterval.Location = new System.Drawing.Point(144, 136);
			this.fInterval.Name = "fInterval";
			this.fInterval.Size = new System.Drawing.Size(96, 21);
			this.fInterval.TabIndex = 3;
			// 
			// lDate
			// 
			this.lDate.Location = new System.Drawing.Point(56, 56);
			this.lDate.Name = "lDate";
			this.lDate.Size = new System.Drawing.Size(56, 23);
			this.lDate.TabIndex = 4;
			this.lDate.Text = "วันที่จอง";
			// 
			// lTime
			// 
			this.lTime.Location = new System.Drawing.Point(56, 96);
			this.lTime.Name = "lTime";
			this.lTime.Size = new System.Drawing.Size(56, 23);
			this.lTime.TabIndex = 5;
			this.lTime.Text = "เวลาที่จอง";
			// 
			// lCovers
			// 
			this.lCovers.Location = new System.Drawing.Point(56, 176);
			this.lCovers.Name = "lCovers";
			this.lCovers.Size = new System.Drawing.Size(56, 23);
			this.lCovers.TabIndex = 6;
			this.lCovers.Text = "จำนวนที่นั่ง";
			// 
			// lInterval
			// 
			this.lInterval.Location = new System.Drawing.Point(56, 136);
			this.lInterval.Name = "lInterval";
			this.lInterval.Size = new System.Drawing.Size(64, 23);
			this.lInterval.TabIndex = 7;
			this.lInterval.Text = "เป็นระยะเวลา";
			// 
			// bCheck
			// 
			this.bCheck.Location = new System.Drawing.Point(400, 176);
			this.bCheck.Name = "bCheck";
			this.bCheck.TabIndex = 9;
			this.bCheck.Text = "เลือกที่นั่ง";
			this.bCheck.Click += new System.EventHandler(this.bCheck_Click);
			// 
			// fName
			// 
			this.fName.Location = new System.Drawing.Point(144, 272);
			this.fName.Name = "fName";
			this.fName.TabIndex = 10;
			this.fName.Text = "";
			this.fName.Visible = false;
			// 
			// fLastName
			// 
			this.fLastName.Location = new System.Drawing.Point(336, 272);
			this.fLastName.Name = "fLastName";
			this.fLastName.TabIndex = 11;
			this.fLastName.Text = "";
			this.fLastName.Visible = false;
			// 
			// fCardID
			// 
			this.fCardID.Location = new System.Drawing.Point(144, 304);
			this.fCardID.MaxLength = 13;
			this.fCardID.Name = "fCardID";
			this.fCardID.TabIndex = 12;
			this.fCardID.Text = "";
			this.fCardID.Visible = false;
			// 
			// fAge
			// 
			this.fAge.Location = new System.Drawing.Point(144, 336);
			this.fAge.Name = "fAge";
			this.fAge.Size = new System.Drawing.Size(56, 20);
			this.fAge.TabIndex = 13;
			this.fAge.Text = "";
			this.fAge.Visible = false;
			// 
			// fAddress
			// 
			this.fAddress.Location = new System.Drawing.Point(144, 368);
			this.fAddress.Name = "fAddress";
			this.fAddress.Size = new System.Drawing.Size(296, 20);
			this.fAddress.TabIndex = 14;
			this.fAddress.Text = "";
			this.fAddress.Visible = false;
			// 
			// fProvince
			// 
			this.fProvince.Location = new System.Drawing.Point(144, 400);
			this.fProvince.Name = "fProvince";
			this.fProvince.TabIndex = 15;
			this.fProvince.Text = "";
			this.fProvince.Visible = false;
			// 
			// lName
			// 
			this.lName.Location = new System.Drawing.Point(56, 272);
			this.lName.Name = "lName";
			this.lName.Size = new System.Drawing.Size(48, 23);
			this.lName.TabIndex = 16;
			this.lName.Text = "ชื่อ";
			this.lName.Visible = false;
			// 
			// lLastName
			// 
			this.lLastName.Location = new System.Drawing.Point(264, 272);
			this.lLastName.Name = "lLastName";
			this.lLastName.Size = new System.Drawing.Size(48, 23);
			this.lLastName.TabIndex = 17;
			this.lLastName.Text = "นามสกุล";
			this.lLastName.Visible = false;
			// 
			// lCardID
			// 
			this.lCardID.Location = new System.Drawing.Point(56, 304);
			this.lCardID.Name = "lCardID";
			this.lCardID.Size = new System.Drawing.Size(64, 23);
			this.lCardID.TabIndex = 18;
			this.lCardID.Text = "รหัสประจำตัว";
			this.lCardID.Visible = false;
			// 
			// lSex
			// 
			this.lSex.Controls.Add(this.fFemale);
			this.lSex.Controls.Add(this.fMale);
			this.lSex.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
			this.lSex.Location = new System.Drawing.Point(264, 304);
			this.lSex.Name = "lSex";
			this.lSex.Size = new System.Drawing.Size(176, 48);
			this.lSex.TabIndex = 20;
			this.lSex.TabStop = false;
			this.lSex.Text = "เพศ";
			this.lSex.Visible = false;
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
			// lAge
			// 
			this.lAge.Location = new System.Drawing.Point(56, 336);
			this.lAge.Name = "lAge";
			this.lAge.Size = new System.Drawing.Size(48, 23);
			this.lAge.TabIndex = 21;
			this.lAge.Text = "อายุ";
			this.lAge.Visible = false;
			// 
			// lAddress
			// 
			this.lAddress.Location = new System.Drawing.Point(56, 368);
			this.lAddress.Name = "lAddress";
			this.lAddress.Size = new System.Drawing.Size(48, 23);
			this.lAddress.TabIndex = 22;
			this.lAddress.Text = "ที่อยู่";
			this.lAddress.Visible = false;
			// 
			// lProvince
			// 
			this.lProvince.Location = new System.Drawing.Point(56, 400);
			this.lProvince.Name = "lProvince";
			this.lProvince.Size = new System.Drawing.Size(48, 23);
			this.lProvince.TabIndex = 23;
			this.lProvince.Text = "จังหวัด";
			this.lProvince.Visible = false;
			// 
			// lPostcode
			// 
			this.lPostcode.Location = new System.Drawing.Point(56, 432);
			this.lPostcode.Name = "lPostcode";
			this.lPostcode.Size = new System.Drawing.Size(72, 23);
			this.lPostcode.TabIndex = 24;
			this.lPostcode.Text = "รหัสไปรษณีย์";
			this.lPostcode.Visible = false;
			// 
			// lTelephone
			// 
			this.lTelephone.Location = new System.Drawing.Point(56, 464);
			this.lTelephone.Name = "lTelephone";
			this.lTelephone.Size = new System.Drawing.Size(48, 23);
			this.lTelephone.TabIndex = 25;
			this.lTelephone.Text = "โทรศัพท์";
			this.lTelephone.Visible = false;
			// 
			// lEmail
			// 
			this.lEmail.Location = new System.Drawing.Point(56, 496);
			this.lEmail.Name = "lEmail";
			this.lEmail.Size = new System.Drawing.Size(48, 23);
			this.lEmail.TabIndex = 26;
			this.lEmail.Text = "อีเมลล์";
			this.lEmail.Visible = false;
			// 
			// fPostcode
			// 
			this.fPostcode.Location = new System.Drawing.Point(144, 432);
			this.fPostcode.Name = "fPostcode";
			this.fPostcode.TabIndex = 27;
			this.fPostcode.Text = "";
			this.fPostcode.Visible = false;
			// 
			// fTelephone
			// 
			this.fTelephone.Location = new System.Drawing.Point(144, 464);
			this.fTelephone.Name = "fTelephone";
			this.fTelephone.TabIndex = 28;
			this.fTelephone.Text = "";
			this.fTelephone.Visible = false;
			// 
			// fEmail
			// 
			this.fEmail.Location = new System.Drawing.Point(144, 496);
			this.fEmail.Name = "fEmail";
			this.fEmail.TabIndex = 29;
			this.fEmail.Text = "";
			this.fEmail.Visible = false;
			// 
			// label10
			// 
			this.label10.Location = new System.Drawing.Point(256, 136);
			this.label10.Name = "label10";
			this.label10.Size = new System.Drawing.Size(48, 23);
			this.label10.TabIndex = 30;
			this.label10.Text = "นาที";
			// 
			// bReserv
			// 
			this.bReserv.Enabled = false;
			this.bReserv.Location = new System.Drawing.Point(144, 536);
			this.bReserv.Name = "bReserv";
			this.bReserv.TabIndex = 31;
			this.bReserv.Text = "ทำการจอง";
			this.bReserv.Click += new System.EventHandler(this.bReserv_Click);
			// 
			// bCancel
			// 
			this.bCancel.Location = new System.Drawing.Point(304, 536);
			this.bCancel.Name = "bCancel";
			this.bCancel.TabIndex = 32;
			this.bCancel.Text = "ยกเลิก";
			this.bCancel.Click += new System.EventHandler(this.bCancel_Click);
			// 
			// lTableNumber
			// 
			this.lTableNumber.Location = new System.Drawing.Point(56, 232);
			this.lTableNumber.Name = "lTableNumber";
			this.lTableNumber.Size = new System.Drawing.Size(344, 23);
			this.lTableNumber.TabIndex = 33;
			this.lTableNumber.Text = "หมายเลขโต๊ะ";
			this.lTableNumber.Visible = false;
			// 
			// lDiscription1
			// 
			this.lDiscription1.Location = new System.Drawing.Point(256, 464);
			this.lDiscription1.Name = "lDiscription1";
			this.lDiscription1.Size = new System.Drawing.Size(208, 23);
			this.lDiscription1.TabIndex = 34;
			this.lDiscription1.Text = "ถ้าไม่มีกรุณากรอกเครื่องหมาย \" - \" แทน";
			this.lDiscription1.Visible = false;
			// 
			// lDiscription2
			// 
			this.lDiscription2.Location = new System.Drawing.Point(256, 496);
			this.lDiscription2.Name = "lDiscription2";
			this.lDiscription2.Size = new System.Drawing.Size(208, 23);
			this.lDiscription2.TabIndex = 35;
			this.lDiscription2.Text = "ถ้าไม่มีกรุณากรอกเครื่องหมาย \" - \" แทน";
			this.lDiscription2.Visible = false;
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.Location = new System.Drawing.Point(176, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(216, 24);
			this.label1.TabIndex = 36;
			this.label1.Text = "กรอกข้อมูลในการจองที่นั่ง";
			// 
			// reservForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(192)), ((System.Byte)(255)));
			this.ClientSize = new System.Drawing.Size(584, 566);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.lDiscription2);
			this.Controls.Add(this.lDiscription1);
			this.Controls.Add(this.lTableNumber);
			this.Controls.Add(this.bCancel);
			this.Controls.Add(this.bReserv);
			this.Controls.Add(this.label10);
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
			this.Controls.Add(this.bCheck);
			this.Controls.Add(this.lInterval);
			this.Controls.Add(this.lCovers);
			this.Controls.Add(this.lTime);
			this.Controls.Add(this.lDate);
			this.Controls.Add(this.fInterval);
			this.Controls.Add(this.fCovers);
			this.Controls.Add(this.fTime);
			this.Controls.Add(this.fDate);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "reservForm";
			this.Text = "จองที่นั่งร้านอาหาร";
			this.Load += new System.EventHandler(this.Form1_Load);
			this.lSex.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new mainForm());
		}

		private void bCheck_Click(object sender, System.EventArgs e)
		{
						
			
			//Convert Date(of Windows Form) to String for checkReserv(string begin,string end)
			DateTime dateBegin = fDate.Value.Date;
			dateBegin = dateBegin.Add(fTime.Value.TimeOfDay);

			DateTime dateEnd = dateBegin.AddMinutes(Convert.ToInt16(fInterval.Text));
			string beginTime = dateBegin.ToShortDateString()+ " " +dateBegin.ToShortTimeString();
			string endTime = dateEnd.ToShortDateString() +" " +dateEnd.ToShortTimeString();
			//MessageBox.Show("beginTime : " + beginTime + "\nendTime : " + endTime);
			//bool checkTable = false;
			ArrayList reservList = new ArrayList();
			ArrayList tableList = new ArrayList();
			if(!fCovers.Text.Equals(""))
			{
				try
				{
					int number = Convert.ToInt16(fCovers.Text);
			
					reservationDA.initialize();
					reservList = reservationDA.checkReserv(beginTime,endTime);
					reservationDA.terminate();
					if(reservList.Count!=0)
					{
						
						tableDA.initialize();
						aTable = tableDA.checkReserv1(reservList,Convert.ToInt32(fCovers.Text));
						tableDA.terminate();
						viewTable tableForm  = new viewTable(aTable);
						tableForm.ShowDialog();
						numberOfTable = tableForm.tableID;
						
					}
					else
					{
						
						tableDA.initialize();
						aTable = tableDA.checkReserv2(reservList,Convert.ToInt32(fCovers.Text));
						tableDA.terminate();
						viewTable tableForm  = new viewTable(aTable);
						tableForm.ShowDialog();
						numberOfTable = tableForm.tableID;
					}
					if(numberOfTable!=0)	// เลือกโต๊ะสำเร็จ Select Table Complete
					{
						lTableNumber.Text = "ท่านได้จองโต๊ะหมายเลข : " + numberOfTable;

						lName.Visible = true;		fName.Visible = true;
						lCardID.Visible = true;		fCardID.Visible = true;
						lLastName.Visible = true;	fLastName.Visible = true;
						lAge.Visible = true;		fAge.Visible = true;
						lSex.Visible = true;		fAddress.Visible = true;
						lAddress.Visible = true;	fProvince.Visible = true;
						lProvince.Visible = true;	fPostcode.Visible = true;
						lTelephone.Visible = true;  fTelephone.Visible = true;
						lPostcode.Visible = true;	fEmail.Visible = true;
						lEmail.Visible = true;
						lTableNumber.Visible = true;
						
						lDiscription1.Visible = true;
						lDiscription2.Visible = true;
						bReserv.Enabled = true;
					
					}
				}
				catch(Exception ee)
				{
					string ex = ee.ToString();
				}
				
			}
			else { MessageBox.Show("กรุณากรอกจำนวนที่นั่งในการจองด้วยค่ะ","ท่านกรอกข้อมูลไม่ครบ");}
			
		}

		private void bReserv_Click(object sender, System.EventArgs e)
		{
			DateTime dateBegin = fDate.Value.Date;
			dateBegin = dateBegin.Add(fTime.Value.TimeOfDay);

			DateTime dateEnd = dateBegin.AddMinutes(Convert.ToInt16(fInterval.Text));
			string reservTime = dateBegin.ToShortDateString()+ " " +dateBegin.ToShortTimeString();
			string endTime = dateEnd.ToShortDateString() +" " +dateEnd.ToShortTimeString();

			DateTime dNow = DateTime.Now;
			string sNow;
			sNow = dNow.ToShortDateString()+ " " +dNow.ToShortTimeString();
			bool sex;
			if(fMale.Checked)
				sex = true;
			else sex = false;
			bool bError = true;	// true is all data Correct
								// false is data inCorrect
			string sError = "กรุณากรอกข้อมูลดังต่อไปนี้ให้ครบด้วยค่ะ";
			if(fName.Text.Equals(""))
			{
				bError = false;
				sError += "\nชื่อ ";
			}
			if(fLastName.Text.Equals(""))
			{
				bError = false;
				sError += "\nนามสกุล ";
			}
			if(fCardID.Text.Equals(""))
			{
				bError = false;
				sError += "\nรหัสประจำตัวประชาชน ";
			}
			
			if(fAddress.Text.Equals(""))
			{
				bError = false;
				sError += "\nที่อยู่ ";
			}
			if(fProvince.Text.Equals(""))
			{
				bError = false;
				sError += "\nจังหวัด ";
			}
			if(fTelephone.Text.Equals(""))
			{
				bError = false;
				sError += "\nเบอร์โทรศัพท์ ";
			}
			if(fEmail.Text.Equals(""))
			{
				bError = false;
				sError += "\nอีเมลล์ ";
			}
			if(fAge.Text.Equals(""))
			{
				bError = false;
				sError += "\nอายุ ";
			}
			else
			{
				try
				{
					int iAge = Convert.ToInt32(fAge.Text);
				}
				catch(Exception ee)
				{
					string ex = ee.ToString();
					bError = false;
					sError = "กรุณากรอกตัวเลขอายุให้ถูกต้องด้วยค่ะ";
					
				}
			}
			if(bError)
			{
				reservationDA.initialize();
				if(key==1) // is makeReservation
				{
					if(reservationDA.makeReservation(sNow,
						reservTime,
						endTime,
						Convert.ToInt32(fCovers.Text),
						fCardID.Text,
						fName.Text,
						fLastName.Text,
						Convert.ToInt32(fAge.Text),
						sex,
						fAddress.Text,
						fProvince.Text,
						fPostcode.Text,
						fTelephone.Text,
						fEmail.Text,
						1,
						numberOfTable,
						"ป้าดา"))
					{
						MessageBox.Show("จองที่นั่งเรียบร้อยแล้ว","สถานะการจอง");
						sucess = true;
						this.Close();
					}
					else MessageBox.Show("เกิดเหตุขัดข้องในการจอง","แจ้งข้อผิดพลาด");
				}
				else	// editReservation
				{
					if(reservationDA.editReservation(reservID,numberOfTable,sNow,reservTime,endTime))
					{
						MessageBox.Show("แก้ไขการจองเรียบร้อย","สถานะการจอง");
						sucess = true;
						this.Close();
					}	
					else MessageBox.Show("เกิดเหตุขัดข้องในการแก้ไขการจอง","แจ้งข้อผิดพลาด");
				}
				reservationDA.terminate();
				
			}
			else
			{
				MessageBox.Show(sError,"ข้อมูลไม่ครบถ้วน หรือ ผิดพลาด ......... กรุณาตรวจสอบด้วยค่ะ");
			}
			
			/*
			MessageBox.Show("useTime : " + sNow +
							"\nreservTime : " + reservTime +
							"\nendTime : " + endTime +
							"\ncardID : " + fCardID.Text +
							"\nname : " + fName.Text +
							"\nlastname : " + fLastName.Text +
							"\nage : " + fAge.Text +
							"\nsex : " + sex +
							"\naddress : " + fAddress.Text +
							"\nprovince : " + fProvince.Text +
							"\ntelephone : " + fTelephone.Text +
							"\nemail : " + fEmail.Text);
			*/
				
		}

		private void bCancel_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{
			if(key==2)
			{
				reservationDA.initialize();
				reservation reserv = reservationDA.find(reservID);
				reservationDA.terminate();
				//=======================================================================
				// ทำการตัด string เพื่อจัดการเกี่ยวกับเรื่องของเวลาใน Form 
				//=======================================================================
				string reservTime = reserv.getReservTime();
				string endTime = reserv.getEndTime();
				DateTime d1 = Convert.ToDateTime(reservTime);
				DateTime d2 = Convert.ToDateTime(endTime);
				fDate.Value = d1;
				fTime.Value = d1;
				TimeSpan t1 = d2.Subtract(d1);
				fInterval.SelectedItem = (int)t1.TotalMinutes;
				
				//=======================================================================
				customerDA.initialize();
				customer cus = customerDA.find(reserv.getName().Trim(),reserv.getLastName().Trim());
				customerDA.terminate();
				tableDA.initialize();
				table t = tableDA.find(reserv.getTableID());
				tableDA.terminate();
				
				fCovers.Text = t.getCovers().ToString();
				fName.Text = cus.getName().Trim();;
				fLastName.Text = cus.getLastName().Trim();;
				fCardID.Text = cus.getCardID();
				fAge.Text = cus.getAge().ToString();
				fAddress.Text = cus.getAddress().Trim();
				fProvince.Text = cus.getProvince().Trim();
				fPostcode.Text = cus.getPostCode();
				fTelephone.Text = cus.getTelephone().Trim();
				fEmail.Text = cus.getEmail().Trim();
				
				if(cus.getSex())
					fMale.Checked = true;
				else fFemale.Checked = true;
				numberOfTable = t.getTableID();
				lTableNumber.Text = "ท่านได้จองโต๊ะหมายเลข : " + numberOfTable;

				lName.Visible = true;		fName.Visible = true;
				lCardID.Visible = true;		fCardID.Visible = true;
				lLastName.Visible = true;	fLastName.Visible = true;
				lAge.Visible = true;		fAge.Visible = true;
				lSex.Visible = true;		fAddress.Visible = true;
				lAddress.Visible = true;	fProvince.Visible = true;
				lProvince.Visible = true;	fPostcode.Visible = true;
				lTelephone.Visible = true;  fTelephone.Visible = true;
				lPostcode.Visible = true;	fEmail.Visible = true;
				lEmail.Visible = true;
				lTableNumber.Visible = true;
				
				lSex.Enabled = false;
				fName.ReadOnly = true;
				fCardID.ReadOnly = true;
				fLastName.ReadOnly = true;
				fAge.ReadOnly = true;
				fAddress.ReadOnly = true;
				fProvince.ReadOnly = true;
				fPostcode.ReadOnly = true;
				fTelephone.ReadOnly = true;
				fEmail.ReadOnly = true;
				
				
				lDiscription1.Visible = true;
				lDiscription2.Visible = true;
				bReserv.Enabled = true;
			}
		}
	}
}
