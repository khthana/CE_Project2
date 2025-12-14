using System;
using System.Drawing;
using System.Collections;
using System.Windows.Forms;
using System.Data;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.IO;

namespace PocketClient
{
	/// <summary>
	/// Summary description for PocketClient.
	/// </summary>
	public class PocketClient : System.Windows.Forms.Form
	{
		private System.Windows.Forms.PictureBox pictureBox;
		private System.Windows.Forms.Button discon;
		private System.Windows.Forms.Button connect;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.StatusBar conStatus;
		private System.Windows.Forms.Timer timer1;
		private System.Windows.Forms.ComboBox dCmb;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.TextBox txtIP1;
		private System.Windows.Forms.TextBox txtIP2;
		private System.Windows.Forms.TextBox txtIP3;
		private System.Windows.Forms.TextBox txtIP4;
		private System.Windows.Forms.ComboBox cmbCam;
		private System.Windows.Forms.MenuItem mnuFile;
		private System.Windows.Forms.MenuItem mnuExit;

		private Socket client;										//Client socket
		private static int size = 40000;						//Size of picture
		private byte[] data = new byte[size];			//Data of picture
		private byte[] data2 = new byte[1024];		//Data of command
		private bool isConnected = false;				//Is pocket pc connected to server
		private string selected = "none ";					//User choose to detect object or not
		private string camNumber = "webcam1";	//Name of webcam
		private bool changeCam = false;				//Flag: is user choose new webcam

		private string ipAddress = "192.168.0.2";	//IP address of server
		private int posX = 0;
		private int posY = 0;
		private int posWidth = 320;
		private int posHight = 240;
		private bool isDrag = false;							//Is user drag box around object
		private string position = "0 0 0 0";					//Position of object

