using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using Microsoft.MediaPlayer.Interop;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;

namespace TestClient2
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private AxMicrosoft.MediaPlayer.Interop.AxWindowsMediaPlayer axWindowsMediaPlayer1;
		private System.Windows.Forms.Button bnPlay;
		private System.Windows.Forms.Button bnStop;
		private System.Windows.Forms.Label label1;
		string mediaName, status, url;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.CheckBox checkBox1;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.TrackBar trackBar1;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.Button bnConnect;
		public System.Windows.Forms.TextBox txtIP;
		private System.Windows.Forms.Timer timer1;
		private System.ComponentModel.IContainer components;
		private int Min, Sec;
		private System.Windows.Forms.Label lbMin;
		private System.Windows.Forms.Label lbSec;
		private System.Windows.Forms.Label label14;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.LinkLabel linkLabel2;
		private System.Windows.Forms.Label label13;
		private System.Windows.Forms.Label label15;
		private System.Windows.Forms.Label lbVol;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.Label label16;
		private System.Windows.Forms.TextBox txtUname;
		private System.Windows.Forms.TextBox txtPassword;
		private System.Windows.Forms.Label label17;
		private System.Windows.Forms.LinkLabel linkLabel4;
		private System.Windows.Forms.LinkLabel liLogin;
		private System.Windows.Forms.TextBox txtStatus;
		private System.Windows.Forms.LinkLabel liLogout;
		public System.Windows.Forms.TextBox txtServerIP;
		private System.Windows.Forms.Label lbStatus;
		private System.Windows.Forms.Label label12;
		public Socket client;
		private byte[] data = new byte[1024];
		private int size = 1024;
		private string username, password, ip, filename, protocol, port;
		private System.Windows.Forms.Label label18;
		private bool check, clock, stream;
		public string addressServer, portStr;
		private System.Windows.Forms.Label label19;
		private System.Windows.Forms.Label label20;
		private System.Windows.Forms.ComboBox cboPro;
		private System.Windows.Forms.LinkLabel liPro;
		private System.Windows.Forms.LinkLabel liDiscon;
		private System.Windows.Forms.Label lbState;
		private System.Windows.Forms.LinkLabel linkLabel1;
		private System.Windows.Forms.ComboBox comboBox1;
		private System.Windows.Forms.Button button3;
		private int bitRate = 3;
		private int checkBit;

		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			axWindowsMediaPlayer1.settings.volume = 0;
			Min = 0;
			Sec = 0;
			username = "";
			password = "";
			ip = "127.0.0.1";
			addressServer = ip;
			check = false;
			protocol = "http://";
			port = "8080";
			txtIP.Text = protocol + ip + " : " + port;
			timer1.Start();
			clock = false;
			stream = true;
			checkBit = 0;
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
			base.Dispose( disposing );
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
			this.axWindowsMediaPlayer1 = new AxMicrosoft.MediaPlayer.Interop.AxWindowsMediaPlayer();
			this.bnPlay = new System.Windows.Forms.Button();
			this.bnStop = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.checkBox1 = new System.Windows.Forms.CheckBox();
			this.label5 = new System.Windows.Forms.Label();
			this.trackBar1 = new System.Windows.Forms.TrackBar();
			this.lbMin = new System.Windows.Forms.Label();
			this.label7 = new System.Windows.Forms.Label();
			this.button1 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.label9 = new System.Windows.Forms.Label();
			this.txtIP = new System.Windows.Forms.TextBox();
			this.bnConnect = new System.Windows.Forms.Button();
			this.timer1 = new System.Windows.Forms.Timer(this.components);
			this.lbSec = new System.Windows.Forms.Label();
			this.label12 = new System.Windows.Forms.Label();
			this.label14 = new System.Windows.Forms.Label();
			this.liLogin = new System.Windows.Forms.LinkLabel();
			this.txtStatus = new System.Windows.Forms.TextBox();
			this.label6 = new System.Windows.Forms.Label();
			this.label8 = new System.Windows.Forms.Label();
			this.linkLabel2 = new System.Windows.Forms.LinkLabel();
			this.label13 = new System.Windows.Forms.Label();
			this.label15 = new System.Windows.Forms.Label();
			this.lbVol = new System.Windows.Forms.Label();
			this.label10 = new System.Windows.Forms.Label();
			this.label16 = new System.Windows.Forms.Label();
			this.txtUname = new System.Windows.Forms.TextBox();
			this.txtPassword = new System.Windows.Forms.TextBox();
			this.liLogout = new System.Windows.Forms.LinkLabel();
			this.label17 = new System.Windows.Forms.Label();
			this.txtServerIP = new System.Windows.Forms.TextBox();
			this.linkLabel4 = new System.Windows.Forms.LinkLabel();
			this.lbStatus = new System.Windows.Forms.Label();
			this.label18 = new System.Windows.Forms.Label();
			this.liDiscon = new System.Windows.Forms.LinkLabel();
			this.liPro = new System.Windows.Forms.LinkLabel();
			this.label19 = new System.Windows.Forms.Label();
			this.cboPro = new System.Windows.Forms.ComboBox();
			this.label20 = new System.Windows.Forms.Label();
			this.lbState = new System.Windows.Forms.Label();
			this.linkLabel1 = new System.Windows.Forms.LinkLabel();
			this.comboBox1 = new System.Windows.Forms.ComboBox();
			this.button3 = new System.Windows.Forms.Button();
			((System.ComponentModel.ISupportInitialize)(this.axWindowsMediaPlayer1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.trackBar1)).BeginInit();
			this.SuspendLayout();
			// 
			// axWindowsMediaPlayer1
			// 
			this.axWindowsMediaPlayer1.Enabled = true;
			this.axWindowsMediaPlayer1.Location = new System.Drawing.Point(24, 280);
			this.axWindowsMediaPlayer1.Name = "axWindowsMediaPlayer1";
			this.axWindowsMediaPlayer1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axWindowsMediaPlayer1.OcxState")));
			this.axWindowsMediaPlayer1.Size = new System.Drawing.Size(376, 280);
			this.axWindowsMediaPlayer1.TabIndex = 0;
			this.axWindowsMediaPlayer1.PlayStateChange += new AxMicrosoft.MediaPlayer.Interop._WMPOCXEvents_PlayStateChangeEventHandler(this.axWindowsMediaPlayer1_PlayStateChange);
			// 
			// bnPlay
			// 
			this.bnPlay.Enabled = false;
			this.bnPlay.Location = new System.Drawing.Point(24, 624);
			this.bnPlay.Name = "bnPlay";
			this.bnPlay.Size = new System.Drawing.Size(56, 22);
			this.bnPlay.TabIndex = 1;
			this.bnPlay.Text = "Play";
			this.bnPlay.Click += new System.EventHandler(this.bnPlay_Click);
			// 
			// bnStop
			// 
			this.bnStop.Enabled = false;
			this.bnStop.Location = new System.Drawing.Point(96, 624);
			this.bnStop.Name = "bnStop";
			this.bnStop.Size = new System.Drawing.Size(56, 22);
			this.bnStop.TabIndex = 2;
			this.bnStop.Text = "Stop";
			this.bnStop.Click += new System.EventHandler(this.bnStop_Click);
			// 
			// label1
			// 
			this.label1.BackColor = System.Drawing.SystemColors.Control;
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.Location = new System.Drawing.Point(80, 568);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(144, 16);
			this.label1.TabIndex = 3;
			this.label1.Text = " -";
			// 
			// label2
			// 
			this.label2.BackColor = System.Drawing.SystemColors.Control;
			this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label2.Location = new System.Drawing.Point(80, 592);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(200, 16);
			this.label2.TabIndex = 4;
			this.label2.Text = "No source connect";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(24, 568);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(48, 16);
			this.label3.TabIndex = 5;
			this.label3.Text = "Source :";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(24, 592);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(48, 16);
			this.label4.TabIndex = 6;
			this.label4.Text = "Status :";
			// 
			// checkBox1
			// 
			this.checkBox1.Location = new System.Drawing.Point(192, 632);
			this.checkBox1.Name = "checkBox1";
			this.checkBox1.Size = new System.Drawing.Size(16, 16);
			this.checkBox1.TabIndex = 7;
			this.checkBox1.Text = "checkBox1";
			this.checkBox1.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(208, 632);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(32, 16);
			this.label5.TabIndex = 8;
			this.label5.Text = "mute";
			// 
			// trackBar1
			// 
			this.trackBar1.Location = new System.Drawing.Point(240, 624);
			this.trackBar1.Maximum = 100;
			this.trackBar1.Name = "trackBar1";
			this.trackBar1.Size = new System.Drawing.Size(168, 42);
			this.trackBar1.TabIndex = 9;
			this.trackBar1.TickStyle = System.Windows.Forms.TickStyle.None;
			this.trackBar1.Scroll += new System.EventHandler(this.trackBar1_Scroll);
			// 
			// lbMin
			// 
			this.lbMin.BackColor = System.Drawing.SystemColors.Control;
			this.lbMin.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lbMin.Location = new System.Drawing.Point(352, 568);
			this.lbMin.Name = "lbMin";
			this.lbMin.RightToLeft = System.Windows.Forms.RightToLeft.No;
			this.lbMin.Size = new System.Drawing.Size(24, 16);
			this.lbMin.TabIndex = 10;
			this.lbMin.Text = "00";
			this.lbMin.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			// 
			// label7
			// 
			this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label7.Location = new System.Drawing.Point(416, 320);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(112, 16);
			this.label7.TabIndex = 11;
			this.label7.Text = "Control Camera";
			// 
			// button1
			// 
			this.button1.Enabled = false;
			this.button1.Location = new System.Drawing.Point(432, 360);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(64, 24);
			this.button1.TabIndex = 12;
			this.button1.Text = "Left";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// button2
			// 
			this.button2.Enabled = false;
			this.button2.Location = new System.Drawing.Point(512, 360);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(64, 24);
			this.button2.TabIndex = 13;
			this.button2.Text = "Right";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// label9
			// 
			this.label9.Location = new System.Drawing.Point(80, 200);
			this.label9.Name = "label9";
			this.label9.Size = new System.Drawing.Size(32, 16);
			this.label9.TabIndex = 17;
			this.label9.Text = "URL";
			// 
			// txtIP
			// 
			this.txtIP.Location = new System.Drawing.Point(128, 192);
			this.txtIP.Name = "txtIP";
			this.txtIP.ReadOnly = true;
			this.txtIP.Size = new System.Drawing.Size(232, 20);
			this.txtIP.TabIndex = 18;
			this.txtIP.Text = "";
			// 
			// bnConnect
			// 
			this.bnConnect.Location = new System.Drawing.Point(368, 192);
			this.bnConnect.Name = "bnConnect";
			this.bnConnect.Size = new System.Drawing.Size(64, 21);
			this.bnConnect.TabIndex = 22;
			this.bnConnect.Text = "Connect";
			this.bnConnect.Click += new System.EventHandler(this.bnConnect_Click);
			// 
			// timer1
			// 
			this.timer1.Interval = 1000;
			this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
			// 
			// lbSec
			// 
			this.lbSec.BackColor = System.Drawing.SystemColors.Control;
			this.lbSec.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lbSec.Location = new System.Drawing.Point(384, 568);
			this.lbSec.Name = "lbSec";
			this.lbSec.RightToLeft = System.Windows.Forms.RightToLeft.No;
			this.lbSec.Size = new System.Drawing.Size(24, 16);
			this.lbSec.TabIndex = 25;
			this.lbSec.Text = "00";
			this.lbSec.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label12
			// 
			this.label12.BackColor = System.Drawing.SystemColors.Control;
			this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label12.Location = new System.Drawing.Point(376, 568);
			this.label12.Name = "label12";
			this.label12.RightToLeft = System.Windows.Forms.RightToLeft.No;
			this.label12.Size = new System.Drawing.Size(8, 16);
			this.label12.TabIndex = 26;
			this.label12.Text = ".";
			this.label12.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			// 
			// label14
			// 
			this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label14.Location = new System.Drawing.Point(48, 48);
			this.label14.Name = "label14";
			this.label14.Size = new System.Drawing.Size(80, 14);
			this.label14.TabIndex = 30;
			this.label14.Text = "Log in status";
			// 
			// liLogin
			// 
			this.liLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.liLogin.LinkColor = System.Drawing.Color.Black;
			this.liLogin.Location = new System.Drawing.Point(392, 96);
			this.liLogin.Name = "liLogin";
			this.liLogin.Size = new System.Drawing.Size(40, 16);
			this.liLogin.TabIndex = 32;
			this.liLogin.TabStop = true;
			this.liLogin.Text = "Log in";
			this.liLogin.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel1_LinkClicked);
			// 
			// txtStatus
			// 
			this.txtStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.txtStatus.Location = new System.Drawing.Point(128, 40);
			this.txtStatus.Name = "txtStatus";
			this.txtStatus.ReadOnly = true;
			this.txtStatus.Size = new System.Drawing.Size(184, 20);
			this.txtStatus.TabIndex = 33;
			this.txtStatus.Text = "No User Log in";
			// 
			// label6
			// 
			this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label6.Location = new System.Drawing.Point(24, 112);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(120, 14);
			this.label6.TabIndex = 34;
			this.label6.Text = "Select Video Source ";
			// 
			// label8
			// 
			this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label8.Location = new System.Drawing.Point(48, 136);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(104, 16);
			this.label8.TabIndex = 35;
			this.label8.Text = "Streaming Video";
			// 
			// linkLabel2
			// 
			this.linkLabel2.BackColor = System.Drawing.Color.Transparent;
			this.linkLabel2.DisabledLinkColor = System.Drawing.Color.Black;
			this.linkLabel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.linkLabel2.ForeColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(64)), ((System.Byte)(0)));
			this.linkLabel2.LinkColor = System.Drawing.Color.Black;
			this.linkLabel2.Location = new System.Drawing.Point(48, 232);
			this.linkLabel2.Name = "linkLabel2";
			this.linkLabel2.Size = new System.Drawing.Size(168, 16);
			this.linkLabel2.TabIndex = 37;
			this.linkLabel2.TabStop = true;
			this.linkLabel2.Text = "Recorded Video Click here! >>";
			this.linkLabel2.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel2_LinkClicked);
			// 
			// label13
			// 
			this.label13.Location = new System.Drawing.Point(312, 592);
			this.label13.Name = "label13";
			this.label13.Size = new System.Drawing.Size(48, 16);
			this.label13.TabIndex = 38;
			this.label13.Text = "Volumn";
			// 
			// label15
			// 
			this.label15.BackColor = System.Drawing.SystemColors.Control;
			this.label15.Location = new System.Drawing.Point(384, 592);
			this.label15.Name = "label15";
			this.label15.Size = new System.Drawing.Size(16, 16);
			this.label15.TabIndex = 39;
			this.label15.Text = "%";
			// 
			// lbVol
			// 
			this.lbVol.BackColor = System.Drawing.SystemColors.Control;
			this.lbVol.Location = new System.Drawing.Point(360, 592);
			this.lbVol.Name = "lbVol";
			this.lbVol.Size = new System.Drawing.Size(24, 16);
			this.lbVol.TabIndex = 40;
			this.lbVol.Text = "0";
			this.lbVol.TextAlign = System.Drawing.ContentAlignment.TopRight;
			// 
			// label10
			// 
			this.label10.Location = new System.Drawing.Point(328, 48);
			this.label10.Name = "label10";
			this.label10.Size = new System.Drawing.Size(56, 16);
			this.label10.TabIndex = 42;
			this.label10.Text = "Username";
			// 
			// label16
			// 
			this.label16.Location = new System.Drawing.Point(328, 72);
			this.label16.Name = "label16";
			this.label16.Size = new System.Drawing.Size(56, 16);
			this.label16.TabIndex = 43;
			this.label16.Text = "Password";
			// 
			// txtUname
			// 
			this.txtUname.Location = new System.Drawing.Point(392, 40);
			this.txtUname.Name = "txtUname";
			this.txtUname.Size = new System.Drawing.Size(160, 20);
			this.txtUname.TabIndex = 44;
			this.txtUname.Text = "peak";
			// 
			// txtPassword
			// 
			this.txtPassword.Location = new System.Drawing.Point(392, 64);
			this.txtPassword.Name = "txtPassword";
			this.txtPassword.PasswordChar = '*';
			this.txtPassword.Size = new System.Drawing.Size(160, 20);
			this.txtPassword.TabIndex = 45;
			this.txtPassword.Text = "12345";
			// 
			// liLogout
			// 
			this.liLogout.Enabled = false;
			this.liLogout.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.liLogout.LinkColor = System.Drawing.Color.Black;
			this.liLogout.Location = new System.Drawing.Point(448, 96);
			this.liLogout.Name = "liLogout";
			this.liLogout.Size = new System.Drawing.Size(48, 16);
			this.liLogout.TabIndex = 46;
			this.liLogout.TabStop = true;
			this.liLogout.Text = "Log out";
			this.liLogout.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.liLogout_LinkClicked);
			// 
			// label17
			// 
			this.label17.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label17.Location = new System.Drawing.Point(48, 72);
			this.label17.Name = "label17";
			this.label17.Size = new System.Drawing.Size(64, 14);
			this.label17.TabIndex = 42;
			this.label17.Text = "Server IP";
			// 
			// txtServerIP
			// 
			this.txtServerIP.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.txtServerIP.Location = new System.Drawing.Point(128, 64);
			this.txtServerIP.Name = "txtServerIP";
			this.txtServerIP.ReadOnly = true;
			this.txtServerIP.Size = new System.Drawing.Size(128, 20);
			this.txtServerIP.TabIndex = 43;
			this.txtServerIP.Text = "127.0.0.1";
			this.txtServerIP.TextChanged += new System.EventHandler(this.txtServerIP_TextChanged);
			// 
			// linkLabel4
			// 
			this.linkLabel4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.linkLabel4.LinkColor = System.Drawing.Color.Black;
			this.linkLabel4.Location = new System.Drawing.Point(264, 72);
			this.linkLabel4.Name = "linkLabel4";
			this.linkLabel4.Size = new System.Drawing.Size(48, 16);
			this.linkLabel4.TabIndex = 47;
			this.linkLabel4.TabStop = true;
			this.linkLabel4.Text = "Change";
			this.linkLabel4.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel4_LinkClicked);
			// 
			// lbStatus
			// 
			this.lbStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lbStatus.ForeColor = System.Drawing.Color.Red;
			this.lbStatus.Location = new System.Drawing.Point(328, 24);
			this.lbStatus.Name = "lbStatus";
			this.lbStatus.Size = new System.Drawing.Size(224, 14);
			this.lbStatus.TabIndex = 48;
			// 
			// label18
			// 
			this.label18.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label18.Location = new System.Drawing.Point(24, 16);
			this.label18.Name = "label18";
			this.label18.Size = new System.Drawing.Size(120, 14);
			this.label18.TabIndex = 49;
			this.label18.Text = "Connection status";
			// 
			// liDiscon
			// 
			this.liDiscon.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.liDiscon.LinkColor = System.Drawing.Color.FromArgb(((System.Byte)(64)), ((System.Byte)(64)), ((System.Byte)(64)));
			this.liDiscon.Location = new System.Drawing.Point(221, 232);
			this.liDiscon.Name = "liDiscon";
			this.liDiscon.Size = new System.Drawing.Size(64, 16);
			this.liDiscon.TabIndex = 50;
			this.liDiscon.TabStop = true;
			this.liDiscon.Text = "Disconnect";
			this.liDiscon.Visible = false;
			this.liDiscon.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.liDiscon_LinkClicked);
			// 
			// liPro
			// 
			this.liPro.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.liPro.LinkColor = System.Drawing.Color.FromArgb(((System.Byte)(64)), ((System.Byte)(64)), ((System.Byte)(64)));
			this.liPro.Location = new System.Drawing.Point(200, 168);
			this.liPro.Name = "liPro";
			this.liPro.Size = new System.Drawing.Size(48, 16);
			this.liPro.TabIndex = 51;
			this.liPro.TabStop = true;
			this.liPro.Text = "Change";
			this.liPro.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.liPro_LinkClicked);
			// 
			// label19
			// 
			this.label19.Location = new System.Drawing.Point(80, 168);
			this.label19.Name = "label19";
			this.label19.Size = new System.Drawing.Size(48, 16);
			this.label19.TabIndex = 52;
			this.label19.Text = "Protocol";
			// 
			// cboPro
			// 
			this.cboPro.BackColor = System.Drawing.SystemColors.Desktop;
			this.cboPro.Enabled = false;
			this.cboPro.Items.AddRange(new object[] {
														"http://",
														"rtsp://",
														"mms://"});
			this.cboPro.Location = new System.Drawing.Point(128, 160);
			this.cboPro.Name = "cboPro";
			this.cboPro.Size = new System.Drawing.Size(64, 21);
			this.cboPro.TabIndex = 53;
			this.cboPro.Text = "http://";
			this.cboPro.SelectedIndexChanged += new System.EventHandler(this.cboPro_SelectedIndexChanged);
			// 
			// label20
			// 
			this.label20.Location = new System.Drawing.Point(260, 168);
			this.label20.Name = "label20";
			this.label20.Size = new System.Drawing.Size(32, 16);
			this.label20.TabIndex = 54;
			this.label20.Text = "Port";
			// 
			// lbState
			// 
			this.lbState.Location = new System.Drawing.Point(24, 264);
			this.lbState.Name = "lbState";
			this.lbState.Size = new System.Drawing.Size(376, 16);
			this.lbState.TabIndex = 59;
			// 
			// linkLabel1
			// 
			this.linkLabel1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.linkLabel1.LinkColor = System.Drawing.Color.FromArgb(((System.Byte)(64)), ((System.Byte)(64)), ((System.Byte)(64)));
			this.linkLabel1.Location = new System.Drawing.Point(368, 168);
			this.linkLabel1.Name = "linkLabel1";
			this.linkLabel1.Size = new System.Drawing.Size(56, 16);
			this.linkLabel1.TabIndex = 60;
			this.linkLabel1.TabStop = true;
			this.linkLabel1.Text = "Find port";
			this.linkLabel1.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel1_LinkClicked_1);
			// 
			// comboBox1
			// 
			this.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.comboBox1.Location = new System.Drawing.Point(288, 160);
			this.comboBox1.Name = "comboBox1";
			this.comboBox1.Size = new System.Drawing.Size(72, 21);
			this.comboBox1.TabIndex = 61;
			this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
			// 
			// button3
			// 
			this.button3.Enabled = false;
			this.button3.Location = new System.Drawing.Point(464, 400);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(80, 24);
			this.button3.TabIndex = 62;
			this.button3.Text = "Auto Pan";
			this.button3.Click += new System.EventHandler(this.button3_Click);
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(592, 683);
			this.Controls.Add(this.button3);
			this.Controls.Add(this.comboBox1);
			this.Controls.Add(this.linkLabel1);
			this.Controls.Add(this.lbState);
			this.Controls.Add(this.label20);
			this.Controls.Add(this.cboPro);
			this.Controls.Add(this.label19);
			this.Controls.Add(this.liPro);
			this.Controls.Add(this.liDiscon);
			this.Controls.Add(this.label18);
			this.Controls.Add(this.lbStatus);
			this.Controls.Add(this.txtServerIP);
			this.Controls.Add(this.label17);
			this.Controls.Add(this.lbVol);
			this.Controls.Add(this.label15);
			this.Controls.Add(this.label13);
			this.Controls.Add(this.linkLabel2);
			this.Controls.Add(this.label8);
			this.Controls.Add(this.label6);
			this.Controls.Add(this.txtStatus);
			this.Controls.Add(this.label14);
			this.Controls.Add(this.label12);
			this.Controls.Add(this.lbSec);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.label7);
			this.Controls.Add(this.lbMin);
			this.Controls.Add(this.trackBar1);
			this.Controls.Add(this.label5);
			this.Controls.Add(this.checkBox1);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.bnStop);
			this.Controls.Add(this.bnPlay);
			this.Controls.Add(this.axWindowsMediaPlayer1);
			this.Controls.Add(this.txtIP);
			this.Controls.Add(this.bnConnect);
			this.Controls.Add(this.label9);
			this.Controls.Add(this.linkLabel4);
			this.Controls.Add(this.liLogout);
			this.Controls.Add(this.txtUname);
			this.Controls.Add(this.liLogin);
			this.Controls.Add(this.txtPassword);
			this.Controls.Add(this.label10);
			this.Controls.Add(this.label16);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
			this.Name = "Form1";
			this.Text = "Client";
			this.Load += new System.EventHandler(this.Form1_Load);
			((System.ComponentModel.ISupportInitialize)(this.axWindowsMediaPlayer1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.trackBar1)).EndInit();
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

		public void findURL()
		{
			//port = txtPortSet.Text;
			url = protocol + ip + ":" + port;
		}

		public void findURL1()
		{
			url = "http://" + ip + ":" + port;
		}

		private void bnPlay_Click(object sender, System.EventArgs e)
		{
			if(stream)
			{
				findURL();
				axWindowsMediaPlayer1.URL = url;
				mediaName = axWindowsMediaPlayer1.currentMedia.name;
				label1.Text = mediaName;
				label2.Text = status;
				axWindowsMediaPlayer1.Ctlcontrols.play();
				clock = true;
				lbState.Text = "Concect to live content at : " + ip + " : " + port;
			}
			else
			{
				findURL1();
				axWindowsMediaPlayer1.URL = url;
				mediaName = axWindowsMediaPlayer1.currentMedia.name;
				label1.Text = mediaName;
				label2.Text = status;
				axWindowsMediaPlayer1.Ctlcontrols.play();
				clock = true;
				lbState.Text = "Connect to recorded content at : " + ip + " : " + port;
			}
		}

		private void bnStop_Click(object sender, System.EventArgs e)
		{
			if(stream)
			{
				axWindowsMediaPlayer1.Ctlcontrols.stop();
				label1.Text = " - ";
				clock = false;
				Min = 0;
				Sec = 0;
				lbMin.Text = "00";
				lbSec.Text = "00";
				lbState.Text = "";
			}
			else
			{
				axWindowsMediaPlayer1.Ctlcontrols.stop();
				clock = false;
				lbState.Text = "";
			}
		}

		private void axWindowsMediaPlayer1_PlayStateChange(object sender, AxMicrosoft.MediaPlayer.Interop._WMPOCXEvents_PlayStateChangeEvent e)
		{
			status = axWindowsMediaPlayer1.status.ToString();
			label2.Text = status;
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{
			
		}

		private void bnConnect_Click(object sender, System.EventArgs e)
		{
			if(check)
			{
				findURL();
				axWindowsMediaPlayer1.URL = url;
				mediaName = axWindowsMediaPlayer1.currentMedia.name;
				label1.Text = mediaName;
				label2.Text = status;
				Min = 0;
				Sec = 0;
				lbMin.Text = "00";
				lbSec.Text = "00";
				clock = true;
				axWindowsMediaPlayer1.settings.autoStart = true;		
				bnPlay.Enabled = true;
				bnStop.Enabled = true;
				if(checkBit == 1)
				{
					button1.Enabled = true;
					button2.Enabled = true;
					button3.Enabled = true;
				}
				client.Close(); //equibvalent to terminate connection
				stream = true;
				lbState.Text = "Connect to live content at : " + ip + " : " + port;
			}
			else
			{
				MessageBox.Show("You aren't login, please login before play", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning); 
			}
		}

		private void trackBar1_Scroll(object sender, System.EventArgs e)
		{
			axWindowsMediaPlayer1.settings.volume = this.trackBar1.Value;
			int vol = this.trackBar1.Value;
			lbVol.Text = vol.ToString();
		}

		private void checkBox1_CheckedChanged(object sender, System.EventArgs e)
		{
			if (checkBox1.Checked == true)
				axWindowsMediaPlayer1.settings.mute = true;
			else 
				axWindowsMediaPlayer1.settings.mute = false;
		}

		private void timer1_Tick(object sender, System.EventArgs e)
		{
			if(clock == true)
			{
				showTime();
				Sec++;
				if (Sec == 60)
				{
					Sec = 0;
					Min++;
				}
			}
		}

		private void showTime()
		{
			if(Min < 10)
			{
				lbMin.Text = "0" + Min.ToString();
			}
			else
			{
				lbMin.Text = Min.ToString();
			}
			if(Sec < 10)
			{
				lbSec.Text = "0" + Sec.ToString();
			}
			else
			{
				lbSec.Text = Sec.ToString();
			}
		}

		//log in
		private void linkLabel1_LinkClicked(object sender, System.Windows.Forms.LinkLabelLinkClickedEventArgs e)
		{
			lbStatus.Text = "Connecting...";
			Socket newsock = new Socket(AddressFamily.InterNetwork,
				SocketType.Stream, ProtocolType.Tcp);
			ip = txtServerIP.Text.ToString();
			IPEndPoint iep = new IPEndPoint(IPAddress.Parse(ip), 12345);
			newsock.BeginConnect(iep, new AsyncCallback(Connected), newsock);
		}

		void Connected(IAsyncResult iar)
		{
			client = (Socket)iar.AsyncState;
			try
			{
				client.EndConnect(iar);
				lbStatus.Text = "Verifying password";
				username = txtUname.Text;
				password = txtPassword.Text;
				string strMessage = "@" + username + "#" + password;
				byte[] message = Encoding.ASCII.GetBytes(strMessage);
				client.BeginSend(message, 0, message.Length, SocketFlags.None,
					new AsyncCallback(SendData), client);
			}
			catch (SocketException)
			{
				lbStatus.Text = "Error connecting, No server Found";
				txtPassword.Text = "";
			}
		}//end connected
		
		//send username password waiting for result
		void SendData(IAsyncResult iar)//send username password and recieved result
		{
			Socket remote = (Socket)iar.AsyncState;
			int sent = remote.EndSend(iar);
			remote.BeginReceive(data, 0, size, SocketFlags.None,
				new AsyncCallback(ReceiveData), remote);
		}//end send

		//process result log in status
		void ReceiveData(IAsyncResult iar)//recieved result login
		{
			Socket remote = (Socket)iar.AsyncState;
			int recv = remote.EndReceive(iar);
			string stringData = Encoding.ASCII.GetString(data, 0, recv);
			string sub = stringData.Substring(0, 1);
			if (sub == "0")
			{
				lbStatus.Text = "Login fail!! please check your password ";
				client.Close();
				txtPassword.Text = "";
			}
			if (sub == "1")
			{
				lbStatus.Text = "";
				string strCheckBit = stringData.Substring(1, 1);
				checkBit = Convert.ToInt32(strCheckBit);
				string displayName = stringData.Substring(2, stringData.Length - 2);
				txtStatus.Text = "Login name " + displayName;
				check = true;
				liLogin.Enabled = false;
				liLogout.Enabled = true;
				bnConnect.Enabled = true;
				linkLabel4.Enabled = false;
				client.Close();
				txtPassword.Text = "";
			}
			for (int i = 0; i<1024; i++)
				data[i] = 0;
		}

		//open video file form
		private void linkLabel2_LinkClicked(object sender, System.Windows.Forms.LinkLabelLinkClickedEventArgs e)
		{
			Form3 openRecord = new Form3();
			if(check)
			{
				if( openRecord.ShowDialog() == DialogResult.OK )
				{
					bitRate = openRecord.bitRateIndex;
					filename = openRecord.listBox1.SelectedItem.ToString();
					label7.Text = filename;
					filename = label7.Text;
					label7.Text = "Control Camera";
					Socket newsock = new Socket(AddressFamily.InterNetwork,
						SocketType.Stream, ProtocolType.Tcp);
					IPEndPoint iep = new IPEndPoint(IPAddress.Parse(addressServer), 12345);
					newsock.BeginConnect(iep, new AsyncCallback(Connected1), newsock);
				}
			}
			else
			{
				MessageBox.Show("You aren't login, please login before play", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning); 
			}
		}

		//connect to send file name
		void Connected1(IAsyncResult iar)
		{
			client = (Socket)iar.AsyncState;
			try
			{
				client.EndConnect(iar);
				label2.Text = "Creating Connection ...";
				string strMessage = "$" + bitRate.ToString() + filename;
				byte[] message = Encoding.ASCII.GetBytes(strMessage);
				client.BeginSend(message, 0, message.Length, SocketFlags.None,
					new AsyncCallback(SendData1), client);
			}
			catch (SocketException)
			{
				//Todo Exception
				MessageBox.Show("Connection Fail!!, Retry again later", "Error!!!", MessageBoxButtons.OK, MessageBoxIcon.Warning); 
			}
		}

		//send filename
		void SendData1(IAsyncResult iar)
		{
			Socket remote = (Socket)iar.AsyncState;
			int sent = remote.EndSend(iar);
			remote.BeginReceive(data, 0, size, SocketFlags.None,
				new AsyncCallback(ReceiveData2), remote);
		}//end send

		void ReceiveData2(IAsyncResult iar)//recieved result login
		{
			Socket remote = (Socket)iar.AsyncState;
			int recv = remote.EndReceive(iar);
			string stringData = Encoding.ASCII.GetString(data, 0, recv);
			//play file
			port = stringData;
			client.Close();
			playFile();
			for (int i = 0; i<1024; i++)
				data[i] = 0;
		}
		//change ip server
		private void linkLabel4_LinkClicked(object sender, System.Windows.Forms.LinkLabelLinkClickedEventArgs e)
		{
			if (linkLabel4.Text == "Change")
			{
				txtServerIP.ReadOnly = false;
				linkLabel4.Text = "OK";
			}
			else
			{
				txtServerIP.ReadOnly = true;
				linkLabel4.Text = "Change";
				addressServer = txtServerIP.Text.ToString();
				ip = addressServer;
				txtIP.Text = protocol + ip + " : " + port;
			}
		}

		//log out
		private void liLogout_LinkClicked(object sender, System.Windows.Forms.LinkLabelLinkClickedEventArgs e)
		{
			client.Close();
			txtStatus.Text = "No User Log in";
			check = false;
			txtUname.Text = "";
			txtPassword.Text = "";
			liLogin.Enabled = true;
			liLogout.Enabled = false;
			bnConnect.Enabled = false;
			linkLabel4.Enabled = true;
			button1.Enabled = false;
			button2.Enabled = false;
			button3.Enabled = false;
			bnPlay.Enabled = false;
			bnStop.Enabled = false;
			axWindowsMediaPlayer1.Ctlcontrols.stop();
			label1.Text = " - ";
			clock = false;
			Min = 0;
			Sec = 0;
			lbMin.Text = "00";
			lbSec.Text = "00";
			label2.Text = "Ready";
			liDiscon.Visible = false;
			linkLabel2.Enabled = true;
			stream = false;
			lbState.Text = "";
		}

		private void txtServerIP_TextChanged(object sender, System.EventArgs e)
		{
			txtIP.Text = protocol + txtServerIP.Text + ":" + port;
		}

		private void playFile()
		{
			findURL1();//http only
			stream = false;
			int j = 0;
			//delay
			for(int i = 0; i < 30000; i++)
			{
					j = i;
				for(int k = 0; k < 30000; k++)
				{
					j = k + i;
				}
			}
			
			axWindowsMediaPlayer1.URL = url;
			mediaName = axWindowsMediaPlayer1.currentMedia.name;
			label1.Text = mediaName;
			label2.Text = status;
			axWindowsMediaPlayer1.Ctlcontrols.play();
			button1.Enabled = false;
			button2.Enabled = false;
			bnPlay.Enabled = true;
			bnStop.Enabled = true;
			bnConnect.Enabled = false;
			liDiscon.Visible = true;
			linkLabel2.Enabled = false;
			Min = 0;
			Sec = 0;
			lbMin.Text = "00";
			lbSec.Text = "00";
			clock = true;
			lbState.Text = "Connect to recorded content at : " + ip + " : " + port;
		}

		private void liPro_LinkClicked(object sender, System.Windows.Forms.LinkLabelLinkClickedEventArgs e)
		{
			if (liPro.Text == "Change")
			{
				cboPro.Enabled = true;
				liPro.Text = "OK";
			}
			else
			{
				cboPro.Enabled = false;
				liPro.Text = "Change";
				protocol =cboPro.Text;
				txtIP.Text = protocol + ip + " : " + port;
			}
		}

		private void liDiscon_LinkClicked(object sender, System.Windows.Forms.LinkLabelLinkClickedEventArgs e)
		{
			axWindowsMediaPlayer1.Ctlcontrols.stop();
			label1.Text = " - ";
			clock = false;
			Min = 0;
			Sec = 0;
			lbMin.Text = "00";
			lbSec.Text = "00";
			label2.Text = "Ready";
			linkLabel2.Enabled = true;
			liDiscon.Visible = false;
			bnConnect.Enabled = true;
			stream = false;
			lbState.Text = "";
		}

		private void cboPro_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			if(cboPro.SelectedIndex == 0)
			{
				protocol = "http://";
			}
			if(cboPro.SelectedIndex == 1)
			{
				protocol = "rtsp://";
			}
			if(cboPro.SelectedIndex == 2)
			{
				protocol = "mms://";
			}
			txtIP.Text = protocol + ip + " : " + port;
		}

		private void linkLabel1_LinkClicked_1(object sender, System.Windows.Forms.LinkLabelLinkClickedEventArgs e)
		{
			if(check)
			{
				Socket newsock = new Socket(AddressFamily.InterNetwork,
					SocketType.Stream, ProtocolType.Tcp);
				IPEndPoint iep = new IPEndPoint(IPAddress.Parse(addressServer), 12345);
				newsock.BeginConnect(iep, new AsyncCallback(Connected2), newsock);
			}
			else
			{
				MessageBox.Show("You aren't login, please login before play", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning); 
			}
		}

		//connect to send file name
		void Connected2(IAsyncResult iar)
		{
			client = (Socket)iar.AsyncState;
			try
			{
				client.EndConnect(iar);
				string strMessage = "*";
				byte[] message = Encoding.ASCII.GetBytes(strMessage);
				client.BeginSend(message, 0, message.Length, SocketFlags.None,
					new AsyncCallback(SendData2), client);
			}
			catch (SocketException)
			{
				//Todo Exception
				MessageBox.Show("Connection Fail!!, Retry again later", "Error!!!", MessageBoxButtons.OK, MessageBoxIcon.Warning); 
			}
		}

		void SendData2(IAsyncResult iar)
		{
			Socket remote = (Socket)iar.AsyncState;
			int sent = remote.EndSend(iar);
			remote.BeginReceive(data, 0, size, SocketFlags.None,
				new AsyncCallback(ReceiveData3), remote);
		}//end send

		void ReceiveData3(IAsyncResult iar)//recieved result login
		{
			Socket remote = (Socket)iar.AsyncState;
			int recv = remote.EndReceive(iar);
			string stringData = Encoding.ASCII.GetString(data, 0, recv);
			int i = 0;
			int x = 0;
			string port;
			comboBox1.Items.Clear();
			while (i < stringData.Length)
			{
				if(stringData[i] == '/')
				{
					port = stringData.Substring(x, i-x);
					x = i + 1;
					comboBox1.Items.Add(port);
				}
				i++;
			}
			client.Close();
			for (int j = 0; j<1024; j++)
				data[j] = 0;
		}

		private void comboBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			port = comboBox1.SelectedItem.ToString();
			txtIP.Text = protocol + ip + " : " + port;
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			Socket newsock = new Socket(AddressFamily.InterNetwork,
				SocketType.Stream, ProtocolType.Tcp);
			IPEndPoint iep = new IPEndPoint(IPAddress.Parse(addressServer), 12345);
			newsock.BeginConnect(iep, new AsyncCallback(Connected3), newsock);
		}

		void Connected3(IAsyncResult iar)
		{
			client = (Socket)iar.AsyncState;
			try
			{
				client.EndConnect(iar);
				string strMessage = "<";
				byte[] message = Encoding.ASCII.GetBytes(strMessage);
				client.BeginSend(message, 0, message.Length, SocketFlags.None,
					new AsyncCallback(SendData3), client);
			}
			catch (SocketException)
			{
				//Todo Exception
				MessageBox.Show("Connection Fail!!, Retry again later", "Error!!!", MessageBoxButtons.OK, MessageBoxIcon.Warning); 
			}
		}

		void Connected4(IAsyncResult iar)
		{
			client = (Socket)iar.AsyncState;
			try
			{
				client.EndConnect(iar);
				string strMessage = ">";
				byte[] message = Encoding.ASCII.GetBytes(strMessage);
				client.BeginSend(message, 0, message.Length, SocketFlags.None,
					new AsyncCallback(SendData3), client);
			}
			catch (SocketException)
			{
				//Todo Exception
				MessageBox.Show("Connection Fail!!, Retry again later", "Error!!!", MessageBoxButtons.OK, MessageBoxIcon.Warning); 
			}
		}

		void SendData3(IAsyncResult iar)
		{
			Socket remote = (Socket)iar.AsyncState;
			int sent = remote.EndSend(iar);
			client.Close();
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			Socket newsock = new Socket(AddressFamily.InterNetwork,
				SocketType.Stream, ProtocolType.Tcp);
			IPEndPoint iep = new IPEndPoint(IPAddress.Parse(addressServer), 12345);
			newsock.BeginConnect(iep, new AsyncCallback(Connected4), newsock);
		}

		//reset pan
		private void button4_Click(object sender, System.EventArgs e)
		{
			
		}//end send

		void Connected5(IAsyncResult iar)
		{
			client = (Socket)iar.AsyncState;
			try
			{
				client.EndConnect(iar);
				string strMessage = "+";
				byte[] message = Encoding.ASCII.GetBytes(strMessage);
				client.BeginSend(message, 0, message.Length, SocketFlags.None,
					new AsyncCallback(SendData3), client);
			}
			catch (SocketException)
			{
				//Todo Exception
				MessageBox.Show("Connection Fail!!, Retry again later", "Error!!!", MessageBoxButtons.OK, MessageBoxIcon.Warning); 
			}
		}

		//auto pan
		private void button3_Click(object sender, System.EventArgs e)
		{
			Socket newsock = new Socket(AddressFamily.InterNetwork,
				SocketType.Stream, ProtocolType.Tcp);
			IPEndPoint iep = new IPEndPoint(IPAddress.Parse(addressServer), 12345);
			newsock.BeginConnect(iep, new AsyncCallback(Connected5), newsock);
		}
	}
}
