using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Testor
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
           b1.UnInitialize();
           axWindowsMediaPlayer1.Dispose();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            b1.Initialize();
            axWindowsMediaPlayer1.URL = textBox1.Text;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            axWindowsMediaPlayer1.URL = textBox1.Text;
        }
    }
}