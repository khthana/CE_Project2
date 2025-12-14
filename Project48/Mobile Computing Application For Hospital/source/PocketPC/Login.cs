using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;


namespace MobileHospital1
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox TextUsername;
		private System.Windows.Forms.TextBox TextPassword;
		private System.Windows.Forms.Button CmdLogin;
		private System.Windows.Forms.MainMenu mainMenu1;

		public Form1()
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(Form1));
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.label1 = new System.Windows.Forms.Label();
			this.TextUsername = new System.Windows.Forms.TextBox();
			this.TextPassword = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.CmdLogin = new System.Windows.Forms.Button();
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
			this.label1.ForeColor = System.Drawing.SystemColors.ControlText;
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Size = new System.Drawing.Size(224, 20);
			this.label1.Text = "MOBILE  HOSPITAL";
			this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// TextUsername
			// 
			this.TextUsername.Location = new System.Drawing.Point(88, 56);
			this.TextUsername.Size = new System.Drawing.Size(128, 20);
			this.TextUsername.Text = "";
			this.TextUsername.TextChanged += new System.EventHandler(this.TextUsername_TextChanged);
			// 
			// TextPassword
			// 
			this.TextPassword.Location = new System.Drawing.Point(88, 88);
			this.TextPassword.PasswordChar = '*';
			this.TextPassword.Size = new System.Drawing.Size(128, 20);
			this.TextPassword.Text = "";
			// 
			// label2
			// 
			this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular);
			this.label2.Location = new System.Drawing.Point(16, 56);
			this.label2.Size = new System.Drawing.Size(72, 20);
			this.label2.Text = "Username";
			// 
			// label3
			// 
			this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular);
			this.label3.Location = new System.Drawing.Point(16, 88);
			this.label3.Size = new System.Drawing.Size(72, 20);
			this.label3.Text = "Password";
			// 
			// CmdLogin
			// 
			this.CmdLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular);
			this.CmdLogin.Location = new System.Drawing.Point(88, 144);
			this.CmdLogin.Size = new System.Drawing.Size(64, 20);
			this.CmdLogin.Text = "Login";
			this.CmdLogin.Click += new System.EventHandler(this.CmdOK_Click);
			// 
			// Form1
			// 
			this.Controls.Add(this.CmdLogin);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.TextPassword);
			this.Controls.Add(this.TextUsername);
			this.Controls.Add(this.label1);
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.Menu = this.mainMenu1;
			this.Text = "Login";
			this.Load += new System.EventHandler(this.Form1_Load);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>

		static void Main() 
		{
			Application.Run(new Form1());
		}

	    private void CmdOK_Click(object sender, System.EventArgs e)
		{
			string usr, pwd;
			bool CheckLogin;

			MHWS.Service1 service = new MHWS.Service1();

			usr = TextUsername.Text;
			pwd = TextPassword.Text;

			CheckLogin = service.CheckUser(usr,pwd);
			if(CheckLogin==true)
			{			
				  Main st = new Main();
				  st.Show();
				  TextUsername.Text = "";
				  TextPassword.Text = "";
			} 
			else
			{
				MessageBox.Show("false","ERROR");
			}
		}

		private void TextUsername_TextChanged(object sender, System.EventArgs e)
		{
		
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{
			
		}
	}
}
