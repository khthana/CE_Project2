using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace W
{
    namespace Rectangle
    {
        public class RectangleSetting : IDrawSetting
        {
            private System.Windows.Forms.Label LB_linesize;
            private System.Windows.Forms.RadioButton RB_fill;
            private System.Windows.Forms.RadioButton RB_draw;
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

            private DrawModes mode;
            public DrawModes Mode
            {
                set
                {
                    mode = value;
                    if (drawAble != null)
                    {
                        Rectangle.RectangleDraw rd = (RectangleDraw)drawAble;
                        rd.Clear();
                    }
                }
                get
                {

                    return this.mode;
                }
            }
            public RectangleSetting()
            {
                this.size = 3;
                this.mode = DrawModes.Draw;
            }
            /// <summary>
            /// create form in groupbox
            /// </summary>
            /// <param name="menu">menu of groupbox which create form</param>
            public void initializeSettingForm(IMenu menu)
            {
                this.UD_size = new System.Windows.Forms.NumericUpDown();
                this.LB_linesize = new System.Windows.Forms.Label();
                this.RB_fill = new System.Windows.Forms.RadioButton();
                this.RB_draw = new System.Windows.Forms.RadioButton();
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
                this.GB_linemode.Controls.Add(this.RB_draw);
                this.GB_linemode.Controls.Add(this.RB_fill);
                this.RB_fill.AutoSize = true;
                this.RB_fill.Location = new System.Drawing.Point(11, 21);
                this.RB_fill.Name = "RB_fill";
                this.RB_fill.Size = new System.Drawing.Size(20, 20);
                this.RB_fill.TabIndex = 6;
                this.RB_fill.Text = "Fill";
                this.RB_fill.CheckedChanged += new System.EventHandler(this.RB_CheckedChanged);
                this.RB_draw.AutoSize = true;
                this.RB_draw.Location = new System.Drawing.Point(100, 20);
                this.RB_draw.Name = "RB_Draw";
                this.RB_draw.Size = new System.Drawing.Size(20, 20);
                this.RB_draw.TabIndex = 7;
                this.RB_draw.Text = "Draw";
                this.RB_draw.CheckedChanged += new System.EventHandler(this.RB_CheckedChanged);
                if (mode == DrawModes.Draw)
                {
                    this.RB_draw.Checked = true;
                }
                if (mode == DrawModes.Fill)
                {
                    this.RB_fill.Checked = true;
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
                this.UD_size.Maximum = new decimal(new int[] { 39, 0, 0, 0 });
                this.UD_size.Minimum = new decimal(new int[] { 1, 0, 0, 0 });
                this.UD_size.Name = "UD_size";
                this.UD_size.Size = new System.Drawing.Size(60, 24);
                this.UD_size.TabIndex = 4;
                this.UD_size.Value = new decimal(new int[] { (int)size, 0, 0, 0 });
                this.UD_size.ValueChanged += new System.EventHandler(this.UD_size_ValueChanged);
                this.UD_size.ReadOnly = true;
                if (Mode == DrawModes.Draw)
                {
                    this.UD_size.Visible = true;
                    this.LB_linesize.Visible = true;
                }
                else
                {
                    this.UD_size.Visible = false;
                    this.LB_linesize.Visible = false;
                }
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
                // 
            }
            private void UD_size_ValueChanged(object sender, EventArgs e)
            {
                this.Size = (uint)UD_size.Value;
            }
            private void RB_CheckedChanged(object sender, EventArgs e)
            {
                if (RB_draw.Checked == true)
                {
                    Mode = DrawModes.Draw;
                    this.UD_size.Visible = true;
                    this.LB_linesize.Visible = true;
                }
                if (RB_fill.Checked == true)
                {
                    Mode = DrawModes.Fill;
                    this.UD_size.Visible = false;
                    this.LB_linesize.Visible = false;
                }
            }
        }
        public class RectangleDraw : DrawAble
        {
            private Rectangle.RectangleSetting setting;
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
            #region Construtor
            public RectangleDraw(B b, Rectangle.RectangleSetting s)
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
                                setting = (Rectangle.RectangleSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Rectangle];
                                possition = System.Drawing.Point.Empty;
                                possition2 = System.Drawing.Point.Empty;
                            
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
                switch (setting.Mode)
                {
                    case DrawModes.Draw:
                        {
                            g.DrawRectangle(new Pen(color,setting.Size), (float)Possition.X, (float)possition.Y, (float)Possition2.X - (float)Possition.X, (float)possition2.Y - (float)Possition.Y);
                        } break;
                    case DrawModes.Fill:
                        {

                            g.FillRectangle(new SolidBrush(color), (float)Possition.X, (float)possition.Y, (float)Possition2.X - (float)Possition.X, (float)possition2.Y - (float)Possition.Y);
                        } break;
                }


                board.Board.Refresh();
                g.Dispose();
            }
            #endregion

            protected override void FillFrame()
            {
                drawableFrame = new Frame();
                drawableFrame.type = FTYPE.DRAW;
                drawableFrame.cmd = CMD.Rectangle;
                drawableFrame.para = new string[7];
                drawableFrame.data = null;
                if (setting.Mode == DrawModes.Draw)
                {
                    drawableFrame.para[0] = "d";
                }
                else
                {
                    drawableFrame.para[0] = "f";
                }
                drawableFrame.para[5] = Possition2.X.ToString();
                drawableFrame.para[6] = Possition2.Y.ToString();
                drawableFrame.para[1] = setting.Size.ToString();
                drawableFrame.para[2] = this.Color.ToArgb().ToString();
                drawableFrame.para[3] = Possition.X.ToString();
                drawableFrame.para[4] = Possition.Y.ToString();
                drawableFrame.paraSize = 8 + drawableFrame.para[1].Length;//(10 = 2+8)
                drawableFrame.paraSize += drawableFrame.para[2].Length;
                drawableFrame.paraSize += drawableFrame.para[3].Length;
                drawableFrame.paraSize += drawableFrame.para[4].Length;
                drawableFrame.paraSize += drawableFrame.para[5].Length;
                drawableFrame.paraSize += drawableFrame.para[6].Length;
            }
        }
    }
}
