using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Reflection;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Drawing.Imaging;

using WIALib;
using WIAVIDEOLib;

namespace WebCamServer
{
	/// <summary>
	/// Summary description for WebCamServer.
	/// </summary>
	public class WebCamServer : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Panel panPreview;
		private System.Windows.Forms.PictureBox pictureBox;
		private System.Windows.Forms.PictureBox picShow;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.MenuItem mnuFile;
		private System.Windows.Forms.MenuItem mnuExit;
		private System.Windows.Forms.StatusBar statusBarMain;
		private System.Windows.Forms.StatusBarPanel statBarPrim;
		private System.Windows.Forms.ComboBox cmbCamera;
		private System.Windows.Forms.Timer timer;
		private System.Windows.Forms.Timer dtimer;
		private System.ComponentModel.IContainer components;

		const int MAX_CLIENTS = 10;		//Max client = 10 pocket pc

		//Socket variable
		private static int size = 40000;		//Size of picture
		private byte[] data = new byte[size];	//Data of picture
		private Socket server;						//Server socket
		private Socket[] client = new Socket[MAX_CLIENTS];	//Client socket
		private int clientCount = 0;				//Amount of connected client

		//Image Processing variable
		private MotionDetector	motionDetector = new MotionDetector();
		private Bitmap lastFrame = null;	//Picture with box around object
		private bool isDetect = false;		//Flag: is object detected?

		//Rectangle variable
		private int recX = 0;
		private int recY = 0;
		private int recW =320; 
		private int recH = 240;
		private bool newRect = false;		//Flag: dose user choose object?

		//webcam variable
		private object[] camID = new object[5];
		private int camCount = 0;				//Amount of connected webcam
		private string videoDir;				//Directory of video
		private bool isChangeCam = false;	//Flag: is user change webcam?
		private int camNumber = 0;		//Number of webcam

		private WiaClass wiaMgr;			//WIA manager COM object
		private ItemClass wiaCamera;	//WIA camera device item
		private string selectedID;			//WIA ID of currently selected device
		private bool firstActive;				//To detect first form activation
		private WiaVideoClass	wiaVideo;		//IWiaVideo video COM interface wrapper

		private bool	 videoLive;				//Flag: is video stream created?
		private bool videoVisible;			//Flag: is video visible?
		private string jpgFile;					//File name of video jpeg picture
		private Image pic;							//Image Object

		/// <summary>
		/// Constructer
		/// Create TCP/IP Connection, socket and begin to accept
		/// </summary>
		public WebCamServer()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//

