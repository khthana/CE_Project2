using System;
using System.Collections.Generic;
using System.Collections;
using System.Text;
using W;
using System.Drawing;
using System.Windows.Forms;
namespace Webbrowser
{
    public class Browser:W.IPlugin
    {
        W.B board;
        ArrayList webBrowsers;
        Menu m;
        static int id;
        public void Load(W.B b)
        {
            board = b;
            id = 0;
            webBrowsers = new ArrayList();
            b.Board.MouseDown += new MouseEventHandler(this.B_MouseDown);
            b.Board.MouseUp += new MouseEventHandler(this.B_MouseUp);
            b.Board.MouseMove += new MouseEventHandler(this.B_MouseMove);
            m = new Menu();
            m.BT_select.MouseClick += new MouseEventHandler(this.BT_select_Click);
            m.Show();
            tempimg = (Image)board.Board.Image.Clone();
        }
        public void MessageEvent(byte[] b)
        {
            bool n = false;
            int x, y, w, h,id;
            string url;
            switch ((Type)b[0])
            {
                case Type.Create:
                    {
                        try
                        {                  
                            switch ((Nav)b[1])
                            {
                                case Nav.Allow:
                                    {
                                        n = true;
                                    } break;
                                case Nav.Not_Allow:
                                    {
                                        n = false;
                                    } break;
                            }
                            id = (int)b[2];
                            int index = 4;
                            byte[] temp = new byte[b[3]];
                            for (int i = 0; i < b[3]; i++)
                            {
                                temp[i] = b[index + i];
                            }
                            x = Int32.Parse(Encoding.ASCII.GetString(temp));
                            index += b[3];
                            temp = new byte[b[index]];
                            for (int i = 1; i <= b[index]; i++)
                            {
                                temp[i - 1] = b[index + i];
                            }
                            y = Int32.Parse(Encoding.ASCII.GetString(temp));
                            index += b[index]+1;
                            temp = new byte[b[index]];
                            for (int i = 1; i <= b[index]; i++)
                            {
                                temp[i - 1] = b[index + i];
                            }
                            w = Int32.Parse(Encoding.ASCII.GetString(temp));
                            index += b[index] + 1;
                            temp = new byte[b[index]];
                           
                            for (int i = 1; i <= b[index]; i++)
                            {
                                temp[i - 1] = b[index + i];
                            }
                            h = Int32.Parse(Encoding.ASCII.GetString(temp));
                            index += b[index ] + 1;
                            temp = new byte[b[index]];
                            for (int i = 1; i <= b[index]; i++)
                            {
                                temp[i - 1] = b[index + i];
                            }
                            url = Encoding.ASCII.GetString(temp);
                            WB wb;
                            if ((wb = CreateWB(id,x, y, w, h, n,url)) != null)
                            {
                                webBrowsers.Add(wb);
                            }
                        }
                        catch(Exception e)
                        {
                            MessageBox.Show(e.ToString());
                        }

                    } break;
                case Type.Destroy:
                    {
                        ArrayList rmwb = new ArrayList();
                        foreach (WB wb in webBrowsers)
                        {
                            if ((byte)wb.id == b[1])
                            {
                                rmwb.Add(wb);
                            }
                        }
                        foreach (WB o in rmwb)
                        {
                            board.Board.Controls.Remove(o);
                            webBrowsers.Remove(o);
                            o.Dispose();
                        }
                    } break;
            }
        }
       
