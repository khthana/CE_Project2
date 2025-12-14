using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.IO;

namespace PhotoMosaic
{

	public class MainPhoto : System.Windows.Forms.Form
    {
        #region global variable control
        private System.Windows.Forms.Button btn_resetSize;
        private TabControl TagPage1;
        private TabPage tabPage1;
        private TabPage tabPage2;
        private GroupBox g;
        private GroupBox groupBox3;
        private RadioButton rad_GrayScale;
        private RadioButton rad_RGB;
        private GroupBox groupBox2;
        private RadioButton rad_ActualSize;
        private Label lab_Width;
        private Label label5;
        private NumericUpDown Num_WidthManual;
        private NumericUpDown Num_HeightSameRatio;
        private RadioButton rad_ManualSize;
        private NumericUpDown Num_WidthSameRatio;
        private RadioButton rad_RatioSize;
        private NumericUpDown Num_HeightManual;
        private Label label3;
        private Label Width;
        private GroupBox groupBox1;
        private Button btn_left;
        private Button btn_right;
        private PictureBox pic_show;
        private Button btn_OK;
        private Button btn_Cancel;
        private PictureBox pic_PhotoMain;
        private GroupBox groupBox4;
        private Button btn_loadMainPhoto;
        private Label lab_PhotoSize;
        private Label lab_FileName;
        private Label label2;
        private Label lab_Height;

		private System.ComponentModel.Container components = null;
        #endregion

        public MainPhoto()
		{
			InitializeComponent();
		}
		public Bitmap bit_original;
		public int TypeSizeMain ;
		Bitmap bit_original_show ;
		
