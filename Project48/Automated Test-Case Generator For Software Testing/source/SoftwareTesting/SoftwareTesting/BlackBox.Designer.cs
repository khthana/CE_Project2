namespace SoftwareTesting
{
    partial class BlackBox
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
            this.Arg = new System.Windows.Forms.TextBox();
            this.submit = new System.Windows.Forms.Button();
            this.ArgGroupBox = new System.Windows.Forms.GroupBox();
            this.labelArgName = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.ValueBox = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.TypeLabel = new System.Windows.Forms.Label();
            this.resultbox = new System.Windows.Forms.TextBox();
            this.ResultButton = new System.Windows.Forms.Button();
            this.groupResult = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.Reset = new System.Windows.Forms.Button();
            this.SetArg = new System.Windows.Forms.GroupBox();
            this.Nextbutton = new System.Windows.Forms.Button();
            this.submit2 = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.MinRangeBox = new System.Windows.Forms.TextBox();
            this.atype = new System.Windows.Forms.Label();
            this.aname = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.MaxRangeBox = new System.Windows.Forms.TextBox();
            this.WhiteBox = new System.Windows.Forms.Button();
            this.WhiteResult = new System.Windows.Forms.GroupBox();
            this.WhiteDisplay = new System.Windows.Forms.RichTextBox();
            this.ArgGroupBox.SuspendLayout();
            this.groupResult.SuspendLayout();
            this.SetArg.SuspendLayout();
            this.WhiteResult.SuspendLayout();
            this.SuspendLayout();
            // 
            // Arg
            // 
            this.Arg.Location = new System.Drawing.Point(21, 28);
            this.Arg.Name = "Arg";
            this.Arg.Size = new System.Drawing.Size(96, 20);
            this.Arg.TabIndex = 0;
            this.Arg.TextChanged += new System.EventHandler(this.Arg_TextChanged);
            // 
            // submit
            // 
            this.submit.Enabled = false;
            this.submit.Location = new System.Drawing.Point(137, 26);
            this.submit.Name = "submit";
            this.submit.Size = new System.Drawing.Size(61, 23);
            this.submit.TabIndex = 1;
            this.submit.Text = "Submit";
            this.submit.UseVisualStyleBackColor = true;
            this.submit.Click += new System.EventHandler(this.summit_Click);
            // 
            // ArgGroupBox
            // 
            this.ArgGroupBox.Controls.Add(this.labelArgName);
            this.ArgGroupBox.Controls.Add(this.label6);
            this.ArgGroupBox.Controls.Add(this.ValueBox);
            this.ArgGroupBox.Controls.Add(this.label1);
            this.ArgGroupBox.Controls.Add(this.TypeLabel);
            this.ArgGroupBox.Controls.Add(this.submit);
            this.ArgGroupBox.Controls.Add(this.Arg);
            this.ArgGroupBox.Enabled = false;
            this.ArgGroupBox.Location = new System.Drawing.Point(12, 177);
            this.ArgGroupBox.Name = "ArgGroupBox";
            this.ArgGroupBox.Size = new System.Drawing.Size(216, 147);
            this.ArgGroupBox.TabIndex = 2;
            this.ArgGroupBox.TabStop = false;
            this.ArgGroupBox.Text = "Argument Value 1";
            // 
            // labelArgName
            // 
            this.labelArgName.AutoSize = true;
            this.labelArgName.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.labelArgName.Location = new System.Drawing.Point(120, 86);
            this.labelArgName.Name = "labelArgName";
            this.labelArgName.Size = new System.Drawing.Size(83, 13);
            this.labelArgName.TabIndex = 6;
            this.labelArgName.Text = "Argument Name";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.label6.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.label6.Location = new System.Drawing.Point(18, 86);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(100, 13);
            this.label6.TabIndex = 5;
            this.label6.Text = "Argument Name:";
            // 
            // ValueBox
            // 
            this.ValueBox.FormattingEnabled = true;
            this.ValueBox.Items.AddRange(new object[] {
            "Max",
            "Min",
            "Middle",
            "Random",
            "Clear"});
            this.ValueBox.Location = new System.Drawing.Point(21, 106);
            this.ValueBox.Name = "ValueBox";
            this.ValueBox.Size = new System.Drawing.Size(106, 21);
            this.ValueBox.TabIndex = 4;
            this.ValueBox.Text = "Auto Assiged Value";
            this.ValueBox.SelectedIndexChanged += new System.EventHandler(this.ValueBox_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.label1.Location = new System.Drawing.Point(18, 65);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(96, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Argument Type:";
            // 
            // TypeLabel
            // 
            this.TypeLabel.AutoSize = true;
            this.TypeLabel.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.TypeLabel.Location = new System.Drawing.Point(120, 65);
            this.TypeLabel.Name = "TypeLabel";
            this.TypeLabel.Size = new System.Drawing.Size(75, 13);
            this.TypeLabel.TabIndex = 2;
            this.TypeLabel.Text = "Argument type";
            // 
            // resultbox
            // 
            this.resultbox.Location = new System.Drawing.Point(80, 20);
            this.resultbox.Name = "resultbox";
            this.resultbox.Size = new System.Drawing.Size(54, 20);
            this.resultbox.TabIndex = 3;
            // 
            // ResultButton
            // 
            this.ResultButton.Enabled = false;
            this.ResultButton.Location = new System.Drawing.Point(10, 64);
            this.ResultButton.Name = "ResultButton";
            this.ResultButton.Size = new System.Drawing.Size(64, 26);
            this.ResultButton.TabIndex = 4;
            this.ResultButton.Text = "Result";
            this.ResultButton.UseVisualStyleBackColor = true;
            this.ResultButton.Click += new System.EventHandler(this.ResultButton_Click);
            // 
            // groupResult
            // 
            this.groupResult.Controls.Add(this.label4);
            this.groupResult.Controls.Add(this.Reset);
            this.groupResult.Controls.Add(this.ResultButton);
            this.groupResult.Controls.Add(this.resultbox);
            this.groupResult.Location = new System.Drawing.Point(320, 218);
            this.groupResult.Name = "groupResult";
            this.groupResult.Size = new System.Drawing.Size(156, 106);
            this.groupResult.TabIndex = 5;
            this.groupResult.TabStop = false;
            this.groupResult.Text = "Test Result";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.label4.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.label4.Location = new System.Drawing.Point(18, 23);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(43, 13);
            this.label4.TabIndex = 6;
            this.label4.Text = "Result";
            // 
            // Reset
            // 
            this.Reset.Enabled = false;
            this.Reset.Location = new System.Drawing.Point(80, 64);
            this.Reset.Name = "Reset";
            this.Reset.Size = new System.Drawing.Size(64, 26);
            this.Reset.TabIndex = 5;
            this.Reset.Text = "Again";
            this.Reset.UseVisualStyleBackColor = true;
            this.Reset.Click += new System.EventHandler(this.Reset_Click);
            // 
            // SetArg
            // 
            this.SetArg.Controls.Add(this.Nextbutton);
            this.SetArg.Controls.Add(this.submit2);
            this.SetArg.Controls.Add(this.label8);
            this.SetArg.Controls.Add(this.label7);
            this.SetArg.Controls.Add(this.MinRangeBox);
            this.SetArg.Controls.Add(this.atype);
            this.SetArg.Controls.Add(this.aname);
            this.SetArg.Controls.Add(this.label3);
            this.SetArg.Controls.Add(this.label2);
            this.SetArg.Controls.Add(this.MaxRangeBox);
            this.SetArg.Location = new System.Drawing.Point(12, 21);
            this.SetArg.Name = "SetArg";
            this.SetArg.Size = new System.Drawing.Size(263, 141);
            this.SetArg.TabIndex = 6;
            this.SetArg.TabStop = false;
            this.SetArg.Text = "Set Argument Range";
            // 
            // Nextbutton
            // 
            this.Nextbutton.Location = new System.Drawing.Point(175, 26);
            this.Nextbutton.Name = "Nextbutton";
            this.Nextbutton.Size = new System.Drawing.Size(72, 24);
            this.Nextbutton.TabIndex = 10;
            this.Nextbutton.Text = "Next";
            this.Nextbutton.UseVisualStyleBackColor = true;
            this.Nextbutton.Click += new System.EventHandler(this.Nextbutton_Click);
            // 
            // submit2
            // 
            this.submit2.Enabled = false;
            this.submit2.Location = new System.Drawing.Point(175, 58);
            this.submit2.Name = "submit2";
            this.submit2.Size = new System.Drawing.Size(72, 24);
            this.submit2.TabIndex = 9;
            this.submit2.Text = "submit";
            this.submit2.UseVisualStyleBackColor = true;
            this.submit2.Click += new System.EventHandler(this.summit2_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(6, 58);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(54, 13);
            this.label8.TabIndex = 8;
            this.label8.Text = "Min Value";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(6, 32);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(57, 13);
            this.label7.TabIndex = 7;
            this.label7.Text = "Max Value";
            // 
            // MinRangeBox
            // 
            this.MinRangeBox.Location = new System.Drawing.Point(73, 55);
            this.MinRangeBox.Name = "MinRangeBox";
            this.MinRangeBox.Size = new System.Drawing.Size(96, 20);
            this.MinRangeBox.TabIndex = 6;
            this.MinRangeBox.Text = "Insert Value";
            // 
            // atype
            // 
            this.atype.AutoSize = true;
            this.atype.Location = new System.Drawing.Point(112, 118);
            this.atype.Name = "atype";
            this.atype.Size = new System.Drawing.Size(35, 13);
            this.atype.TabIndex = 5;
            this.atype.Text = "label5";
            // 
            // aname
            // 
            this.aname.AutoSize = true;
            this.aname.Location = new System.Drawing.Point(112, 89);
            this.aname.Name = "aname";
            this.aname.Size = new System.Drawing.Size(35, 13);
            this.aname.TabIndex = 4;
            this.aname.Text = "label4";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.label3.ForeColor = System.Drawing.Color.Maroon;
            this.label3.Location = new System.Drawing.Point(6, 118);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(92, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Argument type:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.label2.ForeColor = System.Drawing.Color.Maroon;
            this.label2.Location = new System.Drawing.Point(6, 89);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(100, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Argument Name:";
            // 
            // MaxRangeBox
            // 
            this.MaxRangeBox.Location = new System.Drawing.Point(73, 29);
            this.MaxRangeBox.Name = "MaxRangeBox";
            this.MaxRangeBox.Size = new System.Drawing.Size(96, 20);
            this.MaxRangeBox.TabIndex = 1;
            this.MaxRangeBox.Text = "Insert Value";
            // 
            // WhiteBox
            // 
            this.WhiteBox.Enabled = false;
            this.WhiteBox.Location = new System.Drawing.Point(78, 156);
            this.WhiteBox.Name = "WhiteBox";
            this.WhiteBox.Size = new System.Drawing.Size(72, 24);
            this.WhiteBox.TabIndex = 11;
            this.WhiteBox.Text = "Whit eBox";
            this.WhiteBox.UseVisualStyleBackColor = true;
            this.WhiteBox.Click += new System.EventHandler(this.WhiteBox_Click);
            // 
            // WhiteResult
            // 
            this.WhiteResult.Controls.Add(this.WhiteDisplay);
            this.WhiteResult.Controls.Add(this.WhiteBox);
            this.WhiteResult.Location = new System.Drawing.Point(292, 21);
            this.WhiteResult.Name = "WhiteResult";
            this.WhiteResult.Size = new System.Drawing.Size(217, 191);
            this.WhiteResult.TabIndex = 12;
            this.WhiteResult.TabStop = false;
            this.WhiteResult.Text = "White Box Result";
            // 
            // WhiteDisplay
            // 
            this.WhiteDisplay.Location = new System.Drawing.Point(18, 27);
            this.WhiteDisplay.Name = "WhiteDisplay";
            this.WhiteDisplay.Size = new System.Drawing.Size(177, 113);
            this.WhiteDisplay.TabIndex = 13;
            this.WhiteDisplay.Text = "";
            // 
            // BlackBox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(532, 336);
            this.Controls.Add(this.WhiteResult);
            this.Controls.Add(this.SetArg);
            this.Controls.Add(this.groupResult);
            this.Controls.Add(this.ArgGroupBox);
            this.Name = "BlackBox";
            this.Text = "BlackBox";
            this.ArgGroupBox.ResumeLayout(false);
            this.ArgGroupBox.PerformLayout();
            this.groupResult.ResumeLayout(false);
            this.groupResult.PerformLayout();
            this.SetArg.ResumeLayout(false);
            this.SetArg.PerformLayout();
            this.WhiteResult.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TextBox Arg;
        private System.Windows.Forms.Button submit;
        private System.Windows.Forms.GroupBox ArgGroupBox;
        private System.Windows.Forms.TextBox resultbox;
        private System.Windows.Forms.Button ResultButton;
        private System.Windows.Forms.GroupBox groupResult;
        private System.Windows.Forms.Label TypeLabel;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox ValueBox;
        private System.Windows.Forms.GroupBox SetArg;
        private System.Windows.Forms.TextBox MaxRangeBox;
        private System.Windows.Forms.Label labelArgName;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label atype;
        private System.Windows.Forms.Label aname;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox MinRangeBox;
        private System.Windows.Forms.Button submit2;
        private System.Windows.Forms.Button Nextbutton;
        private System.Windows.Forms.Button Reset;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button WhiteBox;
        private System.Windows.Forms.GroupBox WhiteResult;
        private System.Windows.Forms.RichTextBox WhiteDisplay;
    }
}