        public void SendCreate(int id,bool nav,int x,int y,int w,int h,string url)
        {
            Frame f = new Frame();
            f.type = FTYPE.PLUGIN;
            f.para = new string[1];
            f.para[0] = "Webbrowser";
            f.paraSize = 11;
            int len = 8;
            len += x.ToString().Length;
            len += y.ToString().Length;
            len += w.ToString().Length;
            len += h.ToString().Length;
            len += url.ToString().Length;
            byte[] d = new byte[len];
            d[0] = (byte)Type.Create;
            d[1] = (byte)(nav ? Nav.Allow : Nav.Not_Allow);
            d[2] = (byte)id;
            d[3] = (byte)x.ToString().Length;
            byte[] temp = Encoding.ASCII.GetBytes(x.ToString());
            byte index = 4;
            for (int i = 0; i < d[3]; i++)
            {
                d[4 + i] = temp[i];
            }
            index += d[3];
            d[index] = (byte)y.ToString().Length;
            index++;
            temp = Encoding.ASCII.GetBytes(y.ToString());
            for (int i = 0; i < d[index-1]; i++)
            {
                d[index + i] = temp[i];
            }
            index += d[index-1];
            d[index] = (byte)w.ToString().Length;
            index++;
            temp = Encoding.ASCII.GetBytes(w.ToString());
            for (int i = 0; i < d[index-1]; i++)
            {
                d[index + i] = temp[i];
            }
            index += d[index-1];
            d[index] = (byte)h.ToString().Length;
            index++;
            temp = Encoding.ASCII.GetBytes(h.ToString());
            for (int i = 0; i < d[index-1]; i++)
            {
                d[index + i] = temp[i];
            }
            index += d[index-1];
            d[index] = (byte)url.ToString().Length;
            index++;
            temp = Encoding.ASCII.GetBytes(url.ToString());
            for (int i = 0; i < d[index-1]; i++)
            {
                d[index + i] = temp[i];
            }
            f.data = d;
            f.cmd = CMD.Others;
            board.Net.Send(f);
        }
        public void SendDelete(int id)
        {
            Frame f = new Frame();
            f.type = FTYPE.PLUGIN;
            f.para = new string[1];
            f.para[0] = "Webbrowser";
            f.cmd = CMD.Others;
            
            f.paraSize = 11;
           
            byte[] d = new byte[2];
            d[0] = (byte)Type.Destroy;
            d[1] = (byte)id;
            f.data = d;
            board.Net.Send(f);
        }
        public void UnLoad()
        {
            tempimg.Dispose();
            m.Close();
            board.Board.MouseDown -= new MouseEventHandler(this.B_MouseDown);
            board.Board.MouseUp -= new MouseEventHandler(this.B_MouseUp);
            board.Board.MouseMove -= new MouseEventHandler(this.B_MouseMove);
            board.Board.Cursor = Cursors.Default;
            foreach (WB b in webBrowsers)
            {
                board.Board.Controls.Remove(b);
                SendDelete(b.id);
                b.Dispose();
            }
        }
        string name;
        public string Name
        {
            set
            {
                name = value;
            }
            get
            {
                return name; 
            }
        }
        int x = 0;
        int y = 0;
        bool press = false;
        private void B_MouseDown(object sender, MouseEventArgs e)
        {
            if (board.Board.Cursor == Cursors.PanNW)
            {
                tempimg.Dispose();
                tempimg = (Image)board.Board.Image.Clone();
            }
            if (board.Board.Cursor == Cursors.PanNW)
            {
                x = e.X;
                y = e.Y;
            }
            press = true;
        }
        Image tempimg;
        private void B_MouseMove(object sender, MouseEventArgs e)
        {
            if (press)
            {
                if (((e.X - x) > 40) && ((e.Y - y) > 40))
                {
                    if (board.Board.Cursor == Cursors.PanNW)
                    {
                        board.Board.Image.Dispose();
                        board.Board.Image = (Image)tempimg.Clone();
                        tempimg.Dispose();
                        tempimg = (Image)board.Board.Image.Clone();
                        System.Drawing.Graphics g = Graphics.FromImage(board.Board.Image);
                        Pen p = new Pen(new SolidBrush(board.Color), 2);
                        p.DashStyle = System.Drawing.Drawing2D.DashStyle.DashDot;
                        g.DrawRectangle(p, x, y, e.X - x, e.Y - y);
                        board.Board.Refresh();
                        g.Dispose();
                    }
                }
            }
        }
        private void B_MouseUp(object sender, MouseEventArgs e)
        {
            press = false;
            if (board.Board.Cursor == Cursors.PanNW)
            {
                board.Board.Image.Dispose();
                board.Board.Image = (Image)tempimg.Clone();
                if(((e.X - x)>40)&&((e.Y - y)> 40))
                {
                    WB wb;
                    if ((wb = CreateWB(x, y, e.X - x, e.Y - y, m.TB_url.Text)) != null)
                    {
                        webBrowsers.Add(wb);
                    }
                    else
                    {
                        MessageBox.Show("Number of Webbrower Exceed");
                    }
                }
            }
        }
        private void BT_select_Click(object sender, EventArgs e)
        {
            board.Device = null;
            if (board.menu != null)
            {
                board.menu.Close_();
            }
            board.Board.Cursor = Cursors.PanNW;
        }
        private WB CreateWB(int x,int y,int w,int h,string url)
        {
            if (id < 253)
            {
                board.Board.SuspendLayout();
                WB ww = new WB(id, this, x, y, w, h, url, m.CK_allownav.Checked);
                board.Board.Controls.Add(ww);
                ww.Show();
                board.Board.ResumeLayout(false);
                board.Board.Refresh();
                SendCreate(id, m.CK_allownav.Checked, x, y, w, h, url);
                id++;
                return ww;
            }
            else
            {
                return null;
            }
        }
        private WB CreateWB(int id_,int x, int y, int w, int h,bool n, string url)
        {
            if (id < 253)
            {
                board.Board.SuspendLayout();
                WB ww = new WB(id_, this, x, y, w, h, url,n);
                board.Board.Controls.Add(ww);
                ww.Show();
                board.Board.ResumeLayout(false);
                board.Board.Refresh();
               
                id++;
                return ww;
            }
            else
            {
                return null;
            }
        }

        public void Wclose(WB o)
        {
            webBrowsers.Remove(o);
            board.Board.Controls.Remove(o);
            SendDelete(o.id);
            o.Dispose();
        }
    }
}
