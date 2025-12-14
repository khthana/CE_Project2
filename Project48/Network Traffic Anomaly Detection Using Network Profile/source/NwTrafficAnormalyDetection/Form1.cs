using System;
using System.Threading;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using Org.Snmp.Snmp_pp;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Data.OleDb;
using System.Diagnostics;


namespace Org.Snmp.Snmp_pp
{
		/// <summary>
		/// Summary description for Form1.
		/// </summary>
	
	public class Form1 : System.Windows.Forms.Form
	{
		#region variable form
		private System.Windows.Forms.TextBox txt_ip;
		private System.Windows.Forms.TextBox txt_community;
		private System.Windows.Forms.TextBox txt_output;
		private System.Windows.Forms.TextBox txt_oid;
		private System.Windows.Forms.Button btn_getNext;
		private System.Windows.Forms.Button btn_init;
		private System.Windows.Forms.TextBox txt_dbUser;
		private System.Windows.Forms.TextBox txt_dbPasswd;
		private System.Windows.Forms.Label lbl_deviceIP;
		private System.Windows.Forms.Label lbl_community;
		private System.Windows.Forms.Label lbl_dbserverIP;
		private System.Windows.Forms.Label lbl_dbuser;
		private System.Windows.Forms.Label lbl_dbpasswd;
		private System.Windows.Forms.TextBox txt_dbIP;
		private int counter;					//แสดง จำนวน วินาทีที่เหลืออยู่
		private Snmpi snmpi;
		private DbConnect connector;
		private DbConnect Norm_connector;
		private DbConnect Observe_connector;
		private DbConnect Alert_connector;
		private string[,] ifNo;
		private int sizeof_ifNo;
		private System.Windows.Forms.TabControl tabControl1;
		private System.Windows.Forms.TabPage t_Display;
		private System.Windows.Forms.TabPage t_Setting;
		private System.Windows.Forms.Button btn_collect;
		private System.Timers.Timer timer_5Min;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.MenuItem menuItem1;
		private System.Windows.Forms.MenuItem menuItem2;
		private System.Windows.Forms.TextBox txt_counter;
		private System.Windows.Forms.Button test;
		private System.Windows.Forms.TextBox show;
		private System.ComponentModel.Container components = null;
		#endregion
		//----------------stat variable------------------//
		private MyStat [] Observe;		// เก็บ stat ทุก interfaceของ observe
		private MyStat [] Norm;		// เก็บ stat ทุก interfaceของ norm
		private MyStat mee = new MyStat();
		private const int norm_length_array = 48;
		private const int observe_length_array = 12;
		private const int No_var = 14;

		//-----------------chart variable----------------//
		private System.Windows.Forms.Button MDI;
		private System.Windows.Forms.TabPage t_chart;
		private System.Windows.Forms.CheckedListBox Int_List;
		private System.Windows.Forms.CheckedListBox Var_List;
		private System.Windows.Forms.CheckedListBox Group_List;
		private Chart_view  [] chi_chart ;
		private Chart_view [] Interface_chart;
		private bool is_show = false;
			
		//-----------------list choose------------------
		//bool init = false;
		bool [] Var_choose = new bool[14];
		private System.Windows.Forms.Panel chart_panel;
		private System.Windows.Forms.Button btn_Update;
		private System.Windows.Forms.PictureBox pictureBox1;
		bool [] Int_choose ;
		bool [] Group_choose = new bool[3];	
		//------------------DB theard---------------------------
		Thread th_calculate;
		bool passed = false;			//ใช้ใน function toDB เป็น flag ตรวจสอบว่าเป็นครั้งแรกหรือไม่(เก็บค่า Diff ครั้งแรกจึงยังไม่เอา)
		bool Rpassed = false;			//ใช้ใน function Cut_Rdata เป็น flag ตรวจสอบว่าเป็นครั้งแรกหรือไม่(เก็บค่า Diff ครั้งแรกจึงยังไม่เอา)
		string recv_data;
		bool function = false;
		string stringdata;				//ใช้สร้าง string เพ่อ ใช้ในการ update string ลง DB
		//------------------Group Chi_square ---------------------------
		int Observe_counter = 0;		//เป็นตัวนับข้อมูลใน observe ว่ามีข้อมูลใน array เท่าไหร่
		private Chart_view  [] Group_Chi_chart ;
		private Chart_view  [] Group_Chi_chart1 ;
		private Chart_view  [] Group_Chi_chart2 ;
		private MyStat [] Group_Observe;		// เก็บ stat ทุก interfaceของ observe
		private MyStat [] Group_Norm;		// เก็บ stat ทุก interfaceของ norm
		private double [] Admin_Chi_square;
		private double [] Admin_Chi_square1;
		private double [] Admin_Chi_square2;
		//-------keep diff value from router------------------//
		private ulong[,] multiplier;
		private ulong[,] ovalue;
		ulong obuffer;
		// จัดรูปแบบ
		private System.Windows.Forms.Panel panel_chart;
		private System.Windows.Forms.Panel panel_display;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		
		private System.Windows.Forms.Label label_Interface_List;
		private System.Windows.Forms.Label label_Group_List;
		private System.Windows.Forms.Label label_List_Parameter;
		private System.Windows.Forms.RadioButton radioButton1;
		private System.Windows.Forms.RadioButton radioButton2;
		private System.Windows.Forms.GroupBox Groupbox;
		private System.Windows.Forms.TabPage t_Admin;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.TextBox Admin_chi_box1;
		private System.Windows.Forms.TextBox Admin_chi_box2;
		private System.Windows.Forms.Button btn_assign;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox Alert_box;
		private System.Windows.Forms.ListBox Int_chi;
		private System.Windows.Forms.TextBox Admin_chi_box;
		private System.Windows.Forms.Panel Admin_panel;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Button btn_show;
		private System.Windows.Forms.Label L_status;
		ulong max = 4294967295;
		
		
		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			
			
			InitializeComponent();

