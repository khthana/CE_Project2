namespace Webbrowser
{
    partial class WB
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(WB));
            this.BT_close = new System.Windows.Forms.Button();
            this.TB_url = new System.Windows.Forms.TextBox();
            this.browser = new System.Windows.Forms.WebBrowser();
            this.SuspendLayout();
            // 
            // BT_close
            // 
            this.BT_close.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.BT_close.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("BT_close.BackgroundImage")));
            this.BT_close.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.BT_close.Cursor = System.Windows.Forms.Cursors.PanNorth;
            this.BT_close.ForeColor = System.Drawing.SystemColors.Desktop;
            this.BT_close.Location = new System.Drawing.Point(0, 0);
            this.BT_close.Name = "BT_close";
            this.BT_close.Size = new System.Drawing.Size(29, 28);
            this.BT_close.TabIndex = 0;
            this.BT_close.UseVisualStyleBackColor = false;
            this.BT_close.Click += new System.EventHandler(this.BT_close_Click);
            // 
            // TB_url
            // 
            this.TB_url.BackColor = System.Drawing.Color.LightCyan;
            this.TB_url.Cursor = System.Windows.Forms.Cursors.No;
            this.TB_url.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.TB_url.ForeColor = System.Drawing.Color.Navy;
            this.TB_url.Location = new System.Drawing.Point(30, 4);
            this.TB_url.Name = "TB_url";
            this.TB_url.ReadOnly = true;
            this.TB_url.Size = new System.Drawing.Size(246, 21);
            this.TB_url.TabIndex = 1;
            // 
            // browser
            // 
            this.browser.AllowNavigation = false;
            this.browser.Location = new System.Drawing.Point(3, 29);
            this.browser.MinimumSize = new System.Drawing.Size(20, 20);
            this.browser.Name = "browser";
            this.browser.Size = new System.Drawing.Size(279, 250);
            this.browser.TabIndex = 2;
            // 
            // WB
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Black;
            this.Controls.Add(this.browser);
            this.Controls.Add(this.TB_url);
            this.Controls.Add(this.BT_close);
            this.Name = "WB";
            this.Size = new System.Drawing.Size(279, 243);
            this.Load += new System.EventHandler(this.WB_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button BT_close;
        private System.Windows.Forms.TextBox TB_url;
        private System.Windows.Forms.WebBrowser browser;
    }
}