			//TCP/IP Connection
			server = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
			IPEndPoint iep = new IPEndPoint(IPAddress.Any, 9050);
			server.Bind(iep);
			server.Listen(5);
			server.BeginAccept(new AsyncCallback(AcceptConn), server);
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(WebCamServer));
			this.label1 = new System.Windows.Forms.Label();
			this.panPreview = new System.Windows.Forms.Panel();
			this.pictureBox = new System.Windows.Forms.PictureBox();
			this.picShow = new System.Windows.Forms.PictureBox();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.mnuFile = new System.Windows.Forms.MenuItem();
			this.mnuExit = new System.Windows.Forms.MenuItem();
			this.statusBarMain = new System.Windows.Forms.StatusBar();
			this.statBarPrim = new System.Windows.Forms.StatusBarPanel();
			this.cmbCamera = new System.Windows.Forms.ComboBox();
			this.timer = new System.Windows.Forms.Timer(this.components);
			this.dtimer = new System.Windows.Forms.Timer(this.components);
			this.panPreview.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.statBarPrim)).BeginInit();
			this.SuspendLayout();
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(176, 8);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(56, 16);
			this.label1.TabIndex = 1;
			this.label1.Text = "Camera :";
			// 
			// panPreview
			// 
			this.panPreview.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.panPreview.Controls.Add(this.pictureBox);
			this.panPreview.Location = new System.Drawing.Point(8, 40);
			this.panPreview.Name = "panPreview";
			this.panPreview.Size = new System.Drawing.Size(320, 240);
			this.panPreview.TabIndex = 3;
			this.panPreview.Resize += new System.EventHandler(this.panPreview_Resize);
			// 
			// pictureBox
			// 
			this.pictureBox.Location = new System.Drawing.Point(8, 8);
			this.pictureBox.Name = "pictureBox";
			this.pictureBox.Size = new System.Drawing.Size(320, 240);
			this.pictureBox.TabIndex = 0;
			this.pictureBox.TabStop = false;
			this.pictureBox.Visible = false;
			// 
			// picShow
			// 
			this.picShow.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.picShow.Location = new System.Drawing.Point(8, 288);
			this.picShow.Name = "picShow";
			this.picShow.Size = new System.Drawing.Size(320, 240);
			this.picShow.TabIndex = 4;
			this.picShow.TabStop = false;
			// 
			// mainMenu1
			// 
			this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.mnuFile});
			// 
			// mnuFile
			// 
			this.mnuFile.Index = 0;
			this.mnuFile.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					this.mnuExit});
			this.mnuFile.Text = "&File";
			// 
			// mnuExit
			// 
			this.mnuExit.Index = 0;
			this.mnuExit.Text = "E&xit";
			this.mnuExit.Click += new System.EventHandler(this.mnuExit_Click);
			// 
			// statusBarMain
			// 
			this.statusBarMain.Location = new System.Drawing.Point(0, 529);
			this.statusBarMain.Name = "statusBarMain";
			this.statusBarMain.Panels.AddRange(new System.Windows.Forms.StatusBarPanel[] {
																							 this.statBarPrim});
			this.statusBarMain.ShowPanels = true;
			this.statusBarMain.Size = new System.Drawing.Size(336, 22);
			this.statusBarMain.SizingGrip = false;
			this.statusBarMain.TabIndex = 5;
			this.statusBarMain.Text = "statusBar1";
			// 
			// statBarPrim
			// 
			this.statBarPrim.Text = "IDLE";
			// 
			// cmbCamera
			// 
			this.cmbCamera.Location = new System.Drawing.Point(224, 8);
			this.cmbCamera.Name = "cmbCamera";
			this.cmbCamera.Size = new System.Drawing.Size(104, 21);
			this.cmbCamera.TabIndex = 6;
			this.cmbCamera.Text = "WebCam 1";
			this.cmbCamera.SelectedIndexChanged += new System.EventHandler(this.cmbCamera_SelectedIndexChanged);
			// 
			// timer
			// 
			this.timer.Interval = 333;
			this.timer.Tick += new System.EventHandler(this.timer_Tick);
			// 
			// dtimer
			// 
			this.dtimer.Tick += new System.EventHandler(this.dtimer_Tick);
			// 
			// WebCamServer
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.SkyBlue;
			this.ClientSize = new System.Drawing.Size(336, 551);
			this.Controls.Add(this.cmbCamera);
			this.Controls.Add(this.statusBarMain);
			this.Controls.Add(this.picShow);
			this.Controls.Add(this.panPreview);
			this.Controls.Add(this.label1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.Menu = this.mainMenu1;
			this.Name = "WebCamServer";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "WebCamServer";
			this.Closing += new System.ComponentModel.CancelEventHandler(this.WebCamServer_Closing);
			this.Load += new System.EventHandler(this.WebCamServer_Load);
			this.Activated += new System.EventHandler(this.WebCamServer_Activated);
			this.panPreview.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.statBarPrim)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new WebCamServer());
		}

		/// <summary>
		/// Use when Form is activated
		/// Create WIA camera device and display the video
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void WebCamServer_Activated(object sender, System.EventArgs e)
		{
			if( ! firstActive )
			{
				firstActive = true;			// it is the first time..
				if(CreateCamera())		// create WIA camera device
				{
					CreateVideoPreview();
				}
				else
				{
					Application.Exit();
					return;
				}
			}
		}

		/// <summary>
		/// Use when close the program
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void WebCamServer_Closing(object sender, System.ComponentModel.CancelEventArgs e)
		{
			ReleaseDevice();			//cleanup
			DisposePicture();			//destroy picture
		}

		/// <summary>
		/// Find any WIA streaming video camera devices
		/// Return true if webcam is connected and display correctly
		/// </summary>
		/// <returns></returns>
		private bool CreateCamera()
		{
			bool done = false;
			CollectionClass wiaDevs = null;
			DeviceInfoClass devInfo = null;
			
			try 
			{
				wiaMgr = new WiaClass();

				object foundID = null;
				wiaDevs = wiaMgr.Devices as CollectionClass;		// call Wia.Devices to get all devices
				if( wiaDevs != null )
				{
					foreach( object wiaObj in wiaDevs )
					{
						devInfo = (DeviceInfoClass) Marshal.CreateWrapperOfType(wiaObj, typeof(DeviceInfoClass));
						if( devInfo.Type.IndexOf( "Video" ) > 0 )
						{
							foundID = devInfo.Id;
							camID[camCount++] = foundID;
							cmbCamera.Items.Add("WebCam " + camCount);
						}
						Marshal.ReleaseComObject( devInfo );
						devInfo = null;
					}
				}
				if(camCount < 1)
				{
					MessageBox.Show(this, "no WIA video devices found!", "WIA", MessageBoxButtons.OK, MessageBoxIcon.Stop);
					return false;
				}

				wiaCamera = (ItemClass) wiaMgr.Create(ref camID[0]);
				done = wiaCamera != null;
				return done;
			}
			catch( Exception ) 
			{
				MessageBox.Show( this, "Create WIA camera failed", "WIA", MessageBoxButtons.OK, MessageBoxIcon.Stop );
				return false;
			}
			finally 
			{
				if(devInfo != null)
					Marshal.ReleaseComObject(devInfo);
				if(wiaDevs != null)
					Marshal.ReleaseComObject(wiaDevs);
				if(!done)
				{
					if(wiaCamera != null)
						Marshal.ReleaseComObject(wiaCamera); wiaCamera = null;
					if(wiaMgr != null)
						Marshal.ReleaseComObject(wiaMgr); wiaMgr = null;
				}
			}
		}

		/// <summary>
		/// Choose webcam
		/// Return true if webcam is connected and display correctly
		/// </summary>
		/// <param name="cam"></param>
		/// <returns></returns>
		private bool SelectDevice(int cam)
		{
			bool done = false;

			try 
			{
				wiaCamera = (ItemClass) wiaMgr.Create(ref camID[cam]);  // ask user if more then one video device
				done = wiaCamera != null;
				return done;
			}
			catch( Exception ) 
			{
				MessageBox.Show( this, "Create WIA camera failed", "WIA", MessageBoxButtons.OK, MessageBoxIcon.Stop );
				return false;
			}
			finally 
			{
				if(!done)
				{
					if(wiaCamera != null)
						Marshal.ReleaseComObject(wiaCamera); wiaCamera = null;
					if(wiaMgr != null)
						Marshal.ReleaseComObject(wiaMgr); wiaMgr = null;
				}
			}
		}

		/// <summary> Cleanup the current WIA device and release all references. </summary>
		private void ReleaseDevice()
		{
			if(wiaVideo != null)
			{
				// destroy video stream
				if(videoLive)
				{
					wiaVideo.DestroyVideo();
					videoLive = false;
				}
				Marshal.ReleaseComObject(wiaVideo);		// release video COM object
				wiaVideo = null;
			}
		}

		/// <summary> Create a preview video device. </summary>
		private void CreateVideoPreview()
		{
			Cursor.Current = Cursors.WaitCursor;
			try 
			{
				if( wiaVideo == null )
				{
					// no video interfaces yet, create one
					wiaVideo = new WiaVideoClass();

					// according MSDN, set IWiaVideo::ImagesDirectory to WIA_DPV_IMAGES_DIRECTORY:
					videoDir = (string) wiaCamera.GetPropById( (WiaItemPropertyId) 3587 );		// 3587 = WIA_DPV_IMAGES_DIRECTORY

					wiaVideo.ImagesDirectory = videoDir;		// connect video directory
				}

				if(!videoLive)
				{
					selectedID = wiaCamera.GetPropById( (WiaItemPropertyId) WiaDeviceInfoPropertyId.DeviceInfoDevId ) as string;
					wiaVideo.CreateVideoByWiaDevID( selectedID, panPreview.Handle, 0, 0 );	// overlay into preview panel
					videoLive = true;				// mark video as running
					wiaVideo.PreviewVisible = 1;
					wiaVideo.Play();				// start live stream!
					timer.Enabled = true;
					dtimer.Enabled = true;
				}
				else
					wiaVideo.PreviewVisible = 1;

				videoVisible = true;
			}
			catch( Exception ) 
			{
				MessageBox.Show( this, "create video preview failed", "WIA", MessageBoxButtons.OK, MessageBoxIcon.Stop );
			}
			Cursor.Current = Cursors.Default;
		}

		/// <summary> Notify video overlay about size changes. </summary>
		private void panPreview_Resize(object sender, System.EventArgs e)
		{
			if( videoVisible )
				wiaVideo.ResizeVideo( 0 );
		}

		/// <summary> User selected menu entry to quit. </summary>
		private void mnuExit_Click(object sender, System.EventArgs e)
		{
			ReleaseDevice();
			Close();
		}

		/// <summary>
		/// Take a picture from video stream
		/// </summary>
		private void SnapShot()
		{
			try 
			{
				DisposePicture();

				wiaVideo.TakePicture(out jpgFile);			// call IWiaVideo::TakePicture
				if(jpgFile != null)
				{
					pictureBox.Image = Image.FromFile(jpgFile);	// load jpeg file into preview
					if(pictureBox.Image.Width == 320 && pictureBox.Image.Height == 240)
						pic = pictureBox.Image;
					else
					{
						Bitmap tmpBitmap = new Bitmap(pictureBox.Image, new Size(320, 240));
						pic = tmpBitmap;
					}
				}
			}
			catch(Exception) {}		
		}

		/// <summary>
		/// Detect and follow the object
		/// </summary>
		private void MotionDetector()
		{
			if(lastFrame != null)
			{
				lastFrame.Dispose();
			}

			lastFrame = (Bitmap)pic;
			try
			{
				// apply motion detector
				if(motionDetector != null)
					motionDetector.ProcessFrame(ref lastFrame, ref recX, ref recY, ref recW, ref recH, ref newRect);
			}
			catch(Exception)
			{
			}
		}

		/// <summary> Dispose current picture and deletes the snap file. </summary>
		private void DisposePicture()
		{
			try 
			{
				Image oldImg = pictureBox.Image;		// release previous picture
				Image oldImg2 = picShow.Image;
				pictureBox.Image = null;
				picShow.Image = null;
				if(oldImg != null)
					oldImg.Dispose();
				if(oldImg2 != null)
					oldImg2.Dispose();

				if(jpgFile != null)				// delete jpg file on disk
					File.Delete(jpgFile);

				jpgFile = null;
			}
			catch( Exception ) {}
			finally
			{
				jpgFile = null;
			}
		}

		/// <summary>
		/// Timer 0.1 sec
		/// Snapshot the picture and detect the object
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void dtimer_Tick(object sender, System.EventArgs e)
		{
			if(isChangeCam)
			{
				isChangeCam = false;
				cmbCamera.SelectedIndex = camNumber;
			}
			SnapShot();
			MotionDetector();
			try
			{
				picShow.Image = new Bitmap(lastFrame);
			}
			catch(Exception)
			{}
		}	

		/// <summary>
		/// Timer 0.33 sec
		/// Send the picture to pocket pc
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void timer_Tick(object sender, System.EventArgs e)
		{
			if(clientCount > 0)
			{				
				MemoryStream ms = new MemoryStream();
				Bitmap temp;

				try
				{
					if(isDetect)
					{
						temp = new Bitmap(picShow.Image, 212, 160);
					}
					else
					{
						temp = new Bitmap(Image.FromFile(jpgFile), 212, 160);
					}
					temp.Save(ms, ImageFormat.Jpeg);
				}
				catch(Exception)
				{
				}
				byte[] message1 = ms.GetBuffer();
				ms.Close();

				try
				{
					for(int i =0; i < clientCount; i++)
					{
						client[i].BeginSend(message1, 0, message1.Length, SocketFlags.None, new AsyncCallback(SendData), client[i]);
					}
				}
				catch(Exception)
				{
				}
			}
			else
				server.BeginAccept(new AsyncCallback(AcceptConn), server);
		}

		/// <summary>
		/// Accept connection from pocket pc and send the picture to it
		/// </summary>
		/// <param name="iar"></param>
		private void AcceptConn(IAsyncResult iar)
		{
			Socket oldserver = (Socket)iar.AsyncState;
			client[clientCount] = oldserver.EndAccept(iar);
			clientCount++;
			MemoryStream ms = new MemoryStream();
			Bitmap temp = new Bitmap(pictureBox.Image, 160, 120);
			temp.Save(ms, ImageFormat.Jpeg);
			byte[] message1 = ms.GetBuffer();
			ms.Close();
			for(int i = 0; i < clientCount; i++)
			{
				client[i].BeginSend(message1, 0, message1.Length, SocketFlags.None, new AsyncCallback(SendData), client[i]);
			}
			server.BeginAccept(new AsyncCallback(AcceptConn), server);
		}

		/// <summary>
		/// Send picture to pocket pc
		/// </summary>
		/// <param name="iar"></param>
		private void SendData(IAsyncResult iar)
		{
			try
			{
				Socket client = (Socket)iar.AsyncState;
				int send = client.EndSend(iar);
				client.BeginReceive(data, 0, size, SocketFlags.None, new AsyncCallback(ReceiveData), client);
			}
			catch(Exception )
			{
			}
		}

		/// <summary>
		/// Receive command from pocket pc
		/// </summary>
		/// <param name="iar"></param>
		private void ReceiveData(IAsyncResult iar)
		{
			try
			{
				Socket client = (Socket)iar.AsyncState;
				int recv = client.EndReceive(iar);

				if(recv == 0)
				{
					client.Close();
					server.BeginAccept(new AsyncCallback(AcceptConn), server);
					for(int i = 0; i < clientCount; i++)
					{
						if(this.client[i].Connected == false)
						{
							for(int j = i; j < clientCount - 1; j++)
							{
								this.client[j] = this.client[j + 1];
							}
							break;
						}
					}
					clientCount--;
					return;
				}
				else
				{
					try
					{
						string stringData= Encoding.ASCII.GetString(data, 0, recv);
						if(stringData.Equals("webcam1"))
						{
							isChangeCam = true;
							camNumber = 0;
							return;
						}
						else if(stringData.Equals("webcam2"))
						{
							isChangeCam = true;
							camNumber = 1;
							return;
						}

						char[] seperator = {' '};
						string[] stringCommand = stringData.Split(seperator, 5);
						if(stringCommand[0].Equals("none"))
						{
							isDetect = false;
							return;
						}
						else if(stringCommand[0].Equals("detect"))
							isDetect = true;

						int[] position = new int[4];
						for(int i=0; i<4; i++)
							position[i] = Int32.Parse(stringCommand[i + 1]);

						if(position[0] == 0 && position[1] == 0 && position [2] == 0 && position[3] == 0)
						{
						}
						else
						{
							recX = position[0];
							recY = position[1];
							recW = position[2];
							recH = position[3];
							newRect = true;
						}
					}
					catch(Exception)
					{
					}
				}
			}
			catch(Exception)
			{
			}
		}

		/// <summary>
		/// Choose the web cam from combobox
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void cmbCamera_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			dtimer.Enabled = false;
			timer.Enabled = false;
			
			ReleaseDevice();
			DisposePicture();

			if(SelectDevice(cmbCamera.SelectedIndex))
			{
				recX = 0;
				recY = 0;
				recW =320; 
				recH = 240;
				newRect = true;

				CreateVideoPreview();
			}
		}

		/// <summary>
		/// Use when form is loaded
		/// Garbage Collection
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void WebCamServer_Load(object sender, System.EventArgs e)
		{
			GC.Collect();
			GC.WaitForPendingFinalizers();
		}
	}
}
