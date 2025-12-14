using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;

namespace Webbrowser
{
    public partial class WB : UserControl
    {
        public int id;
        Browser b;
        int X;
        int Y;
        int W;
        int H;
        string U;
        public WB(int pid,Browser bb,int x,int y,int w,int h,string url,bool anv)
        {
            InitializeComponent();
            id = pid;
            b = bb;
            X = x;
            Y = y;
            W = w;
            H = h;
            U = url;
            this.SuspendLayout();
            // 
            // webBrowser1
            // 
            this.Size = new Size(W, H);
            this.Location = new Point(X, Y);
            browser.Location = new System.Drawing.Point(2,29);
            browser.Size = new System.Drawing.Size(W - 4, H - 31);
            browser.Url = new Uri(U);
            
            TB_url.Text = U;
            browser.AllowNavigation = anv;
            if (anv)
            {
                this.BackColor = Color.OrangeRed;
            }
            if (W < 144)
            {
                TB_url.Visible = false;
            }
            else
            {
                TB_url.Size = new Size(W - 33, 21);
            }
            browser.Show();
            this.ResumeLayout(false);
        }

        private void WB_Load(object sender, EventArgs e)
        {
        }

        private void BT_close_Click(object sender, EventArgs e)
        {
            b.Wclose(this);
        }
    }
}