			//prepare step control user
			panel_chart.Enabled = false;
			panel_display.Enabled = false;
			//#if	REQUIRES_CRT_INIT
			CRT.Auto.Initialize();
			//#endif
			counter = 0;
			//
			connector = new DbConnect(txt_dbIP.Text,txt_dbUser.Text,txt_dbPasswd.Text,"normal");
			try
			{
				connector.open();
			}
			catch(Exception e)
			{
				//ทำแบบนี้เพื่อให้โปรแกรมทำงานต่อไปได้ในกรณีการเปิดโปรแกรมใช้งานครั้งแรก มันจะไป open DB ซึ่งมันจะ error
			}
			//-------------------- init ค่าตัวแปร ที่ต้องการ จำนวน interface ---------------------------//
			if(connector.Can_open())		//ถ้า เปิด DB ได้(เคย init แล้ว)
			{
				btn_init.Visible = false;
				

				Snmpi mysnmpi = new Snmpi(txt_ip.Text,txt_community.Text,"1.3.6");
				mysnmpi.checkIfEtherUp();

				// special assign
				ifNo = mysnmpi.ifNo;
				sizeof_ifNo = mysnmpi.sizeof_ifNo;
			
				Observe = new MyStat[sizeof_ifNo];
				Norm = new MyStat[sizeof_ifNo];
				Interface_chart = new Snmp_pp.Chart_view [sizeof_ifNo];
				chi_chart = new Snmp_pp.Chart_view [sizeof_ifNo];
				Int_choose = new bool[sizeof_ifNo];	
				
				//-------------group chi_square--------------------//
				Group_Observe = new MyStat[sizeof_ifNo];		
				Group_Norm = new MyStat[sizeof_ifNo];			
				Group_Chi_chart = new Snmp_pp.Chart_view [sizeof_ifNo];
				Group_Chi_chart1 = new Snmp_pp.Chart_view [sizeof_ifNo];
				Group_Chi_chart2 = new Snmp_pp.Chart_view [sizeof_ifNo];
				Admin_Chi_square = new double[sizeof_ifNo];
				Admin_Chi_square1 = new double[sizeof_ifNo];
				Admin_Chi_square2 = new double[sizeof_ifNo];
				for(int kk =0;kk<sizeof_ifNo;kk++)
				{
					Group_Chi_chart[kk] = new Chart_view();
					Group_Chi_chart1[kk] = new Chart_view();
					Group_Chi_chart2[kk] = new Chart_view();
					Group_Observe[kk] = new MyStat();
					Group_Norm[kk] = new MyStat();
				}
				
				for(int i = 0;i<sizeof_ifNo;i++)
				{
					Observe[i] = new MyStat();
					Norm[i] = new MyStat();
					chi_chart[i] = new Chart_view(); 
					Interface_chart[i] = new Chart_view(); 
				}
				
			}
			else
			{
				//-----------กรณี ยังไม่เคยใช้มาก่อนเลยเพราะยัง	------------------------
				btn_Update.Visible = false;

			}
			connector.close();
			//=============================== จบการ init ============================================
		}

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
			Process.GetCurrentProcess().Kill();
		}

		#region Windows Form Designer generated code
		private void InitializeComponent()
		{
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(Form1));
			this.txt_ip = new System.Windows.Forms.TextBox();
			this.txt_community = new System.Windows.Forms.TextBox();
			this.txt_output = new System.Windows.Forms.TextBox();
			this.txt_oid = new System.Windows.Forms.TextBox();
			this.btn_getNext = new System.Windows.Forms.Button();
			this.btn_init = new System.Windows.Forms.Button();
			this.txt_dbUser = new System.Windows.Forms.TextBox();
			this.txt_dbPasswd = new System.Windows.Forms.TextBox();
			this.txt_dbIP = new System.Windows.Forms.TextBox();
			this.lbl_deviceIP = new System.Windows.Forms.Label();
			this.lbl_community = new System.Windows.Forms.Label();
			this.lbl_dbserverIP = new System.Windows.Forms.Label();
			this.lbl_dbuser = new System.Windows.Forms.Label();
			this.lbl_dbpasswd = new System.Windows.Forms.Label();
			this.tabControl1 = new System.Windows.Forms.TabControl();
			this.t_Setting = new System.Windows.Forms.TabPage();
			this.Groupbox = new System.Windows.Forms.GroupBox();
			this.radioButton2 = new System.Windows.Forms.RadioButton();
			this.radioButton1 = new System.Windows.Forms.RadioButton();
			this.btn_Update = new System.Windows.Forms.Button();
			this.txt_counter = new System.Windows.Forms.TextBox();
			this.btn_collect = new System.Windows.Forms.Button();
			this.t_Display = new System.Windows.Forms.TabPage();
			this.panel_display = new System.Windows.Forms.Panel();
			this.label2 = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.show = new System.Windows.Forms.TextBox();
			this.test = new System.Windows.Forms.Button();
			this.MDI = new System.Windows.Forms.Button();
			this.t_Admin = new System.Windows.Forms.TabPage();
			this.Admin_panel = new System.Windows.Forms.Panel();
			this.label7 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.Admin_chi_box1 = new System.Windows.Forms.TextBox();
			this.Admin_chi_box2 = new System.Windows.Forms.TextBox();
			this.btn_assign = new System.Windows.Forms.Button();
			this.label4 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.Alert_box = new System.Windows.Forms.TextBox();
			this.Int_chi = new System.Windows.Forms.ListBox();
			this.Admin_chi_box = new System.Windows.Forms.TextBox();
			this.t_chart = new System.Windows.Forms.TabPage();
			this.chart_panel = new System.Windows.Forms.Panel();
			this.panel_chart = new System.Windows.Forms.Panel();
			this.Group_List = new System.Windows.Forms.CheckedListBox();
			this.Var_List = new System.Windows.Forms.CheckedListBox();
			this.Int_List = new System.Windows.Forms.CheckedListBox();
			this.btn_show = new System.Windows.Forms.Button();
			this.label_Interface_List = new System.Windows.Forms.Label();
			this.label_Group_List = new System.Windows.Forms.Label();
			this.label_List_Parameter = new System.Windows.Forms.Label();
			this.timer_5Min = new System.Timers.Timer();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.menuItem1 = new System.Windows.Forms.MenuItem();
			this.menuItem2 = new System.Windows.Forms.MenuItem();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.L_status = new System.Windows.Forms.Label();
			this.tabControl1.SuspendLayout();
			this.t_Setting.SuspendLayout();
			this.Groupbox.SuspendLayout();
			this.t_Display.SuspendLayout();
			this.panel_display.SuspendLayout();
			this.t_Admin.SuspendLayout();
			this.Admin_panel.SuspendLayout();
			this.t_chart.SuspendLayout();
			this.chart_panel.SuspendLayout();
			this.panel_chart.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.timer_5Min)).BeginInit();
			this.SuspendLayout();
			// 
			// txt_ip
			// 
			this.txt_ip.Location = new System.Drawing.Point(120, 48);
			this.txt_ip.Name = "txt_ip";
			this.txt_ip.TabIndex = 0;
			this.txt_ip.Text = "161.246.66.254";
			// 
			// txt_community
			// 
			this.txt_community.Location = new System.Drawing.Point(320, 48);
			this.txt_community.Name = "txt_community";
			this.txt_community.TabIndex = 1;
			this.txt_community.Text = "cereadonly";
			// 
			// txt_output
			// 
			this.txt_output.Location = new System.Drawing.Point(72, 40);
			this.txt_output.Multiline = true;
			this.txt_output.Name = "txt_output";
			this.txt_output.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
			this.txt_output.Size = new System.Drawing.Size(320, 136);
			this.txt_output.TabIndex = 4;
			this.txt_output.Text = "";
			// 
			// txt_oid
			// 
			this.txt_oid.Location = new System.Drawing.Point(72, 8);
			this.txt_oid.Name = "txt_oid";
			this.txt_oid.Size = new System.Drawing.Size(320, 20);
			this.txt_oid.TabIndex = 5;
			this.txt_oid.Text = "1.3.6.1.2.1.16.1.1.1";
			// 
			// btn_getNext
			// 
			this.btn_getNext.Location = new System.Drawing.Point(72, 200);
			this.btn_getNext.Name = "btn_getNext";
			this.btn_getNext.TabIndex = 8;
			this.btn_getNext.Text = "getNext";
			this.btn_getNext.Click += new System.EventHandler(this.btn_getNext_Click);
			// 
			// btn_init
			// 
			this.btn_init.Location = new System.Drawing.Point(64, 184);
			this.btn_init.Name = "btn_init";
			this.btn_init.Size = new System.Drawing.Size(75, 24);
			this.btn_init.TabIndex = 9;
			this.btn_init.Text = "Intialization";
			this.btn_init.Click += new System.EventHandler(this.btn_init_Click);
			// 
			// txt_dbUser
			// 
			this.txt_dbUser.Location = new System.Drawing.Point(320, 96);
			this.txt_dbUser.Name = "txt_dbUser";
			this.txt_dbUser.TabIndex = 10;
			this.txt_dbUser.Text = "root";
			// 
			// txt_dbPasswd
			// 
			this.txt_dbPasswd.Location = new System.Drawing.Point(320, 136);
			this.txt_dbPasswd.Name = "txt_dbPasswd";
			this.txt_dbPasswd.TabIndex = 11;
			this.txt_dbPasswd.Text = "password";
			// 
			// txt_dbIP
			// 
			this.txt_dbIP.Location = new System.Drawing.Point(120, 96);
			this.txt_dbIP.Name = "txt_dbIP";
			this.txt_dbIP.TabIndex = 12;
			this.txt_dbIP.Text = "127.0.0.1";
			// 
			// lbl_deviceIP
			// 
			this.lbl_deviceIP.Location = new System.Drawing.Point(32, 48);
			this.lbl_deviceIP.Name = "lbl_deviceIP";
			this.lbl_deviceIP.Size = new System.Drawing.Size(64, 24);
			this.lbl_deviceIP.TabIndex = 13;
			this.lbl_deviceIP.Text = "Device IP :";
			// 
			// lbl_community
			// 
			this.lbl_community.Location = new System.Drawing.Point(240, 48);
			this.lbl_community.Name = "lbl_community";
			this.lbl_community.Size = new System.Drawing.Size(64, 24);
			this.lbl_community.TabIndex = 14;
			this.lbl_community.Text = "Community :";
			// 
			// lbl_dbserverIP
			// 
			this.lbl_dbserverIP.Location = new System.Drawing.Point(24, 96);
			this.lbl_dbserverIP.Name = "lbl_dbserverIP";
			this.lbl_dbserverIP.Size = new System.Drawing.Size(80, 24);
			this.lbl_dbserverIP.TabIndex = 15;
			this.lbl_dbserverIP.Text = "DB Server IP :";
			// 
			// lbl_dbuser
			// 
			this.lbl_dbuser.Location = new System.Drawing.Point(240, 96);
			this.lbl_dbuser.Name = "lbl_dbuser";
			this.lbl_dbuser.Size = new System.Drawing.Size(56, 24);
			this.lbl_dbuser.TabIndex = 16;
			this.lbl_dbuser.Text = "DB User :";
			// 
			// lbl_dbpasswd
			// 
			this.lbl_dbpasswd.Location = new System.Drawing.Point(232, 136);
			this.lbl_dbpasswd.Name = "lbl_dbpasswd";
			this.lbl_dbpasswd.Size = new System.Drawing.Size(80, 32);
			this.lbl_dbpasswd.TabIndex = 17;
			this.lbl_dbpasswd.Text = "DB Password :";
			// 
			// tabControl1
			// 
			this.tabControl1.Controls.Add(this.t_Setting);
			this.tabControl1.Controls.Add(this.t_Display);
			this.tabControl1.Controls.Add(this.t_Admin);
			this.tabControl1.Controls.Add(this.t_chart);
			this.tabControl1.Location = new System.Drawing.Point(0, 64);
			this.tabControl1.Name = "tabControl1";
			this.tabControl1.SelectedIndex = 0;
			this.tabControl1.Size = new System.Drawing.Size(512, 464);
			this.tabControl1.TabIndex = 18;
			this.tabControl1.Enter += new System.EventHandler(this.tabControl1_Enter);
			// 
			// t_Setting
			// 
			this.t_Setting.BackColor = System.Drawing.SystemColors.Control;
			this.t_Setting.Controls.Add(this.Groupbox);
			this.t_Setting.Controls.Add(this.btn_Update);
			this.t_Setting.Controls.Add(this.txt_counter);
			this.t_Setting.Controls.Add(this.btn_collect);
			this.t_Setting.Controls.Add(this.lbl_deviceIP);
			this.t_Setting.Controls.Add(this.lbl_dbserverIP);
			this.t_Setting.Controls.Add(this.lbl_dbuser);
			this.t_Setting.Controls.Add(this.lbl_dbpasswd);
			this.t_Setting.Controls.Add(this.btn_init);
			this.t_Setting.Controls.Add(this.lbl_community);
			this.t_Setting.Controls.Add(this.txt_ip);
			this.t_Setting.Controls.Add(this.txt_dbPasswd);
			this.t_Setting.Controls.Add(this.txt_dbIP);
			this.t_Setting.Controls.Add(this.txt_dbUser);
			this.t_Setting.Controls.Add(this.txt_community);
			this.t_Setting.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.t_Setting.ForeColor = System.Drawing.Color.Black;
			this.t_Setting.Location = new System.Drawing.Point(4, 22);
			this.t_Setting.Name = "t_Setting";
			this.t_Setting.Size = new System.Drawing.Size(504, 438);
			this.t_Setting.TabIndex = 1;
			this.t_Setting.Text = "Setting";
			// 
			// Groupbox
			// 
			this.Groupbox.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(255)), ((System.Byte)(224)), ((System.Byte)(192)));
			this.Groupbox.Controls.Add(this.radioButton2);
			this.Groupbox.Controls.Add(this.radioButton1);
			this.Groupbox.Enabled = false;
			this.Groupbox.ForeColor = System.Drawing.Color.Black;
			this.Groupbox.Location = new System.Drawing.Point(200, 224);
			this.Groupbox.Name = "Groupbox";
			this.Groupbox.Size = new System.Drawing.Size(224, 96);
			this.Groupbox.TabIndex = 23;
			this.Groupbox.TabStop = false;
			this.Groupbox.Text = "Option";
			// 
			// radioButton2
			// 
			this.radioButton2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.radioButton2.Location = new System.Drawing.Point(24, 48);
			this.radioButton2.Name = "radioButton2";
			this.radioButton2.Size = new System.Drawing.Size(168, 24);
			this.radioButton2.TabIndex = 23;
			this.radioButton2.Text = "Collect and Analyze";
			this.radioButton2.CheckedChanged += new System.EventHandler(this.radioButton2_CheckedChanged);
			// 
			// radioButton1
			// 
			this.radioButton1.Checked = true;
			this.radioButton1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.radioButton1.Location = new System.Drawing.Point(24, 16);
			this.radioButton1.Name = "radioButton1";
			this.radioButton1.Size = new System.Drawing.Size(136, 24);
			this.radioButton1.TabIndex = 22;
			this.radioButton1.TabStop = true;
			this.radioButton1.Text = "Collect data only";
			this.radioButton1.CheckedChanged += new System.EventHandler(this.radioButton1_CheckedChanged);
			// 
			// btn_Update
			// 
			this.btn_Update.Location = new System.Drawing.Point(64, 280);
			this.btn_Update.Name = "btn_Update";
			this.btn_Update.TabIndex = 20;
			this.btn_Update.Text = "Update";
			this.btn_Update.Click += new System.EventHandler(this.btn_Update_Click);
			// 
			// txt_counter
			// 
			this.txt_counter.Location = new System.Drawing.Point(336, 192);
			this.txt_counter.Name = "txt_counter";
			this.txt_counter.Size = new System.Drawing.Size(96, 20);
			this.txt_counter.TabIndex = 19;
			this.txt_counter.Text = "0";
			this.txt_counter.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			// 
			// btn_collect
			// 
			this.btn_collect.Enabled = false;
			this.btn_collect.Location = new System.Drawing.Point(64, 232);
			this.btn_collect.Name = "btn_collect";
			this.btn_collect.Size = new System.Drawing.Size(120, 23);
			this.btn_collect.TabIndex = 18;
			this.btn_collect.Text = "Start collect data";
			this.btn_collect.Click += new System.EventHandler(this.btn_collect_Click);
			// 
			// t_Display
			// 
			this.t_Display.Controls.Add(this.panel_display);
			this.t_Display.Location = new System.Drawing.Point(4, 22);
			this.t_Display.Name = "t_Display";
			this.t_Display.Size = new System.Drawing.Size(504, 438);
			this.t_Display.TabIndex = 0;
			this.t_Display.Text = "Display";
			// 
			// panel_display
			// 
			this.panel_display.Controls.Add(this.label2);
			this.panel_display.Controls.Add(this.label1);
			this.panel_display.Controls.Add(this.txt_output);
			this.panel_display.Controls.Add(this.txt_oid);
			this.panel_display.Controls.Add(this.btn_getNext);
			this.panel_display.Controls.Add(this.show);
			this.panel_display.Controls.Add(this.test);
			this.panel_display.Controls.Add(this.MDI);
			this.panel_display.Location = new System.Drawing.Point(0, 56);
			this.panel_display.Name = "panel_display";
			this.panel_display.Size = new System.Drawing.Size(488, 296);
			this.panel_display.TabIndex = 12;
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(16, 48);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(48, 23);
			this.label2.TabIndex = 10;
			this.label2.Text = "Output :";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(24, 12);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(32, 23);
			this.label1.TabIndex = 9;
			this.label1.Text = "OID :";
			// 
			// show
			// 
			this.show.Location = new System.Drawing.Point(224, 240);
			this.show.Name = "show";
			this.show.Size = new System.Drawing.Size(144, 20);
			this.show.TabIndex = 10;
			this.show.Text = "textBox1";
			this.show.Visible = false;
			// 
			// test
			// 
			this.test.Location = new System.Drawing.Point(224, 256);
			this.test.Name = "test";
			this.test.TabIndex = 9;
			this.test.Text = "test";
			this.test.Visible = false;
			this.test.Click += new System.EventHandler(this.test_Click);
			// 
			// MDI
			// 
			this.MDI.Location = new System.Drawing.Point(376, 256);
			this.MDI.Name = "MDI";
			this.MDI.TabIndex = 11;
			this.MDI.Text = "test MDI";
			this.MDI.Visible = false;
			this.MDI.Click += new System.EventHandler(this.MDI_Click);
			// 
			// t_Admin
			// 
			this.t_Admin.Controls.Add(this.Admin_panel);
			this.t_Admin.Location = new System.Drawing.Point(4, 22);
			this.t_Admin.Name = "t_Admin";
			this.t_Admin.Size = new System.Drawing.Size(504, 438);
			this.t_Admin.TabIndex = 3;
			this.t_Admin.Text = "Admin_setting";
			// 
			// Admin_panel
			// 
			this.Admin_panel.Controls.Add(this.label7);
			this.Admin_panel.Controls.Add(this.label6);
			this.Admin_panel.Controls.Add(this.label5);
			this.Admin_panel.Controls.Add(this.Admin_chi_box1);
			this.Admin_panel.Controls.Add(this.Admin_chi_box2);
			this.Admin_panel.Controls.Add(this.btn_assign);
			this.Admin_panel.Controls.Add(this.label4);
			this.Admin_panel.Controls.Add(this.label3);
			this.Admin_panel.Controls.Add(this.Alert_box);
			this.Admin_panel.Controls.Add(this.Int_chi);
			this.Admin_panel.Controls.Add(this.Admin_chi_box);
			this.Admin_panel.Enabled = false;
			this.Admin_panel.Location = new System.Drawing.Point(0, 24);
			this.Admin_panel.Name = "Admin_panel";
			this.Admin_panel.Size = new System.Drawing.Size(496, 368);
			this.Admin_panel.TabIndex = 0;
			// 
			// label7
			// 
			this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label7.Location = new System.Drawing.Point(40, 208);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(192, 23);
			this.label7.TabIndex = 10;
			this.label7.Text = "Alert Message Box:";
			// 
			// label6
			// 
			this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label6.Location = new System.Drawing.Point(32, 96);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(256, 23);
			this.label6.TabIndex = 9;
			this.label6.Text = "Chi_square Limit group Outpacket";
			// 
			// label5
			// 
			this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label5.Location = new System.Drawing.Point(32, 136);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(272, 23);
			this.label5.TabIndex = 8;
			this.label5.Text = "Chi_square Limit group etherpacket";
			// 
			// Admin_chi_box1
			// 
			this.Admin_chi_box1.Location = new System.Drawing.Point(320, 96);
			this.Admin_chi_box1.Name = "Admin_chi_box1";
			this.Admin_chi_box1.Size = new System.Drawing.Size(128, 20);
			this.Admin_chi_box1.TabIndex = 7;
			this.Admin_chi_box1.Text = "0";
			// 
			// Admin_chi_box2
			// 
			this.Admin_chi_box2.Location = new System.Drawing.Point(320, 136);
			this.Admin_chi_box2.Name = "Admin_chi_box2";
			this.Admin_chi_box2.Size = new System.Drawing.Size(128, 20);
			this.Admin_chi_box2.TabIndex = 6;
			this.Admin_chi_box2.Text = "0";
			// 
			// btn_assign
			// 
			this.btn_assign.Location = new System.Drawing.Point(216, 176);
			this.btn_assign.Name = "btn_assign";
			this.btn_assign.TabIndex = 5;
			this.btn_assign.Text = "assign value";
			this.btn_assign.Click += new System.EventHandler(this.btn_assign_Click);
			// 
			// label4
			// 
			this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label4.Location = new System.Drawing.Point(32, 64);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(248, 23);
			this.label4.TabIndex = 4;
			this.label4.Text = "Chi_square Limit group Inpacket";
			// 
			// label3
			// 
			this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label3.Location = new System.Drawing.Point(32, 24);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(176, 23);
			this.label3.TabIndex = 3;
			this.label3.Text = "Interface Number:";
			// 
			// Alert_box
			// 
			this.Alert_box.Location = new System.Drawing.Point(40, 240);
			this.Alert_box.Multiline = true;
			this.Alert_box.Name = "Alert_box";
			this.Alert_box.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
			this.Alert_box.Size = new System.Drawing.Size(408, 128);
			this.Alert_box.TabIndex = 2;
			this.Alert_box.Text = "";
			// 
			// Int_chi
			// 
			this.Int_chi.Location = new System.Drawing.Point(216, 16);
			this.Int_chi.Name = "Int_chi";
			this.Int_chi.Size = new System.Drawing.Size(48, 30);
			this.Int_chi.TabIndex = 1;
			// 
			// Admin_chi_box
			// 
			this.Admin_chi_box.Location = new System.Drawing.Point(320, 64);
			this.Admin_chi_box.Name = "Admin_chi_box";
			this.Admin_chi_box.Size = new System.Drawing.Size(128, 20);
			this.Admin_chi_box.TabIndex = 0;
			this.Admin_chi_box.Text = "0";
			// 
			// t_chart
			// 
			this.t_chart.Controls.Add(this.chart_panel);
			this.t_chart.Location = new System.Drawing.Point(4, 22);
			this.t_chart.Name = "t_chart";
			this.t_chart.Size = new System.Drawing.Size(504, 438);
			this.t_chart.TabIndex = 2;
			this.t_chart.Text = "Graph";
			// 
			// chart_panel
			// 
			this.chart_panel.Controls.Add(this.panel_chart);
			this.chart_panel.Location = new System.Drawing.Point(0, 8);
			this.chart_panel.Name = "chart_panel";
			this.chart_panel.Size = new System.Drawing.Size(488, 384);
			this.chart_panel.TabIndex = 3;
			// 
			// panel_chart
			// 
			this.panel_chart.Controls.Add(this.Group_List);
			this.panel_chart.Controls.Add(this.Var_List);
			this.panel_chart.Controls.Add(this.Int_List);
			this.panel_chart.Controls.Add(this.btn_show);
			this.panel_chart.Controls.Add(this.label_Interface_List);
			this.panel_chart.Controls.Add(this.label_Group_List);
			this.panel_chart.Controls.Add(this.label_List_Parameter);
			this.panel_chart.Location = new System.Drawing.Point(0, 24);
			this.panel_chart.Name = "panel_chart";
			this.panel_chart.Size = new System.Drawing.Size(472, 344);
			this.panel_chart.TabIndex = 4;
			// 
			// Group_List
			// 
			this.Group_List.Items.AddRange(new object[] {
															"Group In Packet",
															"Group Out Packet",
															"Group Etherstat Packet Size"});
			this.Group_List.Location = new System.Drawing.Point(248, 40);
			this.Group_List.Name = "Group_List";
			this.Group_List.Size = new System.Drawing.Size(192, 94);
			this.Group_List.TabIndex = 4;
			this.Group_List.ItemCheck += new System.Windows.Forms.ItemCheckEventHandler(this.Group_List_ItemCheck);
			// 
			// Var_List
			// 
			this.Var_List.Items.AddRange(new object[] {
														  "IfInOctets",
														  "IfOutOctets",
														  "IfInUcastPkts",
														  "IfOutUcastPkts",
														  "IfInDiscards",
														  "IfOutDiscards",
														  "IfInNUcastPkts",
														  "IfOutNUcastPkts",
														  "etherStatsPkts64Octets",
														  "etherStatsPkts65to127Octets",
														  "etherStatsPkts128to255Octets",
														  "etherStatsPkts256to511Octets",
														  "etherStatsPkts512to1023Octets",
														  "etherStatsPkts1024to1518Octets"});
			this.Var_List.Location = new System.Drawing.Point(72, 192);
			this.Var_List.Name = "Var_List";
			this.Var_List.Size = new System.Drawing.Size(376, 94);
			this.Var_List.TabIndex = 1;
			this.Var_List.ItemCheck += new System.Windows.Forms.ItemCheckEventHandler(this.Var_List_ItemCheck);
			// 
			// Int_List
			// 
			this.Int_List.Location = new System.Drawing.Point(72, 40);
			this.Int_List.Name = "Int_List";
			this.Int_List.Size = new System.Drawing.Size(120, 94);
			this.Int_List.TabIndex = 0;
			this.Int_List.ItemCheck += new System.Windows.Forms.ItemCheckEventHandler(this.Int_List_ItemCheck);
			// 
			// btn_show
			// 
			this.btn_show.Location = new System.Drawing.Point(72, 304);
			this.btn_show.Name = "btn_show";
			this.btn_show.TabIndex = 3;
			this.btn_show.Text = "Show Graph";
			this.btn_show.Click += new System.EventHandler(this.btn_test_Click);
			// 
			// label_Interface_List
			// 
			this.label_Interface_List.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label_Interface_List.Location = new System.Drawing.Point(72, 8);
			this.label_Interface_List.Name = "label_Interface_List";
			this.label_Interface_List.TabIndex = 5;
			this.label_Interface_List.Text = "List Interface ";
			// 
			// label_Group_List
			// 
			this.label_Group_List.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label_Group_List.Location = new System.Drawing.Point(248, 8);
			this.label_Group_List.Name = "label_Group_List";
			this.label_Group_List.Size = new System.Drawing.Size(152, 23);
			this.label_Group_List.TabIndex = 6;
			this.label_Group_List.Text = "List Group Chi_square";
			// 
			// label_List_Parameter
			// 
			this.label_List_Parameter.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label_List_Parameter.Location = new System.Drawing.Point(72, 152);
			this.label_List_Parameter.Name = "label_List_Parameter";
			this.label_List_Parameter.TabIndex = 7;
			this.label_List_Parameter.Text = "List Parameter";
			// 
			// timer_5Min
			// 
			this.timer_5Min.Interval = 1000;
			this.timer_5Min.SynchronizingObject = this.btn_collect;
			this.timer_5Min.Elapsed += new System.Timers.ElapsedEventHandler(this.timer_5Min_Elapsed);
			// 
			// mainMenu1
			// 
			this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem1});
			// 
			// menuItem1
			// 
			this.menuItem1.Index = 0;
			this.menuItem1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem2});
			this.menuItem1.Text = "File";
			// 
			// menuItem2
			// 
			this.menuItem2.Index = 0;
			this.menuItem2.Text = "Exit";
			this.menuItem2.Click += new System.EventHandler(this.menuItem2_Click);
			// 
			// pictureBox1
			// 
			this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
			this.pictureBox1.Location = new System.Drawing.Point(0, 0);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(504, 64);
			this.pictureBox1.TabIndex = 20;
			this.pictureBox1.TabStop = false;
			// 
			// L_status
			// 
			this.L_status.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.L_status.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.L_status.Location = new System.Drawing.Point(0, 528);
			this.L_status.Name = "L_status";
			this.L_status.Size = new System.Drawing.Size(504, 32);
			this.L_status.TabIndex = 22;
			this.L_status.Text = "Status : Idle";
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(504, 566);
			this.Controls.Add(this.L_status);
			this.Controls.Add(this.pictureBox1);
			this.Controls.Add(this.tabControl1);
			this.IsMdiContainer = true;
			this.MaximumSize = new System.Drawing.Size(512, 600);
			this.Menu = this.mainMenu1;
			this.MinimumSize = new System.Drawing.Size(512, 600);
			this.Name = "Form1";
			this.Text = "NIDS";
			this.tabControl1.ResumeLayout(false);
			this.t_Setting.ResumeLayout(false);
			this.Groupbox.ResumeLayout(false);
			this.t_Display.ResumeLayout(false);
			this.panel_display.ResumeLayout(false);
			this.t_Admin.ResumeLayout(false);
			this.Admin_panel.ResumeLayout(false);
			this.t_chart.ResumeLayout(false);
			this.chart_panel.ResumeLayout(false);
			this.panel_chart.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.timer_5Min)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion
		[STAThread]
		static void Main() 
		{
			
			
			Application.Run(new Form1());
			Application.Exit();
				
		}
		
		/*private void button1_Click(object sender, System.EventArgs e)
		{
			
			string ip_str = txt_ip.Text;
			string community = txt_community.Text;
			string result = null;
			string eos = "\r\n";
			try
			{
				SnmpTarget.DefaultTimeout = 10000;
				SnmpTarget.DefaultRetries = 2;

				using (Snmp snmp = new Snmp(161,true))
				{
					SnmpVersion ver = SnmpVersion.SNMPv1;
					UdpAddress udp = new UdpAddress(txt_ip.Text);
					CTarget target = new CTarget(udp, ver, community, community);
					Oid systemOid = new Oid(txt_oid.Text);
					Vb vb = new Vb(systemOid);
					Pdu pdu = new Pdu(PduType.GetNext, vb);
					
					while(true)
					{
						
						Pdu resp = snmp.Invoke(pdu, target);

						vb = resp[0];
						Oid oid = vb.Oid;
						
						if (!oid.StartsWith(systemOid))
						{
							break;
						}

						SnmpSyntax val = vb.Value;
						result += oid.ToString() + " : " + val + eos;// + val.SmiSyntax + "             ";
						pdu = pdu.Clone(vb);

					}
				}
			}
			catch (SnmpException ce) 
			{
				result += "SnmpException:"
					+ "\nstatus : " + ce.ErrorStatus
					+ "\nindex  : " + ce.ErrorIndex
					+ "\nmessage: " + ce.Message;
			}
			catch (Exception ce)
			{
				result += ce.Message;
			}
			txt_output.Text = result;
		}
	*/
		
		private void btn_getNext_Click(object sender, System.EventArgs e)
		{
			Thread th_call = new Thread(new ThreadStart(this.thread_getNext));
			th_call.Start();
		}// End button_click fn
		
		private void thread_getNext()
		{
			L_status.Text = "Status : Get Data From Router...";
			Snmpi snmpi;
			snmpi = new Snmpi(txt_ip.Text,txt_community.Text,txt_oid.Text);
			bool valid = snmpi.getNext();
			if(valid)
			{
				txt_output.Text = snmpi.getResult();
			}
			else
			{
				txt_output.Text = "Invalid OID";
			}
			MessageBox.Show("Finished");
			L_status.Text = "Status : Idle";
		}
		#region get button
		private void btn_get_Click(object sender, System.EventArgs e)
		{
			Thread th_call = new Thread(new ThreadStart(this.thread_get));
			th_call.Start();
		}
		private void thread_get()
		{
			Snmpi snmpi = new Snmpi(txt_ip.Text,txt_community.Text,txt_oid.Text);
			txt_output.Text = snmpi.gett();
		}
		#endregion 
		#region init button
		private void btn_init_Click(object sender, System.EventArgs e)
		{
			L_status.Text = "Status : Initail System...";
			if(txt_ip.TextLength != 0 && txt_community.TextLength != 0 && txt_dbIP.TextLength != 0 && txt_dbUser.TextLength != 0 && txt_dbPasswd.TextLength != 0)
			{
				Thread th_call = new Thread(new ThreadStart(this.thread_init));
				th_call.Start();
			}
			btn_init.Visible = false;
			btn_Update.Visible = true;
			tabsetting_disable();
			L_status.Text = "Status: Idle";
		}
		
		private void thread_init() // thread init
		{
			snmpi = new Snmpi(txt_ip.Text,txt_community.Text,"1.3.6");
			snmpi.checkIfEtherUp();
			ifNo = snmpi.ifNo;
			sizeof_ifNo = snmpi.sizeof_ifNo;

			connector = new DbConnect(txt_dbIP.Text,txt_dbUser.Text,txt_dbPasswd.Text,"");
			connector.launch(sizeof_ifNo);
			connector.create_database("normal",ifNo,sizeof_ifNo);		//create DB ชื่อ normal เอาไว้เก็บ normal profile
			connector.create_database("observe",ifNo,sizeof_ifNo);		//create DB ชื่อ observe เอาไว้เก็บ observe profile
			connector.create_databaseAlert("alertDB",ifNo,sizeof_ifNo);	//create DB ชื่อ Alert เอาไว้เก็บ Alert
			MessageBox.Show("Finished");
		}
	    #endregion
		// timer 5 min interval
		private void timer_5Min_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
		{
			int remain = 300 - counter;
			txt_counter.Text = remain.ToString();
			if(counter++ == 300)
			{
				if(Observe_counter < 12)
				{
					Observe_counter++;
				}
				counter = 0;
				Show_graph();
				fn_collect();
			}
			
		}
		// button collect data
		private void btn_collect_Click(object sender, System.EventArgs e)
		{
			btn_collect.Enabled = false;
			fn_collect();
		}
		//call thread collect
		private void fn_collect()
		{
			timer_5Min.Enabled = true;
			menuItem2.Enabled = false;		// Disable Exit Menu 
			Thread th_call = new Thread(new ThreadStart(this.thread_collect));
			th_call.Start();
			menuItem2.Enabled = true;		// Enable Exit Menu 
		}

		private void thread_collect()
		{
			recv_data = snmpi.collect(ifNo,sizeof_ifNo);
			L_status.Text = "Status : Computing";
			Calculate();
			L_status.Text = "Status : Idle";
		}

		
		//Exit menu
		private void menuItem2_Click(object sender, System.EventArgs e)
		{
			Application.Exit();
		}
