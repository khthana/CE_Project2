using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Threading;
namespace MR
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		int cameraHandle = 0;
		int videoHandle = 0;


		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.StatusBar sb;
		private AxVIDEOOCXLib.AxVideoOCX Camera;
		private AxVIDEOOCXLib.AxVideoOCX Video;
		private System.Windows.Forms.MenuItem mnFile;
		private System.Windows.Forms.MenuItem mnFileRecord;
		private System.Windows.Forms.MenuItem mnFileExit;
		private System.Windows.Forms.MenuItem mnSeparater2;
		private System.Windows.Forms.MenuItem mnSetting;
		private System.Windows.Forms.MenuItem mnSettingVideoFormat;
		private System.Windows.Forms.MenuItem mnSettingVideoSource;
		private System.Windows.Forms.MenuItem mnSettingVideoDriver;
		private System.Windows.Forms.MenuItem mnSeparater3;
		private System.Windows.Forms.MenuItem mnSettingCaptureFromFile;
		private System.Windows.Forms.MenuItem mnFileSelectBGFolder;
		private System.Windows.Forms.MenuItem mnSeparater1;
		private System.Windows.Forms.MenuItem mnInit;
		private System.Windows.Forms.MenuItem mnStart;
		private System.Windows.Forms.MenuItem mnFileRecord2;
		private System.Windows.Forms.FolderBrowserDialog folderDlg;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
			this.folderDlg.SelectedPath = Application.StartupPath + @"\\room1";
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(running)
				{
					running = false;
					cameraThread.Join();
				}
				if(cameraHandle != 0)
				{
					Camera.Close();
					Camera.ReleaseImageHandle(cameraHandle);
				}

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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(Form1));
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.mnFile = new System.Windows.Forms.MenuItem();
			this.mnFileRecord = new System.Windows.Forms.MenuItem();
			this.mnFileRecord2 = new System.Windows.Forms.MenuItem();
			this.mnFileSelectBGFolder = new System.Windows.Forms.MenuItem();
			this.mnSeparater2 = new System.Windows.Forms.MenuItem();
			this.mnFileExit = new System.Windows.Forms.MenuItem();
			this.mnSetting = new System.Windows.Forms.MenuItem();
			this.mnSettingVideoFormat = new System.Windows.Forms.MenuItem();
			this.mnSettingVideoSource = new System.Windows.Forms.MenuItem();
			this.mnSettingVideoDriver = new System.Windows.Forms.MenuItem();
			this.mnSeparater3 = new System.Windows.Forms.MenuItem();
			this.mnSettingCaptureFromFile = new System.Windows.Forms.MenuItem();
			this.mnSeparater1 = new System.Windows.Forms.MenuItem();
			this.mnInit = new System.Windows.Forms.MenuItem();
			this.mnStart = new System.Windows.Forms.MenuItem();
			this.sb = new System.Windows.Forms.StatusBar();
			this.Camera = new AxVIDEOOCXLib.AxVideoOCX();
			this.Video = new AxVIDEOOCXLib.AxVideoOCX();
			this.folderDlg = new System.Windows.Forms.FolderBrowserDialog();
			((System.ComponentModel.ISupportInitialize)(this.Camera)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.Video)).BeginInit();
			this.SuspendLayout();
			// 
			// mainMenu1
			// 
			this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.mnFile,
																					  this.mnSetting,
																					  this.mnSeparater1,
																					  this.mnInit,
																					  this.mnStart});
			// 
			// mnFile
			// 
			this.mnFile.Index = 0;
			this.mnFile.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																				   this.mnFileRecord,
																				   this.mnFileRecord2,
																				   this.mnFileSelectBGFolder,
																				   this.mnSeparater2,
																				   this.mnFileExit});
			this.mnFile.Text = "File";
			// 
			// mnFileRecord
			// 
			this.mnFileRecord.Index = 0;
			this.mnFileRecord.Text = "Record (Mixed)";
			this.mnFileRecord.Click += new System.EventHandler(this.mnFileRecord_Click);
			// 
			// mnFileRecord2
			// 
			this.mnFileRecord2.Index = 1;
			this.mnFileRecord2.Text = "Record (Source)";
			this.mnFileRecord2.Click += new System.EventHandler(this.mnFileRecord2_Click);
			// 
			// mnFileSelectBGFolder
			// 
			this.mnFileSelectBGFolder.Index = 2;
			this.mnFileSelectBGFolder.Text = "Select BG Folder";
			this.mnFileSelectBGFolder.Click += new System.EventHandler(this.mnFileSelectBGFolder_Click);
			// 
			// mnSeparater2
			// 
			this.mnSeparater2.Index = 3;
			this.mnSeparater2.Text = "-";
			// 
			// mnFileExit
			// 
			this.mnFileExit.Index = 4;
			this.mnFileExit.Text = "Exit";
			this.mnFileExit.Click += new System.EventHandler(this.mnFileExit_Click);
			// 
			// mnSetting
			// 
			this.mnSetting.Index = 1;
			this.mnSetting.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.mnSettingVideoFormat,
																					  this.mnSettingVideoSource,
																					  this.mnSettingVideoDriver,
																					  this.mnSeparater3,
																					  this.mnSettingCaptureFromFile});
			this.mnSetting.Text = "Setting";
			// 
			// mnSettingVideoFormat
			// 
			this.mnSettingVideoFormat.Index = 0;
			this.mnSettingVideoFormat.Text = "Video Format";
			this.mnSettingVideoFormat.Click += new System.EventHandler(this.mnSettingVideoFormat_Click);
			// 
			// mnSettingVideoSource
			// 
			this.mnSettingVideoSource.Index = 1;
			this.mnSettingVideoSource.Text = "Video Source";
			this.mnSettingVideoSource.Click += new System.EventHandler(this.mnSettingVideoSource_Click);
			// 
			// mnSettingVideoDriver
			// 
			this.mnSettingVideoDriver.Index = 2;
			this.mnSettingVideoDriver.Text = "Video Driver";
			this.mnSettingVideoDriver.Click += new System.EventHandler(this.mnSettingVideoDriver_Click);
			// 
			// mnSeparater3
			// 
			this.mnSeparater3.Index = 3;
			this.mnSeparater3.Text = "-";
			// 
			// mnSettingCaptureFromFile
			// 
			this.mnSettingCaptureFromFile.Index = 4;
			this.mnSettingCaptureFromFile.Text = "Capture from File";
			this.mnSettingCaptureFromFile.Click += new System.EventHandler(this.mnSettingCaptureFromFile_Click);
			// 
			// mnSeparater1
			// 
			this.mnSeparater1.Enabled = false;
			this.mnSeparater1.Index = 2;
			this.mnSeparater1.Text = "|";
			// 
			// mnInit
			// 
			this.mnInit.Index = 3;
			this.mnInit.Text = "Init";
			this.mnInit.Click += new System.EventHandler(this.mnInit_Click);
			// 
			// mnStart
			// 
			this.mnStart.Enabled = false;
			this.mnStart.Index = 4;
			this.mnStart.Text = "Start";
			this.mnStart.Click += new System.EventHandler(this.mnStart_Click);
			// 
			// sb
			// 
			this.sb.Location = new System.Drawing.Point(0, 243);
			this.sb.Name = "sb";
			this.sb.Size = new System.Drawing.Size(640, 22);
			this.sb.TabIndex = 0;
			// 
			// Camera
			// 
			this.Camera.Enabled = true;
			this.Camera.Location = new System.Drawing.Point(0, 0);
			this.Camera.Name = "Camera";
			this.Camera.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("Camera.OcxState")));
			this.Camera.Size = new System.Drawing.Size(320, 240);
			this.Camera.TabIndex = 1;
			// 
			// Video
			// 
			this.Video.Enabled = true;
			this.Video.Location = new System.Drawing.Point(320, 0);
			this.Video.Name = "Video";
			this.Video.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("Video.OcxState")));
			this.Video.Size = new System.Drawing.Size(320, 240);
			this.Video.TabIndex = 1;
			// 
			// folderDlg
			// 
			this.folderDlg.SelectedPath = "D:\\docProject\\Mixed Reality for Presentation\\source\\MR\\room1";
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(640, 265);
			this.Controls.Add(this.Camera);
			this.Controls.Add(this.sb);
			this.Controls.Add(this.Video);
			this.Menu = this.mainMenu1;
			this.Name = "Form1";
			this.Text = "Mixed Reality";
			((System.ComponentModel.ISupportInitialize)(this.Camera)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.Video)).EndInit();
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

		private void mnFileRecord_Click(object sender, System.EventArgs e)
		{
			mnFileRecord.Checked = !mnFileRecord.Checked;
		
		}

		private void mnFileRecord2_Click(object sender, System.EventArgs e)
		{
			mnFileRecord2.Checked = !mnFileRecord2.Checked;
		}

		private void mnFileSelectBGFolder_Click(object sender, System.EventArgs e)
		{
			System.Windows.Forms.DialogResult result = folderDlg.ShowDialog();
			if(result == System.Windows.Forms.DialogResult.Cancel)
			{
			}				
		}

		private void mnFileExit_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void mnSettingVideoFormat_Click(object sender, System.EventArgs e)
		{
			if(cameraHandle == 0)
				return;

			if(!Camera.ShowFormatDlg())
			{
				MessageBox.Show(Camera.GetLastErrorString(),"VideoOCX Error");
				return;
			}

			Camera.ReleaseImageHandle(cameraHandle);

			Camera.Close();
			Camera.Init();

			cameraHandle = Camera.GetColorImageHandle();		
		}

		private void mnSettingVideoSource_Click(object sender, System.EventArgs e)
		{
			if(!Camera.ShowSourceDlg())
			{
				MessageBox.Show(Camera.GetLastErrorString(),"VideoOCX Error");
				return;
			}		
		}

		private void mnSettingVideoDriver_Click(object sender, System.EventArgs e)
		{
			if(!Camera.ShowDriverDlg())
			{
				MessageBox.Show(Camera.GetLastErrorString(),"VideoOCX Error");
				return;
			}
		
		}

		private void mnSettingCaptureFromFile_Click(object sender, System.EventArgs e)
		{
			mnSettingCaptureFromFile.Checked = !mnSettingCaptureFromFile.Checked;
			if(mnSettingCaptureFromFile.Checked)
			{
				Camera.Mode = 1;
			}
			else
			{
				Camera.Mode = 0;
			}		
		}

		private void mnInit_Click(object sender, System.EventArgs e)
		{
			if(cameraHandle == 0)
			{
				if(!Camera.Init())
				{
					MessageBox.Show(Camera.GetLastErrorString(),"VideoOCX Error");
					return;
				}
				
				cameraHandle = Camera.GetColorImageHandle();

				Camera.SetPreview(true);

				mnStart.Enabled = true;
				mnInit.Text = "Close";
			}
			else
			{
				if(!Camera.Close())
				{
					MessageBox.Show(Camera.GetLastErrorString(),"VideoOCX Error");
					return;
				}

				Camera.ReleaseImageHandle(cameraHandle);
				cameraHandle = 0;

				mnStart.Enabled = false;
				mnInit.Text = "Init";
			}
		
		}

		bool running = false;
		Thread cameraThread;

		private void mnStart_Click(object sender, System.EventArgs e)
		{
			if(!running)
			{
				running = true;

				cameraThread = new Thread(new ThreadStart(CaptureThread));
				cameraThread.Start();

				mnStart.Text = "Stop";
				mnInit.Enabled = false;

				mnFileRecord.Enabled = false;
				mnFileRecord2.Enabled = false;
			}
			else
			{
				running = false;
				cameraThread.Join();

				mnStart.Text = "Start";
				mnInit.Enabled = true;

				mnFileRecord.Enabled = true;
				mnFileRecord2.Enabled = true;
			}
		
		}

		Image dfImage;
		Bitmap dfBitmap;
		System.Drawing.Imaging.BitmapData dfData;

		Image dgImage;
		Bitmap dgBitmap;
		System.Drawing.Imaging.BitmapData dgData;

		Image bgImage;
		Bitmap bgBitmap;
		System.Drawing.Imaging.BitmapData bgData;

		unsafe void CaptureThread()
		{
			if(!Camera.Start())
			{
				MessageBox.Show(Video.GetLastErrorString(),"VideoOCX Error");
				return;
			}

			Camera.SetPreview(false);

			int width = Camera.GetImageWidth(cameraHandle);
			int height = Camera.GetImageHeight(cameraHandle);
			int size = Camera.GetImageDataSize(cameraHandle);

			System.Drawing.Rectangle rect = new System.Drawing.Rectangle(0,0,width,height);

			dfImage = ResizeBitmap((Bitmap)((Image)Bitmap.FromFile(folderDlg.SelectedPath+"\\depth-floor.jpg")),width,height);
			dfImage.RotateFlip(System.Drawing.RotateFlipType.RotateNoneFlipY);
			dfBitmap = (Bitmap)dfImage;
			dfData = dfBitmap.LockBits(rect,System.Drawing.Imaging.ImageLockMode.ReadOnly,System.Drawing.Imaging.PixelFormat.Format24bppRgb);

			dgImage = ResizeBitmap((Bitmap)((Image)Bitmap.FromFile(folderDlg.SelectedPath+"\\depth-guide.jpg")),width,height);
			dgImage.RotateFlip(System.Drawing.RotateFlipType.RotateNoneFlipY);
			dgBitmap = (Bitmap)dgImage;
			dgData = dgBitmap.LockBits(rect,System.Drawing.Imaging.ImageLockMode.ReadOnly,System.Drawing.Imaging.PixelFormat.Format24bppRgb);

			bgImage = ResizeBitmap((Bitmap)((Image)Bitmap.FromFile(folderDlg.SelectedPath+"\\room.jpg")),width,height);
			bgImage.RotateFlip(System.Drawing.RotateFlipType.RotateNoneFlipY);
			bgBitmap = (Bitmap)bgImage;
			bgData = bgBitmap.LockBits(rect,System.Drawing.Imaging.ImageLockMode.ReadOnly,System.Drawing.Imaging.PixelFormat.Format24bppRgb);

			byte * image = (byte *) Camera.GetDataPointer(cameraHandle);

			Camera.CtlCapture(cameraHandle);
			Camera.AVISaveFrameInit("temp.avi",cameraHandle,false);
			Camera.AVISaveFrameAdd(cameraHandle);
			Camera.AVISaveFrameClose();

			Video.Mode = 1;
			Video.InitFromFile("temp.avi");
			videoHandle = Video.GetColorImageHandle();
			Video.Start();
			byte *image2 = (byte *)Video.GetDataPointer(videoHandle);

			if(mnFileRecord.Checked)
			{
				if(!Video.AVISaveFrameInit("",videoHandle,true))
				{
					mnFileRecord.Checked = false;			
				}
			}
			if(mnFileRecord2.Checked)
			{
				if(!Camera.AVISaveFrameInit(Application.StartupPath+@"\\sourcevideo.avi",cameraHandle,!true))
				{
					mnFileRecord.Checked = false;			
				}
			}

			while(running)
			{
				Camera.CtlCapture(cameraHandle);
				
				byte *ptr = image;
				byte *ptr2 = image2;
				for(int i = 0; i < size; i++)
				{
					*ptr2++ = *ptr++;
				}

				byte *r = image2+2;
				byte *g = image2+1;
				byte *b = image2;

				byte * bgptr = (byte *)bgData.Scan0;
				byte * dgptr = (byte *)dgData.Scan0;
				byte * dfptr = (byte *)dfData.Scan0;

				int bottom = 0;
				byte fr = 0;

				for(int j = 0; j < height; j++)
				{
					for(int i = 0; i < width; i++)
					{
						if(*b > *g && *b > *r && (*b - *g > 50 || *b - *r > 50))
						{
						}
						else
						{
							if(bottom == 0)
							{
								bottom = j;
								fr = *dfptr;
							}
						}
						r+=3;g+=3;b+=3;					
						dfptr+=3;
					}
			
				}

				r = image2+2;
				g = image2+1;
				b = image2;

				bgptr = (byte *)bgData.Scan0;
				dgptr = (byte *)dgData.Scan0;
				dfptr = (byte *)dfData.Scan0;

				for(int j = 0; j < height; j++)
				{
					for(int i = 0; i < width; i++)
					{
						if(*b > *g && *b > *r && (*b - *g > 50 || *b - *r > 50))
						{
							*r = *(bgptr+2);
							*g = *(bgptr+1);
							*b = *bgptr;
						}
						else
						{
							if(*dgptr > fr)
							{
								*r = *(bgptr+2);
								*g = *(bgptr+1);
								*b = *bgptr;
							}			
						}
	
						bgptr+=3;
						dgptr+=3;
						r+=3;g+=3;b+=3;					
					}
				}

				Camera.CtlShow(cameraHandle);
				Video.CtlShow(videoHandle);

				if(mnFileRecord.Checked)
				{
					Video.AVISaveFrameAdd(videoHandle);
				}
				if(mnFileRecord2.Checked)
				{
					Camera.AVISaveFrameAdd(cameraHandle);
				}			
			}

			Video.Stop();
			Video.Close();
			Video.ReleaseImageHandle(videoHandle);

			if(mnFileRecord.Checked)
			{
				Video.AVISaveFrameClose();
			}
			if(mnFileRecord2.Checked)
			{
				Camera.AVISaveFrameClose();
			}

			if(!Camera.Stop())
			{
				MessageBox.Show(Camera.GetLastErrorString(),"VideoOCX Error");
				return;
			}

			Camera.SetPreview(true);
		}

		public Bitmap ResizeBitmap( Bitmap b, int nWidth, int nHeight )
		{  
			Bitmap result = new Bitmap( nWidth, nHeight );
			using( Graphics g = Graphics.FromImage( (Image) result ) )    
				g.DrawImage( b, 0, 0, nWidth, nHeight );  
			return result;
		}

	}
}
