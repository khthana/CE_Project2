using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace TestClient2
{
	/// <summary>
	/// Summary description for Form3.
	/// </summary>
	public class Form3 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.DateTimePicker dateTimePicker1;
		private string day, month, year, hour, min, sec, ip;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button button3;
		public System.Windows.Forms.ListBox listBox1;
		private Socket client;
		private byte[] data = new byte[1024];
		private int size = 1024;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.ComboBox comboBox1;
		public int bitRateIndex;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form3()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			Form1 socketClient = new Form1();
			ip = socketClient.txtServerIP.Text.ToString();
			bitRateIndex = 2;
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
			this.button1 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.label3 = new System.Windows.Forms.Label();
			this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
			this.label1 = new System.Windows.Forms.Label();
			this.button3 = new System.Windows.Forms.Button();
			this.listBox1 = new System.Windows.Forms.ListBox();
			this.label2 = new System.Windows.Forms.Label();
			this.comboBox1 = new System.Windows.Forms.ComboBox();
			this.SuspendLayout();
			// 
			// button1
			// 
			this.button1.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.button1.Enabled = false;
			this.button1.Location = new System.Drawing.Point(88, 272);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(64, 24);
			this.button1.TabIndex = 0;
			this.button1.Text = "OK";
			// 
			// button2
			// 
			this.button2.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.button2.Location = new System.Drawing.Point(168, 272);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(64, 24);
			this.button2.TabIndex = 1;
			this.button2.Text = "Cancel";
			// 
			// label3
			// 
			this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label3.Location = new System.Drawing.Point(16, 24);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(168, 16);
			this.label3.TabIndex = 4;
			this.label3.Text = "Select Date of Recorded Video";
			// 
			// dateTimePicker1
			// 
			this.dateTimePicker1.Location = new System.Drawing.Point(40, 56);
			this.dateTimePicker1.Name = "dateTimePicker1";
			this.dateTimePicker1.Size = new System.Drawing.Size(160, 20);
			this.dateTimePicker1.TabIndex = 5;
			this.dateTimePicker1.ValueChanged += new System.EventHandler(this.dateTimePicker1_ValueChanged);
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.label1.ForeColor = System.Drawing.Color.Red;
			this.label1.Location = new System.Drawing.Point(184, 24);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(96, 16);
			this.label1.TabIndex = 6;
			// 
			// button3
			// 
			this.button3.Location = new System.Drawing.Point(216, 56);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(64, 22);
			this.button3.TabIndex = 7;
			this.button3.Text = "Load";
			this.button3.Click += new System.EventHandler(this.button3_Click);
			// 
			// listBox1
			// 
			this.listBox1.Location = new System.Drawing.Point(40, 88);
			this.listBox1.Name = "listBox1";
			this.listBox1.Size = new System.Drawing.Size(240, 134);
			this.listBox1.TabIndex = 8;
			this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(40, 240);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(40, 16);
			this.label2.TabIndex = 9;
			this.label2.Text = "Bit rate";
			// 
			// comboBox1
			// 
			this.comboBox1.Items.AddRange(new object[] {
														   "Dial-up Modems (28.8 Kbps)",
														   "Dial-up Modems (56 Kbps)",
														   "Local Area Network (100 Kbps)",
														   "Local Area Network (256 Kbps)",
														   "Local Area Network (384 Kbps)",
														   "Local Area Network (768 Kbps)"});
			this.comboBox1.Location = new System.Drawing.Point(88, 232);
			this.comboBox1.Name = "comboBox1";
			this.comboBox1.Size = new System.Drawing.Size(192, 21);
			this.comboBox1.TabIndex = 10;
			this.comboBox1.Text = "Local Area Network (100 Kbps)";
			this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
			// 
			// Form3
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(320, 309);
			this.Controls.Add(this.comboBox1);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.listBox1);
			this.Controls.Add(this.button3);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.dateTimePicker1);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.button1);
			this.Name = "Form3";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "Form3";
			this.Load += new System.EventHandler(this.Form3_Load);
			this.ResumeLayout(false);

		}
		#endregion

		private void Form3_Load(object sender, System.EventArgs e)
		{
			day = dateTimePicker1.Value.Day.ToString();
			month = dateTimePicker1.Value.Month.ToString();
			year = dateTimePicker1.Value.Year.ToString();
			hour = dateTimePicker1.Value.Hour.ToString();
			min = dateTimePicker1.Value.Minute.ToString();
			sec = dateTimePicker1.Value.Second.ToString();
			listBox1.Items.Clear();
		}

		private void dateTimePicker1_ValueChanged(object sender, System.EventArgs e)
		{
			day = dateTimePicker1.Value.Day.ToString();
			month = dateTimePicker1.Value.Month.ToString();
			year = dateTimePicker1.Value.Year.ToString();
			hour = dateTimePicker1.Value.Hour.ToString();
			min = dateTimePicker1.Value.Minute.ToString();
			sec = dateTimePicker1.Value.Second.ToString();
			listBox1.Items.Clear();
		}

		//load list
		private void button3_Click(object sender, System.EventArgs e)
		{
			Socket newsock = new Socket(AddressFamily.InterNetwork,
				SocketType.Stream, ProtocolType.Tcp);
			IPEndPoint iep = new IPEndPoint(IPAddress.Parse(ip), 12345);
			newsock.BeginConnect(iep, new AsyncCallback(Connected), newsock);
			label1.Text = "Loading...";
		}

		void Connected(IAsyncResult iar)
		{
			client = (Socket)iar.AsyncState;
			try
			{
				client.EndConnect(iar);
				label1.Text = "";
				string strMessage = "!" + day + "_" + month + "_" + year;
				byte[] message = Encoding.ASCII.GetBytes(strMessage);
				client.BeginSend(message, 0, message.Length, SocketFlags.None,
					new AsyncCallback(SendData1), client);
			}
			catch (SocketException)
			{
				label1.Text = "Error connecting";
				client.Close();
			}
			
		}//end connected
		//wait for list of file name
		void SendData1(IAsyncResult iar)//send username password and recieved result
		{
			Socket remote = (Socket)iar.AsyncState;
			int sent = remote.EndSend(iar);
			remote.BeginReceive(data, 0, size, SocketFlags.None,
				new AsyncCallback(ReceiveData), remote);
		}//end send

		//show list of filename in listbox
		void ReceiveData(IAsyncResult iar)//recieved result login
		{
			Socket remote = (Socket)iar.AsyncState;
			int recv = remote.EndReceive(iar);
			string stringData = Encoding.ASCII.GetString(data, 0, recv);
			int i = 0;
			int x = 0;
			string file;
			while (i < stringData.Length)
			{
				if(stringData[i] == '/')
				{
					file = stringData.Substring(x, i-x);
					x = i + 1;
					listBox1.Items.Add(file);
				}
				i++;
			}
			client.Close();
		}

		private void listBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			button1.Enabled = true;
		}

		private void comboBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			bitRateIndex = comboBox1.SelectedIndex;
		}
	}
}
