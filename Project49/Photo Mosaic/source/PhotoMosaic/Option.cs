using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Reflection;

namespace PhotoMosaic
{
	public class Option : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox group_Polygon;
		private System.Windows.Forms.RadioButton rad_hexagon;
		private System.Windows.Forms.RadioButton rad_rectangle;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.NumericUpDown num_NoTileWidth;
        private System.Windows.Forms.NumericUpDown num_NoTileHeight;
		private System.Windows.Forms.Button btn_OK;
		private System.Windows.Forms.Button btn_Cancel;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.TrackBar trkDistanceCell;
		private System.Windows.Forms.Button btn_OverView;
        private System.Windows.Forms.PictureBox picDistance;
		private System.Windows.Forms.CheckBox cck_distanceCell;
        private System.Windows.Forms.Label label5;
        private CheckBox cckMirror;
        private CheckBox cckRotate;
        private PictureBox picMirror;
        private PictureBox picNormal;
        private PictureBox pic270Degree;
        private PictureBox pic180Degree;
        private PictureBox pic90Degree;
        private PictureBox pic0Degree;
        private Button btnAdvance;
        private GroupBox groupWeight;
        private TrackBar trkError;
        private TrackBar trkWeight;
        private Label label8;
        private Label label10;
        private CheckBox chkColor;
        private Label label11;
        private Label label9;
        private Button btnDefault;
        private Button btnViewExample;
        private GroupBox groupExample;
        private CheckBox chkSplit;
        private PictureBox pictureBox1;
        private double rHexa;
        private Panel pnlMosaic;
		private System.ComponentModel.Container components = null;
        private bool isRoof;
        private bool isRectangle;
        private int width;
        private int height;
        
        public bool IsRoof
        {
            get
            {
                return isRoof;
            }
            set
            {
                isRoof = value;
            }
        }
        public bool IsRectangle 
        {
            get
            {
                return isRectangle;
            }
            set
            {
                isRectangle = value;
            }
        }

