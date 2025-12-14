using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Drawing.Drawing2D;
using System.IO;
using System.Threading;


namespace PhotoMosaic
{
	public class PhotoMosaic: System.Windows.Forms.Form
    {
        private System.Windows.Forms.PictureBox pic_original;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.MenuItem mnuMainPhoto;
        private System.Windows.Forms.MenuItem mnuCellPhoto;
		private System.Windows.Forms.MenuItem mnuHelp;
		private System.Windows.Forms.MenuItem menuItem17;
		private System.Windows.Forms.MenuItem menuItem18;
		private System.Windows.Forms.MenuItem Menu_File;
        private System.Windows.Forms.MenuItem Menu_New;
		private System.Windows.Forms.MenuItem mnuSaveMain;
        private System.Windows.Forms.MenuItem mnuExit;
		private System.Windows.Forms.MenuItem Menu_Tools;
        private System.Windows.Forms.MenuItem Menu_Help;
		private System.Windows.Forms.MenuItem mnuOverView;
		private System.Windows.Forms.MenuItem mnuOption;
        private System.Windows.Forms.MenuItem mnuProcess;
        private MenuItem mnuSaveLibrary;
        private ToolStripSeparator toolStripSeparator1;
        private ToolStripButton btnSaveMainPhoto;
        private ToolStripButton btnSaveLibrary;
        private ToolStripSeparator toolStripSeparator2;
        private ToolStripButton btnProcess;
        private ToolStripLabel toolStripLabel1;
        private ToolStripButton btn_BestFit;
        private ToolStripButton btn_ActualSize;
        private ToolStrip toolStrip1;
        private ToolStripLabel lab_total;
        private ToolStripProgressBar Progressbar;
        private MenuItem mnuView;
        private MenuItem mnuActualSize;
        private MenuItem mnuBestFit;
        private ToolStripLabel lab_process;
        private TextBox textBox;
        private ToolStripButton btnMainPhoto;
        private ToolStripButton btnCellPhoto;
        private BackgroundWorker backgroundWorker1;
        private System.ComponentModel.IContainer components;

		public PhotoMosaic()
		{
			InitializeComponent();	
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
		}
		#region Windows Form Designer generated code

