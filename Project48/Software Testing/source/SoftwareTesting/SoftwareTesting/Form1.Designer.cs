namespace SoftwareTesting
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
            this.open = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.Help = new System.Windows.Forms.Button();
            this.quit = new System.Windows.Forms.Button();
            this.filename = new System.Windows.Forms.TextBox();
            this.test = new System.Windows.Forms.Button();
            this.text2 = new System.Windows.Forms.RichTextBox();
            this.ResultShow = new System.Windows.Forms.RichTextBox();
            this.ClassList = new System.Windows.Forms.ComboBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.blackboxbutton = new System.Windows.Forms.Button();
            this.ShowAllPath = new System.Windows.Forms.Button();
            this.ShowArg = new System.Windows.Forms.Button();
            this.ResultType = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.ComButton = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // open
            // 
            this.open.Enabled = false;
            this.open.Location = new System.Drawing.Point(177, 17);
            this.open.Name = "open";
            this.open.Size = new System.Drawing.Size(79, 28);
            this.open.TabIndex = 0;
            this.open.Text = "Open";
            this.open.UseVisualStyleBackColor = true;
            this.open.Click += new System.EventHandler(this.button1_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // Help
            // 
            this.Help.Location = new System.Drawing.Point(29, 284);
            this.Help.Name = "Help";
            this.Help.Size = new System.Drawing.Size(79, 28);
            this.Help.TabIndex = 1;
            this.Help.Text = "Help";
            this.Help.UseVisualStyleBackColor = true;
            this.Help.Click += new System.EventHandler(this.Help_Click);
            // 
            // quit
            // 
            this.quit.Location = new System.Drawing.Point(29, 318);
            this.quit.Name = "quit";
            this.quit.Size = new System.Drawing.Size(79, 28);
            this.quit.TabIndex = 2;
            this.quit.Text = "Quit";
            this.quit.UseVisualStyleBackColor = true;
            this.quit.Click += new System.EventHandler(this.quit_Click);
            // 
            // filename
            // 
            this.filename.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            this.filename.Location = new System.Drawing.Point(17, 22);
            this.filename.Name = "filename";
            this.filename.ReadOnly = true;
            this.filename.ScrollBars = System.Windows.Forms.ScrollBars.Horizontal;
            this.filename.Size = new System.Drawing.Size(154, 20);
            this.filename.TabIndex = 3;
            // 
            // test
            // 
            this.test.Enabled = false;
            this.test.Location = new System.Drawing.Point(13, 56);
            this.test.Name = "test";
            this.test.Size = new System.Drawing.Size(79, 28);
            this.test.TabIndex = 4;
            this.test.Text = "Testing";
            this.test.UseVisualStyleBackColor = true;
            this.test.Click += new System.EventHandler(this.test_Click);
            // 
            // text2
            // 
            this.text2.Location = new System.Drawing.Point(17, 51);
            this.text2.Name = "text2";
            this.text2.Size = new System.Drawing.Size(239, 150);
            this.text2.TabIndex = 5;
            this.text2.Text = "";
            // 
            // ResultShow
            // 
            this.ResultShow.Location = new System.Drawing.Point(19, 84);
            this.ResultShow.Name = "ResultShow";
            this.ResultShow.Size = new System.Drawing.Size(280, 194);
            this.ResultShow.TabIndex = 6;
            this.ResultShow.Text = "";
            // 
            // ClassList
            // 
            this.ClassList.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.ClassList.Enabled = false;
            this.ClassList.FormattingEnabled = true;
            this.ClassList.Location = new System.Drawing.Point(13, 19);
            this.ClassList.Name = "ClassList";
            this.ClassList.Size = new System.Drawing.Size(113, 21);
            this.ClassList.TabIndex = 7;
            this.ClassList.Text = "Choose class here";
            this.ClassList.SelectedIndexChanged += new System.EventHandler(this.ClassList_SelectedIndexChanged);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.blackboxbutton);
            this.groupBox1.Controls.Add(this.ShowAllPath);
            this.groupBox1.Controls.Add(this.ShowArg);
            this.groupBox1.Controls.Add(this.ResultType);
            this.groupBox1.Controls.Add(this.ResultShow);
            this.groupBox1.Location = new System.Drawing.Point(319, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(323, 338);
            this.groupBox1.TabIndex = 8;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Result";
            // 
            // blackboxbutton
            // 
            this.blackboxbutton.Enabled = false;
            this.blackboxbutton.Location = new System.Drawing.Point(125, 294);
            this.blackboxbutton.Name = "blackboxbutton";
            this.blackboxbutton.Size = new System.Drawing.Size(71, 27);
            this.blackboxbutton.TabIndex = 10;
            this.blackboxbutton.Text = "TEST";
            this.blackboxbutton.UseVisualStyleBackColor = true;
            this.blackboxbutton.Click += new System.EventHandler(this.blackboxbutton_Click);
            // 
            // ShowAllPath
            // 
            this.ShowAllPath.Enabled = false;
            this.ShowAllPath.Location = new System.Drawing.Point(199, 47);
            this.ShowAllPath.Name = "ShowAllPath";
            this.ShowAllPath.Size = new System.Drawing.Size(71, 27);
            this.ShowAllPath.TabIndex = 9;
            this.ShowAllPath.Text = "All Path";
            this.ShowAllPath.UseVisualStyleBackColor = true;
            this.ShowAllPath.Click += new System.EventHandler(this.ShowAllPath_Click);
            // 
            // ShowArg
            // 
            this.ShowArg.Enabled = false;
            this.ShowArg.Location = new System.Drawing.Point(44, 47);
            this.ShowArg.Name = "ShowArg";
            this.ShowArg.Size = new System.Drawing.Size(71, 27);
            this.ShowArg.TabIndex = 8;
            this.ShowArg.Text = "Argument";
            this.ShowArg.UseVisualStyleBackColor = true;
            this.ShowArg.Click += new System.EventHandler(this.ShowArg_Click);
            // 
            // ResultType
            // 
            this.ResultType.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            this.ResultType.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.ResultType.Enabled = false;
            this.ResultType.ForeColor = System.Drawing.SystemColors.WindowText;
            this.ResultType.Location = new System.Drawing.Point(19, 17);
            this.ResultType.Name = "ResultType";
            this.ResultType.Size = new System.Drawing.Size(280, 20);
            this.ResultType.TabIndex = 7;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.open);
            this.groupBox2.Controls.Add(this.filename);
            this.groupBox2.Controls.Add(this.text2);
            this.groupBox2.Location = new System.Drawing.Point(12, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(284, 224);
            this.groupBox2.TabIndex = 9;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Source code";
            // 
            // ComButton
            // 
            this.ComButton.Location = new System.Drawing.Point(29, 250);
            this.ComButton.Name = "ComButton";
            this.ComButton.Size = new System.Drawing.Size(79, 28);
            this.ComButton.TabIndex = 6;
            this.ComButton.Text = "Compiler";
            this.ComButton.UseVisualStyleBackColor = true;
            this.ComButton.Click += new System.EventHandler(this.ComButton_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.ClassList);
            this.groupBox3.Controls.Add(this.test);
            this.groupBox3.Location = new System.Drawing.Point(153, 250);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(143, 100);
            this.groupBox3.TabIndex = 10;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Class Select";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(663, 365);
            this.Controls.Add(this.ComButton);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.Help);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.quit);
            this.Name = "Form1";
            this.Text = "Form1";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button open;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Button Help;
        private System.Windows.Forms.Button quit;
        private System.Windows.Forms.TextBox filename;
        private System.Windows.Forms.Button test;
        private System.Windows.Forms.RichTextBox text2;
        private System.Windows.Forms.RichTextBox ResultShow;
        private System.Windows.Forms.ComboBox ClassList;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.TextBox ResultType;
        private System.Windows.Forms.Button ShowArg;
        private System.Windows.Forms.Button ShowAllPath;
        private System.Windows.Forms.Button blackboxbutton;
        private System.Windows.Forms.Button ComButton;
    }
}

