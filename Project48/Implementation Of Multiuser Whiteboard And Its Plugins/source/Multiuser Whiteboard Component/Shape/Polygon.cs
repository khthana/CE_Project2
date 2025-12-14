using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing.Drawing2D;
using System.Drawing;

using System.Collections;
namespace W
{
    namespace Polygon
    {
        public class PolygonSetting : IDrawSetting
        {
            private System.Windows.Forms.Label LB_numpoint;
            private System.Windows.Forms.RadioButton RB_draw;
            private System.Windows.Forms.RadioButton RB_fill;
            private System.Windows.Forms.GroupBox GB_style;
            private System.Windows.Forms.NumericUpDown UD_numpoint;
            private System.Windows.Forms.GroupBox GB_basicprop;
            private DrawAble drawAble;
            public void SetDrawableObject(DrawAble obj)
            {
                drawAble = obj;
            }
            private uint numpoint;
            /// <summary>
            /// size of Line 
            /// </summary>
            public uint Numpoint
            {
                set
                {
                    this.numpoint = value;
                    if (drawAble != null)
                    {
                        PolygonDraw pd = (PolygonDraw)drawAble;
                        pd.Clear();
                    }
                }
                get
                {
                    return this.numpoint;
                }
            }

            private DrawModes mode;        
            public DrawModes Mode
            {
                set
                {
                    mode = value;
                    if (drawAble != null)
                    {
                        PolygonDraw pd = (PolygonDraw)drawAble;
                        pd.Clear();
                    }
                }
                get
                {
                    return this.mode;
                }
            }
            public PolygonSetting()
            {
                this.numpoint = 3;
                this.mode = DrawModes.Fill;
            }
            /// <summary>
            /// create form in groupbox
            /// </summary>
            /// <param name="menu">menu of groupbox which create form</param>
            public void initializeSettingForm(IMenu menu)
            {
                this.UD_numpoint = new System.Windows.Forms.NumericUpDown();
                this.LB_numpoint = new System.Windows.Forms.Label();
                this.RB_draw = new System.Windows.Forms.RadioButton();
                this.RB_fill = new System.Windows.Forms.RadioButton();
                this.GB_style = new System.Windows.Forms.GroupBox();
                this.GB_basicprop = menu.GetPropertiesBox();
                this.GB_basicprop.SuspendLayout();
                ((System.ComponentModel.ISupportInitialize)(this.UD_numpoint)).BeginInit();
                // 
                // GB_basicprop
                // 
                
                this.GB_basicprop.Controls.Add(this.GB_style);
                this.GB_basicprop.Controls.Add(this.LB_numpoint);
                this.GB_basicprop.Controls.Add(this.UD_numpoint);

                //
                // GB_linemode
                //
               
                this.GB_style.SuspendLayout();
                this.GB_style.Controls.Add(this.RB_fill);
                this.GB_style.Controls.Add(this.RB_draw);
                this.RB_fill.AutoSize = true;
                this.RB_fill.Location = new System.Drawing.Point(11, 21);
                this.RB_fill.Name = "RB_fill";
                this.RB_fill.Size = new System.Drawing.Size(20, 20);
                this.RB_fill.TabIndex = 6;
                this.RB_fill.Text = "Fill";
                this.RB_fill.CheckedChanged += new System.EventHandler(this.RB_CheckedChanged);
                this.RB_draw.AutoSize = true;
                this.RB_draw.Location = new System.Drawing.Point(100, 20);
                this.RB_draw.Name = "RB_draw";
                this.RB_draw.Size = new System.Drawing.Size(20, 20);
                this.RB_draw.TabIndex = 7;
                this.RB_draw.Text = "Draw";         
                this.RB_draw.CheckedChanged += new System.EventHandler(this.RB_CheckedChanged);
                if(mode == DrawModes.Draw)
                {
                    this.RB_draw.Checked = true;
                }
                if (mode == DrawModes.Fill)
                {
                    this.RB_fill.Checked = true;
                }
                this.GB_style.Location = new System.Drawing.Point(11, 72);
                this.GB_style.Name = "GB_linemode";
                this.GB_style.Size = new System.Drawing.Size(208, 55);
                this.GB_style.TabIndex = 8;
                this.GB_style.TabStop = false;
                this.GB_style.Text = "Mode";
                this.GB_style.ResumeLayout(false);
                this.GB_style.PerformLayout();
                // 
                // UD_size
                // 
                this.UD_numpoint.Location = new System.Drawing.Point(158, 34);
                this.UD_numpoint.Maximum = new decimal(new int[] {8,0,0,0});
                this.UD_numpoint.Minimum = new decimal(new int[] {3,0,0,0});
                this.UD_numpoint.Name = "UD_size";
                this.UD_numpoint.Size = new System.Drawing.Size(60, 24);
                this.UD_numpoint.TabIndex = 4;
                this.UD_numpoint.Value = new decimal(new int[] {(int)numpoint,0,0,0});
                this.UD_numpoint.ValueChanged += new System.EventHandler(this.UD_numpoint_ValueChanged);
                this.UD_numpoint.ReadOnly = true;
                // 
                //LB Size
                // 
                this.LB_numpoint.AutoSize = true;
                this.LB_numpoint.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
                this.LB_numpoint.Location = new System.Drawing.Point(21, 34);
                this.LB_numpoint.Name = "LB_linesize";
                this.LB_numpoint.Size = new System.Drawing.Size(37, 18);
                this.LB_numpoint.TabIndex = 5;
                this.LB_numpoint.Text = "Points";
                this.GB_basicprop.ResumeLayout(false);
                this.GB_basicprop.PerformLayout();
                ((System.ComponentModel.ISupportInitialize)(this.UD_numpoint)).EndInit();
       
                // 
            }
            private void UD_numpoint_ValueChanged(object sender, EventArgs e)
            {
                this.Numpoint = (uint)UD_numpoint.Value; 
            }
            private void RB_CheckedChanged(object sender, EventArgs e)
            {
                if(RB_draw.Checked == true)
                {
                    Mode = DrawModes.Draw;
                }
                if(RB_fill.Checked == true)
                {
                    Mode = DrawModes.Fill;
                }
            }
        }
        public class PolygonDraw : DrawAble
        {
            #region Reference
            private Polygon.PolygonSetting setting;    
            #endregion
            ArrayList points;
            System.Drawing.Image tempImg;
            #region Construtor
            public PolygonDraw(B b, Polygon.PolygonSetting s)
                : base(b)
            {
                setting = s;
                State = States.First;
            }
            protected override States State
            {
                set
                {
                    switch (value)
                    {
                        case States.First:
                            {
                                color = board.Color;
                                setting = (Polygon.PolygonSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Polygon];
                                possition = System.Drawing.Point.Empty;
                                points = new ArrayList();
                                this.board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                                drawableFrame = null;
                                State = States.Start;
                            } break;
                        case States.Start:
                            {
                                if (points != null)
                                {
                                    points.Clear();
                                }
                                state = States.Start;
                            } break;
                        case States.One:
                            {
                                state = States.One;
                            } break;
                        case States.Two:
                            {
                                state = States.Two;
                            } break;
                        case States.Three:
                            {
                                state = States.Three;
                            } break;
                        case States.Four:
                            {
                                state = States.Four;
                            } break;
                        case States.Five:
                            {
                                state = States.Five;
                            } break;
                        case States.Six:
                            {
                                state = States.Six;
                            } break;
                        case States.Seven:
                            {
                                state = States.Seven;
                            } break;
                        case States.Eight:
                            {
                                state = States.Eight;
                            } break;
                        case States.Final:
                            {
                                board.backImage = (System.Drawing.Image)this.board.Board.Image.Clone();
                                this.FillFrame();
                                //this.Draw();
                                State = States.Start;
                            } break;
                        default:
                            {
                                state = value;
                            } break;
                    }
                }
                get
                {
                    return state;
                }
            }
            public override States Sketch(params object[] paras)
            {
                switch (state)
                {
                    case States.Start:
                        {
                            UpDowns ud = (UpDowns)paras[3];
                            if (ud == UpDowns.Down)
                            {
                                board.backImage = (System.Drawing.Image)this.board.Board.Image.Clone();
                                this.tempImg = (System.Drawing.Image)this.board.Board.Image.Clone();
                                this.possition.X = (int)paras[0];
                                this.possition.Y = (int)paras[1];
                                points.Add((PointF)possition);
                                State = States.One;
                            }
                        } break;
                    case States.One:
                        {
                            UpDowns ud = (UpDowns)paras[3];
                            if (ud == UpDowns.Down)
                            {
                                this.tempImg = (System.Drawing.Image)this.board.Board.Image.Clone();
                                points.Add(new System.Drawing.PointF((int)paras[0], (int)paras[1]));
                                State = States.Two;
                            }
                            if (ud == UpDowns.Neutral)
                            {
                                this.board.Board.Image = (System.Drawing.Image)this.tempImg.Clone();
                                Graphics g = Graphics.FromImage(board.Board.Image);
                                System.Drawing.PointF pt = new System.Drawing.PointF((int)paras[0],(int)paras[1]);
                                System.Drawing.PointF pf = (PointF)points[points.Count - 1];
                                g.DrawLine(new Pen(color, 2), (float)pt.X, (float)pt.Y,(float)pf.X, (float)pf.Y);
                                g.Dispose();
                                //points.Add(pt);
                                //this.tempImg = (Image)this.board.Board.Image.Clone();
                            }
                            
                        } break;
                    case States.Two:
                        {
                            UpDowns ud = (UpDowns)paras[3];               
                            if (ud == UpDowns.Down)
                            {
                                this.tempImg = (System.Drawing.Image)this.board.Board.Image.Clone();
                                points.Add(new System.Drawing.PointF((int)paras[0], (int)paras[1]));
                                if (points.Count == setting.Numpoint)
                                {
                                    State = States.Final;
                                }
                                else
                                {
                                    State = States.Three;
                                }
                            }
                            if (ud == UpDowns.Neutral)
                            {
                                this.board.Board.Image = (System.Drawing.Image)this.tempImg.Clone();
                                //board.Board.Refresh();
                                if (points.Count == setting.Numpoint - 1)
                                {
                                    Graphics gg = Graphics.FromImage(board.Board.Image);
                                    PointF[] apf = new PointF[points.Count+1];
                                    for(int i = 0;i<points.Count;i++)
                                    {
                                        apf[i] = (PointF)points[i];
                                    }
                                    apf[points.Count] = new PointF((int)paras[0], (int)paras[1]);
                                    if (setting.Mode == DrawModes.Draw)
                                    {
                                        gg.DrawPolygon(new Pen(color,3),apf);
                                        //board.Board.Refresh();
                                    }
                                    if(setting.Mode == DrawModes.Fill)
                                    {
                                        gg.FillPolygon(new SolidBrush(color), apf);
                                        //board.Board.Refresh();
                                    }
                                    gg.Dispose();
                                }
                                else
                                {
                                        Graphics g = Graphics.FromImage(board.Board.Image);
                                        System.Drawing.PointF pt = new System.Drawing.PointF((int)paras[0], (int)paras[1]);
                                        System.Drawing.PointF pf = (PointF)points[points.Count - 1];
                                        g.DrawLine(new Pen(color, 2), (float)pt.X, (float)pt.Y, (float)pf.X, (float)pf.Y);
                                        g.Dispose();
                                    //board.Board.Refresh();
                                }
                                //points.Add(pt);
                                //this.tempImg = (Image)this.board.Board.Image.Clone();
                            }

                        } break;
                    case States.Three:
                        {
                            UpDowns ud = (UpDowns)paras[3];
                            if (ud == UpDowns.Down)
                            {
                                this.tempImg = (System.Drawing.Image)this.board.Board.Image.Clone();
                                points.Add(new System.Drawing.PointF((int)paras[0], (int)paras[1]));
                                if (points.Count == setting.Numpoint)
                                {
                                    State = States.Final;
                                }
                                else
                                {
                                    State = States.Four;
                                }
                            }
                            if (ud == UpDowns.Neutral)
                            {
                                this.board.Board.Image = (System.Drawing.Image)this.tempImg.Clone();
                                
                                //board.Board.Refresh();
                                if (points.Count == setting.Numpoint - 1)
                                {
                                    Graphics gg = Graphics.FromImage(board.Board.Image);
                                    PointF[] apf = new PointF[points.Count + 1];
                                    for (int i = 0; i < points.Count; i++)
                                    {
                                        apf[i] = (PointF)points[i];
                                    }
                                    apf[points.Count] = new PointF((int)paras[0], (int)paras[1]);
                                    if (setting.Mode == DrawModes.Draw)
                                    {
                                        gg.DrawPolygon(new Pen(color, 3), apf);
                                        //board.Board.Refresh();
                                    }
                                    if (setting.Mode == DrawModes.Fill)
                                    {
                                        gg.FillPolygon(new SolidBrush(color), apf);
                                        //board.Board.Refresh();
                                    }
                                    gg.Dispose();
                                }
                                else
                                {
                                    Graphics g = Graphics.FromImage(board.Board.Image);
                                    System.Drawing.PointF pt = new System.Drawing.PointF((int)paras[0], (int)paras[1]);
                                    System.Drawing.PointF pf = (PointF)points[points.Count - 1];
                                    g.DrawLine(new Pen(color, 2), (float)pt.X, (float)pt.Y, (float)pf.X, (float)pf.Y);
                                    g.Dispose();
                                    //board.Board.Refresh();
                                } 
                                //points.Add(pt);
                                //this.tempImg = (Image)this.board.Board.Image.Clone();
                            }
                        } break;
                    case States.Four:
                        {
                            UpDowns ud = (UpDowns)paras[3];
                            if (ud == UpDowns.Down)
                            {
                                this.tempImg = (System.Drawing.Image)this.board.Board.Image.Clone();
                                points.Add(new System.Drawing.PointF((int)paras[0], (int)paras[1]));
                                if (points.Count == setting.Numpoint)
                                {
                                    State = States.Final;
                                }
                                else
                                {
                                    State = States.Five;
                                }
                            }
                            if (ud == UpDowns.Neutral)
                            {
                                this.board.Board.Image = (System.Drawing.Image)this.tempImg.Clone();
                                
                                //board.Board.Refresh();
                                if (points.Count == setting.Numpoint - 1)
                                {
                                    Graphics gg = Graphics.FromImage(board.Board.Image);
                                    PointF[] apf = new PointF[points.Count + 1];
                                    for (int i = 0; i < points.Count; i++)
                                    {
                                        apf[i] = (PointF)points[i];
                                    }
                                    apf[points.Count] = new PointF((int)paras[0], (int)paras[1]);
                                    if (setting.Mode == DrawModes.Draw)
                                    {
                                        gg.DrawPolygon(new Pen(color, 3), apf);
                                        //board.Board.Refresh();
                                    }
                                    if (setting.Mode == DrawModes.Fill)
                                    {
                                        gg.FillPolygon(new SolidBrush(color), apf);
                                        //board.Board.Refresh();
                                    }
                                    gg.Dispose();
                                }
                                else
                                {
                                    Graphics g = Graphics.FromImage(board.Board.Image);
                                    System.Drawing.PointF pt = new System.Drawing.PointF((int)paras[0], (int)paras[1]);
                                    System.Drawing.PointF pf = (PointF)points[points.Count - 1];
                                    g.DrawLine(new Pen(color, 2), (float)pt.X, (float)pt.Y, (float)pf.X, (float)pf.Y);
                                    g.Dispose();
                                    //board.Board.Refresh();
                                }
                                //points.Add(pt);
                                //this.tempImg = (Image)this.board.Board.Image.Clone();
                            }
                        } break;
                    case States.Five:
                        {
                            UpDowns ud = (UpDowns)paras[3];
                            if (ud == UpDowns.Down)
                            {
                                this.tempImg = (System.Drawing.Image)this.board.Board.Image.Clone();
                                points.Add(new System.Drawing.PointF((int)paras[0], (int)paras[1]));
                                if (points.Count == setting.Numpoint)
                                {
                                    State = States.Final;
                                }
                                else
                                {
                                    State = States.Six;
                                }
                            }
                            if (ud == UpDowns.Neutral)
                            {
                                this.board.Board.Image = (System.Drawing.Image)this.tempImg.Clone();
                                
                                //board.Board.Refresh();
                                if (points.Count == setting.Numpoint - 1)
                                {
                                    Graphics gg = Graphics.FromImage(board.Board.Image);
                                    PointF[] apf = new PointF[points.Count + 1];
                                    for (int i = 0; i < points.Count; i++)
                                    {
                                        apf[i] = (PointF)points[i];
                                    }
                                    apf[points.Count] = new PointF((int)paras[0], (int)paras[1]);
                                    if (setting.Mode == DrawModes.Draw)
                                    {
                                        gg.DrawPolygon(new Pen(color, 3), apf);
                                        //board.Board.Refresh();
                                    }
                                    if (setting.Mode == DrawModes.Fill)
                                    {
                                        gg.FillPolygon(new SolidBrush(color), apf);
                                        //board.Board.Refresh();
                                    }
                                    gg.Dispose();
                                }
                                else
                                {
                                    Graphics g = Graphics.FromImage(board.Board.Image);
                                    System.Drawing.PointF pt = new System.Drawing.PointF((int)paras[0], (int)paras[1]);
                                    System.Drawing.PointF pf = (PointF)points[points.Count - 1];
                                    g.DrawLine(new Pen(color, 2), (float)pt.X, (float)pt.Y, (float)pf.X, (float)pf.Y);
                                    g.Dispose();
                                    //board.Board.Refresh();
                                }
                                //points.Add(pt);
                                //this.tempImg = (Image)this.board.Board.Image.Clone();
                            }
                        } break;
                    case States.Six:
                        {
                            UpDowns ud = (UpDowns)paras[3];
                            if (ud == UpDowns.Down)
                            {
                                this.tempImg = (System.Drawing.Image)this.board.Board.Image.Clone();
                                points.Add(new System.Drawing.PointF((int)paras[0], (int)paras[1]));
                                if (points.Count == setting.Numpoint)
                                {
                                    State = States.Final;
                                }
                                else
                                {
                                    State = States.Seven;
                                }
                            }
                            if (ud == UpDowns.Neutral)
                            {
                                this.board.Board.Image = (System.Drawing.Image)this.tempImg.Clone();
                               
                                //board.Board.Refresh();
                                if (points.Count == setting.Numpoint - 1)
                                {
                                    Graphics gg = Graphics.FromImage(board.Board.Image);
                                    PointF[] apf = new PointF[points.Count + 1];
                                    for (int i = 0; i < points.Count; i++)
                                    {
                                        apf[i] = (PointF)points[i];
                                    }
                                    apf[points.Count] = new PointF((int)paras[0], (int)paras[1]);
                                    if (setting.Mode == DrawModes.Draw)
                                    {
                                        gg.DrawPolygon(new Pen(color, 3), apf);
                                        //board.Board.Refresh();
                                    }
                                    if (setting.Mode == DrawModes.Fill)
                                    {
                                        gg.FillPolygon(new SolidBrush(color), apf);
                                        //board.Board.Refresh();
                                    }
                                    gg.Dispose();
                                }
                                else
                                {
                                    Graphics g = Graphics.FromImage(board.Board.Image);
                                    System.Drawing.PointF pt = new System.Drawing.PointF((int)paras[0], (int)paras[1]);
                                    System.Drawing.PointF pf = (PointF)points[points.Count - 1];
                                    g.DrawLine(new Pen(color, 2), (float)pt.X, (float)pt.Y, (float)pf.X, (float)pf.Y);
                                    g.Dispose();
                                    //board.Board.Refresh();
                                }
                                //points.Add(pt);
                                //this.tempImg = (Image)this.board.Board.Image.Clone();
                            }
                        } break;
                    case States.Seven:
                        {
                            UpDowns ud = (UpDowns)paras[3];
                            if (ud == UpDowns.Down)
                            {
                                this.tempImg = (System.Drawing.Image)this.board.Board.Image.Clone();
                                points.Add(new System.Drawing.PointF((int)paras[0], (int)paras[1]));
                                if (points.Count == setting.Numpoint)
                                {
                                    State = States.Final;
                                }
                                else
                                {
                                    State = States.Eight;
                                }
                            }
                            if (ud == UpDowns.Neutral)
                            {
                                this.board.Board.Image = (System.Drawing.Image)this.tempImg.Clone();
                                Graphics gg = Graphics.FromImage(board.Board.Image);
                                //board.Board.Refresh();
                                if (points.Count == setting.Numpoint - 1)
                                {
                                    PointF[] apf = new PointF[points.Count + 1];
                                    for (int i = 0; i < points.Count; i++)
                                    {
                                        apf[i] = (PointF)points[i];
                                    }
                                    apf[points.Count] = new PointF((int)paras[0], (int)paras[1]);
                                    if (setting.Mode == DrawModes.Draw)
                                    {
                                        gg.DrawPolygon(new Pen(color, 3), apf);
                                        //board.Board.Refresh();
                                    }
                                    if (setting.Mode == DrawModes.Fill)
                                    {
                                        gg.FillPolygon(new SolidBrush(color), apf);
                                        //board.Board.Refresh();
                                    }
                                    gg.Dispose();
                                }
                                else
                                {
                                    Graphics g = Graphics.FromImage(board.Board.Image);
                                    System.Drawing.PointF pt = new System.Drawing.PointF((int)paras[0], (int)paras[1]);
                                    System.Drawing.PointF pf = (PointF)points[points.Count - 1];
                                    g.DrawLine(new Pen(color, 2), (float)pt.X, (float)pt.Y, (float)pf.X, (float)pf.Y);
                                    g.Dispose();
                                    //board.Board.Refresh();
                                }
                                //points.Add(pt);
                                //this.tempImg = (Image)this.board.Board.Image.Clone();
                            }
                        } break;
                    case States.Eight:
                        {
                            UpDowns ud = (UpDowns)paras[3];
                            if (ud == UpDowns.Down)
                            {
                                this.tempImg = (System.Drawing.Image)this.board.Board.Image.Clone();
                                points.Add(new System.Drawing.PointF((int)paras[0], (int)paras[1]));
                                if (points.Count == setting.Numpoint)
                                {
                                    State = States.Final;
                                }
                                else
                                {
                                    State = States.Nine;
                                }
                            }
                            if (ud == UpDowns.Neutral)
                            {
                                this.board.Board.Image = (System.Drawing.Image)this.tempImg.Clone();
                               
                                //board.Board.Refresh();
                                if (points.Count == setting.Numpoint - 1)
                                {
                                    Graphics gg = Graphics.FromImage(board.Board.Image);
                                    PointF[] apf = new PointF[points.Count + 1];
                                    for (int i = 0; i < points.Count; i++)
                                    {
                                        apf[i] = (PointF)points[i];
                                    }
                                    apf[points.Count] = new PointF((int)paras[0], (int)paras[1]);
                                    if (setting.Mode == DrawModes.Draw)
                                    {
                                        gg.DrawPolygon(new Pen(color, 3), apf);
                                        //board.Board.Refresh();
                                    }
                                    if (setting.Mode == DrawModes.Fill)
                                    {
                                        gg.FillPolygon(new SolidBrush(color), apf);
                                        //board.Board.Refresh();
                                    }
                                    gg.Dispose();
                                }
                                else
                                {
                                    Graphics g = Graphics.FromImage(board.Board.Image);
                                    System.Drawing.PointF pt = new System.Drawing.PointF((int)paras[0], (int)paras[1]);
                                    System.Drawing.PointF pf = (PointF)points[points.Count - 1];
                                    g.DrawLine(new Pen(color, 2), (float)pt.X, (float)pt.Y, (float)pf.X, (float)pf.Y);
                                    g.Dispose();
                                    //board.Board.Refresh();
                                }
                                //points.Add(pt);
                                //this.tempImg = (Image)this.board.Board.Image.Clone();
                            }
                        } break;

                }
                return State;
               
            }
            protected override void Draw()
            {
                Graphics gg = Graphics.FromImage(board.Board.Image);
                PointF[] apf = new PointF[points.Count];
                for (int i = 0; i < points.Count; i++)
                {
                    apf[i] = (PointF)points[i];
                }
                switch(setting.Mode)
                {
                    case DrawModes.Fill:
                        {
                             gg.DrawPolygon(new Pen(color, 3), apf);
                                //board.Board.Refresh();
                        } break;
                    case DrawModes.Draw:
                        {                        
                             gg.FillPolygon(new SolidBrush(color), apf);
                                //board.Board.Refresh();
                        } break;
                }
                gg.Dispose();
                //board.Board.Refresh();
            }
            protected override void FillFrame()
            {
                drawableFrame = new Frame();
                drawableFrame.type = FTYPE.DRAW;
                drawableFrame.cmd = CMD.Polygon;
                drawableFrame.para = new string[3+(setting.Numpoint*2)];
                drawableFrame.data = null;
                if (setting.Mode == DrawModes.Draw)
                {
                    drawableFrame.para[0] = "d";
                }
                else
                {
                    drawableFrame.para[0] = "f";
                }
                drawableFrame.para[1] = setting.Numpoint.ToString();
                drawableFrame.para[2] = this.Color.ToArgb().ToString();
                drawableFrame.paraSize = 4 + drawableFrame.para[1].Length;//(10 = 2+8)
                drawableFrame.paraSize += drawableFrame.para[2].Length;
                drawableFrame.paraSize += points.Count << 1;
                int t = 0;
                for (int i = 3; i < (points.Count*2)+3; i++)
                {
                    drawableFrame.para[i] = ((PointF)points[t]).X.ToString();
                    drawableFrame.paraSize += drawableFrame.para[i].Length;
                    i++;
                    drawableFrame.para[i] = ((PointF)points[t]).Y.ToString();
                    drawableFrame.paraSize += drawableFrame.para[i].Length;
                    t++;
                }
            }
            #endregion
        }
    }
}
