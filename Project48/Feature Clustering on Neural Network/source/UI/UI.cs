using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using bp_nnet;
using k_medoid;

namespace UI
{
	/// <summary>
	/// Summary description for UI.
	/// </summary>
	public class UI : System.Windows.Forms.Form
	{
		private DataSet	dataDs		= new DataSet(),
						testDs		= new DataSet(),
						trainDs		= new DataSet(),
						weightDs	= new DataSet();
		private BPN		nnet = new BPN();

		private bool	train = true;

		private System.Windows.Forms.TabControl tabBook;
		private System.Windows.Forms.TabPage tabDataSet;
		private System.Windows.Forms.TextBox DataSetTxt;
		private System.Windows.Forms.Button DataSetBtn;
		private System.Windows.Forms.ListBox DataSetList;
		private System.Windows.Forms.DataGrid DataSetGrid;
		private System.Windows.Forms.OpenFileDialog OpenFile;
		private System.Windows.Forms.TabPage tabNN;
		private System.Windows.Forms.TabControl tabMark;
		private System.Windows.Forms.GroupBox NNGroup;
		private System.Windows.Forms.NumericUpDown SseNum;
		private System.Windows.Forms.NumericUpDown EpochNum;
		private System.Windows.Forms.Button TestBtn;
		private System.Windows.Forms.Button TrainBtn;
		private System.Windows.Forms.Label initEpochLbl;
		private System.Windows.Forms.Label initLearnLbl;
		private System.Windows.Forms.Label initSseLbl;
		private System.Windows.Forms.NumericUpDown LearningNum;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.TabPage tabActive;
		private System.Windows.Forms.TabPage tabWeight;
		private System.Windows.Forms.DataGrid WeightGrid;
		private System.Windows.Forms.TextBox WeightTxt;
		private System.Windows.Forms.Button SaveBtn;
		private System.Windows.Forms.Button LoadBtn;
		private System.Windows.Forms.ListBox WeightList;
		private System.Windows.Forms.SaveFileDialog SaveFile;
		private System.Windows.Forms.Button NewTxt;
		private System.Windows.Forms.ListBox ActiveList;
		private System.Windows.Forms.DataGrid ActiveGrid;
		private System.Windows.Forms.TabPage tabCluster;
		private System.Windows.Forms.DataGrid ClusterGrid;
		private System.Windows.Forms.Button ClusterBtn;
		private System.Windows.Forms.NumericUpDown HiddenNum;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.NumericUpDown KNum;
		private System.Windows.Forms.Button ClusterNetBtn;
		private System.ComponentModel.Container components = null;
		/// <summary>
		/// Required designer variable.
		/// </summary>

