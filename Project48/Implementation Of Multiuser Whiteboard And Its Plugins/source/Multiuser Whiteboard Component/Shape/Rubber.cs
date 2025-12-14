using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Windows.Forms;
namespace W
{
    namespace Rubber
    {
        /// <summary>
        /// Define setting propertie of point
        /// Define forms to receive setting info this form add with groupbox
        /// : IDrawSetting
        /// </summary>
        public class RubberSetting : IDrawSetting
        {
            private System.Windows.Forms.Label LB_pointsize;
            private System.Windows.Forms.NumericUpDown UD_size;
            private System.Windows.Forms.GroupBox GB_basicprop;

            private DrawAble drawAble;
            public void SetDrawableObject(DrawAble obj)
            {
                drawAble = obj;
            }

            private uint size;
            /// <summary>
            /// size of point 
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
            public RubberSetting()
            {
                this.size = 25;
            }
            /// <summary>
            /// create form in groupbox
            /// </summary>
            /// <param name="menu">menu of groupbox which create form</param>
            public void initializeSettingForm(IMenu menu)
            {
                this.UD_size = new System.Windows.Forms.NumericUpDown();
                this.LB_pointsize = new System.Windows.Forms.Label();
                this.GB_basicprop = menu.GetPropertiesBox();
                this.GB_basicprop.SuspendLayout();
                ((System.ComponentModel.ISupportInitialize)(this.UD_size)).BeginInit();
                // 
                // GB_basicprop
                // 
                this.GB_basicprop.Controls.Add(this.LB_pointsize);
                this.GB_basicprop.Controls.Add(this.UD_size);
                // 
                // UD_size
                // 
                this.UD_size.Location = new System.Drawing.Point(158, 34);
                this.UD_size.Maximum = new decimal(new int[] { 55, 0, 0, 0 });
                this.UD_size.Minimum = new decimal(new int[] { 1, 0, 0, 0 });
                this.UD_size.Name = "UD_size";
                this.UD_size.Size = new System.Drawing.Size(60, 24);
                this.UD_size.TabIndex = 4;
                this.UD_size.Value = new decimal(new int[] { (int)size, 0, 0, 0 });
                this.UD_size.ValueChanged += new System.EventHandler(this.UD_size_ValueChanged);
                this.UD_size.ReadOnly = true;
                // 
                //LB Size
                // 
                this.LB_pointsize.AutoSize = true;
                this.LB_pointsize.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
                this.LB_pointsize.Location = new System.Drawing.Point(21, 34);
                this.LB_pointsize.Name = "label1";
                this.LB_pointsize.Size = new System.Drawing.Size(37, 18);
                this.LB_pointsize.TabIndex = 5;
                this.LB_pointsize.Text = "Size";
                this.GB_basicprop.ResumeLayout(false);
                this.GB_basicprop.PerformLayout();
                ((System.ComponentModel.ISupportInitialize)(this.UD_size)).EndInit();

                // 
            }
            private void UD_size_ValueChanged(object sender, EventArgs e)
            {
                this.Size = (uint)UD_size.Value;
            }

        }
        /// <summary>
        /// draw point ,create Frame to send to network
        /// : DrawAble
        /// </summary>
        public class RubberDraw : DrawAble
        {
            public override Frame DrawableFrame
            {
                get
                {
                    return drawableFrame;
                }
            }
            #region Reference
            Rubber.RubberSetting setting;

            #endregion
            #region Construtor
            public RubberDraw(B b, Rubber.RubberSetting s)
                : base(b)
            {
                board.Board.MouseLeave += new EventHandler(MouseLeave);
                setting = s;
                State = States.First;
            }

            #endregion
            protected override States State
            {
                set
                {
                    switch (value)
                    {
                        case States.First:
                            {
                                color = board.Color;
                                setting = (Rubber.RubberSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Rubber];
                                possition = System.Drawing.Point.Empty;
                                drawableFrame = null;
                                this.board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                                //State = States.Start;
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
            void MouseLeave(object sender, EventArgs e)
            {
                board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
            }
            public override States Sketch(params object[] paras)
            {
                UpDowns ud = (UpDowns)paras[3];
                if ((ud != UpDowns.Down) )
                {
                    MouseEventArgs meva = (MouseEventArgs)paras[2];
                    if (meva.Button == MouseButtons.Left)
                    {
                        board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                        board.backImage = (System.Drawing.Image)board.Board.Image.Clone();
                        this.possition.X = (int)paras[0];
                        this.possition.Y = (int)paras[1]; 
                        State = States.Final;
                        return States.Extra;
                    }
                }
                if (ud == UpDowns.Neutral)
                {
                    board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                    board.backImage = (System.Drawing.Image)board.Board.Image.Clone();
                    this.possition.X = (int)paras[0];
                    this.possition.Y = (int)paras[1];
                    Graphics g = Graphics.FromImage(board.Board.Image);
                    g.DrawRectangle(new Pen(Brushes.Black), (float)possition.X+1, (float)possition.Y+1, setting.Size , setting.Size );
                    g.Dispose();
                    board.Board.Refresh();
                }
                  
                return States.Final;
            }
            protected override void Draw()
            {
                Graphics g = Graphics.FromImage(board.Board.Image);
                //MessageBox.Show(Possition.X.ToString()+"  "+possition.Y.ToString());
                g.FillRectangle(new SolidBrush(Color.White), (float)possition.X, (float)possition.Y, setting.Size + 2, setting.Size + 2);
                g.Dispose();
                g = Graphics.FromImage(board.backImage);
                //MessageBox.Show(Possition.X.ToString()+"  "+possition.Y.ToString());
                g.FillRectangle(new SolidBrush(Color.White), (float)possition.X, (float)possition.Y, setting.Size + 2, setting.Size + 2);
                g.Dispose();
                board.Board.Refresh();
               // MessageBox.Show("TEST");
            }
            protected override void FillFrame()
            {
                drawableFrame = new Frame();
                drawableFrame.type = FTYPE.DRAW;
                drawableFrame.cmd = CMD.Rubber;
                drawableFrame.para = new string[5];
                drawableFrame.data = null;
                drawableFrame.para[0] = "d";
                drawableFrame.para[1] = setting.Size.ToString();
                drawableFrame.para[2] = "";
                drawableFrame.para[3] = Possition.X.ToString();
                drawableFrame.para[4] = Possition.Y.ToString();
                drawableFrame.paraSize = 6 + drawableFrame.para[1].Length;//(10 = 2+8)
                drawableFrame.paraSize += drawableFrame.para[2].Length;
                drawableFrame.paraSize += drawableFrame.para[3].Length;
                drawableFrame.paraSize += drawableFrame.para[4].Length;
            }
        }
    }
}
