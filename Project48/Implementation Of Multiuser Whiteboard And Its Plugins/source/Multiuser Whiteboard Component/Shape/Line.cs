using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace W
{
    namespace Line
    {
        public class LineSetting : IDrawSetting
        {
            private System.Windows.Forms.Label LB_linesize;
            private System.Windows.Forms.RadioButton RB_normal;
            private System.Windows.Forms.RadioButton RB_curve;
            private System.Windows.Forms.GroupBox GB_linemode;
            private System.Windows.Forms.NumericUpDown UD_size;
            private System.Windows.Forms.GroupBox GB_basicprop;
            private DrawAble drawAble;
            public void SetDrawableObject(DrawAble obj)
            {
                drawAble = obj;
            }
            private uint size;
            /// <summary>
            /// size of Line 
            /// </summary>
            public uint Size
            {
                set
                {
                    this.size = value;
                }
                get
                {
                    return this.size;
                }
            }
            private LineModes mode; 
            public LineModes Mode
            {
                set
                {
                    mode = value;
                    if (drawAble != null)
                    {
                        LineDraw ld = (LineDraw)drawAble;
                        ld.Clear();
                    }
                }
                get
                {
                    
                    return this.mode;
                }
            }
            public LineSetting()
            {
                this.size = 3;
                this.mode = LineModes.Normal;
            }
            /// <summary>
            /// create form in groupbox
            /// </summary>
            /// <param name="menu">menu of groupbox which create form</param>
            public void initializeSettingForm(IMenu menu)
            {
                this.UD_size = new System.Windows.Forms.NumericUpDown();
                this.LB_linesize = new System.Windows.Forms.Label();
                this.RB_normal = new System.Windows.Forms.RadioButton();
                this.RB_curve = new System.Windows.Forms.RadioButton();
                this.GB_linemode = new System.Windows.Forms.GroupBox();
                this.GB_basicprop = menu.GetPropertiesBox();
                this.GB_basicprop.SuspendLayout();
                ((System.ComponentModel.ISupportInitialize)(this.UD_size)).BeginInit();
                // 
                // GB_basicprop
                // 
                
                this.GB_basicprop.Controls.Add(this.GB_linemode);
                this.GB_basicprop.Controls.Add(this.LB_linesize);
                this.GB_basicprop.Controls.Add(this.UD_size);

                //
                // GB_linemode
                //
               
                this.GB_linemode.SuspendLayout();

                this.GB_linemode.Controls.Add(this.RB_normal);
                this.GB_linemode.Controls.Add(this.RB_curve);

                this.RB_normal.AutoSize = true;
                this.RB_normal.Location = new System.Drawing.Point(11, 21);
                this.RB_normal.Name = "RB_normal";
                this.RB_normal.Size = new System.Drawing.Size(20, 20);
                this.RB_normal.TabIndex = 6;
                this.RB_normal.Text = "Normal";
                
                this.RB_normal.CheckedChanged += new System.EventHandler(this.RB_CheckedChanged);
                this.RB_curve.AutoSize = true;
                this.RB_curve.Location = new System.Drawing.Point(100, 20);
                this.RB_curve.Name = "RB_curve";
                this.RB_curve.Size = new System.Drawing.Size(20, 20);
                this.RB_curve.TabIndex = 7;
                this.RB_curve.Text = "Curve";    
                this.RB_curve.CheckedChanged += new System.EventHandler(this.RB_CheckedChanged);
                if(mode == LineModes.Curve)
                {
                    this.RB_curve.Checked = true;
                }
                if (mode == LineModes.Normal)
                {
                    this.RB_normal.Checked = true;
                }
                this.GB_linemode.Location = new System.Drawing.Point(11, 72);
                this.GB_linemode.Name = "GB_linemode";
                this.GB_linemode.Size = new System.Drawing.Size(208, 55);
                this.GB_linemode.TabIndex = 8;
                this.GB_linemode.TabStop = false;
                this.GB_linemode.Text = "Mode";
                this.GB_linemode.ResumeLayout(false);
                this.GB_linemode.PerformLayout();
                // 
                // UD_size
                // 
                this.UD_size.Location = new System.Drawing.Point(158, 34);
                this.UD_size.Maximum = new decimal(new int[] {39,0,0,0});
                this.UD_size.Minimum = new decimal(new int[] {1,0,0,0});
                this.UD_size.Name = "UD_size";
                this.UD_size.Size = new System.Drawing.Size(60, 24);
                this.UD_size.TabIndex = 4;
                this.UD_size.Value = new decimal(new int[] {(int)size,0,0,0});
                this.UD_size.ValueChanged += new System.EventHandler(this.UD_size_ValueChanged);
                this.UD_size.ReadOnly = true;
                // 
                //LB Size
                // 
                this.LB_linesize.AutoSize = true;
                this.LB_linesize.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
                this.LB_linesize.Location = new System.Drawing.Point(21, 34);
                this.LB_linesize.Name = "LB_linesize";
                this.LB_linesize.Size = new System.Drawing.Size(37, 18);
                this.LB_linesize.TabIndex = 5;
                this.LB_linesize.Text = "Size";
                this.GB_basicprop.ResumeLayout(false);
                this.GB_basicprop.PerformLayout();
                ((System.ComponentModel.ISupportInitialize)(this.UD_size)).EndInit();
            }
            private void UD_size_ValueChanged(object sender, EventArgs e)
            {
                this.Size = (uint)UD_size.Value;  
            }
            private void RB_CheckedChanged(object sender, EventArgs e)
            {
                if(RB_normal.Checked == true)
                {
                    Mode = LineModes.Normal;
                }
                if(RB_curve.Checked == true)
                {
                    Mode = LineModes.Curve;
                }
            }
        }
        public class LineDraw : DrawAble
        {
            private System.Drawing.Point possition2;
            public System.Drawing.Point Possition2
            {
                set
                {
                    possition2 = value;
                }
                get
                {
                    return possition2;
                }
            }
            private System.Drawing.Point possition3;
            public System.Drawing.Point Possition3
            {
                set
                {
                    possition3 = value;
                }
                get
                {
                    return possition3;
                }
            }

            #region Reference
            private Line.LineSetting setting;
            #endregion

            #region Construtor
            public LineDraw(B b, Line.LineSetting s)
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
                                setting = (Line.LineSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Line];
                                possition = System.Drawing.Point.Empty;
                                possition2 = System.Drawing.Point.Empty;
                                possition3 = System.Drawing.Point.Empty;
                                drawableFrame = null;
                                this.board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                                State = States.Start;
                            } break;
                        case States.Start:
                            {
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
                        case States.Final:
                            {
                                board.backImage = (System.Drawing.Image)this.board.Board.Image.Clone();
                                this.FillFrame();
                                this.Draw();
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
                                this.possition.X = (int)paras[0];
                                this.possition.Y = (int)paras[1];
                                State = States.One;   
                            }                          
                        } break;
                    case States.One:
                        {
                            UpDowns ud = (UpDowns)paras[3];
                            switch (setting.Mode)
                            {
                                case LineModes.Normal:
                                    {
                                        if (ud == UpDowns.Up)
                                        {
                                            this.possition2.X = (int)paras[0];
                                            this.possition2.Y = (int)paras[1];
                                            State = States.Final;
                                        }
                                        if (ud == UpDowns.Neutral)
                                        {
                                            this.board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                                            this.possition2.X = (int)paras[0];
                                            this.possition2.Y = (int)paras[1];
                                            this.Draw();
                                            //board.backImage = (Image)this.board.Board.Image.Clone();
                                        }
                                    } break;
                                case LineModes.Curve:
                                    {
                                        if (ud == UpDowns.Down)
                                        {
                                            this.possition3.X = (int)paras[0];
                                            this.possition3.Y = (int)paras[1];
                                            State = States.Two;
                                        }
                                        if (ud == UpDowns.Neutral)
                                        {
                                            this.board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                                            this.possition3.X = (int)paras[0];
                                            this.possition3.Y = (int)paras[1];
                                            this.Draw();
                                            //board.backImage = (Image)this.board.Board.Image.Clone();
                                        }
                                    } break;
                            }
                        } break;
                    case States.Two:
                        {
                            UpDowns ud = (UpDowns)paras[3];
                            if (ud == UpDowns.Down)
                            {
                                this.possition2.X = (int)paras[0];
                                this.possition2.Y = (int)paras[1];
                                State = States.Final;

                            }
                            if (ud == UpDowns.Neutral)
                            {
                                this.board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                                this.possition2.X = (int)paras[0];
                                this.possition2.Y = (int)paras[1];
                                this.Draw();
                                //board.backImage = (Image)this.board.Board.Image.Clone();
                            }

                        } break;
                }
                return State;       
            }
            protected override void Draw()
            {
                Graphics g = Graphics.FromImage(board.Board.Image);
                switch(setting.Mode)
                {
                    case LineModes.Normal:
                        {
                            g.DrawLine(new Pen(color, setting.Size), (float)Possition.X, (float)possition.Y, (float)Possition2.X, (float)possition2.Y);
                        } break;
                    case LineModes.Curve:
                        {
                            if (state != States.One)
                            {
                                System.Drawing.Point[] p = new System.Drawing.Point[3];
                                p[0] = possition;
                                p[1] = possition2;
                                p[2] = possition3;
                                g.DrawCurve(new Pen(color, setting.Size), p);
                            }
                            else
                            {
                                System.Drawing.Point[] p = new System.Drawing.Point[2];
                                p[0] = possition;
                                p[1] = possition3;
                              
                                g.DrawCurve(new Pen(color, setting.Size), p);
                                possition2 = System.Drawing.Point.Empty;
                            }
                        } break;
                }
                g.Dispose();
                board.Board.Refresh();
            }
            #endregion
            protected override void FillFrame()
            {
                drawableFrame = new Frame();
                drawableFrame.type = FTYPE.DRAW;
                drawableFrame.cmd = CMD.Line;
                drawableFrame.para = new string[9];
                drawableFrame.data = null;
                
                if (setting.Mode == LineModes.Normal)
                {
                    drawableFrame.para[0] = "d";
                }
                else
                {
                    drawableFrame.para[0] = "f";
                }
                drawableFrame.para[5] = Possition2.X.ToString();
                drawableFrame.para[6] = Possition2.Y.ToString();
                drawableFrame.para[7] = Possition3.X.ToString();
                drawableFrame.para[8] = Possition3.Y.ToString();
                drawableFrame.para[1] = setting.Size.ToString();
                drawableFrame.para[2] = this.Color.ToArgb().ToString();
                drawableFrame.para[3] = Possition.X.ToString();
                drawableFrame.para[4] = Possition.Y.ToString();
                drawableFrame.paraSize = 11 + drawableFrame.para[1].Length;//(10 = 2+8)
                drawableFrame.paraSize += drawableFrame.para[2].Length;
                drawableFrame.paraSize += drawableFrame.para[3].Length;
                drawableFrame.paraSize += drawableFrame.para[4].Length;
                drawableFrame.paraSize += drawableFrame.para[5].Length;
                drawableFrame.paraSize += drawableFrame.para[6].Length;
                drawableFrame.paraSize += drawableFrame.para[7].Length;
                drawableFrame.paraSize += drawableFrame.para[8].Length;
            }
        } 
    }
}