		public UI()
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
			if ( disposing )
			{
				if ( components != null )
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
			this.tabBook = new System.Windows.Forms.TabControl();
			this.tabDataSet = new System.Windows.Forms.TabPage();
			this.DataSetGrid = new System.Windows.Forms.DataGrid();
			this.DataSetList = new System.Windows.Forms.ListBox();
			this.DataSetBtn = new System.Windows.Forms.Button();
			this.DataSetTxt = new System.Windows.Forms.TextBox();
			this.tabNN = new System.Windows.Forms.TabPage();
			this.tabMark = new System.Windows.Forms.TabControl();
			this.tabWeight = new System.Windows.Forms.TabPage();
			this.WeightList = new System.Windows.Forms.ListBox();
			this.WeightGrid = new System.Windows.Forms.DataGrid();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.WeightTxt = new System.Windows.Forms.TextBox();
			this.SaveBtn = new System.Windows.Forms.Button();
			this.LoadBtn = new System.Windows.Forms.Button();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.label2 = new System.Windows.Forms.Label();
			this.HiddenNum = new System.Windows.Forms.NumericUpDown();
			this.NewTxt = new System.Windows.Forms.Button();
			this.tabActive = new System.Windows.Forms.TabPage();
			this.ActiveList = new System.Windows.Forms.ListBox();
			this.ActiveGrid = new System.Windows.Forms.DataGrid();
			this.NNGroup = new System.Windows.Forms.GroupBox();
			this.SseNum = new System.Windows.Forms.NumericUpDown();
			this.EpochNum = new System.Windows.Forms.NumericUpDown();
			this.TestBtn = new System.Windows.Forms.Button();
			this.TrainBtn = new System.Windows.Forms.Button();
			this.initEpochLbl = new System.Windows.Forms.Label();
			this.initLearnLbl = new System.Windows.Forms.Label();
			this.initSseLbl = new System.Windows.Forms.Label();
			this.LearningNum = new System.Windows.Forms.NumericUpDown();
			this.tabCluster = new System.Windows.Forms.TabPage();
			this.ClusterNetBtn = new System.Windows.Forms.Button();
			this.KNum = new System.Windows.Forms.NumericUpDown();
			this.label1 = new System.Windows.Forms.Label();
			this.ClusterBtn = new System.Windows.Forms.Button();
			this.ClusterGrid = new System.Windows.Forms.DataGrid();
			this.OpenFile = new System.Windows.Forms.OpenFileDialog();
			this.SaveFile = new System.Windows.Forms.SaveFileDialog();
			this.tabBook.SuspendLayout();
			this.tabDataSet.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.DataSetGrid)).BeginInit();
			this.tabNN.SuspendLayout();
			this.tabMark.SuspendLayout();
			this.tabWeight.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.WeightGrid)).BeginInit();
			this.groupBox2.SuspendLayout();
			this.groupBox1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.HiddenNum)).BeginInit();
			this.tabActive.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.ActiveGrid)).BeginInit();
			this.NNGroup.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.SseNum)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.EpochNum)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.LearningNum)).BeginInit();
			this.tabCluster.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.KNum)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.ClusterGrid)).BeginInit();
			this.SuspendLayout();
			// 
			// tabBook
			// 
			this.tabBook.Controls.Add(this.tabDataSet);
			this.tabBook.Controls.Add(this.tabNN);
			this.tabBook.Controls.Add(this.tabCluster);
			this.tabBook.Location = new System.Drawing.Point(0, 0);
			this.tabBook.Name = "tabBook";
			this.tabBook.SelectedIndex = 0;
			this.tabBook.Size = new System.Drawing.Size(555, 395);
			this.tabBook.TabIndex = 0;
			// 
			// tabDataSet
			// 
			this.tabDataSet.Controls.Add(this.DataSetGrid);
			this.tabDataSet.Controls.Add(this.DataSetList);
			this.tabDataSet.Controls.Add(this.DataSetBtn);
			this.tabDataSet.Controls.Add(this.DataSetTxt);
			this.tabDataSet.Location = new System.Drawing.Point(4, 22);
			this.tabDataSet.Name = "tabDataSet";
			this.tabDataSet.Size = new System.Drawing.Size(547, 369);
			this.tabDataSet.TabIndex = 0;
			this.tabDataSet.Text = "DataSet";
			// 
			// DataSetGrid
			// 
			this.DataSetGrid.CaptionFont = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
			this.DataSetGrid.DataMember = "";
			this.DataSetGrid.HeaderForeColor = System.Drawing.SystemColors.ControlText;
			this.DataSetGrid.Location = new System.Drawing.Point(8, 72);
			this.DataSetGrid.Name = "DataSetGrid";
			this.DataSetGrid.ReadOnly = true;
			this.DataSetGrid.Size = new System.Drawing.Size(536, 288);
			this.DataSetGrid.TabIndex = 4;
			// 
			// DataSetList
			// 
			this.DataSetList.Location = new System.Drawing.Point(464, 8);
			this.DataSetList.Name = "DataSetList";
			this.DataSetList.Size = new System.Drawing.Size(75, 56);
			this.DataSetList.TabIndex = 3;
			this.DataSetList.SelectedIndexChanged += new System.EventHandler(this.DataSetList_SelectedIndexChanged);
			// 
			// DataSetBtn
			// 
			this.DataSetBtn.Location = new System.Drawing.Point(384, 40);
			this.DataSetBtn.Name = "DataSetBtn";
			this.DataSetBtn.Size = new System.Drawing.Size(75, 25);
			this.DataSetBtn.TabIndex = 2;
			this.DataSetBtn.Text = "Browse";
			this.DataSetBtn.Click += new System.EventHandler(this.DataSetBtn_Click);
			// 
			// DataSetTxt
			// 
			this.DataSetTxt.Location = new System.Drawing.Point(8, 8);
			this.DataSetTxt.Name = "DataSetTxt";
			this.DataSetTxt.Size = new System.Drawing.Size(448, 20);
			this.DataSetTxt.TabIndex = 1;
			this.DataSetTxt.Text = "";
			// 
			// tabNN
			// 
			this.tabNN.Controls.Add(this.tabMark);
			this.tabNN.Location = new System.Drawing.Point(4, 22);
			this.tabNN.Name = "tabNN";
			this.tabNN.Size = new System.Drawing.Size(547, 369);
			this.tabNN.TabIndex = 1;
			this.tabNN.Text = "Neural Network";
			// 
			// tabMark
			// 
			this.tabMark.Controls.Add(this.tabWeight);
			this.tabMark.Controls.Add(this.tabActive);
			this.tabMark.Location = new System.Drawing.Point(0, 0);
			this.tabMark.Name = "tabMark";
			this.tabMark.SelectedIndex = 0;
			this.tabMark.Size = new System.Drawing.Size(560, 384);
			this.tabMark.TabIndex = 0;
			// 
			// tabWeight
			// 
			this.tabWeight.Controls.Add(this.WeightList);
			this.tabWeight.Controls.Add(this.WeightGrid);
			this.tabWeight.Controls.Add(this.groupBox2);
			this.tabWeight.Controls.Add(this.groupBox1);
			this.tabWeight.Location = new System.Drawing.Point(4, 22);
			this.tabWeight.Name = "tabWeight";
			this.tabWeight.Size = new System.Drawing.Size(552, 358);
			this.tabWeight.TabIndex = 1;
			this.tabWeight.Text = "Weight";
			// 
			// WeightList
			// 
			this.WeightList.Location = new System.Drawing.Point(456, 128);
			this.WeightList.Name = "WeightList";
			this.WeightList.Size = new System.Drawing.Size(80, 212);
			this.WeightList.TabIndex = 22;
			this.WeightList.SelectedIndexChanged += new System.EventHandler(this.WeightList_SelectedIndexChanged);
			// 
			// WeightGrid
			// 
			this.WeightGrid.DataMember = "";
			this.WeightGrid.HeaderForeColor = System.Drawing.SystemColors.ControlText;
			this.WeightGrid.Location = new System.Drawing.Point(8, 128);
			this.WeightGrid.Name = "WeightGrid";
			this.WeightGrid.ReadOnly = true;
			this.WeightGrid.Size = new System.Drawing.Size(440, 216);
			this.WeightGrid.TabIndex = 21;
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.Add(this.WeightTxt);
			this.groupBox2.Controls.Add(this.SaveBtn);
			this.groupBox2.Controls.Add(this.LoadBtn);
			this.groupBox2.Location = new System.Drawing.Point(8, 8);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(288, 112);
			this.groupBox2.TabIndex = 20;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Weights";
			// 
			// WeightTxt
			// 
			this.WeightTxt.Location = new System.Drawing.Point(16, 24);
			this.WeightTxt.Name = "WeightTxt";
			this.WeightTxt.Size = new System.Drawing.Size(256, 20);
			this.WeightTxt.TabIndex = 20;
			this.WeightTxt.Text = "";
			// 
			// SaveBtn
			// 
			this.SaveBtn.Location = new System.Drawing.Point(200, 72);
			this.SaveBtn.Name = "SaveBtn";
			this.SaveBtn.TabIndex = 19;
			this.SaveBtn.Text = "Save";
			this.SaveBtn.Click += new System.EventHandler(this.SaveBtn_Click);
			// 
			// LoadBtn
			// 
			this.LoadBtn.Location = new System.Drawing.Point(16, 72);
			this.LoadBtn.Name = "LoadBtn";
			this.LoadBtn.TabIndex = 16;
			this.LoadBtn.Text = "Load";
			this.LoadBtn.Click += new System.EventHandler(this.LoadBtn_Click);
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.label2);
			this.groupBox1.Controls.Add(this.HiddenNum);
			this.groupBox1.Controls.Add(this.NewTxt);
			this.groupBox1.Location = new System.Drawing.Point(304, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(232, 112);
			this.groupBox1.TabIndex = 18;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "New Network";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(32, 24);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(80, 23);
			this.label2.TabIndex = 12;
			this.label2.Text = "Hidden Size : ";
			this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			// 
			// HiddenNum
			// 
			this.HiddenNum.Location = new System.Drawing.Point(112, 24);
			this.HiddenNum.Minimum = new System.Decimal(new int[] {
																	  2,
																	  0,
																	  0,
																	  0});
			this.HiddenNum.Name = "HiddenNum";
			this.HiddenNum.Size = new System.Drawing.Size(100, 20);
			this.HiddenNum.TabIndex = 13;
			this.HiddenNum.Value = new System.Decimal(new int[] {
																	2,
																	0,
																	0,
																	0});
			// 
			// NewTxt
			// 
			this.NewTxt.Location = new System.Drawing.Point(80, 72);
			this.NewTxt.Name = "NewTxt";
			this.NewTxt.Size = new System.Drawing.Size(80, 23);
			this.NewTxt.TabIndex = 15;
			this.NewTxt.Text = "New Network";
			this.NewTxt.Click += new System.EventHandler(this.NewTxt_Click);
			// 
			// tabActive
			// 
			this.tabActive.Controls.Add(this.ActiveList);
			this.tabActive.Controls.Add(this.ActiveGrid);
			this.tabActive.Controls.Add(this.NNGroup);
			this.tabActive.Location = new System.Drawing.Point(4, 22);
			this.tabActive.Name = "tabActive";
			this.tabActive.Size = new System.Drawing.Size(552, 358);
			this.tabActive.TabIndex = 0;
			this.tabActive.Text = "Active";
			// 
			// ActiveList
			// 
			this.ActiveList.Location = new System.Drawing.Point(456, 8);
			this.ActiveList.Name = "ActiveList";
			this.ActiveList.Size = new System.Drawing.Size(72, 134);
			this.ActiveList.TabIndex = 19;
			this.ActiveList.SelectedIndexChanged += new System.EventHandler(this.ActiveList_SelectedIndexChanged);
			// 
			// ActiveGrid
			// 
			this.ActiveGrid.DataMember = "";
			this.ActiveGrid.HeaderForeColor = System.Drawing.SystemColors.ControlText;
			this.ActiveGrid.Location = new System.Drawing.Point(16, 152);
			this.ActiveGrid.Name = "ActiveGrid";
			this.ActiveGrid.ReadOnly = true;
			this.ActiveGrid.Size = new System.Drawing.Size(520, 192);
			this.ActiveGrid.TabIndex = 18;
			// 
			// NNGroup
			// 
			this.NNGroup.Controls.Add(this.SseNum);
			this.NNGroup.Controls.Add(this.EpochNum);
			this.NNGroup.Controls.Add(this.TestBtn);
			this.NNGroup.Controls.Add(this.TrainBtn);
			this.NNGroup.Controls.Add(this.initEpochLbl);
			this.NNGroup.Controls.Add(this.initLearnLbl);
			this.NNGroup.Controls.Add(this.initSseLbl);
			this.NNGroup.Controls.Add(this.LearningNum);
			this.NNGroup.Location = new System.Drawing.Point(11, 7);
			this.NNGroup.Name = "NNGroup";
			this.NNGroup.Size = new System.Drawing.Size(232, 136);
			this.NNGroup.TabIndex = 16;
			this.NNGroup.TabStop = false;
			this.NNGroup.Text = "Network Setting";
			// 
			// SseNum
			// 
			this.SseNum.DecimalPlaces = 5;
			this.SseNum.Increment = new System.Decimal(new int[] {
																	 1,
																	 0,
																	 0,
																	 65536});
			this.SseNum.Location = new System.Drawing.Point(120, 72);
			this.SseNum.Name = "SseNum";
			this.SseNum.Size = new System.Drawing.Size(100, 20);
			this.SseNum.TabIndex = 16;
			this.SseNum.Value = new System.Decimal(new int[] {
																 1,
																 0,
																 0,
																 65536});
			// 
			// EpochNum
			// 
			this.EpochNum.Location = new System.Drawing.Point(120, 24);
			this.EpochNum.Maximum = new System.Decimal(new int[] {
																	 100000,
																	 0,
																	 0,
																	 0});
			this.EpochNum.Name = "EpochNum";
			this.EpochNum.Size = new System.Drawing.Size(100, 20);
			this.EpochNum.TabIndex = 14;
			this.EpochNum.Value = new System.Decimal(new int[] {
																   5000,
																   0,
																   0,
																   0});
			// 
			// TestBtn
			// 
			this.TestBtn.Location = new System.Drawing.Point(128, 104);
			this.TestBtn.Name = "TestBtn";
			this.TestBtn.Size = new System.Drawing.Size(96, 23);
			this.TestBtn.TabIndex = 10;
			this.TestBtn.Text = "Test";
			this.TestBtn.Click += new System.EventHandler(this.TestBtn_Click);
			// 
			// TrainBtn
			// 
			this.TrainBtn.Location = new System.Drawing.Point(8, 104);
			this.TrainBtn.Name = "TrainBtn";
			this.TrainBtn.Size = new System.Drawing.Size(96, 23);
			this.TrainBtn.TabIndex = 7;
			this.TrainBtn.Text = "Train";
			this.TrainBtn.Click += new System.EventHandler(this.TrainBtn_Click);
			// 
			// initEpochLbl
			// 
			this.initEpochLbl.Location = new System.Drawing.Point(16, 24);
			this.initEpochLbl.Name = "initEpochLbl";
			this.initEpochLbl.Size = new System.Drawing.Size(104, 23);
			this.initEpochLbl.TabIndex = 5;
			this.initEpochLbl.Text = "Epochs : ";
			this.initEpochLbl.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			// 
			// initLearnLbl
			// 
			this.initLearnLbl.Location = new System.Drawing.Point(16, 48);
			this.initLearnLbl.Name = "initLearnLbl";
			this.initLearnLbl.Size = new System.Drawing.Size(104, 23);
			this.initLearnLbl.TabIndex = 4;
			this.initLearnLbl.Text = "Learning Rate : ";
			this.initLearnLbl.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			// 
			// initSseLbl
			// 
			this.initSseLbl.Location = new System.Drawing.Point(16, 72);
			this.initSseLbl.Name = "initSseLbl";
			this.initSseLbl.Size = new System.Drawing.Size(104, 23);
			this.initSseLbl.TabIndex = 8;
			this.initSseLbl.Text = "sse : ";
			this.initSseLbl.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			// 
			// LearningNum
			// 
			this.LearningNum.DecimalPlaces = 3;
			this.LearningNum.Increment = new System.Decimal(new int[] {
																		  1,
																		  0,
																		  0,
																		  131072});
			this.LearningNum.Location = new System.Drawing.Point(120, 48);
			this.LearningNum.Maximum = new System.Decimal(new int[] {
																		1569325056,
																		23283064,
																		0,
																		0});
			this.LearningNum.Name = "LearningNum";
			this.LearningNum.Size = new System.Drawing.Size(100, 20);
			this.LearningNum.TabIndex = 15;
			this.LearningNum.Value = new System.Decimal(new int[] {
																	  1,
																	  0,
																	  0,
																	  65536});
			// 
			// tabCluster
			// 
			this.tabCluster.Controls.Add(this.ClusterNetBtn);
			this.tabCluster.Controls.Add(this.KNum);
			this.tabCluster.Controls.Add(this.label1);
			this.tabCluster.Controls.Add(this.ClusterBtn);
			this.tabCluster.Controls.Add(this.ClusterGrid);
			this.tabCluster.Location = new System.Drawing.Point(4, 22);
			this.tabCluster.Name = "tabCluster";
			this.tabCluster.Size = new System.Drawing.Size(547, 369);
			this.tabCluster.TabIndex = 2;
			this.tabCluster.Text = "Cluster";
			// 
			// ClusterNetBtn
			// 
			this.ClusterNetBtn.Location = new System.Drawing.Point(432, 8);
			this.ClusterNetBtn.Name = "ClusterNetBtn";
			this.ClusterNetBtn.Size = new System.Drawing.Size(96, 23);
			this.ClusterNetBtn.TabIndex = 4;
			this.ClusterNetBtn.Text = "Cluster Network";
			this.ClusterNetBtn.Click += new System.EventHandler(this.ClusterNetBtn_Click);
			// 
			// KNum
			// 
			this.KNum.Location = new System.Drawing.Point(32, 8);
			this.KNum.Minimum = new System.Decimal(new int[] {
																 1,
																 0,
																 0,
																 0});
			this.KNum.Name = "KNum";
			this.KNum.Size = new System.Drawing.Size(64, 20);
			this.KNum.TabIndex = 3;
			this.KNum.Value = new System.Decimal(new int[] {
															   1,
															   0,
															   0,
															   0});
			this.KNum.ValueChanged += new System.EventHandler(this.KNum_ValueChanged);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(24, 23);
			this.label1.TabIndex = 2;
			this.label1.Text = "K :";
			this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			// 
			// ClusterBtn
			// 
			this.ClusterBtn.Enabled = false;
			this.ClusterBtn.Location = new System.Drawing.Point(104, 8);
			this.ClusterBtn.Name = "ClusterBtn";
			this.ClusterBtn.TabIndex = 1;
			this.ClusterBtn.Text = "Cluster";
			this.ClusterBtn.Click += new System.EventHandler(this.ClusterBtn_Click);
			// 
			// ClusterGrid
			// 
			this.ClusterGrid.DataMember = "";
			this.ClusterGrid.HeaderForeColor = System.Drawing.SystemColors.ControlText;
			this.ClusterGrid.Location = new System.Drawing.Point(8, 40);
			this.ClusterGrid.Name = "ClusterGrid";
			this.ClusterGrid.ReadOnly = true;
			this.ClusterGrid.Size = new System.Drawing.Size(528, 320);
			this.ClusterGrid.TabIndex = 0;
			// 
			// SaveFile
			// 
			this.SaveFile.FileName = "doc1";
			// 
			// UI
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(552, 393);
			this.Controls.Add(this.tabBook);
			this.MaximizeBox = false;
			this.Name = "UI";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Cluster Neural Network";
			this.tabBook.ResumeLayout(false);
			this.tabDataSet.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.DataSetGrid)).EndInit();
			this.tabNN.ResumeLayout(false);
			this.tabMark.ResumeLayout(false);
			this.tabWeight.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.WeightGrid)).EndInit();
			this.groupBox2.ResumeLayout(false);
			this.groupBox1.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.HiddenNum)).EndInit();
			this.tabActive.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.ActiveGrid)).EndInit();
			this.NNGroup.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.SseNum)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.EpochNum)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.LearningNum)).EndInit();
			this.tabCluster.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.KNum)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.ClusterGrid)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run( new UI() );
		}

		private void map_List( System.Windows.Forms.ListBox List, DataSet ds )
		{
			for (int i=0; i<ds.Tables.Count; i++)
				List.Items.Add( ds.Tables[i].TableName );

			List.SelectedIndex = 0;
		}

		private void map_Grid( System.Windows.Forms.DataGrid Grid, System.Windows.Forms.ListBox List, DataSet ds )
		{
			Grid.CaptionText = "DataSet Name : " + ds.DataSetName;
			Grid.DataSource = ds.Tables[ List.SelectedItem.ToString() ];
		}

		private void DataSetBtn_Click(object sender, System.EventArgs e)
		{
			DataSetBtn.Enabled = false;
			//-----------------------//
			OpenFile.Multiselect = false;
			OpenFile.InitialDirectory = "./";
			OpenFile.Filter = "data xml files (*.dxml)|*.dxml";

			if ( OpenFile.ShowDialog() != System.Windows.Forms.DialogResult.Cancel )
			{				
				DataSetList.Items.Clear();
				dataDs.Reset();
				DataSetTxt.Text = OpenFile.FileName;
				try
				{
					dataDs.ReadXml( DataSetTxt.Text );
					map_List( DataSetList, dataDs );
				}
				catch ( Exception ee )
				{
					DataSetTxt.Text = "";
					DataSetGrid.DataSource = new DataTable();
					MessageBox.Show( ee.Source+"\n" + 
									ee.Message, "Neural Network" );
				}
			}
			//---------------------//
			DataSetBtn.Enabled = true;
		}

		private void DataSetList_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			map_Grid( DataSetGrid, DataSetList, dataDs );
		}

		private void LoadBtn_Click(object sender, System.EventArgs e)
		{
			LoadBtn.Enabled = false;
			OpenFile.Multiselect = false;
			OpenFile.InitialDirectory = "./";
			OpenFile.Filter = "wxml files (*.wxml)|*.wxml";

			if ( OpenFile.ShowDialog() != System.Windows.Forms.DialogResult.Cancel )
			{				
				WeightList.Items.Clear();
				weightDs.Reset();
				WeightTxt.Text = OpenFile.FileName;

				try
				{
					weightDs.ReadXml( WeightTxt.Text) ;
					HiddenNum.Value = weightDs.Tables[ "input2hidden" ].Columns.Count-1;

					nnet.SetDetail( dataDs, weightDs.Tables[ "input2hidden" ].Columns.Count-1 );
					nnet.SetInput2hidden( weightDs.Tables[ "input2hidden" ] );
					nnet.SetHidden2output( weightDs.Tables[ "hidden2output" ] );

					map_List( WeightList, weightDs );
				}
				catch ( Exception ee )
				{
					MessageBox.Show( "Error : Loading Network.\n" + 
									 ee.Message, "Neural Network");
				}
			}

			LoadBtn.Enabled = true;
		}

		private void WeightList_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			map_Grid(	WeightGrid,
						WeightList,	
						nnet.GetWeights() );
		}

		private void SaveBtn_Click(object sender, System.EventArgs e)
		{
			SaveFile.Filter = "weight xml files (*.wxml)|*.wxml";

			if ( SaveFile.ShowDialog() != System.Windows.Forms.DialogResult.Cancel )
			{
				WeightTxt.Text = SaveFile.FileName;
				nnet.GetWeights().WriteXml( WeightTxt.Text );
			}
		}

		private void NewTxt_Click(object sender, System.EventArgs e)
		{
			WeightTxt.Text = "";

			nnet.SetDetail(	dataDs,
							Convert.ToInt32( HiddenNum.Value ) );
			nnet.Initialize();

			WeightList.Items.Clear();

			map_List( WeightList, nnet.GetWeights() );
		}

		private void TrainBtn_Click(object sender, System.EventArgs e)
		{
			NNGroup.Enabled = false;
			train = true;

			nnet.SetCriterion(
								Convert.ToDouble( EpochNum.Value ),
								Convert.ToDouble( LearningNum.Value ),
								Convert.ToDouble( SseNum.Value ) );

			trainDs = nnet.Training();
			ActiveGrid.DataSource = trainDs;
			ActiveList.Items.Clear();

			map_List( ActiveList, trainDs );
			map_Grid( WeightGrid, WeightList, nnet.GetWeights() );

			NNGroup.Enabled = true;
		}

		private void TestBtn_Click(object sender, System.EventArgs e)
		{
			train = false;

			try
			{
				nnet.SetCriterion(
									Convert.ToDouble( EpochNum.Value ),
									Convert.ToDouble( LearningNum.Value ),
									Convert.ToDouble( SseNum.Value ) );

				testDs = nnet.Testing();
				ActiveGrid.DataSource = testDs;
				ActiveList.Items.Clear();

				map_List( ActiveList, testDs );
			}
			catch ( Exception ee )
			{
				MessageBox.Show( "Error : Testing Network.\n" + 
								ee.Message, "Neural Network" );
			}
		 }

		private void ActiveList_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			if ( train )
				map_Grid( ActiveGrid, ActiveList, trainDs );
			else
				map_Grid( ActiveGrid, ActiveList, testDs );
		}

		private void ClusterBtn_Click(object sender, System.EventArgs e)
		{
			DataTable tab = nnet.GetWeights().Tables[ "input2hidden" ];

			tab.Rows.RemoveAt( tab.Rows.Count - 1 );

			if ( Convert.ToInt32( KNum.Value ) < tab.Rows.Count )
			{
				tab = K_medoid.Cluster(	tab,
										Convert.ToInt32( KNum.Value ),
										"hidden ",
										tab.Columns.Count-1 );
				ClusterGrid.DataSource = tab;
			}
			else MessageBox.Show( "Error : Cluster Network.\n" +
									"number of Group is more than Feather" );
		}

		private void KNum_ValueChanged(object sender, System.EventArgs e)
		{
			DataTable tab = nnet.GetWeights().Tables[ "input2hidden" ];

			if ( (tab.Columns.Count-1) % Convert.ToInt32( KNum.Value ) != 0
				||KNum.Value == 1 )
				ClusterBtn.Enabled = false;
			else
				ClusterBtn.Enabled = true;

			ClusterGrid.DataSource = null;
		}

		private void ClusterNetBtn_Click(object sender, System.EventArgs e)
		{
			DataTable	tabSource = (DataTable)ClusterGrid.DataSource;
			if ( ClusterGrid.DataSource != null )
			{
				DataTable	tab = nnet.GetWeights().Tables[ "input2hidden" ];
				int kSize = ( tab.Columns.Count - 1 ) / Convert.ToInt32( KNum.Value );

				for (int i=0; i<tabSource.Rows.Count; i++)
					for (int j=0; j<KNum.Value; j++)
					{
						if ( tabSource.Rows[i][ "group" ].ToString() != j.ToString() )
						{
							int temp = (j+1) * kSize;
							for (int run = j*kSize; run<temp; run++)
								tabSource.Rows[i][ "hidden " + run.ToString() ] = 0;
						}
							//random new weight
						else 
						{
							int temp = (j+1) * kSize;
							for (int run = j*kSize; run<temp; run++)
								tabSource.Rows[i][ "hidden " + run.ToString() ] = Tools.getRnd( Convert.ToInt32( ( tabSource.Rows.Count-1 ) / KNum.Value ) );
						}
					}

				for (int i=0; i<tabSource.Rows.Count; i++)
					for (int j=0; j<tabSource.Columns.Count-1; j++)
						if ( tab.Columns[j].ColumnName != "name" )
							tab.Rows[i][j] = tabSource.Rows[i][j];

				nnet.Initialize();			//random new weight
				nnet.SetInput2hidden(tab);

				WeightList.Items.Clear();
				map_List( WeightList, nnet.GetWeights() );
			}
			ClusterGrid.DataSource = tabSource;
		}
	}
}