//----------------------------------------------------------------------------------------

		private void test_Click(object sender, System.EventArgs e)
		{
			th_calculate = new Thread(new ThreadStart(this.Calculate));
			th_calculate.Start();
			txt_output.Text += "1 "; 
			
		}
/*
 *	เป็น function ที่ทำการคำนวณ ค่าต่างๆ เพื่อวิเคราะห์
 *  flag ----
 *  function เป็นตัวบอกว่าตอนเลือกเมนูว่าจะทำแบบ collect อย่างเดียว หรือ collect and analyze
 *  passed เป็นตัวบอกว่าเป็นการทำครั้งแรกหรือไม่(เรื่อง ทำ diff ของข้อมูลเพื่อเอาลง DB) 
*/		
		private void Calculate()
		{
			L_status.Text = "Status : Computing";
			Norm_connector = new DbConnect(txt_dbIP.Text,txt_dbUser.Text,txt_dbPasswd.Text,"normal");
			Observe_connector = new DbConnect(txt_dbIP.Text,txt_dbUser.Text,txt_dbPasswd.Text,"Observe");
			passed = Observe_connector.toDB(recv_data,sizeof_ifNo,passed);		//เก็บค่าการใช้งาน ณ. ตอนนั้น ลง DB Observe
			int [] Norm_rowreturn = new int[sizeof_ifNo];
			int [] Observe_rowreturn = new int[sizeof_ifNo];
			if(function == true)		
			{
				//------------- เอาข้อมูล norm/Observe มาเก็บลง object Norm/Observe แต่ละ interface-----------//
				for(int i = 0;i<sizeof_ifNo;i++)
				{
					string result = "";
					for(int j =0;j<No_var;j++)		//No_var = 14 เป็น const อยู่
					{
						//---------share variable สำหรับ norm และ observe--------//
						string dayofweek = getday();
						string daytime = getdaytime();
						string min = DateTime.Now.Minute.ToString();
						//---------norm--------//
						result = "";
						result = Norm_connector.query(Norm_connector.Cut_dot(ifNo[i,0]),j.ToString(),dayofweek,daytime,min,false);
						Norm_rowreturn[i] = Group_Norm[i].count_row(result);
						Group_Norm[i].Assign_data( Group_Norm[i] , result , Norm_rowreturn[i] ,j );
						//-------Observe-------//
						result = "";
						result = Observe_connector.query(Observe_connector.Cut_dot(ifNo[i,0]),j.ToString(),dayofweek,daytime,min,true);
						Observe_rowreturn[i] = Group_Observe[i].count_row(result);
					}//จบแต่ละรอบตัวแปรในการใส่ค่าลงตัวแปร norm
				}//จบแต่ละ interface ในการใส่ค่าลงตัวแปร norm
				string temp_data = recv_data;						//ไม่เอา recv_data ส่งเข้าเพราะเวลาเอา string เข้าไปตัดใน function แล้ว string จะหายไป แล้วเดี๋ยวตอนท้ายต้องการ string เพื่อจะไป ใส่ลง DB
				Cut_Rdata(temp_data,sizeof_ifNo);					//เอาค่าที่ได้จากการดึงข้อมูลล่าสุดจาก router มาใส่ที่ data ท้ายสุด
				
			
				//---------------------------------เอาข้อมูลมาทำการวิเคราะห์ทาง สถิติ-----------------------------------//
				for(int i = 0;i<sizeof_ifNo;i++)		//วนคำนวณ ทุก interface
				{
					//---------norm--------//
					Group_Norm[i].GroupNorm_EWMA(Group_Norm[i],Norm_rowreturn[i],0,4);		//this test no_group = 0
					Group_Norm[i].GroupNorm_EWMA(Group_Norm[i],Norm_rowreturn[i],1,4);		//this test no_group = 1
					Group_Norm[i].GroupNorm_EWMA(Group_Norm[i],Norm_rowreturn[i],2,6);		//this test no_group = 2
                    Group_Norm[i].Norm_Max(Group_Norm[i]);
					Group_Norm[i].Norm_Weight(Group_Norm[i]);
					Group_Norm[i].Vector(Group_Norm[i]);
					Group_Norm[i].Expect_Value(Group_Norm[i]);
					Group_Norm[i].SD(Group_Norm[i]);
					Group_Norm[i].Group_Norm_ChiSquare(Group_Norm[i]);
					Group_Norm[i].Group_Control_Limit(Group_Norm[i]);

					//-------observe-------//
					//Group_Observe[i].Observe_Max(Group_Observe[i]);
					Group_Observe[i].Observe_Max(Group_Norm[i],Group_Observe[i]);
					Group_Observe[i].Observe_Weight(Group_Observe[i]);
					Group_Observe[i].Observe_Vector(Group_Observe[i]);
					Group_Observe[i].send_Expect_value(Group_Norm[i],Group_Observe[i]);
					Group_Observe[i].Observe_ChiSquare(Group_Observe[i]);
					//-------------------- เปรียบค่าobserve กับ norm ถ้าปกติจะเก็บลง DB แต่ต้องไม่ใช่ครั้งแรกเพราะ เก็บค่า diff
					if(passed)
					{
						
						if(Observe_counter >= 2)		//ต้องครบ 1 ชม. ก่อน จึงจะเทียบเก็บลง DB
						{
							Check_Alert(i);					//i = ifnumber
							if(	   (Group_Observe[i].chi_square[10] < Group_Norm[i].Upper_bound[10] || Group_Observe[i].chi_square[10] < Admin_Chi_square[i])
								&& (Group_Observe[i].chi_square1[10] < Group_Norm[i].Upper_bound1[10] || Group_Observe[i].chi_square1[10] < Admin_Chi_square1[i])
								&& (Group_Observe[i].chi_square2[10] < Group_Norm[i].Upper_bound2[10] || Group_Observe[i].chi_square2[10] < Admin_Chi_square2[i])
								) // ไม่เกิดความผิดปกติ
							{
								//สร้าง string เพื่อใช้ในการ update DB
								stringdata += Group_Observe[i].NoError_Update_DB(Group_Norm[i],Group_Observe[i],ifNo[i,0]);
							
							}
							else
							{
								//สร้าง string เพื่อใช้ในการ update DB
								stringdata += Group_Observe[i].Error_Update_DB(Group_Norm[i],Group_Observe[i],ifNo[i,0]);
							
							}
						}
					}

				}//จบแต่ละ interface 
				// update ข้อมูล ลงใน DB
					stringdata += "$";		// ปิด $ ให้กับ string ตาม format
				//if(Observe_counter >= 2)
				if(Observe_counter >= 2)
				{
					passed = connector.toDB(stringdata,sizeof_ifNo,passed);		//เอาค่าลง DB
					
				}
				stringdata = "";
			}
			else // เลือก แบบ collect only
			{
				string temp_data = recv_data;								//ไม่เอา recv_data ส่งเข้าเพราะเวลาเอา string เข้าไปตัดใน function แล้ว string จะหายไป แล้วเดี๋ยวตอนท้ายต้องการ string เพื่อจะไป ใส่ลง DB
				Cut_Rdata(temp_data,sizeof_ifNo);							//เอาค่าที่ได้จากการดึงข้อมูลล่าสุดจาก router มาใส่ที่ data ท้ายสุด
				passed = connector.toDB(recv_data,sizeof_ifNo,passed);		//เอาค่าลง DB
			}
			L_status.Text = "Status : Idle";
		}

		private void tabControl1_Enter(object sender, System.EventArgs e)
		{
			
		}

				
		private void But_Show_Click(object sender, System.EventArgs e)
		{
			
			if(is_show == true)		// มีอย่างน้อย 1 กราฟ แสดงอยู่
			{
				is_show = false;
				for(int j =0;j< sizeof_ifNo;j++)
				{
					chi_chart[j].Close();
					Interface_chart[j].Close();
				}
			}
			DateTime currentDate = DateTime.Now;
			
			//------------------ แสดงกราฟ -----------------------
			
			for(int ii = 0;ii<sizeof_ifNo;ii++)					//แสดงค่าการใช้งานแต่ละ interface ที่เลือก
			{

				

				if(Int_choose[ii] == true)
				{
					//----------------------------- แสดง Chi_square ที่ Interface ที้เลือก---------------------------
					string name = "Chi_square Interface No"+Int_List.Items[ii].ToString() +" (Date "+currentDate.Date.ToShortDateString()+" , " +currentDate.Hour.ToString() +":"+ currentDate.Minute.ToString()+") ";
					for(int counter =0;counter<12;counter++)
					{
						Observe[ii].Upper_bound[counter] =  Norm[ii].Upper_bound[counter];		//เอาค่า control limit ในช่วง ชม. มาให้ observe เพื่อเอาไปแสดง
						Observe[ii].Lower_bound[counter] =  Norm[ii].Lower_bound[counter];		
					}

					chi_chart[ii] = new Chart_view(name,Observe[ii]);
					chi_chart[ii].Show();		
										
					for(int i = 0;i<14;i++)				//วนลูป เพื่อดูว่าตัวแปรไหนเลือกให้แสดงบ้าง
					{
						if(Var_choose[i] == true)
						{
							name = "Interface No"+Int_List.Items[ii].ToString() +"_"+ Var_List.Items[i].ToString()+ " (Date "+currentDate.Date.ToShortDateString()+" , " +currentDate.Hour.ToString() +":"+ currentDate.Minute.ToString()+") ";
							Interface_chart[i] = new Chart_view(name,Observe[ii],ii,i,true);
							Interface_chart[i].Show();						//เปิดหน้าต่างแสดงกราฟ
						}
						
					}
					
				}
			}
			is_show = true;				// สถานะ เปิด อย่างน้อย 1 กราฟ
		}

		
		private void btn_Update_Click(object sender, System.EventArgs e)
		{
			//-------prepare control user----//
			L_status.Text = "Status : Updating Information From Router ...";
			panel_chart.Enabled = true;
			panel_display.Enabled = true;
			//-------------------------------//
			snmpi = new Snmpi(txt_ip.Text,txt_community.Text,"1.3.6");
			//---- snmpi ----//
			snmpi.checkIfEtherUp();


			// special assign
			ifNo = snmpi.ifNo;
			sizeof_ifNo = snmpi.sizeof_ifNo;
			/////////////////
			//---- snmpi ----\\
			Norm_connector = new DbConnect(txt_dbIP.Text,txt_dbUser.Text,txt_dbPasswd.Text,"normal");
			Norm_connector.launch(sizeof_ifNo);
			Observe_connector = new DbConnect(txt_dbIP.Text,txt_dbUser.Text,txt_dbPasswd.Text,"normal");
			Observe_connector.launch(sizeof_ifNo);
			MessageBox.Show("Update Completed!");
			btn_Update.Visible = false;
			btn_collect.Enabled = true;
			Groupbox.Enabled = true;
			Admin_panel.Enabled = true;
			
			tabsetting_disable();

			//--------------init obj-----------------//
			Observe = new MyStat[sizeof_ifNo];
			Norm = new MyStat[sizeof_ifNo];
			Interface_chart = new Snmp_pp.Chart_view [sizeof_ifNo];
			chi_chart = new Snmp_pp.Chart_view [sizeof_ifNo];
			Int_choose = new bool[sizeof_ifNo];	
			for(int i = 0;i<sizeof_ifNo;i++)
			{
				Observe[i] = new MyStat();
				Norm[i] = new MyStat();
				chi_chart[i] = new Chart_view(); 
				Interface_chart[i] = new Chart_view(); 
				Int_List.Items.Add(ifNo[i,0]);			//แสดง ค่า interface ใน listbox
				Int_chi.Items.Add(ifNo[i,0]);			//แสดงค่า interface ใน Listbox ของ หน้ากำหนด chi_square
				
			}
			//-------------group chi_square--------------------//
			Group_Observe = new MyStat[sizeof_ifNo];		//ตอนนี้มี 2 กลุ่มไปก่อน
			Group_Norm = new MyStat[sizeof_ifNo];			//ตอนนี้มี 2 กลุ่มไปก่อน
			Group_Chi_chart = new Snmp_pp.Chart_view [sizeof_ifNo];
			Group_Chi_chart1 = new Snmp_pp.Chart_view [sizeof_ifNo];
			Group_Chi_chart2 = new Snmp_pp.Chart_view [sizeof_ifNo];
			ovalue = new ulong[sizeof_ifNo,14];
			multiplier = new ulong[sizeof_ifNo,14];

			for(int kk =0;kk<sizeof_ifNo;kk++)
			{
				Group_Chi_chart[kk] = new Chart_view();
				Group_Chi_chart1[kk] = new Chart_view();
				Group_Chi_chart2[kk] = new Chart_view();
				Group_Observe[kk] = new MyStat();
				Group_Norm[kk] = new MyStat();
			}
			L_status.Text = "Status : Idle";
		}
		
		
		//ตัวตรวจสอบว่า user เลือกตัวแปรไหนบ้างใน list ฺbox เพื่อทำการแสดง graph
		private void Var_List_ItemCheck(object sender, System.Windows.Forms.ItemCheckEventArgs e)
		{
			
			int index = Var_List.SelectedIndex;
			if(e.NewValue == CheckState.Checked)
			{
				Var_choose[index] = true;
			}
			else Var_choose[index] = false;
			//mee.Var_choose = Var_choose;
			
		}
		//ตัวตรวจสอบว่า user เลือก interface ไหนบ้างใน list ฺbox เพื่อทำการแสดง graph
		private void Int_List_ItemCheck(object sender, System.Windows.Forms.ItemCheckEventArgs e)
		{
			int index = Int_List.SelectedIndex;
			if(e.NewValue == CheckState.Checked)
			{
				Int_choose[index] = true;
			}
			else Int_choose[index] = false;
			
		}
		//ตัวตรวจสอบว่า user เลือก Group ไหนบ้างใน list ฺbox เพื่อทำการแสดง graph
		private void Group_List_ItemCheck(object sender, System.Windows.Forms.ItemCheckEventArgs e)
		{
			int index = Group_List.SelectedIndex;
			if(e.NewValue == CheckState.Checked)
			{
				Group_choose[index] = true;
			}
			else Group_choose[index] = false;
		}
		
		
		private void MDI_Click(object sender, System.EventArgs e)
		{
			string detail = " At Interface Number " + ifNo[0,0].ToString();
			show.Text = detail;
		}

		
		public void Cut_Rdata (string arg_recv_data,int arg_sizeof_ifNo)	//i = ตัวบอกว่าของ int ไหน index_observe = ตัวแสดงว่ามีข้อมูลอยู่แล้วในตัวแปร Observe เท่าไหร่ เพื่อจะได้ย้ายตัวสุดท้ายได้ถูก(เอาค่ามาจากการ นับ row return ของ Observe DB)
		{
			int first = 0;
			int last = 0;
			sizeof_ifNo = arg_sizeof_ifNo;
			for(int i=0;i<sizeof_ifNo;i++)
			{
				
				first = arg_recv_data.IndexOf("$");
				last = arg_recv_data.IndexOf("$",first+1);
				string temp = arg_recv_data.Substring(first,last-first);
				
				// process in temp
				temp = temp.Substring(1);
				int index = temp.IndexOf("%");
				string ifNumber = temp.Substring(0,index);
				temp += "%";			// for easy search
				string[] values = new string[No_var];
				for(int j=0;j<No_var;j++)
				{
					int index1 = temp.IndexOf("%");
					int index2 = temp.IndexOf("%",index1+1);
				
					values[j] = temp.Substring(index1+1,index2-index1-1);

					if(Rpassed) // Not run in first time
					{
						////// ------ differentiated ------ //////
						ulong obuff = max * multiplier[i,j];
						obuffer = ovalue[i,j] + obuff;
						////// ------ differentiated ------ \\\\\\
					


						if(UInt64.Parse(values[j]) < ovalue[i,j])
						{
							multiplier[i,j] += 1;
						}
					}

					/////////////////////////////////////////////////
					// replace current to ovalue
					ovalue[i,j] = UInt64.Parse(values[j]);
					/////////////////////////////////////////////////
					
					ulong buff = max * multiplier[i,j];
					ulong buffer = UInt64.Parse(values[j]) + buff;
					if(Rpassed)
					{
						buffer -= obuffer;
					}
					values[j] = buffer.ToString();

					
					temp = temp.Substring(index2);
				}
				if(Rpassed)
				{
					for(int jj=0;jj<No_var;jj++)
					{
						for(int k =0;k < 11;k++)
						{
							Group_Observe[i].data[jj,k] = Group_Observe[i].data[jj,k+1] ;//เลื่อน ค่า เดิม
						}
					}
					for(int jj=0;jj<No_var;jj++)
					{
						//Group_Observe[i].data[jj,11] = double.Parse(values[jj]);		//เอาค่าไหม่มาใส่
						Group_Observe[i].data[jj,10] = double.Parse(values[jj]);		//เอาค่าไหม่มาใส่
					}
				}
				arg_recv_data = arg_recv_data.Substring(last);
			}
			Rpassed = true; // toggle passed flag to enable all function in next time
			
		}

		
		public string getday()
		{
			string dayofweek = DateTime.Now.DayOfWeek.ToString();
			dayofweek = dayofweek.Substring(0,3);
			return dayofweek;
		}

		
		public string getdaytime()
		{
			string daytime = DateTime.Now.Hour.ToString();
			daytime += ".";
			daytime += DateTime.Now.Minute.ToString();
			return daytime;
		}

		
		public void tabsetting_disable()
		{
			txt_ip.Enabled = false;
			txt_community.Enabled = false;
			txt_dbUser.Enabled = false;
			txt_dbIP.Enabled = false;
			txt_dbPasswd.Enabled = false;
		}
		


		private void btn_test_Click(object sender, System.EventArgs e)
		{
			Show_graph();
		}

		private void radioButton1_CheckedChanged(object sender, System.EventArgs e)
		{
			function = false;
		}

		private void radioButton2_CheckedChanged(object sender, System.EventArgs e)
		{
			function = true;
		}

		private void Check_Alert(int int_no)
		{
			bool has_alert = false;
			string datetime = DateTime.Now.Date.ToShortDateString() + DateTime.Now.TimeOfDay.ToString();
			string detail = "Interface No " + ifNo[int_no,0].ToString();
			if((Group_Observe[int_no].chi_square[10] > Group_Norm[int_no].Upper_bound[10]) && Group_Observe[int_no].chi_square[10] > Admin_Chi_square[int_no])	//กรณี เกิน upbound
			{
				detail += " Group InPacket abnormal at " + datetime + detail ;
				has_alert = true;
			}
			else if((Group_Observe[int_no].chi_square1[10] > Group_Norm[int_no].Upper_bound1[10]) && Group_Observe[int_no].chi_square1[10] > Admin_Chi_square1[int_no])	//กรณี เกิน upbound
			{
				detail += " Group OutPacket abnormal at " + datetime + detail  ;
				has_alert = true;
			}
			else if((Group_Observe[int_no].chi_square2[10] > Group_Norm[int_no].Upper_bound2[10]) && Group_Observe[int_no].chi_square2[10] > Admin_Chi_square2[int_no])	//กรณี เกิน upbound
			{
				detail += " Group EtherstatPacket abnormal at " + datetime + detail  ;
				has_alert = true;
			}
			//-------keep in Alert DB-----------//
			if(has_alert)
			{
				Alert_connector = new DbConnect(txt_dbIP.Text,txt_dbUser.Text,txt_dbPasswd.Text,"alertdb"); 
				Alert_connector.toDBAlert(ifNo[int_no,0],detail,sizeof_ifNo);
				Alert_box.Text += detail+"\r\n";
			}
			
		}

		private void btn_assign_Click(object sender, System.EventArgs e)
		{
			int number = Int_chi.SelectedIndex;
			if(number == -1)
			{
				number = 0;			//ป้องกัน error เมื่อ user ไม่ได้เลือก interface จาก list  
			}
			double chi_value = double.Parse(Admin_chi_box.Text);
			double chi_value1 = double.Parse(Admin_chi_box1.Text);
			double chi_value2 = double.Parse(Admin_chi_box2.Text);
			Admin_Chi_square[number] = chi_value;
			Admin_Chi_square1[number] = chi_value1;
			Admin_Chi_square2[number] = chi_value2;
		}
		
		void Show_graph()
		{
			
			if(is_show == true)		// มีอย่างน้อย 1 กราฟ แสดงอยู่
			{
				is_show = false;
				for(int j =0;j< sizeof_ifNo;j++)
				{
					Group_Chi_chart[j].Close();
					Group_Chi_chart1[j].Close();
					Group_Chi_chart2[j].Close();
					Interface_chart[j].Close();
				}
			}
			DateTime currentDate = DateTime.Now;
			
			//------------------ แสดงกราฟ -----------------------
			
			for(int ii = 0;ii<sizeof_ifNo;ii++)					//แสดงค่าการใช้งานแต่ละ interface ที่เลือก
			{
				if(Int_choose[ii] == true)
				{
					//----------------------------- แสดง Chi_square ที่ Interface ที้เลือก---------------------------
					string name = "Group Chi_square Interface No"+Int_List.Items[ii].ToString() +" (Date "+currentDate.Date.ToShortDateString()+" , " +currentDate.Hour.ToString() +":"+ currentDate.Minute.ToString()+") ";
					//for(int counter =0;counter<11;counter++)
					//{
						Group_Observe[ii].send_Controllimit(Group_Norm[ii],Group_Observe[ii]);						
					//}
					if(Group_choose[0])
					{
						Group_Chi_chart[ii] = new Chart_view(name,Group_Observe[ii],0,Admin_Chi_square[ii],Admin_Chi_square1[ii],Admin_Chi_square2[ii]);
						Group_Chi_chart[ii].Show();
					}
					if(Group_choose[1])
					{
						Group_Chi_chart1[ii] = new Chart_view(name,Group_Observe[ii],1,Admin_Chi_square[ii],Admin_Chi_square1[ii],Admin_Chi_square2[ii]);
						Group_Chi_chart1[ii].Show();
					}
					if(Group_choose[2])
					{
						Group_Chi_chart2[ii] = new Chart_view(name,Group_Observe[ii],2,Admin_Chi_square[ii],Admin_Chi_square1[ii],Admin_Chi_square2[ii]);
						Group_Chi_chart2[ii].Show();	
					}
					for(int i = 0;i<14;i++)				//วนลูป เพื่อดูว่าตัวแปรไหนเลือกให้แสดงบ้าง
					{
						if(Var_choose[i] == true)
						{
							name = "Interface No"+Int_List.Items[ii].ToString() +"_"+ Var_List.Items[i].ToString()+ " (Date "+currentDate.Date.ToShortDateString()+" , " +currentDate.Hour.ToString() +":"+ currentDate.Minute.ToString()+") ";
							Interface_chart[i] = new Chart_view(name,Group_Observe[ii],ii,i,true);
							Interface_chart[i].Show();						//เปิดหน้าต่างแสดงกราฟ
						}
						
					}
					
				}
			}
			is_show = true;				// สถานะ เปิด อย่างน้อย 1 กราฟ
		}
	
	}// End Class
}// End namespace