        public int Width
        {
            get
            {
                return width;
            }
            set
            {
                width = value;
            }
        }
        public int Height
        {
            get
            {
                return height;
            }
            set
            {
                height = value;
            }
        }
        public double RHexa
        {
            get
            {
                return rHexa;
            }
            set
            {
                rHexa = value;
            }
        }
		public Option()
		{
			InitializeComponent();
		}

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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Option));
            this.group_Polygon = new System.Windows.Forms.GroupBox();
            this.pnlMosaic = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.num_NoTileHeight = new System.Windows.Forms.NumericUpDown();
            this.num_NoTileWidth = new System.Windows.Forms.NumericUpDown();
            this.btnDefault = new System.Windows.Forms.Button();
            this.btn_OverView = new System.Windows.Forms.Button();
            this.rad_hexagon = new System.Windows.Forms.RadioButton();
            this.rad_rectangle = new System.Windows.Forms.RadioButton();
            this.btn_OK = new System.Windows.Forms.Button();
            this.btn_Cancel = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.chkSplit = new System.Windows.Forms.CheckBox();
            this.btnViewExample = new System.Windows.Forms.Button();
            this.chkColor = new System.Windows.Forms.CheckBox();
            this.btnAdvance = new System.Windows.Forms.Button();
            this.pic270Degree = new System.Windows.Forms.PictureBox();
            this.pic180Degree = new System.Windows.Forms.PictureBox();
            this.pic90Degree = new System.Windows.Forms.PictureBox();
            this.pic0Degree = new System.Windows.Forms.PictureBox();
            this.picMirror = new System.Windows.Forms.PictureBox();
            this.picNormal = new System.Windows.Forms.PictureBox();
            this.cckRotate = new System.Windows.Forms.CheckBox();
            this.cckMirror = new System.Windows.Forms.CheckBox();
            this.label5 = new System.Windows.Forms.Label();
            this.cck_distanceCell = new System.Windows.Forms.CheckBox();
            this.trkDistanceCell = new System.Windows.Forms.TrackBar();
            this.groupWeight = new System.Windows.Forms.GroupBox();
            this.label11 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.trkWeight = new System.Windows.Forms.TrackBar();
            this.trkError = new System.Windows.Forms.TrackBar();
            this.groupExample = new System.Windows.Forms.GroupBox();
            this.picDistance = new System.Windows.Forms.PictureBox();
            this.group_Polygon.SuspendLayout();
            this.pnlMosaic.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.num_NoTileHeight)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.num_NoTileWidth)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pic270Degree)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pic180Degree)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pic90Degree)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pic0Degree)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picMirror)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picNormal)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.trkDistanceCell)).BeginInit();
            this.groupWeight.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.trkWeight)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.trkError)).BeginInit();
            this.groupExample.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picDistance)).BeginInit();
            this.SuspendLayout();
            // 
            // group_Polygon
            // 
            this.group_Polygon.Controls.Add(this.pnlMosaic);
            this.group_Polygon.Controls.Add(this.btnDefault);
            this.group_Polygon.Controls.Add(this.btn_OverView);
            this.group_Polygon.Controls.Add(this.rad_hexagon);
            this.group_Polygon.Controls.Add(this.rad_rectangle);
            this.group_Polygon.Location = new System.Drawing.Point(12, 3);
            this.group_Polygon.Name = "group_Polygon";
            this.group_Polygon.Size = new System.Drawing.Size(264, 272);
            this.group_Polygon.TabIndex = 42;
            this.group_Polygon.TabStop = false;
            this.group_Polygon.Text = "Type of Polygon";
            // 
            // pnlMosaic
            // 
            this.pnlMosaic.Controls.Add(this.label1);
            this.pnlMosaic.Controls.Add(this.label2);
            this.pnlMosaic.Controls.Add(this.num_NoTileHeight);
            this.pnlMosaic.Controls.Add(this.num_NoTileWidth);
            this.pnlMosaic.Location = new System.Drawing.Point(10, 88);
            this.pnlMosaic.Name = "pnlMosaic";
            this.pnlMosaic.Size = new System.Drawing.Size(247, 100);
            this.pnlMosaic.TabIndex = 49;
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(3, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(131, 20);
            this.label1.TabIndex = 40;
            this.label1.Text = "Number of Tile in Width :";
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(3, 54);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(133, 20);
            this.label2.TabIndex = 41;
            this.label2.Text = "Number of Tile in Height :";
            // 
            // num_NoTileHeight
            // 
            this.num_NoTileHeight.Enabled = false;
            this.num_NoTileHeight.Location = new System.Drawing.Point(142, 54);
            this.num_NoTileHeight.Name = "num_NoTileHeight";
            this.num_NoTileHeight.Size = new System.Drawing.Size(72, 20);
            this.num_NoTileHeight.TabIndex = 43;
            this.num_NoTileHeight.Value = new decimal(new int[] {
            50,
            0,
            0,
            0});
            // 
            // num_NoTileWidth
            // 
            this.num_NoTileWidth.Enabled = false;
            this.num_NoTileWidth.Location = new System.Drawing.Point(143, 13);
            this.num_NoTileWidth.Name = "num_NoTileWidth";
            this.num_NoTileWidth.Size = new System.Drawing.Size(72, 20);
            this.num_NoTileWidth.TabIndex = 42;
            this.num_NoTileWidth.Value = new decimal(new int[] {
            50,
            0,
            0,
            0});
            // 
            // btnDefault
            // 
            this.btnDefault.Location = new System.Drawing.Point(162, 195);
            this.btnDefault.Name = "btnDefault";
            this.btnDefault.Size = new System.Drawing.Size(96, 23);
            this.btnDefault.TabIndex = 48;
            this.btnDefault.Text = "Value Default";
            this.btnDefault.UseVisualStyleBackColor = true;
            // 
            // btn_OverView
            // 
            this.btn_OverView.Location = new System.Drawing.Point(162, 234);
            this.btn_OverView.Name = "btn_OverView";
            this.btn_OverView.Size = new System.Drawing.Size(96, 24);
            this.btn_OverView.TabIndex = 47;
            this.btn_OverView.Text = "Over View";
            this.btn_OverView.Click += new System.EventHandler(this.btn_OverView_Click);
            // 
            // rad_hexagon
            // 
            this.rad_hexagon.Location = new System.Drawing.Point(23, 58);
            this.rad_hexagon.Name = "rad_hexagon";
            this.rad_hexagon.Size = new System.Drawing.Size(88, 24);
            this.rad_hexagon.TabIndex = 1;
            this.rad_hexagon.Text = "Hexagon";
            // 
            // rad_rectangle
            // 
            this.rad_rectangle.Checked = true;
            this.rad_rectangle.Location = new System.Drawing.Point(24, 32);
            this.rad_rectangle.Name = "rad_rectangle";
            this.rad_rectangle.Size = new System.Drawing.Size(88, 24);
            this.rad_rectangle.TabIndex = 0;
            this.rad_rectangle.TabStop = true;
            this.rad_rectangle.Text = "Rectangle";
            // 
            // btn_OK
            // 
            this.btn_OK.Location = new System.Drawing.Point(90, 532);
            this.btn_OK.Name = "btn_OK";
            this.btn_OK.Size = new System.Drawing.Size(96, 24);
            this.btn_OK.TabIndex = 44;
            this.btn_OK.Text = "OK";
            this.btn_OK.Click += new System.EventHandler(this.btn_OK_Click);
            // 
            // btn_Cancel
            // 
            this.btn_Cancel.Location = new System.Drawing.Point(202, 532);
            this.btn_Cancel.Name = "btn_Cancel";
            this.btn_Cancel.Size = new System.Drawing.Size(88, 24);
            this.btn_Cancel.TabIndex = 45;
            this.btn_Cancel.Text = "Cancel";
            this.btn_Cancel.Click += new System.EventHandler(this.btn_Cancel_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.pictureBox1);
            this.groupBox1.Controls.Add(this.chkSplit);
            this.groupBox1.Controls.Add(this.btnViewExample);
            this.groupBox1.Controls.Add(this.chkColor);
            this.groupBox1.Controls.Add(this.btnAdvance);
            this.groupBox1.Controls.Add(this.pic270Degree);
            this.groupBox1.Controls.Add(this.pic180Degree);
            this.groupBox1.Controls.Add(this.pic90Degree);
            this.groupBox1.Controls.Add(this.pic0Degree);
            this.groupBox1.Controls.Add(this.picMirror);
            this.groupBox1.Controls.Add(this.picNormal);
            this.groupBox1.Controls.Add(this.cckRotate);
            this.groupBox1.Controls.Add(this.cckMirror);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.cck_distanceCell);
            this.groupBox1.Controls.Add(this.trkDistanceCell);
            this.groupBox1.Location = new System.Drawing.Point(296, 3);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(283, 577);
            this.groupBox1.TabIndex = 46;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Cell Photo";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::ResizeImage.Properties.Resources.tile4tile;
            this.pictureBox1.Location = new System.Drawing.Point(28, 316);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(213, 73);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 64;
            this.pictureBox1.TabStop = false;
            // 
            // chkSplit
            // 
            this.chkSplit.AutoSize = true;
            this.chkSplit.Location = new System.Drawing.Point(20, 293);
            this.chkSplit.Name = "chkSplit";
            this.chkSplit.Size = new System.Drawing.Size(121, 17);
            this.chkSplit.TabIndex = 63;
            this.chkSplit.Text = "Split Cell photo Auto";
            this.chkSplit.UseVisualStyleBackColor = true;
            // 
            // btnViewExample
            // 
            this.btnViewExample.Location = new System.Drawing.Point(121, 530);
            this.btnViewExample.Name = "btnViewExample";
            this.btnViewExample.Size = new System.Drawing.Size(142, 23);
            this.btnViewExample.TabIndex = 62;
            this.btnViewExample.Text = "View Example >>";
            this.btnViewExample.UseVisualStyleBackColor = true;
            this.btnViewExample.Click += new System.EventHandler(this.btnViewExample_Click);
            // 
            // chkColor
            // 
            this.chkColor.AutoSize = true;
            this.chkColor.Location = new System.Drawing.Point(24, 39);
            this.chkColor.Name = "chkColor";
            this.chkColor.Size = new System.Drawing.Size(90, 17);
            this.chkColor.TabIndex = 61;
            this.chkColor.Text = "Change Color";
            this.chkColor.UseVisualStyleBackColor = true;
            this.chkColor.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // btnAdvance
            // 
            this.btnAdvance.Enabled = false;
            this.btnAdvance.Location = new System.Drawing.Point(182, 37);
            this.btnAdvance.Name = "btnAdvance";
            this.btnAdvance.Size = new System.Drawing.Size(75, 23);
            this.btnAdvance.TabIndex = 60;
            this.btnAdvance.Text = "Advance>>";
            this.btnAdvance.UseVisualStyleBackColor = true;
            this.btnAdvance.Click += new System.EventHandler(this.btnAdvance_Click);
            // 
            // pic270Degree
            // 
            this.pic270Degree.Enabled = false;
            this.pic270Degree.Image = ((System.Drawing.Image)(resources.GetObject("pic270Degree.Image")));
            this.pic270Degree.Location = new System.Drawing.Point(196, 227);
            this.pic270Degree.Name = "pic270Degree";
            this.pic270Degree.Size = new System.Drawing.Size(45, 45);
            this.pic270Degree.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pic270Degree.TabIndex = 56;
            this.pic270Degree.TabStop = false;
            // 
            // pic180Degree
            // 
            this.pic180Degree.Enabled = false;
            this.pic180Degree.Image = ((System.Drawing.Image)(resources.GetObject("pic180Degree.Image")));
            this.pic180Degree.Location = new System.Drawing.Point(146, 227);
            this.pic180Degree.Name = "pic180Degree";
            this.pic180Degree.Size = new System.Drawing.Size(45, 45);
            this.pic180Degree.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pic180Degree.TabIndex = 55;
            this.pic180Degree.TabStop = false;
            // 
            // pic90Degree
            // 
            this.pic90Degree.Enabled = false;
            this.pic90Degree.Image = ((System.Drawing.Image)(resources.GetObject("pic90Degree.Image")));
            this.pic90Degree.Location = new System.Drawing.Point(96, 227);
            this.pic90Degree.Name = "pic90Degree";
            this.pic90Degree.Size = new System.Drawing.Size(45, 45);
            this.pic90Degree.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pic90Degree.TabIndex = 54;
            this.pic90Degree.TabStop = false;
            // 
            // pic0Degree
            // 
            this.pic0Degree.Enabled = false;
            this.pic0Degree.Image = ((System.Drawing.Image)(resources.GetObject("pic0Degree.Image")));
            this.pic0Degree.Location = new System.Drawing.Point(45, 227);
            this.pic0Degree.Name = "pic0Degree";
            this.pic0Degree.Size = new System.Drawing.Size(45, 45);
            this.pic0Degree.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pic0Degree.TabIndex = 53;
            this.pic0Degree.TabStop = false;
            // 
            // picMirror
            // 
            this.picMirror.Enabled = false;
            this.picMirror.Image = global::ResizeImage.Properties.Resources._1;
            this.picMirror.Location = new System.Drawing.Point(145, 141);
            this.picMirror.Name = "picMirror";
            this.picMirror.Size = new System.Drawing.Size(45, 45);
            this.picMirror.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picMirror.TabIndex = 52;
            this.picMirror.TabStop = false;
            // 
            // picNormal
            // 
            this.picNormal.Enabled = false;
            this.picNormal.Image = global::ResizeImage.Properties.Resources._4;
            this.picNormal.Location = new System.Drawing.Point(89, 141);
            this.picNormal.Name = "picNormal";
            this.picNormal.Size = new System.Drawing.Size(45, 45);
            this.picNormal.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picNormal.TabIndex = 51;
            this.picNormal.TabStop = false;
            // 
            // cckRotate
            // 
            this.cckRotate.Location = new System.Drawing.Point(24, 188);
            this.cckRotate.Name = "cckRotate";
            this.cckRotate.Size = new System.Drawing.Size(200, 40);
            this.cckRotate.TabIndex = 50;
            this.cckRotate.Text = "Cell photo auto rotate ";
            // 
            // cckMirror
            // 
            this.cckMirror.Location = new System.Drawing.Point(24, 102);
            this.cckMirror.Name = "cckMirror";
            this.cckMirror.Size = new System.Drawing.Size(200, 40);
            this.cckMirror.TabIndex = 49;
            this.cckMirror.Text = "Cell photo auto mirror ";
            // 
            // label5
            // 
            this.label5.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(21, 504);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(232, 16);
            this.label5.TabIndex = 47;
            this.label5.Text = "0                        5                       10";
            // 
            // cck_distanceCell
            // 
            this.cck_distanceCell.Location = new System.Drawing.Point(20, 429);
            this.cck_distanceCell.Name = "cck_distanceCell";
            this.cck_distanceCell.Size = new System.Drawing.Size(217, 32);
            this.cck_distanceCell.TabIndex = 46;
            this.cck_distanceCell.Text = "Fix Distance Between Same Cell Photo";
            this.cck_distanceCell.CheckStateChanged += new System.EventHandler(this.cck_distanceCell_CheckStateChanged);
            // 
            // trkDistanceCell
            // 
            this.trkDistanceCell.AutoSize = false;
            this.trkDistanceCell.Enabled = false;
            this.trkDistanceCell.LargeChange = 2;
            this.trkDistanceCell.Location = new System.Drawing.Point(13, 467);
            this.trkDistanceCell.Name = "trkDistanceCell";
            this.trkDistanceCell.Size = new System.Drawing.Size(232, 45);
            this.trkDistanceCell.TabIndex = 0;
            // 
            // groupWeight
            // 
            this.groupWeight.Controls.Add(this.label11);
            this.groupWeight.Controls.Add(this.label9);
            this.groupWeight.Controls.Add(this.label10);
            this.groupWeight.Controls.Add(this.label8);
            this.groupWeight.Controls.Add(this.trkWeight);
            this.groupWeight.Controls.Add(this.trkError);
            this.groupWeight.Location = new System.Drawing.Point(585, 12);
            this.groupWeight.Name = "groupWeight";
            this.groupWeight.Size = new System.Drawing.Size(224, 177);
            this.groupWeight.TabIndex = 47;
            this.groupWeight.TabStop = false;
            this.groupWeight.Text = "Weight";
            this.groupWeight.Visible = false;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(8, 150);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(55, 13);
            this.label11.TabIndex = 64;
            this.label11.Text = "Cell Photo";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(178, 150);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(30, 13);
            this.label9.TabIndex = 63;
            this.label9.Text = "Main";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(78, 100);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(41, 13);
            this.label10.TabIndex = 62;
            this.label10.Text = "Weight";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(78, 22);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(29, 13);
            this.label8.TabIndex = 60;
            this.label8.Text = "Error";
            // 
            // trkWeight
            // 
            this.trkWeight.Location = new System.Drawing.Point(11, 116);
            this.trkWeight.Name = "trkWeight";
            this.trkWeight.Size = new System.Drawing.Size(197, 45);
            this.trkWeight.TabIndex = 2;
            // 
            // trkError
            // 
            this.trkError.Location = new System.Drawing.Point(9, 38);
            this.trkError.Maximum = 3;
            this.trkError.Name = "trkError";
            this.trkError.Size = new System.Drawing.Size(197, 45);
            this.trkError.TabIndex = 0;
            // 
            // groupExample
            // 
            this.groupExample.Controls.Add(this.picDistance);
            this.groupExample.Location = new System.Drawing.Point(594, 386);
            this.groupExample.Name = "groupExample";
            this.groupExample.Size = new System.Drawing.Size(218, 194);
            this.groupExample.TabIndex = 48;
            this.groupExample.TabStop = false;
            this.groupExample.Text = "Example";
            // 
            // picDistance
            // 
            this.picDistance.Enabled = false;
            this.picDistance.Image = global::ResizeImage.Properties.Resources.distance_0;
            this.picDistance.Location = new System.Drawing.Point(32, 37);
            this.picDistance.Name = "picDistance";
            this.picDistance.Size = new System.Drawing.Size(145, 137);
            this.picDistance.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picDistance.TabIndex = 1;
            this.picDistance.TabStop = false;
            // 
            // Option
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(842, 588);
            this.Controls.Add(this.groupExample);
            this.Controls.Add(this.groupWeight);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btn_Cancel);
            this.Controls.Add(this.btn_OK);
            this.Controls.Add(this.group_Polygon);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Option";
            this.Text = "Option";
            this.Load += new System.EventHandler(this.Option_Load);
            this.group_Polygon.ResumeLayout(false);
            this.pnlMosaic.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.num_NoTileHeight)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.num_NoTileWidth)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pic270Degree)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pic180Degree)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pic90Degree)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pic0Degree)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picMirror)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picNormal)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.trkDistanceCell)).EndInit();
            this.groupWeight.ResumeLayout(false);
            this.groupWeight.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.trkWeight)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.trkError)).EndInit();
            this.groupExample.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picDistance)).EndInit();
            this.ResumeLayout(false);

		}
		#endregion
		//public static bool rectangle = true;
		private void Option_Load(object sender, System.EventArgs e)
		{
			num_NoTileWidth.Value = PhotoMosaic.NoTileWidth;
			num_NoTileHeight.Value = PhotoMosaic.NoTileHeight;
			if(PhotoMosaic.rectangle)
			{
				rad_rectangle.Checked  = true;
				num_NoTileHeight.Enabled = true;
				num_NoTileWidth.Enabled = true;
			}
			if(PhotoMosaic.hexagon) 
				rad_hexagon.Checked = true ;
 			if(PhotoMosaic.tick_2)
			{
				cck_distanceCell.Checked = true;
				trkDistanceCell.Enabled = true;
			}
            if (PhotoMosaic.rotate)
                cckRotate.Checked = true;
            else
                cckRotate.Checked = false;
            if (PhotoMosaic.mirror)
                cckMirror.Checked = true;
            else
                cckMirror.Checked = false;
            if (PhotoMosaic.changeColor)
                chkColor.Checked = true;
            else
                chkColor.Checked = false;
            trkError.Value = PhotoMosaic.error / 5 - 1;
            trkWeight.Value = PhotoMosaic.weight / 10;
			//num_MaxAmountCell.Value = PhotoMosaic.MaxCellPhoto;
			trkDistanceCell.Value = PhotoMosaic.MinDistanceCell;
            if (PhotoMosaic.split) chkSplit.Checked = true;
            else chkSplit.Checked = false;
		}

		private void cck_distanceCell_CheckStateChanged(object sender, System.EventArgs e)
		{
            if (cck_distanceCell.Checked)
            {
                trkDistanceCell.Enabled = true;
                picDistance.Enabled = true;
            }
            else
            {
                trkDistanceCell.Enabled = false;
                trkDistanceCell.Value = 0;
                picDistance.Enabled = false;
            }
		}
        
		private void btn_OK_Click(object sender, System.EventArgs e)
		{
			if(rad_rectangle.Checked)
			{
				PhotoMosaic.rectangle = true;
				PhotoMosaic.hexagon = false;
				PhotoMosaic.NoTileWidth = Convert.ToInt32(num_NoTileWidth.Value) ;
				PhotoMosaic.NoTileHeight = Convert.ToInt32(num_NoTileHeight.Value);
			}
			else if(rad_hexagon.Checked)
			{
				PhotoMosaic.rectangle = false;
				PhotoMosaic.hexagon = true;
                double RHexa = (double)(PhotoMosaic.bit_original_show.Width - Convert.ToDouble(num_NoTileWidth.Value)) / Convert.ToDouble(num_NoTileWidth.Value);
                RHexa /= (double)2;
                RHexa = RHexa / (double)Math.Cos(Math.PI / 6);
                PhotoMosaic.RHexa = RHexa;
			}
			if(cck_distanceCell.Checked)
			{
				PhotoMosaic.MinDistanceCell = trkDistanceCell.Value;
				PhotoMosaic.tick_2 = true;
			}
			else
			{
				PhotoMosaic.MinDistanceCell = 0;
				PhotoMosaic.tick_2 = false;
			}
            if (cckRotate.Checked)
                PhotoMosaic.rotate = true;
            else
                PhotoMosaic.rotate = false;
            if (cckMirror.Checked)
                PhotoMosaic.mirror = true;
            else
                PhotoMosaic.mirror = false;
          
            if (chkColor.Checked)
            {
                PhotoMosaic.error = (trkError.Value+1)*5;
                PhotoMosaic.weight = (trkWeight.Value * 10);
                PhotoMosaic.changeColor = true;
            }
            else
            {
                PhotoMosaic.changeColor = false;
            }
            if (cck_distanceCell.Checked)
                distanceCellPhoto = trkDistanceCell.Value;
            else
                distanceCellPhoto = 0;
            if (chkSplit.Checked) PhotoMosaic.split = true;
            else PhotoMosaic.split = false;
            


			this.Close();
		}
        static public int maxCellPhoto = -1;
        static public int distanceCellPhoto = 0;
		private void btn_OverView_Click(object sender, System.EventArgs e)
		{
			OverView overviewOption = new OverView();
            overviewOption.Polygon = rad_rectangle.Checked;
            overviewOption.TileWidth = Convert.ToDouble(num_NoTileWidth.Value);
			overviewOption.NoTileWidth = Convert.ToInt16(num_NoTileWidth.Value);
			overviewOption.NoTileHeight = Convert.ToInt16(num_NoTileHeight.Value);
			overviewOption.Show();
		}

		private void btn_Cancel_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

        private void btnAdvance_Click(object sender, EventArgs e)
        {
            if (btnAdvance.Text == "Advance>>")
            {
                btnAdvance.Text = "<<Normal";
                groupWeight.Visible = true;
                this.Width = 827;
            }
            else
            {
                groupWeight.Visible = false;
                btnAdvance.Text = "Advance>>";
                this.Width = 593;
            }

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (chkColor.Checked)

                btnAdvance.Enabled = true;
            else
            {
                btnAdvance.Enabled = false;
            }
        }

        private void btnViewExample_Click(object sender, EventArgs e)
        {
            if (btnViewExample.Text == "View Example >>")
            {
                btnViewExample.Text = "<< Close Example";
                groupExample.Visible = true;
                this.Width = 827;
            }
            else
            {
                groupExample.Visible = false;
                btnViewExample.Text = "View Example >>";
                this.Width = 593;
            }
            picDistance.Image = Image.FromFile("Resources.0degree.JPG");
            picDistance.Refresh();
        }
	}
}
