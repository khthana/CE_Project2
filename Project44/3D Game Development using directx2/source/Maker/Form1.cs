using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;

namespace Maker
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.StatusBar statusBar1;
		private System.Windows.Forms.StatusBarPanel statusBarPanel1;
		private System.Windows.Forms.StatusBarPanel statusBarPanel2;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.MenuItem menuItem1;
		private System.Windows.Forms.MenuItem menuItem2;
		private System.Windows.Forms.MenuItem menuItem3;
		private System.Windows.Forms.MenuItem menuItem4;
		private System.Windows.Forms.MenuItem menuItem5;
		private System.Windows.Forms.MenuItem menuItem6;
		private System.Windows.Forms.ImageList imageListMain;
		private System.Windows.Forms.ToolBarButton toolBarButton1;
		private System.Windows.Forms.ToolBarButton toolBarButton2;
		private System.Windows.Forms.ToolBarButton toolBarButton3;
		private System.Windows.Forms.ToolBarButton toolBarButton4;
		private System.Windows.Forms.ToolBarButton toolBarButton5;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Panel panel2;
		private System.Windows.Forms.Panel panel3;
		private System.Windows.Forms.Splitter splitter1;
		private System.Windows.Forms.Panel panel4;
		private System.Windows.Forms.Splitter splitter2;
		private System.Windows.Forms.Panel panel5;
		private System.Windows.Forms.Panel panel6;
		private System.Windows.Forms.Panel panel7;
		private System.Windows.Forms.TabControl tabControl1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Panel panel9;
		private System.Windows.Forms.Panel panel10;
		private System.Windows.Forms.Panel panel11;
		private System.Windows.Forms.Panel panel12;
		private System.Windows.Forms.TabControl tabControl2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Panel panel8;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.TabPage tabPage1;
		private System.Windows.Forms.TabPage tabPage2;
		private System.Windows.Forms.TabPage tabPage3;
		private System.Windows.Forms.TabPage tabPage4;
		private System.Windows.Forms.TabPage tabPage5;
		private System.Windows.Forms.TabPage tabPage6;
		private System.Windows.Forms.TabPage tabPage7;
		private System.Windows.Forms.TabPage tabPage8;
		private System.Windows.Forms.ImageList imageListTB;
		private System.Windows.Forms.ToolBarButton toolBarButton6;
		private System.Windows.Forms.ToolBarButton toolBarButton7;
		private System.Windows.Forms.ToolBarButton toolBarButton8;
		private System.Windows.Forms.ToolBarButton toolBarButton9;
		private System.Windows.Forms.ToolBarButton toolBarButton10;
		private System.Windows.Forms.ToolBar toolBar7;
		private System.Windows.Forms.ToolBarButton toolBarButton11;
		private System.Windows.Forms.ToolBar toolBar8;
		private System.Windows.Forms.ToolBarButton toolBarButton12;
		private System.Windows.Forms.ToolBarButton toolBarButton14;
		private System.Windows.Forms.ToolBarButton toolBarButton15;
		private System.Windows.Forms.ToolBarButton toolBarButton16;
		private System.Windows.Forms.ColumnHeader Name;
		private System.Windows.Forms.ColumnHeader Mesh;
		private System.Windows.Forms.ColumnHeader Render;
		private System.Windows.Forms.ColumnHeader Vertex;
		private System.Windows.Forms.ColumnHeader Index;
		private System.Windows.Forms.ColumnHeader Tex1;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.ColumnHeader columnHeader7;
		private System.Windows.Forms.ColumnHeader columnHeader2;
		private System.Windows.Forms.ColumnHeader columnHeader3;
		private System.Windows.Forms.ColumnHeader columnHeader4;
		private System.Windows.Forms.ColumnHeader columnHeader5;
		private System.Windows.Forms.ColumnHeader columnHeader6;
		private System.Windows.Forms.ColumnHeader columnHeader8;
		private System.Windows.Forms.ColumnHeader columnHeader9;
		private System.Windows.Forms.ColumnHeader columnHeader10;
		private System.Windows.Forms.ColumnHeader columnHeader11;
		private System.Windows.Forms.ColumnHeader columnHeader12;
		private System.Windows.Forms.ColumnHeader columnHeader13;
		private System.Windows.Forms.ColumnHeader columnHeader14;
		private System.Windows.Forms.ColumnHeader columnHeader15;
		private System.Windows.Forms.ColumnHeader columnHeader16;
		private System.Windows.Forms.MenuItem menuItem7;
		private System.Windows.Forms.MenuItem menuItem8;
		private System.Windows.Forms.MenuItem menuItem9;
		private System.Windows.Forms.MenuItem menuItem10;
		private System.Windows.Forms.MenuItem menuItem11;
		private System.Windows.Forms.MenuItem menuItem12;
		private System.Windows.Forms.MenuItem menuItem13;
		private System.Windows.Forms.MenuItem menuItem14;
		private System.Windows.Forms.MenuItem menuItem15;
		private System.Windows.Forms.MenuItem menuItem16;
		private System.Windows.Forms.MenuItem menuItem17;
		private System.Windows.Forms.MenuItem menuItem18;
		private System.Windows.Forms.MenuItem menuItem19;
		private System.Windows.Forms.MenuItem menuItem20;
		private System.ComponentModel.IContainer components;
		private System.Windows.Forms.OpenFileDialog ofd;
		private System.Windows.Forms.SaveFileDialog sfd;
		private System.Windows.Forms.TextBox textOutput;
		private System.Windows.Forms.MenuItem menuItem21;
		private System.Windows.Forms.TreeView tvModel;
		private System.Windows.Forms.TreeView tvResource;
		private System.Windows.Forms.ToolBar toolBarMain;
		private System.Windows.Forms.ColumnHeader columnHeader17;
		private System.Windows.Forms.ColumnHeader columnHeader18;
		private System.Windows.Forms.ColumnHeader columnHeader19;
		private System.Windows.Forms.ColumnHeader columnHeader20;
		private System.Windows.Forms.ColumnHeader columnHeader21;
		private System.Windows.Forms.ColumnHeader columnHeader22;
		private System.Windows.Forms.ColumnHeader columnHeader23;
		private System.Windows.Forms.ListView lvFrames;
		private System.Windows.Forms.ListView lvMtrls;
		private System.Windows.Forms.ListView lvAnim;
		private System.Windows.Forms.ColumnHeader columnHeader24;
		private System.Windows.Forms.ListView lvTextures;
		private System.Windows.Forms.ToolBar tbTexture;
		private System.Windows.Forms.DataGrid dgProp;
		private System.Windows.Forms.ToolBar tbMtrl;
		private System.Windows.Forms.ToolBar tbAnime;
		private System.Windows.Forms.ToolBar tbDetector;
		private System.Windows.Forms.ListView lvDetect;
		private System.Windows.Forms.ToolBar FrameTB;

		private App app;

		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//

			app = new App();
			textOutput.Clear();
			textOutput.Text = "Ready...\r\n";
			statusBar1.Panels[0].Text	= "";
			statusBar1.Panels[1].Text	= "Ready...";
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
			this.statusBar1 = new System.Windows.Forms.StatusBar();
			this.statusBarPanel1 = new System.Windows.Forms.StatusBarPanel();
			this.statusBarPanel2 = new System.Windows.Forms.StatusBarPanel();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.menuItem1 = new System.Windows.Forms.MenuItem();
			this.menuItem7 = new System.Windows.Forms.MenuItem();
			this.menuItem8 = new System.Windows.Forms.MenuItem();
			this.menuItem9 = new System.Windows.Forms.MenuItem();
			this.menuItem10 = new System.Windows.Forms.MenuItem();
			this.menuItem11 = new System.Windows.Forms.MenuItem();
			this.menuItem19 = new System.Windows.Forms.MenuItem();
			this.menuItem20 = new System.Windows.Forms.MenuItem();
			this.menuItem12 = new System.Windows.Forms.MenuItem();
			this.menuItem14 = new System.Windows.Forms.MenuItem();
			this.menuItem15 = new System.Windows.Forms.MenuItem();
			this.menuItem13 = new System.Windows.Forms.MenuItem();
			this.menuItem16 = new System.Windows.Forms.MenuItem();
			this.menuItem17 = new System.Windows.Forms.MenuItem();
			this.menuItem2 = new System.Windows.Forms.MenuItem();
			this.menuItem3 = new System.Windows.Forms.MenuItem();
			this.menuItem4 = new System.Windows.Forms.MenuItem();
			this.menuItem18 = new System.Windows.Forms.MenuItem();
			this.menuItem21 = new System.Windows.Forms.MenuItem();
			this.menuItem5 = new System.Windows.Forms.MenuItem();
			this.menuItem6 = new System.Windows.Forms.MenuItem();
			this.toolBarMain = new System.Windows.Forms.ToolBar();
			this.toolBarButton1 = new System.Windows.Forms.ToolBarButton();
			this.toolBarButton2 = new System.Windows.Forms.ToolBarButton();
			this.toolBarButton3 = new System.Windows.Forms.ToolBarButton();
			this.toolBarButton4 = new System.Windows.Forms.ToolBarButton();
			this.toolBarButton5 = new System.Windows.Forms.ToolBarButton();
			this.imageListMain = new System.Windows.Forms.ImageList(this.components);
			this.panel1 = new System.Windows.Forms.Panel();
			this.panel2 = new System.Windows.Forms.Panel();
			this.panel3 = new System.Windows.Forms.Panel();
			this.panel7 = new System.Windows.Forms.Panel();
			this.tabControl1 = new System.Windows.Forms.TabControl();
			this.tabPage1 = new System.Windows.Forms.TabPage();
			this.tvResource = new System.Windows.Forms.TreeView();
			this.toolBar7 = new System.Windows.Forms.ToolBar();
			this.toolBarButton11 = new System.Windows.Forms.ToolBarButton();
			this.imageListTB = new System.Windows.Forms.ImageList(this.components);
			this.tabPage2 = new System.Windows.Forms.TabPage();
			this.tvModel = new System.Windows.Forms.TreeView();
			this.toolBar8 = new System.Windows.Forms.ToolBar();
			this.toolBarButton12 = new System.Windows.Forms.ToolBarButton();
			this.tabPage3 = new System.Windows.Forms.TabPage();
			this.dgProp = new System.Windows.Forms.DataGrid();
			this.panel8 = new System.Windows.Forms.Panel();
			this.label4 = new System.Windows.Forms.Label();
			this.panel6 = new System.Windows.Forms.Panel();
			this.label2 = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.splitter1 = new System.Windows.Forms.Splitter();
			this.panel4 = new System.Windows.Forms.Panel();
			this.textOutput = new System.Windows.Forms.TextBox();
			this.label3 = new System.Windows.Forms.Label();
			this.splitter2 = new System.Windows.Forms.Splitter();
			this.panel5 = new System.Windows.Forms.Panel();
			this.tabControl2 = new System.Windows.Forms.TabControl();
			this.tabPage4 = new System.Windows.Forms.TabPage();
			this.lvFrames = new System.Windows.Forms.ListView();
			this.columnHeader23 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader17 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader18 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader19 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader24 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader20 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader21 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader22 = new System.Windows.Forms.ColumnHeader();
			this.FrameTB = new System.Windows.Forms.ToolBar();
			this.toolBarButton6 = new System.Windows.Forms.ToolBarButton();
			this.tabPage5 = new System.Windows.Forms.TabPage();
			this.lvMtrls = new System.Windows.Forms.ListView();
			this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader7 = new System.Windows.Forms.ColumnHeader();
			this.tbMtrl = new System.Windows.Forms.ToolBar();
			this.toolBarButton7 = new System.Windows.Forms.ToolBarButton();
			this.tabPage6 = new System.Windows.Forms.TabPage();
			this.lvAnim = new System.Windows.Forms.ListView();
			this.columnHeader4 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader5 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader11 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader12 = new System.Windows.Forms.ColumnHeader();
			this.tbAnime = new System.Windows.Forms.ToolBar();
			this.toolBarButton8 = new System.Windows.Forms.ToolBarButton();
			this.toolBarButton14 = new System.Windows.Forms.ToolBarButton();
			this.tabPage7 = new System.Windows.Forms.TabPage();
			this.lvDetect = new System.Windows.Forms.ListView();
			this.columnHeader6 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader8 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader13 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader14 = new System.Windows.Forms.ColumnHeader();
			this.tbDetector = new System.Windows.Forms.ToolBar();
			this.toolBarButton9 = new System.Windows.Forms.ToolBarButton();
			this.tabPage8 = new System.Windows.Forms.TabPage();
			this.lvTextures = new System.Windows.Forms.ListView();
			this.columnHeader9 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader10 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader15 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader16 = new System.Windows.Forms.ColumnHeader();
			this.tbTexture = new System.Windows.Forms.ToolBar();
			this.toolBarButton10 = new System.Windows.Forms.ToolBarButton();
			this.toolBarButton15 = new System.Windows.Forms.ToolBarButton();
			this.toolBarButton16 = new System.Windows.Forms.ToolBarButton();
			this.panel12 = new System.Windows.Forms.Panel();
			this.panel11 = new System.Windows.Forms.Panel();
			this.panel10 = new System.Windows.Forms.Panel();
			this.panel9 = new System.Windows.Forms.Panel();
			this.columnHeader3 = new System.Windows.Forms.ColumnHeader();
			this.Name = new System.Windows.Forms.ColumnHeader();
			this.Mesh = new System.Windows.Forms.ColumnHeader();
			this.Render = new System.Windows.Forms.ColumnHeader();
			this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
			this.Vertex = new System.Windows.Forms.ColumnHeader();
			this.Index = new System.Windows.Forms.ColumnHeader();
			this.Tex1 = new System.Windows.Forms.ColumnHeader();
			this.ofd = new System.Windows.Forms.OpenFileDialog();
			this.sfd = new System.Windows.Forms.SaveFileDialog();
			((System.ComponentModel.ISupportInitialize)(this.statusBarPanel1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.statusBarPanel2)).BeginInit();
			this.panel3.SuspendLayout();
			this.panel7.SuspendLayout();
			this.tabControl1.SuspendLayout();
			this.tabPage1.SuspendLayout();
			this.tabPage2.SuspendLayout();
			this.tabPage3.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.dgProp)).BeginInit();
			this.panel8.SuspendLayout();
			this.panel6.SuspendLayout();
			this.panel4.SuspendLayout();
			this.panel5.SuspendLayout();
			this.tabControl2.SuspendLayout();
			this.tabPage4.SuspendLayout();
			this.tabPage5.SuspendLayout();
			this.tabPage6.SuspendLayout();
			this.tabPage7.SuspendLayout();
			this.tabPage8.SuspendLayout();
			this.SuspendLayout();
			// 
			// statusBar1
			// 
			this.statusBar1.Location = new System.Drawing.Point(0, 467);
			this.statusBar1.Name = "statusBar1";
			this.statusBar1.Panels.AddRange(new System.Windows.Forms.StatusBarPanel[] {
																						  this.statusBarPanel1,
																						  this.statusBarPanel2});
			this.statusBar1.ShowPanels = true;
			this.statusBar1.Size = new System.Drawing.Size(712, 22);
			this.statusBar1.TabIndex = 0;
			this.statusBar1.Text = "statusBar1";
			// 
			// statusBarPanel1
			// 
			this.statusBarPanel1.AutoSize = System.Windows.Forms.StatusBarPanelAutoSize.Spring;
			this.statusBarPanel1.Text = "statusBarPanel1";
			this.statusBarPanel1.Width = 599;
			// 
			// statusBarPanel2
			// 
			this.statusBarPanel2.Alignment = System.Windows.Forms.HorizontalAlignment.Right;
			this.statusBarPanel2.Text = "statusBarPanel2";
			this.statusBarPanel2.Width = 97;
			// 
			// mainMenu1
			// 
			this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem1,
																					  this.menuItem2,
																					  this.menuItem3,
																					  this.menuItem4,
																					  this.menuItem5,
																					  this.menuItem6});
			// 
			// menuItem1
			// 
			this.menuItem1.Index = 0;
			this.menuItem1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem7,
																					  this.menuItem8,
																					  this.menuItem9,
																					  this.menuItem10,
																					  this.menuItem11,
																					  this.menuItem12,
																					  this.menuItem13,
																					  this.menuItem16,
																					  this.menuItem17});
			this.menuItem1.Text = "&File";
			// 
			// menuItem7
			// 
			this.menuItem7.Index = 0;
			this.menuItem7.Shortcut = System.Windows.Forms.Shortcut.CtrlN;
			this.menuItem7.Text = "New Project";
			// 
			// menuItem8
			// 
			this.menuItem8.Index = 1;
			this.menuItem8.Shortcut = System.Windows.Forms.Shortcut.CtrlO;
			this.menuItem8.Text = "Open Project";
			// 
			// menuItem9
			// 
			this.menuItem9.Index = 2;
			this.menuItem9.Text = "Close Project";
			// 
			// menuItem10
			// 
			this.menuItem10.Index = 3;
			this.menuItem10.Text = "-";
			// 
			// menuItem11
			// 
			this.menuItem11.Index = 4;
			this.menuItem11.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					   this.menuItem19,
																					   this.menuItem20});
			this.menuItem11.Text = "Add Resource";
			// 
			// menuItem19
			// 
			this.menuItem19.Index = 0;
			this.menuItem19.RadioCheck = true;
			this.menuItem19.Shortcut = System.Windows.Forms.Shortcut.CtrlM;
			this.menuItem19.Text = "Model";
			this.menuItem19.Click += new System.EventHandler(this.AddRes3d);
			// 
			// menuItem20
			// 
			this.menuItem20.Index = 1;
			this.menuItem20.RadioCheck = true;
			this.menuItem20.Shortcut = System.Windows.Forms.Shortcut.CtrlT;
			this.menuItem20.Text = "Texture";
			this.menuItem20.Click += new System.EventHandler(this.AddRes2d);
			// 
			// menuItem12
			// 
			this.menuItem12.Index = 5;
			this.menuItem12.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					   this.menuItem14,
																					   this.menuItem15});
			this.menuItem12.Text = "Save";
			// 
			// menuItem14
			// 
			this.menuItem14.Index = 0;
			this.menuItem14.RadioCheck = true;
			this.menuItem14.Shortcut = System.Windows.Forms.Shortcut.CtrlS;
			this.menuItem14.Text = "Model";
			this.menuItem14.Click += new System.EventHandler(this.SaveModel);
			// 
			// menuItem15
			// 
			this.menuItem15.Index = 1;
			this.menuItem15.Text = "All Texture";
			// 
			// menuItem13
			// 
			this.menuItem13.Index = 6;
			this.menuItem13.RadioCheck = true;
			this.menuItem13.Shortcut = System.Windows.Forms.Shortcut.CtrlShiftA;
			this.menuItem13.Text = "Save All";
			this.menuItem13.Click += new System.EventHandler(this.SaveAll);
			// 
			// menuItem16
			// 
			this.menuItem16.Index = 7;
			this.menuItem16.Text = "-";
			// 
			// menuItem17
			// 
			this.menuItem17.Index = 8;
			this.menuItem17.Text = "Close";
			// 
			// menuItem2
			// 
			this.menuItem2.Index = 1;
			this.menuItem2.Text = "&Edit";
			// 
			// menuItem3
			// 
			this.menuItem3.Index = 2;
			this.menuItem3.Text = "&View";
			// 
			// menuItem4
			// 
			this.menuItem4.Index = 3;
			this.menuItem4.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem18,
																					  this.menuItem21});
			this.menuItem4.Text = "&Project";
			// 
			// menuItem18
			// 
			this.menuItem18.Index = 0;
			this.menuItem18.Text = "Directory";
			// 
			// menuItem21
			// 
			this.menuItem21.Index = 1;
			this.menuItem21.Text = "Set Base Model";
			this.menuItem21.Click += new System.EventHandler(this.SetBase);
			// 
			// menuItem5
			// 
			this.menuItem5.Index = 4;
			this.menuItem5.Text = "&Tools";
			// 
			// menuItem6
			// 
			this.menuItem6.Index = 5;
			this.menuItem6.Text = "&Help";
			// 
			// toolBarMain
			// 
			this.toolBarMain.Appearance = System.Windows.Forms.ToolBarAppearance.Flat;
			this.toolBarMain.Buttons.AddRange(new System.Windows.Forms.ToolBarButton[] {
																						   this.toolBarButton1,
																						   this.toolBarButton2,
																						   this.toolBarButton3,
																						   this.toolBarButton4,
																						   this.toolBarButton5});
			this.toolBarMain.DropDownArrows = true;
			this.toolBarMain.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.toolBarMain.ImageList = this.imageListMain;
			this.toolBarMain.Name = "toolBarMain";
			this.toolBarMain.ShowToolTips = true;
			this.toolBarMain.Size = new System.Drawing.Size(712, 41);
			this.toolBarMain.TabIndex = 1;
			this.toolBarMain.ButtonClick += new System.Windows.Forms.ToolBarButtonClickEventHandler(this.MainTBClick);
			// 
			// toolBarButton1
			// 
			this.toolBarButton1.ImageIndex = 0;
			// 
			// toolBarButton2
			// 
			this.toolBarButton2.ImageIndex = 1;
			// 
			// toolBarButton3
			// 
			this.toolBarButton3.Style = System.Windows.Forms.ToolBarButtonStyle.Separator;
			// 
			// toolBarButton4
			// 
			this.toolBarButton4.ImageIndex = 2;
			// 
			// toolBarButton5
			// 
			this.toolBarButton5.ImageIndex = 3;
			// 
			// imageListMain
			// 
			this.imageListMain.ColorDepth = System.Windows.Forms.ColorDepth.Depth32Bit;
			this.imageListMain.ImageSize = new System.Drawing.Size(32, 32);
			this.imageListMain.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageListMain.ImageStream")));
			this.imageListMain.TransparentColor = System.Drawing.Color.Transparent;
			// 
			// panel1
			// 
			this.panel1.BackColor = System.Drawing.SystemColors.Control;
			this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
			this.panel1.Location = new System.Drawing.Point(0, 41);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(712, 5);
			this.panel1.TabIndex = 2;
			// 
			// panel2
			// 
			this.panel2.BackColor = System.Drawing.SystemColors.Control;
			this.panel2.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.panel2.Location = new System.Drawing.Point(0, 462);
			this.panel2.Name = "panel2";
			this.panel2.Size = new System.Drawing.Size(712, 5);
			this.panel2.TabIndex = 3;
			// 
			// panel3
			// 
			this.panel3.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.panel7,
																				 this.panel6});
			this.panel3.Dock = System.Windows.Forms.DockStyle.Right;
			this.panel3.Location = new System.Drawing.Point(504, 46);
			this.panel3.Name = "panel3";
			this.panel3.Size = new System.Drawing.Size(208, 416);
			this.panel3.TabIndex = 4;
			// 
			// panel7
			// 
			this.panel7.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.tabControl1,
																				 this.panel8});
			this.panel7.Dock = System.Windows.Forms.DockStyle.Fill;
			this.panel7.Name = "panel7";
			this.panel7.Size = new System.Drawing.Size(208, 344);
			this.panel7.TabIndex = 1;
			// 
			// tabControl1
			// 
			this.tabControl1.Appearance = System.Windows.Forms.TabAppearance.FlatButtons;
			this.tabControl1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					  this.tabPage1,
																					  this.tabPage2,
																					  this.tabPage3});
			this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
			this.tabControl1.Location = new System.Drawing.Point(0, 16);
			this.tabControl1.Name = "tabControl1";
			this.tabControl1.SelectedIndex = 0;
			this.tabControl1.Size = new System.Drawing.Size(208, 328);
			this.tabControl1.TabIndex = 1;
			// 
			// tabPage1
			// 
			this.tabPage1.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.tvResource,
																				   this.toolBar7});
			this.tabPage1.Location = new System.Drawing.Point(4, 25);
			this.tabPage1.Name = "tabPage1";
			this.tabPage1.Size = new System.Drawing.Size(200, 299);
			this.tabPage1.TabIndex = 0;
			this.tabPage1.Text = "Resources";
			// 
			// tvResource
			// 
			this.tvResource.BackColor = System.Drawing.Color.AliceBlue;
			this.tvResource.Dock = System.Windows.Forms.DockStyle.Fill;
			this.tvResource.ImageIndex = -1;
			this.tvResource.Location = new System.Drawing.Point(0, 29);
			this.tvResource.Name = "tvResource";
			this.tvResource.SelectedImageIndex = -1;
			this.tvResource.Size = new System.Drawing.Size(200, 270);
			this.tvResource.TabIndex = 2;
			// 
			// toolBar7
			// 
			this.toolBar7.Appearance = System.Windows.Forms.ToolBarAppearance.Flat;
			this.toolBar7.Buttons.AddRange(new System.Windows.Forms.ToolBarButton[] {
																						this.toolBarButton11});
			this.toolBar7.DropDownArrows = true;
			this.toolBar7.ImageList = this.imageListTB;
			this.toolBar7.Name = "toolBar7";
			this.toolBar7.ShowToolTips = true;
			this.toolBar7.Size = new System.Drawing.Size(200, 29);
			this.toolBar7.TabIndex = 1;
			// 
			// toolBarButton11
			// 
			this.toolBarButton11.ImageIndex = 0;
			// 
			// imageListTB
			// 
			this.imageListTB.ColorDepth = System.Windows.Forms.ColorDepth.Depth32Bit;
			this.imageListTB.ImageSize = new System.Drawing.Size(20, 20);
			this.imageListTB.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageListTB.ImageStream")));
			this.imageListTB.TransparentColor = System.Drawing.Color.Transparent;
			// 
			// tabPage2
			// 
			this.tabPage2.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.tvModel,
																				   this.toolBar8});
			this.tabPage2.Location = new System.Drawing.Point(4, 25);
			this.tabPage2.Name = "tabPage2";
			this.tabPage2.Size = new System.Drawing.Size(200, 299);
			this.tabPage2.TabIndex = 1;
			this.tabPage2.Text = "Model ";
			// 
			// tvModel
			// 
			this.tvModel.BackColor = System.Drawing.Color.AliceBlue;
			this.tvModel.Dock = System.Windows.Forms.DockStyle.Fill;
			this.tvModel.ImageIndex = -1;
			this.tvModel.Location = new System.Drawing.Point(0, 39);
			this.tvModel.Name = "tvModel";
			this.tvModel.SelectedImageIndex = -1;
			this.tvModel.Size = new System.Drawing.Size(200, 260);
			this.tvModel.TabIndex = 3;
			// 
			// toolBar8
			// 
			this.toolBar8.Appearance = System.Windows.Forms.ToolBarAppearance.Flat;
			this.toolBar8.Buttons.AddRange(new System.Windows.Forms.ToolBarButton[] {
																						this.toolBarButton12});
			this.toolBar8.DropDownArrows = true;
			this.toolBar8.ImageList = this.imageListTB;
			this.toolBar8.Name = "toolBar8";
			this.toolBar8.ShowToolTips = true;
			this.toolBar8.Size = new System.Drawing.Size(200, 39);
			this.toolBar8.TabIndex = 1;
			// 
			// toolBarButton12
			// 
			this.toolBarButton12.ImageIndex = 0;
			// 
			// tabPage3
			// 
			this.tabPage3.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.dgProp});
			this.tabPage3.Location = new System.Drawing.Point(4, 25);
			this.tabPage3.Name = "tabPage3";
			this.tabPage3.Size = new System.Drawing.Size(200, 299);
			this.tabPage3.TabIndex = 2;
			this.tabPage3.Text = "Properties";
			// 
			// dgProp
			// 
			this.dgProp.AllowSorting = false;
			this.dgProp.DataMember = "";
			this.dgProp.Dock = System.Windows.Forms.DockStyle.Fill;
			this.dgProp.HeaderForeColor = System.Drawing.SystemColors.ControlText;
			this.dgProp.Name = "dgProp";
			this.dgProp.ReadOnly = true;
			this.dgProp.Size = new System.Drawing.Size(200, 299);
			this.dgProp.TabIndex = 2;
			// 
			// panel8
			// 
			this.panel8.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.label4});
			this.panel8.Dock = System.Windows.Forms.DockStyle.Top;
			this.panel8.Name = "panel8";
			this.panel8.Size = new System.Drawing.Size(208, 16);
			this.panel8.TabIndex = 0;
			// 
			// label4
			// 
			this.label4.BackColor = System.Drawing.SystemColors.Control;
			this.label4.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.label4.Dock = System.Windows.Forms.DockStyle.Fill;
			this.label4.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(208, 16);
			this.label4.TabIndex = 0;
			this.label4.Text = "Data Explorer";
			this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// panel6
			// 
			this.panel6.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.panel6.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.label2,
																				 this.label1});
			this.panel6.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.panel6.Location = new System.Drawing.Point(0, 344);
			this.panel6.Name = "panel6";
			this.panel6.Size = new System.Drawing.Size(208, 72);
			this.panel6.TabIndex = 0;
			// 
			// label2
			// 
			this.label2.BackColor = System.Drawing.SystemColors.Control;
			this.label2.Dock = System.Windows.Forms.DockStyle.Fill;
			this.label2.Location = new System.Drawing.Point(0, 16);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(204, 52);
			this.label2.TabIndex = 1;
			this.label2.Text = "label2";
			// 
			// label1
			// 
			this.label1.BackColor = System.Drawing.SystemColors.Control;
			this.label1.Dock = System.Windows.Forms.DockStyle.Top;
			this.label1.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(204, 16);
			this.label1.TabIndex = 0;
			this.label1.Text = "label1";
			this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// splitter1
			// 
			this.splitter1.BackColor = System.Drawing.SystemColors.Control;
			this.splitter1.Dock = System.Windows.Forms.DockStyle.Right;
			this.splitter1.Location = new System.Drawing.Point(501, 46);
			this.splitter1.Name = "splitter1";
			this.splitter1.Size = new System.Drawing.Size(3, 416);
			this.splitter1.TabIndex = 5;
			this.splitter1.TabStop = false;
			// 
			// panel4
			// 
			this.panel4.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.textOutput,
																				 this.label3});
			this.panel4.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.panel4.Location = new System.Drawing.Point(0, 362);
			this.panel4.Name = "panel4";
			this.panel4.Size = new System.Drawing.Size(501, 100);
			this.panel4.TabIndex = 6;
			// 
			// textOutput
			// 
			this.textOutput.BackColor = System.Drawing.SystemColors.WindowText;
			this.textOutput.Dock = System.Windows.Forms.DockStyle.Fill;
			this.textOutput.ForeColor = System.Drawing.SystemColors.Window;
			this.textOutput.Location = new System.Drawing.Point(0, 16);
			this.textOutput.Multiline = true;
			this.textOutput.Name = "textOutput";
			this.textOutput.ScrollBars = System.Windows.Forms.ScrollBars.Both;
			this.textOutput.Size = new System.Drawing.Size(501, 84);
			this.textOutput.TabIndex = 1;
			this.textOutput.Text = "textBox1";
			// 
			// label3
			// 
			this.label3.BackColor = System.Drawing.SystemColors.Control;
			this.label3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.label3.Dock = System.Windows.Forms.DockStyle.Top;
			this.label3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
			this.label3.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(501, 16);
			this.label3.TabIndex = 0;
			this.label3.Text = "Output";
			// 
			// splitter2
			// 
			this.splitter2.BackColor = System.Drawing.SystemColors.Control;
			this.splitter2.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.splitter2.Location = new System.Drawing.Point(0, 359);
			this.splitter2.Name = "splitter2";
			this.splitter2.Size = new System.Drawing.Size(501, 3);
			this.splitter2.TabIndex = 7;
			this.splitter2.TabStop = false;
			// 
			// panel5
			// 
			this.panel5.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.tabControl2,
																				 this.panel12,
																				 this.panel11,
																				 this.panel10,
																				 this.panel9});
			this.panel5.Dock = System.Windows.Forms.DockStyle.Fill;
			this.panel5.Location = new System.Drawing.Point(0, 46);
			this.panel5.Name = "panel5";
			this.panel5.Size = new System.Drawing.Size(501, 313);
			this.panel5.TabIndex = 8;
			// 
			// tabControl2
			// 
			this.tabControl2.Appearance = System.Windows.Forms.TabAppearance.FlatButtons;
			this.tabControl2.Controls.AddRange(new System.Windows.Forms.Control[] {
																					  this.tabPage4,
																					  this.tabPage5,
																					  this.tabPage6,
																					  this.tabPage7,
																					  this.tabPage8});
			this.tabControl2.Dock = System.Windows.Forms.DockStyle.Fill;
			this.tabControl2.Location = new System.Drawing.Point(1, 1);
			this.tabControl2.Name = "tabControl2";
			this.tabControl2.SelectedIndex = 0;
			this.tabControl2.Size = new System.Drawing.Size(499, 311);
			this.tabControl2.TabIndex = 5;
			this.tabControl2.SelectedIndexChanged += new System.EventHandler(this.ViewChange);
			// 
			// tabPage4
			// 
			this.tabPage4.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.lvFrames,
																				   this.FrameTB});
			this.tabPage4.Location = new System.Drawing.Point(4, 25);
			this.tabPage4.Name = "tabPage4";
			this.tabPage4.Size = new System.Drawing.Size(491, 282);
			this.tabPage4.TabIndex = 0;
			this.tabPage4.Text = "Frames";
			// 
			// lvFrames
			// 
			this.lvFrames.BackColor = System.Drawing.Color.Honeydew;
			this.lvFrames.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																					   this.columnHeader23,
																					   this.columnHeader17,
																					   this.columnHeader18,
																					   this.columnHeader19,
																					   this.columnHeader24,
																					   this.columnHeader20,
																					   this.columnHeader21,
																					   this.columnHeader22});
			this.lvFrames.Dock = System.Windows.Forms.DockStyle.Fill;
			this.lvFrames.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lvFrames.FullRowSelect = true;
			this.lvFrames.GridLines = true;
			this.lvFrames.Location = new System.Drawing.Point(0, 29);
			this.lvFrames.Name = "lvFrames";
			this.lvFrames.Size = new System.Drawing.Size(491, 253);
			this.lvFrames.TabIndex = 1;
			this.lvFrames.View = System.Windows.Forms.View.Details;
			// 
			// columnHeader23
			// 
			this.columnHeader23.Text = "No.";
			this.columnHeader23.Width = 30;
			// 
			// columnHeader17
			// 
			this.columnHeader17.Text = "Name";
			this.columnHeader17.Width = 100;
			// 
			// columnHeader18
			// 
			this.columnHeader18.Text = "Mesh";
			this.columnHeader18.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader18.Width = 50;
			// 
			// columnHeader19
			// 
			this.columnHeader19.Text = "Render";
			this.columnHeader19.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader19.Width = 50;
			// 
			// columnHeader24
			// 
			this.columnHeader24.Text = "Parent";
			this.columnHeader24.Width = 100;
			// 
			// columnHeader20
			// 
			this.columnHeader20.Text = "Vertex";
			this.columnHeader20.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			this.columnHeader20.Width = 100;
			// 
			// columnHeader21
			// 
			this.columnHeader21.Text = "Index";
			this.columnHeader21.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			this.columnHeader21.Width = 100;
			// 
			// columnHeader22
			// 
			this.columnHeader22.Text = "Layer 1";
			this.columnHeader22.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader22.Width = 200;
			// 
			// FrameTB
			// 
			this.FrameTB.Appearance = System.Windows.Forms.ToolBarAppearance.Flat;
			this.FrameTB.Buttons.AddRange(new System.Windows.Forms.ToolBarButton[] {
																					   this.toolBarButton6});
			this.FrameTB.DropDownArrows = true;
			this.FrameTB.ImageList = this.imageListTB;
			this.FrameTB.Name = "FrameTB";
			this.FrameTB.ShowToolTips = true;
			this.FrameTB.Size = new System.Drawing.Size(491, 29);
			this.FrameTB.TabIndex = 0;
			this.FrameTB.ButtonClick += new System.Windows.Forms.ToolBarButtonClickEventHandler(this.FrameTBClick);
			// 
			// toolBarButton6
			// 
			this.toolBarButton6.ImageIndex = 4;
			this.toolBarButton6.ToolTipText = "Edit Layer Texture";
			// 
			// tabPage5
			// 
			this.tabPage5.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.lvMtrls,
																				   this.tbMtrl});
			this.tabPage5.Location = new System.Drawing.Point(4, 25);
			this.tabPage5.Name = "tabPage5";
			this.tabPage5.Size = new System.Drawing.Size(491, 282);
			this.tabPage5.TabIndex = 1;
			this.tabPage5.Text = "Materials";
			// 
			// lvMtrls
			// 
			this.lvMtrls.BackColor = System.Drawing.Color.Honeydew;
			this.lvMtrls.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																					  this.columnHeader1,
																					  this.columnHeader7});
			this.lvMtrls.Dock = System.Windows.Forms.DockStyle.Fill;
			this.lvMtrls.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lvMtrls.GridLines = true;
			this.lvMtrls.Location = new System.Drawing.Point(0, 39);
			this.lvMtrls.Name = "lvMtrls";
			this.lvMtrls.Size = new System.Drawing.Size(491, 243);
			this.lvMtrls.TabIndex = 2;
			this.lvMtrls.View = System.Windows.Forms.View.Details;
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Name";
			this.columnHeader1.Width = 100;
			// 
			// columnHeader7
			// 
			this.columnHeader7.Text = "No. Mtrl Keys";
			this.columnHeader7.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader7.Width = 100;
			// 
			// tbMtrl
			// 
			this.tbMtrl.Appearance = System.Windows.Forms.ToolBarAppearance.Flat;
			this.tbMtrl.Buttons.AddRange(new System.Windows.Forms.ToolBarButton[] {
																					  this.toolBarButton7});
			this.tbMtrl.DropDownArrows = true;
			this.tbMtrl.ImageList = this.imageListTB;
			this.tbMtrl.Name = "tbMtrl";
			this.tbMtrl.ShowToolTips = true;
			this.tbMtrl.Size = new System.Drawing.Size(491, 39);
			this.tbMtrl.TabIndex = 1;
			this.tbMtrl.ButtonClick += new System.Windows.Forms.ToolBarButtonClickEventHandler(this.MtrlTBClick);
			// 
			// toolBarButton7
			// 
			this.toolBarButton7.ImageIndex = 3;
			this.toolBarButton7.ToolTipText = "Edit Material Texture";
			// 
			// tabPage6
			// 
			this.tabPage6.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.lvAnim,
																				   this.tbAnime});
			this.tabPage6.Location = new System.Drawing.Point(4, 25);
			this.tabPage6.Name = "tabPage6";
			this.tabPage6.Size = new System.Drawing.Size(491, 282);
			this.tabPage6.TabIndex = 2;
			this.tabPage6.Text = "Animation";
			// 
			// lvAnim
			// 
			this.lvAnim.BackColor = System.Drawing.Color.Honeydew;
			this.lvAnim.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																					 this.columnHeader4,
																					 this.columnHeader5,
																					 this.columnHeader11,
																					 this.columnHeader12});
			this.lvAnim.Dock = System.Windows.Forms.DockStyle.Fill;
			this.lvAnim.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lvAnim.GridLines = true;
			this.lvAnim.Location = new System.Drawing.Point(0, 39);
			this.lvAnim.Name = "lvAnim";
			this.lvAnim.Size = new System.Drawing.Size(491, 243);
			this.lvAnim.TabIndex = 3;
			this.lvAnim.View = System.Windows.Forms.View.Details;
			// 
			// columnHeader4
			// 
			this.columnHeader4.Text = "Name";
			this.columnHeader4.Width = 100;
			// 
			// columnHeader5
			// 
			this.columnHeader5.Text = "No. Set";
			this.columnHeader5.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			// 
			// columnHeader11
			// 
			this.columnHeader11.Text = "Length";
			this.columnHeader11.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			// 
			// columnHeader12
			// 
			this.columnHeader12.Text = "From";
			this.columnHeader12.Width = 200;
			// 
			// tbAnime
			// 
			this.tbAnime.Appearance = System.Windows.Forms.ToolBarAppearance.Flat;
			this.tbAnime.Buttons.AddRange(new System.Windows.Forms.ToolBarButton[] {
																					   this.toolBarButton8,
																					   this.toolBarButton14});
			this.tbAnime.DropDownArrows = true;
			this.tbAnime.ImageList = this.imageListTB;
			this.tbAnime.Name = "tbAnime";
			this.tbAnime.ShowToolTips = true;
			this.tbAnime.Size = new System.Drawing.Size(491, 39);
			this.tbAnime.TabIndex = 1;
			this.tbAnime.ButtonClick += new System.Windows.Forms.ToolBarButtonClickEventHandler(this.AnimTBClick);
			// 
			// toolBarButton8
			// 
			this.toolBarButton8.ImageIndex = 2;
			// 
			// toolBarButton14
			// 
			this.toolBarButton14.ImageIndex = 1;
			// 
			// tabPage7
			// 
			this.tabPage7.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.lvDetect,
																				   this.tbDetector});
			this.tabPage7.Location = new System.Drawing.Point(4, 25);
			this.tabPage7.Name = "tabPage7";
			this.tabPage7.Size = new System.Drawing.Size(491, 282);
			this.tabPage7.TabIndex = 3;
			this.tabPage7.Text = "Detector";
			// 
			// lvDetect
			// 
			this.lvDetect.BackColor = System.Drawing.Color.Honeydew;
			this.lvDetect.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																					   this.columnHeader6,
																					   this.columnHeader8,
																					   this.columnHeader13,
																					   this.columnHeader14});
			this.lvDetect.Dock = System.Windows.Forms.DockStyle.Fill;
			this.lvDetect.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lvDetect.GridLines = true;
			this.lvDetect.Location = new System.Drawing.Point(0, 39);
			this.lvDetect.Name = "lvDetect";
			this.lvDetect.Size = new System.Drawing.Size(491, 243);
			this.lvDetect.TabIndex = 3;
			this.lvDetect.View = System.Windows.Forms.View.Details;
			// 
			// columnHeader6
			// 
			this.columnHeader6.Text = "Name";
			this.columnHeader6.Width = 100;
			// 
			// columnHeader8
			// 
			this.columnHeader8.Text = "Type";
			this.columnHeader8.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader8.Width = 50;
			// 
			// columnHeader13
			// 
			this.columnHeader13.Text = "Element";
			this.columnHeader13.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader13.Width = 80;
			// 
			// columnHeader14
			// 
			this.columnHeader14.Text = "Parent";
			this.columnHeader14.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader14.Width = 150;
			// 
			// tbDetector
			// 
			this.tbDetector.Appearance = System.Windows.Forms.ToolBarAppearance.Flat;
			this.tbDetector.Buttons.AddRange(new System.Windows.Forms.ToolBarButton[] {
																						  this.toolBarButton9});
			this.tbDetector.DropDownArrows = true;
			this.tbDetector.ImageList = this.imageListTB;
			this.tbDetector.Name = "tbDetector";
			this.tbDetector.ShowToolTips = true;
			this.tbDetector.Size = new System.Drawing.Size(491, 39);
			this.tbDetector.TabIndex = 1;
			this.tbDetector.ButtonClick += new System.Windows.Forms.ToolBarButtonClickEventHandler(this.DetectTBClick);
			// 
			// toolBarButton9
			// 
			this.toolBarButton9.ImageIndex = 4;
			this.toolBarButton9.ToolTipText = "Add Detector";
			// 
			// tabPage8
			// 
			this.tabPage8.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.lvTextures,
																				   this.tbTexture});
			this.tabPage8.Location = new System.Drawing.Point(4, 25);
			this.tabPage8.Name = "tabPage8";
			this.tabPage8.Size = new System.Drawing.Size(491, 282);
			this.tabPage8.TabIndex = 4;
			this.tabPage8.Text = "Texture";
			// 
			// lvTextures
			// 
			this.lvTextures.BackColor = System.Drawing.Color.Honeydew;
			this.lvTextures.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																						 this.columnHeader9,
																						 this.columnHeader10,
																						 this.columnHeader15,
																						 this.columnHeader16});
			this.lvTextures.Dock = System.Windows.Forms.DockStyle.Fill;
			this.lvTextures.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lvTextures.GridLines = true;
			this.lvTextures.Location = new System.Drawing.Point(0, 39);
			this.lvTextures.Name = "lvTextures";
			this.lvTextures.Size = new System.Drawing.Size(491, 243);
			this.lvTextures.TabIndex = 3;
			this.lvTextures.View = System.Windows.Forms.View.Details;
			// 
			// columnHeader9
			// 
			this.columnHeader9.Text = "Name";
			this.columnHeader9.Width = 100;
			// 
			// columnHeader10
			// 
			this.columnHeader10.Text = "No. Texture";
			this.columnHeader10.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader10.Width = 80;
			// 
			// columnHeader15
			// 
			this.columnHeader15.Text = "FPS";
			this.columnHeader15.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader15.Width = 80;
			// 
			// columnHeader16
			// 
			this.columnHeader16.Text = "From";
			this.columnHeader16.Width = 200;
			// 
			// tbTexture
			// 
			this.tbTexture.Appearance = System.Windows.Forms.ToolBarAppearance.Flat;
			this.tbTexture.Buttons.AddRange(new System.Windows.Forms.ToolBarButton[] {
																						 this.toolBarButton10,
																						 this.toolBarButton15,
																						 this.toolBarButton16});
			this.tbTexture.DropDownArrows = true;
			this.tbTexture.ImageList = this.imageListTB;
			this.tbTexture.Name = "tbTexture";
			this.tbTexture.ShowToolTips = true;
			this.tbTexture.Size = new System.Drawing.Size(491, 39);
			this.tbTexture.TabIndex = 1;
			this.tbTexture.ButtonClick += new System.Windows.Forms.ToolBarButtonClickEventHandler(this.TextureTBClick);
			// 
			// toolBarButton10
			// 
			this.toolBarButton10.ImageIndex = 5;
			this.toolBarButton10.ToolTipText = "Add Texture From DDS";
			// 
			// toolBarButton15
			// 
			this.toolBarButton15.ImageIndex = 6;
			this.toolBarButton15.ToolTipText = "Edit Texture";
			// 
			// toolBarButton16
			// 
			this.toolBarButton16.ImageIndex = 7;
			this.toolBarButton16.ToolTipText = "Save Texture";
			// 
			// panel12
			// 
			this.panel12.BackColor = System.Drawing.Color.Gray;
			this.panel12.Dock = System.Windows.Forms.DockStyle.Top;
			this.panel12.Location = new System.Drawing.Point(1, 0);
			this.panel12.Name = "panel12";
			this.panel12.Size = new System.Drawing.Size(499, 1);
			this.panel12.TabIndex = 4;
			// 
			// panel11
			// 
			this.panel11.BackColor = System.Drawing.Color.Gray;
			this.panel11.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.panel11.Location = new System.Drawing.Point(1, 312);
			this.panel11.Name = "panel11";
			this.panel11.Size = new System.Drawing.Size(499, 1);
			this.panel11.TabIndex = 3;
			// 
			// panel10
			// 
			this.panel10.BackColor = System.Drawing.Color.Gray;
			this.panel10.Dock = System.Windows.Forms.DockStyle.Right;
			this.panel10.Location = new System.Drawing.Point(500, 0);
			this.panel10.Name = "panel10";
			this.panel10.Size = new System.Drawing.Size(1, 313);
			this.panel10.TabIndex = 2;
			// 
			// panel9
			// 
			this.panel9.BackColor = System.Drawing.Color.Gray;
			this.panel9.Dock = System.Windows.Forms.DockStyle.Left;
			this.panel9.Name = "panel9";
			this.panel9.Size = new System.Drawing.Size(1, 313);
			this.panel9.TabIndex = 1;
			// 
			// columnHeader3
			// 
			this.columnHeader3.Text = "No.";
			this.columnHeader3.Width = 29;
			// 
			// Name
			// 
			this.Name.Text = "Name";
			this.Name.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.Name.Width = 100;
			// 
			// Mesh
			// 
			this.Mesh.Text = "Mesh";
			this.Mesh.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			// 
			// Render
			// 
			this.Render.Text = "Render";
			this.Render.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			// 
			// columnHeader2
			// 
			this.columnHeader2.Text = "Parent";
			this.columnHeader2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.columnHeader2.Width = 100;
			// 
			// Vertex
			// 
			this.Vertex.Text = "Vertex";
			this.Vertex.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.Vertex.Width = 90;
			// 
			// Index
			// 
			this.Index.Text = "Index";
			this.Index.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.Index.Width = 90;
			// 
			// Tex1
			// 
			this.Tex1.Text = "Texture1";
			this.Tex1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
			this.Tex1.Width = 90;
			// 
			// ofd
			// 
			this.ofd.DefaultExt = "x";
			this.ofd.Multiselect = true;
			// 
			// sfd
			// 
			this.sfd.FileName = "doc1";
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 14);
			this.BackColor = System.Drawing.Color.Ivory;
			this.ClientSize = new System.Drawing.Size(712, 489);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.panel5,
																		  this.splitter2,
																		  this.panel4,
																		  this.splitter1,
																		  this.panel3,
																		  this.panel2,
																		  this.panel1,
																		  this.toolBarMain,
																		  this.statusBar1});
			this.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.Menu = this.mainMenu1;
			//this.Name = "Form1";
			this.Text = "Form1";
			((System.ComponentModel.ISupportInitialize)(this.statusBarPanel1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.statusBarPanel2)).EndInit();
			this.panel3.ResumeLayout(false);
			this.panel7.ResumeLayout(false);
			this.tabControl1.ResumeLayout(false);
			this.tabPage1.ResumeLayout(false);
			this.tabPage2.ResumeLayout(false);
			this.tabPage3.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.dgProp)).EndInit();
			this.panel8.ResumeLayout(false);
			this.panel6.ResumeLayout(false);
			this.panel4.ResumeLayout(false);
			this.panel5.ResumeLayout(false);
			this.tabControl2.ResumeLayout(false);
			this.tabPage4.ResumeLayout(false);
			this.tabPage5.ResumeLayout(false);
			this.tabPage6.ResumeLayout(false);
			this.tabPage7.ResumeLayout(false);
			this.tabPage8.ResumeLayout(false);
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

		// programmer define method
		private DataSet myDataSet;

		private void updateFrameView()
		{
			try
			{
				if (app.Base==null)
				{
					MessageBox.Show("Plaese create base model first.");
					return;
				}

				lvFrames.Items.Clear();

				for (int i=0; i<app.Base.Frames.Count; i++)
				{
					Frame frame = (Frame)app.Base.Frames[i];
					lvFrames.Items.Add(i.ToString());
					lvFrames.Items[i].SubItems.Add(frame.Name);
					lvFrames.Items[i].SubItems.Add(frame.Mesh.ToString());
					lvFrames.Items[i].SubItems.Add(frame.Render.ToString());

					if (frame.Parent==null)
						lvFrames.Items[i].SubItems.Add("");
					else
						lvFrames.Items[i].SubItems.Add(frame.Parent.Name);

					if (frame.Position.Length>0)
						lvFrames.Items[i].SubItems.Add(frame.Position.Length.ToString());
					else
						lvFrames.Items[i].SubItems.Add("");

					int size = 0;
					for (int j=0; j<frame.Index.Length; j++)
						size+= frame.Index[j].Length;
					if (size>0)
						lvFrames.Items[i].SubItems.Add(size.ToString());
					else
						lvFrames.Items[i].SubItems.Add("");

					if (frame.TexCoord1.Length>0)
						lvFrames.Items[i].SubItems.Add("Yes");
				}
			}
			catch (Exception ex)
			{

			}
		}

		private void updateMtrlView()
		{
			try
			{
				if (app.Base==null)
				{
					MessageBox.Show("Plaese create base model first.");
					return;
				}

				lvMtrls.Items.Clear();

				MtrlSet	ms;
				for (int i=0; i<app.Base.Mtrls.Count; i++)
				{
					ms = (MtrlSet)app.Base.Mtrls[i];
					lvMtrls.Items.Add(ms.name);
					lvMtrls.Items[i].SubItems.Add(ms.mtrlkeys.Count.ToString());
				}
			}
			catch (Exception ex)
			{
			}
		}

		private void updateAnimView()
		{
			try
			{
				if (app.Base==null)
				{
					MessageBox.Show("Plaese create base model first.");
					return;
				}

				lvAnim.Items.Clear();

				Anime	an;
				for (int i=0; i<app.Base.Animes.Count; i++)
				{
					an = (Anime)app.Base.Animes[i];

					lvAnim.Items.Add(an.Name);
					lvAnim.Items[i].SubItems.Add(an.Sets.Count.ToString());
					lvAnim.Items[i].SubItems.Add("");
					lvAnim.Items[i].SubItems.Add("");
				}
			}
			catch (Exception ex)
			{

			}
		}

		private void updateDetectView()
		{
			try
			{
				if (app.Base==null)
				{
					MessageBox.Show("Plaese create base model first.");
					return;
				}

				lvDetect.Items.Clear();

				colliser cs;
				for (int i=0; i<app.Base.Colliser.Count; i++)
				{
					cs	= (colliser)app.Base.Colliser[i];
					lvDetect.Items.Add(cs.name);
					
					switch (cs.type)
					{
						case 0:
							lvDetect.Items[i].SubItems.Add("Ground");
							break;
						case 1:
							lvDetect.Items[i].SubItems.Add("Wall");
							break;
						case 2:
							lvDetect.Items[i].SubItems.Add("Cylinder");
							break;
						case 3:
							lvDetect.Items[i].SubItems.Add("Sphere");
							break;
					}

					lvDetect.Items[i].SubItems.Add("0");
					lvDetect.Items[i].SubItems.Add(cs.parent);
				}
			}
			catch (Exception ex)
			{
				
			}
		}

		private void updateTextureView()
		{
			try
			{
				lvTextures.Items.Clear();

				Data2D d2;
				for (int i=0; i<app.Textures.Count; i++)
				{
					d2	= (Data2D)app.Textures[i];
					lvTextures.Items.Add(d2.Name);
					lvTextures.Items[i].SubItems.Add(d2.Images.Count.ToString());
					lvTextures.Items[i].SubItems.Add(d2.FPS.ToString());
					lvTextures.Items[i].SubItems.Add(d2.Filename);
				}
			}
			catch (Exception ex)
			{

			}
		}

		private void updateResourceChild(TreeNode root)
		{
			try
			{
				int i;
				// update res3d
				TreeNode d3d = new TreeNode("Data 3D");
				root.Nodes.Add(d3d);
				for (i=0; i<app.Data3DList.Count; i++)
				{
					Data3D	temp	= (Data3D)app.Data3DList[i];
					d3d.Nodes.Add(new TreeNode(temp.Name));
				}
				// updata res2d
				TreeNode d2d = new TreeNode("Data 2D");
				root.Nodes.Add(d2d);
				for (i=0; i<app.Data2DList.Count; i++)
				{
					Data2D	temp	= (Data2D)app.Data2DList[i];
					d2d.Nodes.Add(new TreeNode(temp.Name));
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}
		private void updateResourceView()
		{
			try
			{
				tvResource.Update();
				tvResource.Nodes.Clear();
				TreeNode root = new TreeNode("Resource");
				tvResource.Nodes.Add(root);
				// Data3D
				updateResourceChild(root);
				tvResource.ExpandAll();
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}

		private void updateModelChild(Frame f, TreeNode t)
		{
			try
			{
				TreeNode tn	= new TreeNode(f.Name);
				if (t==null)
					tvModel.Nodes.Add(tn);
				else
				{
					t.Nodes.Add(tn);
				}

				for (int i=0; i<f.Child.Count; i++)
					updateModelChild((Frame)f.Child[i], tn);		
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}
		private void updateModelView()
		{
			try
			{
				tvModel.Update();
				tvModel.Nodes.Clear();
				Data3D model = (Data3D)app.Base;
				TreeNode tn	= new TreeNode(model.Name);
				tvModel.Nodes.Add(tn);
				for (int i=0; i<model.Frames.Count; i++)
				{
					Frame	f = (Frame)model.Frames[i];
					if (f.Parent==null)
						updateModelChild(f,tn);
				}
				tvModel.ExpandAll();
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}

		private DataSet CreateDataSet()
		{
			// DataSet
			DataSet ds	= new DataSet("TEST");

			
			DataTable dtFrame	= new DataTable("Frame");

			DataColumn dcFName	= new DataColumn("Attribute");
			DataColumn dcFValue	= new DataColumn("Value");
			dtFrame.Columns.Add(dcFName);
			dtFrame.Columns.Add(dcFValue);

			ds.Tables.Add(dtFrame);

			DataRow newRow1;
			//DataRow newRow2;

			// Create three customers in the Customers Table.
			if (app.Base==null)
				return ds;

			for(int i = 0; i < app.Base.Frames.Count; i++)
			{
				newRow1 = dtFrame.NewRow();
				newRow1[0] = "Name";
				newRow1[1] = ((Frame)app.Base.Frames[i]).Name;
				// Add the row to the Customers table.
				dtFrame.Rows.Add(newRow1);
			}
			return ds;
		}

		private void SetBase(object sender, System.EventArgs e)
		{
			// click on Menu Project>Set Base Model
			// Set select model as a base model

			try
			{
				// Set base model
				FormSetBase fsb	= new FormSetBase();
				fsb.Res3D	= app.Data3DList;
				fsb.Update();
				fsb.ShowDialog(this);
				if (fsb.Selected>=0)
				{
					app.SetBase(fsb.Selected);
					textOutput.AppendText("\r\nBase model set to: " + app.Base.Name);
					updateModelView();
					updateFrameView();
					updateMtrlView();
					updateAnimView();
					updateDetectView();
				}
				else
					textOutput.AppendText("\r\nBase model set cancel...");

				DataSet ds = CreateDataSet();
				dgProp.SetDataBinding(ds,"Frame");
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}

		private void AddRes3d(object sender, System.EventArgs e)
		{
			// click on menu File>Add Resource>Model 
			// Add X File model to resource
			try 
			{
				ofd.Filter = "x files (*.x)|*.x|All files (*.*)|*.*" ;
				ofd.FilterIndex = 1;
				ofd.Title = "Add Resource 3D from X Files";
				ofd.RestoreDirectory = true ;

				if(ofd.ShowDialog() == DialogResult.OK)
				{
					if (app.LoadData3D(ofd.FileNames))
					{
						for (int i=0; i<ofd.FileNames.Length; i++)
							textOutput.AppendText("\r\n" + ofd.FileNames[i] + " loading successfully...");
					}
					else
						textOutput.AppendText("\r\n" + ofd.FileName + " failed... ");
					updateResourceView();
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}

		private void AddRes2d(object sender, System.EventArgs e)
		{
			// click on menu File>Add Resource>Texture
			// Add DDS File texture to resource
			try
			{
				ofd.Filter = "dds files (*.dds)|*.dds|All files (*.*)|*.*" ;
				ofd.FilterIndex = 1;
				ofd.RestoreDirectory = true ;

				if(ofd.ShowDialog() == DialogResult.OK)
				{
					if (app.LoadData2D(ofd.FileNames))
					{
						for (int i=0; i<ofd.FileNames.Length; i++)
							textOutput.AppendText("\r\n" + ofd.FileNames[i] + " loading successfully...");
					}
					else
						textOutput.AppendText("\r\n" + ofd.FileName + " failed... ");
					updateResourceView();
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}

		private void MainTBClick(object sender, System.Windows.Forms.ToolBarButtonClickEventArgs e)
		{
			try
			{
				int i = toolBarMain.Buttons.IndexOf(e.Button);
				switch(toolBarMain.Buttons.IndexOf(e.Button))
				{
					case 0: // new project
					{
					
					}
						break;
					case 1:
					{

					}
						break;
					case 3: // add res 3d
					{
						AddRes3d(sender, e);
					}
						break;
					case 4: // add res 2d
					{
						AddRes2d(sender, e);
					}
						break;
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}

		private void TextureTBClick(object sender, System.Windows.Forms.ToolBarButtonClickEventArgs e)
		{
			// click on texture toolbar
			try
			{
				int i = tbTexture.Buttons.IndexOf(e.Button);
				switch(tbTexture.Buttons.IndexOf(e.Button))
				{
					case 0: // create texture
					{
						FormCreateTexture fct = new FormCreateTexture();
						fct.Res2D = app.Data2DList;
						fct.Update();
						fct.ShowDialog(this);
						
						for (int j=0; j<fct.Selected.Count; j++)
							app.AddTexture((int)fct.Selected[j]);
						updateTextureView();
					}
						break;
					case 1: // edit texture
					{
						FormEditTexture fet = new FormEditTexture();
						if (lvTextures.SelectedIndices.Count<=0)
							return;
						int sel = lvTextures.SelectedIndices[0];
						fet.Res2D = app.Data2DList;
						fet.SetData((Data2D)app.Textures[sel]);
						fet.ShowDialog(this);
						if (fet.Ok)
							app.Textures[sel] = fet.Texture;
						updateTextureView();
					}
						break;
					case 2: // save specific texture
					{
						if (lvTextures.SelectedIndices.Count<=0)
							return;
						int sel = lvTextures.SelectedIndices[0];
					 
						sfd.Filter = "TX2 files (*.tx2)|*.tx2" ;
						sfd.FilterIndex = 0;
						sfd.RestoreDirectory = true ;

						if(sfd.ShowDialog() == DialogResult.OK)
						{
							if (app.Textures[sel] != null)
							{
								if (((Data2D)app.Textures[sel]).ToTex(sfd.FileName))
									textOutput.AppendText("\r\n" + ((Data2D)app.Textures[sel]).Name + " is saved to " + sfd.FileName + " successfully..");
								else
									textOutput.AppendText("\r\n" + "error occurred when try to save " + ((Data2D)app.Textures[sel]).Name+ " to " + sfd.FileName + " file maybe illegal");
							}
							else
								textOutput.AppendText("\r\n" + "no texture to save");
						}
					}
						break;
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}

		private void MtrlTBClick(object sender, System.Windows.Forms.ToolBarButtonClickEventArgs e)
		{
			try
			{
				int i = tbMtrl.Buttons.IndexOf(e.Button);
				switch(tbMtrl.Buttons.IndexOf(e.Button))
				{
					case 0: // edit material
					{	
						if (lvMtrls.SelectedIndices.Count<=0)
							return;
						int sel = lvMtrls.SelectedIndices[0];
						if (sel<0)
							return;
						FormEditMtrl fem = new FormEditMtrl();
						fem.SetData((MtrlSet)app.Base.Mtrls[sel], app.Textures);
						fem.ShowDialog(this);

						updateMtrlView();
						
						if (fem.Ok)
						{
							app.Base.Mtrls[sel] = fem.Data;
						}
					}
						break;
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}

		private void AnimTBClick(object sender, System.Windows.Forms.ToolBarButtonClickEventArgs e)
		{
			try
			{
				int i = tbAnime.Buttons.IndexOf(e.Button);
				switch(tbAnime.Buttons.IndexOf(e.Button))
				{
					case 0: // edit material
					{	
						if (app.Base==null)
							return;
						FormAddAnime faa = new FormAddAnime();
						faa.Res3D = app.Data3DList;
						faa.UpdateList();
						faa.ShowDialog(this);

						if (faa.Selected!=null)
						{
							app.Base.Animes.Add(faa.Selected);
							textOutput.AppendText("\r\nAdd Animation : " + faa.Selected.Name + " to: " + app.Base.Name +" successfully..." );
						}
						else
							textOutput.AppendText("\r\nAdd Texture Coordinate Layer2 cancel...");
						updateAnimView();
					}
						break;
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}

		private void DetectTBClick(object sender, System.Windows.Forms.ToolBarButtonClickEventArgs e)
		{
			try
			{
				int i = tbDetector.Buttons.IndexOf(e.Button);
				switch(tbDetector.Buttons.IndexOf(e.Button))
				{
					case 0: // edit material
					{	
						if (app.Base==null)
							return;
						FormAddDetect fac = new FormAddDetect();
						fac.SetData(app.Base.Frames, app.Base.Colliser);
						fac.ShowDialog(this);
						if (fac.Ok)
							app.Base.Colliser = fac.Collide;
						updateDetectView();
					}
						break;
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.StackTrace);
			}
		}

		private void ViewChange(object sender, System.EventArgs e)
		{
			switch (tabControl2.SelectedIndex)
			{
				case 0:
					statusBar1.Panels[0].Text	= "Frame View";
					break;
				case 1:
					statusBar1.Panels[0].Text	= "Material View";
					break;
				case 2:
					statusBar1.Panels[0].Text	= "Animation View";
					break;
				case 3:
					statusBar1.Panels[0].Text	= "Collision Detector View";
					break;
				case 4:
					statusBar1.Panels[0].Text	= "Texture View";
					break;
			}
		}

		private void SaveModel(object sender, System.EventArgs e)
		{
			if (app.Base==null)
				return;
			sfd.Filter = "MD2 files (*.md2)|*.md2" ;
			sfd.FilterIndex = 0;
			sfd.RestoreDirectory = true ;

			if(sfd.ShowDialog() == DialogResult.OK)
			{
				if (app.Base != null)
				{
					if (app.Base.ToMD2(sfd.FileName))
						textOutput.AppendText("\r\n" + app.Base.Name + "is saved to " + sfd.FileName + " successfully..");
					else
						textOutput.AppendText("\r\n" + "error occurred when try to save " + app.Base.Name + " to " + sfd.FileName + " file maybe illegal");
				}
				else
					textOutput.AppendText("\r\n" + "no model to save");
			}
		}

		private void SaveAll(object sender, System.EventArgs e)
		{
			if (app.Base != null)
			{
				if (app.Base.ToMD2(app.Base.Name+".md2"))
					textOutput.AppendText("\r\n" + app.Base.Name + "is saved to " + sfd.FileName + " successfully..");
				else
					textOutput.AppendText("\r\n" + "error occurred when try to save " + app.Base.Name + " to " + sfd.FileName + " file maybe illegal");

				for (int i=0; i<app.Textures.Count; i++)
				{
					if (((Data2D)app.Textures[i]).ToTex(((Data2D)app.Textures[i]).Name+".tx2"))
						textOutput.AppendText("\r\n" + ((Data2D)app.Textures[i]).Name + "is saved successfully..");
					else
						textOutput.AppendText("\r\n" + "error occurred when try to save..");
				}
			}
			else
				textOutput.AppendText("\r\n" + "no model to save");
		}

		private void FrameTBClick(object sender, System.Windows.Forms.ToolBarButtonClickEventArgs e)
		{
			// Add layer2 texture
			FormAddLayer fat2 = new FormAddLayer();
			if (lvFrames.SelectedIndices.Count==0)
				return;

			int sel = lvFrames.SelectedIndices[0];
			
			if (sel<0)
			{
				MessageBox.Show(this,"must select any frame u want.","Error",MessageBoxButtons.OK);
				return;
			}

			if (app.Base == null)
			{
				MessageBox.Show(this,"Set base model first.","Error",MessageBoxButtons.OK);
				return;
			}

			Frame f    = (Frame)app.Base.Frames[sel];

			fat2.Res3D = app.Data3DList;
			fat2.UpdateList(f.Name);
			fat2.ShowDialog(this);
			if (fat2.Selected!=null)
			{
				f.TexCoord1 = fat2.Selected.TexCoord0;
				updateFrameView();
				textOutput.AppendText("\r\nAdd Texture Coordinate Layer2 to: " + app.Base.Name +"/" + f.Name);
			}
			else
				textOutput.AppendText("\r\nAdd Texture Coordinate Layer2 cancel...");
		}
	}
}
