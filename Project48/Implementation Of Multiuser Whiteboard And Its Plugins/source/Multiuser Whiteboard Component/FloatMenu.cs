using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace W
{
    public partial class FloatMenu : Form,IMenu
    {
        #region Ref
        private B board;
        #endregion
        #region Attribute
        Color color;
        Color Color
        {
            set
            {
                color = value;
                this.LB_cb.BackColor = Color.FromArgb(color.A, 0, 0, color.B);
                this.LB_cg.BackColor = Color.FromArgb(color.A, 0, color.G, 0);
                this.LB_cr.BackColor = Color.FromArgb(color.A, color.R, 0, 0);
                this.HS_red.Value = (int)color.R;
                this.HS_green.Value = (int)color.G;
                this.HS_blue.Value = (int)color.B;
                this.LB_cn.BackColor = color;
                this.LB_vb.Text = color.B.ToString();
                this.LB_vg.Text = color.G.ToString();
                this.LB_vr.Text = color.R.ToString();
                this.LB_new.ForeColor = color; 
                board.Color = color;
            }
            get
            {
                return color;
            }
        }
        #endregion
        #region Interface
        public void ShowMenu()
        {
            this.StartPosition = FormStartPosition.Manual;
            this.Location = board.Location;
            this.Show();
            
        }
        public GroupBox GetPropertiesBox()
        {
            return this.GB_basicprop;
        }
        #endregion

        #region Construtor
        private FloatMenu(B b)
        {
            board = b;
            color = b.Color;
           
            InitializeComponent();

            this.HS_blue.Value = (int)color.B;
            this.HS_green.Value = (int)color.G;
            this.HS_red.Value = (int)color.R;
           
        }
        delegate void Update_Callback();
        public void Update_()
        {
            if (this.board.InvokeRequired)
            {
                Update_Callback d = new Update_Callback(Update_);
                this.Invoke(d);
            }
            else
            {
                object[] os;
                os = new object[5];
              
                DataTable dtb = new DataTable();
                String ss = "";
                bool bb = false;
                dtb.Columns.Add("Name_", ss.GetType());
                dtb.Columns.Add("IP", ss.GetType());
                dtb.Columns.Add("Online Time", ss.GetType());
                dtb.Columns.Add("Send", bb.GetType());
                dtb.Columns.Add("Receive", bb.GetType());
                foreach (RemoteUser ru in board.Users)
                {
                    DataRow dr = dtb.NewRow();
                    os[0] = ru.Name;
                    os[1] = ru.IPEndPoint.Address.ToString();
                    os[2] = ru.ConnectionTime.ToString("G", System.Globalization.DateTimeFormatInfo.InvariantInfo);
                    os[3] = ru.Send;
                    os[4] = ru.Receive;
                    dr.ItemArray = os;
                    dtb.Rows.Add(dr);
                

                }
                DG_user.DataSource = dtb;
                this.TB_count.Text = dtb.Rows.Count.ToString();
           
                this.DG_user.Update();
            }
        }
       
        public void Close_()
        {
            this.Close();
        }
        public static IMenu getMenu(B b)
        {
            if (!b.IsMenuShowed)
            {
                b.IsMenuShowed = true;
                return new FloatMenu(b);
            }
            else
            {
                return null;
            }
        }
        #endregion

        #region Event
        #region TabMenu
       
        #endregion

        #region Window
     
       

        private void FloatMenu_FormClosed(object sender, FormClosedEventArgs e)
        {
            board.IsMenuShowed  = false;
        }

        #endregion


        #region User
        private void TP_users_Enter(object sender, EventArgs e)
        {
            
            Size z = new Size(652, 334);
            Size dz = new Size(648, 311);
            this.Size = z;
            this.TC_floatmenu.Size = dz;
            DataTable dtb = new DataTable();
            
            string ss = "";
            bool bb = false;
           
            dtb.Columns.Add("Name_", ss.GetType());
            dtb.Columns.Add("IP", ss.GetType());
            dtb.Columns.Add("Online Time", ss.GetType());
            dtb.Columns.Add("Send", bb.GetType());
            dtb.Columns.Add("Receive", bb.GetType());
            object[] os;
            os = new object[5];
            
         
           
          
            foreach (RemoteUser ru in board.Users)
            {
                DataRow dr = dtb.NewRow();
                os[0] = ru.Name;
                os[1] = ru.IPEndPoint.Address.ToString();
                os[2] = ru.ConnectionTime.ToString("G",System.Globalization.DateTimeFormatInfo.InvariantInfo);
                os[3] = ru.Send;
                os[4] = ru.Receive;
                dr.ItemArray = os;
                dtb.Rows.Add(dr);           
            } 
            DG_user.DataSource = dtb;
           
            DG_user.Columns[0].MinimumWidth = 75;
            DG_user.Columns[0].ReadOnly = true;
            DG_user.Columns[0].Width = 110;
            DG_user.Columns[1].ReadOnly = true;
            DG_user.Columns[1].Width = 92;
            DG_user.Columns[1].MinimumWidth = 75;
            DG_user.Columns[2].ReadOnly = true;
            DG_user.Columns[2].Width = 135;
            DG_user.Columns[2].MinimumWidth = 95;
            DG_user.Columns[3].MinimumWidth = 30;
            DG_user.Columns[3].Width = 50;
            DG_user.Columns[4].Width = 50;
            DG_user.Columns[4].MinimumWidth = 30;
            TB_count.Text = board.Users.Count.ToString();
           
        }

        #endregion
        #region ColorPage
        private void TP_color_Enter(object sender, EventArgs e)
        {
            Size z = new Size(270, 200);
            this.Size = z;
            this.LB_cb.BackColor = Color.FromArgb(color.A,0,0,color.B);
            this.LB_cg.BackColor = Color.FromArgb(color.A,0,color.G,0);
            this.LB_cr.BackColor = Color.FromArgb(color.A,color.R,0,0);
            this.LB_co.BackColor = color;
            this.LB_cn.BackColor = color;
            this.LB_new.ForeColor = color;
            this.LB_old.ForeColor = color; 
            this.LB_vb.Text = color.B.ToString();
            this.LB_vg.Text = color.G.ToString();
            this.LB_vr.Text = color.R.ToString();
            this.HS_red.Value = (int)color.R;
            this.HS_green.Value = (int)color.G;
            this.HS_blue.Value = (int)color.B;
            this.Opacity = 1;
        }
        private void TP_color_Leave(object sender, EventArgs e)
        {
            this.Opacity = 1.0;
        }
        #region Controls
        
        private void BT_colordialog_Click(object sender, EventArgs e)
        {
            ColorDialog dlg = new ColorDialog();
            dlg.ShowDialog();
            this.Color = dlg.Color;
            
        }

       
        private void HS_red_Scroll(object sender, ScrollEventArgs e)
        {
           
            this.Color = Color.FromArgb(color.A,(byte)HS_red.Value,color.G,color.B);
        }

        private void HS_blue_Scroll(object sender, ScrollEventArgs e)
        {
            this.Color = Color.FromArgb(color.A,color.R , color.G, (byte)HS_blue.Value);
        }

        private void HS_green_Scroll(object sender, ScrollEventArgs e)
        {
            this.Color = Color.FromArgb(color.A, color.R, (byte)HS_green.Value, color.B);
        }

        private void BT_undo_Click(object sender, EventArgs e)
        {
            this.Color = LB_co.BackColor;
        }



        #endregion

      
        #endregion
        #region Drawing
        private void TP_drawing_Enter(object sender, EventArgs e)
        {
            Size z = new Size(273, 212);
            Size dz = new Size(273, 193);
            this.Size = z;
            this.TC_floatmenu.Size = dz;
            if (board.Device != null)
            {
                string[] t = board.Device.GetType().ToString().Split('.');
                switch (t[2])
                {
                    case "PointDraw":
                        {
                            DisposeBasicPropForm();
                            SelectNewButton();
                            this.BT_point.Visible = false;
                            this.PB_point.Visible = true;
                            this.Size = new Size(273, 311);
                            this.TC_floatmenu.Size = new Size(273, 288);
                            this.GB_basicprop.Size = new Size(228, 83);
                           
                            this.GB_basicprop.Visible = true;
                            Point.PointSetting pointSetting = (Point.PointSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Point];
                            board.Device = new W.Point.PointDraw(board, pointSetting);

                            pointSetting.initializeSettingForm(this);
                        } break;
                    case "LineDraw":
                        {
                            DisposeBasicPropForm();
                            SelectNewButton();
                            this.BT_line.Visible = false;
                            this.PB_line.Visible = true;
                            this.Size = new Size(273, 364);
                            this.TC_floatmenu.Size = new Size(273, 342);
                            this.GB_basicprop.Size = new Size(228, 140);
                         
                            this.GB_basicprop.Visible = true;
                            Line.LineSetting lineSetting = (Line.LineSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Line];
                            board.Device = new W.Line.LineDraw(board, lineSetting);
                            lineSetting.SetDrawableObject(board.Device);
                            lineSetting.initializeSettingForm(this);
                        } break;
                    case "CircleDraw":
                        {
                            DisposeBasicPropForm();
                            SelectNewButton();
                            this.BT_circle.Visible = false;
                            this.PB_circle.Visible = true;
                            this.Size = new Size(273, 395);
                            this.TC_floatmenu.Size = new Size(273, 372);
                            this.GB_basicprop.Size = new Size(228, 180);
                           
                            this.GB_basicprop.Visible = true;
                            Circle.CircleSetting circleSetting = (Circle.CircleSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Circle];
                            board.Device = new W.Circle.CircleDraw(board, circleSetting);
                            circleSetting.SetDrawableObject(board.Device);
                            circleSetting.initializeSettingForm(this);
                        } break;
                    case "PolygonDraw":
                        {
                            DisposeBasicPropForm();
                            SelectNewButton();
                            this.BT_polygon.Visible = false;
                            this.PB_polygon.Visible = true;
                            this.Size = new Size(273, 364);
                            this.TC_floatmenu.Size = new Size(273, 342);
                            this.GB_basicprop.Size = new Size(228, 140);
                            
                            this.GB_basicprop.Visible = true;
                            Polygon.PolygonSetting polySetting = (Polygon.PolygonSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Polygon];
                            board.Device = new W.Polygon.PolygonDraw(board, polySetting);
                            polySetting.SetDrawableObject(board.Device);
                            polySetting.initializeSettingForm(this);
                        } break;
                    case "RubberDraw":
                        {
                            DisposeBasicPropForm();
                            SelectNewButton();
                            this.BT_Rubber.Visible = false;
                            this.PB_rubber.Visible = true;
                            this.Size = new Size(273, 378);
                            this.TC_floatmenu.Size = new Size(273, 365);
                            this.GB_basicprop.Size = new Size(228, 153);
                            board.Board.Cursor = Cursors.Hand;
                            this.GB_basicprop.Visible = true;
                            Rubber.RubberSetting rubberSetting = (Rubber.RubberSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Rubber];
                            board.Device = new W.Rubber.RubberDraw(board, rubberSetting);
                            rubberSetting.initializeSettingForm(this);
                        } break;
                    case "RectangleDraw":
                        {
                            DisposeBasicPropForm();
                            SelectNewButton();
                            this.BT_rectangle.Visible = false;
                            this.PB_rectangle.Visible = true;
                            this.Size = new Size(273, 364);
                            this.TC_floatmenu.Size = new Size(273, 342);
                            this.GB_basicprop.Size = new Size(228, 140);
                        
                            this.GB_basicprop.Visible = true;
                            Rectangle.RectangleSetting rectangleSetting = (Rectangle.RectangleSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Rectangle];
                            board.Device = new W.Rectangle.RectangleDraw(board, rectangleSetting);
                            rectangleSetting.SetDrawableObject(board.Device);
                            rectangleSetting.initializeSettingForm(this);
                        } break;
                    case "TextDraw":
                        {
                            DisposeBasicPropForm();
                            SelectNewButton();
                            this.BT_text.Visible = false;
                            this.PB_text.Visible = true;
                            this.Size = new Size(273, 650);

                            this.TC_floatmenu.Size = new Size(273, 630);
                            this.GB_basicprop.Size = new Size(228, 425);
                          
                            this.GB_basicprop.Visible = true;
                            W.Text.TextSetting textSetting = (W.Text.TextSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Text];
                            board.Device = new W.Text.TextDraw(board, textSetting);
                            textSetting.SetDrawableObject(board.Device);
                            textSetting.initializeSettingForm(this);
                        } break;
                }
            }
        }
        private void BT_point_Click(object sender, EventArgs e)
        {
            DisposeBasicPropForm();
            SelectNewButton();
            this.BT_point.Visible = false;
            this.PB_point.Visible = true;
            this.Size = new Size(273, 311);
            this.TC_floatmenu.Size = new Size(273, 288);
            this.GB_basicprop.Size = new Size(228, 83);
            board.Board.Cursor = Cursors.Hand;
            this.GB_basicprop.Visible = true;
            Point.PointSetting pointSetting = (Point.PointSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Point];
            board.Device = new W.Point.PointDraw(board, pointSetting);

            pointSetting.initializeSettingForm(this);
        }

        private void BT_line_Click(object sender, EventArgs e)
        {
            DisposeBasicPropForm();
            SelectNewButton();
            this.BT_line.Visible = false;
            this.PB_line.Visible = true;
            this.Size = new Size(273, 364);
            this.TC_floatmenu.Size = new Size(273, 342);
            this.GB_basicprop.Size = new Size(228, 140);
            board.Board.Cursor = Cursors.Hand;
            this.GB_basicprop.Visible = true;
            Line.LineSetting lineSetting = (Line.LineSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Line];
            board.Device = new W.Line.LineDraw(board, lineSetting);
            lineSetting.SetDrawableObject(board.Device);
            lineSetting.initializeSettingForm(this);
        }


        private void BT_polygon_Click(object sender, EventArgs e)
        {
            DisposeBasicPropForm();
            SelectNewButton();
            this.BT_polygon.Visible = false;
            this.PB_polygon.Visible = true;
            this.Size = new Size(273, 364);
            this.TC_floatmenu.Size = new Size(273, 342);
            this.GB_basicprop.Size = new Size(228, 140);
            board.Board.Cursor = Cursors.Hand;
            this.GB_basicprop.Visible = true;
            Polygon.PolygonSetting polySetting = (Polygon.PolygonSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Polygon];
            board.Device = new W.Polygon.PolygonDraw(board, polySetting);
            polySetting.SetDrawableObject(board.Device);
            polySetting.initializeSettingForm(this);
        }



        private void BT_rectangle_Click(object sender, EventArgs e)
        {
            DisposeBasicPropForm();
            SelectNewButton();
            this.BT_rectangle.Visible = false;
            this.PB_rectangle.Visible = true;
            this.Size = new Size(273, 364);
            this.TC_floatmenu.Size = new Size(273, 342);
            this.GB_basicprop.Size = new Size(228, 140);
            board.Board.Cursor = Cursors.Hand;
            this.GB_basicprop.Visible = true;
            Rectangle.RectangleSetting rectangleSetting = (Rectangle.RectangleSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Rectangle];
            board.Device = new W.Rectangle.RectangleDraw(board, rectangleSetting);
            rectangleSetting.SetDrawableObject(board.Device);
            rectangleSetting.initializeSettingForm(this);

        }

        private void BT_circle_Click(object sender, EventArgs e)
        {
            DisposeBasicPropForm();
            SelectNewButton();
            this.BT_circle.Visible = false;
            this.PB_circle.Visible = true;
            this.Size = new Size(273, 395);
            this.TC_floatmenu.Size = new Size(273, 372);
            this.GB_basicprop.Size = new Size(228, 180);
            board.Board.Cursor = Cursors.Hand;
            this.GB_basicprop.Visible = true;
            Circle.CircleSetting circleSetting = (Circle.CircleSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Circle];
            board.Device = new W.Circle.CircleDraw(board, circleSetting);
            circleSetting.SetDrawableObject(board.Device);
            circleSetting.initializeSettingForm(this);
        }

        private void BT_text_Click(object sender, EventArgs e)
        {
            DisposeBasicPropForm();
            SelectNewButton();
            this.BT_text.Visible = false;
            this.PB_text.Visible = true;
            this.Size = new Size(273, 650);
         
            this.TC_floatmenu.Size = new Size(273, 630);
            this.GB_basicprop.Size = new Size(228, 425);
            board.Board.Cursor = Cursors.Hand;
            this.GB_basicprop.Visible = true;
            W.Text.TextSetting textSetting = (W.Text.TextSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Text];
            board.Device = new W.Text.TextDraw(board, textSetting);
            textSetting.SetDrawableObject(board.Device);
            textSetting.initializeSettingForm(this);
        }
      
        #endregion
        #region DisposeForm
        private void DisposeBasicPropForm()
        {
            ////risk
            while (GB_basicprop.Controls.Count > 0)
            {
                foreach (System.Windows.Forms.Control o in GB_basicprop.Controls)
                {
                    o.Dispose();
                }
            }
         
        }
        private void SelectNewButton()
        {
            foreach(System.Windows.Forms.Control c in this.GB_basic.Controls)
            {
                if (c is System.Windows.Forms.Button)
                {
                    c.Visible = true;
                }
                else
                {
                    c.Visible = false;
                }
            }
            board.backImage = (System.Drawing.Image)board.Board.Image.Clone();
        }
        #endregion

        
        #endregion

        private void DG_user_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            DataTable dtb = (DataTable)DG_user.DataSource;
            RemoteUser ru = new RemoteUser((dtb.Rows[e.RowIndex].ItemArray)[0].ToString(), new System.Net.IPEndPoint(System.Net.IPAddress.Parse((dtb.Rows[e.RowIndex].ItemArray)[1].ToString()), board.Settings.IPEP.Port), timeParse((dtb.Rows[e.RowIndex].ItemArray)[2].ToString()), (bool)(dtb.Rows[e.RowIndex].ItemArray)[3], (bool)(dtb.Rows[e.RowIndex].ItemArray)[4]);
            board.Users[e.RowIndex] = ru;
            dtb = new DataTable();
            string ss = "";
            bool bb = false;
            dtb.Columns.Add("Name_", ss.GetType());
            dtb.Columns.Add("IP", ss.GetType());
            dtb.Columns.Add("Online Time", ss.GetType());
            dtb.Columns.Add("Send", bb.GetType());
            dtb.Columns.Add("Receive", bb.GetType());
            object[] os;
            os = new object[5];
            foreach (RemoteUser reu in board.Users)
            {
                DataRow dr = dtb.NewRow();
                os[0] = reu.Name;
                os[1] = reu.IPEndPoint.Address.ToString();
                os[2] = ru.ConnectionTime.ToString("G", System.Globalization.DateTimeFormatInfo.InvariantInfo);
                os[3] = reu.Send;
                os[4] = reu.Receive;
                dr.ItemArray = os;
                dtb.Rows.Add(dr);           
            } 
        }

        private void BT_send_Click(object sender, EventArgs e)
        {
            DataTable dtb = (DataTable)DG_user.DataSource; 
            board.Users.Clear();
            for (int i = 0; i < dtb.Rows.Count; i++)
            {
                RemoteUser ru = new RemoteUser((dtb.Rows[i].ItemArray)[0].ToString(), new System.Net.IPEndPoint(System.Net.IPAddress.Parse((dtb.Rows[i].ItemArray)[1].ToString()), board.Settings.IPEP.Port),timeParse((dtb.Rows[i].ItemArray)[2].ToString()), true, (bool)(dtb.Rows[i].ItemArray)[4]);
                board.Users.Add(ru);
            }
            dtb = new DataTable();
            string ss = "";
            bool bb = false;
            dtb.Columns.Add("Name_", ss.GetType());
            dtb.Columns.Add("IP", ss.GetType());
            dtb.Columns.Add("Online Time", ss.GetType());
            dtb.Columns.Add("Send", bb.GetType());
            dtb.Columns.Add("Receive", bb.GetType());
            object[] os;
            os = new object[5];
            foreach (RemoteUser ru in board.Users)
            {
                DataRow dr = dtb.NewRow();
                os[0] = ru.Name;
                os[1] = ru.IPEndPoint.Address.ToString();
                os[2] = ru.ConnectionTime.ToString("G", System.Globalization.DateTimeFormatInfo.InvariantInfo);
                os[3] = ru.Send;
                os[4] = ru.Receive;
                dr.ItemArray = os;
                dtb.Rows.Add(dr);
            } 
            DG_user.DataSource = dtb;
        }

        private void BT_Receive_Click(object sender, EventArgs e)
        {
            DataTable dtb = (DataTable)DG_user.DataSource;
            board.Users.Clear();

            for (int i = 0; i < dtb.Rows.Count; i++)
            {
                RemoteUser ru = new RemoteUser((dtb.Rows[i].ItemArray)[0].ToString(), new System.Net.IPEndPoint(System.Net.IPAddress.Parse((dtb.Rows[i].ItemArray)[1].ToString()), board.Settings.IPEP.Port),timeParse((dtb.Rows[i].ItemArray)[2].ToString()),(bool)(dtb.Rows[i].ItemArray)[3],true);
                board.Users.Add(ru);
            }
            dtb = new DataTable();

            string ss = "";
            bool bb = false;
            dtb.Columns.Add("Name_", ss.GetType());
            dtb.Columns.Add("IP", ss.GetType());
            dtb.Columns.Add("Online Time", ss.GetType());
            dtb.Columns.Add("Send", bb.GetType());
            dtb.Columns.Add("Receive", bb.GetType());
            object[] os;
            os = new object[5];
            foreach (RemoteUser ru in board.Users)
            {
                DataRow dr = dtb.NewRow();
                os[0] = ru.Name;
                os[1] = ru.IPEndPoint.Address.ToString();
                os[2] = ru.ConnectionTime.ToString("G", System.Globalization.DateTimeFormatInfo.InvariantInfo);
                os[3] = ru.Send;
                os[4] = ru.Receive;
                dr.ItemArray = os;
                dtb.Rows.Add(dr);
            }
            DG_user.DataSource = dtb;
        }

        private void BT_unsend_Click(object sender, EventArgs e)
        {
            DataTable dtb = (DataTable)DG_user.DataSource;
            board.Users.Clear();

            for (int i = 0; i < dtb.Rows.Count; i++)
            {
                RemoteUser ru = new RemoteUser((dtb.Rows[i].ItemArray)[0].ToString(), new System.Net.IPEndPoint(System.Net.IPAddress.Parse((dtb.Rows[i].ItemArray)[1].ToString()), board.Settings.IPEP.Port),timeParse((dtb.Rows[i].ItemArray)[2].ToString()), false,(bool)(dtb.Rows[i].ItemArray)[4]);
                board.Users.Add(ru);
            }
            dtb = new DataTable();

            string ss = "";
            bool bb = false;
            dtb.Columns.Add("Name_", ss.GetType());
            dtb.Columns.Add("IP", ss.GetType());
            dtb.Columns.Add("Online Time", ss.GetType());
            dtb.Columns.Add("Send", bb.GetType());
            dtb.Columns.Add("Receive", bb.GetType());
            object[] os;
            os = new object[5];
            foreach (RemoteUser ru in board.Users)
            {
                DataRow dr = dtb.NewRow();
                os[0] = ru.Name;
                os[1] = ru.IPEndPoint.Address.ToString();
                os[2] = ru.ConnectionTime.ToString("G", System.Globalization.DateTimeFormatInfo.InvariantInfo);
                os[3] = ru.Send;
                os[4] = ru.Receive;
                dr.ItemArray = os;
                dtb.Rows.Add(dr);
            }
            DG_user.DataSource = dtb;
        }

        private void BT_unreceive_Click(object sender, EventArgs e)
        {
            DataTable dtb = (DataTable)DG_user.DataSource;
            board.Users.Clear();
            for (int i = 0; i < dtb.Rows.Count; i++)
            {
                RemoteUser ru = new RemoteUser((dtb.Rows[i].ItemArray)[0].ToString(), new System.Net.IPEndPoint(System.Net.IPAddress.Parse((dtb.Rows[i].ItemArray)[1].ToString()), board.Settings.IPEP.Port), timeParse((dtb.Rows[i].ItemArray)[2].ToString()),(bool)(dtb.Rows[i].ItemArray)[3], false);
                board.Users.Add(ru);
            }
            dtb = new DataTable();
            string ss = "";
            bool bb = false;
            dtb.Columns.Add("Name_", ss.GetType());
            dtb.Columns.Add("IP", ss.GetType());
            dtb.Columns.Add("Online Time", ss.GetType());
            dtb.Columns.Add("Send", bb.GetType());
            dtb.Columns.Add("Receive", bb.GetType());
            object[] os;
            os = new object[5];
            foreach (RemoteUser ru in board.Users)
            {
                DataRow dr = dtb.NewRow();
                os[0] = ru.Name;
                os[1] = ru.IPEndPoint.Address.ToString();
                os[2] = ru.ConnectionTime.ToString("G", System.Globalization.DateTimeFormatInfo.InvariantInfo);
                os[3] = ru.Send;
                os[4] = ru.Receive;
                dr.ItemArray = os;
                dtb.Rows.Add(dr);
            }
            DG_user.DataSource = dtb;
        }
        private DateTime timeParse(string str)
        {
            string[] dt = str.Split(' ');
            string[] d = dt[0].Split('/');
            string[] t = dt[1].Split(':');
            return new DateTime(Int32.Parse(d[2]), Int32.Parse(d[0]), Int32.Parse(d[1]), Int32.Parse(t[0]), Int32.Parse(t[1]), Int32.Parse(t[2]));
        }

        private void BT_load_Click(object sender, EventArgs e)
        {
            if (TB_wpin.Text == "")
            {
                if (LT_avplug.SelectedItem != null)
                {
                    string s = LT_avplug.SelectedItem.ToString();
                    if (LT_loaded.Items.Contains(s))
                    {
                        MessageBox.Show(s + "  Already load", "Can not load plugin !", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    else
                    {
                        if (board.loadPlugin(s))
                        {
                            LT_loaded.Items.Add(s);
                        }
                    }
                }
            }
            else
            {
                string s = TB_wpin.Text.ToString();
                if (LT_loaded.Items.Contains(s))
                {
                    MessageBox.Show(s + "  Already load", "Can not load plugin !", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    if (board.loadPlugin(s))
                    {
                        LT_loaded.Items.Add(s);
                    }
                }
            }
        }

        private void TP_plugins_Enter(object sender, EventArgs e)
        {
            Size z = new Size(275, 228);
            Size dz = new Size(275, 215);
            this.Size = z;
            this.TC_floatmenu.Size = dz; 
            LT_avplug.Items.Clear(); 
            LT_loaded.Items.Clear();
                foreach (object o in board.availablePlugins)
                {
                    LT_avplug.Items.Add(o);
                }
                foreach (IPlugin p in board.loadedPlugins)
                {
                    LT_loaded.Items.Add(p.Name);
                }
        }

        private void BT_unload_Click(object sender, EventArgs e)
        {
            if (TB_wpin.Text == "")
            {
                if (LT_loaded.SelectedItem != null)
                {
                    board.UnloadPlugin(LT_loaded.SelectedItem.ToString());
                    LT_loaded.Items.Remove(LT_loaded.SelectedItem);
                }
            }
            else
            {
                board.UnloadPlugin(TB_wpin.Text);
                LT_loaded.Items.Remove(TB_wpin.Text);
            }

        }
        bool b = true;
        private void TP_main_Enter(object sender, EventArgs e)
        {
            Size z = new Size(270, 472);
            Size dz = new Size(278, 487);
            this.Size = z;
            this.TC_floatmenu.Size = dz;
            b = false;
            LB_name.Text = board.Username;
            CK_autoload.Checked = board.AutoLoadPlugins;
            CK_logchg.Checked = board.EnableLocationChange;
            CK_sizechg.Checked = board.EnableSizeChange;
            BT_color.BackColor = board.BackColor;
            UD_borderwidth.Value = (decimal)board.Bordersize;
            UD_height.Value = (decimal)board.Height;
            UD_width.Value = (decimal)board.Width;
            UD_locx.Value = (decimal)board.Location.X;
            UD_locy.Value = (decimal)board.Location.Y;
            if (!CK_sizechg.Checked)
            {
                this.UD_borderwidth.Enabled = false;
                this.UD_height.Enabled = false;
                this.UD_width.Enabled = false;
            }
            b = true;
        }

        private void BT_color_Click(object sender, EventArgs e)
        {
            ColorDialog.ShowDialog();
            BT_color.BackColor = ColorDialog.Color;
            board.BackColor = ColorDialog.Color;
        }

        private void UD_borderwidth_ValueChanged(object sender, EventArgs e)
        {
            if (b)
            {
                board.Bordersize = (uint)UD_borderwidth.Value;
            }
        }

        private void UD_width_ValueChanged(object sender, EventArgs e)
        {
            if (b)
            {
                Size z = new Size((int)UD_width.Value, board.Size.Height);
                board.Size = z;
            }
        }

        private void UD_height_ValueChanged(object sender, EventArgs e)
        {
            if (b)
            {
                Size z = new Size(board.Size.Width, (int)UD_height.Value);
                board.Size = z;
            }
        }

        private void TP_Status_Enter(object sender, EventArgs e)
        {
            TM_Update.Enabled = true;
            Size z = new Size(275, 190);
            Size dz = new Size(275, 177);
            this.Size = z;
            this.TC_floatmenu.Size = dz;
        }

        private void TP_Status_Leave(object sender, EventArgs e)
        {
            TM_Update.Enabled = false;
        }

        private void TM_Update_Tick(object sender, EventArgs e)
        {
            TB_mx.Text = board.MousePoint.X.ToString();
            TB_my.Text = board.MousePoint.Y.ToString();
        }

        private void BT_Rubber_Click(object sender, EventArgs e)
        {
            DisposeBasicPropForm();
            SelectNewButton();
            this.BT_Rubber.Visible = false;
            this.PB_rubber.Visible = true;
            this.Size = new Size(273, 378);
            this.TC_floatmenu.Size = new Size(273, 365);
            this.GB_basicprop.Size = new Size(228, 153);
            board.Board.Cursor = Cursors.Hand;
            this.GB_basicprop.Visible = true;
            Rubber.RubberSetting rubberSetting = (Rubber.RubberSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Rubber];
            board.Device = new W.Rubber.RubberDraw(board, rubberSetting);
            rubberSetting.initializeSettingForm(this);
        }

        private void BT_image_Click(object sender, EventArgs e)
        {
            
            DisposeBasicPropForm();
            SelectNewButton();
            this.BT_image.Visible = false;
            this.PB_image.Visible = true;
            this.Size = new Size(273, 378);
            this.TC_floatmenu.Size = new Size(273, 365);
            this.GB_basicprop.Size = new Size(228, 153);
            board.Board.Cursor = Cursors.Hand;
            this.GB_basicprop.Visible = true;
            Image.ImageSetting ImageSetting = (Image.ImageSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Image];
            board.Device = new W.Image.ImageDraw(board, ImageSetting);
            ImageSetting.initializeSettingForm(this);
        }

        private void FloatMenu_Load(object sender, EventArgs e)
        {
            this.Location = new System.Drawing.Point(0,0);
        }
    }
}