		/// <summary>
		/// Constructor
		/// </summary>
		public PocketClient()
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
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.pictureBox = new System.Windows.Forms.PictureBox();
			this.discon = new System.Windows.Forms.Button();
			this.connect = new System.Windows.Forms.Button();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.mnuFile = new System.Windows.Forms.MenuItem();
			this.mnuExit = new System.Windows.Forms.MenuItem();
			this.conStatus = new System.Windows.Forms.StatusBar();
			this.timer1 = new System.Windows.Forms.Timer();
			this.dCmb = new System.Windows.Forms.ComboBox();
			this.txtIP1 = new System.Windows.Forms.TextBox();
			this.txtIP2 = new System.Windows.Forms.TextBox();
			this.txtIP3 = new System.Windows.Forms.TextBox();
			this.txtIP4 = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.cmbCam = new System.Windows.Forms.ComboBox();
			// 
			// pictureBox
			// 
			this.pictureBox.Location = new System.Drawing.Point(14, 82);
			this.pictureBox.Size = new System.Drawing.Size(212, 160);
			this.pictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pictureBox.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pictureBox_MouseUp);
			this.pictureBox.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pictureBox_MouseMove);
			this.pictureBox.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pictureBox_MouseDown);
			// 
			// discon
			// 
			this.discon.Enabled = false;
			this.discon.Location = new System.Drawing.Point(128, 32);
			this.discon.Size = new System.Drawing.Size(104, 20);
			this.discon.Text = "Disconnect";
			this.discon.Click += new System.EventHandler(this.discon_Click);
			// 
			// connect
			// 
			this.connect.Location = new System.Drawing.Point(8, 32);
			this.connect.Size = new System.Drawing.Size(104, 20);
			this.connect.Text = "Connect";
			this.connect.Click += new System.EventHandler(this.connect_Click);
			// 
			// mainMenu1
			// 
			this.mainMenu1.MenuItems.Add(this.mnuFile);
			// 
			// mnuFile
			// 
			this.mnuFile.MenuItems.Add(this.mnuExit);
			this.mnuFile.Text = "&File";
			// 
			// mnuExit
			// 
			this.mnuExit.Text = "E&xit";
			this.mnuExit.Click += new System.EventHandler(this.mnuExit_Click);
			// 
			// conStatus
			// 
			this.conStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular);
			this.conStatus.Location = new System.Drawing.Point(0, 250);
			this.conStatus.Size = new System.Drawing.Size(240, 20);
			this.conStatus.Text = "Disconnected";
			// 
			// timer1
			// 
			this.timer1.Enabled = true;
			this.timer1.Interval = 333;
			this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
			// 
			// dCmb
			// 
			this.dCmb.Items.Add("No detection");
			this.dCmb.Items.Add("Motion detection");
			this.dCmb.Location = new System.Drawing.Point(8, 56);
			this.dCmb.Size = new System.Drawing.Size(136, 22);
			this.dCmb.SelectedIndexChanged += new System.EventHandler(this.dCmb_SelectedIndexChanged);
			// 
			// txtIP1
			// 
			this.txtIP1.ForeColor = System.Drawing.SystemColors.ActiveCaption;
			this.txtIP1.Location = new System.Drawing.Point(80, 8);
			this.txtIP1.MaxLength = 3;
			this.txtIP1.Size = new System.Drawing.Size(32, 22);
			this.txtIP1.Text = "192";
			this.txtIP1.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			// 
			// txtIP2
			// 
			this.txtIP2.ForeColor = System.Drawing.SystemColors.ActiveCaption;
			this.txtIP2.Location = new System.Drawing.Point(120, 8);
			this.txtIP2.MaxLength = 3;
			this.txtIP2.Size = new System.Drawing.Size(32, 22);
			this.txtIP2.Text = "168";
			this.txtIP2.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			// 
			// txtIP3
			// 
			this.txtIP3.ForeColor = System.Drawing.SystemColors.ActiveCaption;
			this.txtIP3.Location = new System.Drawing.Point(160, 8);
			this.txtIP3.MaxLength = 3;
			this.txtIP3.Size = new System.Drawing.Size(32, 22);
			this.txtIP3.Text = "0";
			this.txtIP3.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			// 
			// txtIP4
			// 
			this.txtIP4.ForeColor = System.Drawing.SystemColors.ActiveCaption;
			this.txtIP4.Location = new System.Drawing.Point(200, 8);
			this.txtIP4.MaxLength = 3;
			this.txtIP4.Size = new System.Drawing.Size(32, 22);
			this.txtIP4.Text = "2";
			this.txtIP4.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Size = new System.Drawing.Size(64, 16);
			this.label1.Text = "Server IP";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(112, 16);
			this.label2.Size = new System.Drawing.Size(8, 20);
			this.label2.Text = ".";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(152, 16);
			this.label3.Size = new System.Drawing.Size(8, 20);
			this.label3.Text = ".";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(192, 16);
			this.label4.Size = new System.Drawing.Size(8, 20);
			this.label4.Text = ".";
			// 
			// cmbCam
			// 
			this.cmbCam.Items.Add("WebCam 1");
			this.cmbCam.Items.Add("WebCam 2");
			this.cmbCam.Location = new System.Drawing.Point(152, 56);
			this.cmbCam.Size = new System.Drawing.Size(80, 22);
			this.cmbCam.SelectedIndexChanged += new System.EventHandler(this.cmbCam_SelectedIndexChanged);
			// 
			// PocketClient
			// 
			this.BackColor = System.Drawing.Color.SkyBlue;
			this.Controls.Add(this.cmbCam);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.txtIP4);
			this.Controls.Add(this.txtIP3);
			this.Controls.Add(this.txtIP2);
			this.Controls.Add(this.txtIP1);
			this.Controls.Add(this.dCmb);
			this.Controls.Add(this.conStatus);
			this.Controls.Add(this.pictureBox);
			this.Controls.Add(this.discon);
			this.Controls.Add(this.connect);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Menu = this.mainMenu1;
			this.Text = "PocketClient";
			this.Closing += new System.ComponentModel.CancelEventHandler(this.PocketClient_Closing);
			this.Load += new System.EventHandler(this.PocketClient_Load);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		static void Main() 
		{
			Application.Run(new PocketClient());
		}

		/// <summary>
		/// Connect button
		/// User click this button to connect to server
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void connect_Click(object sender, System.EventArgs e)
		{
			conStatus.Text = "Connecting...";
			ipAddress = txtIP1.Text + "." + txtIP2.Text + "." + txtIP3.Text + "." + txtIP4.Text;
			Socket newsock = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
			IPEndPoint iep = new IPEndPoint(IPAddress.Parse(ipAddress), 9050);
			newsock.BeginConnect(iep, new AsyncCallback(Connected), newsock);
		}

		/// <summary>
		/// Disconnect button
		/// User click this button to disconnect from server
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void discon_Click(object sender, System.EventArgs e)
		{
			client.Close();
			conStatus.Text = "Disconnected";
			isConnected = false;
			discon.Enabled = false;
			connect.Enabled = true;
			dCmb.Enabled = false;
			cmbCam.Enabled = false;
			txtIP1.Enabled = true;
			txtIP2.Enabled = true;
			txtIP3.Enabled = true;
			txtIP4.Enabled = true;
		}

		/// <summary>
		/// Connect to server
		/// </summary>
		/// <param name="iar"></param>
		private void Connected(IAsyncResult iar)
		{
			client = (Socket)iar.AsyncState;

			try
			{
				client.EndConnect(iar);
				conStatus.Text = "Connected to: " + client.RemoteEndPoint.ToString();
				isConnected = true;
				discon.Enabled = true;
				connect.Enabled = false;
				dCmb.Enabled = true;
				cmbCam.Enabled = true;
				txtIP1.Enabled = false;
				txtIP2.Enabled = false;
				txtIP3.Enabled = false;
				txtIP4.Enabled = false;
			}
			catch(SocketException)
			{
				conStatus.Text = "Error connecting";
			}
		}

		/// <summary>
		/// Receive picture from server and send command to it
		/// </summary>
		/// <param name="iar"></param>
		private void ReceiveData(IAsyncResult iar)
		{
			Socket remote = (Socket)iar.AsyncState;
			try
			{
				int recv = remote.EndReceive(iar);
				MemoryStream ms = new MemoryStream(data, 0, recv);
				Bitmap tempBit = new Bitmap(ms);
				pictureBox.Image = tempBit;
				ms.Close();
				string command;
				if(changeCam)
				{
					command = camNumber;
					changeCam = false;
				}
				else
				{
					command = selected + position;
					position = "0 0 0 0";
				}
				data2 = Encoding.ASCII.GetBytes(command);
				remote.BeginSend(data2, 0, data2.Length, SocketFlags.None, new AsyncCallback(SendData), remote);
			}
			catch(Exception)
			{
			}
		}

		/// <summary>
		/// Send command to server and begin to recieve new picture
		/// </summary>
		/// <param name="iar"></param>
		private void SendData(IAsyncResult iar)
		{
			Socket remote = (Socket)iar.AsyncState;
			try
			{
				int sent = remote.EndSend(iar);
				remote.BeginReceive(data, 0, size, SocketFlags.None, new AsyncCallback(ReceiveData), remote);
			}
			catch(Exception)
			{
			}
		}

		/// <summary>
		/// Timer 0.33 sec
		/// Recieve picture from server
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void timer1_Tick(object sender, System.EventArgs e)
		{
			if(isConnected)
			{
				client.BeginReceive(data, 0, size, SocketFlags.None, new AsyncCallback(ReceiveData), client);
			}
		}

		/// <summary>
		/// Display picture combobox
		/// Choose to display detected object or not
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void dCmb_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			if(dCmb.SelectedIndex == 0)
			{
				selected = "none ";
			}
			else
			{
				selected = "detect ";
			}
		}

		/// <summary>
		/// Choose webcam combobox
		/// Choose new webcam from combobox
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void cmbCam_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			int temp = cmbCam.SelectedIndex + 1;
			camNumber = "webcam" + temp.ToString();
			changeCam = true;
		}

		/// <summary>
		/// Use when form is loaded
		/// Garbage Collection
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void PocketClient_Load(object sender, System.EventArgs e)
		{
			dCmb.SelectedIndex = 0;
			cmbCam.SelectedIndex = 0;
			dCmb.Enabled = false;
			cmbCam.Enabled = false;
			GC.Collect();
			GC.WaitForPendingFinalizers();
		}

		/// <summary>
		/// Use when user close program
		/// Disconnect from server
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void PocketClient_Closing(object sender, System.ComponentModel.CancelEventArgs e)
		{
				client.Close();
		}

		/// <summary>
		/// Use when user click the picture
		/// Store the position of clicking
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void pictureBox_MouseDown(object sender, MouseEventArgs e)
		{
			if(isConnected)
			{
				posX = e.X;
				posY = e.Y;
				isDrag = true;
			}
		}

		/// <summary>
		/// Use when user drag the stylus and isDrag is true
		/// Draw the rectangle from start position to end position
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void pictureBox_MouseMove(object sender, MouseEventArgs e)
		{
			if(isConnected && isDrag)
			{
				Graphics g;
				g = Graphics.FromImage(pictureBox.Image);
				Pen pen = new Pen(Color.LightBlue);
				Rectangle rc;
				if(posX < e.X && posY < e.Y)
					rc = new Rectangle(posX, posY, e.X - posX, e.Y - posY);
				else if(posX < e.X && posY > e.Y)
					rc = new Rectangle(posX, e.Y, e.X - posX, posY - e.Y);
				else if(posX > e.X && posY < e.Y)
					rc = new Rectangle(e.X, posY, posX - e.X, e.Y - posY);
				else
					rc = new Rectangle(e.X, e.Y, posX - e.X, posY - e.Y);
				g.DrawRectangle(pen, rc);
				g.Dispose();
				pen.Dispose();
			}
		}

		/// <summary>
		/// Use when user stop dragging and isDrag is true
		/// Calculate the position of the object in the rectangle
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void pictureBox_MouseUp(object sender, MouseEventArgs e)
		{
			if(isConnected && isDrag)
			{
				isDrag = false;
				if(posX < e.X)
				{
					if(posX >= 0)
						posWidth = e.X - posX;
					else
					{
						posX = 0;
						posWidth = e.X;
					}
				}
				else
				{
					if(e.X >= 0)
					{
						posWidth = posX - e.X;
						posX = e.X;
					}
					else
					{
						posWidth = posX;
						posX = 0;
					}
				}
				if(posY < e.Y)
				{
					if(posY >= 0)
						posHight = e.Y - posY;
					else
					{
						posY = 0;
						posHight = e.Y;
					}
				}
				else
				{
					if(e.Y >= 0)
					{
						posHight = posY - e.Y;
						posY = e.Y;
					}
					else
					{
						posHight = posY;
						posY = 0;
					}
				}
				posX = (80 * posX) / 53;
				posY = (3 * posY) / 2;
				posWidth = (80 * posWidth) / 53;
				posHight = (3 * posHight) / 2;
				position = posX + " " + posY + " " + posWidth + " " + posHight;
			}
			else
				isDrag = false;
		}

		/// <summary>
		/// Use when user click Exit in menu
		/// Exit the program and disconnect from server
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void mnuExit_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}
	}
}
