using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Diagnostics;
//My Include
using System.Threading;
using System.IO;
using System.Net; 
using Org.Snmp.Snmp_pp;
using ChartDirector;


namespace Org.Snmp.Snmp_pp
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	/// 

	
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.TextBox txtData;
		private System.Windows.Forms.Timer timer1;
		private System.ComponentModel.IContainer components;
		private CScanProcess CSP;
		private Snmpi SnmpClass;
		private System.Windows.Forms.Timer timer2;
		private System.Windows.Forms.TextBox AddSnmpIP;
		private System.Windows.Forms.Button Add_Network_Group;
		private System.Windows.Forms.Button Add_Snmp_Com;
		private System.Windows.Forms.TextBox AddSnmpCom;
		private System.Windows.Forms.ComboBox Config_Name;
		private string ConfigInfo;
		private string ConfigI;
		private string Config_ID;
		private System.Windows.Forms.NotifyIcon Tray_Icon;
		private int Scan_Index=0;
		private string IP_String1 = "";
		private string IP_String2 = "";
		private string Port_String = "";
		private int[] Snmp_Host_Array_O = new int[20];
		private int[] Snmp_Host_Array_N = new int[20];
		private System.Windows.Forms.Button testSnmp;
		private long[] Packet_C_Array = new long[20];
		private long[] Packet_Z_Array = new long[20];
		private long[] Byte_C_Array = new long[20];
		private long[] Byte_Z_Array = new long[20];
		private long[] Old_Packet_Array = new long[20];
		private long[] Old_Byte_Array = new long[20];
		private long[] Old_Packet_Array2 = new long[20];
		private long[] Old_Byte_Array2 = new long[20];
		private bool First_Each_Packet = true;
		private bool[] First_Each_Byte = new bool[21];
		private int ScanOption;
		private string SystemLog;

		private string [,] H_Online = new string[20,260];
		
		private string [] Network_RealTime_Group_Array = new string[21];
		
		private double[] T_Online = new double[144];

		//The data for the line chart
		double[,] data = new double[20,12]; 
		double[,] data2 = new double[20,12]; 
		double[] dataIP = {0,0,0,0,0,0,0,0,0,0,0,0};
		double[] dataIP2 = {0,0,0,0,0,0,0,0,0,0,0,0};
		string[] labels = {"0:00","0:10","0:20","0:30","0:40","0:50","0:00","0:10","0:20","0:30","0:40","0:50"};
		long [] New_Chart_Data = new long[20];
		long [] New_Chart_Data2 = new long[20];
		int Chart_Count = 0;
		int Chart_Count2 = 0;


		private System.Windows.Forms.TabControl tabControl2;
		private System.Windows.Forms.TabPage tabPage1;
		private System.Windows.Forms.TabPage tabPage3;
		private System.Windows.Forms.TextBox HostIp;
		private System.Windows.Forms.Button StartHostScan;
		private System.Windows.Forms.TextBox HostDetailBox;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.RadioButton HostServiceScan;
		private System.Windows.Forms.RadioButton TrojanScan;
		private System.Windows.Forms.RadioButton PortSpecificScan;
		private System.Windows.Forms.TextBox PortSpecific;
		private System.Windows.Forms.TabPage tabPage4;
		private System.Windows.Forms.TextBox OverAll1;
		private System.Windows.Forms.TextBox OverAll2;
		private System.Windows.Forms.TextBox OverAll3;
		private System.Windows.Forms.TextBox OverAll4;
		private System.Windows.Forms.TextBox OverAll5;
		private System.Windows.Forms.TextBox Download1;
		private System.Windows.Forms.TextBox Download2;
		private System.Windows.Forms.TextBox Download3;
		private System.Windows.Forms.TextBox Upload1;
		private System.Windows.Forms.TextBox Download4;
		private System.Windows.Forms.TextBox Download5;
		private System.Windows.Forms.TextBox Upload2;
		private System.Windows.Forms.TextBox Upload3;
		private System.Windows.Forms.TextBox Upload4;
		private System.Windows.Forms.TextBox Upload5;
		private System.Windows.Forms.TabPage tabPage5;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.RadioButton HOView;
		private System.Windows.Forms.RadioButton BWView;
		private System.Windows.Forms.ComboBox DateSelect;
		private ChartDirector.WinChartViewer StandingC;
		private System.Windows.Forms.GroupBox groupBox3;
		private System.Windows.Forms.RadioButton DU;
		private System.Windows.Forms.RadioButton DOnly;
		private System.Windows.Forms.RadioButton UOnly;
		private System.Windows.Forms.ComboBox RangeList;
		private System.Windows.Forms.Button AddRange;
		private System.Windows.Forms.Button RemoveRange;
		private System.Windows.Forms.Button AddRAll;
		private System.Windows.Forms.Button RemoveRAll;
		private System.Windows.Forms.ComboBox Port_Oid;
		private System.Windows.Forms.TextBox PortDSC;
		private ChartDirector.WinChartViewer BWRStanding;
		private System.Windows.Forms.GroupBox groupBox4;
		private System.Windows.Forms.RadioButton DUStand;
		private System.Windows.Forms.RadioButton DStand;
		private System.Windows.Forms.RadioButton UStand;
		private System.Windows.Forms.Button Edit_Network_Group;
		private System.Windows.Forms.NotifyIcon Tray_Icon2;
		private System.Windows.Forms.Button AddRP;
		private System.Windows.Forms.Button RemoveRP;
		private System.Windows.Forms.Button testRP;
		private System.Windows.Forms.CheckBox Connect_R;
		private System.Windows.Forms.GroupBox groupBox5;
		private System.Windows.Forms.GroupBox groupBox6;
		private System.Windows.Forms.GroupBox groupBox7;
		private System.Windows.Forms.GroupBox groupBox8;
		private System.Windows.Forms.GroupBox groupBox9;
		private System.Windows.Forms.GroupBox groupBox10;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.Label label11;
		private System.Windows.Forms.Label label12;
		private System.Windows.Forms.Label label13;
		private System.Windows.Forms.Label label14;
		private System.Windows.Forms.Label label15;
		private System.Windows.Forms.GroupBox groupBox11;
		private System.Windows.Forms.GroupBox groupBox12;
		private System.Windows.Forms.GroupBox groupBox13;
		private System.Windows.Forms.GroupBox groupBox14;
		private System.Windows.Forms.GroupBox groupBox19;
		private System.Windows.Forms.PictureBox Pic1;
		private System.Windows.Forms.PictureBox Pic2;
		private System.Windows.Forms.GroupBox groupBox20;
		private System.Windows.Forms.GroupBox groupBox22;
		private System.Windows.Forms.RadioButton DABWView;
		private System.Windows.Forms.RadioButton DUBWView;
		private System.Windows.Forms.ComboBox Port_Oid2;
		private System.Windows.Forms.TextBox PortDSC2;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.MenuItem menuItem1;
		private System.Windows.Forms.MenuItem menuItem2;
		private System.Windows.Forms.MenuItem menuItem3;
		private System.Windows.Forms.ComboBox Network_Group;
		private System.Windows.Forms.ListBox Network_GroupL;
		private System.Windows.Forms.ComboBox ReferencePointL;
		private System.Windows.Forms.ListBox ReferencePoint;
		private System.Windows.Forms.ComboBox SNMP_Component;
		private System.Windows.Forms.ListBox SNMP_ComponentL;
		private System.Windows.Forms.ComboBox ViewList;
		private System.Windows.Forms.ListBox RangeListL;
		private System.Windows.Forms.ListBox ViewListL;
		private System.Windows.Forms.Label label21;
		private System.Windows.Forms.Label label22;
		private System.Windows.Forms.Label label23;
		private System.Windows.Forms.Label label20;
		private System.Windows.Forms.TextBox HistoryHostText;
		private System.Windows.Forms.ListBox DateSelectL;
		private System.Windows.Forms.ListBox TimeSelectL;
		private System.Windows.Forms.GroupBox groupBox15;
		private System.Windows.Forms.GroupBox groupBox16;
		private System.Windows.Forms.TextBox DownTime;
		private System.Windows.Forms.Label label16;
		private System.Windows.Forms.Label label17;
		private System.Windows.Forms.TextBox RefIP;
		private System.Windows.Forms.Label IPNText;
		private System.Windows.Forms.TextBox PJ_Name;
		private System.Windows.Forms.GroupBox groupBox17;
		private System.Windows.Forms.Button CreateBlankCF;
		private System.Windows.Forms.Label label18;
		private System.Windows.Forms.Label label19;
		private System.Windows.Forms.Label label24;
		private System.Windows.Forms.Label label25;
		private System.Windows.Forms.TextBox SystemLogPanel;
		private System.Windows.Forms.ComboBox StandingRangeq;
		private System.Windows.Forms.ListBox StandingRange;
		private System.Windows.Forms.Timer timer3;
		private System.Windows.Forms.MenuItem menuItem4;
		private System.Windows.Forms.MenuItem menuItem5;
		private bool ProbeMode = false;
		



		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			CRT.Auto.Initialize();
			SnmpClass = new Snmpi("161.246.66.254","cereadonly",".1.3.6.1.2.1.16.1.1.1.4");
			CSP = new CScanProcess();
			ConfigInfo = "^ Snmp_IP+Snmp_Commu\r\n\r\n= \r\n*\r\n";
			//ConfigInfo += "^ Network_IP+Snmp_Byte\r\n\r\n$ \r\n*\r\n";
			ConfigInfo += "^ Network_IP+Oid\r\n\r\n: 1 \r\n*\r\n";

			DirectoryInfo DirI = new DirectoryInfo(Directory.GetCurrentDirectory());
			string AllFile = "*.conf";
			FileInfo[] AnyFile = DirI.GetFiles(AllFile);
			foreach (FileInfo fif in AnyFile)
			{
				Config_Name.Items.Add(fif.Name.ToString().Substring(0,fif.Name.ToString().IndexOf(".",0)));
			}

			string RFile = "ReferencePoint.RPF";
				
			StreamWriter RW = new StreamWriter(RFile,true);				
			RW.Write ("");				
			RW.Flush();				
			RW.Close();

			StreamReader RR = new StreamReader(RFile);
			string R_Text = RR.ReadToEnd();
			RR.Close();
			
			if (R_Text.IndexOf("www.google.co.th") == -1)
			{
				StreamWriter RW2 = new StreamWriter(RFile,true);				
				RW2.Write (" &| www.google.co.th \r\n");				
				RW2.Flush();				
				RW2.Close();
			}

			StreamReader RR2 = new StreamReader(RFile);
			R_Text = RR2.ReadToEnd();
			RR2.Close();

			int R_Index = 0,R_Index2 = 0;
			while (true)
			{
				R_Index = R_Text.IndexOf("&|",R_Index);
				if (R_Index==-1)
					break;
				else
				{
					R_Index+=3;
					R_Index2 = R_Text.IndexOf(" ",R_Index);
					string tmpRP = R_Text.Substring(R_Index,R_Index2-R_Index);
					ReferencePoint.Items.Add(tmpRP);
				}
			}

			Config_ID = "_tmp";
			for (int i = 0;i<20;i++)
			{
				Snmp_Host_Array_O[i] = 0;
				Snmp_Host_Array_N[i] = 0;
				Packet_Z_Array[i] = 0;
				Packet_C_Array[i] = 0;
				Byte_Z_Array[i] = 0;
				Byte_C_Array[i] = 0;
				Old_Packet_Array[i] = 0;
				Old_Byte_Array[i] = 0;
				Old_Packet_Array2[i] = 0;
				Old_Byte_Array2[i] = 0;
				New_Chart_Data[i] = 0;
				New_Chart_Data2[i] = 0;
				Chart_Count = 0;
				Chart_Count2 = 0;
				First_Each_Byte[i] = true;
				Network_RealTime_Group_Array[i] = "";
				for (int b = 0;b<12;b++)
					data[i,b] = 0;
				for (int j = 0;j<260;j++)
				{	
					H_Online[i,j] = "";
				}
			}
			ScanOption = 1;
			CreateChart4();
			CreateChart5();
			SystemLog = "Application Up Time at :"+DateTime.Now.ToString()+"\r\n";
			SystemLogPanel.Text = SystemLog;
			//MessageBox.Show(ConfigInfo);

			DeleteDotIPFile();
			
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
				if (components != null) 
				{
					components.Dispose();
				}
			}
			SystemLog += "Application Down at :"+DateTime.Now.ToString()+"\r\n";
			SystemLogPanel.Text = SystemLog;
			StreamWriter Log = new StreamWriter("SystemLog.slog",true);
			Log.Write (SystemLog);
			Log.Flush();
			Log.Close();
			base.Dispose( disposing );
			Process.GetCurrentProcess().Kill(); 
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(Form1));
			this.txtData = new System.Windows.Forms.TextBox();
			this.timer1 = new System.Windows.Forms.Timer(this.components);
			this.timer2 = new System.Windows.Forms.Timer(this.components);
			this.AddSnmpIP = new System.Windows.Forms.TextBox();
			this.Add_Network_Group = new System.Windows.Forms.Button();
			this.Add_Snmp_Com = new System.Windows.Forms.Button();
			this.AddSnmpCom = new System.Windows.Forms.TextBox();
			this.Config_Name = new System.Windows.Forms.ComboBox();
			this.Tray_Icon = new System.Windows.Forms.NotifyIcon(this.components);
			this.testSnmp = new System.Windows.Forms.Button();
			this.tabControl2 = new System.Windows.Forms.TabControl();
			this.tabPage1 = new System.Windows.Forms.TabPage();
			this.SystemLogPanel = new System.Windows.Forms.TextBox();
			this.groupBox14 = new System.Windows.Forms.GroupBox();
			this.CreateBlankCF = new System.Windows.Forms.Button();
			this.groupBox6 = new System.Windows.Forms.GroupBox();
			this.label25 = new System.Windows.Forms.Label();
			this.label24 = new System.Windows.Forms.Label();
			this.label19 = new System.Windows.Forms.Label();
			this.label18 = new System.Windows.Forms.Label();
			this.Port_Oid = new System.Windows.Forms.ComboBox();
			this.PortDSC = new System.Windows.Forms.TextBox();
			this.PortDSC2 = new System.Windows.Forms.TextBox();
			this.Port_Oid2 = new System.Windows.Forms.ComboBox();
			this.Network_Group = new System.Windows.Forms.ComboBox();
			this.Edit_Network_Group = new System.Windows.Forms.Button();
			this.SNMP_Component = new System.Windows.Forms.ComboBox();
			this.groupBox5 = new System.Windows.Forms.GroupBox();
			this.SNMP_ComponentL = new System.Windows.Forms.ListBox();
			this.label21 = new System.Windows.Forms.Label();
			this.label22 = new System.Windows.Forms.Label();
			this.label23 = new System.Windows.Forms.Label();
			this.tabPage3 = new System.Windows.Forms.TabPage();
			this.groupBox13 = new System.Windows.Forms.GroupBox();
			this.HostDetailBox = new System.Windows.Forms.TextBox();
			this.groupBox12 = new System.Windows.Forms.GroupBox();
			this.HostIp = new System.Windows.Forms.TextBox();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.PortSpecificScan = new System.Windows.Forms.RadioButton();
			this.TrojanScan = new System.Windows.Forms.RadioButton();
			this.HostServiceScan = new System.Windows.Forms.RadioButton();
			this.PortSpecific = new System.Windows.Forms.TextBox();
			this.StartHostScan = new System.Windows.Forms.Button();
			this.tabPage4 = new System.Windows.Forms.TabPage();
			this.groupBox11 = new System.Windows.Forms.GroupBox();
			this.StandingRange = new System.Windows.Forms.ListBox();
			this.StandingRangeq = new System.Windows.Forms.ComboBox();
			this.groupBox10 = new System.Windows.Forms.GroupBox();
			this.Upload1 = new System.Windows.Forms.TextBox();
			this.Upload5 = new System.Windows.Forms.TextBox();
			this.Upload4 = new System.Windows.Forms.TextBox();
			this.Upload3 = new System.Windows.Forms.TextBox();
			this.Upload2 = new System.Windows.Forms.TextBox();
			this.label15 = new System.Windows.Forms.Label();
			this.label13 = new System.Windows.Forms.Label();
			this.label12 = new System.Windows.Forms.Label();
			this.label14 = new System.Windows.Forms.Label();
			this.label11 = new System.Windows.Forms.Label();
			this.groupBox9 = new System.Windows.Forms.GroupBox();
			this.Download5 = new System.Windows.Forms.TextBox();
			this.Download4 = new System.Windows.Forms.TextBox();
			this.Download3 = new System.Windows.Forms.TextBox();
			this.Download2 = new System.Windows.Forms.TextBox();
			this.Download1 = new System.Windows.Forms.TextBox();
			this.label7 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			this.label10 = new System.Windows.Forms.Label();
			this.label9 = new System.Windows.Forms.Label();
			this.label8 = new System.Windows.Forms.Label();
			this.groupBox8 = new System.Windows.Forms.GroupBox();
			this.OverAll1 = new System.Windows.Forms.TextBox();
			this.OverAll5 = new System.Windows.Forms.TextBox();
			this.OverAll4 = new System.Windows.Forms.TextBox();
			this.OverAll3 = new System.Windows.Forms.TextBox();
			this.OverAll2 = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.groupBox4 = new System.Windows.Forms.GroupBox();
			this.UStand = new System.Windows.Forms.RadioButton();
			this.DStand = new System.Windows.Forms.RadioButton();
			this.DUStand = new System.Windows.Forms.RadioButton();
			this.groupBox22 = new System.Windows.Forms.GroupBox();
			this.DABWView = new System.Windows.Forms.RadioButton();
			this.DUBWView = new System.Windows.Forms.RadioButton();
			this.BWRStanding = new ChartDirector.WinChartViewer();
			this.tabPage5 = new System.Windows.Forms.TabPage();
			this.groupBox16 = new System.Windows.Forms.GroupBox();
			this.label16 = new System.Windows.Forms.Label();
			this.TimeSelectL = new System.Windows.Forms.ListBox();
			this.HistoryHostText = new System.Windows.Forms.TextBox();
			this.label20 = new System.Windows.Forms.Label();
			this.groupBox15 = new System.Windows.Forms.GroupBox();
			this.DateSelectL = new System.Windows.Forms.ListBox();
			this.groupBox20 = new System.Windows.Forms.GroupBox();
			this.ViewListL = new System.Windows.Forms.ListBox();
			this.RangeListL = new System.Windows.Forms.ListBox();
			this.AddRange = new System.Windows.Forms.Button();
			this.RemoveRAll = new System.Windows.Forms.Button();
			this.AddRAll = new System.Windows.Forms.Button();
			this.RemoveRange = new System.Windows.Forms.Button();
			this.RangeList = new System.Windows.Forms.ComboBox();
			this.ViewList = new System.Windows.Forms.ComboBox();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.UOnly = new System.Windows.Forms.RadioButton();
			this.DOnly = new System.Windows.Forms.RadioButton();
			this.DU = new System.Windows.Forms.RadioButton();
			this.StandingC = new ChartDirector.WinChartViewer();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.HOView = new System.Windows.Forms.RadioButton();
			this.BWView = new System.Windows.Forms.RadioButton();
			this.DateSelect = new System.Windows.Forms.ComboBox();
			this.groupBox19 = new System.Windows.Forms.GroupBox();
			this.Pic2 = new System.Windows.Forms.PictureBox();
			this.Pic1 = new System.Windows.Forms.PictureBox();
			this.groupBox7 = new System.Windows.Forms.GroupBox();
			this.RefIP = new System.Windows.Forms.TextBox();
			this.label17 = new System.Windows.Forms.Label();
			this.ReferencePoint = new System.Windows.Forms.ListBox();
			this.AddRP = new System.Windows.Forms.Button();
			this.testRP = new System.Windows.Forms.Button();
			this.RemoveRP = new System.Windows.Forms.Button();
			this.Connect_R = new System.Windows.Forms.CheckBox();
			this.DownTime = new System.Windows.Forms.TextBox();
			this.ReferencePointL = new System.Windows.Forms.ComboBox();
			this.Tray_Icon2 = new System.Windows.Forms.NotifyIcon(this.components);
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.menuItem1 = new System.Windows.Forms.MenuItem();
			this.menuItem2 = new System.Windows.Forms.MenuItem();
			this.menuItem3 = new System.Windows.Forms.MenuItem();
			this.menuItem4 = new System.Windows.Forms.MenuItem();
			this.menuItem5 = new System.Windows.Forms.MenuItem();
			this.Network_GroupL = new System.Windows.Forms.ListBox();
			this.IPNText = new System.Windows.Forms.Label();
			this.PJ_Name = new System.Windows.Forms.TextBox();
			this.groupBox17 = new System.Windows.Forms.GroupBox();
			this.timer3 = new System.Windows.Forms.Timer(this.components);
			this.tabControl2.SuspendLayout();
			this.tabPage1.SuspendLayout();
			this.groupBox14.SuspendLayout();
			this.groupBox6.SuspendLayout();
			this.groupBox5.SuspendLayout();
			this.tabPage3.SuspendLayout();
			this.groupBox13.SuspendLayout();
			this.groupBox12.SuspendLayout();
			this.groupBox1.SuspendLayout();
			this.tabPage4.SuspendLayout();
			this.groupBox11.SuspendLayout();
			this.groupBox10.SuspendLayout();
			this.groupBox9.SuspendLayout();
			this.groupBox8.SuspendLayout();
			this.groupBox4.SuspendLayout();
			this.groupBox22.SuspendLayout();
			this.tabPage5.SuspendLayout();
			this.groupBox16.SuspendLayout();
			this.groupBox15.SuspendLayout();
			this.groupBox20.SuspendLayout();
			this.groupBox3.SuspendLayout();
			this.groupBox2.SuspendLayout();
			this.groupBox19.SuspendLayout();
			this.groupBox7.SuspendLayout();
			this.groupBox17.SuspendLayout();
			this.SuspendLayout();
			// 
			// txtData
			// 
			this.txtData.Location = new System.Drawing.Point(24, 120);
			this.txtData.Multiline = true;
			this.txtData.Name = "txtData";
			this.txtData.ScrollBars = System.Windows.Forms.ScrollBars.Both;
			this.txtData.Size = new System.Drawing.Size(696, 72);
			this.txtData.TabIndex = 0;
			this.txtData.Text = "";
			this.txtData.Visible = false;
			// 
			// timer1
			// 
			this.timer1.Enabled = true;
			this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
			// 
			// timer2
			// 
			this.timer2.Enabled = true;
			this.timer2.Interval = 60000;
			this.timer2.Tick += new System.EventHandler(this.timer2_Tick);
			// 
			// AddSnmpIP
			// 
			this.AddSnmpIP.Location = new System.Drawing.Point(16, 40);
			this.AddSnmpIP.Name = "AddSnmpIP";
			this.AddSnmpIP.Size = new System.Drawing.Size(144, 20);
			this.AddSnmpIP.TabIndex = 13;
			this.AddSnmpIP.Text = "<Add Snmp IP Here>";
			// 
			// Add_Network_Group
			// 
			this.Add_Network_Group.Location = new System.Drawing.Point(16, 64);
			this.Add_Network_Group.Name = "Add_Network_Group";
			this.Add_Network_Group.Size = new System.Drawing.Size(112, 24);
			this.Add_Network_Group.TabIndex = 16;
			this.Add_Network_Group.Text = "Add Network";
			this.Add_Network_Group.Click += new System.EventHandler(this.Add_Network_Group_Click);
			// 
			// Add_Snmp_Com
			// 
			this.Add_Snmp_Com.Location = new System.Drawing.Point(344, 32);
			this.Add_Snmp_Com.Name = "Add_Snmp_Com";
			this.Add_Snmp_Com.Size = new System.Drawing.Size(80, 24);
			this.Add_Snmp_Com.TabIndex = 18;
			this.Add_Snmp_Com.Text = "Add ";
			this.Add_Snmp_Com.Click += new System.EventHandler(this.Add_Snmp_Com_Click);
			// 
			// AddSnmpCom
			// 
			this.AddSnmpCom.Location = new System.Drawing.Point(168, 40);
			this.AddSnmpCom.Name = "AddSnmpCom";
			this.AddSnmpCom.Size = new System.Drawing.Size(160, 20);
			this.AddSnmpCom.TabIndex = 17;
			this.AddSnmpCom.Text = "<Add Snmp Community Here>";
			// 
			// Config_Name
			// 
			this.Config_Name.Location = new System.Drawing.Point(160, 24);
			this.Config_Name.Name = "Config_Name";
			this.Config_Name.Size = new System.Drawing.Size(216, 21);
			this.Config_Name.TabIndex = 21;
			this.Config_Name.SelectedIndexChanged += new System.EventHandler(this.Config_Name_SelectedIndexChanged);
			// 
			// Tray_Icon
			// 
			this.Tray_Icon.Icon = ((System.Drawing.Icon)(resources.GetObject("Tray_Icon.Icon")));
			this.Tray_Icon.Text = "NetViewer";
			this.Tray_Icon.Visible = true;
			this.Tray_Icon.DoubleClick += new System.EventHandler(this.Tray_Icon_DoubleClick);
			// 
			// testSnmp
			// 
			this.testSnmp.Location = new System.Drawing.Point(16, 32);
			this.testSnmp.Name = "testSnmp";
			this.testSnmp.Size = new System.Drawing.Size(96, 32);
			this.testSnmp.TabIndex = 26;
			this.testSnmp.Text = "Start Scan";
			this.testSnmp.Click += new System.EventHandler(this.testSnmp_Click);
			// 
			// tabControl2
			// 
			this.tabControl2.Controls.Add(this.tabPage1);
			this.tabControl2.Controls.Add(this.tabPage3);
			this.tabControl2.Controls.Add(this.tabPage4);
			this.tabControl2.Controls.Add(this.tabPage5);
			this.tabControl2.Location = new System.Drawing.Point(240, 8);
			this.tabControl2.Name = "tabControl2";
			this.tabControl2.SelectedIndex = 0;
			this.tabControl2.Size = new System.Drawing.Size(736, 544);
			this.tabControl2.TabIndex = 29;
			// 
			// tabPage1
			// 
			this.tabPage1.Controls.Add(this.SystemLogPanel);
			this.tabPage1.Controls.Add(this.groupBox14);
			this.tabPage1.Controls.Add(this.groupBox6);
			this.tabPage1.Controls.Add(this.groupBox5);
			this.tabPage1.Controls.Add(this.txtData);
			this.tabPage1.Location = new System.Drawing.Point(4, 22);
			this.tabPage1.Name = "tabPage1";
			this.tabPage1.Size = new System.Drawing.Size(728, 518);
			this.tabPage1.TabIndex = 0;
			this.tabPage1.Text = "Project Control";
			// 
			// SystemLogPanel
			// 
			this.SystemLogPanel.Location = new System.Drawing.Point(16, 296);
			this.SystemLogPanel.Multiline = true;
			this.SystemLogPanel.Name = "SystemLogPanel";
			this.SystemLogPanel.ReadOnly = true;
			this.SystemLogPanel.ScrollBars = System.Windows.Forms.ScrollBars.Both;
			this.SystemLogPanel.Size = new System.Drawing.Size(696, 208);
			this.SystemLogPanel.TabIndex = 43;
			this.SystemLogPanel.Text = "";
			// 
			// groupBox14
			// 
			this.groupBox14.Controls.Add(this.CreateBlankCF);
			this.groupBox14.Controls.Add(this.Config_Name);
			this.groupBox14.Location = new System.Drawing.Point(16, 16);
			this.groupBox14.Name = "groupBox14";
			this.groupBox14.Size = new System.Drawing.Size(392, 56);
			this.groupBox14.TabIndex = 40;
			this.groupBox14.TabStop = false;
			this.groupBox14.Text = "Project Name (Create/Choose)";
			// 
			// CreateBlankCF
			// 
			this.CreateBlankCF.Location = new System.Drawing.Point(16, 24);
			this.CreateBlankCF.Name = "CreateBlankCF";
			this.CreateBlankCF.Size = new System.Drawing.Size(128, 23);
			this.CreateBlankCF.TabIndex = 22;
			this.CreateBlankCF.Text = "Create New Project";
			this.CreateBlankCF.Click += new System.EventHandler(this.CreateBlankCF_Click);
			// 
			// groupBox6
			// 
			this.groupBox6.Controls.Add(this.label25);
			this.groupBox6.Controls.Add(this.label24);
			this.groupBox6.Controls.Add(this.label19);
			this.groupBox6.Controls.Add(this.label18);
			this.groupBox6.Controls.Add(this.Port_Oid);
			this.groupBox6.Controls.Add(this.PortDSC);
			this.groupBox6.Controls.Add(this.PortDSC2);
			this.groupBox6.Controls.Add(this.Port_Oid2);
			this.groupBox6.Controls.Add(this.Network_Group);
			this.groupBox6.Controls.Add(this.Add_Network_Group);
			this.groupBox6.Controls.Add(this.Edit_Network_Group);
			this.groupBox6.Controls.Add(this.SNMP_Component);
			this.groupBox6.Location = new System.Drawing.Point(16, 176);
			this.groupBox6.Name = "groupBox6";
			this.groupBox6.Size = new System.Drawing.Size(696, 104);
			this.groupBox6.TabIndex = 38;
			this.groupBox6.TabStop = false;
			this.groupBox6.Text = "Add IP Range";
			// 
			// label25
			// 
			this.label25.Location = new System.Drawing.Point(544, 24);
			this.label25.Name = "label25";
			this.label25.Size = new System.Drawing.Size(100, 16);
			this.label25.TabIndex = 36;
			this.label25.Text = "Port Description";
			// 
			// label24
			// 
			this.label24.Location = new System.Drawing.Point(464, 24);
			this.label24.Name = "label24";
			this.label24.Size = new System.Drawing.Size(72, 16);
			this.label24.TabIndex = 35;
			this.label24.Text = "Port Interface";
			// 
			// label19
			// 
			this.label19.Location = new System.Drawing.Point(248, 24);
			this.label19.Name = "label19";
			this.label19.Size = new System.Drawing.Size(100, 16);
			this.label19.TabIndex = 34;
			this.label19.Text = "Snmp Component";
			// 
			// label18
			// 
			this.label18.Location = new System.Drawing.Point(16, 24);
			this.label18.Name = "label18";
			this.label18.Size = new System.Drawing.Size(100, 16);
			this.label18.TabIndex = 33;
			this.label18.Text = "IP Range";
			// 
			// Port_Oid
			// 
			this.Port_Oid.Location = new System.Drawing.Point(464, 40);
			this.Port_Oid.Name = "Port_Oid";
			this.Port_Oid.Size = new System.Drawing.Size(72, 21);
			this.Port_Oid.TabIndex = 28;
			this.Port_Oid.Text = "<Port ID> ";
			this.Port_Oid.SelectedIndexChanged += new System.EventHandler(this.Port_Oid_SelectedIndexChanged);
			// 
			// PortDSC
			// 
			this.PortDSC.Location = new System.Drawing.Point(544, 40);
			this.PortDSC.Name = "PortDSC";
			this.PortDSC.ReadOnly = true;
			this.PortDSC.Size = new System.Drawing.Size(144, 20);
			this.PortDSC.TabIndex = 29;
			this.PortDSC.Text = "Port ID Description";
			// 
			// PortDSC2
			// 
			this.PortDSC2.Enabled = false;
			this.PortDSC2.Location = new System.Drawing.Point(544, 64);
			this.PortDSC2.Name = "PortDSC2";
			this.PortDSC2.ReadOnly = true;
			this.PortDSC2.Size = new System.Drawing.Size(144, 20);
			this.PortDSC2.TabIndex = 32;
			this.PortDSC2.Text = "Port ID Description";
			// 
			// Port_Oid2
			// 
			this.Port_Oid2.Enabled = false;
			this.Port_Oid2.Location = new System.Drawing.Point(464, 64);
			this.Port_Oid2.Name = "Port_Oid2";
			this.Port_Oid2.Size = new System.Drawing.Size(72, 21);
			this.Port_Oid2.TabIndex = 31;
			this.Port_Oid2.Text = "<Port ID> ";
			this.Port_Oid2.SelectedIndexChanged += new System.EventHandler(this.Port_Oid2_SelectedIndexChanged);
			// 
			// Network_Group
			// 
			this.Network_Group.ItemHeight = 13;
			this.Network_Group.Location = new System.Drawing.Point(16, 40);
			this.Network_Group.Name = "Network_Group";
			this.Network_Group.Size = new System.Drawing.Size(224, 21);
			this.Network_Group.TabIndex = 24;
			this.Network_Group.Text = "<Add Network Group Here>";
			this.Network_Group.TextChanged += new System.EventHandler(this.Network_Group_TextChanged);
			this.Network_Group.SelectedIndexChanged += new System.EventHandler(this.Network_Group_SelectedIndexChanged);
			// 
			// Edit_Network_Group
			// 
			this.Edit_Network_Group.Location = new System.Drawing.Point(128, 64);
			this.Edit_Network_Group.Name = "Edit_Network_Group";
			this.Edit_Network_Group.Size = new System.Drawing.Size(112, 24);
			this.Edit_Network_Group.TabIndex = 30;
			this.Edit_Network_Group.Text = "Edit Network";
			this.Edit_Network_Group.Click += new System.EventHandler(this.Edit_Network_Group_Click);
			// 
			// SNMP_Component
			// 
			this.SNMP_Component.Location = new System.Drawing.Point(248, 40);
			this.SNMP_Component.Name = "SNMP_Component";
			this.SNMP_Component.Size = new System.Drawing.Size(208, 21);
			this.SNMP_Component.TabIndex = 27;
			this.SNMP_Component.Text = "<Select SNMP Component>";
			this.SNMP_Component.SelectedIndexChanged += new System.EventHandler(this.SNMP_Component_SelectedIndexChanged);
			// 
			// groupBox5
			// 
			this.groupBox5.Controls.Add(this.AddSnmpIP);
			this.groupBox5.Controls.Add(this.AddSnmpCom);
			this.groupBox5.Controls.Add(this.Add_Snmp_Com);
			this.groupBox5.Controls.Add(this.SNMP_ComponentL);
			this.groupBox5.Controls.Add(this.label21);
			this.groupBox5.Controls.Add(this.label22);
			this.groupBox5.Controls.Add(this.label23);
			this.groupBox5.Location = new System.Drawing.Point(16, 80);
			this.groupBox5.Name = "groupBox5";
			this.groupBox5.Size = new System.Drawing.Size(696, 80);
			this.groupBox5.TabIndex = 37;
			this.groupBox5.TabStop = false;
			this.groupBox5.Text = "Add Snmp Component";
			// 
			// SNMP_ComponentL
			// 
			this.SNMP_ComponentL.Location = new System.Drawing.Point(440, 24);
			this.SNMP_ComponentL.Name = "SNMP_ComponentL";
			this.SNMP_ComponentL.Size = new System.Drawing.Size(240, 43);
			this.SNMP_ComponentL.TabIndex = 38;
			// 
			// label21
			// 
			this.label21.Location = new System.Drawing.Point(16, 24);
			this.label21.Name = "label21";
			this.label21.Size = new System.Drawing.Size(100, 16);
			this.label21.TabIndex = 43;
			this.label21.Text = "IP of Snmp Device";
			// 
			// label22
			// 
			this.label22.Location = new System.Drawing.Point(168, 24);
			this.label22.Name = "label22";
			this.label22.Size = new System.Drawing.Size(128, 16);
			this.label22.TabIndex = 43;
			this.label22.Text = "Snmp Read Comunity";
			// 
			// label23
			// 
			this.label23.Location = new System.Drawing.Point(440, 0);
			this.label23.Name = "label23";
			this.label23.Size = new System.Drawing.Size(128, 16);
			this.label23.TabIndex = 43;
			this.label23.Text = "Snmp Component List";
			// 
			// tabPage3
			// 
			this.tabPage3.Controls.Add(this.groupBox13);
			this.tabPage3.Controls.Add(this.groupBox12);
			this.tabPage3.Controls.Add(this.groupBox1);
			this.tabPage3.Controls.Add(this.StartHostScan);
			this.tabPage3.Location = new System.Drawing.Point(4, 22);
			this.tabPage3.Name = "tabPage3";
			this.tabPage3.Size = new System.Drawing.Size(728, 518);
			this.tabPage3.TabIndex = 2;
			this.tabPage3.Text = "Host Detail";
			// 
			// groupBox13
			// 
			this.groupBox13.Controls.Add(this.HostDetailBox);
			this.groupBox13.Location = new System.Drawing.Point(184, 16);
			this.groupBox13.Name = "groupBox13";
			this.groupBox13.Size = new System.Drawing.Size(528, 488);
			this.groupBox13.TabIndex = 5;
			this.groupBox13.TabStop = false;
			this.groupBox13.Text = "Scan Result";
			// 
			// HostDetailBox
			// 
			this.HostDetailBox.Location = new System.Drawing.Point(16, 24);
			this.HostDetailBox.Multiline = true;
			this.HostDetailBox.Name = "HostDetailBox";
			this.HostDetailBox.ReadOnly = true;
			this.HostDetailBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
			this.HostDetailBox.Size = new System.Drawing.Size(496, 448);
			this.HostDetailBox.TabIndex = 2;
			this.HostDetailBox.Text = "";
			// 
			// groupBox12
			// 
			this.groupBox12.Controls.Add(this.HostIp);
			this.groupBox12.Location = new System.Drawing.Point(16, 16);
			this.groupBox12.Name = "groupBox12";
			this.groupBox12.Size = new System.Drawing.Size(152, 56);
			this.groupBox12.TabIndex = 4;
			this.groupBox12.TabStop = false;
			this.groupBox12.Text = "Host Name or IP";
			// 
			// HostIp
			// 
			this.HostIp.Location = new System.Drawing.Point(8, 24);
			this.HostIp.Name = "HostIp";
			this.HostIp.Size = new System.Drawing.Size(136, 20);
			this.HostIp.TabIndex = 0;
			this.HostIp.Text = "";
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.PortSpecificScan);
			this.groupBox1.Controls.Add(this.TrojanScan);
			this.groupBox1.Controls.Add(this.HostServiceScan);
			this.groupBox1.Controls.Add(this.PortSpecific);
			this.groupBox1.Location = new System.Drawing.Point(16, 72);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(152, 136);
			this.groupBox1.TabIndex = 3;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Scan Detail";
			// 
			// PortSpecificScan
			// 
			this.PortSpecificScan.Location = new System.Drawing.Point(16, 72);
			this.PortSpecificScan.Name = "PortSpecificScan";
			this.PortSpecificScan.Size = new System.Drawing.Size(120, 24);
			this.PortSpecificScan.TabIndex = 2;
			this.PortSpecificScan.Text = "Port Specific Scan";
			this.PortSpecificScan.CheckedChanged += new System.EventHandler(this.PortSpecificScan_CheckedChanged);
			// 
			// TrojanScan
			// 
			this.TrojanScan.Location = new System.Drawing.Point(16, 48);
			this.TrojanScan.Name = "TrojanScan";
			this.TrojanScan.TabIndex = 1;
			this.TrojanScan.Text = "Trojan Scan";
			// 
			// HostServiceScan
			// 
			this.HostServiceScan.Checked = true;
			this.HostServiceScan.Location = new System.Drawing.Point(16, 24);
			this.HostServiceScan.Name = "HostServiceScan";
			this.HostServiceScan.TabIndex = 0;
			this.HostServiceScan.TabStop = true;
			this.HostServiceScan.Text = "Service Scan";
			// 
			// PortSpecific
			// 
			this.PortSpecific.Enabled = false;
			this.PortSpecific.Location = new System.Drawing.Point(16, 104);
			this.PortSpecific.Name = "PortSpecific";
			this.PortSpecific.Size = new System.Drawing.Size(120, 20);
			this.PortSpecific.TabIndex = 4;
			this.PortSpecific.Text = "";
			// 
			// StartHostScan
			// 
			this.StartHostScan.Location = new System.Drawing.Point(32, 224);
			this.StartHostScan.Name = "StartHostScan";
			this.StartHostScan.Size = new System.Drawing.Size(120, 23);
			this.StartHostScan.TabIndex = 1;
			this.StartHostScan.Text = "Start Scan";
			this.StartHostScan.Click += new System.EventHandler(this.StartHostScan_Click);
			// 
			// tabPage4
			// 
			this.tabPage4.Controls.Add(this.groupBox11);
			this.tabPage4.Controls.Add(this.groupBox10);
			this.tabPage4.Controls.Add(this.groupBox9);
			this.tabPage4.Controls.Add(this.groupBox8);
			this.tabPage4.Controls.Add(this.groupBox4);
			this.tabPage4.Controls.Add(this.groupBox22);
			this.tabPage4.Controls.Add(this.BWRStanding);
			this.tabPage4.Location = new System.Drawing.Point(4, 22);
			this.tabPage4.Name = "tabPage4";
			this.tabPage4.Size = new System.Drawing.Size(728, 518);
			this.tabPage4.TabIndex = 3;
			this.tabPage4.Text = "Ranking Table";
			// 
			// groupBox11
			// 
			this.groupBox11.Controls.Add(this.StandingRange);
			this.groupBox11.Controls.Add(this.StandingRangeq);
			this.groupBox11.Location = new System.Drawing.Point(24, 16);
			this.groupBox11.Name = "groupBox11";
			this.groupBox11.Size = new System.Drawing.Size(216, 120);
			this.groupBox11.TabIndex = 35;
			this.groupBox11.TabStop = false;
			this.groupBox11.Text = "IP Range Select";
			// 
			// StandingRange
			// 
			this.StandingRange.Location = new System.Drawing.Point(16, 24);
			this.StandingRange.Name = "StandingRange";
			this.StandingRange.Size = new System.Drawing.Size(184, 82);
			this.StandingRange.TabIndex = 16;
			this.StandingRange.SelectedIndexChanged += new System.EventHandler(this.StandingRange_SelectedIndexChanged);
			// 
			// StandingRangeq
			// 
			this.StandingRangeq.Location = new System.Drawing.Point(16, 48);
			this.StandingRangeq.Name = "StandingRangeq";
			this.StandingRangeq.Size = new System.Drawing.Size(168, 21);
			this.StandingRangeq.TabIndex = 15;
			this.StandingRangeq.SelectedIndexChanged += new System.EventHandler(this.StandingRange_SelectedIndexChanged);
			// 
			// groupBox10
			// 
			this.groupBox10.Controls.Add(this.Upload1);
			this.groupBox10.Controls.Add(this.Upload5);
			this.groupBox10.Controls.Add(this.Upload4);
			this.groupBox10.Controls.Add(this.Upload3);
			this.groupBox10.Controls.Add(this.Upload2);
			this.groupBox10.Controls.Add(this.label15);
			this.groupBox10.Controls.Add(this.label13);
			this.groupBox10.Controls.Add(this.label12);
			this.groupBox10.Controls.Add(this.label14);
			this.groupBox10.Controls.Add(this.label11);
			this.groupBox10.Location = new System.Drawing.Point(560, 16);
			this.groupBox10.Name = "groupBox10";
			this.groupBox10.Size = new System.Drawing.Size(144, 152);
			this.groupBox10.TabIndex = 34;
			this.groupBox10.TabStop = false;
			this.groupBox10.Text = "Upload Ranking";
			// 
			// Upload1
			// 
			this.Upload1.Location = new System.Drawing.Point(32, 24);
			this.Upload1.Name = "Upload1";
			this.Upload1.ReadOnly = true;
			this.Upload1.TabIndex = 8;
			this.Upload1.Text = "";
			// 
			// Upload5
			// 
			this.Upload5.Location = new System.Drawing.Point(32, 120);
			this.Upload5.Name = "Upload5";
			this.Upload5.ReadOnly = true;
			this.Upload5.TabIndex = 13;
			this.Upload5.Text = "";
			// 
			// Upload4
			// 
			this.Upload4.Location = new System.Drawing.Point(32, 96);
			this.Upload4.Name = "Upload4";
			this.Upload4.ReadOnly = true;
			this.Upload4.TabIndex = 12;
			this.Upload4.Text = "";
			// 
			// Upload3
			// 
			this.Upload3.Location = new System.Drawing.Point(32, 72);
			this.Upload3.Name = "Upload3";
			this.Upload3.ReadOnly = true;
			this.Upload3.TabIndex = 11;
			this.Upload3.Text = "";
			// 
			// Upload2
			// 
			this.Upload2.Location = new System.Drawing.Point(32, 48);
			this.Upload2.Name = "Upload2";
			this.Upload2.ReadOnly = true;
			this.Upload2.TabIndex = 10;
			this.Upload2.Text = "";
			// 
			// label15
			// 
			this.label15.Location = new System.Drawing.Point(9, 75);
			this.label15.Name = "label15";
			this.label15.Size = new System.Drawing.Size(24, 16);
			this.label15.TabIndex = 47;
			this.label15.Text = "3rd";
			// 
			// label13
			// 
			this.label13.Location = new System.Drawing.Point(9, 123);
			this.label13.Name = "label13";
			this.label13.Size = new System.Drawing.Size(24, 16);
			this.label13.TabIndex = 49;
			this.label13.Text = "5th";
			// 
			// label12
			// 
			this.label12.Location = new System.Drawing.Point(9, 27);
			this.label12.Name = "label12";
			this.label12.Size = new System.Drawing.Size(24, 16);
			this.label12.TabIndex = 45;
			this.label12.Text = "1st";
			// 
			// label14
			// 
			this.label14.Location = new System.Drawing.Point(9, 99);
			this.label14.Name = "label14";
			this.label14.Size = new System.Drawing.Size(24, 16);
			this.label14.TabIndex = 48;
			this.label14.Text = "4th";
			// 
			// label11
			// 
			this.label11.Location = new System.Drawing.Point(9, 51);
			this.label11.Name = "label11";
			this.label11.Size = new System.Drawing.Size(24, 16);
			this.label11.TabIndex = 46;
			this.label11.Text = "2nd";
			// 
			// groupBox9
			// 
			this.groupBox9.Controls.Add(this.Download5);
			this.groupBox9.Controls.Add(this.Download4);
			this.groupBox9.Controls.Add(this.Download3);
			this.groupBox9.Controls.Add(this.Download2);
			this.groupBox9.Controls.Add(this.Download1);
			this.groupBox9.Controls.Add(this.label7);
			this.groupBox9.Controls.Add(this.label6);
			this.groupBox9.Controls.Add(this.label10);
			this.groupBox9.Controls.Add(this.label9);
			this.groupBox9.Controls.Add(this.label8);
			this.groupBox9.Location = new System.Drawing.Point(408, 16);
			this.groupBox9.Name = "groupBox9";
			this.groupBox9.Size = new System.Drawing.Size(144, 152);
			this.groupBox9.TabIndex = 33;
			this.groupBox9.TabStop = false;
			this.groupBox9.Text = "Download Ranking";
			// 
			// Download5
			// 
			this.Download5.Location = new System.Drawing.Point(32, 120);
			this.Download5.Name = "Download5";
			this.Download5.ReadOnly = true;
			this.Download5.TabIndex = 9;
			this.Download5.Text = "";
			// 
			// Download4
			// 
			this.Download4.Location = new System.Drawing.Point(32, 96);
			this.Download4.Name = "Download4";
			this.Download4.ReadOnly = true;
			this.Download4.TabIndex = 8;
			this.Download4.Text = "";
			// 
			// Download3
			// 
			this.Download3.Location = new System.Drawing.Point(32, 72);
			this.Download3.Name = "Download3";
			this.Download3.ReadOnly = true;
			this.Download3.TabIndex = 7;
			this.Download3.Text = "";
			// 
			// Download2
			// 
			this.Download2.Location = new System.Drawing.Point(32, 48);
			this.Download2.Name = "Download2";
			this.Download2.ReadOnly = true;
			this.Download2.TabIndex = 6;
			this.Download2.Text = "";
			// 
			// Download1
			// 
			this.Download1.Location = new System.Drawing.Point(32, 24);
			this.Download1.Name = "Download1";
			this.Download1.ReadOnly = true;
			this.Download1.TabIndex = 5;
			this.Download1.Text = "";
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(9, 51);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(24, 16);
			this.label7.TabIndex = 41;
			this.label7.Text = "2nd";
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(9, 27);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(24, 16);
			this.label6.TabIndex = 40;
			this.label6.Text = "1st";
			// 
			// label10
			// 
			this.label10.Location = new System.Drawing.Point(9, 123);
			this.label10.Name = "label10";
			this.label10.Size = new System.Drawing.Size(24, 16);
			this.label10.TabIndex = 44;
			this.label10.Text = "5th";
			// 
			// label9
			// 
			this.label9.Location = new System.Drawing.Point(9, 99);
			this.label9.Name = "label9";
			this.label9.Size = new System.Drawing.Size(24, 16);
			this.label9.TabIndex = 43;
			this.label9.Text = "4th";
			// 
			// label8
			// 
			this.label8.Location = new System.Drawing.Point(9, 75);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(24, 16);
			this.label8.TabIndex = 42;
			this.label8.Text = "3rd";
			// 
			// groupBox8
			// 
			this.groupBox8.Controls.Add(this.OverAll1);
			this.groupBox8.Controls.Add(this.OverAll5);
			this.groupBox8.Controls.Add(this.OverAll4);
			this.groupBox8.Controls.Add(this.OverAll3);
			this.groupBox8.Controls.Add(this.OverAll2);
			this.groupBox8.Controls.Add(this.label1);
			this.groupBox8.Controls.Add(this.label2);
			this.groupBox8.Controls.Add(this.label3);
			this.groupBox8.Controls.Add(this.label4);
			this.groupBox8.Controls.Add(this.label5);
			this.groupBox8.Location = new System.Drawing.Point(256, 16);
			this.groupBox8.Name = "groupBox8";
			this.groupBox8.Size = new System.Drawing.Size(144, 152);
			this.groupBox8.TabIndex = 32;
			this.groupBox8.TabStop = false;
			this.groupBox8.Text = "Overall Ranking";
			// 
			// OverAll1
			// 
			this.OverAll1.Location = new System.Drawing.Point(32, 24);
			this.OverAll1.Name = "OverAll1";
			this.OverAll1.ReadOnly = true;
			this.OverAll1.TabIndex = 0;
			this.OverAll1.Text = "";
			// 
			// OverAll5
			// 
			this.OverAll5.Location = new System.Drawing.Point(32, 120);
			this.OverAll5.Name = "OverAll5";
			this.OverAll5.ReadOnly = true;
			this.OverAll5.TabIndex = 4;
			this.OverAll5.Text = "";
			// 
			// OverAll4
			// 
			this.OverAll4.Location = new System.Drawing.Point(32, 96);
			this.OverAll4.Name = "OverAll4";
			this.OverAll4.ReadOnly = true;
			this.OverAll4.TabIndex = 3;
			this.OverAll4.Text = "";
			// 
			// OverAll3
			// 
			this.OverAll3.Location = new System.Drawing.Point(32, 72);
			this.OverAll3.Name = "OverAll3";
			this.OverAll3.ReadOnly = true;
			this.OverAll3.TabIndex = 2;
			this.OverAll3.Text = "";
			// 
			// OverAll2
			// 
			this.OverAll2.Location = new System.Drawing.Point(32, 48);
			this.OverAll2.Name = "OverAll2";
			this.OverAll2.ReadOnly = true;
			this.OverAll2.TabIndex = 1;
			this.OverAll2.Text = "";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(10, 27);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(24, 16);
			this.label1.TabIndex = 35;
			this.label1.Text = "1st";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(9, 51);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(24, 16);
			this.label2.TabIndex = 36;
			this.label2.Text = "2nd";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(9, 75);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(24, 16);
			this.label3.TabIndex = 37;
			this.label3.Text = "3rd";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(9, 99);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(24, 16);
			this.label4.TabIndex = 38;
			this.label4.Text = "4th";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(9, 123);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(24, 16);
			this.label5.TabIndex = 39;
			this.label5.Text = "5th";
			// 
			// groupBox4
			// 
			this.groupBox4.Controls.Add(this.UStand);
			this.groupBox4.Controls.Add(this.DStand);
			this.groupBox4.Controls.Add(this.DUStand);
			this.groupBox4.Location = new System.Drawing.Point(24, 144);
			this.groupBox4.Name = "groupBox4";
			this.groupBox4.Size = new System.Drawing.Size(216, 80);
			this.groupBox4.TabIndex = 31;
			this.groupBox4.TabStop = false;
			this.groupBox4.Text = "Graph Subdomain";
			// 
			// UStand
			// 
			this.UStand.Location = new System.Drawing.Point(120, 48);
			this.UStand.Name = "UStand";
			this.UStand.Size = new System.Drawing.Size(88, 24);
			this.UStand.TabIndex = 2;
			this.UStand.Text = "Upload Only";
			this.UStand.CheckedChanged += new System.EventHandler(this.UStand_CheckedChanged);
			// 
			// DStand
			// 
			this.DStand.Location = new System.Drawing.Point(24, 48);
			this.DStand.Name = "DStand";
			this.DStand.TabIndex = 1;
			this.DStand.Text = "Download Only";
			this.DStand.CheckedChanged += new System.EventHandler(this.DStand_CheckedChanged);
			// 
			// DUStand
			// 
			this.DUStand.Checked = true;
			this.DUStand.Location = new System.Drawing.Point(24, 24);
			this.DUStand.Name = "DUStand";
			this.DUStand.Size = new System.Drawing.Size(80, 24);
			this.DUStand.TabIndex = 0;
			this.DUStand.TabStop = true;
			this.DUStand.Text = "Overall";
			this.DUStand.CheckedChanged += new System.EventHandler(this.DUStand_CheckedChanged);
			// 
			// groupBox22
			// 
			this.groupBox22.Controls.Add(this.DABWView);
			this.groupBox22.Controls.Add(this.DUBWView);
			this.groupBox22.Location = new System.Drawing.Point(256, 176);
			this.groupBox22.Name = "groupBox22";
			this.groupBox22.Size = new System.Drawing.Size(216, 48);
			this.groupBox22.TabIndex = 36;
			this.groupBox22.TabStop = false;
			this.groupBox22.Text = "Graph Domain";
			// 
			// DABWView
			// 
			this.DABWView.Location = new System.Drawing.Point(112, 16);
			this.DABWView.Name = "DABWView";
			this.DABWView.Size = new System.Drawing.Size(88, 24);
			this.DABWView.TabIndex = 1;
			this.DABWView.Text = "Average BW";
			// 
			// DUBWView
			// 
			this.DUBWView.Checked = true;
			this.DUBWView.Location = new System.Drawing.Point(24, 16);
			this.DUBWView.Name = "DUBWView";
			this.DUBWView.Size = new System.Drawing.Size(80, 24);
			this.DUBWView.TabIndex = 0;
			this.DUBWView.TabStop = true;
			this.DUBWView.Text = "Used BW";
			this.DUBWView.CheckedChanged += new System.EventHandler(this.DUBWView_CheckedChanged);
			// 
			// BWRStanding
			// 
			this.BWRStanding.Location = new System.Drawing.Point(24, 232);
			this.BWRStanding.Name = "BWRStanding";
			this.BWRStanding.Size = new System.Drawing.Size(224, 112);
			this.BWRStanding.TabIndex = 30;
			this.BWRStanding.TabStop = false;
			// 
			// tabPage5
			// 
			this.tabPage5.Controls.Add(this.groupBox16);
			this.tabPage5.Controls.Add(this.groupBox15);
			this.tabPage5.Controls.Add(this.groupBox20);
			this.tabPage5.Controls.Add(this.groupBox3);
			this.tabPage5.Controls.Add(this.StandingC);
			this.tabPage5.Controls.Add(this.groupBox2);
			this.tabPage5.Controls.Add(this.DateSelect);
			this.tabPage5.Location = new System.Drawing.Point(4, 22);
			this.tabPage5.Name = "tabPage5";
			this.tabPage5.Size = new System.Drawing.Size(728, 518);
			this.tabPage5.TabIndex = 4;
			this.tabPage5.Text = "History Graph";
			// 
			// groupBox16
			// 
			this.groupBox16.Controls.Add(this.label16);
			this.groupBox16.Controls.Add(this.TimeSelectL);
			this.groupBox16.Controls.Add(this.HistoryHostText);
			this.groupBox16.Controls.Add(this.label20);
			this.groupBox16.Location = new System.Drawing.Point(328, 16);
			this.groupBox16.Name = "groupBox16";
			this.groupBox16.Size = new System.Drawing.Size(392, 184);
			this.groupBox16.TabIndex = 61;
			this.groupBox16.TabStop = false;
			this.groupBox16.Text = "Online History";
			// 
			// label16
			// 
			this.label16.Location = new System.Drawing.Point(8, 16);
			this.label16.Name = "label16";
			this.label16.Size = new System.Drawing.Size(80, 16);
			this.label16.TabIndex = 60;
			this.label16.Text = "Time Selectbar";
			// 
			// TimeSelectL
			// 
			this.TimeSelectL.Location = new System.Drawing.Point(8, 32);
			this.TimeSelectL.Name = "TimeSelectL";
			this.TimeSelectL.Size = new System.Drawing.Size(80, 134);
			this.TimeSelectL.TabIndex = 56;
			this.TimeSelectL.SelectedIndexChanged += new System.EventHandler(this.TimeSelectL_SelectedIndexChanged);
			// 
			// HistoryHostText
			// 
			this.HistoryHostText.Location = new System.Drawing.Point(112, 32);
			this.HistoryHostText.Multiline = true;
			this.HistoryHostText.Name = "HistoryHostText";
			this.HistoryHostText.ReadOnly = true;
			this.HistoryHostText.ScrollBars = System.Windows.Forms.ScrollBars.Both;
			this.HistoryHostText.Size = new System.Drawing.Size(264, 136);
			this.HistoryHostText.TabIndex = 54;
			this.HistoryHostText.Text = "";
			// 
			// label20
			// 
			this.label20.Location = new System.Drawing.Point(112, 16);
			this.label20.Name = "label20";
			this.label20.Size = new System.Drawing.Size(112, 16);
			this.label20.TabIndex = 59;
			this.label20.Text = "Host On Select Time";
			// 
			// groupBox15
			// 
			this.groupBox15.Controls.Add(this.DateSelectL);
			this.groupBox15.Location = new System.Drawing.Point(8, 16);
			this.groupBox15.Name = "groupBox15";
			this.groupBox15.Size = new System.Drawing.Size(88, 184);
			this.groupBox15.TabIndex = 60;
			this.groupBox15.TabStop = false;
			this.groupBox15.Text = "Date Select";
			// 
			// DateSelectL
			// 
			this.DateSelectL.Location = new System.Drawing.Point(8, 24);
			this.DateSelectL.Name = "DateSelectL";
			this.DateSelectL.Size = new System.Drawing.Size(72, 147);
			this.DateSelectL.TabIndex = 55;
			this.DateSelectL.SelectedIndexChanged += new System.EventHandler(this.DateSelectL_SelectedIndexChanged);
			// 
			// groupBox20
			// 
			this.groupBox20.Controls.Add(this.ViewListL);
			this.groupBox20.Controls.Add(this.RangeListL);
			this.groupBox20.Controls.Add(this.AddRange);
			this.groupBox20.Controls.Add(this.RemoveRAll);
			this.groupBox20.Controls.Add(this.AddRAll);
			this.groupBox20.Controls.Add(this.RemoveRange);
			this.groupBox20.Controls.Add(this.RangeList);
			this.groupBox20.Controls.Add(this.ViewList);
			this.groupBox20.Location = new System.Drawing.Point(104, 16);
			this.groupBox20.Name = "groupBox20";
			this.groupBox20.Size = new System.Drawing.Size(208, 184);
			this.groupBox20.TabIndex = 43;
			this.groupBox20.TabStop = false;
			this.groupBox20.Text = "Range Chooser";
			// 
			// ViewListL
			// 
			this.ViewListL.Location = new System.Drawing.Point(128, 48);
			this.ViewListL.Name = "ViewListL";
			this.ViewListL.Size = new System.Drawing.Size(64, 95);
			this.ViewListL.TabIndex = 43;
			this.ViewListL.SelectedIndexChanged += new System.EventHandler(this.ViewListL_SelectedIndexChanged);
			// 
			// RangeListL
			// 
			this.RangeListL.Location = new System.Drawing.Point(16, 48);
			this.RangeListL.Name = "RangeListL";
			this.RangeListL.Size = new System.Drawing.Size(64, 95);
			this.RangeListL.TabIndex = 42;
			this.RangeListL.SelectedIndexChanged += new System.EventHandler(this.RangeListL_SelectedIndexChanged);
			// 
			// AddRange
			// 
			this.AddRange.Enabled = false;
			this.AddRange.Location = new System.Drawing.Point(88, 72);
			this.AddRange.Name = "AddRange";
			this.AddRange.Size = new System.Drawing.Size(32, 23);
			this.AddRange.TabIndex = 37;
			this.AddRange.Text = ">>";
			this.AddRange.Click += new System.EventHandler(this.AddRange_Click);
			// 
			// RemoveRAll
			// 
			this.RemoveRAll.Enabled = false;
			this.RemoveRAll.Location = new System.Drawing.Point(16, 144);
			this.RemoveRAll.Name = "RemoveRAll";
			this.RemoveRAll.Size = new System.Drawing.Size(176, 23);
			this.RemoveRAll.TabIndex = 41;
			this.RemoveRAll.Text = "<< Remove All";
			this.RemoveRAll.Click += new System.EventHandler(this.button2_Click);
			// 
			// AddRAll
			// 
			this.AddRAll.Enabled = false;
			this.AddRAll.Location = new System.Drawing.Point(16, 24);
			this.AddRAll.Name = "AddRAll";
			this.AddRAll.Size = new System.Drawing.Size(176, 23);
			this.AddRAll.TabIndex = 40;
			this.AddRAll.Text = "Add All >>";
			this.AddRAll.Click += new System.EventHandler(this.button1_Click);
			// 
			// RemoveRange
			// 
			this.RemoveRange.Enabled = false;
			this.RemoveRange.Location = new System.Drawing.Point(88, 96);
			this.RemoveRange.Name = "RemoveRange";
			this.RemoveRange.Size = new System.Drawing.Size(32, 23);
			this.RemoveRange.TabIndex = 38;
			this.RemoveRange.TabStop = false;
			this.RemoveRange.Text = "<<";
			this.RemoveRange.Click += new System.EventHandler(this.RemoveRange_Click);
			// 
			// RangeList
			// 
			this.RangeList.Location = new System.Drawing.Point(80, 56);
			this.RangeList.Name = "RangeList";
			this.RangeList.Size = new System.Drawing.Size(121, 21);
			this.RangeList.TabIndex = 36;
			this.RangeList.Visible = false;
			// 
			// ViewList
			// 
			this.ViewList.Location = new System.Drawing.Point(80, 128);
			this.ViewList.Name = "ViewList";
			this.ViewList.Size = new System.Drawing.Size(121, 21);
			this.ViewList.TabIndex = 39;
			this.ViewList.Visible = false;
			// 
			// groupBox3
			// 
			this.groupBox3.Controls.Add(this.UOnly);
			this.groupBox3.Controls.Add(this.DOnly);
			this.groupBox3.Controls.Add(this.DU);
			this.groupBox3.Location = new System.Drawing.Point(208, 200);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(328, 48);
			this.groupBox3.TabIndex = 34;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "Graph Subdomain";
			// 
			// UOnly
			// 
			this.UOnly.Location = new System.Drawing.Point(232, 16);
			this.UOnly.Name = "UOnly";
			this.UOnly.Size = new System.Drawing.Size(88, 24);
			this.UOnly.TabIndex = 2;
			this.UOnly.Text = "Upload Only";
			this.UOnly.CheckedChanged += new System.EventHandler(this.UOnly_CheckedChanged);
			// 
			// DOnly
			// 
			this.DOnly.Location = new System.Drawing.Point(136, 16);
			this.DOnly.Name = "DOnly";
			this.DOnly.TabIndex = 1;
			this.DOnly.Text = "Download Only";
			this.DOnly.CheckedChanged += new System.EventHandler(this.DOnly_CheckedChanged);
			// 
			// DU
			// 
			this.DU.Checked = true;
			this.DU.Location = new System.Drawing.Point(8, 16);
			this.DU.Name = "DU";
			this.DU.Size = new System.Drawing.Size(136, 24);
			this.DU.TabIndex = 0;
			this.DU.TabStop = true;
			this.DU.Text = "Download and Upload";
			this.DU.CheckedChanged += new System.EventHandler(this.DU_CheckedChanged);
			// 
			// StandingC
			// 
			this.StandingC.Location = new System.Drawing.Point(8, 248);
			this.StandingC.Name = "StandingC";
			this.StandingC.Size = new System.Drawing.Size(300, 200);
			this.StandingC.TabIndex = 32;
			this.StandingC.TabStop = false;
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.Add(this.HOView);
			this.groupBox2.Controls.Add(this.BWView);
			this.groupBox2.Location = new System.Drawing.Point(8, 200);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(184, 48);
			this.groupBox2.TabIndex = 33;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Graph Domain";
			// 
			// HOView
			// 
			this.HOView.Location = new System.Drawing.Point(88, 16);
			this.HOView.Name = "HOView";
			this.HOView.Size = new System.Drawing.Size(88, 24);
			this.HOView.TabIndex = 1;
			this.HOView.Text = "Host Online";
			// 
			// BWView
			// 
			this.BWView.Checked = true;
			this.BWView.Location = new System.Drawing.Point(8, 16);
			this.BWView.Name = "BWView";
			this.BWView.Size = new System.Drawing.Size(80, 24);
			this.BWView.TabIndex = 0;
			this.BWView.TabStop = true;
			this.BWView.Text = "Bandwidth";
			this.BWView.CheckedChanged += new System.EventHandler(this.BWView_CheckedChanged);
			// 
			// DateSelect
			// 
			this.DateSelect.ItemHeight = 13;
			this.DateSelect.Location = new System.Drawing.Point(352, 272);
			this.DateSelect.Name = "DateSelect";
			this.DateSelect.Size = new System.Drawing.Size(144, 21);
			this.DateSelect.TabIndex = 30;
			this.DateSelect.Visible = false;
			this.DateSelect.SelectedIndexChanged += new System.EventHandler(this.DateSelect_SelectedIndexChanged);
			// 
			// groupBox19
			// 
			this.groupBox19.Controls.Add(this.Pic2);
			this.groupBox19.Controls.Add(this.Pic1);
			this.groupBox19.Controls.Add(this.testSnmp);
			this.groupBox19.Location = new System.Drawing.Point(16, 88);
			this.groupBox19.Name = "groupBox19";
			this.groupBox19.Size = new System.Drawing.Size(216, 88);
			this.groupBox19.TabIndex = 41;
			this.groupBox19.TabStop = false;
			this.groupBox19.Text = "Scan Start/Stop";
			// 
			// Pic2
			// 
			this.Pic2.Image = ((System.Drawing.Image)(resources.GetObject("Pic2.Image")));
			this.Pic2.Location = new System.Drawing.Point(144, 24);
			this.Pic2.Name = "Pic2";
			this.Pic2.Size = new System.Drawing.Size(56, 56);
			this.Pic2.TabIndex = 28;
			this.Pic2.TabStop = false;
			this.Pic2.Visible = false;
			// 
			// Pic1
			// 
			this.Pic1.Image = ((System.Drawing.Image)(resources.GetObject("Pic1.Image")));
			this.Pic1.Location = new System.Drawing.Point(144, 24);
			this.Pic1.Name = "Pic1";
			this.Pic1.Size = new System.Drawing.Size(56, 56);
			this.Pic1.TabIndex = 27;
			this.Pic1.TabStop = false;
			// 
			// groupBox7
			// 
			this.groupBox7.Controls.Add(this.RefIP);
			this.groupBox7.Controls.Add(this.label17);
			this.groupBox7.Controls.Add(this.ReferencePoint);
			this.groupBox7.Controls.Add(this.AddRP);
			this.groupBox7.Controls.Add(this.testRP);
			this.groupBox7.Controls.Add(this.RemoveRP);
			this.groupBox7.Controls.Add(this.Connect_R);
			this.groupBox7.Controls.Add(this.DownTime);
			this.groupBox7.Location = new System.Drawing.Point(16, 288);
			this.groupBox7.Name = "groupBox7";
			this.groupBox7.Size = new System.Drawing.Size(216, 256);
			this.groupBox7.TabIndex = 39;
			this.groupBox7.TabStop = false;
			this.groupBox7.Text = "External Connection Point";
			// 
			// RefIP
			// 
			this.RefIP.Location = new System.Drawing.Point(24, 144);
			this.RefIP.Name = "RefIP";
			this.RefIP.Size = new System.Drawing.Size(160, 20);
			this.RefIP.TabIndex = 44;
			this.RefIP.Text = "";
			this.RefIP.Visible = false;
			// 
			// label17
			// 
			this.label17.Location = new System.Drawing.Point(16, 176);
			this.label17.Name = "label17";
			this.label17.Size = new System.Drawing.Size(96, 16);
			this.label17.TabIndex = 43;
			this.label17.Text = "Downtime history";
			// 
			// ReferencePoint
			// 
			this.ReferencePoint.Location = new System.Drawing.Point(16, 48);
			this.ReferencePoint.Name = "ReferencePoint";
			this.ReferencePoint.Size = new System.Drawing.Size(184, 56);
			this.ReferencePoint.TabIndex = 36;
			// 
			// AddRP
			// 
			this.AddRP.Location = new System.Drawing.Point(16, 112);
			this.AddRP.Name = "AddRP";
			this.AddRP.Size = new System.Drawing.Size(88, 23);
			this.AddRP.TabIndex = 32;
			this.AddRP.Text = "Add Point";
			this.AddRP.Click += new System.EventHandler(this.AddRP_Click);
			// 
			// testRP
			// 
			this.testRP.Location = new System.Drawing.Point(16, 144);
			this.testRP.Name = "testRP";
			this.testRP.Size = new System.Drawing.Size(176, 23);
			this.testRP.TabIndex = 34;
			this.testRP.Text = "Test Internet Connection";
			this.testRP.Click += new System.EventHandler(this.testRP_Click);
			// 
			// RemoveRP
			// 
			this.RemoveRP.Location = new System.Drawing.Point(104, 112);
			this.RemoveRP.Name = "RemoveRP";
			this.RemoveRP.Size = new System.Drawing.Size(88, 23);
			this.RemoveRP.TabIndex = 33;
			this.RemoveRP.Text = "Remove Point";
			this.RemoveRP.Click += new System.EventHandler(this.RemoveRP_Click);
			// 
			// Connect_R
			// 
			this.Connect_R.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
			this.Connect_R.Enabled = false;
			this.Connect_R.Location = new System.Drawing.Point(16, 16);
			this.Connect_R.Name = "Connect_R";
			this.Connect_R.Size = new System.Drawing.Size(160, 24);
			this.Connect_R.TabIndex = 37;
			this.Connect_R.Text = "Internet Connect Status : ";
			// 
			// DownTime
			// 
			this.DownTime.Location = new System.Drawing.Point(16, 192);
			this.DownTime.Multiline = true;
			this.DownTime.Name = "DownTime";
			this.DownTime.ReadOnly = true;
			this.DownTime.ScrollBars = System.Windows.Forms.ScrollBars.Both;
			this.DownTime.Size = new System.Drawing.Size(176, 48);
			this.DownTime.TabIndex = 42;
			this.DownTime.Text = "";
			// 
			// ReferencePointL
			// 
			this.ReferencePointL.Location = new System.Drawing.Point(32, 152);
			this.ReferencePointL.Name = "ReferencePointL";
			this.ReferencePointL.Size = new System.Drawing.Size(184, 21);
			this.ReferencePointL.TabIndex = 31;
			// 
			// Tray_Icon2
			// 
			this.Tray_Icon2.Icon = ((System.Drawing.Icon)(resources.GetObject("Tray_Icon2.Icon")));
			this.Tray_Icon2.Text = "Probing System.";
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
																					  this.menuItem2,
																					  this.menuItem3,
																					  this.menuItem4,
																					  this.menuItem5});
			this.menuItem1.Text = "File";
			// 
			// menuItem2
			// 
			this.menuItem2.Index = 0;
			this.menuItem2.Text = "Open";
			this.menuItem2.Click += new System.EventHandler(this.menuItem2_Click);
			// 
			// menuItem3
			// 
			this.menuItem3.Index = 1;
			this.menuItem3.Text = "Save";
			this.menuItem3.Click += new System.EventHandler(this.menuItem3_Click);
			// 
			// menuItem4
			// 
			this.menuItem4.Index = 2;
			this.menuItem4.Text = "-";
			// 
			// menuItem5
			// 
			this.menuItem5.Index = 3;
			this.menuItem5.Text = "Exit";
			this.menuItem5.Click += new System.EventHandler(this.menuItem5_Click);
			// 
			// Network_GroupL
			// 
			this.Network_GroupL.Location = new System.Drawing.Point(16, 208);
			this.Network_GroupL.Name = "Network_GroupL";
			this.Network_GroupL.Size = new System.Drawing.Size(216, 69);
			this.Network_GroupL.TabIndex = 39;
			this.Network_GroupL.SelectedIndexChanged += new System.EventHandler(this.Network_GroupL_SelectedIndexChanged);
			// 
			// IPNText
			// 
			this.IPNText.Location = new System.Drawing.Point(16, 192);
			this.IPNText.Name = "IPNText";
			this.IPNText.Size = new System.Drawing.Size(200, 16);
			this.IPNText.TabIndex = 42;
			this.IPNText.Text = "IP Range#";
			// 
			// PJ_Name
			// 
			this.PJ_Name.Location = new System.Drawing.Point(16, 24);
			this.PJ_Name.Name = "PJ_Name";
			this.PJ_Name.ReadOnly = true;
			this.PJ_Name.Size = new System.Drawing.Size(184, 20);
			this.PJ_Name.TabIndex = 43;
			this.PJ_Name.Text = "";
			// 
			// groupBox17
			// 
			this.groupBox17.Controls.Add(this.PJ_Name);
			this.groupBox17.Location = new System.Drawing.Point(16, 16);
			this.groupBox17.Name = "groupBox17";
			this.groupBox17.Size = new System.Drawing.Size(216, 56);
			this.groupBox17.TabIndex = 44;
			this.groupBox17.TabStop = false;
			this.groupBox17.Text = "Project Name";
			// 
			// timer3
			// 
			this.timer3.Enabled = true;
			this.timer3.Interval = 6000;
			this.timer3.Tick += new System.EventHandler(this.timer3_Tick);
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(982, 558);
			this.Controls.Add(this.groupBox17);
			this.Controls.Add(this.IPNText);
			this.Controls.Add(this.tabControl2);
			this.Controls.Add(this.groupBox7);
			this.Controls.Add(this.groupBox19);
			this.Controls.Add(this.Network_GroupL);
			this.Controls.Add(this.ReferencePointL);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.Menu = this.mainMenu1;
			this.Name = "Form1";
			this.Text = "Network Viewer";
			this.Resize += new System.EventHandler(this.Form1_Resize);
			this.tabControl2.ResumeLayout(false);
			this.tabPage1.ResumeLayout(false);
			this.groupBox14.ResumeLayout(false);
			this.groupBox6.ResumeLayout(false);
			this.groupBox5.ResumeLayout(false);
			this.tabPage3.ResumeLayout(false);
			this.groupBox13.ResumeLayout(false);
			this.groupBox12.ResumeLayout(false);
			this.groupBox1.ResumeLayout(false);
			this.tabPage4.ResumeLayout(false);
			this.groupBox11.ResumeLayout(false);
			this.groupBox10.ResumeLayout(false);
			this.groupBox9.ResumeLayout(false);
			this.groupBox8.ResumeLayout(false);
			this.groupBox4.ResumeLayout(false);
			this.groupBox22.ResumeLayout(false);
			this.tabPage5.ResumeLayout(false);
			this.groupBox16.ResumeLayout(false);
			this.groupBox15.ResumeLayout(false);
			this.groupBox20.ResumeLayout(false);
			this.groupBox3.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			this.groupBox19.ResumeLayout(false);
			this.groupBox7.ResumeLayout(false);
			this.groupBox17.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}



		private void timer1_Tick(object sender, System.EventArgs e)
		{
			if (!ProbeMode)
			{
				/*if (Config_Name.Text == "")
				{
					ViewConfig.Enabled = false;
					txtData.Visible = false;
				}
				else
				{
					ViewConfig.Enabled = true;
				}*/
				if ((Port_Oid.Text != "")&&(Port_Oid.Text != "<Port ID> "))
				{
					if (Port_Oid.Enabled)
					{
						Port_Oid2.Enabled = true;
						PortDSC2.Enabled = true;
					}
				}
				else
				{
					Port_Oid2.Enabled = false;
					PortDSC2.Enabled = false;
				}
				if (Port_Oid2.Text=="")
					PortDSC2.Text="";
				if (Config_Name.Text=="")
				{
					//IPNText.Text = "IP Range#";
					//groupBox18.Text = "IP Range#";
					StandingRange.Items.Clear();
					Network_Group.Items.Clear();
					DateSelect.Items.Clear();
					DateSelectL.Items.Clear();
					TimeSelectL.Items.Clear();
					RangeList.Items.Clear();
					RangeListL.Items.Clear();
					Network_Group.Items.Clear();
					SNMP_Component.Items.Clear();
					SNMP_ComponentL.Items.Clear();
					Network_GroupL.Items.Clear();

					Network_Group.Text = "";
					SNMP_Component.Text = "";
					Port_Oid.Text = "";
					PortDSC.Text = "";
					AddSnmpIP.Text = "";
					AddSnmpCom.Text = "";
					StandingRange.Text = "";
					OverAll1.Text = "";OverAll2.Text = "";OverAll3.Text = "";OverAll4.Text = "";OverAll5.Text = "";
					Download1.Text = "";Download2.Text = "";Download3.Text = "";Download4.Text = "";Download5.Text = "";
					Upload1.Text = "";Upload2.Text = "";Upload3.Text = "";Upload4.Text = "";Upload5.Text = "";
					RangeList.Text = "";ViewList.Text = "";DateSelect.Text = "";
					HistoryHostText.Text = "";
					Port_Oid2.Items.Clear();Port_Oid2.Text = "";PortDSC2.Text = "";
					ConfigInfo = "^ Snmp_IP+Snmp_Commu\r\n\r\n= \r\n*\r\n";
					//ConfigInfo += "^ Network_IP+Snmp_Byte\r\n\r\n$ \r\n*\r\n";
					ConfigInfo += "^ Network_IP+Oid\r\n\r\n: 1 \r\n*\r\n";
					AddRAll.Enabled = false;
					RemoveRAll.Enabled = false;
					ViewListL.Items.Clear();
					CreateChart4();
					CreateChart5();
				}
				PJ_Name.Text = Config_Name.Text;
				if (Config_Name.Text=="")
				{
					testSnmp.Enabled = false;
					AddSnmpIP.Enabled = false;
					AddSnmpCom.Enabled = false;
				}
				else
				{
					testSnmp.Enabled = true;
					AddSnmpIP.Enabled = true;
					AddSnmpCom.Enabled = true;
				}
				if (Network_Group.Text=="")
					SNMP_Component.Enabled = false;
				else
				{
					SNMP_Component.Enabled = true;
				}
				if ((SNMP_Component.Text=="")||(!SNMP_Component.Enabled))
					Port_Oid.Enabled = false;
				else
					Port_Oid.Enabled = true;
				if (SNMP_ComponentL.Items.Count==0)
					Network_Group.Enabled= false;
				else
					Network_Group.Enabled = true;
			}
			if (ViewListL.Items.Count==0)
			{
				TimeSelectL.Enabled=false;
				HistoryHostText.Text = "";
				if (RangeListL.Items.Count==0)
					TimeSelectL.Items.Clear();
				
			}
			else
			{
				TimeSelectL.Enabled=true;
			}
		}

		private void timer2_Tick(object sender, System.EventArgs e)
		{
			if (ProbeMode)
			{
				int Min = DateTime.Now.Minute;
				while (Min>0)
					Min = Min -10;
				if (Min==0)
				{
					Thread SnmpIntervalThread = new Thread(new ThreadStart(SnmpIntervalScan));
					SnmpIntervalThread.IsBackground = true;
					SnmpIntervalThread.Start();
				}
			}
		}

	
		private void SnmpGetPacketEachThread()
		{
			bool Get = true;
			int Oid_Index = 0;
			int Oid_End_Index = 0;
			string Get_Oid = "";
			string Get_Oid2 = "";
			long x = 0;
			long a = 0;
			long AH_all = 0;
			long AH_each = 0;
			Chart_Count2 = 0;
			string Host_Text = "";
			//**********************************************
			bool moreport = false;
			//**********************************************
			while (Get)
			{
				Oid_Index = ConfigInfo.IndexOf(":",Oid_Index)+4;
				//**********************************************
				if (ConfigInfo.Substring(Oid_Index,1)==" ")
				{
					Oid_Index++;
					moreport = true;
				}
				else
					moreport = false;
				//**********************************************
				int FIE_Bug = ConfigInfo.IndexOf(" ",Oid_Index-2);
				string File_Index_Extention = ConfigInfo.Substring(Oid_Index-2,FIE_Bug+2-Oid_Index);
				int FIE = Int32.Parse(File_Index_Extention);
				if (ConfigInfo.IndexOf(":",Oid_Index)==-1)
					Get=false;
				else
				{
					if (!First_Each_Packet)
					{
						
						StreamReader aaa = new StreamReader(Config_Name.Text+File_Index_Extention+"_Host.log");
						Host_Text = aaa.ReadToEnd();
						aaa.Close();
					}
					Oid_Index = ConfigInfo.IndexOf(" ",Oid_Index)+1;
					Oid_Index = ConfigInfo.IndexOf(" ",Oid_Index)+1;
					Oid_End_Index = ConfigInfo.IndexOf(" ",Oid_Index);
					Get_Oid = ConfigInfo.Substring(Oid_Index,Oid_End_Index-Oid_Index);
					//MessageBox.Show(Get_Oid);
					//**********************************************
					if (moreport)
					{
						Oid_Index = ConfigInfo.IndexOf("#",Oid_Index)+2;
						Oid_Index = ConfigInfo.IndexOf(" ",Oid_Index)+1;
						Oid_End_Index = ConfigInfo.IndexOf(" ",Oid_Index);
						Get_Oid2 = ConfigInfo.Substring(Oid_Index,Oid_End_Index-Oid_Index);
					}
					//**********************************************
					//========================================================
					int SnmpIPI = ConfigInfo.IndexOf("@",Oid_Index)+2;
					int SnmpIPI2 = ConfigInfo.IndexOf(" ",SnmpIPI);
					string Snmp_IPx = ConfigInfo.Substring(SnmpIPI,SnmpIPI2-SnmpIPI);
					SnmpIPI = SnmpIPI2+1;
					SnmpIPI2 = ConfigInfo.IndexOf(" ",SnmpIPI);
					string Snmp_Comx = ConfigInfo.Substring(SnmpIPI,SnmpIPI2-SnmpIPI);
					SnmpClass = new Snmpi(Snmp_IPx,Snmp_Comx,".1.3.6.1.2.1.16.1.1.1.5");
					//========================================================

					Get_Oid = SnmpClass.getEach(Get_Oid);
					//**********************************************
					if (moreport)
						Get_Oid2 = SnmpClass.getEach(Get_Oid2);
					//**********************************************

					bool HavePfile = false;
					DirectoryInfo Dir = new DirectoryInfo(Directory.GetCurrentDirectory());

					FileInfo[] AnyPFile = Dir.GetFiles(Config_Name.Text+"_"+File_Index_Extention+"_PE.log");
					foreach (FileInfo fif in AnyPFile)
					{
						HavePfile = true;
					}
					if (!HavePfile)
					{
						StreamWriter swP = new StreamWriter(Config_Name.Text+"_"+File_Index_Extention+"_PE.log",true);
						swP.Write ("");
						swP.Flush();
						swP.Close();
					}

					StreamReader sr = new StreamReader(Config_Name.Text+"_"+File_Index_Extention+"_PE.log");
					string OpenText = sr.ReadToEnd();
					sr.Close();

					int Z_Index = OpenText.LastIndexOf("Z=");
					if (Z_Index == -1)
					{
						Packet_Z_Array[FIE] = 0;
						Packet_C_Array[FIE] = 0;
					}
					else
					{
						Z_Index +=3;
						string Z_txt = OpenText.Substring( Z_Index , OpenText.IndexOf(" ",Z_Index)-Z_Index);
						Packet_Z_Array[FIE]  = long.Parse(Z_txt);
						Z_Index = OpenText.LastIndexOf("C=")+3;
						Z_txt = OpenText.Substring( Z_Index , OpenText.IndexOf(" ",Z_Index)-Z_Index);
						Packet_C_Array[FIE] = long.Parse(Z_txt);

					}

					x = long.Parse(Get_Oid);
					x = x - Old_Packet_Array[FIE];
					if (x<0)
					{
						x = long.Parse(Get_Oid);;
						x += (4294967296-Old_Packet_Array[FIE]);
					}
					Old_Packet_Array[FIE] = long.Parse(Get_Oid);
					//**********************************************
					if (moreport)
					{
						long y = long.Parse(Get_Oid2);
						y = y - Old_Packet_Array2[FIE];
						if (y<0)
						{
							y = long.Parse(Get_Oid2);;
							y += (4294967296-Old_Packet_Array2[FIE]);
						}
						Old_Packet_Array2[FIE] = long.Parse(Get_Oid2);
						x = x + y;
					}
					//**********************************************
					if (!First_Each_Packet)
					{
						New_Chart_Data2[FIE] = x;
						Chart_Count2++;
						Packet_Z_Array[FIE] += x;
						Packet_C_Array[FIE]++;
						a = Packet_Z_Array[FIE]/Packet_C_Array[FIE];
						/*
						if (Have_New)
						{
							for (int j = 0;j<20;j++)
								Snmp_Host_Array_O[j] = Snmp_Host_Array_N[j];
							Have_New = false;
						}
						*/
						//====================================
						if (Snmp_Host_Array_N[FIE]==0)
							Snmp_Host_Array_N[FIE] = 1;
						if (Snmp_Host_Array_N[FIE]==0)
							Snmp_Host_Array_N[FIE] = 1;
						//====================================
						AH_all = a/Snmp_Host_Array_N[FIE];
						AH_each = x/Snmp_Host_Array_N[FIE];

						int H_C = 1;
						int H_I = Int32.Parse(File_Index_Extention);
						int Host_Index_1 = 0;
						int Host_Index_2 = 0;
						int Host_Index_3 = 0;
						while (true)
						{
							if (Host_Text.IndexOf("@",Host_Index_1)==-1)
								break;
							else
							{
								Host_Index_1 = Host_Text.IndexOf("@",Host_Index_1);
								Host_Index_2 = Host_Text.IndexOf("UH",Host_Index_1)+3;
								Host_Index_3 = Host_Text.IndexOf(" ",Host_Index_2);
								string ZH_str = Host_Text.Substring(Host_Index_2,Host_Index_3-Host_Index_2);
								long ZH_int = Int64.Parse(ZH_str)+AH_each;
								Host_Text = Host_Text.Remove(Host_Index_2,Host_Index_3-Host_Index_2);
								Host_Text = Host_Text.Insert(Host_Index_2,ZH_int.ToString());
								/*
								Host_Index_2 = Host_Text.IndexOf("CH",Host_Index_1)+3;
								Host_Index_3 = Host_Text.IndexOf(" ",Host_Index_2);
								string CH_str = Host_Text.Substring(Host_Index_2,Host_Index_3-Host_Index_2);
								long CH_int = Int64.Parse(CH_str)+1;
								Host_Text = Host_Text.Remove(Host_Index_2,Host_Index_3-Host_Index_2);
								Host_Text = Host_Text.Insert(Host_Index_2,CH_int.ToString());
								*/
								Host_Index_1++;
								H_C++;
							}
						}
						
						string WriteData = "\r\n# "+DateTime.Now.ToString()+" " + "X= "+x.ToString()+" A= "+a.ToString();
						WriteData += " Z= " + Packet_Z_Array[FIE].ToString();
						WriteData += " C= " + Packet_C_Array[FIE].ToString()+" ";
						//WriteData += " AHALL= "+AH_all.ToString();
						//WriteData += " AHEACH= "+AH_each.ToString()+ " \r\n";
					
					
						StreamWriter sw = new StreamWriter(Config_Name.Text+"_"+File_Index_Extention+"_PE.log",true);
						sw.Write (WriteData);
						sw.Flush();
						sw.Close();

						StreamWriter sw2 = new StreamWriter(Config_Name.Text+File_Index_Extention+"_Host.log",false);
						sw2.Write (Host_Text);
						sw2.Flush();
						sw2.Close();
					}
					//i++;
				}
			}
			if (!First_Each_Packet)
			{
				StreamWriter sw3 = new StreamWriter(Config_Name.Text+"_TimeI.log",true);
				sw3.Write ("# "+DateTime.Now.ToString()+" \r\n");
				sw3.Flush();
				sw3.Close();
			}
			First_Each_Packet = false;
		}

		private void SnmpGetByteEachThread()
		{
			bool Get = true;
			int Oid_Index = 0;
			int Oid_End_Index = 0;
			string Get_Oid = "";
			string Get_Oid2 = "";
			long x = 0;
			long a = 0;
			long AH_all = 0;
			long AH_each = 0;
			string Host_Text = "";
			//**********************************************
			bool moreport = false;
			//**********************************************
			Chart_Count = 0;


			while (Get)
			{
				Oid_Index = ConfigInfo.IndexOf(":",Oid_Index)+4;
				//**********************************************
				if (ConfigInfo.Substring(Oid_Index,1)==" ")
				{
					Oid_Index++;
					moreport = true;
				}
				else
					moreport = false;
				//**********************************************
				//int q = ConfigInfo.IndexOf(":",Oid_Index)+2;
				string File_Index_Extention = ConfigInfo.Substring(Oid_Index-2,1);
				int FIE = Int32.Parse(File_Index_Extention);

				if (ConfigInfo.IndexOf(":",Oid_Index)==-1)
					Get=false;
				else
				{
					if (!First_Each_Byte[FIE])
					{
						
						StreamReader aaa = new StreamReader(Config_Name.Text+File_Index_Extention+"_Host.log");
						Host_Text = aaa.ReadToEnd();
						aaa.Close();
					}
					Oid_Index = ConfigInfo.IndexOf(" ",Oid_Index)+1;
					Oid_Index = ConfigInfo.IndexOf(" ",Oid_Index)+1;
					Oid_Index = ConfigInfo.IndexOf(" ",Oid_Index)+1;
					Oid_End_Index = ConfigInfo.IndexOf(" ",Oid_Index);
					Get_Oid = ConfigInfo.Substring(Oid_Index,Oid_End_Index-Oid_Index);
					//**********************************************
					if (moreport)
					{
						Oid_Index = ConfigInfo.IndexOf("#",Oid_Index)+2;
						Oid_Index = ConfigInfo.IndexOf(" ",Oid_Index)+1;
						Oid_Index = ConfigInfo.IndexOf(" ",Oid_Index)+1;
						Oid_End_Index = ConfigInfo.IndexOf(" ",Oid_Index);
						Get_Oid2 = ConfigInfo.Substring(Oid_Index,Oid_End_Index-Oid_Index);
					}
					//**********************************************
					//========================================================
					int SnmpIPI = ConfigInfo.IndexOf("@",Oid_Index)+2;
					int SnmpIPI2 = ConfigInfo.IndexOf(" ",SnmpIPI);
					string Snmp_IPx = ConfigInfo.Substring(SnmpIPI,SnmpIPI2-SnmpIPI);
					SnmpIPI = SnmpIPI2+1;
					SnmpIPI2 = ConfigInfo.IndexOf(" ",SnmpIPI);
					string Snmp_Comx = ConfigInfo.Substring(SnmpIPI,SnmpIPI2-SnmpIPI);
					SnmpClass = new Snmpi(Snmp_IPx,Snmp_Comx,".1.3.6.1.2.1.16.1.1.1.5");
					//========================================================
					Get_Oid = SnmpClass.getEach(Get_Oid);
					//**********************************************
					if (moreport)
					{
						Get_Oid2 = SnmpClass.getEach(Get_Oid2);
					}
					//**********************************************
					
					bool HaveBfile = false;
					DirectoryInfo Dir = new DirectoryInfo(Directory.GetCurrentDirectory());

					FileInfo[] AnyBFile = Dir.GetFiles(Config_Name.Text+"_"+File_Index_Extention+"_BE.log");
					foreach (FileInfo fif in AnyBFile)
					{
						HaveBfile = true;
					}
					if (!HaveBfile)
					{
						StreamWriter swB = new StreamWriter(Config_Name.Text+"_"+File_Index_Extention+"_BE.log",true);
						swB.Write ("");
						swB.Flush();
						swB.Close();
					}
					StreamReader sr = new StreamReader(Config_Name.Text+"_"+File_Index_Extention+"_BE.log");
					string OpenText = sr.ReadToEnd();
					sr.Close();

					int Z_Index = OpenText.LastIndexOf("Z=");
					if (Z_Index == -1)
					{
						Byte_Z_Array[FIE] = 0;
						Byte_C_Array[FIE] = 0;
					}
					else
					{
						Z_Index +=3;
						string Z_txt = OpenText.Substring( Z_Index , OpenText.IndexOf(" ",Z_Index)-Z_Index);
						Byte_Z_Array[FIE]  = long.Parse(Z_txt);
						Z_Index = OpenText.LastIndexOf("C=")+3;
						Z_txt = OpenText.Substring( Z_Index , OpenText.IndexOf(" ",Z_Index)-Z_Index);
						Byte_C_Array[FIE] = long.Parse(Z_txt);

					}

					x = long.Parse(Get_Oid);
					x = x - Old_Byte_Array[FIE];
					if (x<0)
					{
						x = long.Parse(Get_Oid);;
						x += (4294967296-Old_Byte_Array[FIE]);
					}
					Old_Byte_Array[FIE] = long.Parse(Get_Oid);
					//**********************************************
					if (moreport)
					{
						long y = long.Parse(Get_Oid2);
						y = y - Old_Byte_Array2[FIE];
						if (y<0)
						{
							y = long.Parse(Get_Oid2);;
							y += (4294967296-Old_Byte_Array2[FIE]);
						}
						Old_Byte_Array2[FIE] = long.Parse(Get_Oid2);
						//MessageBox.Show(":"+x.ToString()+":"+y.ToString()+":");
						x = x + y;
					}
					//**********************************************
					if (!First_Each_Byte[FIE])
					{
						New_Chart_Data[FIE] = x;
						Chart_Count++;
						Byte_Z_Array[FIE] += x;
						Byte_C_Array[FIE]++;
						a = Byte_Z_Array[FIE]/Byte_C_Array[FIE];
						
						/*
						if (Have_New)
						{
							for (int j = 0;j<20;j++)
								Snmp_Host_Array_O[j] = Snmp_Host_Array_N[j];
							Have_New = false;
						}
						*/
						//=================================
						if (Snmp_Host_Array_N[FIE]==0)
							Snmp_Host_Array_N[FIE] = 1;
						if (Snmp_Host_Array_N[FIE]==0)
							Snmp_Host_Array_N[FIE] = 1;
						//=================================
						AH_all = a/Snmp_Host_Array_N[FIE];
						AH_each = x/Snmp_Host_Array_N[FIE];
						
						int H_C = 1;
						int H_I = Int32.Parse(File_Index_Extention);
						int Host_Index_1 = 0;
						int Host_Index_2 = 0;
						int Host_Index_3 = 0;
						while (true)
						{
							if (Host_Text.IndexOf("@",Host_Index_1)==-1)
								break;
							else
							{
								Host_Index_1 = Host_Text.IndexOf("@",Host_Index_1);
								Host_Index_2 = Host_Text.IndexOf("ZH",Host_Index_1)+3;
								Host_Index_3 = Host_Text.IndexOf(" ",Host_Index_2);
								string ZH_str = Host_Text.Substring(Host_Index_2,Host_Index_3-Host_Index_2);
								long ZH_int = Int64.Parse(ZH_str)+AH_each;
								Host_Text = Host_Text.Remove(Host_Index_2,Host_Index_3-Host_Index_2);
								Host_Text = Host_Text.Insert(Host_Index_2,ZH_int.ToString());
	
								Host_Index_2 = Host_Text.IndexOf("CH",Host_Index_1)+3;
								Host_Index_3 = Host_Text.IndexOf(" ",Host_Index_2);
								string CH_str = Host_Text.Substring(Host_Index_2,Host_Index_3-Host_Index_2);
								long CH_int = Int64.Parse(CH_str)+1;
								Host_Text = Host_Text.Remove(Host_Index_2,Host_Index_3-Host_Index_2);
								Host_Text = Host_Text.Insert(Host_Index_2,CH_int.ToString());
	
								Host_Index_1++;
								H_C++;
							}
						}
						
	
						string WriteData = "\r\n# "+DateTime.Now.ToString()+" " + "X= "+x.ToString()+" A= "+a.ToString();
						WriteData += " Z= " + Byte_Z_Array[FIE].ToString();
						WriteData += " C= " + Byte_C_Array[FIE].ToString()+" ";
						//WriteData += " AHALL= "+AH_all.ToString();
						//WriteData += " AHEACH= "+AH_each.ToString()+ " \r\n";
	
						StreamWriter sw = new StreamWriter(Config_Name.Text+"_"+File_Index_Extention+"_BE.log",true);
						sw.Write (WriteData);
						sw.Flush();
						sw.Close();
						
						StreamWriter sw2 = new StreamWriter(Config_Name.Text+File_Index_Extention+"_Host.log",false);
						sw2.Write (Host_Text);
						sw2.Flush();
						sw2.Close();


						
						
					}
					else
					{
						//MessageBox.Show("KK");
						First_Each_Byte[FIE] = false;
					}
				}
			}
			
			//CreateChart();
			
		}

		private void RealScan()
		{
			string Scan_Initial = Scan_Index.ToString();
			string tmpIP1;
			string tmpIP2;
			string Start3P = IP_String1.Substring(0,IP_String1.LastIndexOf(".")+1);
			string Stop3P = IP_String2.Substring(0,IP_String2.LastIndexOf(".")+1);
			int tmpCounter1;
			int tmpCounter2;
			int Index;
			Index = IP_String1.LastIndexOf(".")+1;
			tmpIP1 = IP_String1.Substring(Index,IP_String1.Length-Index);
			Index = IP_String2.LastIndexOf(".")+1;
			tmpIP2 = IP_String2.Substring(Index,IP_String2.Length-Index);
			tmpCounter1 = Int32.Parse(tmpIP1);
			tmpCounter2 = Int32.Parse(tmpIP2);
			int Counter = 0;
			int StartIP=0;
			DateTime ScanTime = DateTime.Now;
			string ScanSectionStart = DateTime.Now.ToString();
			CSP.OverAllHost = 0;
			DateTime startTime = DateTime.Now;
			for (int i = tmpCounter1;i<=tmpCounter2;i++)
			{
				if (Counter == 0)
					StartIP = i;
				Counter++;
				if ((Counter == 30)||(i == tmpCounter2))
				{
					CSP.InitialScanProcess(Start3P+StartIP.ToString(),Stop3P+i.ToString(),Port_String,Scan_Initial);
					CSP.ScanProcess();
					Counter = 0;
				}
			}

			TimeSpan duration = DateTime.Now - startTime;

			string ConcludeText = "=:= "+CSP.OverAllHost.ToString()+" Hosts found.\r\n";
			ConcludeText += "Total time use to scan is =^= "+duration.TotalSeconds.ToString()+" Seconds.\r\n";
			ConcludeText += "Scan Section Start From ("+ScanSectionStart+ ") to (" +DateTime.Now.ToString()+")";

			StreamWriter OP = new StreamWriter(Scan_Initial+"_Host.IP",true);
			OP.Write (ConcludeText);
			OP.Flush();
			OP.Close();
		}

		private void Snmp_Host_Scan()
		{
			int NextIndex = 0;
			bool Get = true;
			int i=1;
			string HostName = "";

			while (Get)
			{
				NextIndex = ConfigInfo.IndexOf(":",NextIndex)+3;
				if (ConfigInfo.Substring(NextIndex,1)!=" ")
					NextIndex++;
				string File_Index_Extention = ConfigInfo.Substring(NextIndex-1,1);
				int FIE = Int32.Parse(File_Index_Extention);

				if (ConfigInfo.IndexOf(":",NextIndex)==-1)
				{
						Get=false;
				}
				else
				{
					string tmp = ConfigInfo.Substring(NextIndex+1,ConfigInfo.IndexOf(" ",NextIndex+1)-NextIndex-1);
					//Network_Group.Items.Add(tmp);
					IP_String1 = tmp.Substring( 0 , tmp.IndexOf("-",0) );
					IP_String2 = tmp.Substring( tmp.IndexOf("-",0) +1);

					//create/check for Host Specific file=====================
					bool HaveHfile = false;
					string Host_Text="";
					DirectoryInfo Dir = new DirectoryInfo(Directory.GetCurrentDirectory());

					FileInfo[] AnyHFile = Dir.GetFiles(Config_Name.Text+File_Index_Extention+"_Host.log");
					foreach (FileInfo fif in AnyHFile)
					{
						HaveHfile = true;
					}
					if (!HaveHfile)
					{
						
						string IP_String1_1 = IP_String1.Substring(0,IP_String1.LastIndexOf(".")+1);
						string IP_String1_2 = IP_String1.Substring(IP_String1.LastIndexOf(".")+1);
						string IP_String2_1 = IP_String2.Substring(IP_String2.LastIndexOf(".")+1);
						int x = Int32.Parse(IP_String1_2);
						int y = Int32.Parse(IP_String2_1);
						for (int z = x;z<=y;z++)
						{
							Host_Text += ": "+IP_String1_1+z.ToString()+" | ZH=0 UH=0 CH=0 \r\n";
						}

						StreamWriter CreateHF = new StreamWriter(Config_Name.Text+File_Index_Extention+"_Host.log",false);
						CreateHF.Write (Host_Text);
						CreateHF.Flush();
						CreateHF.Close();
					}

					//========================================================

					Port_String = "25,135,139,445";
					Scan_Index = i;
					StreamWriter delIP = new StreamWriter(File_Index_Extention+"_Host.IP",false);
					delIP.Write ("");
					delIP.Flush();
					delIP.Close();
					RealScan();

					StreamReader sr = new StreamReader(File_Index_Extention+"_Host.IP");
					string OpenText = sr.ReadToEnd();
					sr.Close();
					int xx = OpenText.IndexOf("=:=",0)+4;
					int yy = OpenText.IndexOf(" ",xx);
					Snmp_Host_Array_N[FIE] = Int32.Parse(OpenText.Substring(xx,yy-xx));

					StreamWriter SR = new StreamWriter(Config_Name.Text+"_"+File_Index_Extention+"_HE.log",true);
					SR.Write ("\r\n[\r\n"+OpenText+"\r\n]\r\n");
					SR.Flush();
					SR.Close();
					//========================================================
					
					int I_a = 0;
					int I_b = 0;
					int I_c = 1;
					int I_d = Int32.Parse(File_Index_Extention);
					int I_e = 0;
					int I_f = 0;
					StreamReader qqq = new StreamReader(Config_Name.Text+File_Index_Extention+"_Host.log");
					Host_Text = qqq.ReadToEnd();
					qqq.Close();

					string Display = "";
					for (int ii = 0 ; ii< Host_Text.Length ;ii++)
					{
						if (Host_Text.Substring(ii,1)!="@")
						{
							Display += Host_Text.Substring(ii,1);
						}
					}
					Host_Text = Display;
					for (int ww = 0;ww<260;ww++)
					{
						H_Online[I_d,ww]="";
					}

					while (true)
					{
						I_a = OpenText.IndexOf(":",I_a+1);
						I_b = OpenText.IndexOf("|",I_a)+1;
						if (I_b == 0)
							break;
						else
						{
							string H_tmp = OpenText.Substring(I_a,I_b-I_a-1);
							
							H_Online[I_d,I_c] = H_tmp;
							int x = Host_Text.IndexOf(H_tmp);

							I_e = I_b+1;
							I_f = OpenText.IndexOf("|",I_e)-1;
							HostName = OpenText.Substring(I_e,I_f-I_e);
							Host_Text = Host_Text.Insert(x,"@");
							int y = Host_Text.IndexOf("|",x);
							H_tmp = Host_Text.Substring(x,y-x);
							if (H_tmp.IndexOf("&")==-1)
								Host_Text = Host_Text.Insert(y,"& " + HostName+" ");
							
							I_c++;
						}
					}
					StreamWriter SR3 = new StreamWriter(Config_Name.Text+File_Index_Extention+"_Host.log",false);
					SR3.Write (Host_Text);
					SR3.Flush();
					SR3.Close();
					i++;
				}
			}
			
		}

		private void Add_Snmp_Com_Click(object sender, System.EventArgs e)
		{
			int InDex = ConfigInfo.LastIndexOf("=")+2;
			IPNText.Text = "IP# Range of "+Config_Name.Text;
			//groupBox18.Text = "IP# Range of Project "+Config_Name.Text;
			int ErrorCode = 0;
			if ((AddSnmpIP.Text == "")||(AddSnmpIP.Text == "<Add Snmp IP Here>"))
				ErrorCode +=1;
			if ((AddSnmpCom.Text == "")||(AddSnmpCom.Text == "<Add Snmp Community Here>"))
				ErrorCode +=2;
			if (ConfigInfo.IndexOf(AddSnmpIP.Text)!=-1)
				ErrorCode +=1;
			if (ErrorCode == 0)
			{
				if (IPCheck(AddSnmpIP.Text))
				{
					bool Valid = true;
					try
					{
				
						SnmpClass = new Snmpi(AddSnmpIP.Text,AddSnmpCom.Text,".1.3.6.1.2.1.2.2.1.2");
						string tmpSNMPCHECK = SnmpClass.getPortDescription();
					}
					catch
					{
						Valid = false;
						MessageBox.Show("Invalid Snmp component.");
					}
					if (Config_Name.Text == "")
						MessageBox.Show("Pleaes Create/Select a Project Name.");
					else if (Valid)
					{
						string Display = "";
						//MessageBox.Show(ConfigInfo);
						if (ConfigInfo == "")
						{
							ConfigInfo = "^ Snmp_IP+Snmp_Commu\r\n\r\n= \r\n*\r\n";
							ConfigInfo += "^ Network_IP+Oid\r\n\r\n: 1 \r\n*\r\n";
							InDex = ConfigInfo.LastIndexOf("=")+2;
						}
						//MessageBox.Show(ConfigInfo);
						ConfigInfo = ConfigInfo.Insert(InDex,AddSnmpIP.Text+" "+AddSnmpCom.Text+ " \r\n= \r\n");
						string tmpSNMP = AddSnmpIP.Text+" "+AddSnmpCom.Text;
						SNMP_Component.Items.Add(tmpSNMP);
						SNMP_ComponentL.Items.Add(tmpSNMP);
						int StopD = ConfigInfo.LastIndexOf(":");
						for (int i = ConfigInfo.IndexOf(":") ; i< ConfigInfo.Length ;i++)
						{
							if (i==StopD)
								break;
							if ((ConfigInfo.Substring(i,1)!="^")&&(ConfigInfo.Substring(i,1)!="*")&&(ConfigInfo.Substring(i,1)!=":")&&(ConfigInfo.Substring(i,1)!="="))
							{
								Display += ConfigInfo.Substring(i,1);
								if (ConfigInfo.Substring(i,1)==" ")
									Display += " ";
							}
						}
						txtData.Text = Display;
						txtData.Invalidate();



						string strPath = Config_Name.Text+".conf";
						bool NewFile = false;
						try
						{
							StreamReader CC = new StreamReader(strPath);
							CC.Close();		
						}
						catch
						{
							NewFile = true;
						}
						StreamWriter CW = new StreamWriter(strPath,false);
						CW.Write (ConfigInfo);
						CW.Flush();
						CW.Close();
						if (NewFile)
							Config_Name.Items.Add(Config_Name.Text);
					}
				}
				else
				MessageBox.Show("Snmp Error");
				////////////////////////////////////////
			}
			else
				MessageBox.Show("Snmp Error");
		}

		private void Add_Network_Group_Click(object sender, System.EventArgs e)
		{
			string CheckBug1 = "";
			string CheckBug2 = "";
			bool IPOK = true;
			try
			{
				CheckBug1 = Network_Group.Text.Substring(0,Network_Group.Text.IndexOf("-"));
				CheckBug2 = Network_Group.Text.Substring(Network_Group.Text.IndexOf("-")+1,Network_Group.Text.Length-Network_Group.Text.IndexOf("-")-1);
			}
			catch
			{
				IPOK = false;
			}
			
			if (!IPCheck(CheckBug1))
				IPOK = false;
			if (!IPCheck(CheckBug2))
				IPOK = false;


			if (IPOK)
			{
				int InDex = ConfigInfo.LastIndexOf(":")+4;
				int countIndex = Int32.Parse(ConfigInfo.Substring(InDex-2,1))+1;
				int ErrorCode = 0;
				if ((Network_Group.Text == "")||(Network_Group.Text == "<Add Network Group Here>"))
					ErrorCode ++;
				if ((Port_Oid.Text == "")||(Port_Oid.Text=="<Port ID of Network Portion>"))
					ErrorCode ++;
				if ((SNMP_Component.Text == "")||(SNMP_Component.Text=="<Select SNMP Component>"))
					ErrorCode ++;

				string Packet_Oid = ".1.3.6.1.2.1.2.2.1.10."+Port_Oid.Text;
				string Byte_Oid = ".1.3.6.1.2.1.2.2.1.16."+Port_Oid.Text;

				if (ErrorCode == 0)
				{
					string Display = "";
					if (ConfigInfo.IndexOf(Network_Group.Text)==-1)
					{
						if (Port_Oid2.Text == "")
						{
							ConfigInfo = ConfigInfo.Insert(InDex,Network_Group.Text+" "+Port_Oid.Text
								+" "+Packet_Oid+ " "+Byte_Oid+" @ "+SNMP_Component.Text+" \r\n: "
								+countIndex.ToString()+" \r\n");
						}
						else
						{
							string Packet_Oid2 = ".1.3.6.1.2.1.2.2.1.10."+Port_Oid2.Text;
							string Byte_Oid2 = ".1.3.6.1.2.1.2.2.1.16."+Port_Oid2.Text;
							int moreportQ = ConfigInfo.LastIndexOf(":");
							ConfigInfo = ConfigInfo.Insert(moreportQ+1,"!");

							ConfigInfo = ConfigInfo.Insert(InDex+1,Network_Group.Text+" "+Port_Oid.Text
								+" "+Packet_Oid+ " "+Byte_Oid
								+" # " + Port_Oid2.Text + " " + Packet_Oid2 + " " + Byte_Oid2
								+" @ "+SNMP_Component.Text+" \r\n: "
								+countIndex.ToString()+" \r\n");
						}
						int StopD = ConfigInfo.LastIndexOf(":");
						for (int i = ConfigInfo.IndexOf(":") ; i< ConfigInfo.Length ;i++)
						{
							if (i==StopD)
								break;
							if ((ConfigInfo.Substring(i,1)!="^")&&(ConfigInfo.Substring(i,1)!="*")&&(ConfigInfo.Substring(i,1)!=":")&&(ConfigInfo.Substring(i,1)!="="))
							{
								Display += ConfigInfo.Substring(i,1);
								if (ConfigInfo.Substring(i,1)==" ")
									Display += " ";
							}
						}
						txtData.Text = Display;
						txtData.Invalidate();
				
						Network_Group.Items.Clear();
						Network_GroupL.Items.Clear();
						StandingRange.Items.Clear();

						int NextIndex = 0;
						bool Get = true;
						while (Get)
						{
							NextIndex = ConfigInfo.IndexOf(":",NextIndex)+3;
							if (ConfigInfo.Substring(NextIndex,1)!=" ")
								NextIndex++;
							if (ConfigInfo.IndexOf(":",NextIndex)==-1)
								Get=false;
							else
							{
								string tmpNN = ConfigInfo.Substring(NextIndex+1,ConfigInfo.IndexOf(" ",NextIndex+1)-NextIndex-1);
								StandingRange.Items.Add(tmpNN);
								Network_Group.Items.Add(tmpNN);
								int Range_IDX = Network_GroupL.Items.Count+1;
								string Range_Add = "Range # "+Range_IDX.ToString()+" : "+tmpNN;
								Network_GroupL.Items.Add(Range_Add);
							}
						}
						ConfigI = Config_Name.Text;
			
						Network_Group.Items.Clear();
						StandingRange.Items.Clear();
						//Network_RealTime_Group.Items.Clear();
						int Network_RealTime_Group_Counter = 1;

						NextIndex = 0;
						Get = true;
						while (Get)
						{
							NextIndex = ConfigInfo.IndexOf(":",NextIndex)+3;
							if (ConfigInfo.Substring(NextIndex,1)!=" ")
								NextIndex++;
							if (ConfigInfo.IndexOf(":",NextIndex)==-1)
								Get=false;
							else
							{
								string tmp = ConfigInfo.Substring(NextIndex+1,ConfigInfo.IndexOf(" ",NextIndex+1)-NextIndex-1);
								Network_Group.Items.Add(tmp);
								//Network_GroupL.Items.Add(tmp);
								StandingRange.Items.Add(tmp);
								//Network_RealTime_Group.Items.Add("Range # "+Network_RealTime_Group_Counter.ToString());
								Network_RealTime_Group_Array[Network_RealTime_Group_Counter] = tmp;
								Network_RealTime_Group_Counter++;

							}
						}
						string strPath = Config_Name.Text+".conf";
						bool NewFile = false;
						try
						{
							StreamReader CC = new StreamReader(strPath);
							CC.Close();		
						}
						catch
						{
							NewFile = true;
						}
						StreamWriter CW = new StreamWriter(strPath,false);
						CW.Write (ConfigInfo);
						CW.Flush();
						CW.Close();
					}
					else
						MessageBox.Show("IP Range already Exit","Error");

				}
				else 
					MessageBox.Show("IP Range Input Error.");
			}
			else
				MessageBox.Show("IP Range Input Error.");
		}

		private void Config_Name_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			AddRAll.Enabled = false;
			ViewListL.Items.Clear();
			RemoveRAll.Enabled = false;
			StreamReader CR = new StreamReader(Config_Name.Text+".conf");
			ConfigInfo = CR.ReadToEnd();
			CR.Close();
			ConfigI = Config_Name.Text;
			IPNText.Text = "IP# Range of "+Config_Name.Text;
			//groupBox18.Text = "IP# Range of Project "+Config_Name.Text;

			StandingRange.Items.Clear();
			Network_Group.Items.Clear();
			DateSelect.Items.Clear();
			DateSelectL.Items.Clear();
			TimeSelectL.Items.Clear();
			RangeList.Items.Clear();
			RangeListL.Items.Clear();
			Network_Group.Items.Clear();
			SNMP_Component.Items.Clear();
			SNMP_ComponentL.Items.Clear();
			Network_GroupL.Items.Clear();

			Network_Group.Text = "";
			SNMP_Component.Text = "";
			Port_Oid.Text = "";
			PortDSC.Text = "";
			AddSnmpIP.Text = "";
			AddSnmpCom.Text = "";
			StandingRange.Text = "";
			OverAll1.Text = "";OverAll2.Text = "";OverAll3.Text = "";OverAll4.Text = "";OverAll5.Text = "";
			Download1.Text = "";Download2.Text = "";Download3.Text = "";Download4.Text = "";Download5.Text = "";
			Upload1.Text = "";Upload2.Text = "";Upload3.Text = "";Upload4.Text = "";Upload5.Text = "";
			RangeList.Text = "";ViewList.Text = "";DateSelect.Text = "";
			HistoryHostText.Text = "";
			Port_Oid2.Items.Clear();Port_Oid2.Text = "";PortDSC2.Text = "";

			int SIP = 0;
			int SIP2 = 0;
			while (true)
			{
				SIP = ConfigInfo.IndexOf("=",SIP)+2;
				if (ConfigInfo.IndexOf("=",SIP)==-1)
					break;
				else
				{
					SIP2 = ConfigInfo.IndexOf(" ",SIP)+1;
					SIP2 = ConfigInfo.IndexOf(" ",SIP2);
					string tmpSIP = ConfigInfo.Substring(SIP,SIP2-SIP);
					if (tmpSIP.IndexOf("\r\n")!=-1)
						break;
					SNMP_Component.Items.Add(tmpSIP);
					SNMP_ComponentL.Items.Add(tmpSIP);
				}
			}

			int Network_RealTime_Group_Counter = 1;

			int NextIndex = 0;
			bool Get = true;
			while (Get)
			{
				NextIndex = ConfigInfo.IndexOf(":",NextIndex)+3;
				if (ConfigInfo.Substring(NextIndex,1)!=" ")
					NextIndex++;
				if (ConfigInfo.IndexOf(":",NextIndex)==-1)
					Get=false;
				else
				{
					string tmp = ConfigInfo.Substring(NextIndex+1,ConfigInfo.IndexOf(" ",NextIndex+1)-NextIndex-1);
					Network_Group.Items.Add(tmp);
					int Range_IDX = Network_GroupL.Items.Count+1;
					string Range_Add = "Range # "+Range_IDX.ToString()+" : "+tmp;
					Network_GroupL.Items.Add(Range_Add);
					StandingRange.Items.Add(tmp);
					//Network_RealTime_Group.Items.Add("Range # "+Network_RealTime_Group_Counter.ToString());
					Network_RealTime_Group_Array[Network_RealTime_Group_Counter] = tmp;
					Network_RealTime_Group_Counter++;

				}
			}
			
			string Display = "";
			int StopD = ConfigInfo.LastIndexOf(":");
			for (int i = ConfigInfo.IndexOf(":") ; i< ConfigInfo.Length ;i++)
			{
				if (i==StopD)
					break;
				if ((ConfigInfo.Substring(i,1)!="^")&&(ConfigInfo.Substring(i,1)!="*")&&(ConfigInfo.Substring(i,1)!=":")&&(ConfigInfo.Substring(i,1)!="="))
				{
					Display += ConfigInfo.Substring(i,1);
					if (ConfigInfo.Substring(i,1)==" ")
						Display += " ";
				}
			}
			txtData.Text = Display;

			//GetDate
			bool ScanB4 = false;
			if (Network_RealTime_Group_Counter>1)
			{
				DirectoryInfo Dir = new DirectoryInfo(Directory.GetCurrentDirectory());

				FileInfo[] AnyLFile = Dir.GetFiles(Config_Name.Text+"_TimeI.log");
				foreach (FileInfo fif in AnyLFile)
				{
					ScanB4 = true;
				}
			}
			
			if (ScanB4)
			{
				string StandingFile = Config_Name.Text+"_TimeI.log";
				StreamReader ST2 = new StreamReader(StandingFile);
				string StandingText2 = ST2.ReadToEnd();
				ST2.Close();

				int DIndex1 = StandingText2.IndexOf("#")+2;
				int DIndex2 = StandingText2.IndexOf(" ",DIndex1);
				string Date1 = StandingText2.Substring(DIndex1,DIndex2-DIndex1);
				string Date2 = "";
				DateSelect.Items.Add(Date1);
				DateSelectL.Items.Add(Date1);
				while (true)
				{
					DIndex1 = StandingText2.IndexOf("#",DIndex1);
					if (DIndex1==-1)
						break;
					else
					{
						DIndex1 = DIndex1+2;
						DIndex2 = StandingText2.IndexOf(" ",DIndex1);
						Date2 = StandingText2.Substring(DIndex1,DIndex2-DIndex1);
						if (Date1 != Date2)
						{
							DateSelect.Items.Add(Date2);
							DateSelectL.Items.Add(Date2);
							Date1 = Date2;
						}
					}
				}
			}
			//End of GetDate
			CreateChart4();
			CreateChart5();


		}

		private void Form1_Resize(object sender, System.EventArgs e)
		{
			if (FormWindowState.Minimized == WindowState)
				Hide();
		}

		private void Tray_Icon_DoubleClick(object sender, System.EventArgs e)
		{
			Show();
			WindowState = FormWindowState.Normal;

		}

		private void testSnmp_Click(object sender, System.EventArgs e)
		{
			if (ProbeMode)
			{
				ProbeMode = false;
				
				Tray_Icon2.Visible = false;
				//MessageBox.Show("Probe Mode Stop");
				testSnmp.Text = "Start Scan";
				Pic2.Visible = false;
				Pic1.Visible = true;
				Config_Name.Enabled = true;
				AddSnmpIP.Enabled = true;
				AddSnmpCom.Enabled = true;
				Add_Snmp_Com.Enabled = true;
				SNMP_ComponentL.Enabled = true;
				Network_Group.Enabled = true;
				SNMP_Component.Enabled = true;
				Port_Oid.Enabled = true;
				PortDSC.Enabled = true;
				Add_Network_Group.Enabled = true;
				Edit_Network_Group.Enabled = true;
				CreateBlankCF.Enabled = true;
				Network_GroupL.Enabled = true;
				if (Port_Oid.Text!="")
				{
					Port_Oid2.Enabled = true;
					PortDSC2.Enabled = true;
				}
				groupBox7.Enabled=true;
			}
			else
			{
				ProbeMode = true;

				int Timer3 = DateTime.Now.Minute;
				int Timer32 = Timer3/10;
				//MessageBox.Show(Timer32.ToString());
				Timer32 = Timer32*10;
				Timer3 = Timer3 - Timer32;
				//MessageBox.Show(Timer3.ToString());
				if ((Timer3==8)||(Timer3==9)||(Timer3==0))
				{
					try
					{
						Process[] myProcesses;
						myProcesses = Process.GetProcessesByName("nMap");
						myProcesses[0].Kill();
					}
					catch
					{
					}
					groupBox7.Enabled=false;
					StartHostScan.Enabled=false;
					HostDetailBox.Text = "Due to the project interval scan, this feature is disable.\r\nWill be enable after project interval scan is complete";
				}
				
				Tray_Icon2.Visible = true;
				//MessageBox.Show("Probe Mode Start");
				testSnmp.Text = "Stop Scaning";
				Pic2.Visible = true;
				Pic1.Visible = false;
				Config_Name.Enabled = false;
				AddSnmpIP.Enabled = false;
				AddSnmpCom.Enabled = false;
				Add_Snmp_Com.Enabled = false;
				SNMP_ComponentL.Enabled = false;
				Network_Group.Enabled = false;
				SNMP_Component.Enabled = false;
				Port_Oid.Enabled = false;
				PortDSC.Enabled = false;
				Port_Oid2.Enabled = false;
				PortDSC2.Enabled = false;
				Add_Network_Group.Enabled = false;
				Edit_Network_Group.Enabled = false;
				CreateBlankCF.Enabled = false;
				Network_GroupL.Enabled = false;
			}
		}

		private void CreateChart4()
		{
			string[] labels = new string[144];
			int ij4 = 0;
			double[] Tdata0 = new double[144];
			for (int i4 = 0;i4<143;i4++)
			{
				ij4 = i4/6;	
				labels[i4] = ij4.ToString();
				Tdata0[i4] = 0;
			}

			XYChart c = new XYChart(710, 400);

			c.setPlotArea(50, 30, 620, 210);

			c.addLegend(55, 0, false, "", 8).setBackground(Chart.Transparent);

			if (BWView.Checked)
				c.yAxis().setTitle("KBytes");
			else
				c.yAxis().setTitle("Hosts");

			c.xAxis().setLabels(labels);

			c.xAxis().setLabelStep(6, 1);

			//=======================================================
			//if (DateSelect.Text != "")
			try
			{
				string Date = (string)DateSelectL.SelectedItem;//DateSelect.Text;
				int tmpRI = ConfigInfo.LastIndexOf(":")+2;

				int tmpRI2 = ConfigInfo.IndexOf(" ",tmpRI);
				string tmpRI3 = ConfigInfo.Substring(tmpRI,tmpRI2-tmpRI);
				int RI = Int32.Parse(tmpRI3);
				int DataC = 0;
				int tmpRI4 = 0;
				for (int iri = 1;iri<RI;iri++)
				{
					string SCDText = "";
					string SCDText2 = "";
					if (BWView.Checked)
					{
						if (DOnly.Checked)
						{
							StreamReader SCD = new StreamReader(Config_Name.Text+"_"+iri.ToString()+"_BE.log");
							SCDText = SCD.ReadToEnd();
							SCD.Close();
						}
						else if(UOnly.Checked)
						{
							StreamReader SCD = new StreamReader(Config_Name.Text+"_"+iri.ToString()+"_PE.log");
							SCDText = SCD.ReadToEnd();
							SCD.Close();
						}
						else if(DU.Checked)
						{
							StreamReader SCD = new StreamReader(Config_Name.Text+"_"+iri.ToString()+"_BE.log");
							SCDText = SCD.ReadToEnd();
							SCD.Close();
							StreamReader SCD2 = new StreamReader(Config_Name.Text+"_"+iri.ToString()+"_PE.log");
							SCDText2 = SCD2.ReadToEnd();
							SCD2.Close();
						}
					}
					if (HOView.Checked)
					{
						StreamReader SCD = new StreamReader(Config_Name.Text+"_"+iri.ToString()+"_HE.log");
						SCDText = SCD.ReadToEnd();
						SCD.Close();
					}
					tmpRI = 0;
					DataC = 0;
					while (true)
					{
						//MessageBox.Show(Date);
						if (":"+Date+":"=="::")
							break;
						tmpRI = SCDText.IndexOf(Date,tmpRI);
						if (tmpRI == -1)
							break;
						else
						{
							if (HOView.Checked)
							{
								tmpRI = SCDText.IndexOf(Date,tmpRI+1);
								if (tmpRI == SCDText.LastIndexOf(Date))
									DataC--;
							}
							DataC++;
							tmpRI++;
						}
					}
					//double[] Tdata0 = new double[DataC];
					int Tangles0 = 0;
					tmpRI = 0;
					tmpRI4 = 0;
					DataC = 0;
					int DA = 0;
					while (true)
					{
						if (":"+Date+":"=="::")
							break;
						tmpRI = SCDText.IndexOf(Date,tmpRI);
						if (DU.Checked)
						{	
							tmpRI4 = SCDText2.IndexOf(Date,tmpRI4);
						}
						if (tmpRI == -1)
							break;
						else
						{
							tmpRI = SCDText.IndexOf(" ",tmpRI)+1;
							tmpRI2 = SCDText.IndexOf(":",tmpRI);
							tmpRI3 = SCDText.Substring(tmpRI,tmpRI2-tmpRI);
							DA = Int32.Parse(tmpRI3);
							//==============================================
							int DADA = DA;
							DA = DA*6;

							//==============================================
							tmpRI = tmpRI2+1;
							tmpRI2 = SCDText.IndexOf(":",tmpRI);
							tmpRI3 = SCDText.Substring(tmpRI,tmpRI2-tmpRI);
							//==============================================
							int tmpDA77 = Int32.Parse(tmpRI3);
							DA += tmpDA77/10; 
							//==============================================
							
							int APM = SCDText.IndexOf("M",tmpRI);
							if (APM != -1)
							{
								if (SCDText.Substring(APM-1,1)=="P")
									if (DADA<12)
										if (DA<72)
											DA = DA+72;
								if (SCDText.Substring(APM-1,1)=="A")
									if (DADA==12)
										DA = DA-72;

							}

							Tangles0 = DA;
							double DAS = 0;
							if (BWView.Checked)
							{
								//int tmpDU = tmpRI;
								tmpRI = SCDText.IndexOf("X=",tmpRI)+3;
								tmpRI2 = SCDText.IndexOf(" ",tmpRI);
								tmpRI3 = SCDText.Substring(tmpRI,tmpRI2-tmpRI-3);
								DAS = double.Parse(tmpRI3);
								if (DU.Checked)
								{			
									tmpRI4 = SCDText2.IndexOf("X=",tmpRI4)+3;
									int tmpRI5 = SCDText2.IndexOf(" ",tmpRI4);
									string tmpRI6 = SCDText2.Substring(tmpRI4,tmpRI5-tmpRI4-3);
									//MessageBox.Show(":"+tmpRI6+":");
									DAS += double.Parse(tmpRI6);
								}
							}
							if (HOView.Checked)
							{
								tmpRI = SCDText.IndexOf(Date,tmpRI)+1;
								string HOtmp = SCDText.Substring(0,tmpRI);
								//MessageBox.Show(HOtmp);
								int HOIndex = HOtmp.LastIndexOf("=:=")+4;
								int HOIndex2 = HOtmp.IndexOf(" ",HOIndex);
								HOtmp = HOtmp.Substring(HOIndex,HOIndex2-HOIndex);
								DAS = double.Parse(HOtmp);
							}
							//Tdata0[DataC] = DA;
							//===================================
							Tdata0[Tangles0] = DAS;
							//===================================

							DataC++;
						}
					}
					string tmpIRIx = "Range # "+iri.ToString();
					//c.addAreaLayer(Tdata0, unchecked((int)0x8000ff00), tmpIRIx, 3);
					int Color = 0;
					if (iri == 1) Color = unchecked((int)0x8000ff00);
					if (iri == 2) Color = unchecked((int)0x800000ff);
					if (iri == 3) Color = unchecked((int)0x80ff0000);
					if (iri == 4) Color = unchecked((int)0x8000ffff);
					if (iri == 5) Color = unchecked((int)0x80ffff00);
					if (iri == 6) Color = unchecked((int)0x80ff00ff);
					if (iri == 7) Color = unchecked((int)0x80007700);
					if (iri == 8) Color = unchecked((int)0x80000077);
					if (iri == 9) Color = unchecked((int)0x80770000);
					if (iri == 10) Color = unchecked((int)0x80007777);
					if (iri == 11) Color = unchecked((int)0x80777700);
					if (iri == 12) Color = unchecked((int)0x80770077);
					if (iri == 13) Color = unchecked((int)0x8000ff77);
					if (iri == 14) Color = unchecked((int)0x80ff7700);
					if (iri == 15) Color = unchecked((int)0x807700ff);
					if (ViewListL.Items.IndexOf(tmpIRIx)!=-1)
						c.addAreaLayer(Tdata0, Color, tmpIRIx, 3);
					//MessageBox.Show(":"+tmpIRIx+":");
				}
			}
			catch
			{
			}
			//=======================================================
			StandingC.Image = c.makeImage();
		}

		private void CreateChart5()
		{
			//The data for the bar chart
			double[] data5 = {0, 0, 0, 0, 0};

			//The labels for the bar chart
			string[] labels5 = {"Range#", "Range#", "Range#", "Range#", "Range#"};

			int CC5_1 = ConfigInfo.LastIndexOf(":")+2;
			int CC5_2 = ConfigInfo.IndexOf(" ",CC5_1);
			int CC5_3 = Int32.Parse(ConfigInfo.Substring(CC5_1,CC5_2-CC5_1));
			long CC5_4 = 0;
			long CC5_5 = 0;
			long CC5_6 = 0;
			long[] AllBW = new long[CC5_3];
			int[] ALLI = new int[CC5_3];

			for (int CC5 = 0;CC5<CC5_3;CC5++)
			{
				try
				{
					StreamReader CCB = new StreamReader(Config_Name.Text+"_"+CC5.ToString()+"_BE.log");
					string CCBText = CCB.ReadToEnd();
					CCB.Close();
					StreamReader CCP = new StreamReader(Config_Name.Text+"_"+CC5.ToString()+"_PE.log");
					string CCPText = CCP.ReadToEnd();
					CCP.Close();

					CC5_1 = CCBText.LastIndexOf("Z=")+3;
					CC5_2 = CCBText.IndexOf(" ",CC5_1);
					CC5_4 = long.Parse(CCBText.Substring(CC5_1,CC5_2-CC5_1));

					CC5_1 = CCBText.LastIndexOf("C=")+3;
					CC5_2 = CCBText.IndexOf(" ",CC5_1);
					CC5_6 = long.Parse(CCBText.Substring(CC5_1,CC5_2-CC5_1));

					CC5_1 = CCPText.LastIndexOf("Z=")+3;
					CC5_2 = CCPText.IndexOf(" ",CC5_1);
					CC5_5 = long.Parse(CCPText.Substring(CC5_1,CC5_2-CC5_1));

					if (DUStand.Checked)
						AllBW[CC5] = CC5_4 + CC5_5;
					else if (DStand.Checked)
						AllBW[CC5] = CC5_4;
					else if (UStand.Checked)
						AllBW[CC5] = CC5_5;
					if (DABWView.Checked)
						AllBW[CC5] = AllBW[CC5]/CC5_6;
				}
				catch
				{
					AllBW[CC5] = 0;
				}
				ALLI[CC5] = CC5;
			}
			for (int CC5 = 0;CC5<CC5_3;CC5++)
			{
				for (int CC52 = CC5+1;CC52<CC5_3;CC52++)
				{
					long tmp = 0;
					int tmp2 = 0;
					if (AllBW[CC5]<AllBW[CC52])
					{
						tmp = AllBW[CC5];
						AllBW[CC5] = AllBW[CC52];
						AllBW[CC52] = tmp;
						tmp2 = ALLI[CC5];
						ALLI[CC5] = ALLI[CC52];
						ALLI[CC52] = tmp2;
					}
				}
			}
			for (int CC5 = 0; CC5<CC5_3;CC5++)
			{
				if (DUBWView.Checked)
				{
					data5[CC5] = AllBW[CC5]/1000;
				}
				if (DABWView.Checked)
				{
					data5[CC5] = AllBW[CC5]/(600);
				}
				if (ALLI[CC5]!=0)
					labels5[CC5] += ALLI[CC5].ToString();
			}

			//Create a XYChart object of size 400 x 240 pixels.
			XYChart c = new XYChart(680, 400);

			//Set the plotarea at (45, 40) and of 300 x 160 pixels in size
			c.setPlotArea(55, 30, 570, 200);

			//Add a multi-color bar chart layer
			BarLayer layer = c.addBarLayer3(data5);

			//Set layer to 3D with 10 pixels 3D depth
			layer.set3D(10);

			//Set bar shape to circular (cylinder)
			layer.setBarShape(Chart.CircleShape);

			//Set the labels on the x axis.
			c.xAxis().setLabels(labels5);
			
			/*
			if (DUBWView.Checked)
			{
				c.xAxis().setTitle("KBytes");
			}
			if (DABWView.Checked)
			{
				c.xAxis().setTitle("Bytes");
			}*/
			

			//Add a title to the y axis
			if (DUBWView.Checked)
				c.yAxis().setTitle("KBytes");
			else
				c.yAxis().setTitle("Bytes/Secs");

			c.swapXY(true);

			//output the chart
			BWRStanding.Image = c.makeImage();
		}

		private void SnmpIntervalScan()
		{
			try
			{
				Process[] myProcesses;
				myProcesses = Process.GetProcessesByName("nMap");
				myProcesses[0].Kill();
				int nMapError = SystemLog.LastIndexOf("Start Project Interval Scan at :");
				if (nMapError==-1)
				{
					//+32
					int nMapError2 = SystemLog.IndexOf(" ",nMapError);
					nMapError2 = SystemLog.IndexOf(" ",nMapError2);
					nMapError2 = SystemLog.IndexOf(" ",nMapError2);
					string nMapERR = SystemLog.Substring(nMapError,nMapError2-nMapError);
					SystemLog += "Project Interval Scan at :"+nMapERR+" have Error on Scanning Host, Host Data at specific time is lost.\r\n";
					SystemLogPanel.Text = SystemLog;
					SystemLogPanel.Invalidate();
				}
			}
			catch
			{
			}
			DisableALL();
			DeleteDotIPFile();

			SystemLog += "Start Project Interval Scan at :"+DateTime.Now.ToString()+" \r\n     Get SNMP Value......\r\n";
			SystemLogPanel.Text = SystemLog;
			SystemLogPanel.Invalidate();

			SnmpGetByteEachThread();
			SnmpGetPacketEachThread();

			SystemLog += "     Finish Get SNMP Value......\r\n     Check Internet Connection......\r\n";
			SystemLogPanel.Text = SystemLog;
			SystemLogPanel.Invalidate();

			CreateChart4();
			CreateChart5();

			ReferencePointT();
			

			SystemLog += "     Finish Check Internet Connection......\r\n     Scanning Host Online......\r\n";
			SystemLogPanel.Text = SystemLog;
			SystemLogPanel.Invalidate();

			Snmp_Host_Scan();

			Get_DateFN();
			CheckDowntime();
			
			string Refreshstr = Config_Name.Text;
			Config_Name.Text = Refreshstr;

			SystemLog += "Project Interval Scan Complete at :"+DateTime.Now.ToString()+"\r\n";
			SystemLogPanel.Text = SystemLog;
			SystemLogPanel.Invalidate();



			EnableALL();
		}
	
		private void StartHostScan_Click(object sender, System.EventArgs e)
		{
			if (HostServiceScan.Checked)
				ScanOption = 1;
			else if (TrojanScan.Checked)
				ScanOption = 2;
			else if (PortSpecificScan.Checked)
				ScanOption = 3;

			if (HostIp.Text!="")
			{
				if ((ScanOption==3)&&(PortSpecific.Text==""))
					MessageBox.Show("Please Input Port Number","Error Message");
				else
				{

					Thread ScanningH = new Thread(new ThreadStart(EachHostScan));
					ScanningH.IsBackground = true;
					ScanningH.Start();			
				}
			}
			else
			{
				MessageBox.Show("Please Input Hostname or IP");
			}
		}
		
		private void EachHostScan()
		{
			StartHostScan.Enabled = false;
			StartHostScan.Text = "Scaning...";
			CSP.HostServiceScan(HostIp.Text,ScanOption,PortSpecific.Text);

			string IndexIP = "";
			for (int aa = 0;aa<HostIp.Text.Length;aa++)
			{
				if (HostIp.Text.Substring(aa,1)!=".")
					IndexIP += HostIp.Text.Substring(aa,1);
				else
					IndexIP += "_";
			}
	
			StreamReader IPD = new StreamReader(IndexIP+".info");
			string IPDetailText = IPD.ReadToEnd();
			IPD.Close();
			HostDetailBox.Text = IPDetailText;
			StartHostScan.Text = "Start Scan";
			StartHostScan.Enabled = true;
		}

		private void StandingRange_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			string FindIndex = (string)StandingRange.SelectedItem;//.Text;
			int Index_S1 = ConfigInfo.IndexOf(FindIndex);
			if (ConfigInfo.Substring(Index_S1-3,1)==" ")
			{
				Index_S1 = Index_S1 - 2;
				FindIndex = ConfigInfo.Substring(Index_S1,1);
			}
			else
			{
				Index_S1 = Index_S1 - 3;
				FindIndex = ConfigInfo.Substring(Index_S1,2);
			}
			
			string StandingFile = Config_Name.Text+FindIndex+"_Host.log";
			bool stopFN = false;
			string StandingText = "";
			try
			{
				StreamReader ST = new StreamReader(StandingFile);
				StandingText = ST.ReadToEnd();
				ST.Close();
			}
			catch
			{
				stopFN = true;
			}

			
			if (!stopFN)
			{
				//OverAll Standing Creator
				string AIP = "";
				int IndexA = 0;
				int IndexA2 = 0;
				int IndexA3 = 0;
				long Along = 0;
				string [] AIPA = new string[5];
				long [] AArray = new long[5];
				for (int AA = 0;AA<5;AA++)
				{
					AArray[AA] = 0;
					AIPA[AA] = "";
				}
				while (true)
				{
					IndexA = StandingText.IndexOf(":",IndexA);
					if (IndexA==-1) 
						break;
					else
						IndexA = IndexA + 2;
					IndexA2 = StandingText.IndexOf("&",IndexA)-1;
					AIP = StandingText.Substring(IndexA,IndexA2-IndexA);
					IndexA2 = StandingText.IndexOf("ZH",IndexA)+3;
					IndexA3 = StandingText.IndexOf(" ",IndexA2);
					Along = long.Parse(StandingText.Substring(IndexA2,IndexA3-IndexA2));
					IndexA2 = StandingText.IndexOf("UH",IndexA)+3;
					IndexA3 = StandingText.IndexOf(" ",IndexA2);
					Along += long.Parse(StandingText.Substring(IndexA2,IndexA3-IndexA2));
					for (int AA = 0;AA<5;AA++)
					{
						if (AArray[AA]<Along)
						{
							long tmpA = 0;
							long tmpA2 = Along;
							string tmpIPA = "";
							string tmpIPA2 = AIP;
							for (int AA2 = AA;AA2<5;AA2++)
							{
								tmpA = AArray[AA2];
								AArray[AA2] = tmpA2;
								tmpA2 = tmpA;
								tmpIPA = AIPA[AA2];
								AIPA[AA2] = tmpIPA2;
								tmpIPA2 = tmpIPA;
							}
							break;
						}
					}
				}
				OverAll1.Text = AIPA[0];
				OverAll2.Text = AIPA[1];
				OverAll3.Text = AIPA[2];
				OverAll4.Text = AIPA[3];
				OverAll5.Text = AIPA[4];
				//End of OverAll Standing Creator
			
				//Upload Standing Creator
				string UIP = "";
				int IndexU = 0;
				int IndexU2 = 0;
				int IndexU3 = 0;
				long Ulong = 0;
				string [] UIPA = new string[5];
				long [] UArray = new long[5];
				for (int UU = 0;UU<5;UU++)
				{
					UArray[UU] = 0;
					UIPA[UU] = "";
				}
				while (true)
				{
					IndexU = StandingText.IndexOf(":",IndexU);
					if (IndexU==-1) 
						break;
					else
						IndexU = IndexU + 2;
					IndexU2 = StandingText.IndexOf("&",IndexU)-1;
					UIP = StandingText.Substring(IndexU,IndexU2-IndexU);
					IndexU2 = StandingText.IndexOf("UH",IndexU)+3;
					IndexU3 = StandingText.IndexOf(" ",IndexU2);
					Ulong = long.Parse(StandingText.Substring(IndexU2,IndexU3-IndexU2));
					for (int UU = 0;UU<5;UU++)
					{
						if (UArray[UU]<Ulong)
						{
							long tmpU = 0;
							long tmpU2 = Ulong;
							string tmpIPU = "";
							string tmpIPU2 = UIP;
							for (int UU2 = UU;UU2<5;UU2++)
							{
								tmpU = UArray[UU2];
								UArray[UU2] = tmpU2;
								tmpU2 = tmpU;
								tmpIPU = UIPA[UU2];
								UIPA[UU2] = tmpIPU2;
								tmpIPU2 = tmpIPU;
							}
							break;
						}
					}
				}
				Upload1.Text = UIPA[0];
				Upload2.Text = UIPA[1];
				Upload3.Text = UIPA[2];
				Upload4.Text = UIPA[3];
				Upload5.Text = UIPA[4];
				//End of Upload Standing Creator
			
				//Download Standing Creator
				string DIP = "";
				int IndexD = 0;
				int IndexD2 = 0;
				int IndexD3 = 0;
				long Dlong = 0;
				string [] DIPA = new string[5];
				long [] DArray = new long[5];
				for (int DD = 0;DD<5;DD++)
				{
					DArray[DD] = 0;
					DIPA[DD] = "";
				}
				while (true)
				{
					IndexD = StandingText.IndexOf(":",IndexD);
					if (IndexD==-1) 
						break;
					else
						IndexD = IndexD + 2;
					IndexD2 = StandingText.IndexOf("&",IndexD)-1;
					DIP = StandingText.Substring(IndexD,IndexD2-IndexD);
					IndexD2 = StandingText.IndexOf("ZH",IndexD)+3;
					IndexD3 = StandingText.IndexOf(" ",IndexD2);
					Dlong = long.Parse(StandingText.Substring(IndexD2,IndexD3-IndexD2));
					for (int DD = 0;DD<5;DD++)
					{
						if (DArray[DD]<Dlong)
						{
							long tmpD = 0;
							long tmpD2 = Dlong;
							string tmpIPD = "";
							string tmpIPD2 = DIP;
							for (int DD2 = DD;DD2<5;DD2++)
							{
								tmpD = DArray[DD2];
								DArray[DD2] = tmpD2;
								tmpD2 = tmpD;
								tmpIPD = DIPA[DD2];
								DIPA[DD2] = tmpIPD2;
								tmpIPD2 = tmpIPD;
							}
							break;
						}
					}
				}
				Download1.Text = DIPA[0];
				Download2.Text = DIPA[1];
				Download3.Text = DIPA[2];
				Download4.Text = DIPA[3];
				Download5.Text = DIPA[4];
				//End of Download Standing Creator
			}
			

		}

		private void DateSelect_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			string Date = DateSelect.Text;
			RangeList.Items.Clear();
			RangeListL.Items.Clear();
			ViewList.Items.Clear();
			ViewListL.Items.Clear();
			//string[] tmpRangeList = new string[Network_Group.Items.Count];
			//Network_Group.Items.CopyTo(tmpRangeList,0);
			for (int TRL = 0;TRL<Network_Group.Items.Count;TRL++)
			{
				//RangeList.Items.Add(tmpRangeList[TRL]);
				int tmpTRL = TRL+1;
				string RangeListAdd = "Range # "+tmpTRL.ToString();
				RangeList.Items.Add(RangeListAdd);
				RangeListL.Items.Add(RangeListAdd);
			}
			
			
			CreateChart4();

		}

		private void BWView_CheckedChanged(object sender, System.EventArgs e)
		{
			string C4Check = (string)DateSelectL.SelectedItem;
			if (":"+C4Check+":"!="::")//DateSelect.Text!="")
				CreateChart4();
			if (!BWView.Checked)
				groupBox3.Enabled=false;
			else
				groupBox3.Enabled=true;
		}

		private void DU_CheckedChanged(object sender, System.EventArgs e)
		{
			if (DU.Checked)
			{
				string C4Check = (string)DateSelectL.SelectedItem;
				if (":"+C4Check+":"!="::")//DateSelect.Text!="")
					CreateChart4();	
			}
		}

		private void DOnly_CheckedChanged(object sender, System.EventArgs e)
		{
			if (DOnly.Checked)
			{
				string C4Check = (string)DateSelectL.SelectedItem;
				if (":"+C4Check+":"!="::")//DateSelect.Text!="")
					CreateChart4();	
			}
		}

		private void UOnly_CheckedChanged(object sender, System.EventArgs e)
		{
			if (UOnly.Checked)
			{
				string C4Check = (string)DateSelectL.SelectedItem;
				if (":"+C4Check+":"!="::")//DateSelect.Text!="")
					CreateChart4();	
			}
		}

		private void AddRange_Click(object sender, System.EventArgs e)
		{
			string tmpRL = (string)RangeListL.SelectedItem;//RangeList.Text;
			string RLx = (string)RangeListL.SelectedItem;//RangeList.Text;
			if (":"+RLx+":"!="::")
			{
				int tmpRL2 = tmpRL.IndexOf("#")+2;
				int tmpRL3 = tmpRL.Length;
				tmpRL = tmpRL.Substring(tmpRL2,tmpRL3-tmpRL2);
				int RL = Int32.Parse(tmpRL);
				string[] tmpVL = new string[ViewList.Items.Count+1];
				string[] tmpVLL = new string[ViewListL.Items.Count+1];
				ViewList.Items.CopyTo(tmpVL,0);
				ViewListL.Items.CopyTo(tmpVLL,0);
					ViewList.Items.Insert(0,RLx);
				ViewListL.Items.Insert(0,RLx);
				RangeList.Items.Remove(RLx);
				RangeListL.Items.Remove(RLx);
			}
			CreateChart4();
		}

		private void RemoveRange_Click(object sender, System.EventArgs e)
		{

			string tmpRL = (string)ViewListL.SelectedItem;//ViewList.Text;
			string RLx = (string)ViewListL.SelectedItem;//ViewList.Text;
			if (":"+RLx+":"!="::")
			{
				int tmpRL2 = tmpRL.IndexOf("#")+2;
				int tmpRL3 = tmpRL.Length;
				tmpRL = tmpRL.Substring(tmpRL2,tmpRL3-tmpRL2);
				int RL = Int32.Parse(tmpRL);
				string[] tmpVL = new string[RangeList.Items.Count+1];
				string[] tmpVLL = new string[RangeListL.Items.Count+1];
				RangeList.Items.CopyTo(tmpVL,0);
				RangeListL.Items.CopyTo(tmpVLL,0);
					RangeList.Items.Insert(0,RLx);
				RangeListL.Items.Insert(0,RLx);
				ViewList.Items.Remove(RLx);
				ViewListL.Items.Remove(RLx);
			}
			CreateChart4();
		
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			RangeList.Items.Clear();
			RangeListL.Items.Clear();
			ViewList.Items.Clear();
			ViewListL.Items.Clear();
			RangeList.Text = "";
			ViewList.Text = "";
			//string[] tmpRangeList = new string[Network_RealTime_Group.Items.Count];
			//Network_RealTime_Group.Items.CopyTo(tmpRangeList,0);
			for (int TRL = 0;TRL<Network_Group.Items.Count;TRL++)
			{
				//RangeList.Items.Add(tmpRangeList[TRL]);
				int tmpTRL = TRL+1;
				string RangeListAdd = "Range # "+tmpTRL.ToString();
				ViewList.Items.Add(RangeListAdd);
				ViewListL.Items.Add(RangeListAdd);
			}
			CreateChart4();
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			RangeList.Items.Clear();
			RangeListL.Items.Clear();
			ViewList.Items.Clear();
			ViewListL.Items.Clear();
			RangeList.Text = "";
			ViewList.Text = "";
			//string[] tmpRangeList = new string[Network_RealTime_Group.Items.Count];
			//Network_RealTime_Group.Items.CopyTo(tmpRangeList,0);
			for (int TRL = 0;TRL<Network_Group.Items.Count;TRL++)
			{
				//RangeList.Items.Add(tmpRangeList[TRL]);
				int tmpTRL = TRL+1;
				string RangeListAdd = "Range # "+tmpTRL.ToString();
				RangeList.Items.Add(RangeListAdd);
				RangeListL.Items.Add(RangeListAdd);
			}
			CreateChart4();	
		}

		private void SNMP_Component_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			PortDSC.Text = "";
			Port_Oid.Items.Clear();
			int SNMPCI1 = SNMP_Component.Text.IndexOf(" ");
			string SNMP_IP = SNMP_Component.Text.Substring(0,SNMPCI1);
			string Snmp_CN = SNMP_Component.Text.Substring(SNMPCI1+1,SNMP_Component.Text.Length-SNMPCI1-1);
			SnmpClass = new Snmpi(SNMP_IP,Snmp_CN,".1.3.6.1.2.1.2.2.1.2");
			string result = SnmpClass.getNext(".1.3.6.1.2.1.2.2.1.1");
			SNMPCI1 = 0;
			int SNMPCI2 = 0;
			string SNMPCI3 = "";
			SNMPCI1 = result.IndexOf(":",SNMPCI1)+1;
			while (true)
			{
				SNMPCI2 = result.IndexOf(":",SNMPCI1);
				if (SNMPCI2==-1)
					SNMPCI2 = result.Length;
				SNMPCI3 = result.Substring(SNMPCI1,SNMPCI2-SNMPCI1);
				Port_Oid.Items.Add(SNMPCI3);
				Port_Oid2.Items.Add(SNMPCI3);
				if (result.IndexOf(":",SNMPCI1) == -1)
					break;
				SNMPCI1 = result.IndexOf(":",SNMPCI1)+1;
			}
		}

		private void Port_Oid_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			try
			{
				int SNMPCI1 = SNMP_Component.Text.IndexOf(" ");
				string SNMP_IP = SNMP_Component.Text.Substring(0,SNMPCI1);
				string Snmp_CN = SNMP_Component.Text.Substring(SNMPCI1+1,SNMP_Component.Text.Length-SNMPCI1-1);
				SnmpClass = new Snmpi(SNMP_IP,Snmp_CN,".1.3.6.1.2.1.2.2.1.2");
				string result = SnmpClass.getEach(".1.3.6.1.2.1.2.2.1.2."+Port_Oid.Text);
				PortDSC.Text = result;
			}
			catch
			{
				PortDSC.Text = "";
			}
		}

		private void DUStand_CheckedChanged(object sender, System.EventArgs e)
		{
			if (DUStand.Checked)
				if (Config_Name.Text!="")
					CreateChart5();
		}

		private void DStand_CheckedChanged(object sender, System.EventArgs e)
		{
			if (DStand.Checked)
				if (Config_Name.Text!="")
					CreateChart5();
		}

		private void UStand_CheckedChanged(object sender, System.EventArgs e)
		{
			if (UStand.Checked)
				if (Config_Name.Text!="")
					CreateChart5();
		}

		private void Network_Group_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			bool moreport = false;
			int NGS = ConfigInfo.IndexOf(Network_Group.Text);
			int moreportNGS = NGS-2;
			if (ConfigInfo.Substring(moreportNGS,1)!=" ")
				moreportNGS--;
			moreportNGS = moreportNGS - 2;
			if (ConfigInfo.Substring(moreportNGS,1)=="!")
				moreport = true;
			NGS = ConfigInfo.IndexOf(" ",NGS)+1;
			int NGS2 = ConfigInfo.IndexOf(" ",NGS);
			string NGS3 = ConfigInfo.Substring(NGS,NGS2-NGS);
			Port_Oid.Text = NGS3;

			NGS = ConfigInfo.IndexOf("#",NGS)+2;
			NGS2 = ConfigInfo.IndexOf(" ",NGS);
			string NGS32 = ConfigInfo.Substring(NGS,NGS2-NGS);
			Port_Oid2.Text = NGS32;

			NGS = ConfigInfo.IndexOf("@",NGS)+2;
			NGS2 = ConfigInfo.IndexOf(" ",NGS);
			string SNMP_IP = ConfigInfo.Substring(NGS,NGS2-NGS);
			NGS = NGS2+1;
			NGS2 = ConfigInfo.IndexOf(" ",NGS);
			string Snmp_CN = ConfigInfo.Substring(NGS,NGS2-NGS);
			SNMP_Component.Text = SNMP_IP+" "+Snmp_CN;
			PortDSC.Text = "";
			PortDSC2.Text = "";
			try
			{
				SnmpClass = new Snmpi(SNMP_IP,Snmp_CN,".1.3.6.1.2.1.2.2.1.2");
				string result = SnmpClass.getEach(".1.3.6.1.2.1.2.2.1.2."+NGS3);
				PortDSC.Text = result;
			}
			catch
			{
				PortDSC.Text = "Port not found";
			}
			try
			{
				SnmpClass = new Snmpi(SNMP_IP,Snmp_CN,".1.3.6.1.2.1.2.2.1.2");
				string result = SnmpClass.getEach(".1.3.6.1.2.1.2.2.1.2."+NGS32);
				PortDSC2.Text = result;
			}
			catch
			{
				PortDSC2.Text = "Port not found";
			}
		}

		private void Edit_Network_Group_Click(object sender, System.EventArgs e)
		{
			string ENG_Network = Network_Group.Text;
			string ENG_SNMP = SNMP_Component.Text;
			string ENG_Port = Port_Oid.Text;
			bool Valid = true;
			if (ENG_Network=="")
				Valid = false;
			if (ENG_SNMP=="")
				Valid = false;
			if (ENG_Port=="")
				Valid = false;
			if (Valid)
			{
				int ENG1 = ConfigInfo.IndexOf(ENG_Network);
				ENG1 = ConfigInfo.IndexOf(" ",ENG1)+1;
				int ENG2 = ConfigInfo.IndexOf("@",ENG1-1);
				
				ConfigInfo = ConfigInfo.Remove(ENG1,ENG2-ENG1);
				ConfigInfo = ConfigInfo.Insert(ENG1,ENG_Port+" .1.3.6.1.2.1.2.2.1.10."+ENG_Port+" .1.3.6.1.2.1.2.2.1.16."+ENG_Port+" ");
				ENG2 = ConfigInfo.IndexOf("@",ENG1-1);
				if (Port_Oid2.Text!="")
				{
					ConfigInfo = ConfigInfo.Insert(ENG2,"# "+Port_Oid2.Text+" .1.3.6.1.2.1.2.2.1.10."+Port_Oid2.Text+" .1.3.6.1.2.1.2.2.1.16."+Port_Oid2.Text+" ");
				}
				ENG1 = ConfigInfo.IndexOf("@",ENG1)+2;
				ENG2 = ConfigInfo.IndexOf(" ",ENG1)+1;
				ENG2 = ConfigInfo.IndexOf(" ",ENG2);
				ConfigInfo = ConfigInfo.Remove(ENG1,ENG2-ENG1);
				ConfigInfo = ConfigInfo.Insert(ENG1,ENG_SNMP);

				string Display = "";
				int StopD = ConfigInfo.LastIndexOf(":");
				for (int i = ConfigInfo.IndexOf(":") ; i< ConfigInfo.Length ;i++)
				{
					if (i==StopD)
						break;
					if ((ConfigInfo.Substring(i,1)!="^")&&(ConfigInfo.Substring(i,1)!="*")&&(ConfigInfo.Substring(i,1)!=":")&&(ConfigInfo.Substring(i,1)!="="))
					{
						Display += ConfigInfo.Substring(i,1);
						if (ConfigInfo.Substring(i,1)==" ")
							Display += " ";
					}
				}
				txtData.Text = Display;
				txtData.Invalidate();
				string strPath = Config_Name.Text+".conf";
				StreamWriter CW = new StreamWriter(strPath,false);
				CW.Write (ConfigInfo);
				CW.Flush();
				CW.Close();
			}
		}

		private void AddRP_Click(object sender, System.EventArgs e)
		{
			if (!RefIP.Visible)
			{
				RefIP.Visible = true;
				testRP.Enabled = false;
				RefIP.Text = "";
				AddRP.Text = "Add URL";
			}
			else
			{
				testRP.Enabled = true;
				RefIP.Visible = false;
				AddRP.Text = "Add Point";
				string tmpRP = RefIP.Text;
				if (tmpRP!="")
				{

					CSP.ReferencePointScan(tmpRP);
					
					if (CSP.RPValid)
					{
						string RFile = "ReferencePoint.RPF";
						StreamReader RR = new StreamReader(RFile);
						string R_Text = RR.ReadToEnd();
						RR.Close();
			
						if (R_Text.IndexOf("tmpRP")==-1)
						{
							StreamWriter RW = new StreamWriter(RFile,true);				
							RW.Write (" &| "+tmpRP+" \r\n");				
							RW.Flush();				
							RW.Close();
							ReferencePoint.Items.Add(tmpRP);
						}
					}
					else
					{
						MessageBox.Show("IP/URL Invalid");
						CSP.RPValid = true;
					}
				}
			}

		}

		private void RemoveRP_Click(object sender, System.EventArgs e)
		{
			if (":"+(string)ReferencePoint.SelectedItem+":"!="::")
			{
				string tmpRP = ReferencePoint.Text;

				string RFile = "ReferencePoint.RPF";
				StreamReader RR = new StreamReader(RFile);
				string R_Text = RR.ReadToEnd();
				RR.Close();
				int R_Index = 0;
				int R_Index2 = 0;

				if (R_Text.IndexOf(tmpRP) != -1)
				{
					R_Index = R_Text.IndexOf(" &| "+tmpRP+" ");
					R_Index2 = R_Text.IndexOf("\r\n",R_Index)+2;
					R_Text = R_Text.Remove(R_Index,R_Index2-R_Index);
					StreamWriter RW = new StreamWriter(RFile,false);				
					RW.Write (R_Text);				
					RW.Flush();				
					RW.Close();

					ReferencePoint.Items.Remove(tmpRP);
				}
			}
		
		}

		private void ReferencePointT()
		{
			testRP.Enabled = false;
			AddRP.Enabled = false;
			RemoveRP.Enabled = false;
			//testRP.Text = "Probing...";
			int DisconnectCount = 0;
			while (true)
			{
				Random random = new Random();
				int num = random.Next(50);

				string RFile = "ReferencePoint.RPF";
				StreamReader RR = new StreamReader(RFile);
				string R_Text = RR.ReadToEnd();
				RR.Close();

				string RP_S = "";
				int R_Index = 0,R_Index2 = 0;

				for (int RP_I = 0;RP_I<=num;RP_I++)
				{
					R_Index = R_Text.IndexOf("&|",R_Index)+1;
				}

				R_Index = R_Text.IndexOf("|",R_Index)+2;
				R_Index2 = R_Text.IndexOf(" ",R_Index);
				RP_S = R_Text.Substring(R_Index,R_Index2-R_Index);

				CSP.ReferencePointScan(RP_S);

				StreamReader RR2 = new StreamReader("RPSC.info");
				R_Text = RR2.ReadToEnd();
				RR2.Close();
				//80/tcp open

				if (R_Text.IndexOf("80/tcp open")!=-1)
					break;
				else if (DisconnectCount == 5)
					break;
				else
					DisconnectCount++;
			}
			if (DisconnectCount != 5)
			{
				StreamWriter RWx = new StreamWriter("ConDcon.info",true);				
				RWx.Write (" C : " +DateTime.Now.ToString() + "| \r\n");				
				RWx.Flush();				
				RWx.Close();
				//Connect_Status.Checked = true;
				Connect_R.Checked = true;
			}
			else
			{
				StreamWriter RWx = new StreamWriter("ConDcon.info",true);				
				RWx.Write (" D : " +DateTime.Now.ToString() + "| \r\n");				
				RWx.Flush();				
				RWx.Close();
				//Connect_Status.Checked = false;
				Connect_R.Checked = false;
			}
			testRP.Enabled = true;
			AddRP.Enabled = true;
			RemoveRP.Enabled =true;
			//testRP.Text = "Probe Internet Connection";
		}

		private void testRP_Click(object sender, System.EventArgs e)
		{

			Thread RPThread = new Thread(new ThreadStart(ReferencePointT));
			RPThread.IsBackground = true;
			RPThread.Start();
		}

		private void PortSpecificScan_CheckedChanged(object sender, System.EventArgs e)
		{
			if (PortSpecificScan.Checked)
				PortSpecific.Enabled = true;
			else
				PortSpecific.Enabled = false;
		}

		private void ViewConfig_Click(object sender, System.EventArgs e)
		{
			/*
			if (txtData.Visible)
			{
				txtData.Visible = false;
			}
			else
			{
				txtData.Visible = true;
			}*/
			EnableALL();
		}

		private void DUBWView_CheckedChanged(object sender, System.EventArgs e)
		{
			CreateChart5();
		}

		private void button1_Click_1(object sender, System.EventArgs e)
		{
			/*
			SystemLog += "Start Project Interval Scan at :"+DateTime.Now.ToString()+"\r\n     Get SNMP Value......\r\n";
			SystemLogPanel.Text = SystemLog;
			SystemLogPanel.Invalidate();

			SnmpGetByteEachThread();
			SnmpGetPacketEachThread();

			SystemLog += "     Finish Get SNMP Value......\r\n     Scanning Host Online......\r\n";
			SystemLogPanel.Text = SystemLog;
			SystemLogPanel.Invalidate();

			CreateChart4();
			CreateChart5();

			Snmp_Host_Scan();

			SystemLog += "     Finish Scanning Host Online......\r\n     Check Internet Connection......\r\n";
			SystemLogPanel.Text = SystemLog;
			SystemLogPanel.Invalidate();

			ReferencePointT();

			Get_DateFN();
			CheckDowntime();
			DeleteDotIPFile();
			string Refreshstr = Config_Name.Text;
			Config_Name.Text = Refreshstr;

			SystemLog += "Project Interval Scan Complete at :"+DateTime.Now.ToString()+"\r\n";
			SystemLogPanel.Text = SystemLog;
			SystemLogPanel.Invalidate();
			*/
			DisableALL();
			
			
		}

		private void Port_Oid2_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			try
			{
				int SNMPCI1 = SNMP_Component.Text.IndexOf(" ");
				string SNMP_IP = SNMP_Component.Text.Substring(0,SNMPCI1);
				string Snmp_CN = SNMP_Component.Text.Substring(SNMPCI1+1,SNMP_Component.Text.Length-SNMPCI1-1);
				SnmpClass = new Snmpi(SNMP_IP,Snmp_CN,".1.3.6.1.2.1.2.2.1.2");
				string result = SnmpClass.getEach(".1.3.6.1.2.1.2.2.1.2."+Port_Oid2.Text);
				PortDSC2.Text = result;
			}
			catch
			{
				PortDSC2.Text = "";
			}
		}

		private void Network_Group_TextChanged(object sender, System.EventArgs e)
		{
			SNMP_Component.Text = "";
			Port_Oid.Text = "";
			PortDSC.Text = "";
			Port_Oid2.Text = "";
			PortDSC2.Text = "";
		}

		private void Get_DateFN()
		{
			//GetDate
			bool ScanB4 = false;
			DateSelect.Items.Clear();
			DateSelectL.Items.Clear();
				
			DirectoryInfo Dir = new DirectoryInfo(Directory.GetCurrentDirectory());

			FileInfo[] AnyLFile = Dir.GetFiles(Config_Name.Text+"_TimeI.log");
			foreach (FileInfo fif in AnyLFile)
				ScanB4 = true;
			
			if (ScanB4)
			{
				string StandingFile = Config_Name.Text+"_TimeI.log";
				StreamReader ST2 = new StreamReader(StandingFile);
				string StandingText2 = ST2.ReadToEnd();
				ST2.Close();

				int DIndex1 = StandingText2.IndexOf("#")+2;
				int DIndex2 = StandingText2.IndexOf(" ",DIndex1);
				string Date1 = StandingText2.Substring(DIndex1,DIndex2-DIndex1);
				string Date2 = "";
				DateSelect.Items.Add(Date1);
				DateSelectL.Items.Add(Date1);
				while (true)
				{
					DIndex1 = StandingText2.IndexOf("#",DIndex1);
					if (DIndex1==-1)
						break;
					else
					{
						DIndex1 = DIndex1+2;
						DIndex2 = StandingText2.IndexOf(" ",DIndex1);
						Date2 = StandingText2.Substring(DIndex1,DIndex2-DIndex1);
						if (Date1 != Date2)
						{
							DateSelect.Items.Add(Date2);
							DateSelectL.Items.Add(Date2);
							Date1 = Date2;
						}
					}
				}
			}
			//End of GetDate
		}

		private void Network_GroupL_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			string IPstr2 = (string)Network_GroupL.SelectedItem;
			int IPIDX = IPstr2.IndexOf(":")+2;
			IPstr2 = IPstr2.Substring(IPIDX,IPstr2.Length-IPIDX);
			Network_Group.Text = IPstr2;
		}

		private void DateSelectL_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			AddRAll.Enabled = true;
			RemoveRAll.Enabled = true;
			string Date = (string)DateSelectL.SelectedItem;;
			string Time = "";
			string StandingFile = Config_Name.Text+"_TimeI.log";
			TimeSelectL.Items.Clear();
			
			StreamReader ST = new StreamReader(StandingFile);
			string StandingText = ST.ReadToEnd();
			ST.Close();

			int DIndex1 = StandingText.IndexOf(Date);
			DIndex1 = StandingText.IndexOf(" ",DIndex1)+1;
			int DIndex2 = StandingText.IndexOf(":",DIndex1)+1;
			DIndex2 = StandingText.IndexOf(":",DIndex2);
			Time = StandingText.Substring(DIndex1,DIndex2-DIndex1);
			DIndex1 = StandingText.IndexOf(" ",DIndex1)+1;
			Time += " "+StandingText.Substring(DIndex1,1)+"M";
			string Time2 = "";
			//TimeSelect.Items.Add(Time);
			TimeSelectL.Items.Add(Time);
			
			while (true)
			{
				DIndex1 = StandingText.IndexOf(Date,DIndex1);
				if (DIndex1==-1)
					break;
				else
				{
					DIndex1 = StandingText.IndexOf(" ",DIndex1)+1;
					DIndex2 = StandingText.IndexOf(":",DIndex1)+1;
					DIndex2 = StandingText.IndexOf(":",DIndex2);
					Time2 = StandingText.Substring(DIndex1,DIndex2-DIndex1);
					DIndex1 = StandingText.IndexOf(" ",DIndex1)+1;
					Time2 += " " +StandingText.Substring(DIndex1,1)+"M";
					if (Time != Time2)
					{
						//TimeSelect.Items.Add(Time2);
						TimeSelectL.Items.Add(Time2);
						Time = Time2;
					}
				}
			}

			//*********************************Graph 4
			RangeList.Items.Clear();
			RangeListL.Items.Clear();
			ViewList.Items.Clear();
			ViewListL.Items.Clear();
			//string[] tmpRangeList = new string[Network_Group.Items.Count];
			//Network_Group.Items.CopyTo(tmpRangeList,0);
			for (int TRL = 0;TRL<Network_Group.Items.Count;TRL++)
			{
				//RangeList.Items.Add(tmpRangeList[TRL]);
				int tmpTRL = TRL+1;
				string RangeListAdd = "Range # "+tmpTRL.ToString();
				RangeList.Items.Add(RangeListAdd);
				RangeListL.Items.Add(RangeListAdd);
			}

			CreateChart4();
			//**********************************
		}

		private void TimeSelectL_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			string TimeStr = (string)TimeSelectL.SelectedItem;//TimeSelect.Text.Substring(0,TimeSelect.Text.Length-1);
			bool PMMM = false;
			if (TimeStr.Substring(TimeStr.Length-2,1)=="P")
				PMMM = true;
			TimeStr = TimeStr.Substring(0,TimeStr.Length-4);
			
			string DateTime = DateSelect.Text+" "+TimeStr;
			int tmpRII = ConfigInfo.LastIndexOf(":")+2;
			int tmpRII2 = ConfigInfo.IndexOf(" ",tmpRII);
			string tmpRII3 = ConfigInfo.Substring(tmpRII,tmpRII2-tmpRII);
			int RII = Int32.Parse(tmpRII3);
			HistoryHostText.Text = "";
			for (int TSI=1;TSI<RII;TSI++)
			{
				try
				{
					StreamReader SCT = new StreamReader(Config_Name.Text+"_"+TSI.ToString()+"_HE.log");
					string SCTText = SCT.ReadToEnd();
					SCT.Close();
	
					//MessageBox.Show(":"+DateTime+":");
					int tmpDT1 = SCTText.IndexOf(DateTime);
					if (PMMM)
					{
						int tmpDTBug = SCTText.IndexOf(DateTime,tmpDT1+30);
						if (tmpDTBug!=-1)
							tmpDT1 = tmpDTBug;
					}
					if (tmpDT1 ==-1)
						continue;
					int tmpDT2 = SCTText.IndexOf("]",tmpDT1)-1;
					SCTText = SCTText.Substring(0,tmpDT2);
					tmpDT1 = SCTText.LastIndexOf("[");
					SCTText = SCTText.Substring(tmpDT1);
					tmpDT1 = SCTText.LastIndexOf("=:=");
					SCTText = SCTText.Substring(4,tmpDT1-2);
					string DiaplayTS = " Range # "+TSI.ToString()+"\r\n";
					bool OK = true;
					bool OK2 = true;
					for (int TSI2 = 0;TSI2<SCTText.Length;TSI2++)
					{
						if (SCTText.Substring(TSI2,1)==":")
						{
							OK = true;
							OK2 = true;
							DiaplayTS += "\r\n";
						}
						else if (SCTText.Substring(TSI2,1)=="|")
						{
							if (OK2)
							{
								OK2 = false;
								DiaplayTS += " Host = ";
							}
							else
								OK = false;
						}
						else
						{
							if (OK)
								DiaplayTS += SCTText.Substring(TSI2,1);
						}

					}

					StreamReader SCT2 = new StreamReader(Config_Name.Text+"_"+TSI.ToString()+"_BE.log");
					SCTText = SCT2.ReadToEnd();
					SCT2.Close();

					tmpDT1 = SCTText.IndexOf(DateTime);
					tmpDT1 = SCTText.IndexOf("X=",tmpDT1)+3;
					tmpDT2 = SCTText.IndexOf(" ",tmpDT1);
					string DValue = SCTText.Substring(tmpDT1,tmpDT2-tmpDT1);
				

					StreamReader SCT3 = new StreamReader(Config_Name.Text+"_"+TSI.ToString()+"_PE.log");
					SCTText = SCT3.ReadToEnd();
					SCT3.Close();

					tmpDT1 = SCTText.IndexOf(DateTime);
					tmpDT1 = SCTText.IndexOf("X=",tmpDT1)+3;
					tmpDT2 = SCTText.IndexOf(" ",tmpDT1);
					string PValue = SCTText.Substring(tmpDT1,tmpDT2-tmpDT1);
					long AValue = long.Parse(DValue);
					AValue += long.Parse(PValue);
					DiaplayTS += "\r\n OverAll Stream      = "+AValue.ToString()+" Bytes";
					DiaplayTS += "\r\n Download Stream  = "+DValue+" Bytes";
					DiaplayTS += "\r\n Upload Stream       = "+PValue+" Bytes \r\n\r\n";
					string[] tmpHLD = new string[ViewListL.Items.Count];
					ViewListL.Items.CopyTo(tmpHLD,0);
					bool DisplayAllow = false;
					for (int HLD = 0;HLD<ViewListL.Items.Count;HLD++)
					{
						if (DiaplayTS.IndexOf(tmpHLD[HLD])!=-1)
							DisplayAllow = true;
					}
					if (DisplayAllow)
						HistoryHostText.Text += DiaplayTS;
				}
				catch
				{
				}
			}//end for
			if (HistoryHostText.Text == "")
				HistoryHostText.Text = "Data Not Available due to Error on Scanning Host at specific time.";
		}

		private void RangeListL_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			string tmpRL = (string)RangeListL.SelectedItem;//RangeList.Text;
			string RLx = (string)RangeListL.SelectedItem;//RangeList.Text;
			if (":"+RLx+":"!="::")
			{
				int tmpRL2 = tmpRL.IndexOf("#")+2;
				int tmpRL3 = tmpRL.Length;
				tmpRL = tmpRL.Substring(tmpRL2,tmpRL3-tmpRL2);
				int RL = Int32.Parse(tmpRL);
				string[] tmpVL = new string[ViewList.Items.Count+1];
				string[] tmpVLL = new string[ViewListL.Items.Count+1];
				ViewList.Items.CopyTo(tmpVL,0);
				ViewListL.Items.CopyTo(tmpVLL,0);
				ViewList.Items.Insert(0,RLx);
				ViewListL.Items.Insert(0,RLx);
				RangeList.Items.Remove(RLx);
				RangeListL.Items.Remove(RLx);
			}
			CreateChart4();
		}

		private void ViewListL_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			string tmpRL = (string)ViewListL.SelectedItem;//ViewList.Text;
			string RLx = (string)ViewListL.SelectedItem;//ViewList.Text;
			if (":"+RLx+":"!="::")
			{
				int tmpRL2 = tmpRL.IndexOf("#")+2;
				int tmpRL3 = tmpRL.Length;
				tmpRL = tmpRL.Substring(tmpRL2,tmpRL3-tmpRL2);
				int RL = Int32.Parse(tmpRL);
				string[] tmpVL = new string[RangeList.Items.Count+1];
				string[] tmpVLL = new string[RangeListL.Items.Count+1];
				RangeList.Items.CopyTo(tmpVL,0);
				RangeListL.Items.CopyTo(tmpVLL,0);
				RangeList.Items.Insert(0,RLx);
				RangeListL.Items.Insert(0,RLx);
				ViewList.Items.Remove(RLx);
				ViewListL.Items.Remove(RLx);
			}
			CreateChart4();		
		}

		private void CheckDowntime()
		{
			string RFile = "ConDcon.info";
			string R_Text = "";
			try
			{
				StreamReader RR = new StreamReader(RFile);
				R_Text = RR.ReadToEnd();
				RR.Close();
			}
			catch
			{
				StreamWriter RW = new StreamWriter(RFile,false);
				RW.Write("");
				RW.Flush();
				RW.Close();

			}
			int R_Index = 0,R_Index2 = 0;
			DownTime.Text = "";
			while (true)
			{
				R_Index = R_Text.IndexOf("D",R_Index);
				if (R_Index == -1)
					break;
				else
				{

					R_Index +=4;
					R_Index = R_Text.IndexOf(" ",R_Index)+1;	
					R_Index2 = R_Text.IndexOf(":",R_Index)+1;
					R_Index2 = R_Text.IndexOf(":",R_Index2);
					DownTime.Text += R_Text.Substring(R_Index,R_Index2-R_Index)+"\r\n";

				}
				//Date

			}
		}

		private void menuItem3_Click(object sender, System.EventArgs e)
		{
			if (Config_Name.Text!="")
			{
				string strPath = "";
				SaveFileDialog sfDlg = new SaveFileDialog();
				sfDlg.Title = "Save Project and Log File";
				sfDlg.Filter = "Config File (*.conf)|*.conf";
				sfDlg.RestoreDirectory = true;
				sfDlg.FileName = Config_Name.Text+".conf";
			
				if (sfDlg.ShowDialog() == DialogResult.OK)
				{
					strPath = sfDlg.FileName;
					if (strPath.IndexOf(".conf")!=-1)
						strPath = strPath.Substring(0,strPath.IndexOf(".conf"));
					try
					{
						int Last = ConfigInfo.LastIndexOf(":")+2;
						int Last2 = ConfigInfo.IndexOf(" ",Last);
						Last = Int32.Parse(ConfigInfo.Substring(Last,Last2-Last));
						string Save_File ="";
						for (int LI =1;LI<Last;LI++)
						{
							Last2 = LI;
							StreamReader SFR = new StreamReader(Config_Name.Text+"_"+Last2.ToString()+"_BE.log");
							Save_File = SFR.ReadToEnd();
							SFR.Close();
							StreamWriter SFW = new StreamWriter(strPath+"_"+Last2.ToString()+"_BE.log",false);
							SFW.Write(Save_File);
							SFW.Flush();
							SFW.Close();

							StreamReader SFR2 = new StreamReader(Config_Name.Text+"_"+Last2.ToString()+"_PE.log");
							Save_File = SFR2.ReadToEnd();
							SFR2.Close();
							StreamWriter SFW2 = new StreamWriter(strPath+"_"+Last2.ToString()+"_PE.log",false);
							SFW2.Write(Save_File);
							SFW2.Flush();
							SFW2.Close();

							StreamReader SFR3 = new StreamReader(Config_Name.Text+"_"+Last2.ToString()+"_HE.log");
							Save_File = SFR3.ReadToEnd();
							SFR3.Close();
							StreamWriter SFW3 = new StreamWriter(strPath+"_"+Last2.ToString()+"_HE.log",false);
							SFW3.Write(Save_File);
							SFW3.Flush();
							SFW3.Close();

							StreamReader SFR4 = new StreamReader(Config_Name.Text+Last2.ToString()+"_Host.log");
							Save_File = SFR4.ReadToEnd();
							SFR4.Close();
							StreamWriter SFW4 = new StreamWriter(strPath+Last2.ToString()+"_Host.log",false);
							SFW4.Write(Save_File);
							SFW4.Flush();
							SFW4.Close();
						}

						StreamReader SFR5 = new StreamReader(Config_Name.Text+"_TimeI.log");
						Save_File = SFR5.ReadToEnd();
						SFR5.Close();
						StreamWriter SFW5 = new StreamWriter(strPath+"_TimeI.log",false);
						SFW5.Write(Save_File);
						SFW5.Flush();
						SFW5.Close();
					}
					catch
					{

					}

					StreamWriter SFW6 = new StreamWriter(strPath+".conf",false);
					SFW6.Write(ConfigInfo);
					SFW6.Flush();
					SFW6.Close();
					//MessageBox.Show(strPath);

				}
			}
		}

		private void menuItem2_Click(object sender, System.EventArgs e)
		{
			string strPath = "";
			string strPath2 = "";
			OpenFileDialog foDlg = new OpenFileDialog();
			foDlg.Title = "Open Project and Log File";
			foDlg.Filter = "Config File (*.conf)|*.conf";
			foDlg.RestoreDirectory = true;

			if (foDlg.ShowDialog()==DialogResult.OK)
			{
				strPath = foDlg.FileName;
				strPath = strPath.Substring(0,strPath.IndexOf(".conf"));
				strPath2 = strPath.Substring(strPath.LastIndexOf("\\")+1,strPath.Length-strPath.LastIndexOf("\\")-1);
				bool Valid = true;
				if (Config_Name.Items.IndexOf(strPath2)!=-1)
				{
					Valid = false;
					if (MessageBox.Show("This will overwrite exiting Project file and delete/overwrite all associate log file, Continue?","Warning",MessageBoxButtons.YesNo,MessageBoxIcon.Warning,MessageBoxDefaultButton.Button2)==DialogResult.Yes)
					{
						Valid = true;
					}
				}
				//MessageBox.Show(":"+Directory.GetCurrentDirectory()+"+"+strPath.Substring(0,strPath.LastIndexOf("\\"))+":");
				//Path.
				if (Directory.GetCurrentDirectory()==strPath.Substring(0,strPath.LastIndexOf("\\")))
					Valid = false;
				
				if (Valid)
				{
					StreamReader SFR0 = new StreamReader(strPath+".conf");
					ConfigInfo = SFR0.ReadToEnd();
					SFR0.Close();
					StreamWriter SFW0 = new StreamWriter(strPath2+".conf",false);
					SFW0.Write(ConfigInfo);
					SFW0.Flush();
					SFW0.Close();
					try
					{
						int Last = ConfigInfo.LastIndexOf(":")+2;
						int Last2 = ConfigInfo.IndexOf(" ",Last);
						Last = Int32.Parse(ConfigInfo.Substring(Last,Last2-Last));
						string Save_File ="";
						for (int LI =1;LI<Last;LI++)
						{
							Last2 = LI;
							StreamReader SFR = new StreamReader(strPath+"_"+Last2.ToString()+"_BE.log");
							Save_File = SFR.ReadToEnd();
							SFR.Close();
							StreamWriter SFW = new StreamWriter(strPath2+"_"+Last2.ToString()+"_BE.log",false);
							SFW.Write(Save_File);
							SFW.Flush();
							SFW.Close();

							StreamReader SFR2 = new StreamReader(strPath+"_"+Last2.ToString()+"_PE.log");
							Save_File = SFR2.ReadToEnd();
							SFR2.Close();
							StreamWriter SFW2 = new StreamWriter(strPath2+"_"+Last2.ToString()+"_PE.log",false);
							SFW2.Write(Save_File);
							SFW2.Flush();
							SFW2.Close();

							StreamReader SFR3 = new StreamReader(strPath+"_"+Last2.ToString()+"_HE.log");
							Save_File = SFR3.ReadToEnd();
							SFR3.Close();
							StreamWriter SFW3 = new StreamWriter(strPath2+"_"+Last2.ToString()+"_HE.log",false);
							SFW3.Write(Save_File);
							SFW3.Flush();
							SFW3.Close();

							StreamReader SFR4 = new StreamReader(strPath+Last2.ToString()+"_Host.log");
							Save_File = SFR4.ReadToEnd();
							SFR4.Close();
							StreamWriter SFW4 = new StreamWriter(strPath2+Last2.ToString()+"_Host.log",false);
							SFW4.Write(Save_File);
							SFW4.Flush();
							SFW4.Close();
						}

						StreamReader SFR5 = new StreamReader(strPath+"_TimeI.log");
						Save_File = SFR5.ReadToEnd();
						SFR5.Close();
						StreamWriter SFW5 = new StreamWriter(strPath2+"_TimeI.log",false);
						SFW5.Write(Save_File);
						SFW5.Flush();
						SFW5.Close();
					}
					catch
					{

					}
				}
				if (Config_Name.Items.IndexOf(strPath2)==-1)
					Config_Name.Items.Add(strPath2);
				Config_Name.Text = strPath2;

				
				//MessageBox.Show(":"+strPath2+":");
			}
		}
		
		private void DeleteDotIPFile()
		{
			DirectoryInfo DirI = new DirectoryInfo(Directory.GetCurrentDirectory());
			string AllIPFile = "*.IP";
			FileInfo[] AnyIPFile = DirI.GetFiles(AllIPFile);
			foreach (FileInfo fif in AnyIPFile)
			{
				fif.Delete();
			}
		}

		private void CreateBlankCF_Click(object sender, System.EventArgs e)
		{
			if (Config_Name.Text!="")
			{
				DirectoryInfo DirI = new DirectoryInfo(Directory.GetCurrentDirectory());
				string AllCFile = "*.conf";
				bool OVW = false;
				FileInfo[] AnyCFile = DirI.GetFiles(AllCFile);
				foreach (FileInfo fif in AnyCFile)
				{
					//MessageBox.Show(":"+fif.Name.ToString()+":");
					if (Config_Name.Text+".conf"==fif.Name.ToString())
						OVW = true;
				}
				string ConfigInfoX = "^ Snmp_IP+Snmp_Commu\r\n\r\n= \r\n*\r\n";
				//ConfigInfo += "^ Network_IP+Snmp_Byte\r\n\r\n$ \r\n*\r\n";
				ConfigInfoX += "^ Network_IP+Oid\r\n\r\n: 1 \r\n*\r\n";
				if (OVW)
				{
					if (MessageBox.Show("This will overwrite exiting Project file and delete all associate log file, Continue?","Warning",MessageBoxButtons.YesNo,MessageBoxIcon.Warning,MessageBoxDefaultButton.Button2)==DialogResult.Yes)
					{
						ConfigInfo = ConfigInfoX;
						StreamWriter CFW = new StreamWriter(Config_Name.Text+".conf",false);				
						CFW.Write (ConfigInfoX);				
						CFW.Flush();				
						CFW.Close();

						DirectoryInfo DirID = new DirectoryInfo(Directory.GetCurrentDirectory());
						string AllLFile = "*.log";
						FileInfo[] AnyLFile = DirID.GetFiles(AllLFile);
						foreach (FileInfo fif in AnyLFile)
						{
							fif.Delete();
						}
						ClearALL();

					}
				}
				else
				{
					ConfigInfo = ConfigInfoX;
					//MessageBox.Show(ConfigInfo);
					StreamWriter CFW = new StreamWriter(Config_Name.Text+".conf",false);				
					CFW.Write (ConfigInfoX);				
					CFW.Flush();				
					CFW.Close();
					ClearALL();
				}
				if (Config_Name.Items.IndexOf(Config_Name.Text)==-1)
					Config_Name.Items.Add(Config_Name.Text);
			}
			else
				MessageBox.Show("Please create Project Name");
		
		}
	
		private void ClearALL()
		{
			StandingRange.Items.Clear();
			Network_Group.Items.Clear();
			DateSelect.Items.Clear();
			DateSelectL.Items.Clear();
			TimeSelectL.Items.Clear();
			RangeList.Items.Clear();
			RangeListL.Items.Clear();
			Network_Group.Items.Clear();
			SNMP_Component.Items.Clear();
			SNMP_ComponentL.Items.Clear();
			Network_GroupL.Items.Clear();

			Network_Group.Text = "";
			SNMP_Component.Text = "";
			Port_Oid.Text = "";
			PortDSC.Text = "";
			AddSnmpIP.Text = "";
			AddSnmpCom.Text = "";
			StandingRange.Text = "";
			OverAll1.Text = "";OverAll2.Text = "";OverAll3.Text = "";OverAll4.Text = "";OverAll5.Text = "";
			Download1.Text = "";Download2.Text = "";Download3.Text = "";Download4.Text = "";Download5.Text = "";
			Upload1.Text = "";Upload2.Text = "";Upload3.Text = "";Upload4.Text = "";Upload5.Text = "";
			RangeList.Text = "";ViewList.Text = "";DateSelect.Text = "";
			RangeListL.Items.Clear();ViewListL.Items.Clear();
			HistoryHostText.Text = "";
			Port_Oid2.Items.Clear();Port_Oid2.Text = "";PortDSC2.Text = "";
			ConfigInfo = "";

			for (int i = 0;i<20;i++)
			{
				Snmp_Host_Array_O[i] = 0;
				Snmp_Host_Array_N[i] = 0;
				Packet_Z_Array[i] = 0;
				Packet_C_Array[i] = 0;
				Byte_Z_Array[i] = 0;
				Byte_C_Array[i] = 0;
				Old_Packet_Array[i] = 0;
				Old_Byte_Array[i] = 0;
				Old_Packet_Array2[i] = 0;
				Old_Byte_Array2[i] = 0;
				New_Chart_Data[i] = 0;
				New_Chart_Data2[i] = 0;
				Chart_Count = 0;
				Chart_Count2 = 0;
				First_Each_Byte[i] = true;
				Network_RealTime_Group_Array[i] = "";
				for (int b = 0;b<12;b++)
					data[i,b] = 0;
				for (int j = 0;j<260;j++)
				{	
					H_Online[i,j] = "";
				}
			}
			ScanOption = 1;
			StreamReader BugCF = new StreamReader(Config_Name.Text+".conf");
			string BugCFText = BugCF.ReadToEnd();
			BugCF.Close();
			ConfigInfo = BugCFText;
			CreateChart4();
			CreateChart5();
		}

		private void DisableALL()
		{
			StandingRange.Enabled=false;
			groupBox4.Enabled=false;
			groupBox22.Enabled=false;
			groupBox15.Enabled=false;
			groupBox20.Enabled=false;
			groupBox16.Enabled=false;
			groupBox2.Enabled=false;
			groupBox3.Enabled=false;
			Network_GroupL.Enabled=false;
			groupBox7.Enabled=false;
			testSnmp.Enabled=false;
		}
		private void EnableALL()
		{
			StandingRange.Enabled=true;
			groupBox4.Enabled=true;
			groupBox22.Enabled=true;
			groupBox15.Enabled=true;
			groupBox20.Enabled=true;
			groupBox16.Enabled=true;
			groupBox2.Enabled=true;
			groupBox3.Enabled=true;
			Network_GroupL.Enabled=true;
			groupBox7.Enabled=true;
			StartHostScan.Enabled=true;
			testSnmp.Enabled=true;
			HostDetailBox.Text = "";
		}

		private void timer3_Tick(object sender, System.EventArgs e)
		{
			if (ProbeMode)
			{
				int Timer3 = DateTime.Now.Minute/10;
				int Timer32 = Timer3*10;
				Timer3 = Timer3 - Timer32;
				if ((Timer3==8)||(Timer3==9)||(Timer3==0))
				{
					try
					{
						Process[] myProcesses;
						myProcesses = Process.GetProcessesByName("nMap");
						myProcesses[0].Kill();
					}
					catch
					{
					}
					groupBox7.Enabled=false;
					StartHostScan.Enabled=false;
					HostDetailBox.Text = "Due to the project interval scan, this feature is disable.\r\nWill be enable after project interval scan is complete";			
				}
				
			}
		}

		private void menuItem5_Click(object sender, System.EventArgs e)
		{
			try
			{
				Process[] myProcesses;
				myProcesses = Process.GetProcessesByName("nMap");
				myProcesses[0].Kill();
			}
			catch
			{
			}
			this.Dispose(true);
		}

		private bool IPCheck(string IPstr)
		{
			bool IPValid = true;
			string tmpIPstr = IPstr;
			int DotCount = 1;
			int DotIndex = 0;
			int DotIndex2 = 0;
			bool Loop = true;
			while (Loop)
			{	
				try
				{
					DotCount++;
					DotIndex2 = tmpIPstr.IndexOf(".",DotIndex);
					if (DotIndex2==-1)
					{
						DotIndex2 = tmpIPstr.Length;
						Loop = false;
					}
					//MessageBox.Show(tmpIPstr.Substring(DotIndex,DotIndex2-DotIndex));
					int IPPortion = Int32.Parse(tmpIPstr.Substring(DotIndex,DotIndex2-DotIndex));
					if ((IPPortion<1)||(IPPortion>255))
						IPValid = false;
					DotIndex = DotIndex2+1;
				}
				catch
				{
					IPValid = false;
					Loop = false;
				}
			}
			
			if (DotCount!=5)
			{
				IPValid = false;
			}
			return IPValid;
		}

	}
}