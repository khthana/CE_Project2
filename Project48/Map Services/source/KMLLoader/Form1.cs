using System;
using Npgsql;	
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.IO;

namespace KMLLoader
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{	
		private string DB;
		NpgsqlConnection conn;
		NpgsqlCommand command;
		private System.Windows.Forms.Button button1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private System.Windows.Forms.OpenFileDialog openFileDialog1;
		private System.Windows.Forms.ListBox listBox1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox ipTextBox;
		private System.Windows.Forms.TextBox userTextBox;
		private System.Windows.Forms.TextBox pwdTextBox;
		private System.Windows.Forms.Button button2;
		// declare dataset
		private StreamReader sr;

		private string fname;

		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			fname = "";

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
			this.button1 = new System.Windows.Forms.Button();
			this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
			this.listBox1 = new System.Windows.Forms.ListBox();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.ipTextBox = new System.Windows.Forms.TextBox();
			this.userTextBox = new System.Windows.Forms.TextBox();
			this.pwdTextBox = new System.Windows.Forms.TextBox();
			this.button2 = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(248, 16);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(112, 23);
			this.button1.TabIndex = 0;
			this.button1.Text = "Open KML File";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// openFileDialog1
			// 
			this.openFileDialog1.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog1_FileOk);
			// 
			// listBox1
			// 
			this.listBox1.Location = new System.Drawing.Point(40, 104);
			this.listBox1.Name = "listBox1";
			this.listBox1.Size = new System.Drawing.Size(304, 160);
			this.listBox1.TabIndex = 1;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(32, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(80, 23);
			this.label1.TabIndex = 2;
			this.label1.Text = "Database IP :";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(32, 40);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(72, 23);
			this.label2.TabIndex = 3;
			this.label2.Text = "Username :";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(32, 64);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(64, 23);
			this.label3.TabIndex = 4;
			this.label3.Text = "Password :";
			// 
			// ipTextBox
			// 
			this.ipTextBox.Location = new System.Drawing.Point(112, 16);
			this.ipTextBox.Name = "ipTextBox";
			this.ipTextBox.TabIndex = 5;
			this.ipTextBox.Text = "";
			// 
			// userTextBox
			// 
			this.userTextBox.Location = new System.Drawing.Point(112, 40);
			this.userTextBox.Name = "userTextBox";
			this.userTextBox.TabIndex = 6;
			this.userTextBox.Text = "";
			// 
			// pwdTextBox
			// 
			this.pwdTextBox.Location = new System.Drawing.Point(112, 64);
			this.pwdTextBox.Name = "pwdTextBox";
			this.pwdTextBox.PasswordChar = '*';
			this.pwdTextBox.TabIndex = 7;
			this.pwdTextBox.Text = "";
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(248, 48);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(112, 23);
			this.button2.TabIndex = 8;
			this.button2.Text = "Convert !";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(376, 278);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.pwdTextBox);
			this.Controls.Add(this.userTextBox);
			this.Controls.Add(this.ipTextBox);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.listBox1);
			this.Controls.Add(this.button1);
			this.Name = "Form1";
			this.Text = "KMLLoader";
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

		private void button1_Click(object sender, System.EventArgs e)
		{
			openFileDialog1.AddExtension = true;
			openFileDialog1.CheckFileExists = true;
			openFileDialog1.Title = "Select KML file";
			openFileDialog1.ReadOnlyChecked = true;
			openFileDialog1.InitialDirectory = Application.StartupPath;
			openFileDialog1.Multiselect = false;
			openFileDialog1.Filter = "KML Files (*.kml)|*.kml";
			openFileDialog1.ShowDialog();
		}

		private void openFileDialog1_FileOk(object sender, System.ComponentModel.CancelEventArgs e)
		{
			fname = openFileDialog1.FileName;
			listBox1.Items.Add("Selected file has been opened");
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			if( fname.Equals(""))
			{
				MessageBox.Show("You must open KML file before convert");
				return;
			}

			try
			{		
				// Connect to db
				DB = "Server=" + ipTextBox.Text + ";Port=5432;User Id=" + 
					userTextBox.Text+ ";Password=" + pwdTextBox.Text + ";Database=placemark;";
				conn = new NpgsqlConnection(DB);
				conn.Open();

				listBox1.Items.Add("Connected to database");
				sr = new StreamReader(fname, System.Text.Encoding.UTF8);
				listBox1.Items.Add("Read KML File...");
				
				string name, lat, lon;

				while (sr.Peek() >= 0)
				{
					string tempStr = sr.ReadLine();

					// Find placemark
					if(tempStr.IndexOf("<Placemark>") != -1)
					{
						// Get name
						int start, end;
						
						// Go to next line
						tempStr = sr.ReadLine();
						start = tempStr.IndexOf("<name>") + 6;
						end = tempStr.IndexOf("</name>");
						name = tempStr.Substring(start, end-start);

						// Find coordinate
						while(sr.ReadLine().IndexOf("<Point>") == -1) {};

						// Get longitude
						tempStr = sr.ReadLine();
						start = tempStr.IndexOf("tes>") + 4;
						end = tempStr.IndexOf(",");
						lon = tempStr.Substring(start, end-start);

						// Get latitude
						start = end+1;
						end = tempStr.LastIndexOf(",");
						lat = tempStr.Substring(start, end-start);

						// Input to database
						
						//MessageBox.Show(name + " lon = " + lon + " lat = " + lat);
						
						string sql;
						sql = "insert into place (nameplace,latijude,longtijude,type) VALUES('" +
							name + "','" + lat + "','" + lon + "','" + "¶¹¹')";

						//	MessageBox.Show(sql,"sql :");

						command = new NpgsqlCommand(sql, conn);

						Int32 rowsaffected;
						try
						{
							rowsaffected = command.ExecuteNonQuery();
						}
						catch(Exception ee)
						{
							string ex = ee.ToString();
						}
						
						
					}
				}
				sr.Close();

				listBox1.Items.Add("Insert into database complete");

			}
			catch (Exception ex)
			{
				// catch any xmlexceptions
				listBox1.Items.Add("Expception Error : " + ex.Message);
			}
		}
		
	}
}
