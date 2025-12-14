using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.IO;
using System.Diagnostics;

namespace W
{
    #region interface
    
    #endregion
    public partial class B : UserControl
    {
        delegate void PluginMessageCallback(Frame f);
        internal void PluginMessage(Frame frame)
        {
            if (this.board.InvokeRequired)
            {
                PluginMessageCallback d = new PluginMessageCallback(PluginMessage);
                this.Invoke(d, frame);
            }
            else
            {
                foreach (IPlugin o in loadedPlugins)
                {
                    if(o.Name == frame.para[0] )
                    {
                        o.MessageEvent(frame.data);
                        return;
                    }
                }
            }
        }

       
        delegate void RedrawCallback(Frame f);
        public void Redraw(Frame frame)
        {
            if (this.board.InvokeRequired)
            {
                RedrawCallback d = new RedrawCallback(Redraw);
                this.Invoke(d,frame);
            }
            else
            {
              
                switch (frame.cmd)
                {
                    case CMD.Circle:
                        {
                            Graphics g = Graphics.FromImage(board.Image);
                            Graphics g_ = Graphics.FromImage(this.backImage);
                            if (frame.para[0] == "f")
                            {
                                if (frame.para[7] == "t")
                                {
                                    g_.FillEllipse(new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2]))), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]), float.Parse(frame.para[5]));
                                    g.FillEllipse(new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2]))), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]), float.Parse(frame.para[5]));
                                }
                                else
                                {
                                    g_.FillEllipse(new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2]))), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]) - float.Parse(frame.para[3]), float.Parse(frame.para[6]) - float.Parse(frame.para[4]));
                                    g.FillEllipse(new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2]))), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]) - float.Parse(frame.para[3]), float.Parse(frame.para[6]) - float.Parse(frame.para[4]));
                                }
                            }
                            else
                            {
                                if (frame.para[7] == "t")
                                {
                                    g_.DrawEllipse(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), float.Parse(frame.para[1])), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]), float.Parse(frame.para[5]));
                                    g.DrawEllipse(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), float.Parse(frame.para[1])), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]), float.Parse(frame.para[5]));
                                }
                                else
                                {
                                    g_.DrawEllipse(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), float.Parse(frame.para[1])), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]) - float.Parse(frame.para[3]), float.Parse(frame.para[6]) - float.Parse(frame.para[4]));
                                    g.DrawEllipse(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), float.Parse(frame.para[1])), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]) - float.Parse(frame.para[3]), float.Parse(frame.para[6]) - float.Parse(frame.para[4]));
                                }
                            }
                            g_.Dispose();
                            g.Dispose();
                        } break;
                    case CMD.Rectangle:
                        {
                            Graphics g = Graphics.FromImage(board.Image);
                            Graphics g_ = Graphics.FromImage(backImage);
                            if (frame.para[0] == "f")
                            {
                                g_.FillRectangle(new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2]))), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]) - float.Parse(frame.para[3]), float.Parse(frame.para[6]) - float.Parse(frame.para[4]));
                                g.FillRectangle(new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2]))), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]) - float.Parse(frame.para[3]), float.Parse(frame.para[6]) - float.Parse(frame.para[4]));
                            }
                            else
                            {
                                g_.DrawRectangle(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), float.Parse(frame.para[1])), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]) - float.Parse(frame.para[3]), float.Parse(frame.para[6]) - float.Parse(frame.para[4]));
                                g.DrawRectangle(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), float.Parse(frame.para[1])), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]) - float.Parse(frame.para[3]), float.Parse(frame.para[6]) - float.Parse(frame.para[4]));
                            }
                            g_.Dispose();
                            g.Dispose();
                        } break;
                    case CMD.Polygon:
                        {
                            Graphics g = Graphics.FromImage(board.Image);
                            Graphics g_ = Graphics.FromImage(backImage);
                            PointF[] ps = new PointF[Int32.Parse(frame.para[1])];
                            for (int i = 0; i < ps.Length; i++)
                            {
                                ps[i] = new PointF(float.Parse(frame.para[3 + (i * 2)]), float.Parse(frame.para[4 + (i * 2)]));
                            }
                            if (frame.para[0] == "d")
                            {
                                g_.DrawPolygon(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), 3), ps);
                                g.DrawPolygon(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), 3), ps);
                            }
                            else
                            {
                                g.FillPolygon(new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2]))), ps);
                                g_.FillPolygon(new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2]))), ps);
                            }
                            g_.Dispose();
                            g.Dispose();
                        } break;

                    case CMD.Line:
                        {
                            Graphics g = Graphics.FromImage(board.Image);
                            Graphics g_ = Graphics.FromImage(backImage);
                            if (frame.para[0] == "d")
                            {
                                g.DrawLine(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), float.Parse(frame.para[1])), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]), float.Parse(frame.para[6]));
                                g_.DrawLine(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), float.Parse(frame.para[1])), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[5]), float.Parse(frame.para[6]));
                            }
                            else
                            {
                                System.Drawing.Point[] p = new System.Drawing.Point[3];
                                p[0] = new System.Drawing.Point(Int32.Parse(frame.para[3]), Int32.Parse(frame.para[4]));
                                p[1] = new System.Drawing.Point(Int32.Parse(frame.para[5]), Int32.Parse(frame.para[6]));
                                p[2] = new System.Drawing.Point(Int32.Parse(frame.para[7]), Int32.Parse(frame.para[8]));
                                g.DrawCurve(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), float.Parse(frame.para[1])), p);
                                g_.DrawCurve(new Pen(Color.FromArgb(Int32.Parse(frame.para[2])), float.Parse(frame.para[1])), p);
                            }
                            g_.Dispose();
                            g.Dispose();
                        } break;
                    
                    case CMD.Image:
                        {
                            
                            Graphics g_ = Graphics.FromImage(backImage);
                                g_.DrawImage(Imager.Imager.CvByteArrayToImage(frame.data), Int32.Parse(frame.para[0]), Int32.Parse(frame.para[1]));
                                g_.Dispose();
                       
                            Graphics g = Graphics.FromImage(board.Image);
                            g.DrawImage(Imager.Imager.CvByteArrayToImage(frame.data), Int32.Parse(frame.para[0]),Int32.Parse( frame.para[1]));
                            g.Dispose();

                        } break;
                    case CMD.Text:
                        {
                            Graphics g = Graphics.FromImage(board.Image);
                            Graphics g_ = Graphics.FromImage(backImage);
                            FontStyle f = FontStyle.Regular;
                            string[] fs = frame.para[5].ToString().Split(',');
                            foreach (string ss in fs)
                            {
                                string s = ss;
                                if (ss[0] == ' ')
                                {
                                    s = s.Substring(1, s.Length - 1);
                                }
                                switch (s)
                                {
                                    case "Bold":
                                        {
                                            f |= FontStyle.Bold;
                                        } break;
                                    case "Italic":
                                        {
                                            f |= FontStyle.Italic;
                                        } break;
                                    case "Underline":
                                        {
                                            f |= FontStyle.Underline;
                                        } break;
                                    case "Strikeout":
                                        {
                                            f |= FontStyle.Strikeout;
                                        } break;
                                }
                            }
                            g_.DrawString(frame.para[6], new Font(frame.para[0], float.Parse(frame.para[1]), f), new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2].ToString()))), new PointF(float.Parse(frame.para[3]), float.Parse(frame.para[4])));
                           
                            g.DrawString(frame.para[6], new Font(frame.para[0], float.Parse(frame.para[1]), f), new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2].ToString()))), new PointF(float.Parse(frame.para[3]), float.Parse(frame.para[4])));
                            g_.Dispose();
                            g.Dispose();
                        } break;
                    case CMD.Point:
                        {
                            Graphics g_ = Graphics.FromImage(backImage);
                            g_.FillEllipse(new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2]))), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[1]) + 2, float.Parse(frame.para[1]) + 2);
                            g_.Dispose();
                            Graphics g = Graphics.FromImage(board.Image);
                            g.FillEllipse(new SolidBrush(Color.FromArgb(Int32.Parse(frame.para[2]))), float.Parse(frame.para[3]), float.Parse(frame.para[4]), float.Parse(frame.para[1]) + 2, float.Parse(frame.para[1]) + 2);
                            g.Dispose();
                        } break;
                    case CMD.Rubber:
                        {
                            Graphics g_ = Graphics.FromImage(backImage);
                            g_.FillRectangle(new SolidBrush(Color.White), float.Parse(frame.para[3]) + 1, float.Parse(frame.para[4]) + 1, float.Parse(frame.para[1]), float.Parse(frame.para[1]));
                            g_.Dispose();
                            Graphics g = Graphics.FromImage(board.Image);
                            g.FillRectangle(new SolidBrush(Color.White), float.Parse(frame.para[3])+1, float.Parse(frame.para[4])+1, float.Parse(frame.para[1]) , float.Parse(frame.para[1]) );
                            g.Dispose();
                        } break;
                }
                this.board.Refresh();
            }
        }
        internal System.Drawing.Image backImage;
        #region Properties
        public IMenu menu;
        private HostUser me;
        public HostUser Me
        {
            set
            {
                me = value;
            }
            get
            {
                return me;
            }
        }
        private Network net;
        public Network Net
        {
            set
            {
                net = value;
            }
            get
            {
                return net;
            }
        }
        private string username = "Remote Host";
        public string Username
        {
            set
            {
                username = value;
                me.Name = username;
            }
            get
            {
                return username;
            }
        }
        private bool autoLoadPlugins = false;
        public bool AutoLoadPlugins
        {
            set
            {
                autoLoadPlugins = value;
               
            }
            get
            {
                return autoLoadPlugins;
            }
        }
        private bool enableSizeChange = true;
        public bool EnableSizeChange
        {
            set
            {
                enableSizeChange = value;

            }
            get
            {
                return enableSizeChange;
            }
        }
        private bool enableLocationChange = false;
        public bool EnableLocationChange
        {
            set
            {
                enableLocationChange = value;

            }
            get
            {
                return enableLocationChange;
            }
        }
        
        private ArrayList users;
        public ArrayList Users
        {
            set
            {
                users = value;
                if (menu != null)
                {
                    menu.Update_();
                }
            }
            get
            {
                return users;
            }
        }
        private Setting settings;
        public Setting Settings
        {
            set
            {
                settings = value;
            }
            get
            {
                return settings;
            }
        }
        private ObjectFormSetting objectsSetting;
        public ObjectFormSetting ObjectsSetting
        {
            get
            {
                return objectsSetting;
            }
        }
        bool isMenuShowed;
        public bool IsMenuShowed
        {
            set
            {
                isMenuShowed = value;
            }
            get
            {
                return isMenuShowed;
            }
        }
        public PictureBox Board
        {
            get
            {
                return board;
            }
        }
        private Color color;
        public Color Color
        {
            get
            {
                return color;
            }
            set
            {
                color = value;
                if(device != null)
                {
                    device.Clear();
                }
            }
        }
        private uint bordersize;
        public uint Bordersize
        {
            set 
            {
                if (((value * 2) < this.Width) && ((value * 2 < this.Height)))
                {
                    bordersize = value;
                    System.Drawing.Point pt = new System.Drawing.Point((int)bordersize, (int)bordersize);
                    if (((bordersize * 2) < this.Width) && ((bordersize * 2 < this.Height)))
                    {
                        board.Width = (int)(this.Width - (bordersize * 2));
                        board.Height = (int)(this.Height - (bordersize * 2));
                    }
                    else
                    {
                        this.Bordersize = 10;
                        pt = new System.Drawing.Point((int)bordersize, (int)bordersize);
                        bordersize = 10;
                        board.Width = (int)(this.Width - (bordersize * 2));
                        board.Height = (int)(this.Height - (bordersize * 2));
                    }
                    board.Location = pt;
                    pt = new System.Drawing.Point((int)bordersize + 4, (int)bordersize + 4); 
                    LB_status.Location = pt;
                    
                }
                else bordersize = 10;
            }
            get { return bordersize; }
        }

        private DrawAble device;
        public DrawAble Device
        {
            set
            {
                device = value;
            }
            get
            {
                return device;
            }
        }
        #endregion
     

        #region Constractor
        public B()
        {
            color = Color.Black;
            bordersize = 10;
            settings = new Setting();
            users = new ArrayList();
            me = new HostUser(username, settings.IPEP, DateTime.Now);
            
            isMenuShowed = false;
            objectsSetting = new ObjectFormSetting();
            
            InitializeComponent();

            
            queryAvailablePlugin();
          
            
        }
        public void Initialize()
        {
            net.Initialize(this);
        }
        public void UnInitialize()
        {
            net.UnInitialize();
        }
        #endregion

        #region InterfaceMethods
        public IPlugin[] QueryPlugins(QueryPluginsFlags flag, object para)
        {
            IPlugin[] plugins = new IPlugin[5];//--------
            return plugins;
        }
        public void UnPlugPlugins(UnPluginsFlags flag, object para)
        {
        }
        #endregion

        #region Events
        #region B

        #region LocalState
        private System.Drawing.Point lastMousePoint;
        private uint round = 25;
        #endregion
        private void B_Load(object sender, EventArgs e)
        {
            net = new Network();
            backImage = (System.Drawing.Image)this.board.Image.Clone();
        }      
        private void B_MouseDown(object sender, MouseEventArgs e)
        {
            lastMousePoint = new System.Drawing.Point(e.X, e.Y);

        }
        private void B_MouseUp(object sender, MouseEventArgs e)
        {
            this.LB_status.Visible = false;
            this.Cursor = Cursors.SizeAll;
        }
        System.Drawing.Point mousePoint = new System.Drawing.Point(0,0);
        internal System.Drawing.Point MousePoint
        {
            set
            {
                mousePoint = value;
            }
            get
            {
                return mousePoint;
            }
        }
        private void B_MouseMove(object sender, MouseEventArgs e)
        {
            
            switch (e.Button)
            {
                case MouseButtons.Left:
                {
                    if (enableLocationChange)
                    {
                        this.LB_status.Visible = true;
                        this.Cursor = Cursors.NoMove2D;
                        System.Drawing.Point tempPoint = new System.Drawing.Point(e.X, e.Y);
                        if (tempPoint != this.Location)
                        {
                            if ((round % 32) == 0)
                            {
                                round = 1;
                            }
                            else
                            {
                                System.Drawing.Point locationPoint = this.Location;
                                int x = tempPoint.X - lastMousePoint.X;
                                int y = tempPoint.Y - lastMousePoint.Y;
                                locationPoint.X += x;
                                locationPoint.Y += y;
                                this.Location = locationPoint;
                                string str = " pos = (";
                                str += this.Location.X.ToString();
                                str += ",";
                                str += this.Location.Y.ToString();
                                str += ") ";
                                this.LB_status.Text = str;
                                round++;
                                lastMousePoint = tempPoint;
                            }
                        }
                    }
                }break;
                case MouseButtons.Right:
                {
                    if (EnableSizeChange)
                    {
                        this.LB_status.Visible = true;
                        this.Cursor = Cursors.SizeAll;
                        System.Drawing.Point tempPoint = new System.Drawing.Point(e.X, e.Y);
                        if (tempPoint != lastMousePoint)
                        {
                            if ((round % 32) == 0)
                            {
                                round = 1;
                            }
                            else
                            {
                                Size size = this.Size;
                                int x = tempPoint.X - lastMousePoint.X;
                                int y = tempPoint.Y - lastMousePoint.Y;
                                size.Width += x;
                                size.Height += y;
                                this.Size = size;
                                string str = " size = (";
                                str += Size.Width.ToString();
                                str += ",";
                                str += Size.Height.ToString();
                                str += ") ";
                                this.LB_status.Text = str;
                                round++;
                                lastMousePoint = tempPoint;
                            }
                        }
                    }
                }break;
            }
        }
       
        private void B_SizeChanged(object sender, EventArgs e)
        {
            if(this.Width < 45)
            {
                this.Width = 45;
            }
            if (this.Height < 45)
            {
                this.Height = 45;
            }
            if(this.Width > 800)
            {
                this.Width =800;
            }
            if (this.Height > 600)
            {
                this.Height = 600;
            }

            System.Drawing.Point pt = new System.Drawing.Point((int)bordersize, (int)bordersize);   
            if (((bordersize * 2) < this.Width) && ((bordersize * 2 < this.Height)))
            {
                board.Width = (int)(this.Width - (bordersize * 2));
                board.Height = (int)(this.Height - (bordersize * 2));
            }
            else
            {
                this.Bordersize = 10;
                pt = new System.Drawing.Point((int)bordersize, (int)bordersize);
                bordersize = 10;
                board.Width = (int)(this.Width - (bordersize * 2));
                board.Height = (int)(this.Height - (bordersize * 2));
            }
            board.Location = pt;

            pt = new System.Drawing.Point((int)bordersize + 4, (int)bordersize + 4);
            LB_status.Location = pt;
        }
        #endregion

        #region Board
        private void board_MouseDown(object sender, MouseEventArgs e)
        {
            switch (e.Button)
            {
                case MouseButtons.Left:
                {
                    if (device != null)
                    {
                       device.Sketch((int)e.X, (int)e.Y, e, UpDowns.Down);
                    }
                } break;
                case MouseButtons.Right:
                {
                    IMenu imenu;
                    if((imenu = FloatMenu.getMenu(this)) != null)
                    {
                        menu = imenu;
                        menu.ShowMenu();
                    }
                } break;
            }
        }
        #endregion

        #endregion

        private void board_MouseUp(object sender, MouseEventArgs e)
        {
            switch (e.Button)
            {
                case MouseButtons.Left:
                    {
                        if (device != null)
                        {
                            States s = device.Sketch((int)e.X, (int)e.Y, e, UpDowns.Up);
                            if((States.Start == s)||(States.Extra == s))
                            {
                                
                                net.Send(device.DrawableFrame);
                                if(device.GetType().ToString() == "W.Image.ImageDraw")
                                {
                                    Image.ImageDraw imd = (Image.ImageDraw)device;
                                    imd.Send();
                                }
                            }
                        }
                    } break;
            }
        }

        private void board_MouseMove(object sender, MouseEventArgs e)
        {
            mousePoint = new System.Drawing.Point(e.X, e.Y);
            switch (e.Button)
            {
                case MouseButtons.Left:
                    {
                        if (device != null)
                        {
                            if (States.Extra == device.Sketch((int)e.X, (int)e.Y, e, UpDowns.Neutral)) 
                            {
                                net.Send(device.DrawableFrame);
                            }
                        }
                    } break;
                case MouseButtons.None:
                    {
                        if (device != null)
                        {
                            device.Sketch((int)e.X, (int)e.Y, e, UpDowns.Neutral);
                        }
                    } break;
            }
        }
        public void doAction(Frame frame)
        {
            switch (frame.type)
            {
                case FTYPE.DRAW:
                    {
                        Redraw(frame);  
                    }break;
                case FTYPE.PLUGIN:
                    {
                        PluginMessage(frame);
                    } break;
            }
        }  
    }  
}
/*
    class clsAPI
    {
        [DllImport("winmm.dll")]
        public static extern long PlaySound(string lpszName, long hModule, long dwFlags);


        public static void Play()
        {
            long retval;
            string fname = "f:\\test.mp3";

            retval = PlaySound(fname, 0, 1);
        }
    }*/