		private void InitializeComponent()
		{
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PhotoMosaic));
            this.mainMenu1 = new System.Windows.Forms.MainMenu(this.components);
            this.Menu_File = new System.Windows.Forms.MenuItem();
            this.Menu_New = new System.Windows.Forms.MenuItem();
            this.mnuMainPhoto = new System.Windows.Forms.MenuItem();
            this.mnuCellPhoto = new System.Windows.Forms.MenuItem();
            this.mnuProcess = new System.Windows.Forms.MenuItem();
            this.menuItem17 = new System.Windows.Forms.MenuItem();
            this.mnuSaveMain = new System.Windows.Forms.MenuItem();
            this.mnuSaveLibrary = new System.Windows.Forms.MenuItem();
            this.menuItem18 = new System.Windows.Forms.MenuItem();
            this.mnuExit = new System.Windows.Forms.MenuItem();
            this.mnuView = new System.Windows.Forms.MenuItem();
            this.mnuActualSize = new System.Windows.Forms.MenuItem();
            this.mnuBestFit = new System.Windows.Forms.MenuItem();
            this.Menu_Tools = new System.Windows.Forms.MenuItem();
            this.mnuOverView = new System.Windows.Forms.MenuItem();
            this.mnuOption = new System.Windows.Forms.MenuItem();
            this.Menu_Help = new System.Windows.Forms.MenuItem();
            this.mnuHelp = new System.Windows.Forms.MenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripLabel1 = new System.Windows.Forms.ToolStripLabel();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.btnMainPhoto = new System.Windows.Forms.ToolStripButton();
            this.btnCellPhoto = new System.Windows.Forms.ToolStripButton();
            this.btnSaveMainPhoto = new System.Windows.Forms.ToolStripButton();
            this.btnSaveLibrary = new System.Windows.Forms.ToolStripButton();
            this.btnProcess = new System.Windows.Forms.ToolStripButton();
            this.lab_total = new System.Windows.Forms.ToolStripLabel();
            this.Progressbar = new System.Windows.Forms.ToolStripProgressBar();
            this.btn_BestFit = new System.Windows.Forms.ToolStripButton();
            this.btn_ActualSize = new System.Windows.Forms.ToolStripButton();
            this.lab_process = new System.Windows.Forms.ToolStripLabel();
            this.textBox = new System.Windows.Forms.TextBox();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.pic_original = new System.Windows.Forms.PictureBox();
            this.toolStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pic_original)).BeginInit();
            this.SuspendLayout();
            // 
            // mainMenu1
            // 
            this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
            this.Menu_File,
            this.mnuView,
            this.Menu_Tools,
            this.Menu_Help});
            // 
            // Menu_File
            // 
            this.Menu_File.Index = 0;
            this.Menu_File.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
            this.Menu_New,
            this.mnuProcess,
            this.menuItem17,
            this.mnuSaveMain,
            this.mnuSaveLibrary,
            this.menuItem18,
            this.mnuExit});
            this.Menu_File.Text = "file";
            // 
            // Menu_New
            // 
            this.Menu_New.Index = 0;
            this.Menu_New.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
            this.mnuMainPhoto,
            this.mnuCellPhoto});
            this.Menu_New.Text = "New";
            // 
            // mnuMainPhoto
            // 
            this.mnuMainPhoto.Index = 0;
            this.mnuMainPhoto.Text = "Main Photo";
            this.mnuMainPhoto.Click += new System.EventHandler(this.mnuMainPhoto_Click);
            // 
            // mnuCellPhoto
            // 
            this.mnuCellPhoto.Index = 1;
            this.mnuCellPhoto.Text = "Cell Photo";
            this.mnuCellPhoto.Click += new System.EventHandler(this.mnuCellPhoto_Click);
            // 
            // mnuProcess
            // 
            this.mnuProcess.Index = 1;
            this.mnuProcess.Text = "Process";
            this.mnuProcess.Click += new System.EventHandler(this.mnuProcess_Click);
            // 
            // menuItem17
            // 
            this.menuItem17.Index = 2;
            this.menuItem17.Text = "-";
            // 
            // mnuSaveMain
            // 
            this.mnuSaveMain.Index = 3;
            this.mnuSaveMain.Text = "Save Main Photo";
            this.mnuSaveMain.Click += new System.EventHandler(this.mnuSaveMain_Click);
            // 
            // mnuSaveLibrary
            // 
            this.mnuSaveLibrary.Index = 4;
            this.mnuSaveLibrary.Text = "Save Library";
            this.mnuSaveLibrary.Click += new System.EventHandler(this.mnuSaveLibrary_Click);
            // 
            // menuItem18
            // 
            this.menuItem18.Index = 5;
            this.menuItem18.Text = "-";
            // 
            // mnuExit
            // 
            this.mnuExit.Index = 6;
            this.mnuExit.Text = "Exit";
            this.mnuExit.Click += new System.EventHandler(this.mnuExit_Click);
            // 
            // mnuView
            // 
            this.mnuView.Index = 1;
            this.mnuView.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
            this.mnuActualSize,
            this.mnuBestFit});
            this.mnuView.Text = "View";
            // 
            // mnuActualSize
            // 
            this.mnuActualSize.Index = 0;
            this.mnuActualSize.Text = "Actual Size";
            this.mnuActualSize.Click += new System.EventHandler(this.mnuActualSize_Click);
            // 
            // mnuBestFit
            // 
            this.mnuBestFit.Index = 1;
            this.mnuBestFit.Text = "Best Fit";
            this.mnuBestFit.Click += new System.EventHandler(this.mnuBestFit_Click);
            // 
            // Menu_Tools
            // 
            this.Menu_Tools.Index = 2;
            this.Menu_Tools.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
            this.mnuOverView,
            this.mnuOption});
            this.Menu_Tools.Text = "Tools";
            // 
            // mnuOverView
            // 
            this.mnuOverView.Index = 0;
            this.mnuOverView.Text = "OverView";
            this.mnuOverView.Click += new System.EventHandler(this.mnuOverView_Click);
            // 
            // mnuOption
            // 
            this.mnuOption.Index = 1;
            this.mnuOption.Text = "option";
            this.mnuOption.Click += new System.EventHandler(this.mnuOption_Click);
            // 
            // Menu_Help
            // 
            this.Menu_Help.Index = 3;
            this.Menu_Help.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
            this.mnuHelp});
            this.Menu_Help.Text = "Help";
            // 
            // mnuHelp
            // 
            this.mnuHelp.Index = 0;
            this.mnuHelp.Text = "About  Mosaic";
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripLabel1
            // 
            this.toolStripLabel1.Name = "toolStripLabel1";
            this.toolStripLabel1.Size = new System.Drawing.Size(92, 22);
            this.toolStripLabel1.Text = "Total Cell Photo:  ";
            // 
            // toolStrip1
            // 
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.btnMainPhoto,
            this.btnCellPhoto,
            this.toolStripSeparator1,
            this.btnSaveMainPhoto,
            this.btnSaveLibrary,
            this.toolStripSeparator2,
            this.btnProcess,
            this.toolStripLabel1,
            this.lab_total,
            this.Progressbar,
            this.btn_BestFit,
            this.btn_ActualSize,
            this.lab_process});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(944, 25);
            this.toolStrip1.TabIndex = 42;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // btnMainPhoto
            // 
            this.btnMainPhoto.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnMainPhoto.Image = ((System.Drawing.Image)(resources.GetObject("btnMainPhoto.Image")));
            this.btnMainPhoto.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnMainPhoto.Name = "btnMainPhoto";
            this.btnMainPhoto.Size = new System.Drawing.Size(23, 22);
            this.btnMainPhoto.Text = "Main Photo";
            this.btnMainPhoto.Click += new System.EventHandler(this.btnMainPhoto_Click);
            // 
            // btnCellPhoto
            // 
            this.btnCellPhoto.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnCellPhoto.Image = ((System.Drawing.Image)(resources.GetObject("btnCellPhoto.Image")));
            this.btnCellPhoto.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnCellPhoto.Name = "btnCellPhoto";
            this.btnCellPhoto.Size = new System.Drawing.Size(23, 22);
            this.btnCellPhoto.Text = "Cell Photo";
            this.btnCellPhoto.Click += new System.EventHandler(this.btnCellPhoto_Click);
            // 
            // btnSaveMainPhoto
            // 
            this.btnSaveMainPhoto.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnSaveMainPhoto.Image = ((System.Drawing.Image)(resources.GetObject("btnSaveMainPhoto.Image")));
            this.btnSaveMainPhoto.ImageTransparentColor = System.Drawing.Color.DeepSkyBlue;
            this.btnSaveMainPhoto.Name = "btnSaveMainPhoto";
            this.btnSaveMainPhoto.Size = new System.Drawing.Size(23, 22);
            this.btnSaveMainPhoto.Text = "Save Main Photo";
            this.btnSaveMainPhoto.Click += new System.EventHandler(this.btnSaveMainPhoto_Click);
            // 
            // btnSaveLibrary
            // 
            this.btnSaveLibrary.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnSaveLibrary.Image = ((System.Drawing.Image)(resources.GetObject("btnSaveLibrary.Image")));
            this.btnSaveLibrary.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnSaveLibrary.Name = "btnSaveLibrary";
            this.btnSaveLibrary.Size = new System.Drawing.Size(23, 22);
            this.btnSaveLibrary.Text = "Save Library";
            // 
            // btnProcess
            // 
            this.btnProcess.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnProcess.Image = ((System.Drawing.Image)(resources.GetObject("btnProcess.Image")));
            this.btnProcess.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnProcess.Name = "btnProcess";
            this.btnProcess.Size = new System.Drawing.Size(23, 22);
            this.btnProcess.Text = "Process";
            this.btnProcess.Click += new System.EventHandler(this.btnProcess_Click);
            // 
            // lab_total
            // 
            this.lab_total.Name = "lab_total";
            this.lab_total.Size = new System.Drawing.Size(13, 22);
            this.lab_total.Text = "0";
            // 
            // Progressbar
            // 
            this.Progressbar.Name = "Progressbar";
            this.Progressbar.Size = new System.Drawing.Size(500, 22);
            // 
            // btn_BestFit
            // 
            this.btn_BestFit.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btn_BestFit.Image = global::ResizeImage.Properties.Resources.bestFitIcon;
            this.btn_BestFit.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btn_BestFit.Name = "btn_BestFit";
            this.btn_BestFit.Size = new System.Drawing.Size(23, 22);
            this.btn_BestFit.Text = "Best Fit";
            this.btn_BestFit.Click += new System.EventHandler(this.btn_BestFit_Click);
            // 
            // btn_ActualSize
            // 
            this.btn_ActualSize.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btn_ActualSize.Enabled = false;
            this.btn_ActualSize.Image = global::ResizeImage.Properties.Resources.actualsize2;
            this.btn_ActualSize.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btn_ActualSize.Name = "btn_ActualSize";
            this.btn_ActualSize.Size = new System.Drawing.Size(23, 22);
            this.btn_ActualSize.Text = "Actual Size";
            this.btn_ActualSize.Click += new System.EventHandler(this.btn_ActualSize_Click);
            // 
            // lab_process
            // 
            this.lab_process.Name = "lab_process";
            this.lab_process.Size = new System.Drawing.Size(0, 22);
            // 
            // textBox
            // 
            this.textBox.Location = new System.Drawing.Point(576, 38);
            this.textBox.Multiline = true;
            this.textBox.Name = "textBox";
            this.textBox.Size = new System.Drawing.Size(344, 415);
            this.textBox.TabIndex = 43;
            this.textBox.Visible = false;
            // 
            // pic_original
            // 
            this.pic_original.Image = ((System.Drawing.Image)(resources.GetObject("pic_original.Image")));
            this.pic_original.Location = new System.Drawing.Point(24, 53);
            this.pic_original.Name = "pic_original";
            this.pic_original.Size = new System.Drawing.Size(515, 400);
            this.pic_original.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pic_original.TabIndex = 8;
            this.pic_original.TabStop = false;
            this.pic_original.Paint += new System.Windows.Forms.PaintEventHandler(this.pic_original_Paint);
            // 
            // PhotoMosaic
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.AutoScroll = true;
            this.ClientSize = new System.Drawing.Size(944, 456);
            this.Controls.Add(this.textBox);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.pic_original);
            this.Menu = this.mainMenu1;
            this.Name = "PhotoMosaic";
            this.Text = "Photo Mosaic";
            this.TransparencyKey = System.Drawing.Color.WhiteSmoke;
            this.Click += new System.EventHandler(this.btnSaveLibrary_Click);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.PhotoMosaic_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pic_original)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

		}
		#endregion

		
		[STAThread]
		static void Main() 
		{
			Application.Run(new PhotoMosaic());
		}
		static public Bitmap bit_original ;
		static public Bitmap bit_original_show;
		private void Form1_Load(object sender, System.EventArgs e)
		{
			bit_original = new Bitmap(pic_original.Image);		
			bit_original_show = new Bitmap(bit_original,bit_original.Width,bit_original.Height);
		}
		ArrayList PicElement = new ArrayList();
		static public ArrayList PicElementPath = new ArrayList();
		
		private void pic_original_Paint(object sender, System.Windows.Forms.PaintEventArgs e)
        {
            if (!btn_ActualSize.Enabled)
            {
                e.Graphics.DrawImage(bit_original_show, 0, 0, bit_original_show.Width, bit_original_show.Height);
                pic_original.Width = bit_original_show.Width;
                pic_original.Height = bit_original_show.Height;
                }
                else
                {
                    int width = bit_original_show.Width;
                    int height = bit_original_show.Height;
                    if (width > (this.Size.Width - pic_original.Left))
                    {
                        width = this.Size.Width - pic_original.Left - 80;
                        height = (width * bit_original_show.Height) / bit_original_show.Width;
                    }
                    if (height > (this.Size.Height - pic_original.Top))
                    {
                        height = this.Height - pic_original.Top - 80;
                        width = (height * bit_original_show.Width) / bit_original_show.Height;
                    }
                    e.Graphics.DrawImage(bit_original_show, 0, 0, width, height);
                    pic_original.Width = width;
                    pic_original.Height = height;
                }
		}
		ArrayList AllElementPath = new ArrayList();
		private void process_ElementRectangle()
		{
			PicElement.Clear();
			lab_process.Text = "Process Cell Photo of Rectangle";
			AllElementPath.Clear();
            Progressbar.Maximum = PicElementPath.Count;
			for(int k =0;k< PicElementPath.Count; k++)
			{
				for(int t = 1;t < ((Array)(PicElementPath[k])).Length; t++)
				{
					string p = ((Array)(PicElementPath[k])).GetValue(t).ToString();
					if(p != "")
					{
						FileStream fs =  File.Open(p,FileMode.Open);
						Bitmap bmp =new Bitmap(new Bitmap(fs),20,20);
						Bitmap b = new Bitmap(2,3);
						int[] for_i = {0,bmp.Height/2,bmp.Height};
						int[] for_j = {0,bmp.Width/2,bmp.Width};
						for(int m = 0;m < 2; m++)
							for(int n = 0;n < 2; n++)
							{
								int R = 0,G = 0,B = 0;
								for(int i = for_i[m];i<for_i[m+1]; i++)
									for(int j=for_j[n];j< for_j[n+1];j++)
									{
										R += bmp.GetPixel(j,i).R;
										G += bmp.GetPixel(j,i).G;
										B += bmp.GetPixel(j,i).B;
									}
								R = R /(bmp.Width/2 * bmp.Height/2);
								G = G /(bmp.Width/2 * bmp.Height/2);
								B = B /(bmp.Width/2 * bmp.Height/2);
								b.SetPixel(m,n,Color.FromArgb(R,G,B));
							}
						int GrayScale = 0;
						for(int i  =0;i< bmp.Height;i+=2)
							for(int j =0;j < bmp.Width;j+=2)
								GrayScale += (bmp.GetPixel(j,i).R + bmp.GetPixel(j,i).B + bmp.GetPixel(j,i).B) /3;
						GrayScale /= (bmp.Width/2 * bmp.Height/2);
						b.SetPixel(1,2,Color.FromArgb(GrayScale,GrayScale,GrayScale));
						PicElement.Add(b);
						fs.Close();
						AllElementPath.Add(p);
					}
				}
                Progressbar.Increment(1);
			}
            Progressbar.Value = 0;
		}
		ArrayList PicElementHex = new ArrayList();
		int OtherElement  = 0;
		private void process_ElementHexagon()
		{
			int r = 8;
			SolidBrush brush = new SolidBrush(Color.White);
			Point p1 = new Point(Convert.ToInt32(r*Math.Cos(Math.PI/6)),0);
			Point p2 =new Point(0,Convert.ToInt16(r*Math.Sin(Math.PI/6)));
			Point p3 =new Point(2*Convert.ToInt16(r*Math.Cos(Math.PI/6)),Convert.ToInt16(r*Math.Sin(Math.PI/6)));
			Point p4 = new Point(0,Convert.ToInt32(r*Math.Sin(Math.PI/6))+r);
			Point p5 = new Point(2*Convert.ToInt16(r*Math.Cos(Math.PI/6)),Convert.ToInt32(r*Math.Sin(Math.PI/6))+r);
			Point p6 =new Point(Convert.ToInt32(r*Math.Cos(Math.PI/6)),(2*Convert.ToInt16(r*Math.Sin(Math.PI/6))) +r);
			
			Bitmap b_hexagon = new Bitmap(2*r,2*r);	
			Graphics g = Graphics.FromImage(b_hexagon);
			g.FillPolygon(brush,new Point[]{p1,p2,p4,p6,p5,p3});
			PicElementHex.Clear();
			lab_process.Text = "Process Cell Photo of Hexagon";
            Progressbar.Maximum = PicElementPath.Count;
			AllElementPath.Clear();
			for(int k = 0;k< PicElementPath.Count; k++)
			{
				for(int t = 1;t < ((Array)(PicElementPath[k])).Length; t++)
				{
					string p = ((Array)(PicElementPath[k])).GetValue(t).ToString();
					if(p != "")
					{
						FileStream fs =  File.Open(p,FileMode.Open);
						Bitmap bmp =new Bitmap(new Bitmap(fs),2*r,2*r);	
						Bitmap b = new Bitmap(2,2);
						int rsin30 = Convert.ToInt16(r*Math.Sin(Math.PI/6));
						int rcos30 = Convert.ToInt16(r*Math.Cos(Math.PI/6));
						int[] for_i = new int[]{0,r,0,r,r,2*r,r,2*r};
						int[] for_j = new int[]{0,rcos30,rcos30,2*rcos30,0,rcos30,rcos30,2*rcos30};
						int GrayScale = 0;
						for(int l =0;l < for_i.Length;l+=2)
						{
							int R = 0,G =0,B =0,c =0;
							for(int i =for_i[l];i< for_i[l+1];i++)
								for(int j =for_j[l];j<for_j[l+1];j++)
									if(b_hexagon.GetPixel(j,i).R == 255 && b_hexagon.GetPixel(j,i).G == 255 && b_hexagon.GetPixel(j,i).B == 255)
									{
										R += bmp.GetPixel(j,i).R;
										B += bmp.GetPixel(j,i).B;
										G += bmp.GetPixel(j,i).G;
										c++;
									}
							R /= c; G /= c; B /= c;
							b.SetPixel(l/4,(l/2)%2,Color.FromArgb(R,G,B));
							GrayScale += (R+G+B)/3;
						}
						PicElementHex.Add(b);
						fs.Close();
						AllElementPath.Add(p);
					}
				}
				Progressbar.Increment(1);
			}
			Progressbar.Value = 0;
		}

		public static bool rectangle = true;
		public static bool hexagon = false;
		public static bool tick_1 = true;
		public static bool tick_2 = true;
        public static bool split = true;
		
		public static int NoTileWidth = 10;
		public static int NoTileHeight =22 ;
		public static int MaxCellPhoto = 100;
		public static int MinDistanceCell = 0;
        public static bool rotate = true;
        public static bool mirror = true;
        public static bool changeColor = true;
        public static bool blurImage = false;
        public static int error = 20;
        public static int weight = 40;
        public int[] lineWidth;
        public int[] lineHeight;
        public int[, ,] pointPicElement;
		private void process_rectangle()
		{
			Double[,] DelayOriginal = new Double[NoTileWidth,NoTileHeight];
			int[,] ElementOriginal = new int[NoTileWidth,NoTileHeight];
            ClassPhotoMosaic classPhotoMosaic = new ClassPhotoMosaic();
            classPhotoMosaic.InitialArrayValue(DelayOriginal, -1);
            classPhotoMosaic.InitialArrayValueInt(ElementOriginal, -1);
			int tileWidth = bit_original_show.Width/NoTileWidth;
			int tileHeight = bit_original_show.Height/NoTileHeight;
			int CarryWidth = bit_original_show.Width%NoTileWidth;
			int CarryHeight = bit_original_show.Height%NoTileHeight;
			int startHeight = 0;
			lab_process.Text = "Process Main Photo Hexagon";
			Progressbar.Maximum = NoTileHeight * NoTileWidth;
            Bitmap picMain = new Bitmap(2, 2);
            Bitmap picMainCell = new Bitmap(2,2);
            lineWidth = new int[NoTileWidth];
            lineHeight = new int[NoTileHeight];
            int length = PicElement.Count;
            pointPicElement= new int[NoTileWidth,NoTileHeight,4];
            //create rotate
            if(rotate)
                classPhotoMosaic.AddRotateCell(PicElement);
            //create mirror
            if(mirror)
                classPhotoMosaic.AddMirror(PicElement);
			for(int i = 0; i<  NoTileHeight; i++)
			{
				int startWidth = 0;
				int OneHeight = 0;
				if(i < CarryHeight)
					OneHeight = 1;
                lineHeight[i] = startHeight + tileHeight + OneHeight;
				for(int j = 0;j< NoTileWidth;j++)
				{
					int OneWidth = 0;
					if(j< CarryWidth)
						OneWidth = 1;
					int[] for_k = {startHeight,(startHeight + (tileHeight+OneHeight)/4),(startHeight + (tileHeight+OneHeight)/2),(startHeight + (tileHeight+OneHeight)*3/4),(startHeight + tileHeight+OneHeight)};
					int[] for_l = {startWidth,(startWidth + (tileWidth + OneWidth)/4),(startWidth + (tileWidth + OneWidth)/2),(startWidth + (tileWidth + OneWidth)*3/4),(startWidth + tileWidth + OneWidth)};
                    if (i == 0)
                        lineWidth[j] = startWidth + tileWidth + OneWidth;
					for(int m = 0; m < 4;m+=2)
						for(int n = 0;n < 4;n+=2)
						{
							int count = 0;
                            int R = 0;
					        int G = 0;
					        int B = 0;
							for(int k = for_k[m] ; k < for_k[m+2]; k++)
								for (int l = for_l[n] ; l < for_l[n+2] ; l++)
								{
									count ++;
									R += bit_original_show.GetPixel(l,k).R;
									G += bit_original_show.GetPixel(l,k).G;
									B += bit_original_show.GetPixel(l,k).B;	
								}
                            picMain.SetPixel(m/2,n/2,Color.FromArgb(R/count,G/count,B/count));
						}
                    ArrayList newPicElement = new ArrayList();
                    newPicElement = classPhotoMosaic.BlindPicElement(PicElement, rotate, mirror, pointPicElement, i, j);
                    Bitmap bmpMain = classPhotoMosaic.CutImage(bit_original_show, startWidth, startHeight, tileWidth + OneWidth, tileHeight + OneHeight);
                    if (!PhotoMosaic.changeColor)
                    {  
                        int[] result = classPhotoMosaic.FindBestCell(picMain, newPicElement);
                        Bitmap b = resideProceesRectangle(result, length, tileWidth + OneWidth, tileHeight + OneHeight, i, j, 0);
                        PaintMain(b, startWidth, startHeight, tileWidth + OneWidth, tileHeight + OneHeight);
                    }
                    else
                    {
                        int[] result = classPhotoMosaic.ChangeColorSameVector(picMain, newPicElement, error, error*2);
                        if (result[0] != -1)
                        {
                            Bitmap b = resideProceesRectangle(result, length, tileWidth + OneWidth, tileHeight + OneHeight, i, j, 0);
                            b = classPhotoMosaic.MixImage(bmpMain, b, weight, 100 - weight);
                            PaintMain(b, startWidth, startHeight, tileWidth + OneWidth, tileHeight + OneHeight);
                        }
                        else
                        {
                            if (split)
                            {
                                int[] indexCell4Tile = new int[4];
                                for (int o = 0; o < 2; o++)
                                    for (int p = 0; p < 2; p++)
                                    {
                                        for (int m = p * 2; m < (p + 1) * 2; m++)
                                            for (int n = o * 2; n < (o + 1) * 2; n++)
                                            {
                                                int count = 0;
                                                int R = 0;
                                                int G = 0;
                                                int B = 0;
                                                for (int k = for_k[m]; k < for_k[m + 1]; k++)
                                                    for (int l = for_l[n]; l < for_l[n + 1]; l++)
                                                    {
                                                        count++;
                                                        R += bit_original_show.GetPixel(l, k).R;
                                                        G += bit_original_show.GetPixel(l, k).G;
                                                        B += bit_original_show.GetPixel(l, k).B;
                                                    }
                                                picMainCell.SetPixel(m - (p * 2), n - (o * 2), Color.FromArgb(R / count, G / count, B / count));
                                            }
                                        Bitmap bmpMainCell = classPhotoMosaic.CutImage(bit_original_show, for_l[p * 2], for_k[o * 2], for_l[(p + 1) * 2] - for_l[p * 2], for_k[(o + 1) * 2] - for_k[o * 2]);
                                        result = classPhotoMosaic.ChangeColorSameVector(picMainCell, newPicElement, error, error * 2);
                                        indexCell4Tile[(2 * o) + (p * 1)] = result[0];
                                        if (result[0] == -1)
                                            result = classPhotoMosaic.FindBestCellSameVector(picMainCell, PicElement);
                                        Bitmap b = resideProceesRectangle(result, length, tileWidth / 2, tileHeight / 2, i, j, ((o * 2) + p));
                                        b = classPhotoMosaic.MixImage(bmpMainCell, b, weight, 100 - weight);
                                        PaintMain(b, startWidth + (p * tileWidth / 2), startHeight + (o * tileHeight / 2), tileWidth / 2, tileHeight / 2);
                                    }
                                int isFree4Tile = 0;
                                for (int k = 0; k < 4; k++)
                                    if (indexCell4Tile[k] == -1) isFree4Tile++;
                                if (isFree4Tile == 4)
                                {
                                    result = classPhotoMosaic.FindBestCellSameVector(picMain, newPicElement);
                                    Bitmap b = resideProceesRectangle(result, length, tileWidth + OneWidth, tileHeight + OneHeight, i, j, 0);
                                    b = classPhotoMosaic.MixImage(bmpMain, b, weight, 100 - weight);
                                    PaintMain(b, startWidth, startHeight, tileWidth + OneWidth, tileHeight + OneHeight);
                                }
                            }
                            else
                            {
                                result  = classPhotoMosaic.FindBestCell(picMain, newPicElement);
                                Bitmap b = resideProceesRectangle(result, length, tileWidth + OneWidth, tileHeight + OneHeight, i, j, 0);
                                PaintMain(b, startWidth, startHeight, tileWidth + OneWidth, tileHeight + OneHeight);
                            }
                        }
                        
                    }
					startWidth += tileWidth  ;
					startWidth += OneWidth;
					Progressbar.Increment(1);
				}
				startHeight += tileHeight;
				startHeight += OneHeight;				
			}
			Progressbar.Value = 0;
            if (blurImage)
            {
                classPhotoMosaic.BlurImage(bit_original_show, lineWidth, lineHeight,4);
                pic_original.Refresh();
            }
            if (option.IsRoof)
            {
                int widthBlur = bit_original_show.Width * 1 / 200;
                classPhotoMosaic.SeperateImage(bit_original_show, lineWidth, lineHeight, widthBlur);
                pic_original.Refresh();
            }

		}
        public Bitmap resideProceesRectangle(int[] result,int length,int width,int height,int i , int j , int sub)
        {
            int tileWidth = bit_original_show.Width / NoTileWidth;
            int tileHeight = bit_original_show.Height / NoTileHeight;
            int rangRotate = 0;
            int isMirror = 0;
            if (rotate && mirror)
            {
                rangRotate = (result[0] / length) % 4;
                isMirror = result[0] / (4 * length); //normal = 0 ; mirror = 1;   
            }
            if (rotate && !mirror)
                rangRotate = result[0] / length;
            if (!rotate && mirror)
                isMirror = result[0] / length;
            result[0] = result[0] % length;
            pointPicElement[j, i, sub] = result[0];
            //ในกรณี ไม่มี tile แบ่งย่อย
            if (sub == 0)
                for (int k = 1; k < 4; k++)
                    pointPicElement[j, i, k] = -1;
            FileStream fs = File.Open(AllElementPath[result[0]].ToString(), FileMode.Open);
            Bitmap b = new Bitmap(new Bitmap(fs), width, height);
            fs.Close();
            if (rangRotate == 1) b.RotateFlip(RotateFlipType.Rotate90FlipNone);
            if (rangRotate == 2) b.RotateFlip(RotateFlipType.Rotate180FlipNone);
            if (rangRotate == 3) b.RotateFlip(RotateFlipType.Rotate270FlipNone);
            if (isMirror == 1)
            {
                Bitmap temp = new Bitmap(b.Width, b.Height);
                for (int m = 0; m < b.Height; m++)
                    for (int n = 0; n < b.Width; n++)
                    {
                        temp.SetPixel(n, m, b.GetPixel(b.Width - 1 - n, m));
                    }
                b = new Bitmap(temp);
            }
           
            ///////changecolor
            ClassPhotoMosaic classphotomosaic = new ClassPhotoMosaic();
            double gammaR = 1 - (Math.Abs(result[1]) * 0.013);//0.013 is constant for find gamma
            double gammaG = 1 - (Math.Abs(result[2]) * 0.013);
            double gammaB = 1 - (Math.Abs(result[3]) * 0.013);
            if (result[1] < 0) gammaR = (double)Decimal.Divide(1, (decimal)gammaR);
            if (result[2] < 0) gammaG = (double)Decimal.Divide(1, (decimal)gammaG);
            if (result[3] < 0) gammaB = (double)Decimal.Divide(1, (decimal)gammaB);
            if (gammaR < 0) gammaR = 0.01;
            if (gammaG < 0) gammaG = 0.01;
            if (gammaB < 0) gammaB = 0.01;
            b = classphotomosaic.PowerLaw(b, gammaR, gammaG, gammaB);
            return b;
        }
        public void PaintMain (Bitmap b,int startWidth, int startHeight, int width, int height)
        {
            Graphics g = Graphics.FromImage(bit_original_show);
            g.DrawImage(b, startWidth, startHeight, width, height);
            pic_original.Refresh(); 
        }
		public static double RHexa = 6;
		private void process_Hexagon()
		{
            Bitmap OldBitmap = new Bitmap(bit_original_show);
            int length = PicElementHex.Count;
            int oldwidth = bit_original_show.Width;
			int oldheight = bit_original_show.Height;
			int r = Convert.ToInt16(RHexa);
			int rsin30 = Convert.ToInt16(r*Math.Sin(Math.PI/6));
			int rcos30 = Convert.ToInt16(r*Math.Cos(Math.PI/6));
			int blockX = bit_original_show.Width/(2*rcos30) + 3;
			int blockY = bit_original_show.Height/((3*r)/2) +3;

			bit_original = new Bitmap(bit_original_show.Width+(4*rcos30),bit_original_show.Height+(4*r));
			Graphics original = Graphics.FromImage(bit_original);
			original.FillRectangle(new SolidBrush(Color.Gray),0,0,bit_original.Width,bit_original.Height);
			original.DrawImage(bit_original_show,rcos30,r/2,bit_original_show.Width,bit_original_show.Height);
			bit_original_show = new Bitmap(bit_original);
			
			SolidBrush brush = new SolidBrush(Color.White);
			Point p1 = new Point(Convert.ToInt32(r*Math.Cos(Math.PI/6))-1,1);
			Point p2 =new Point(0,Convert.ToInt16(r*Math.Sin(Math.PI/6)));
			Point p3 =new Point(2*Convert.ToInt16(r*Math.Cos(Math.PI/6))-1,Convert.ToInt16(r*Math.Sin(Math.PI/6))+1);
			Point p4 = new Point(0,Convert.ToInt32(r*Math.Sin(Math.PI/6))+r);
			Point p5 = new Point(2*Convert.ToInt16(r*Math.Cos(Math.PI/6))-1,Convert.ToInt32(r*Math.Sin(Math.PI/6))+r-1);
			Point p6 =new Point(Convert.ToInt32(r*Math.Cos(Math.PI/6))-1,(2*Convert.ToInt16(r*Math.Sin(Math.PI/6))) +r);		
			Bitmap b_hexagon = new Bitmap(2*r,2*r);	
			Graphics g = Graphics.FromImage(b_hexagon);
			g.FillPolygon(brush,new Point[]{p1,p2,p4,p6,p5,p3});
			int[,] DelayOriginalHex = new int[blockX,blockY];
			int[,] ElementOriginalHex =  new int[blockX,blockY];
            ClassPhotoMosaic classPhotoMosaic = new ClassPhotoMosaic();
            //create rotate
            if (rotate)
                classPhotoMosaic.AddRotateCell(PicElementHex);
            //create mirror
            if (mirror)
                classPhotoMosaic.AddMirror(PicElementHex);
			
			int startX = 0;
			int startY = 0;			
			int ElementY =0;
						
			lab_process.Text = "Process Main Photo Hexagon";
			int height = bit_original.Height/(r+rsin30);
			if(bit_original.Height - (height * (r+rsin30)) < rsin30)
				height --;
			Progressbar.Maximum = (bit_original.Width/(2*rcos30)) * height;
            if (option.IsRoof)
            {
                //draw black panel
                g = Graphics.FromImage(bit_original_show);
                g.FillRectangle(new SolidBrush(Color.Black), 0, 0, bit_original_show.Width, bit_original_show.Height);
            }
            //วนทั้งภาพ
			while(startY <= bit_original.Height- (r*2))
			{
				int ElementX =0;
				if(ElementY%2 == 0)
				startX = 0;
				else
				startX = Convert.ToInt16(r*Math.Cos(Math.PI/6));
				while(startX <= bit_original.Width - (2*Convert.ToInt16(r*Math.Cos(Math.PI/6))))
				{
					int c = 0;
                    int[] for_i = new int[] { 0, r, 0, r, r, 2 * r, r, 2 * r };
                    int[] for_j = new int[] { 0, rcos30, rcos30, 2 * rcos30, 0, rcos30, rcos30, 2 * rcos30 };
                    //เก็บสีที่ main photo
                    Bitmap picMain = new Bitmap(2, 2);
					for(int k =0; k< for_i.Length;k+=2)
					{
						c= 0;
                        int R = 0, G = 0, B = 0;
						for(int i = for_i[k]; i < for_i[k+1];i++)
							for(int j = for_j[k]; j <for_j[k+1];j++)
								if(b_hexagon.GetPixel(j,i).R == 255 && b_hexagon.GetPixel(j,i).G == 255 && b_hexagon.GetPixel(j,i).B == 255)
								{
									R += bit_original.GetPixel(j+startX,i+startY).R;
									G += bit_original.GetPixel(j+startX,i+startY).G;
									B += bit_original.GetPixel(j+startX,i+startY).B;
									c++;
								}
                        picMain.SetPixel(k / 4, (k / 2) % 2, Color.FromArgb(R/c, G/c, B/c));
					}
                    int[] result = new int[4];
                    if(!changeColor)
					    //FindBestCell
                        result= classPhotoMosaic.FindBestCell(picMain,PicElementHex);
                    else
                    {
                        result = classPhotoMosaic.ChangeColorSameVector(picMain, PicElementHex, error, error*2);
                        if (result[0] == -1)
                        {
                            result = classPhotoMosaic.FindBestCell(picMain, PicElementHex);
                        }
                    }

                    int rangRotate = 0;
                    int isMirror = 0;
                    if (rotate && mirror)
                    {
                        rangRotate = (result[0] / length) % 4;
                        isMirror = result[0] / (4 * length); //normal = 0 ; mirror = 1;   
                    }
                    if (rotate && !mirror)
                        rangRotate = result[0] / length;
                    if (!rotate && mirror)
                        isMirror = result[0] / length;
                    result[0] = result[0] % length;
                    //pointPicElementHex[j, i, sub] = result[0];
                    FileStream fs = File.Open(AllElementPath[result[0]].ToString(), FileMode.Open);
                    Bitmap bmp = new Bitmap(new Bitmap(fs), 2*r,2*r);
                    fs.Close();
                    if (rangRotate == 1) bmp.RotateFlip(RotateFlipType.Rotate90FlipNone);
                    if (rangRotate == 2) bmp.RotateFlip(RotateFlipType.Rotate180FlipNone);
                    if (rangRotate == 3) bmp.RotateFlip(RotateFlipType.Rotate270FlipNone);
                    if (isMirror == 1)
                    {
                        Bitmap temp = new Bitmap(bmp.Width, bmp.Height);
                        for (int m = 0; m < bmp.Height; m++)
                            for (int n = 0; n < bmp.Width; n++)
                            {
                                temp.SetPixel(n, m, bmp.GetPixel(bmp.Width - 1 - n, m));
                            }
                        bmp = new Bitmap(temp);
                    }
                    double gammaR = 1 - (Math.Abs(result[1]) * 0.013);//0.013 is constant for find gamma
                    double gammaG = 1 - (Math.Abs(result[2]) * 0.013);
                    double gammaB = 1 - (Math.Abs(result[3]) * 0.013);
                    if (result[1] < 0) gammaR = (double)Decimal.Divide(1, (decimal)gammaR);
                    if (result[2] < 0) gammaG = (double)Decimal.Divide(1, (decimal)gammaG);
                    if (result[3] < 0) gammaB = (double)Decimal.Divide(1, (decimal)gammaB);
                    if (gammaR < 0) gammaR = 0.01;
                    if (gammaG < 0) gammaG = 0.01;
                    if (gammaB < 0) gammaB = 0.01;
                    bmp = classPhotoMosaic.PowerLaw(bmp, gammaR, gammaG, gammaB);
                    //Paint 
                    for (int k = 0; k < for_i.Length; k += 2)
                    {
                        for (int i = for_i[k]; i < for_i[k + 1]; i++)
                            for (int j = for_j[k]; j < for_j[k + 1]; j++)
                                if (b_hexagon.GetPixel(j, i).R == 255 && b_hexagon.GetPixel(j, i).G == 255 && b_hexagon.GetPixel(j, i).B == 255)
                                {
                                    bit_original_show.SetPixel(j + startX, i + startY, bmp.GetPixel(j, i));
                                }
                    }
				   pic_original.Refresh();
					startX += 2*Convert.ToInt16(r*Math.Cos(Math.PI/6));
					ElementX++;
					Progressbar.Increment(1);
				}
				startY += (r*3)/2;
				ElementY++;
			}
			Bitmap bit_temp =new Bitmap(bit_original_show);
			bit_original_show =new Bitmap(oldwidth,oldheight);
			for(int i = 0;i<oldheight;i++)
				for(int j =0;j<oldwidth;j++)
				{
					bit_original_show.SetPixel(j,i,bit_temp.GetPixel(j+rcos30,i+r/2));
				}
			Progressbar.Value = 0;
            pic_original.Refresh();
            if(!option.IsRoof)
                bit_original_show = classPhotoMosaic.MixImage(OldBitmap, bit_original_show, weight, 100 - weight);
            pic_original.Refresh();	
        }
		private void Menu_OpenPicture_Click(object sender, System.EventArgs e)
		{
			using (OpenFileDialog ofd = new OpenFileDialog())
			{
				ofd.Filter = "Image files|*.gif;*.jpg;*.jepg;*.bmp;*.png;*.tif;*.tiff";
				ofd.RestoreDirectory = true;
				if(ofd.ShowDialog() == DialogResult.OK)
				{	
					FileStream fs = File.Open(ofd.FileName,FileMode.Open);               
					bit_original = new Bitmap(fs);
					bit_original_show = bit_original;                  
					pic_original.Refresh();
					fs.Close();
				}
			}
		}
		public static bool GrayScalePhoto = false;
		public static int TypeSizeMain ;
	
		public static string FileName = "Path :";
		public static string OriginalWidth ;
		public static string OriginalHeight;
		public static bool ActualSize = true;

		private void mnuProcess_Click(object sender, System.EventArgs e)
		{
            btnProcess_Click(sender, e);
		}

		private void mnuSaveMain_Click(object sender, System.EventArgs e)
		{
            btnSaveMainPhoto_Click(sender, e);
		}

		private void mnuExit_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}
		CellPhoto cellphoto;

		public static ImageList MainImagelist = new ImageList();
        public bool librayChange = false;
		public void NewCellPhoto()
		{
			cellphoto = new CellPhoto(MainImagelist,PicElementPath,librayChange);
			cellphoto.ShowDialog();
			if(cellphoto.OK)
			{
				MainImagelist = cellphoto.CloneImageList(CellPhoto.imagelist,MainImagelist);
				//listView.SmallImageList = MainImagelist;
				//listView.Clear();
				for(int i = 0 ;i< MainImagelist.Images.Count;i++)
				{
					ListViewItem item = new ListViewItem(i.ToString());
					item.ImageIndex = i;
				//	listView.Items.Add(item);
				}
				lab_total.Text = MainImagelist.Images.Count.ToString();
				PicElementPath = (ArrayList)cellphoto.PicElementPathCell.Clone();
                librayChange = cellphoto.libraryChange;
			}
			
		}
        Option option = new Option();
		private void mnuOption_Click(object sender, System.EventArgs e)
		{
			option.ShowDialog();
		}

		private void mnuOverView_Click(object sender, System.EventArgs e)
		{
			OverView overview = new OverView();
            overview.TileWidth = Convert.ToDouble(NoTileWidth);
            overview.Polygon = rectangle;
			overview.NoTileHeight = NoTileHeight;
			overview.NoTileWidth = NoTileWidth;
			overview.Show();
		}
        private void btnSaveMainPhoto_Click(object sender, EventArgs e)
        {
            SaveMainPhoto();
        }
        public string mainPhotoPath = "";
        private void SaveMainPhoto()
        {
            
                SaveFileDialog sfd = new SaveFileDialog();
                sfd.Filter = "Gif files|*.gif|Jpeg |*.jpg;*.jepg|Bitmap|*.bmp|Png|*.png|Tiff files|*.tif;*.tiff";

                if (sfd.ShowDialog() == DialogResult.OK)
                {
                    FileStream s = new FileStream(sfd.FileName.ToString(), FileMode.OpenOrCreate);
                    bit_original_show.Save(s, System.Drawing.Imaging.ImageFormat.Jpeg);
                    s.Close();
                    mainPhotoPath = sfd.FileName;
                }
        }
        public bool mainPhotoChange = false;
        private void btnProcess_Click(object sender, EventArgs e)
        {
			string Info = "Create Photot Mosaic \n with Size " + bit_original_show.Width.ToString()+ "x" + bit_original_show.Height.ToString() +"\n Cell Photo : " + lab_total.Text;
			DialogResult result =  MessageBox.Show(Info,"Mosaic",MessageBoxButtons.OKCancel,MessageBoxIcon.Information);
			if(result == DialogResult.OK)
			{
                if (lab_total.Text == "0")
                    MessageBox.Show("Please insert cell photo", "warning", MessageBoxButtons.OK);
                else
                {
                    if (option.IsRoof)
                    {
                        changeColor = false;
                        rotate = false;
                        mirror = false;
                    }

                    if (rectangle)
                    {
                        process_ElementRectangle();
                        process_rectangle();
                    }
                    else if (hexagon)
                    {
                        process_ElementHexagon();
                        process_Hexagon();
                    }
                    bit_original = new Bitmap(bit_original_show);
                }
		    }
        }

        private void btn_BestFit_Click(object sender, EventArgs e)
        {
            btn_ActualSize.Enabled = true;
            btn_BestFit.Enabled = false;
            pic_original.Refresh();
        }

        private void btn_ActualSize_Click(object sender, EventArgs e)
        {
            btn_BestFit.Enabled = true;
			btn_ActualSize.Enabled =false;
			pic_original.Refresh();
        }

        private void btnSaveLibrary_Click(object sender, EventArgs e)
        {
            SaveLibrary();
        }
        private void SaveLibrary()
        {
            SaveFileDialog sfd = new SaveFileDialog();

            sfd.Filter = "Text File|*.txt";

            if (sfd.ShowDialog() == DialogResult.OK)
            {
                TextWriter tx = new StreamWriter(sfd.FileName);
                for (int i = 0; i < PicElementPath.Count; i++)
                {
                    tx.WriteLine(((Array)PicElementPath[i]).GetValue(0));
                }
                tx.Close();
                
            }
        }
        private void btnMainPhoto_Click(object sender, EventArgs e)
        {
            MainPhoto editmain = new MainPhoto(bit_original, bit_original_show, GrayScalePhoto, TypeSizeMain);
            editmain.ShowDialog();
            pic_original.Refresh();
        }

        private void btnCellPhoto_Click(object sender, EventArgs e)
        {
            NewCellPhoto();
        }
        private void PhotoMosaic_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (librayChange)
            {
                string info = "Do you want to save chage of Library?";
                DialogResult result = MessageBox.Show(info, "Save Change", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    SaveLibrary();
                }
                if (result == DialogResult.Cancel)
                {
                    e.Cancel = true;
                }
            }
            if (mainPhotoChange)
            {
                string info = "Do you want to save change of main photo?";
                DialogResult result = MessageBox.Show(info, "Save Change", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
                if (result == DialogResult.OK)
                {
                    SaveMainPhoto();
                }
            }
        }

        private void mnuMainPhoto_Click(object sender, EventArgs e)
        {
            btnMainPhoto_Click(sender, e);
        }

        private void mnuCellPhoto_Click(object sender, EventArgs e)
        {
            btnCellPhoto_Click(sender, e);
        }

        private void mnuSaveLibrary_Click(object sender, EventArgs e)
        {
            SaveLibrary();
        }

        private void mnuActualSize_Click(object sender, EventArgs e)
        {
            btn_ActualSize_Click(sender, e);
        }

        private void mnuBestFit_Click(object sender, EventArgs e)
        {
            btn_BestFit_Click(sender, e);
        }
    }
}