		public MainPhoto(Bitmap bit_original,Bitmap bit_original_show,bool GrayScalePhoto,int TypeSizeMain)
		{
			this.bit_original_show = new Bitmap(bit_original_show);
			int width = bit_original_show.Width;
			int height = bit_original_show.Height;
			
			if(width > OriginlWidthHeight || height > OriginlWidthHeight)
			{
				if(width > height)
				{
					width = OriginlWidthHeight;
					height = width*height/ bit_original_show.Width;
				}
				else
				{
					height = OriginlWidthHeight;
					width = height*width/bit_original_show.Height;
				}
			}
			bmp = new Bitmap(bit_original_show,width,height);
			if(!GrayScalePhoto)
				bmp_degree[0] = new Bitmap(bmp);
			else
				bmp_degree_gray[0] = new Bitmap(bmp);
			this.bit_original = new Bitmap(bit_original);
			this.GrayScalePhoto = GrayScalePhoto;
			this.TypeSizeMain = TypeSizeMain;

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

		private void InitializeComponent()
		{
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainPhoto));
            this.btn_resetSize = new System.Windows.Forms.Button();
            this.TagPage1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.pic_PhotoMain = new System.Windows.Forms.PictureBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.btn_loadMainPhoto = new System.Windows.Forms.Button();
            this.lab_PhotoSize = new System.Windows.Forms.Label();
            this.lab_FileName = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.g = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.rad_GrayScale = new System.Windows.Forms.RadioButton();
            this.rad_RGB = new System.Windows.Forms.RadioButton();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.lab_Height = new System.Windows.Forms.Label();
            this.rad_ActualSize = new System.Windows.Forms.RadioButton();
            this.lab_Width = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.Num_WidthManual = new System.Windows.Forms.NumericUpDown();
            this.Num_HeightSameRatio = new System.Windows.Forms.NumericUpDown();
            this.rad_ManualSize = new System.Windows.Forms.RadioButton();
            this.Num_WidthSameRatio = new System.Windows.Forms.NumericUpDown();
            this.rad_RatioSize = new System.Windows.Forms.RadioButton();
            this.Num_HeightManual = new System.Windows.Forms.NumericUpDown();
            this.label3 = new System.Windows.Forms.Label();
            this.Width = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btn_left = new System.Windows.Forms.Button();
            this.btn_right = new System.Windows.Forms.Button();
            this.pic_show = new System.Windows.Forms.PictureBox();
            this.btn_OK = new System.Windows.Forms.Button();
            this.btn_Cancel = new System.Windows.Forms.Button();
            this.TagPage1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pic_PhotoMain)).BeginInit();
            this.groupBox4.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.g.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Num_WidthManual)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Num_HeightSameRatio)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Num_WidthSameRatio)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Num_HeightManual)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pic_show)).BeginInit();
            this.SuspendLayout();
            // 
            // btn_resetSize
            // 
            this.btn_resetSize.Location = new System.Drawing.Point(8, 48);
            this.btn_resetSize.Name = "btn_resetSize";
            this.btn_resetSize.Size = new System.Drawing.Size(136, 16);
            this.btn_resetSize.TabIndex = 15;
            this.btn_resetSize.Text = "button1";
            // 
            // TagPage1
            // 
            this.TagPage1.Controls.Add(this.tabPage1);
            this.TagPage1.Controls.Add(this.tabPage2);
            this.TagPage1.Cursor = System.Windows.Forms.Cursors.Default;
            this.TagPage1.Location = new System.Drawing.Point(1, 4);
            this.TagPage1.Name = "TagPage1";
            this.TagPage1.SelectedIndex = 0;
            this.TagPage1.Size = new System.Drawing.Size(717, 547);
            this.TagPage1.TabIndex = 7;
            this.TagPage1.Tag = "";
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.pic_PhotoMain);
            this.tabPage1.Controls.Add(this.groupBox4);
            this.tabPage1.Cursor = System.Windows.Forms.Cursors.Default;
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(709, 521);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Main Photo";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // pic_PhotoMain
            // 
            this.pic_PhotoMain.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.pic_PhotoMain.Image = ((System.Drawing.Image)(resources.GetObject("pic_PhotoMain.Image")));
            this.pic_PhotoMain.Location = new System.Drawing.Point(200, 20);
            this.pic_PhotoMain.Name = "pic_PhotoMain";
            this.pic_PhotoMain.Size = new System.Drawing.Size(470, 470);
            this.pic_PhotoMain.TabIndex = 3;
            this.pic_PhotoMain.TabStop = false;
            this.pic_PhotoMain.Paint += new System.Windows.Forms.PaintEventHandler(this.pic_PhotoMain_Paint);
            // 
            // groupBox4
            // 
            this.groupBox4.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.groupBox4.Controls.Add(this.btn_loadMainPhoto);
            this.groupBox4.Controls.Add(this.lab_PhotoSize);
            this.groupBox4.Controls.Add(this.lab_FileName);
            this.groupBox4.Cursor = System.Windows.Forms.Cursors.Default;
            this.groupBox4.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.groupBox4.ForeColor = System.Drawing.SystemColors.ControlText;
            this.groupBox4.Location = new System.Drawing.Point(7, 6);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(176, 488);
            this.groupBox4.TabIndex = 2;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Main Photo Info";
            // 
            // btn_loadMainPhoto
            // 
            this.btn_loadMainPhoto.Location = new System.Drawing.Point(11, 24);
            this.btn_loadMainPhoto.Name = "btn_loadMainPhoto";
            this.btn_loadMainPhoto.Size = new System.Drawing.Size(152, 24);
            this.btn_loadMainPhoto.TabIndex = 35;
            this.btn_loadMainPhoto.Text = "Load Main Photo";
            this.btn_loadMainPhoto.Click += new System.EventHandler(this.btn_loadMainPhoto_Click);
            // 
            // lab_PhotoSize
            // 
            this.lab_PhotoSize.Location = new System.Drawing.Point(6, 167);
            this.lab_PhotoSize.Name = "lab_PhotoSize";
            this.lab_PhotoSize.Size = new System.Drawing.Size(160, 56);
            this.lab_PhotoSize.TabIndex = 2;
            this.lab_PhotoSize.Text = "Photo Size :";
            // 
            // lab_FileName
            // 
            this.lab_FileName.Location = new System.Drawing.Point(9, 67);
            this.lab_FileName.Name = "lab_FileName";
            this.lab_FileName.Size = new System.Drawing.Size(160, 87);
            this.lab_FileName.TabIndex = 0;
            this.lab_FileName.Text = "Path :";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.g);
            this.tabPage2.Controls.Add(this.pic_show);
            this.tabPage2.Cursor = System.Windows.Forms.Cursors.Default;
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(709, 521);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Edit Main Photo";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // g
            // 
            this.g.Controls.Add(this.groupBox3);
            this.g.Controls.Add(this.groupBox2);
            this.g.Controls.Add(this.groupBox1);
            this.g.Cursor = System.Windows.Forms.Cursors.Default;
            this.g.Location = new System.Drawing.Point(7, 10);
            this.g.Name = "g";
            this.g.Size = new System.Drawing.Size(219, 505);
            this.g.TabIndex = 8;
            this.g.TabStop = false;
            this.g.Text = "Edit Main Photo";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.rad_GrayScale);
            this.groupBox3.Controls.Add(this.rad_RGB);
            this.groupBox3.Location = new System.Drawing.Point(6, 396);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(205, 91);
            this.groupBox3.TabIndex = 16;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Color";
            // 
            // rad_GrayScale
            // 
            this.rad_GrayScale.Location = new System.Drawing.Point(16, 51);
            this.rad_GrayScale.Name = "rad_GrayScale";
            this.rad_GrayScale.Size = new System.Drawing.Size(128, 16);
            this.rad_GrayScale.TabIndex = 1;
            this.rad_GrayScale.Text = "Gray Scale";
            this.rad_GrayScale.CheckedChanged += new System.EventHandler(this.rad_GrayScale_CheckedChanged);
            // 
            // rad_RGB
            // 
            this.rad_RGB.Checked = true;
            this.rad_RGB.Location = new System.Drawing.Point(17, 29);
            this.rad_RGB.Name = "rad_RGB";
            this.rad_RGB.Size = new System.Drawing.Size(128, 16);
            this.rad_RGB.TabIndex = 0;
            this.rad_RGB.TabStop = true;
            this.rad_RGB.Text = "RGB";
            this.rad_RGB.CheckedChanged += new System.EventHandler(this.rad_RGB_CheckedChanged);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.lab_Height);
            this.groupBox2.Controls.Add(this.rad_ActualSize);
            this.groupBox2.Controls.Add(this.lab_Width);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.Num_WidthManual);
            this.groupBox2.Controls.Add(this.Num_HeightSameRatio);
            this.groupBox2.Controls.Add(this.rad_ManualSize);
            this.groupBox2.Controls.Add(this.Num_WidthSameRatio);
            this.groupBox2.Controls.Add(this.rad_RatioSize);
            this.groupBox2.Controls.Add(this.Num_HeightManual);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.Width);
            this.groupBox2.Location = new System.Drawing.Point(8, 98);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(205, 292);
            this.groupBox2.TabIndex = 15;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Change Photo Size";
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(75, 42);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(10, 23);
            this.label2.TabIndex = 17;
            this.label2.Text = "*";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lab_Height
            // 
            this.lab_Height.Location = new System.Drawing.Point(86, 42);
            this.lab_Height.Name = "lab_Height";
            this.lab_Height.Size = new System.Drawing.Size(49, 23);
            this.lab_Height.TabIndex = 16;
            this.lab_Height.Text = "1";
            this.lab_Height.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // rad_ActualSize
            // 
            this.rad_ActualSize.Checked = true;
            this.rad_ActualSize.Location = new System.Drawing.Point(25, 24);
            this.rad_ActualSize.Name = "rad_ActualSize";
            this.rad_ActualSize.Size = new System.Drawing.Size(144, 24);
            this.rad_ActualSize.TabIndex = 15;
            this.rad_ActualSize.TabStop = true;
            this.rad_ActualSize.Text = "Actual Size";
            this.rad_ActualSize.CheckedChanged += new System.EventHandler(this.rad_ActualSize_CheckedChanged);
            // 
            // lab_Width
            // 
            this.lab_Width.Location = new System.Drawing.Point(28, 42);
            this.lab_Width.Name = "lab_Width";
            this.lab_Width.Size = new System.Drawing.Size(43, 22);
            this.lab_Width.TabIndex = 14;
            this.lab_Width.Text = "1";
            this.lab_Width.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(27, 254);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(56, 16);
            this.label5.TabIndex = 13;
            this.label5.Text = "Height";
            // 
            // Num_WidthManual
            // 
            this.Num_WidthManual.Enabled = false;
            this.Num_WidthManual.Location = new System.Drawing.Point(91, 222);
            this.Num_WidthManual.Maximum = new decimal(new int[] {
            20000,
            0,
            0,
            0});
            this.Num_WidthManual.Name = "Num_WidthManual";
            this.Num_WidthManual.Size = new System.Drawing.Size(72, 20);
            this.Num_WidthManual.TabIndex = 9;
            // 
            // Num_HeightSameRatio
            // 
            this.Num_HeightSameRatio.Enabled = false;
            this.Num_HeightSameRatio.Location = new System.Drawing.Point(97, 128);
            this.Num_HeightSameRatio.Maximum = new decimal(new int[] {
            20000,
            0,
            0,
            0});
            this.Num_HeightSameRatio.Name = "Num_HeightSameRatio";
            this.Num_HeightSameRatio.Size = new System.Drawing.Size(48, 20);
            this.Num_HeightSameRatio.TabIndex = 8;
            this.Num_HeightSameRatio.ValueChanged += new System.EventHandler(this.Num_HeightSameRatio_ValueChanged);
            // 
            // rad_ManualSize
            // 
            this.rad_ManualSize.Location = new System.Drawing.Point(25, 193);
            this.rad_ManualSize.Name = "rad_ManualSize";
            this.rad_ManualSize.Size = new System.Drawing.Size(144, 24);
            this.rad_ManualSize.TabIndex = 6;
            this.rad_ManualSize.Text = "Change Manul Size";
            this.rad_ManualSize.CheckedChanged += new System.EventHandler(this.rad_ManualSize_CheckedChanged);
            // 
            // Num_WidthSameRatio
            // 
            this.Num_WidthSameRatio.Enabled = false;
            this.Num_WidthSameRatio.Location = new System.Drawing.Point(30, 128);
            this.Num_WidthSameRatio.Maximum = new decimal(new int[] {
            20000,
            0,
            0,
            0});
            this.Num_WidthSameRatio.Name = "Num_WidthSameRatio";
            this.Num_WidthSameRatio.Size = new System.Drawing.Size(48, 20);
            this.Num_WidthSameRatio.TabIndex = 7;
            this.Num_WidthSameRatio.ValueChanged += new System.EventHandler(this.Num_WidthSameRatio_ValueChanged);
            // 
            // rad_RatioSize
            // 
            this.rad_RatioSize.Location = new System.Drawing.Point(24, 90);
            this.rad_RatioSize.Name = "rad_RatioSize";
            this.rad_RatioSize.Size = new System.Drawing.Size(144, 21);
            this.rad_RatioSize.TabIndex = 5;
            this.rad_RatioSize.Text = "Change in Same Ratio";
            this.rad_RatioSize.CheckedChanged += new System.EventHandler(this.rad_SameRatio_CheckedChanged);
            // 
            // Num_HeightManual
            // 
            this.Num_HeightManual.Enabled = false;
            this.Num_HeightManual.Location = new System.Drawing.Point(91, 254);
            this.Num_HeightManual.Maximum = new decimal(new int[] {
            20000,
            0,
            0,
            0});
            this.Num_HeightManual.Name = "Num_HeightManual";
            this.Num_HeightManual.Size = new System.Drawing.Size(72, 20);
            this.Num_HeightManual.TabIndex = 10;
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(33, 112);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(112, 12);
            this.label3.TabIndex = 11;
            this.label3.Text = "  Width           Height";
            // 
            // Width
            // 
            this.Width.Location = new System.Drawing.Point(27, 222);
            this.Width.Name = "Width";
            this.Width.Size = new System.Drawing.Size(56, 16);
            this.Width.TabIndex = 12;
            this.Width.Text = "Width";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btn_left);
            this.groupBox1.Controls.Add(this.btn_right);
            this.groupBox1.Cursor = System.Windows.Forms.Cursors.Default;
            this.groupBox1.Location = new System.Drawing.Point(8, 16);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(205, 76);
            this.groupBox1.TabIndex = 14;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Rotate Photo";
            // 
            // btn_left
            // 
            this.btn_left.Image = ((System.Drawing.Image)(resources.GetObject("btn_left.Image")));
            this.btn_left.Location = new System.Drawing.Point(55, 27);
            this.btn_left.Name = "btn_left";
            this.btn_left.Size = new System.Drawing.Size(34, 31);
            this.btn_left.TabIndex = 1;
            this.btn_left.Click += new System.EventHandler(this.btn_left_Click);
            // 
            // btn_right
            // 
            this.btn_right.Image = ((System.Drawing.Image)(resources.GetObject("btn_right.Image")));
            this.btn_right.Location = new System.Drawing.Point(103, 27);
            this.btn_right.Name = "btn_right";
            this.btn_right.Size = new System.Drawing.Size(32, 31);
            this.btn_right.TabIndex = 2;
            this.btn_right.Click += new System.EventHandler(this.btn_right_Click);
            // 
            // pic_show
            // 
            this.pic_show.Cursor = System.Windows.Forms.Cursors.Default;
            this.pic_show.Image = ((System.Drawing.Image)(resources.GetObject("pic_show.Image")));
            this.pic_show.Location = new System.Drawing.Point(232, 27);
            this.pic_show.Name = "pic_show";
            this.pic_show.Size = new System.Drawing.Size(470, 470);
            this.pic_show.TabIndex = 7;
            this.pic_show.TabStop = false;
            this.pic_show.Paint += new System.Windows.Forms.PaintEventHandler(this.pic_show_Paint);
            // 
            // btn_OK
            // 
            this.btn_OK.Location = new System.Drawing.Point(724, 26);
            this.btn_OK.Name = "btn_OK";
            this.btn_OK.Size = new System.Drawing.Size(72, 24);
            this.btn_OK.TabIndex = 11;
            this.btn_OK.Text = "OK";
            this.btn_OK.Click += new System.EventHandler(this.btn_OK_Click);
            // 
            // btn_Cancel
            // 
            this.btn_Cancel.Location = new System.Drawing.Point(724, 77);
            this.btn_Cancel.Name = "btn_Cancel";
            this.btn_Cancel.Size = new System.Drawing.Size(72, 24);
            this.btn_Cancel.TabIndex = 12;
            this.btn_Cancel.Text = "Cancel";
            this.btn_Cancel.Click += new System.EventHandler(this.btn_Cancel_Click);
            // 
            // MainPhoto
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(808, 563);
            this.Controls.Add(this.btn_OK);
            this.Controls.Add(this.btn_Cancel);
            this.Controls.Add(this.TagPage1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "MainPhoto";
            this.Text = "Main Photo";
            this.Load += new System.EventHandler(this.EditMain_Load);
            this.TagPage1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pic_PhotoMain)).EndInit();
            this.groupBox4.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.g.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.Num_WidthManual)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Num_HeightSameRatio)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Num_WidthSameRatio)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Num_HeightManual)).EndInit();
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pic_show)).EndInit();
            this.ResumeLayout(false);

		}
		#endregion
		public Bitmap bmp ;
		int bmpWidth = 0;
		int bmpHeight = 0;
		public bool GrayScalePhoto ;
		private void EditMain_Load(object sender, System.EventArgs e)
		{
            lab_FileName.Text = PhotoMosaic.FileName;
            lab_PhotoSize.Text = "Photo Size : " + "\n" + "	 Width : " + PhotoMosaic.bit_original.Width.ToString() + "\n" + "	 Height : " + PhotoMosaic.bit_original.Height.ToString();
            
            pic_show.Image = bmp;
            lab_Width.Text = bit_original.Width.ToString();
            lab_Height.Text = bit_original.Height.ToString();
			Num_HeightManual.Value =   bit_original_show.Height;
			Num_WidthManual.Value =  bit_original_show.Width;
    		bmpWidth = bmp.Width;
			bmpHeight = bmp.Height;
            
			pic_show.Refresh();
			for(int i = 1;i< 4;i++)
			{
				bmp_degree[i] = new Bitmap(1,1);
				bmp_degree_gray[i] = new Bitmap(1,1);
			}
			
			if(GrayScalePhoto)
			{
				rad_GrayScale.Checked = true;
				bmp_degree[0] = new Bitmap(1,1);
			}
			else
				bmp_degree_gray[0] = new Bitmap(1,1);
			if(TypeSizeMain == 1)
			{
				rad_RatioSize.Checked = true;
				Num_HeightSameRatio.Value = bit_original_show.Height;
				Num_WidthSameRatio.Value =  bit_original_show.Width;
			}
			else
			{	
				Num_HeightSameRatio.Value = bmp.Height;
				Num_WidthSameRatio.Value = bmp.Width;
			}	
				if(TypeSizeMain == 2)
				rad_ManualSize.Checked = true;
			
			
		}
		public Bitmap Create_GrayScale(Bitmap rgb)
		{
			Bitmap Gray = new Bitmap(rgb);
			int gray = 0;
			for(int i = 0;i< rgb.Height;i++)
				for(int j = 0 ;j< rgb.Width;j++)
				{
					gray = (rgb.GetPixel(j,i).R + rgb.GetPixel(j,i).B + rgb.GetPixel(j,i).G)/3;
					Gray.SetPixel(j,i,Color.FromArgb(gray,gray,gray));
				}
			return Gray;
		}
		private void rad_SameRatio_CheckedChanged(object sender, System.EventArgs e)
		{
			if(rad_RatioSize.Checked)
			{
				Num_HeightSameRatio.Enabled = true;
				Num_WidthSameRatio.Enabled = true;
				Num_HeightManual.Enabled = false;
				Num_WidthManual.Enabled = false;
			}
		}
		private void rad_ManualSize_CheckedChanged(object sender, System.EventArgs e)
		{
			if(rad_ManualSize.Checked)
			{
				Num_HeightSameRatio.Enabled = false;
				Num_WidthSameRatio.Enabled = false;
				Num_HeightManual.Enabled = true;
				Num_WidthManual.Enabled = true;
			}
		}

		private void rad_GrayScale_CheckedChanged(object sender, System.EventArgs e)
		{
			if(rad_GrayScale.Checked)
			{
				//if(bmp_degree_gray[status].Width == 1)
				//	bmp_degree_gray[status] = Create_GrayScale(bmp_degree[status]);
				//bmp = new Bitmap(bmp_degree_gray[status]);
                bmp = Create_GrayScale(bmp);
				GrayScalePhoto = true;
				pic_show.Refresh();
			}
		}
		int status = 0;
		private void btn_left_Click(object sender, System.EventArgs e)
		{
			status--;
			if(status < 0) 
                status = 3;
            bmp = Shift_left(bmp);
            ChangeWidthHeight();
            pic_show.Refresh();
		}
        private void ChangeWidthHeight()
        {
            string temp = lab_Width.Text;
            lab_Width.Text = lab_Height.Text;
            lab_Height.Text = temp;
            decimal tempV = Num_WidthSameRatio.Value;
           // Num_WidthSameRatio.Value = Num_HeightSameRatio.Value;
            Num_HeightSameRatio.Value = tempV;
            tempV = Num_WidthManual.Value;
            Num_WidthManual.Value = Num_HeightManual.Value;
            Num_HeightManual.Value = tempV;
        }
		private void btn_right_Click(object sender,System.EventArgs e)
		{
			status++;
			status = status%4;
            bmp = Shift_right(bmp);
            ChangeWidthHeight();
			pic_show.Refresh();
		}
		public Bitmap Shift_left(Bitmap bitmap)
		{	
			Bitmap b  = new Bitmap(bitmap);
			 b.RotateFlip(RotateFlipType.Rotate270FlipNone);
			return b;
		}
		public Bitmap Shift_right(Bitmap bitmap)
		{
			Bitmap b  = new Bitmap(bitmap);
			b.RotateFlip(RotateFlipType.Rotate90FlipNone);
			return b;
		}

		Bitmap[] bmp_degree = new Bitmap[4];
		Bitmap[] bmp_degree_gray = new Bitmap[4];
		int OriginlWidthHeight = 480;

		private void pic_show_Paint(object sender, System.Windows.Forms.PaintEventArgs e)
        {
            //int width = bmp.Width;
            //int height = bmp.Height;

            //if (width > OriginlWidthHeight || height > OriginlWidthHeight)
            //{
            //    if (width > height)
            //    {
            //        width = OriginlWidthHeight;
            //        height = width * height / bmp.Width;
            //    }
            //    else
            //    {
            //        height = OriginlWidthHeight;
            //        width = height * width / bmp.Height;
            //    }
            //}
            e.Graphics.DrawImage(bmp, 0, 0, bmp.Width, bmp.Height);
            pic_show.Width = bmp.Width;
            pic_show.Height = bmp.Height;
		}
		private void btn_Cancel_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void rad_RGB_CheckedChanged(object sender, System.EventArgs e)
		{
			if(rad_RGB.Checked)
			{
                //if(bmp_degree[status].Width != 1)
                //    bmp = new Bitmap(bmp_degree[status]);
                //else
                //{
					Bitmap bit_temp;
					if(status == 0 || status == 2)
						bit_temp = new Bitmap(bit_original,bmp.Width,bmp.Height);
					else
						bit_temp = new Bitmap(bit_original,bmp.Height,bmp.Width);
					if(status == 1 || status == 2)
						for(int i = 0 ; i < status ;i++)
							bit_temp = Shift_right(bit_temp);
					if(status == 3)
						bit_temp = Shift_left(bit_temp);
					bmp =new Bitmap(bit_temp);
				//}
				pic_show.Refresh();
			}
		}
		private void btn_OK_Click(object sender, System.EventArgs e)
		{
            if (rad_GrayScale.Checked) GrayScalePhoto = true;
            else GrayScalePhoto = false;
			if(status == 1 || status == 2)
				for(int i = 0 ; i < status ;i++)
				    bit_original = Shift_right(bit_original);
			if(status == 3)
				bit_original = Shift_left(bit_original);
			bmp =new Bitmap(bit_original);
			if(rad_GrayScale.Checked)
				bmp = Create_GrayScale(bit_original);

			if(rad_ActualSize.Checked) 
			{
				TypeSizeMain = 0;
				bmp = new Bitmap(bmp);
			}
			if(rad_RatioSize.Checked) 
			{
				TypeSizeMain = 1;
				if(status == 0 || status == 2)
					bmp = new Bitmap(bmp,Convert.ToInt16(Num_WidthSameRatio.Value),Convert.ToInt16(Num_HeightSameRatio.Value));
				else
					bmp = new Bitmap(bmp,Convert.ToInt16(Num_HeightSameRatio.Value),Convert.ToInt16(Num_WidthSameRatio.Value));
			}
			if(rad_ManualSize.Checked) 
			{
				TypeSizeMain = 2;
				if(status == 0 || status == 2)
					bmp =new Bitmap(bmp,Convert.ToInt16(Num_WidthManual.Value),Convert.ToInt16(Num_HeightManual.Value));
				else
					bmp = new Bitmap(bmp,Convert.ToInt16(Num_HeightManual.Value),Convert.ToInt16(Num_WidthManual.Value));
			}
            PhotoMosaic.bit_original_show = new Bitmap(bmp);
            PhotoMosaic.bit_original = new Bitmap(bit_original);
            PhotoMosaic.GrayScalePhoto = GrayScalePhoto;
            PhotoMosaic.TypeSizeMain = TypeSizeMain;
            PhotoMosaic.FileName = lab_FileName.Text;
			this.Close();
		}

		private void Num_WidthSameRatio_ValueChanged(object sender, System.EventArgs e)
		{
			Num_HeightSameRatio.Value = Num_WidthSameRatio.Value * Convert.ToInt16(lab_Height.Text)/Convert.ToInt16(lab_Width.Text);
		}

		private void rad_ActualSize_CheckedChanged(object sender, System.EventArgs e)
		{
            //if(rad_ActualSize.Checked)
            //{
            //    Bitmap bit_temp;
            //    if(status == 0 || status == 2)
            //        bit_temp = new Bitmap(bit_original,bit_original.Width,bit_original.Height);
            //    else
            //        bit_temp = new Bitmap(bit_original,bit_original.Height,bit_original.Width);

            //    int width = bit_temp.Width;
            //    int height = bit_temp.Height;
            //    if(width > OriginlWidthHeight || height > OriginlWidthHeight)
            //    {
            //        if(width > height)
            //        {
            //            width = OriginlWidthHeight;
            //            height = width*height/ bit_original.Width;
            //        }
            //        else
            //        {
            //            height = OriginlWidthHeight;
            //            width = height*width/bit_original.Height;
            //        }
            //    }
            //    bit_temp  = new Bitmap(bit_original,width,height);
            //    //bmp = new Bitmap(bit_original,width,height);

            //    if(status == 1 || status == 2)
            //        for(int i = 0 ; i < status ;i++)
            //            bit_temp = Shift_right(bit_temp);
            //    if(status == 3)
            //        bit_temp = Shift_left(bit_temp);
            //    if(GrayScalePhoto)
            //    {
            //        bit_temp = Create_GrayScale(bit_temp);
            //    }
            //    bmp =new Bitmap(bit_temp);
            //    pic_show.Refresh();
			//}
            Num_HeightManual.Enabled = Num_WidthManual.Enabled = Num_HeightSameRatio.Enabled = Num_WidthSameRatio.Enabled = false;
		}

		private void Num_HeightSameRatio_ValueChanged(object sender, System.EventArgs e)
		{
            Num_WidthSameRatio.Value = Num_HeightSameRatio.Value * Convert.ToInt16(lab_Width.Text) / Convert.ToInt16(lab_Height.Text);
		}
        public string OriginalHeight;
        public string OrigianlWidth;
        public bool Custom = true;
        string FileName = "Path:";
        public string mainPhotoPath = "";
        public int diffRed = 0;
        public int diffGreen = 0;
        public int diffBlue = 0;
        private void btn_loadMainPhoto_Click(object sender, EventArgs e)
        {
            using (OpenFileDialog ofd = new OpenFileDialog())
            {
                ofd.Filter = "Image files|*.gif;*.jpg;*.jepg;*.bmp;*.png;*.tif;*.tiff";
                ofd.RestoreDirectory = true;
                if (ofd.ShowDialog() == DialogResult.OK)
                {
                    FileStream fs = File.Open(ofd.FileName, FileMode.Open);
                    FileName = "Path : " + "\n" + ofd.FileName.ToString();
                    lab_FileName.Text = "Path : " + "\n" + ofd.FileName;
                    mainPhotoPath = ofd.FileName;
                    bmp = new Bitmap(fs);
                    bit_original = new Bitmap(fs);
                    fs.Close();
                    int width = bmp.Width;
                    int height = bmp.Height;
                    if (width > OriginlWidthHeight || height > OriginlWidthHeight)
                    {
                        if (width > height)
                        {
                            width = OriginlWidthHeight;
                            height = width * height / bmp.Width;
                        }
                        else
                        {
                            height = OriginlWidthHeight;
                            width = height * width / bmp.Height;
                        }
                    }
                    bmp = new Bitmap(bmp, width, height);
                    pic_show.Image = bmp;
                    lab_PhotoSize.Text = "Photo Size : " + "\n" + "	 Width : " + bit_original.Width.ToString() + "\n" + "	 Height : " + bit_original.Height.ToString();
                    lab_Width.Text = bit_original.Width.ToString();
                    lab_Height.Text = bit_original.Height.ToString();
                    Num_WidthSameRatio.Value  = Num_WidthManual.Value = bit_original.Width;
                    Num_HeightManual.Value = bit_original.Height;

                    pic_PhotoMain.Refresh();
                    pic_show.Refresh();
                    status = 0;
                    rad_ActualSize.Checked = true;
                    rad_RGB.Checked = true;
                }
            }
            int red = 0;
            int green = 0;
            int blue = 0;
            for(int i = 0 ; i < bmp.Height ;i++)
                for (int j = 0; j < bmp.Width; j++)
                {
                    Color col = bmp.GetPixel(j, i);
                    red += col.R;
                    green += col.G;
                    blue += col.B;
                }
            red /= (bmp.Height * bmp.Width);
            green /= (bmp.Height * bmp.Width);
            blue /= (bmp.Width * bmp.Height);
        }

        private void pic_PhotoMain_Paint(object sender, PaintEventArgs e)
        {
            int width = bit_original.Width;
            int height = bit_original.Height;
            if (width > this.Size.Width - pic_PhotoMain.Left)
            {
                width = this.Size.Width - pic_PhotoMain.Left - 70;
                height = (width * bit_original.Height) / bit_original.Width;
            }
            if (height > this.Size.Height - pic_PhotoMain.Top - 10)
            {
                height = this.Size.Height - pic_PhotoMain.Top - 70;
                width = (height * bit_original.Width) / bit_original.Height;
            }
            e.Graphics.DrawImage(bit_original, 0, 0,width,height);
            pic_PhotoMain.Width = width;
            pic_PhotoMain.Height = height;
        }
        public Bitmap ChangeRedColor(Bitmap bitmap,int changeCol)
        {
            Bitmap newBitmap = new Bitmap(bitmap.Width,bitmap.Height);
            for(int i = 0 ; i < bitmap.Height ; i++)
                for (int j = 0; j < bitmap.Width; j++)
                {
                    Color col = bitmap.GetPixel(j, i);
                    int red = col.R + changeCol;
                    if (red > 255) red = 255;
                    if (red < 0) red = 0;
                    //col.R = red;
                    newBitmap.SetPixel(j, i, Color.FromArgb(red, col.G, col.B));
                }
            return newBitmap;  
        }

        private void trkRed_ValueChanged(object sender, EventArgs e)
        {
            //bmp = ChangeRedColor(bmp,(trkRed.Value-diffRed)*10);
            //diffRed = trkRed.Value;
            //pic_show.Refresh();
        }
    }
}
