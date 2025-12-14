using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;

using AudioSoundRecorder;

namespace SimpleWavRec
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.ComboBox comboInputChannels;
		private System.Windows.Forms.ComboBox comboInputDevices;
		private System.Windows.Forms.Label label12;
		private System.Windows.Forms.Label label11;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.Button buttonStartRecording;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label1;
		private AudioSoundRecorder.AudioSoundRecorder audioSoundRecorder1;
		private System.Windows.Forms.SaveFileDialog saveFileDialog1;
		private System.Windows.Forms.RadioButton radioButtonFile;
		private System.Windows.Forms.RadioButton radioButtonMemory;
		private System.Windows.Forms.Button buttonBrowse;
		private System.ComponentModel.IContainer components;
		private System.Windows.Forms.Label labelSize;
		private System.Windows.Forms.Button buttonPlay;
		private System.Windows.Forms.Button buttonPause;
		private System.Windows.Forms.Button buttonStop;
		private System.Windows.Forms.ComboBox comboInputFormats;

		private	Int16	m_nCurrInputDevice = 0;
		private	Int16	m_nCurrInputChannel = 0;
		private System.Windows.Forms.PictureBox pictureBox1;
		private System.Windows.Forms.Label lblCommand;
		private System.Windows.Forms.ListBox lstCommand;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Timer tmrCount;
		private System.Windows.Forms.PictureBox pictureBox2;
		private System.Windows.Forms.PictureBox tmrBar;
		private	string	m_strOutputPathname;

		private int bar=8;

		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			m_strOutputPathname =  "wavetest.wav";
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
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.comboInputFormats = new System.Windows.Forms.ComboBox();
			this.label1 = new System.Windows.Forms.Label();
			this.comboInputChannels = new System.Windows.Forms.ComboBox();
			this.comboInputDevices = new System.Windows.Forms.ComboBox();
			this.label12 = new System.Windows.Forms.Label();
			this.label11 = new System.Windows.Forms.Label();
			this.label10 = new System.Windows.Forms.Label();
			this.buttonStartRecording = new System.Windows.Forms.Button();
			this.label5 = new System.Windows.Forms.Label();
			this.audioSoundRecorder1 = new AudioSoundRecorder.AudioSoundRecorder();
			this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
			this.radioButtonFile = new System.Windows.Forms.RadioButton();
			this.radioButtonMemory = new System.Windows.Forms.RadioButton();
			this.buttonBrowse = new System.Windows.Forms.Button();
			this.labelSize = new System.Windows.Forms.Label();
			this.buttonPlay = new System.Windows.Forms.Button();
			this.buttonPause = new System.Windows.Forms.Button();
			this.buttonStop = new System.Windows.Forms.Button();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.lblCommand = new System.Windows.Forms.Label();
			this.lstCommand = new System.Windows.Forms.ListBox();
			this.button2 = new System.Windows.Forms.Button();
			this.tmrCount = new System.Windows.Forms.Timer(this.components);
			this.pictureBox2 = new System.Windows.Forms.PictureBox();
			this.tmrBar = new System.Windows.Forms.PictureBox();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.comboInputFormats);
			this.groupBox1.Controls.Add(this.label1);
			this.groupBox1.Controls.Add(this.comboInputChannels);
			this.groupBox1.Controls.Add(this.comboInputDevices);
			this.groupBox1.Controls.Add(this.label12);
			this.groupBox1.Controls.Add(this.label11);
			this.groupBox1.Location = new System.Drawing.Point(464, 56);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(272, 216);
			this.groupBox1.TabIndex = 54;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Input settings";
			// 
			// comboInputFormats
			// 
			this.comboInputFormats.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.comboInputFormats.Location = new System.Drawing.Point(8, 160);
			this.comboInputFormats.Name = "comboInputFormats";
			this.comboInputFormats.Size = new System.Drawing.Size(248, 21);
			this.comboInputFormats.TabIndex = 5;
			this.comboInputFormats.SelectedIndexChanged += new System.EventHandler(this.comboInputFormats_SelectedIndexChanged);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 136);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(248, 24);
			this.label1.TabIndex = 4;
			this.label1.Text = "Input format";
			// 
			// comboInputChannels
			// 
			this.comboInputChannels.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.comboInputChannels.Location = new System.Drawing.Point(8, 104);
			this.comboInputChannels.Name = "comboInputChannels";
			this.comboInputChannels.Size = new System.Drawing.Size(248, 21);
			this.comboInputChannels.TabIndex = 3;
			this.comboInputChannels.SelectedIndexChanged += new System.EventHandler(this.comboInputChannels_SelectedIndexChanged);
			// 
			// comboInputDevices
			// 
			this.comboInputDevices.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.comboInputDevices.Location = new System.Drawing.Point(8, 48);
			this.comboInputDevices.Name = "comboInputDevices";
			this.comboInputDevices.Size = new System.Drawing.Size(248, 21);
			this.comboInputDevices.TabIndex = 2;
			this.comboInputDevices.SelectedIndexChanged += new System.EventHandler(this.comboInputDevices_SelectedIndexChanged);
			// 
			// label12
			// 
			this.label12.Location = new System.Drawing.Point(8, 80);
			this.label12.Name = "label12";
			this.label12.Size = new System.Drawing.Size(248, 24);
			this.label12.TabIndex = 1;
			this.label12.Text = "Input channels for selected input device";
			// 
			// label11
			// 
			this.label11.Location = new System.Drawing.Point(8, 24);
			this.label11.Name = "label11";
			this.label11.Size = new System.Drawing.Size(248, 24);
			this.label11.TabIndex = 0;
			this.label11.Text = "Input devices";
			// 
			// label10
			// 
			this.label10.Location = new System.Drawing.Point(448, 8);
			this.label10.Name = "label10";
			this.label10.Size = new System.Drawing.Size(512, 32);
			this.label10.TabIndex = 53;
			this.label10.Text = "This sample demonstrates how to perform a WAV recording session whose output can " +
				"be kept in memory or stored  inside a disk file";
			this.label10.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// buttonStartRecording
			// 
			this.buttonStartRecording.Location = new System.Drawing.Point(240, 208);
			this.buttonStartRecording.Name = "buttonStartRecording";
			this.buttonStartRecording.Size = new System.Drawing.Size(88, 48);
			this.buttonStartRecording.TabIndex = 55;
			this.buttonStartRecording.Text = "Start recording";
			this.buttonStartRecording.Click += new System.EventHandler(this.buttonStartRecording_Click);
			// 
			// label5
			// 
			this.label5.BackColor = System.Drawing.Color.Black;
			this.label5.Location = new System.Drawing.Point(8, 200);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(216, 88);
			this.label5.TabIndex = 51;
			this.label5.Click += new System.EventHandler(this.label5_Click);
			// 
			// audioSoundRecorder1
			// 
			this.audioSoundRecorder1.EncodeOggQuality = 3F;
			this.audioSoundRecorder1.Location = new System.Drawing.Point(416, 376);
			this.audioSoundRecorder1.Name = "audioSoundRecorder1";
			this.audioSoundRecorder1.SilenceThreshold = ((short)(10));
			this.audioSoundRecorder1.Size = new System.Drawing.Size(48, 48);
			this.audioSoundRecorder1.TabIndex = 57;
			this.audioSoundRecorder1.RecordingSize += new AudioSoundRecorder.AudioSoundRecorder.RecordingSizeEventHandler(this.audioSoundRecorder1_RecordingSize);
			this.audioSoundRecorder1.RecordingStarted += new AudioSoundRecorder.AudioSoundRecorder.EventHandler(this.audioSoundRecorder1_RecordingStarted);
			this.audioSoundRecorder1.RecordingStopped += new AudioSoundRecorder.AudioSoundRecorder.RecordingStoppedEventHandler(this.audioSoundRecorder1_RecordingStopped);
			// 
			// radioButtonFile
			// 
			this.radioButtonFile.Location = new System.Drawing.Point(464, 304);
			this.radioButtonFile.Name = "radioButtonFile";
			this.radioButtonFile.Size = new System.Drawing.Size(128, 24);
			this.radioButtonFile.TabIndex = 58;
			this.radioButtonFile.Text = "Record to file";
			// 
			// radioButtonMemory
			// 
			this.radioButtonMemory.Location = new System.Drawing.Point(464, 328);
			this.radioButtonMemory.Name = "radioButtonMemory";
			this.radioButtonMemory.Size = new System.Drawing.Size(128, 24);
			this.radioButtonMemory.TabIndex = 59;
			this.radioButtonMemory.Text = "Record in memory";
			// 
			// buttonBrowse
			// 
			this.buttonBrowse.Location = new System.Drawing.Point(600, 304);
			this.buttonBrowse.Name = "buttonBrowse";
			this.buttonBrowse.Size = new System.Drawing.Size(40, 24);
			this.buttonBrowse.TabIndex = 60;
			this.buttonBrowse.Text = "...";
			this.buttonBrowse.Click += new System.EventHandler(this.buttonBrowse_Click);
			// 
			// labelSize
			// 
			this.labelSize.Location = new System.Drawing.Point(672, 304);
			this.labelSize.Name = "labelSize";
			this.labelSize.Size = new System.Drawing.Size(160, 24);
			this.labelSize.TabIndex = 61;
			this.labelSize.Text = "Size in bytes: 0";
			// 
			// buttonPlay
			// 
			this.buttonPlay.Enabled = false;
			this.buttonPlay.Location = new System.Drawing.Point(240, 272);
			this.buttonPlay.Name = "buttonPlay";
			this.buttonPlay.Size = new System.Drawing.Size(88, 40);
			this.buttonPlay.TabIndex = 62;
			this.buttonPlay.Text = "Play";
			this.buttonPlay.Click += new System.EventHandler(this.buttonPlay_Click);
			// 
			// buttonPause
			// 
			this.buttonPause.Enabled = false;
			this.buttonPause.Location = new System.Drawing.Point(544, 360);
			this.buttonPause.Name = "buttonPause";
			this.buttonPause.Size = new System.Drawing.Size(72, 32);
			this.buttonPause.TabIndex = 63;
			this.buttonPause.Text = "Pause";
			this.buttonPause.Click += new System.EventHandler(this.buttonPause_Click);
			// 
			// buttonStop
			// 
			this.buttonStop.Enabled = false;
			this.buttonStop.Location = new System.Drawing.Point(624, 360);
			this.buttonStop.Name = "buttonStop";
			this.buttonStop.Size = new System.Drawing.Size(72, 32);
			this.buttonStop.TabIndex = 64;
			this.buttonStop.Text = "Stop";
			this.buttonStop.Click += new System.EventHandler(this.buttonStop_Click);
			// 
			// pictureBox1
			// 
			this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
			this.pictureBox1.Location = new System.Drawing.Point(0, 0);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(336, 192);
			this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pictureBox1.TabIndex = 65;
			this.pictureBox1.TabStop = false;
			this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
			// 
			// lblCommand
			// 
			this.lblCommand.BackColor = System.Drawing.Color.FromArgb(((System.Byte)(255)), ((System.Byte)(255)), ((System.Byte)(192)));
			this.lblCommand.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.lblCommand.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(222)));
			this.lblCommand.Location = new System.Drawing.Point(8, 320);
			this.lblCommand.Name = "lblCommand";
			this.lblCommand.Size = new System.Drawing.Size(216, 24);
			this.lblCommand.TabIndex = 70;
			this.lblCommand.Text = "command";
			// 
			// lstCommand
			// 
			this.lstCommand.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.lstCommand.Items.AddRange(new object[] {
															"command_01 - Word",
															"command_02 - Power Point",
															"command_03 - Excel  ",
															"command_04 - Note Pad",
															"command_05 - Paint           ",
															"command_06 - Internet  ",
															"command_07 - Email      ",
															"command_08 - MSN            ",
															"command_09 - Music     ",
															"command_10 - Pinball\t"});
			this.lstCommand.Location = new System.Drawing.Point(8, 352);
			this.lstCommand.Name = "lstCommand";
			this.lstCommand.Size = new System.Drawing.Size(216, 145);
			this.lstCommand.TabIndex = 69;
			// 
			// button2
			// 
			this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.button2.Location = new System.Drawing.Point(240, 472);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(80, 23);
			this.button2.TabIndex = 68;
			this.button2.Text = "Quit";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// tmrCount
			// 
			this.tmrCount.Interval = 50;
			this.tmrCount.Tick += new System.EventHandler(this.tmrCount_Tick);
			// 
			// pictureBox2
			// 
			this.pictureBox2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.pictureBox2.Location = new System.Drawing.Point(8, 296);
			this.pictureBox2.Name = "pictureBox2";
			this.pictureBox2.Size = new System.Drawing.Size(216, 16);
			this.pictureBox2.TabIndex = 71;
			this.pictureBox2.TabStop = false;
			// 
			// tmrBar
			// 
			this.tmrBar.BackColor = System.Drawing.Color.Lime;
			this.tmrBar.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.tmrBar.Location = new System.Drawing.Point(8, 296);
			this.tmrBar.Name = "tmrBar";
			this.tmrBar.Size = new System.Drawing.Size(8, 16);
			this.tmrBar.TabIndex = 72;
			this.tmrBar.TabStop = false;
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.White;
			this.ClientSize = new System.Drawing.Size(336, 502);
			this.Controls.Add(this.tmrBar);
			this.Controls.Add(this.pictureBox2);
			this.Controls.Add(this.lblCommand);
			this.Controls.Add(this.lstCommand);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.pictureBox1);
			this.Controls.Add(this.buttonStop);
			this.Controls.Add(this.buttonPause);
			this.Controls.Add(this.buttonPlay);
			this.Controls.Add(this.labelSize);
			this.Controls.Add(this.buttonBrowse);
			this.Controls.Add(this.radioButtonMemory);
			this.Controls.Add(this.radioButtonFile);
			this.Controls.Add(this.audioSoundRecorder1);
			this.Controls.Add(this.groupBox1);
			this.Controls.Add(this.label10);
			this.Controls.Add(this.buttonStartRecording);
			this.Controls.Add(this.label5);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.Name = "Form1";
			this.Text = "Voice Recognition";
			this.Load += new System.EventHandler(this.Form1_Load);
			this.groupBox1.ResumeLayout(false);
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

		private void UpdateInputCombos ()
		{
			// list the available input channels for the chosend input device
			comboInputChannels.Items.Clear ();
			Int16	nInputChannels = audioSoundRecorder1.GetInputDeviceChannelsCount(m_nCurrInputDevice);
			for (Int16 i = 0; i < nInputChannels; i++)
			{
				string	strInputChannel = audioSoundRecorder1.GetInputDeviceChannelDesc(m_nCurrInputDevice, i);
				comboInputChannels.Items.Add (strInputChannel);
			}
			// select the actual system default input channel for the chosen input device
			m_nCurrInputChannel = audioSoundRecorder1.GetInputDeviceChannelDefault(m_nCurrInputDevice);
			comboInputChannels.SelectedIndex = m_nCurrInputChannel;

			// enumerate the input formats supported by the current input device
			Int16	nSelectedDevice = (Int16) comboInputDevices.SelectedIndex;
			Int16	nInputFormats = audioSoundRecorder1.GetSupportedRecordFormatsCount(nSelectedDevice);
			comboInputFormats.Items.Clear ();
			for (Int16 i = 0; i < nInputFormats; i++)
			{
				string	strInputFormat = audioSoundRecorder1.GetSupportedRecordFormatDesc(nSelectedDevice, i);
				comboInputFormats.Items.Add (strInputFormat);
			}
			comboInputFormats.SelectedIndex = 0;
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{
			// init the control with system default input device and input channel
			tmrBar.Width=0;

			audioSoundRecorder1.InitRecorder (0, -1);

			// list the available input devices
			Int16	nInputDevices = audioSoundRecorder1.GetInputDevicesCount();
			for (Int16 i = 0; i < nInputDevices; i++)
			{
				string	strInputDevice = audioSoundRecorder1.GetInputDeviceDesc(i);
				comboInputDevices.Items.Add (strInputDevice);
			}
			// select the actual system default input device
			m_nCurrInputDevice = 0;
			comboInputDevices.SelectedIndex = m_nCurrInputDevice;

			// update the input channels combo and the input formats combo
			UpdateInputCombos ();

			// create the embedded Waveform
			audioSoundRecorder1.DisplayWaveform.Create (label5.Handle);
			audioSoundRecorder1.DisplayWaveform.Show (true);
			
		    
			// by default enable recording to file
			radioButtonFile.Checked = true;
		}

		private void buttonBrowse_Click(object sender, System.EventArgs e)
		{
			saveFileDialog1.Filter = "WAV format (*.wav)|*.wav|All files (*.*)|*.*";
			saveFileDialog1.ShowDialog();

			m_strOutputPathname = saveFileDialog1.FileName;
		}

		private void buttonStartRecording_Click(object sender, System.EventArgs e)
		{
			labelSize.Text = "Size in bytes: 0";

			// select the output format
			audioSoundRecorder1.EncodeFormatForRecording = enumEncodingFormats.ENCODING_FORMAT_WAV;
		    
			// get the selected input format
			//Int16	nInputFormat = (Int16) comboInputFormats.SelectedIndex;
		    Int16	nInputFormat = 2;
			// check the destination
			
			if (radioButtonFile.Checked)
			{
				// record to file
				// check if we already have an output file
				/*if (m_strOutputPathname.Length == 0)
				{
					buttonBrowse_Click (sender, e);
					if (m_strOutputPathname.Length == 0)
						// cancel pressed
						return;
				}*/
				audioSoundRecorder1.RecorderStart (nInputFormat, m_strOutputPathname);
			}
			else
				// record in memory
				audioSoundRecorder1.RecorderStart (nInputFormat, "");
			tmrCount.Enabled=true;
		}

		private void buttonPlay_Click(object sender, System.EventArgs e)
		{
			if (buttonPause.Text == "Pause")
				audioSoundRecorder1.RecordedSoundPlay ();
			else
			{
				audioSoundRecorder1.RecordedSoundResume ();
				buttonPause.Text = "Pause";
			}			
		}

		private void buttonPause_Click(object sender, System.EventArgs e)
		{
			if (buttonPause.Text == "Pause")
			{
				audioSoundRecorder1.RecordedSoundPause ();
				buttonPause.Text = "Resume";
			}
			else
			{
				audioSoundRecorder1.RecordedSoundResume ();
				buttonPause.Text = "Pause";
			}
		}

		private void buttonStop_Click(object sender, System.EventArgs e)
		{
			audioSoundRecorder1.RecordedSoundStop ();
			buttonPause.Text = "Pause";
		}

		private void audioSoundRecorder1_RecordingSize(object sender, AudioSoundRecorder.RecordingSizeEventArgs e)
		{
			labelSize.Text = "Size in bytes: " + e.nDataSize.ToString ();
		}

		private void audioSoundRecorder1_RecordingStarted(object sender, System.EventArgs e)
		{
			//buttonStopRecording.Enabled = true;
			buttonStartRecording.Enabled = false;
		    
			buttonPlay.Enabled = false;
			buttonPause.Enabled = false;
			buttonStop.Enabled = false;
		}

		private void audioSoundRecorder1_RecordingStopped(object sender, AudioSoundRecorder.RecordingStoppedEventArgs e)
		{
			//buttonStopRecording.Enabled = false;
			buttonStartRecording.Enabled = true;
		    
			buttonPlay.Enabled = true;
			buttonPause.Enabled = true;
			buttonStop.Enabled = true;
		}

		private void comboInputDevices_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			Int16	nCurrInputDevice = (Int16) comboInputDevices.SelectedIndex;
			if (audioSoundRecorder1.RecorderChangeInputDevice(nCurrInputDevice) == enumErrorCodes.ERR_NOERROR)
			{
				m_nCurrInputDevice = (Int16) comboInputDevices.SelectedIndex;

				// list the available input channels for the chosend input device
				UpdateInputCombos ();
			}
			else
			{
				MessageBox.Show ("The selected device is not accessible");
				comboInputDevices.SelectedIndex = m_nCurrInputDevice;
			}
		}

		private void comboInputChannels_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			m_nCurrInputChannel = (Int16) comboInputChannels.SelectedIndex;
			audioSoundRecorder1.SetInputDeviceChannelDefault(m_nCurrInputDevice, m_nCurrInputChannel);
		}

		private void Start_Click(object sender, System.EventArgs e)
		{
		
		}

		private void comboInputFormats_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}

		private void tmrCount_Tick(object sender, System.EventArgs e)
		{	
			
			tmrBar.Width =bar;
			bar=bar+5;
			tmrBar.BackColor= Color.FromArgb(0,bar+40,0);
			if (bar>=212) {
				bar=0;
				tmrBar.Width=216;
				tmrCount.Enabled=false;
				audioSoundRecorder1.RecorderStop ();
				
				//process
				System.Diagnostics.Process.Start("D://SouceCode//bin//Debug//MFCC_chk.exe"); 
				System.Diagnostics.Process.Start("D://SouceCode//bin//Debug//NEURAL_chk.exe");

			}
			

		}

		private void label5_Click(object sender, System.EventArgs e)
		{
		
		}

		private void pictureBox1_Click(object sender, System.EventArgs e)
		{
		
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			this.Close();

		}


	}
}
