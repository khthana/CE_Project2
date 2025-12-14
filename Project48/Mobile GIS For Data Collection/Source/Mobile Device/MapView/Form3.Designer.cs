namespace MapView
{
    partial class Form3
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.MainMenu mainMenu1;

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
            this.mainMenu1 = new System.Windows.Forms.MainMenu();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.comboBox3 = new System.Windows.Forms.ComboBox();
            this.comboBox4 = new System.Windows.Forms.ComboBox();
            this.comboBox5 = new System.Windows.Forms.ComboBox();
            this.comboBox6 = new System.Windows.Forms.ComboBox();
            this.comboBox7 = new System.Windows.Forms.ComboBox();
            this.comboBox8 = new System.Windows.Forms.ComboBox();
            this.comboBox9 = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.Location = new System.Drawing.Point(3, 3);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(233, 265);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(151, 235);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(72, 20);
            this.button1.TabIndex = 5;
            this.button1.Text = "CLOSE";
            this.button1.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(16, 235);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(57, 20);
            this.button2.TabIndex = 6;
            this.button2.Text = "Get Map";
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // textBox1
            // 
            this.textBox1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.textBox1.Location = new System.Drawing.Point(122, 21);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(78, 21);
            this.textBox1.TabIndex = 9;
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(27, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(66, 20);
            this.label1.Text = "Viewbox1";
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(27, 49);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(66, 20);
            this.label2.Text = "Viewbox2";
            // 
            // textBox2
            // 
            this.textBox2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.textBox2.Location = new System.Drawing.Point(122, 48);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(78, 21);
            this.textBox2.TabIndex = 13;
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(16, 5);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(100, 20);
            this.label3.Text = "UTM";
            // 
            // textBox3
            // 
            this.textBox3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.textBox3.Location = new System.Drawing.Point(122, 75);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(78, 21);
            this.textBox3.TabIndex = 19;
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(27, 76);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(66, 20);
            this.label4.Text = "Viewbox3";
            // 
            // textBox4
            // 
            this.textBox4.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.textBox4.Location = new System.Drawing.Point(122, 102);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(78, 21);
            this.textBox4.TabIndex = 22;
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(27, 102);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(66, 20);
            this.label5.Text = "Viewbox4";
            // 
            // label6
            // 
            this.label6.Location = new System.Drawing.Point(27, 132);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(47, 20);
            this.label6.Text = "Layer";
            // 
            // label7
            // 
            this.label7.Location = new System.Drawing.Point(121, 132);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(47, 20);
            this.label7.Text = "Color";
            // 
            // label8
            // 
            this.label8.Location = new System.Drawing.Point(167, 134);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(72, 20);
            this.label8.Text = "stroke-color";
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(88, 235);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(57, 20);
            this.button3.TabIndex = 48;
            this.button3.Text = "Layer";
            this.button3.Click += new System.EventHandler(this.button3_Click_1);
            // 
            // comboBox1
            // 
            this.comboBox1.Location = new System.Drawing.Point(15, 154);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(101, 22);
            this.comboBox1.TabIndex = 58;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // comboBox2
            // 
            this.comboBox2.Location = new System.Drawing.Point(15, 181);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(101, 22);
            this.comboBox2.TabIndex = 68;
            // 
            // comboBox3
            // 
            this.comboBox3.Location = new System.Drawing.Point(15, 207);
            this.comboBox3.Name = "comboBox3";
            this.comboBox3.Size = new System.Drawing.Size(101, 22);
            this.comboBox3.TabIndex = 69;
            // 
            // comboBox4
            // 
            this.comboBox4.Items.Add("white");
            this.comboBox4.Items.Add("green");
            this.comboBox4.Items.Add("bule");
            this.comboBox4.Items.Add("red");
            this.comboBox4.Items.Add("yellow");
            this.comboBox4.Items.Add("black");
            this.comboBox4.Items.Add("orange");
            this.comboBox4.Location = new System.Drawing.Point(122, 153);
            this.comboBox4.Name = "comboBox4";
            this.comboBox4.Size = new System.Drawing.Size(46, 22);
            this.comboBox4.TabIndex = 70;
            // 
            // comboBox5
            // 
            this.comboBox5.Items.Add("white");
            this.comboBox5.Items.Add("green");
            this.comboBox5.Items.Add("bule");
            this.comboBox5.Items.Add("red");
            this.comboBox5.Items.Add("yellow");
            this.comboBox5.Items.Add("black");
            this.comboBox5.Items.Add("orange");
            this.comboBox5.Location = new System.Drawing.Point(122, 180);
            this.comboBox5.Name = "comboBox5";
            this.comboBox5.Size = new System.Drawing.Size(46, 22);
            this.comboBox5.TabIndex = 71;
            // 
            // comboBox6
            // 
            this.comboBox6.Items.Add("white");
            this.comboBox6.Items.Add("green");
            this.comboBox6.Items.Add("bule");
            this.comboBox6.Items.Add("red");
            this.comboBox6.Items.Add("yellow");
            this.comboBox6.Items.Add("black");
            this.comboBox6.Items.Add("orange");
            this.comboBox6.Location = new System.Drawing.Point(122, 207);
            this.comboBox6.Name = "comboBox6";
            this.comboBox6.Size = new System.Drawing.Size(46, 22);
            this.comboBox6.TabIndex = 72;
            // 
            // comboBox7
            // 
            this.comboBox7.Items.Add("white");
            this.comboBox7.Items.Add("green");
            this.comboBox7.Items.Add("bule");
            this.comboBox7.Items.Add("red");
            this.comboBox7.Items.Add("yellow");
            this.comboBox7.Items.Add("black");
            this.comboBox7.Items.Add("orange");
            this.comboBox7.Location = new System.Drawing.Point(177, 153);
            this.comboBox7.Name = "comboBox7";
            this.comboBox7.Size = new System.Drawing.Size(46, 22);
            this.comboBox7.TabIndex = 73;
            // 
            // comboBox8
            // 
            this.comboBox8.Items.Add("white");
            this.comboBox8.Items.Add("green");
            this.comboBox8.Items.Add("bule");
            this.comboBox8.Items.Add("red");
            this.comboBox8.Items.Add("yellow");
            this.comboBox8.Items.Add("black");
            this.comboBox8.Items.Add("orange");
            this.comboBox8.Location = new System.Drawing.Point(177, 180);
            this.comboBox8.Name = "comboBox8";
            this.comboBox8.Size = new System.Drawing.Size(46, 22);
            this.comboBox8.TabIndex = 74;
            // 
            // comboBox9
            // 
            this.comboBox9.Items.Add("white");
            this.comboBox9.Items.Add("green");
            this.comboBox9.Items.Add("bule");
            this.comboBox9.Items.Add("red");
            this.comboBox9.Items.Add("yellow");
            this.comboBox9.Items.Add("black");
            this.comboBox9.Items.Add("orange");
            this.comboBox9.Location = new System.Drawing.Point(177, 207);
            this.comboBox9.Name = "comboBox9";
            this.comboBox9.Size = new System.Drawing.Size(46, 22);
            this.comboBox9.TabIndex = 75;
            // 
            // Form3
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(96F, 96F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            this.ClientSize = new System.Drawing.Size(240, 268);
            this.Controls.Add(this.comboBox9);
            this.Controls.Add(this.comboBox8);
            this.Controls.Add(this.comboBox7);
            this.Controls.Add(this.comboBox6);
            this.Controls.Add(this.comboBox5);
            this.Controls.Add(this.comboBox4);
            this.Controls.Add(this.comboBox3);
            this.Controls.Add(this.comboBox2);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.textBox4);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.pictureBox1);
            this.Menu = this.mainMenu1;
            this.Name = "Form3";
            this.Text = "Web Service";
            this.Load += new System.EventHandler(this.Form3_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.ComboBox comboBox2;
        private System.Windows.Forms.ComboBox comboBox3;
        private System.Windows.Forms.ComboBox comboBox4;
        private System.Windows.Forms.ComboBox comboBox5;
        private System.Windows.Forms.ComboBox comboBox6;
        private System.Windows.Forms.ComboBox comboBox7;
        private System.Windows.Forms.ComboBox comboBox8;
        private System.Windows.Forms.ComboBox comboBox9;

    }
}