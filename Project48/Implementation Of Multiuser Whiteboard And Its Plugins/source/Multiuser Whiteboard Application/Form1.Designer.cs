namespace Testor
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            W.Network network4 = new W.Network();
            W.Setting setting4 = new W.Setting();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.b1 = new W.B();
            this.axWindowsMediaPlayer1 = new AxWMPLib.AxWindowsMediaPlayer();
            this.monthCalendar1 = new System.Windows.Forms.MonthCalendar();
            this.URL = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.axWindowsMediaPlayer1)).BeginInit();
            this.SuspendLayout();
            // 
            // b1
            // 
            this.b1.AutoLoadPlugins = false;
            this.b1.BackColor = System.Drawing.Color.Red;
            this.b1.Bordersize = ((uint)(10u));
            this.b1.Color = System.Drawing.Color.Black;
            this.b1.Cursor = System.Windows.Forms.Cursors.SizeAll;
            this.b1.Device = null;
            this.b1.EnableLocationChange = true;
            this.b1.EnableSizeChange = true;
            this.b1.IsMenuShowed = false;
            this.b1.Location = new System.Drawing.Point(12, 12);
            this.b1.Name = "b1";
            this.b1.Net = network4;
            setting4.IPEP = ((System.Net.IPEndPoint)(resources.GetObject("setting4.IPEP")));
            setting4.MulticastIP = ((System.Net.IPAddress)(resources.GetObject("setting4.MulticastIP")));
            setting4.MulticastPort = 3242;
            setting4.TTL = 32;
            this.b1.Settings = setting4;
            this.b1.Size = new System.Drawing.Size(541, 505);
            this.b1.TabIndex = 0;
            this.b1.Username = "Remote Host";
            this.b1.Users = ((System.Collections.ArrayList)(resources.GetObject("b1.Users")));
            // 
            // axWindowsMediaPlayer1
            // 
            this.axWindowsMediaPlayer1.Enabled = true;
            this.axWindowsMediaPlayer1.Location = new System.Drawing.Point(568, 179);
            this.axWindowsMediaPlayer1.Name = "axWindowsMediaPlayer1";
            this.axWindowsMediaPlayer1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axWindowsMediaPlayer1.OcxState")));
            this.axWindowsMediaPlayer1.Size = new System.Drawing.Size(297, 281);
            this.axWindowsMediaPlayer1.TabIndex = 1;
            // 
            // monthCalendar1
            // 
            this.monthCalendar1.Location = new System.Drawing.Point(636, 12);
            this.monthCalendar1.Name = "monthCalendar1";
            this.monthCalendar1.TabIndex = 2;
            // 
            // URL
            // 
            this.URL.AutoSize = true;
            this.URL.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.URL.Location = new System.Drawing.Point(568, 476);
            this.URL.Name = "URL";
            this.URL.Size = new System.Drawing.Size(35, 15);
            this.URL.TabIndex = 3;
            this.URL.Text = "URL";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(609, 476);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(210, 20);
            this.textBox1.TabIndex = 4;
            this.textBox1.Text = "mms://broadcast.issp.co.th/11news1";
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.button1.Location = new System.Drawing.Point(825, 476);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(40, 23);
            this.button1.TabIndex = 5;
            this.button1.Text = "Go";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(877, 529);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.URL);
            this.Controls.Add(this.monthCalendar1);
            this.Controls.Add(this.axWindowsMediaPlayer1);
            this.Controls.Add(this.b1);
            this.Name = "Form1";
            this.Text = "Multiuser Whiteboard Application";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.axWindowsMediaPlayer1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private W.B b1;
        private AxWMPLib.AxWindowsMediaPlayer axWindowsMediaPlayer1;
        private System.Windows.Forms.MonthCalendar monthCalendar1;
        private System.Windows.Forms.Label URL;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button button1;
    }
}

