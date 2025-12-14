namespace Webbrowser
{
    partial class Menu
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
            this.label1 = new System.Windows.Forms.Label();
            this.TB_url = new System.Windows.Forms.TextBox();
            this.BT_select = new System.Windows.Forms.Button();
            this.CK_allownav = new System.Windows.Forms.CheckBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.label1.ForeColor = System.Drawing.Color.Lime;
            this.label1.Location = new System.Drawing.Point(12, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 15);
            this.label1.TabIndex = 0;
            this.label1.Text = "URL";
            // 
            // TB_url
            // 
            this.TB_url.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.TB_url.Location = new System.Drawing.Point(48, 19);
            this.TB_url.Name = "TB_url";
            this.TB_url.Size = new System.Drawing.Size(324, 21);
            this.TB_url.TabIndex = 1;
            this.TB_url.Text = "http://www.ce.kmitl.ac.th";
            // 
            // BT_select
            // 
            this.BT_select.BackColor = System.Drawing.Color.Lime;
            this.BT_select.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.BT_select.Location = new System.Drawing.Point(526, 15);
            this.BT_select.Name = "BT_select";
            this.BT_select.Size = new System.Drawing.Size(61, 29);
            this.BT_select.TabIndex = 3;
            this.BT_select.Text = "Select";
            this.BT_select.UseVisualStyleBackColor = false;
            // 
            // CK_allownav
            // 
            this.CK_allownav.AutoSize = true;
            this.CK_allownav.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.CK_allownav.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.CK_allownav.ForeColor = System.Drawing.Color.Lime;
            this.CK_allownav.Location = new System.Drawing.Point(380, 21);
            this.CK_allownav.Name = "CK_allownav";
            this.CK_allownav.Size = new System.Drawing.Size(132, 19);
            this.CK_allownav.TabIndex = 4;
            this.CK_allownav.Text = "Allow Navigation";
            this.CK_allownav.UseVisualStyleBackColor = true;
            // 
            // Menu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(604, 57);
            this.ControlBox = false;
            this.Controls.Add(this.CK_allownav);
            this.Controls.Add(this.BT_select);
            this.Controls.Add(this.TB_url);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "Menu";
            this.Text = "Web Browser Plugin";
            this.TopMost = true;
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        internal System.Windows.Forms.TextBox TB_url;
        internal System.Windows.Forms.Button BT_select;
        public System.Windows.Forms.CheckBox CK_allownav;
    }
}