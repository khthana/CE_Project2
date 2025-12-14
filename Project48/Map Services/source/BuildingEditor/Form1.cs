using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.IO;
using System.Xml;
using System.Text;

namespace PictureViewer
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.ContextMenu contextMenu1;
		private System.Windows.Forms.OpenFileDialog openFileDialog1;
		private System.Windows.Forms.MenuItem menuItem1;
		private System.Windows.Forms.MenuItem menuItem2;
		private System.Windows.Forms.MenuItem menuItem3;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.MenuItem menuItem4;
		private System.Windows.Forms.MenuItem menuItem6;
		private System.Windows.Forms.MenuItem menuItem7;
		private System.Windows.Forms.MenuItem menuItem8;
		private System.Windows.Forms.MainMenu mainMenu2;
		private System.ComponentModel.IContainer components;

		// Program variable
		private struct MyFloor
		{
			public int id;
			public string name;
			public string bgImage;
			public ArrayList Polygons;
		}

		private ArrayList Floors = null;
		private int numFloor = 0;
		private System.Windows.Forms.MenuItem menuSaveFile;
		private System.Windows.Forms.MenuItem menuOpenFile;
		private System.Windows.Forms.SaveFileDialog saveFileDialog1;
		private System.Windows.Forms.OpenFileDialog openFileDialog2;
		private PictureViewer.Viewer viewer1;
		private System.Windows.Forms.MenuItem menuItemSaveToWeb;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.ComboBox comboBox1;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		public System.Windows.Forms.TextBox nameTextBox;
		public System.Windows.Forms.TextBox showNameTextBox;
		public System.Windows.Forms.TextBox descTextBox;
		public System.Windows.Forms.Button Savebutton;
		public System.Windows.Forms.Button ResetButton;
		private System.Windows.Forms.Button browseButton;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.TabControl tabControl1;
		private System.Windows.Forms.TabPage BuildingTab;
		private System.Windows.Forms.TabPage FloorTab;
		private System.Windows.Forms.ImageList imageList1;
		private System.Windows.Forms.PictureBox BldpictureBox1;
		private System.Windows.Forms.ListBox listBox1;
		private System.Windows.Forms.Button DelButton;
		private System.Windows.Forms.Button AddButton;
		private System.Windows.Forms.OpenFileDialog openFileDialog3;
		private System.Windows.Forms.Button NewFloorButton;
		private System.Windows.Forms.Button DeleteFloorButton;
		public System.Windows.Forms.TextBox idTextBox;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.Label label11;
		private System.Windows.Forms.TextBox bdName;
		private System.Windows.Forms.TextBox bdLat;
		private System.Windows.Forms.TextBox bdLon;
		private System.Windows.Forms.MenuItem menuItem9;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.GroupBox groupBox3;
		private System.Windows.Forms.TextBox floorNameTextBox;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label12;
		private System.Windows.Forms.Label label13;
		private System.Windows.Forms.Label label14;
		private System.Windows.Forms.Label label15;
		private System.Windows.Forms.Label label16;
		private System.Windows.Forms.TextBox zipcodeTextBox;
		private System.Windows.Forms.TextBox roadTextBox;
		private System.Windows.Forms.TextBox zoneTextBox;
		private System.Windows.Forms.TextBox distinctTextBox;
		private System.Windows.Forms.TextBox amphurTextBox;
		private System.Windows.Forms.TextBox provinceTextBox;
		private int curFloor = 0;
	


		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			// Disable control
			nameTextBox.Enabled = false;
			showNameTextBox.Enabled= false;
			descTextBox.Enabled= false;
			idTextBox.Enabled= false;
			Savebutton.Enabled = false;
			ResetButton.Enabled = false;

			listBox1.Enabled = false;
			AddButton.Enabled = false;
			DelButton.Enabled = false;
			bdName.Enabled = false;
			bdLat.Enabled = false;
			bdLon.Enabled = false;

			NewFloorButton.Enabled = false;
			DeleteFloorButton.Enabled = false;
			comboBox1.Enabled = false;

			floorNameTextBox.Enabled = false;
			button1.Enabled =false;

			provinceTextBox.Enabled = false;
			amphurTextBox.Enabled = false;
			distinctTextBox.Enabled = false;
			zoneTextBox.Enabled = false;
			roadTextBox.Enabled = false;
			zipcodeTextBox.Enabled = false;
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
			this.contextMenu1 = new System.Windows.Forms.ContextMenu();
			this.menuItem1 = new System.Windows.Forms.MenuItem();
			this.menuItem2 = new System.Windows.Forms.MenuItem();
			this.menuItem3 = new System.Windows.Forms.MenuItem();
			this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.menuItem4 = new System.Windows.Forms.MenuItem();
			this.menuItem9 = new System.Windows.Forms.MenuItem();
			this.menuOpenFile = new System.Windows.Forms.MenuItem();
			this.menuSaveFile = new System.Windows.Forms.MenuItem();
			this.menuItemSaveToWeb = new System.Windows.Forms.MenuItem();
			this.menuItem6 = new System.Windows.Forms.MenuItem();
			this.menuItem7 = new System.Windows.Forms.MenuItem();
			this.menuItem8 = new System.Windows.Forms.MenuItem();
			this.mainMenu2 = new System.Windows.Forms.MainMenu();
			this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
			this.openFileDialog2 = new System.Windows.Forms.OpenFileDialog();
			this.viewer1 = new PictureViewer.Viewer();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.comboBox1 = new System.Windows.Forms.ComboBox();
			this.nameTextBox = new System.Windows.Forms.TextBox();
			this.label3 = new System.Windows.Forms.Label();
			this.showNameTextBox = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.descTextBox = new System.Windows.Forms.TextBox();
			this.Savebutton = new System.Windows.Forms.Button();
			this.ResetButton = new System.Windows.Forms.Button();
			this.browseButton = new System.Windows.Forms.Button();
			this.label7 = new System.Windows.Forms.Label();
			this.tabControl1 = new System.Windows.Forms.TabControl();
			this.BuildingTab = new System.Windows.Forms.TabPage();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.zipcodeTextBox = new System.Windows.Forms.TextBox();
			this.label16 = new System.Windows.Forms.Label();
			this.roadTextBox = new System.Windows.Forms.TextBox();
			this.label15 = new System.Windows.Forms.Label();
			this.zoneTextBox = new System.Windows.Forms.TextBox();
			this.label14 = new System.Windows.Forms.Label();
			this.distinctTextBox = new System.Windows.Forms.TextBox();
			this.label13 = new System.Windows.Forms.Label();
			this.amphurTextBox = new System.Windows.Forms.TextBox();
			this.label12 = new System.Windows.Forms.Label();
			this.provinceTextBox = new System.Windows.Forms.TextBox();
			this.label5 = new System.Windows.Forms.Label();
			this.bdLon = new System.Windows.Forms.TextBox();
			this.bdLat = new System.Windows.Forms.TextBox();
			this.bdName = new System.Windows.Forms.TextBox();
			this.label11 = new System.Windows.Forms.Label();
			this.label10 = new System.Windows.Forms.Label();
			this.label9 = new System.Windows.Forms.Label();
			this.listBox1 = new System.Windows.Forms.ListBox();
			this.DelButton = new System.Windows.Forms.Button();
			this.AddButton = new System.Windows.Forms.Button();
			this.BldpictureBox1 = new System.Windows.Forms.PictureBox();
			this.FloorTab = new System.Windows.Forms.TabPage();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.button1 = new System.Windows.Forms.Button();
			this.floorNameTextBox = new System.Windows.Forms.TextBox();
			this.NewFloorButton = new System.Windows.Forms.Button();
			this.DeleteFloorButton = new System.Windows.Forms.Button();
			this.label6 = new System.Windows.Forms.Label();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.idTextBox = new System.Windows.Forms.TextBox();
			this.label8 = new System.Windows.Forms.Label();
			this.imageList1 = new System.Windows.Forms.ImageList(this.components);
			this.openFileDialog3 = new System.Windows.Forms.OpenFileDialog();
			this.tabControl1.SuspendLayout();
			this.BuildingTab.SuspendLayout();
			this.groupBox1.SuspendLayout();
			this.FloorTab.SuspendLayout();
			this.groupBox3.SuspendLayout();
			this.groupBox2.SuspendLayout();
			this.SuspendLayout();
			// 
			// contextMenu1
			// 
			this.contextMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																						 this.menuItem1,
																						 this.menuItem2,
																						 this.menuItem3});
			// 
			// menuItem1
			// 
			this.menuItem1.Index = 0;
			this.menuItem1.Text = "Open Image";
			this.menuItem1.Click += new System.EventHandler(this.menuItem1_Click);
			// 
			// menuItem2
			// 
			this.menuItem2.Index = 1;
			this.menuItem2.Text = "RatioStretch";
			this.menuItem2.Click += new System.EventHandler(this.menuItem2_Click);
			// 
			// menuItem3
			// 
			this.menuItem3.Index = 2;
			this.menuItem3.Text = "Scrollable";
			this.menuItem3.Click += new System.EventHandler(this.menuItem3_Click);
			// 
			// openFileDialog1
			// 
			this.openFileDialog1.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog1_FileOk);
			// 
			// mainMenu1
			// 
			this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem4,
																					  this.menuItem6});
			// 
			// menuItem4
			// 
			this.menuItem4.Index = 0;
			this.menuItem4.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem9,
																					  this.menuOpenFile,
																					  this.menuSaveFile,
																					  this.menuItemSaveToWeb});
			this.menuItem4.Text = "File";
			// 
			// menuItem9
			// 
			this.menuItem9.Index = 0;
			this.menuItem9.Text = "New";
			this.menuItem9.Click += new System.EventHandler(this.menuItem9_Click_1);
			// 
			// menuOpenFile
			// 
			this.menuOpenFile.Index = 1;
			this.menuOpenFile.Text = "Open";
			this.menuOpenFile.Click += new System.EventHandler(this.menuOpenFile_Click);
			// 
			// menuSaveFile
			// 
			this.menuSaveFile.Index = 2;
			this.menuSaveFile.Text = "Save";
			this.menuSaveFile.Click += new System.EventHandler(this.menuSaveFile_Click);
			// 
			// menuItemSaveToWeb
			// 
			this.menuItemSaveToWeb.Index = 3;
			this.menuItemSaveToWeb.Text = "Save to webservice";
			this.menuItemSaveToWeb.Click += new System.EventHandler(this.menuItemSaveToWeb_Click);
			// 
			// menuItem6
			// 
			this.menuItem6.Index = 1;
			this.menuItem6.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem7,
																					  this.menuItem8});
			this.menuItem6.Text = "Mode";
			this.menuItem6.Visible = false;
			// 
			// menuItem7
			// 
			this.menuItem7.Index = 0;
			this.menuItem7.Text = "Scrollable";
			this.menuItem7.Click += new System.EventHandler(this.menuItem7_Click);
			// 
			// menuItem8
			// 
			this.menuItem8.Index = 1;
			this.menuItem8.Text = "RatioStretch";
			this.menuItem8.Click += new System.EventHandler(this.menuItem8_Click);
			// 
			// saveFileDialog1
			// 
			this.saveFileDialog1.FileOk += new System.ComponentModel.CancelEventHandler(this.saveFileDialog1_FileOk);
			// 
			// openFileDialog2
			// 
			this.openFileDialog2.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog2_FileOk);
			// 
			// viewer1
			// 
			this.viewer1.AutoScroll = true;
			this.viewer1.BackColor = System.Drawing.Color.Black;
			this.viewer1.Image = ((System.Drawing.Image)(resources.GetObject("viewer1.Image")));
			this.viewer1.ImageSizeMode = PictureViewer.SizeMode.Scrollable;
			this.viewer1.Location = new System.Drawing.Point(0, 0);
			this.viewer1.Name = "viewer1";
			this.viewer1.Size = new System.Drawing.Size(576, 456);
			this.viewer1.TabIndex = 0;
			this.viewer1.Load += new System.EventHandler(this.viewer1_Load);
			this.viewer1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.viewer1_MouseDown);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(16, 24);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(32, 23);
			this.label1.TabIndex = 1;
			this.label1.Text = "Floor";
			this.label1.Click += new System.EventHandler(this.label1_Click);
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(16, 24);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(48, 23);
			this.label2.TabIndex = 2;
			this.label2.Text = "Block ID";
			// 
			// comboBox1
			// 
			this.comboBox1.Location = new System.Drawing.Point(88, 24);
			this.comboBox1.Name = "comboBox1";
			this.comboBox1.Size = new System.Drawing.Size(88, 21);
			this.comboBox1.TabIndex = 3;
			this.comboBox1.Text = "Select Fl.";
			this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
			// 
			// nameTextBox
			// 
			this.nameTextBox.Enabled = false;
			this.nameTextBox.Location = new System.Drawing.Point(80, 24);
			this.nameTextBox.Name = "nameTextBox";
			this.nameTextBox.Size = new System.Drawing.Size(96, 20);
			this.nameTextBox.TabIndex = 4;
			this.nameTextBox.Text = "";
			this.nameTextBox.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(16, 48);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(64, 16);
			this.label3.TabIndex = 5;
			this.label3.Text = "Name";
			// 
			// showNameTextBox
			// 
			this.showNameTextBox.Enabled = false;
			this.showNameTextBox.Location = new System.Drawing.Point(80, 48);
			this.showNameTextBox.Name = "showNameTextBox";
			this.showNameTextBox.Size = new System.Drawing.Size(96, 20);
			this.showNameTextBox.TabIndex = 6;
			this.showNameTextBox.Text = "";
			this.showNameTextBox.TextChanged += new System.EventHandler(this.showNameTextBox_TextChanged);
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(16, 96);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(96, 16);
			this.label4.TabIndex = 7;
			this.label4.Text = "Description";
			this.label4.Click += new System.EventHandler(this.label4_Click);
			// 
			// descTextBox
			// 
			this.descTextBox.Enabled = false;
			this.descTextBox.Location = new System.Drawing.Point(8, 120);
			this.descTextBox.Multiline = true;
			this.descTextBox.Name = "descTextBox";
			this.descTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Horizontal;
			this.descTextBox.Size = new System.Drawing.Size(160, 64);
			this.descTextBox.TabIndex = 8;
			this.descTextBox.Text = "";
			this.descTextBox.TextChanged += new System.EventHandler(this.descTextBox_TextChanged);
			// 
			// Savebutton
			// 
			this.Savebutton.Location = new System.Drawing.Point(16, 200);
			this.Savebutton.Name = "Savebutton";
			this.Savebutton.Size = new System.Drawing.Size(88, 23);
			this.Savebutton.TabIndex = 10;
			this.Savebutton.Text = "Save Change";
			this.Savebutton.Click += new System.EventHandler(this.Savebutton_Click);
			// 
			// ResetButton
			// 
			this.ResetButton.Location = new System.Drawing.Point(120, 200);
			this.ResetButton.Name = "ResetButton";
			this.ResetButton.Size = new System.Drawing.Size(48, 23);
			this.ResetButton.TabIndex = 11;
			this.ResetButton.Text = "Reset";
			this.ResetButton.Click += new System.EventHandler(this.ResetButton_Click);
			// 
			// browseButton
			// 
			this.browseButton.Location = new System.Drawing.Point(24, 136);
			this.browseButton.Name = "browseButton";
			this.browseButton.Size = new System.Drawing.Size(128, 23);
			this.browseButton.TabIndex = 13;
			this.browseButton.Text = "Select background";
			this.browseButton.Click += new System.EventHandler(this.browseButton_Click);
			// 
			// label7
			// 
			this.label7.Enabled = false;
			this.label7.Location = new System.Drawing.Point(648, 16);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(96, 16);
			this.label7.TabIndex = 14;
			// 
			// tabControl1
			// 
			this.tabControl1.Controls.Add(this.BuildingTab);
			this.tabControl1.Controls.Add(this.FloorTab);
			this.tabControl1.Location = new System.Drawing.Point(0, 16);
			this.tabControl1.Name = "tabControl1";
			this.tabControl1.SelectedIndex = 0;
			this.tabControl1.Size = new System.Drawing.Size(784, 480);
			this.tabControl1.TabIndex = 15;
			// 
			// BuildingTab
			// 
			this.BuildingTab.Controls.Add(this.groupBox1);
			this.BuildingTab.Controls.Add(this.listBox1);
			this.BuildingTab.Controls.Add(this.DelButton);
			this.BuildingTab.Controls.Add(this.AddButton);
			this.BuildingTab.Controls.Add(this.BldpictureBox1);
			this.BuildingTab.Location = new System.Drawing.Point(4, 22);
			this.BuildingTab.Name = "BuildingTab";
			this.BuildingTab.Size = new System.Drawing.Size(776, 454);
			this.BuildingTab.TabIndex = 0;
			this.BuildingTab.Text = "Building";
			this.BuildingTab.Click += new System.EventHandler(this.BuildingTab_Click);
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.zipcodeTextBox);
			this.groupBox1.Controls.Add(this.label16);
			this.groupBox1.Controls.Add(this.roadTextBox);
			this.groupBox1.Controls.Add(this.label15);
			this.groupBox1.Controls.Add(this.zoneTextBox);
			this.groupBox1.Controls.Add(this.label14);
			this.groupBox1.Controls.Add(this.distinctTextBox);
			this.groupBox1.Controls.Add(this.label13);
			this.groupBox1.Controls.Add(this.amphurTextBox);
			this.groupBox1.Controls.Add(this.label12);
			this.groupBox1.Controls.Add(this.provinceTextBox);
			this.groupBox1.Controls.Add(this.label5);
			this.groupBox1.Controls.Add(this.bdLon);
			this.groupBox1.Controls.Add(this.bdLat);
			this.groupBox1.Controls.Add(this.bdName);
			this.groupBox1.Controls.Add(this.label11);
			this.groupBox1.Controls.Add(this.label10);
			this.groupBox1.Controls.Add(this.label9);
			this.groupBox1.Location = new System.Drawing.Point(496, 160);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(224, 256);
			this.groupBox1.TabIndex = 6;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Buliding Information";
			// 
			// zipcodeTextBox
			// 
			this.zipcodeTextBox.Location = new System.Drawing.Point(88, 224);
			this.zipcodeTextBox.Name = "zipcodeTextBox";
			this.zipcodeTextBox.TabIndex = 17;
			this.zipcodeTextBox.Text = "";
			// 
			// label16
			// 
			this.label16.Location = new System.Drawing.Point(24, 224);
			this.label16.Name = "label16";
			this.label16.Size = new System.Drawing.Size(64, 23);
			this.label16.TabIndex = 16;
			this.label16.Text = "√À— ‰ª√…≥’¬Ï";
			// 
			// roadTextBox
			// 
			this.roadTextBox.Location = new System.Drawing.Point(88, 200);
			this.roadTextBox.Name = "roadTextBox";
			this.roadTextBox.TabIndex = 15;
			this.roadTextBox.Text = "";
			// 
			// label15
			// 
			this.label15.Location = new System.Drawing.Point(24, 200);
			this.label15.Name = "label15";
			this.label15.Size = new System.Drawing.Size(64, 23);
			this.label15.TabIndex = 14;
			this.label15.Text = "∂ππ";
			// 
			// zoneTextBox
			// 
			this.zoneTextBox.Location = new System.Drawing.Point(88, 176);
			this.zoneTextBox.Name = "zoneTextBox";
			this.zoneTextBox.TabIndex = 13;
			this.zoneTextBox.Text = "";
			// 
			// label14
			// 
			this.label14.Location = new System.Drawing.Point(24, 176);
			this.label14.Name = "label14";
			this.label14.Size = new System.Drawing.Size(64, 23);
			this.label14.TabIndex = 12;
			this.label14.Text = "‡¢µ";
			// 
			// distinctTextBox
			// 
			this.distinctTextBox.Location = new System.Drawing.Point(88, 152);
			this.distinctTextBox.Name = "distinctTextBox";
			this.distinctTextBox.TabIndex = 11;
			this.distinctTextBox.Text = "";
			// 
			// label13
			// 
			this.label13.Location = new System.Drawing.Point(24, 152);
			this.label13.Name = "label13";
			this.label13.Size = new System.Drawing.Size(64, 23);
			this.label13.TabIndex = 10;
			this.label13.Text = "µ”∫≈";
			// 
			// amphurTextBox
			// 
			this.amphurTextBox.Location = new System.Drawing.Point(88, 128);
			this.amphurTextBox.Name = "amphurTextBox";
			this.amphurTextBox.TabIndex = 9;
			this.amphurTextBox.Text = "";
			// 
			// label12
			// 
			this.label12.Location = new System.Drawing.Point(24, 128);
			this.label12.Name = "label12";
			this.label12.Size = new System.Drawing.Size(64, 23);
			this.label12.TabIndex = 8;
			this.label12.Text = "Õ”‡¿Õ";
			// 
			// provinceTextBox
			// 
			this.provinceTextBox.Location = new System.Drawing.Point(88, 104);
			this.provinceTextBox.Name = "provinceTextBox";
			this.provinceTextBox.TabIndex = 7;
			this.provinceTextBox.Text = "";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(24, 104);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(64, 23);
			this.label5.TabIndex = 6;
			this.label5.Text = "®—ßÀ«—¥";
			// 
			// bdLon
			// 
			this.bdLon.Location = new System.Drawing.Point(88, 72);
			this.bdLon.Name = "bdLon";
			this.bdLon.TabIndex = 5;
			this.bdLon.Text = "";
			// 
			// bdLat
			// 
			this.bdLat.Location = new System.Drawing.Point(88, 48);
			this.bdLat.Name = "bdLat";
			this.bdLat.TabIndex = 4;
			this.bdLat.Text = "";
			// 
			// bdName
			// 
			this.bdName.Location = new System.Drawing.Point(88, 24);
			this.bdName.Name = "bdName";
			this.bdName.TabIndex = 3;
			this.bdName.Text = "";
			// 
			// label11
			// 
			this.label11.Location = new System.Drawing.Point(24, 72);
			this.label11.Name = "label11";
			this.label11.Size = new System.Drawing.Size(64, 23);
			this.label11.TabIndex = 2;
			this.label11.Text = "Longitude :";
			// 
			// label10
			// 
			this.label10.Location = new System.Drawing.Point(24, 48);
			this.label10.Name = "label10";
			this.label10.Size = new System.Drawing.Size(56, 23);
			this.label10.TabIndex = 1;
			this.label10.Text = "Latitude :";
			// 
			// label9
			// 
			this.label9.Location = new System.Drawing.Point(24, 24);
			this.label9.Name = "label9";
			this.label9.Size = new System.Drawing.Size(48, 23);
			this.label9.TabIndex = 0;
			this.label9.Text = "Name :";
			// 
			// listBox1
			// 
			this.listBox1.Enabled = false;
			this.listBox1.HorizontalScrollbar = true;
			this.listBox1.Location = new System.Drawing.Point(528, 24);
			this.listBox1.Name = "listBox1";
			this.listBox1.ScrollAlwaysVisible = true;
			this.listBox1.Size = new System.Drawing.Size(208, 82);
			this.listBox1.TabIndex = 5;
			this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged_1);
			// 
			// DelButton
			// 
			this.DelButton.Location = new System.Drawing.Point(648, 120);
			this.DelButton.Name = "DelButton";
			this.DelButton.TabIndex = 2;
			this.DelButton.Text = "Delete";
			this.DelButton.Click += new System.EventHandler(this.DelButton_Click);
			// 
			// AddButton
			// 
			this.AddButton.Location = new System.Drawing.Point(560, 120);
			this.AddButton.Name = "AddButton";
			this.AddButton.TabIndex = 1;
			this.AddButton.Text = "Add";
			this.AddButton.Click += new System.EventHandler(this.button1_Click);
			// 
			// BldpictureBox1
			// 
			this.BldpictureBox1.Location = new System.Drawing.Point(8, 8);
			this.BldpictureBox1.Name = "BldpictureBox1";
			this.BldpictureBox1.Size = new System.Drawing.Size(424, 304);
			this.BldpictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.BldpictureBox1.TabIndex = 0;
			this.BldpictureBox1.TabStop = false;
			// 
			// FloorTab
			// 
			this.FloorTab.Controls.Add(this.groupBox3);
			this.FloorTab.Controls.Add(this.groupBox2);
			this.FloorTab.Controls.Add(this.viewer1);
			this.FloorTab.Controls.Add(this.label7);
			this.FloorTab.Location = new System.Drawing.Point(4, 22);
			this.FloorTab.Name = "FloorTab";
			this.FloorTab.Size = new System.Drawing.Size(776, 454);
			this.FloorTab.TabIndex = 1;
			this.FloorTab.Text = "Floor";
			this.FloorTab.Click += new System.EventHandler(this.FloorTab_Click);
			// 
			// groupBox3
			// 
			this.groupBox3.Controls.Add(this.button1);
			this.groupBox3.Controls.Add(this.floorNameTextBox);
			this.groupBox3.Controls.Add(this.label1);
			this.groupBox3.Controls.Add(this.comboBox1);
			this.groupBox3.Controls.Add(this.NewFloorButton);
			this.groupBox3.Controls.Add(this.DeleteFloorButton);
			this.groupBox3.Controls.Add(this.browseButton);
			this.groupBox3.Controls.Add(this.label6);
			this.groupBox3.Location = new System.Drawing.Point(584, 8);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(184, 200);
			this.groupBox3.TabIndex = 23;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "Floor information";
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(96, 96);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(80, 23);
			this.button1.TabIndex = 24;
			this.button1.Text = "Update name";
			this.button1.Click += new System.EventHandler(this.button1_Click_1);
			// 
			// floorNameTextBox
			// 
			this.floorNameTextBox.Location = new System.Drawing.Point(88, 72);
			this.floorNameTextBox.Name = "floorNameTextBox";
			this.floorNameTextBox.Size = new System.Drawing.Size(88, 20);
			this.floorNameTextBox.TabIndex = 23;
			this.floorNameTextBox.Text = "";
			this.floorNameTextBox.TextChanged += new System.EventHandler(this.floorNameTextBox_TextChanged);
			this.floorNameTextBox.Leave += new System.EventHandler(this.floorNameTextBox_Leave);
			// 
			// NewFloorButton
			// 
			this.NewFloorButton.Location = new System.Drawing.Point(8, 168);
			this.NewFloorButton.Name = "NewFloorButton";
			this.NewFloorButton.TabIndex = 16;
			this.NewFloorButton.Text = "New Floor";
			this.NewFloorButton.Click += new System.EventHandler(this.NewFloorButton_Click);
			// 
			// DeleteFloorButton
			// 
			this.DeleteFloorButton.Location = new System.Drawing.Point(96, 168);
			this.DeleteFloorButton.Name = "DeleteFloorButton";
			this.DeleteFloorButton.TabIndex = 17;
			this.DeleteFloorButton.Text = "Delete floor";
			this.DeleteFloorButton.Click += new System.EventHandler(this.DeleteFloorButton_Click);
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(16, 72);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(64, 23);
			this.label6.TabIndex = 22;
			this.label6.Text = "Floor name";
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.Add(this.label2);
			this.groupBox2.Controls.Add(this.nameTextBox);
			this.groupBox2.Controls.Add(this.label3);
			this.groupBox2.Controls.Add(this.showNameTextBox);
			this.groupBox2.Controls.Add(this.idTextBox);
			this.groupBox2.Controls.Add(this.label8);
			this.groupBox2.Controls.Add(this.label4);
			this.groupBox2.Controls.Add(this.descTextBox);
			this.groupBox2.Controls.Add(this.Savebutton);
			this.groupBox2.Controls.Add(this.ResetButton);
			this.groupBox2.Location = new System.Drawing.Point(584, 216);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(184, 232);
			this.groupBox2.TabIndex = 20;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Area Information";
			// 
			// idTextBox
			// 
			this.idTextBox.Location = new System.Drawing.Point(80, 72);
			this.idTextBox.Name = "idTextBox";
			this.idTextBox.Size = new System.Drawing.Size(40, 20);
			this.idTextBox.TabIndex = 18;
			this.idTextBox.Text = "";
			this.idTextBox.TextChanged += new System.EventHandler(this.idTextBox_TextChanged);
			// 
			// label8
			// 
			this.label8.Location = new System.Drawing.Point(16, 72);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(48, 23);
			this.label8.TabIndex = 19;
			this.label8.Text = "Shop ID";
			// 
			// imageList1
			// 
			this.imageList1.ImageSize = new System.Drawing.Size(16, 16);
			this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
			// 
			// openFileDialog3
			// 
			this.openFileDialog3.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog3_FileOk);
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(794, 547);
			this.Controls.Add(this.tabControl1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.MaximizeBox = false;
			this.Menu = this.mainMenu1;
			this.Name = "Form1";
			this.Text = "Building Editor by MCL Lab 2006";
			this.Resize += new System.EventHandler(this.OnResize);
			this.Load += new System.EventHandler(this.Form1_Load);
			this.tabControl1.ResumeLayout(false);
			this.BuildingTab.ResumeLayout(false);
			this.groupBox1.ResumeLayout(false);
			this.FloorTab.ResumeLayout(false);
			this.groupBox3.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
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
		//open
		private void menuItem1_Click(object sender, System.EventArgs e)
		{
			//this.OpenImage();
		}
		// ratio stretch
		private void menuItem2_Click(object sender, System.EventArgs e)
		{
			this.viewer1.ImageSizeMode = SizeMode.RatioStretch;
		}
		// scrollable
		private void menuItem3_Click(object sender, System.EventArgs e)
		{
			this.viewer1.ImageSizeMode = SizeMode.Scrollable;
		}		
		// open
		private void menuItem5_Click_1(object sender, System.EventArgs e)
		{
			OpenImage();
		}
	
		
		private void OpenImage()
		{
			try
			{
				this.openFileDialog2.ShowDialog();
				string path = this.openFileDialog2.FileName;

				this.label7.Text = path;
				this.viewer1.bmpBack = new Bitmap(path);
				this.viewer1.Image = (Bitmap)this.viewer1.bmpBack.Clone();
				this.viewer1.SendToBack();

				// Reinsert this floor
				MyFloor tempFloor = (MyFloor) Floors[curFloor];
				tempFloor.bgImage = path;
				Floors.RemoveAt(curFloor);
				Floors.Insert(curFloor, tempFloor);

			}
			catch
			{}
		}
		// ratio stretch
		private void menuItem8_Click(object sender, System.EventArgs e)
		{
			this.viewer1.ImageSizeMode = SizeMode.RatioStretch;
		}
		// scrollable
		private void menuItem7_Click(object sender, System.EventArgs e)
		{
			this.viewer1.ImageSizeMode = SizeMode.Scrollable;
		}

		private void OnMouseDown(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			//MessageBox.Show("fdfd");
		}

		// New
		private void menuItem9_Click(object sender, System.EventArgs e)
		{   
			

		}

		// Select floor
		private void menuItem11_Click(object sender, System.EventArgs e)
		{
			// Save floor data
			MyFloor tempFloor = (MyFloor) Floors[curFloor];
			tempFloor.Polygons = this.viewer1.GetPolygon();

			Floors.RemoveAt(curFloor);
			Floors.Insert(curFloor, tempFloor);

			// Show dialog
			NewDialog dlg = new NewDialog();
			dlg.NumFloor = curFloor+1;
			DialogResult res = dlg.ShowDialog();
			if(res == DialogResult.OK) 
			{
				if(Floors.Count >= dlg.NumFloor)
				{
					curFloor = dlg.NumFloor-1;
					UpdateViewer();
				}
				else
					MessageBox.Show("You don't have that floor");
			}		

		}

		// Floor information
		private void menuItem12_Click(object sender, System.EventArgs e)
		{
			FloorInformation dlg = new FloorInformation();

			// Show floor data
			MyFloor tempFloor = (MyFloor) Floors[curFloor];
			dlg.FloorName = tempFloor.name;

			// Show dialog
			DialogResult res = dlg.ShowDialog();
			if(res == DialogResult.OK) 
			{
				// Save floor data
				tempFloor.name = dlg.FloorName;

				Floors.RemoveAt(curFloor);
				Floors.Insert(curFloor, tempFloor);
			}

		}

		private void OnResize(object sender, System.EventArgs e)
		{
		//	Size tempSize = new Size(this.Size.Width, this.Size.Height);
		//	viewer1.Size = tempSize;
		}

		private void menuSave_Click(object sender, System.EventArgs e)
		{
			MyFloor tempFloor = (MyFloor) Floors[curFloor];
			tempFloor.Polygons = this.viewer1.GetPolygon();

			Floors.RemoveAt(curFloor);
			Floors.Insert(curFloor, tempFloor);
		}

		private void menuSaveFile_Click(object sender, System.EventArgs e)
		{
			saveFileDialog1.InitialDirectory = Application.StartupPath;
			saveFileDialog1.Filter = "XML Files (*.xml)|*.xml";

			saveFileDialog1.ShowDialog();
		}

		private void menuOpenFile_Click(object sender, System.EventArgs e)
		{
			openFileDialog1.AddExtension = true;
			openFileDialog1.CheckFileExists = true;
			openFileDialog1.Title = "Select building file";
			openFileDialog1.ReadOnlyChecked = true;
			openFileDialog1.InitialDirectory = Application.StartupPath;
			openFileDialog1.Multiselect = false;
			openFileDialog1.Filter = "XML Files (*.xml)|*.xml";
			openFileDialog1.ShowDialog();
		}

		private void saveFileDialog1_FileOk(object sender, System.ComponentModel.CancelEventArgs e)
		{
			// Save floor before writing to file
			MyFloor tempFloor = (MyFloor) Floors[curFloor];
			tempFloor.Polygons = this.viewer1.GetPolygon();

			Floors.RemoveAt(curFloor);
			Floors.Insert(curFloor, tempFloor);

			// Write output file (in xml format)
			string fname = saveFileDialog1.FileName;

			StreamWriter sw = new StreamWriter(fname);

			// Start writing data
			sw.WriteLine("<?xml version=\"1.0\" encoding=\"TIS-620\"?>");
			sw.WriteLine("<Building>");

			// Outside building's picture
			if(listBox1.Items.Count == 0)
			{
				sw.WriteLine("	<BPicture>0</BPicture>");
				sw.WriteLine("	<BPicture>0</BPicture>");
			}
			else
			{
				for( int i =0; i<listBox1.Items.Count;i++)
					sw.WriteLine("	<BPicture>" + listBox1.Items[i].ToString() + "</BPicture>");
				if(listBox1.Items.Count == 1)
					sw.WriteLine("	<BPicture>0</BPicture>");
			}

			// Building name, lat, lon and other information
			sw.WriteLine("	<Name>" + bdName.Text + "</Name>");
			sw.WriteLine("	<Latitude>" + bdLat.Text + "</Latitude>");
			sw.WriteLine("	<Longitude>" + bdLon.Text + "</Longitude>");
			sw.WriteLine("	<Province>" + provinceTextBox.Text + "</Province>");
			sw.WriteLine("	<Amphur>" + amphurTextBox.Text + "</Amphur>");
			sw.WriteLine("	<District>" + distinctTextBox.Text + "</District>");
			sw.WriteLine("	<Zone>" + zoneTextBox.Text + "</Zone>");
			sw.WriteLine("	<Road>" + roadTextBox.Text + "</Road>");
			sw.WriteLine("	<Zipcode>" + zipcodeTextBox.Text + "</Zipcode>");

			foreach(MyFloor fl in Floors)
			{
				// Write floor information
				sw.WriteLine("	<Floor>");

				sw.WriteLine("		<ID>" + fl.id.ToString() + "</ID>");
				sw.WriteLine("		<Name>" + fl.name + "</Name>");
				sw.WriteLine("		<Background>" + fl.bgImage + "</Background>");

				foreach(MyPolygon poly in fl.Polygons)
				{
					// Polygon information
					sw.WriteLine("		<Polygon>");

					sw.WriteLine("			<ID>" + poly.index + "</ID>");
					sw.WriteLine("			<Name>" + poly.name + "</Name>");
					sw.WriteLine("			<SHOWNAME>" + poly.showname + "</SHOWNAME>");
					sw.WriteLine("			<DESC>" + poly.desc + "</DESC>");
					sw.WriteLine("			<SHOPID>" + poly.shopid.ToString() + "</SHOPID>");

					foreach(MarkControl mc in poly.Marks)
					{
						// Marker information
						sw.WriteLine("			<Marker>");

						sw.WriteLine("				<X>" + mc.Location.X + "</X>");
						sw.WriteLine("				<Y>" + mc.Location.Y + "</Y>");

						sw.WriteLine("			</Marker>");
					}
					sw.WriteLine("		</Polygon>");
				}

				sw.WriteLine("	</Floor>");
			}

			sw.WriteLine("</Building>");

			sw.Flush();
			sw.Close();
		}

		private void openFileDialog1_FileOk(object sender, System.ComponentModel.CancelEventArgs e)
		{
			// Clear old information
			Floors = new ArrayList();
			comboBox1.Items.Clear();
			listBox1.Items.Clear();

			// Open new file
			string fname = openFileDialog1.FileName;

			// Open file use readxml for easy implement
			// instantiate new dataset
			DataSet relational_data;

			relational_data = new DataSet();
			// read the xml file (Thai Encoding) to populate the dataset

			StreamReader sr = new StreamReader(fname,  Encoding.UTF8);
			relational_data.ReadXml(sr);
					
		/*
			Console.WriteLine("\n" + "Start\n");

			foreach(DataTable t in relational_data.Tables)
			{
				Console.WriteLine("TableName: " + t.TableName);
				foreach(DataRow r in t.Rows)
				{
					foreach(DataColumn c in t.Columns)
					{
						Console.Write("\t " + "(" + c.ColumnName + " : " + r[c] + ")" );
					}
					Console.WriteLine();
				}
			}
*/
			

			// Put data in variable and Show IT!
			Floors = new ArrayList();

			for(int i = 0; i < relational_data.Tables[2].Rows.Count; i++)
			{
				// FLOOR
				MyFloor tempFloor = new MyFloor();
				tempFloor.Polygons = new ArrayList();

				tempFloor.id = Convert.ToInt16(relational_data.Tables[2].Rows[i].ItemArray[0]);
                tempFloor.name = relational_data.Tables[2].Rows[i].ItemArray[1].ToString();
				tempFloor.bgImage = relational_data.Tables[2].Rows[i].ItemArray[2].ToString();

				// OPTIMIZE !
				for(int j = 0; j < relational_data.Tables[3].Rows.Count; j++)
				{
					if(relational_data.Tables[3].Rows[j].ItemArray[6].ToString().Equals(relational_data.Tables[2].Rows[i].ItemArray[3].ToString()))
					{
						// POLYGON
						MyPolygon tempPoly = new MyPolygon();
						tempPoly.index = Convert.ToInt16(relational_data.Tables[3].Rows[j].ItemArray[0].ToString());
						tempPoly.name = relational_data.Tables[3].Rows[j].ItemArray[1].ToString();
						tempPoly.showname = relational_data.Tables[3].Rows[j].ItemArray[2].ToString();
						tempPoly.desc = relational_data.Tables[3].Rows[j].ItemArray[3].ToString();
						tempPoly.shopid = Convert.ToInt16(relational_data.Tables[3].Rows[j].ItemArray[4].ToString());

						tempPoly.Marks = new ArrayList();

						// MARKER
						for(int k = 0; k < relational_data.Tables[4].Rows.Count; k++)
						{
							if(relational_data.Tables[4].Rows[k].ItemArray[2].ToString().Equals(relational_data.Tables[3].Rows[j].ItemArray[5].ToString()))
							{
								MarkControl ms = new MarkControl();
//								ms.Location.X = Convert.ToInt16(relational_data.Tables[2].Rows[k].ItemArray[0]);
//								ms.Location.Y = Convert.ToInt16(relational_data.Tables[2].Rows[k].ItemArray[1]);
								ms.Location = new Point(Convert.ToInt16(relational_data.Tables[4].Rows[k].ItemArray[0]),
									Convert.ToInt16(relational_data.Tables[4].Rows[k].ItemArray[1]));
								tempPoly.Marks.Add(ms);
							}
						} // END MARKER
	
						tempFloor.Polygons.Add(tempPoly);
					} // END POLYGON
				} 

				comboBox1.Items.Add(tempFloor.name + " Fl. ");

				numFloor++;
				Floors.Add(tempFloor);
			} // END FLOOR

			// Outside picture
			this.listBox1.Enabled= true;
			bool myTest = true;
			if(relational_data.Tables[1].Rows[0].ItemArray[0].ToString().Equals("0"))
			{
				myTest = false;
			}

			if(myTest)
			{
				for(int i = 0; i < relational_data.Tables[1].Rows.Count; i++)
				{
					if(!relational_data.Tables[1].Rows[i].ItemArray[0].ToString().Equals("0"))
						listBox1.Items.Add(relational_data.Tables[1].Rows[i].ItemArray[0].ToString());
				}
			}

			// Get building information
			bdName.Text = relational_data.Tables[0].Rows[0].ItemArray[1].ToString();
			bdLat.Text = relational_data.Tables[0].Rows[0].ItemArray[2].ToString();
			bdLon.Text = relational_data.Tables[0].Rows[0].ItemArray[3].ToString();
			provinceTextBox.Text = relational_data.Tables[0].Rows[0].ItemArray[4].ToString();
			amphurTextBox.Text = relational_data.Tables[0].Rows[0].ItemArray[5].ToString();
			distinctTextBox.Text = relational_data.Tables[0].Rows[0].ItemArray[6].ToString();
			zoneTextBox.Text = relational_data.Tables[0].Rows[0].ItemArray[7].ToString();
			roadTextBox.Text = relational_data.Tables[0].Rows[0].ItemArray[8].ToString();
			zipcodeTextBox.Text = relational_data.Tables[0].Rows[0].ItemArray[9].ToString();
			
			// Close stream reader
			sr.Close();

			curFloor = 0;

			// Update viewer
			UpdateViewer();
			curFloor = 0;

			// Change floor name
			curFloor = 0;		
			comboBox1.SelectedIndex = curFloor;
			floorNameTextBox.Name = comboBox1.Items[curFloor].ToString();

			// Enable control
			listBox1.Enabled = true;
			AddButton.Enabled = true;
			DelButton.Enabled = true;
			bdName.Enabled = true;
			bdLat.Enabled = true;
			bdLon.Enabled = true;
			NewFloorButton.Enabled = true;
			DeleteFloorButton.Enabled = true;
			comboBox1.Enabled = true;
			provinceTextBox.Enabled = true;
			amphurTextBox.Enabled = true;
			distinctTextBox.Enabled = true;
			zoneTextBox.Enabled = true;
			roadTextBox.Enabled = true;
			zipcodeTextBox.Enabled = true;

			floorNameTextBox.Enabled = true;
			button1.Enabled = true;
		} // END FUNCTION

		public void UpdateViewer()
		{
			try
			{
				MyFloor tempFloor = (MyFloor) Floors[curFloor];

				// If selected floor already choose image, show it
				if(!tempFloor.bgImage.Equals(""))
				{
					this.viewer1.bmpBack = new Bitmap(tempFloor.bgImage);
					this.viewer1.Image = (Bitmap)this.viewer1.bmpBack.Clone();
					this.viewer1.SendToBack();
				}
				else
				{
					this.viewer1.bmpBack = new Bitmap(400,400);
					Graphics.FromImage(this.viewer1.bmpBack).Clear(Color.White);
					this.viewer1.Image = (Bitmap)this.viewer1.bmpBack.Clone();
					this.viewer1.SendToBack();
				}

				// Draw polygon
				this.viewer1.UpdatePolygon(tempFloor.Polygons);
			}
			catch
			{
				MessageBox.Show("Unhandled error !");
			}
		}

		private void openFileDialog2_FileOk(object sender, System.ComponentModel.CancelEventArgs e)
		{
		
		}

		protected static byte[] ReadBitmap2ByteArray(string fileName)
		{
			using(Bitmap image = new Bitmap(fileName))
			{
				MemoryStream stream = new MemoryStream();
				image.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
				return stream.ToArray();
			}
		}

		private void menuItemSaveToWeb_Click(object sender, System.EventArgs e)
		{
			try
			{
				// Save floor before writing to file
				MyFloor tempFl = (MyFloor) Floors[curFloor];
				tempFl.Polygons = this.viewer1.GetPolygon();

				Floors.RemoveAt(curFloor);
				Floors.Insert(curFloor, tempFl);

				// Write output file to Building class
				localhost.Building bd = new localhost.Building();
				//			bd.floor = new ArrayList();
				ArrayList floor = new ArrayList();

				int polyID = 0;

				foreach(MyFloor fl in Floors)
				{
					// Write floor information
					localhost.Floor tempFloor = new localhost.Floor();

					if(fl.bgImage.Equals(""))
					{
						MessageBox.Show("Please select background image");
						return;
					}
					
					tempFloor.id = fl.id;
					tempFloor.name = fl.name;
					tempFloor.background = ReadBitmap2ByteArray(fl.bgImage);

					//				tempFloor.polygon = new ArrayList();
					ArrayList polygon = new ArrayList();

					foreach(MyPolygon poly in fl.Polygons)
					{
						// Polygon information
						localhost.Polygon tempPolygon = new localhost.Polygon();
						tempPolygon.id = polyID;
						tempPolygon.name = poly.name;
						tempPolygon.showname = poly.showname;
						tempPolygon.desc = poly.desc;

						//					tempPolygon.point = new ArrayList();
						ArrayList point = new ArrayList();

						foreach(MarkControl mc in poly.Marks)
						{
							// Marker information
							localhost.InteriorPoint tempPoint = new localhost.InteriorPoint();
							tempPoint.x = mc.Location.X;
							tempPoint.y = mc.Location.Y;

							point.Add(tempPoint);
							//						tempPolygon.point.Add(tempPoint);
						}

						tempPolygon.point = (localhost.InteriorPoint[])point.ToArray(typeof(localhost.InteriorPoint));
						polygon.Add(tempPolygon);
						polyID++;
						//					tempFloor.polygon.Add(tempPolygon);
					}

					tempFloor.polygon = (localhost.Polygon[])polygon.ToArray(typeof(localhost.Polygon));
					floor.Add(tempFloor);
				}
				
				bd.floor = (localhost.Floor[])floor.ToArray(typeof(localhost.Floor));

				// Outside building's picture
				ArrayList bdPic = new ArrayList();
				for( int i =0; i<listBox1.Items.Count;i++)
					bdPic.Add(listBox1.Items[i].ToString());

				// Building information
				bd.name = bdName.Text;
				bd.lat = Convert.ToDouble(bdLat.Text);
				bd.lon = Convert.ToDouble(bdLon.Text);
				bd.addr = new localhost.Address();
				bd.addr.Province = provinceTextBox.Text;
				bd.addr.Amphur = amphurTextBox.Text;
				bd.addr.District = distinctTextBox.Text;
				bd.addr.Zone = zoneTextBox.Text;
				bd.addr.Road = roadTextBox.Text;
				bd.addr.Zipcode = Convert.ToInt16(zipcodeTextBox.Text);

				// Insert to web service
				localhost.Service1 webref = new localhost.Service1();
				// Upload data
				int result = webref.uploadBuilding(bd);
				if(result == 0)
				{
					MessageBox.Show("Upload error !");
				}
				else
					MessageBox.Show("Upload complete\nYour reference ID is " + result);
			}
			catch(Exception ex)
			{
				MessageBox.Show(ex.ToString());
			}
		}

		private void viewer1_Load(object sender, System.EventArgs e)
		{
		
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{
		
		}

		private void label1_Click(object sender, System.EventArgs e)
		{
		
		}

		private void comboBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			MyFloor tempFloor = (MyFloor) Floors[curFloor];
			tempFloor.Polygons = this.viewer1.GetPolygon();

			Floors.RemoveAt(curFloor);
			Floors.Insert(curFloor, tempFloor);
						
			viewer1.canDraw = true;
			viewer1.createNewBackground();

			// Change floor name
		    curFloor = comboBox1.SelectedIndex;	
			floorNameTextBox.Text = comboBox1.Items[curFloor].ToString();

		    UpdateViewer();			
				
			// Clear control variable
			nameTextBox.Enabled = false;
			showNameTextBox.Enabled= false;
			descTextBox.Enabled= false;
			idTextBox.Enabled= false;
			Savebutton.Enabled = false;
			ResetButton.Enabled = false;

			nameTextBox.Text = "";
			showNameTextBox.Text = "";
			descTextBox.Text = "";
			idTextBox.Text = "";
		}

		private void label4_Click(object sender, System.EventArgs e)
		{
		
		}

		private void textBox4_TextChanged(object sender, System.EventArgs e)
		{
		
		}

		private void textBox1_TextChanged(object sender, System.EventArgs e)
		{
		
		}

		private void viewer1_MouseDown(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			
		}

		private void showNameTextBox_TextChanged(object sender, System.EventArgs e)
		{
		
		}

		private void ResetButton_Click(object sender, System.EventArgs e)
		{
		     this.nameTextBox.Text= "";
			 this.showNameTextBox.Text= "";
			 this.descTextBox.Text= "";
			this.idTextBox.Text = "";
		
		}

		private void Savebutton_Click(object sender, System.EventArgs e)
		{
			string a = this.nameTextBox.Text;
			string b = this.showNameTextBox.Text;
			string c = this.descTextBox.Text;
			int d = Convert.ToInt16(this.idTextBox.Text);
			this.viewer1.Updatevalue(a,b,c,d);
		}

		private void label5_Click(object sender, System.EventArgs e)
		{
		
		}

		

		private void browseButton_Click(object sender, System.EventArgs e)
		{
			this.OpenImage();
		}

		private void FloorTab_Click(object sender, System.EventArgs e)
		{   
		
		}

		private void BuildingTab_Click(object sender, System.EventArgs e)
		{
		
		}

		private void descTextBox_TextChanged(object sender, System.EventArgs e)
		{
		
		}

		private void button3_Click(object sender, System.EventArgs e)
		{  
		
		}

		

		private void button1_Click(object sender, System.EventArgs e)
		{
			this.listBox1.Enabled= true ;						
			this.openFileDialog3.ShowDialog();
			listBox1.SelectedIndex = listBox1.Items.Count-1;
		}

		private void openFileDialog3_FileOk(object sender, System.ComponentModel.CancelEventArgs e)
		{   string path = this.openFileDialog3.FileName;	
			this.listBox1.Items.Add(this.openFileDialog3.FileName);
			this.BldpictureBox1.Image = new Bitmap(path);	
		}

		private void DelButton_Click(object sender, System.EventArgs e)
		{
			this.listBox1.Items.Remove( this.listBox1.SelectedItem);

			BldpictureBox1.Image = new Bitmap(BldpictureBox1.Width,BldpictureBox1.Height);
		}

		private void listBox1_SelectedIndexChanged_1(object sender, System.EventArgs e)
		{				
			if(!this.listBox1.Focused)
				return;

			try
			{
				this.BldpictureBox1.Image = new Bitmap(this.listBox1.SelectedItem.ToString());
			}
			catch(Exception ex)
			{
				MessageBox.Show("Image file not found!");
			}
		}

	
		private void NewFloorButton_Click(object sender, System.EventArgs e)
		{
			// Add new floor
			MyFloor tempFloor = new MyFloor();
			tempFloor.Polygons = new ArrayList();
			tempFloor.id = numFloor;
			tempFloor.bgImage = "";

			FloorInformation NewFloorDlg = new FloorInformation();			
			DialogResult res = NewFloorDlg.ShowDialog();
			
			if(res == DialogResult.OK) 
			{
				numFloor++;				

				// Insert new floor
				comboBox1.Items.Add(NewFloorDlg.FloorName + " Fl. ");
				tempFloor.name = NewFloorDlg.FloorName;
			}

			Floors.Add(tempFloor);
		}

		private void DeleteFloorButton_Click(object sender, System.EventArgs e)
		{
			// Delete current floor
			Floors.RemoveAt(curFloor);
			numFloor--;

			// Reset floor id
			MyFloor tempFloor;
			for(int i = curFloor; i < numFloor; i++)
			{
				tempFloor = (MyFloor) Floors[i];
				tempFloor.id = i;
				Floors.RemoveAt(i);
				Floors.Insert(i, tempFloor);
			}
			
			// Reinsert combobox item
			comboBox1.Items.Clear();
			for(int i=1; i<=numFloor; i++)
				comboBox1.Items.Add(i.ToString() + " Fl. ");


			// Update viewer
			viewer1.canDraw = true;
			viewer1.createNewBackground();
			
			curFloor = 0;			

			UpdateViewer();			
		}

		private void menuItem9_Click_1(object sender, System.EventArgs e)
		{
			// Clear old information
			comboBox1.Items.Clear();
			listBox1.Items.Clear();
			
			NewDialog dlg = new NewDialog();
			DialogResult res = dlg.ShowDialog();
			dlg.Location = new Point(600, this.Location.Y + this.Size.Height/2);
			if(res == DialogResult.OK) 
			{
				numFloor = dlg.NumFloor;
				Floors = new ArrayList();

				for(int i = 0; i < numFloor; i++)
				{
					MyFloor tempFloor = new MyFloor();
					tempFloor.Polygons = new ArrayList();
					tempFloor.id = i;
					tempFloor.bgImage = "";
					Floors.Add(tempFloor);
					
				}
			}
			else
				return;

			for(int i=1; i<=numFloor; i++)
				comboBox1.Items.Add(i.ToString() + " Fl. ");

			UpdateViewer();	
			curFloor = 0;
			comboBox1.SelectedIndex = curFloor;
			floorNameTextBox.Text = comboBox1.Items[curFloor].ToString();

			// Enable control
			listBox1.Enabled = true;
			AddButton.Enabled = true;
			DelButton.Enabled = true;
			bdName.Enabled = true;
			bdLat.Enabled = true;
			bdLon.Enabled = true;

			provinceTextBox.Enabled = true;
			amphurTextBox.Enabled = true;
			distinctTextBox.Enabled = true;
			zoneTextBox.Enabled = true;
			roadTextBox.Enabled = true;
			zipcodeTextBox.Enabled = true;

			NewFloorButton.Enabled = true;
			DeleteFloorButton.Enabled = true;
			comboBox1.Enabled = true;
			floorNameTextBox.Enabled = true;
			button1.Enabled = true;

		}

		private void floorNameTextBox_TextChanged(object sender, System.EventArgs e)
		{
			// Reinsert this floor
/*			MyFloor tempFloor = (MyFloor) Floors[curFloor];
			tempFloor.name = floorNameTextBox.Text;
			Floors.RemoveAt(curFloor);
			Floors.Insert(curFloor, tempFloor);

			comboBox1.Items[curFloor] = floorNameTextBox.Text;*/
		}

		private void floorNameTextBox_Leave(object sender, System.EventArgs e)
		{
			
		}

		private void button1_Click_1(object sender, System.EventArgs e)
		{
			// Reinsert this floor
			MyFloor tempFloor = (MyFloor) Floors[curFloor];
			tempFloor.name = floorNameTextBox.Text;
			Floors.RemoveAt(curFloor);
			Floors.Insert(curFloor, tempFloor);

			comboBox1.Items[curFloor] = floorNameTextBox.Text;
		}

		private void idTextBox_TextChanged(object sender, System.EventArgs e)
		{
			try
			{
				int test = Convert.ToInt16(idTextBox.Text);
			}
			catch(Exception ex)
			{
				if(idTextBox.Text.Equals(""))
					idTextBox.Text = "0";
				else
					MessageBox.Show("Number ONLY!");
			}
		}

			
	}
}
