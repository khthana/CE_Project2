using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Windows.Forms;

using System.Drawing.Text;

namespace W
{
    namespace Text
    {
        /// </summary>
        public class TextSetting : IDrawSetting
        {
            private System.Windows.Forms.Label LB_fontsize;
            private System.Windows.Forms.Label LB_font;
            private System.Windows.Forms.TextBox TB_text;
            private System.Windows.Forms.ComboBox CO_font;
            private System.Windows.Forms.NumericUpDown UD_size;
            private System.Windows.Forms.GroupBox GB_text;
            private System.Windows.Forms.GroupBox GB_basicprop;
            private System.Windows.Forms.GroupBox GB_style;
            private System.Windows.Forms.CheckBox CB_bold;
            private System.Windows.Forms.CheckBox CB_line;
            private System.Windows.Forms.CheckBox CB_italic;
            private System.Windows.Forms.CheckBox CB_strikeout;
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
            string text;
            public string Text
            {
                set
                {
                    this.text = value;
                }
                get
                {
                    return this.text;
                }
            }
            private System.Drawing.FontStyle style;
            public System.Drawing.FontStyle Style
            {
                set
                {
                    this.style = value;
                }
                get
                {
                    return this.style;
                }
            }
    
            private string font;
            public string Font
            {
                set
                {
                    this.font = value;
                }
                get
                {
                    return this.font;
                }
            }
            public TextSetting()
            {
                this.size = 15;
                this.style = FontStyle.Regular;
                this.Text = " ^_^ ";
                this.font = "Arial";
            }
            /// <summary>
            /// create form in groupbox
            /// </summary>
            /// <param name="menu">menu of groupbox which create form</param>
            public void initializeSettingForm(IMenu menu)
            {
                
                this.UD_size = new System.Windows.Forms.NumericUpDown();
                this.LB_fontsize = new System.Windows.Forms.Label();
                this.LB_font = new System.Windows.Forms.Label();
                this.GB_text = new System.Windows.Forms.GroupBox();
                this.TB_text = new System.Windows.Forms.TextBox();
                this.CO_font = new System.Windows.Forms.ComboBox();
                this.CB_bold = new System.Windows.Forms.CheckBox();
                this.CB_italic = new System.Windows.Forms.CheckBox();
                this.CB_line = new System.Windows.Forms.CheckBox();
                this.CB_strikeout = new System.Windows.Forms.CheckBox();             
                this.GB_style = new System.Windows.Forms.GroupBox();
                this.GB_basicprop = menu.GetPropertiesBox();
                this.GB_basicprop.SuspendLayout();
                ((System.ComponentModel.ISupportInitialize)(this.UD_size)).BeginInit();
                // 
                // GB_basicprop
                // 
                this.GB_basicprop.Controls.Add(this.LB_fontsize);
                this.GB_basicprop.Controls.Add(this.UD_size);
                this.GB_basicprop.Controls.Add(this.GB_style);
                this.GB_basicprop.Controls.Add(this.TB_text);
                this.GB_basicprop.Controls.Add(this.GB_text);
                this.GB_basicprop.Controls.Add(this.CO_font);
                this.GB_basicprop.Controls.Add(this.LB_font);
                InstalledFontCollection FontList = new InstalledFontCollection();
                foreach (FontFamily fontFamily in FontList.Families)
                {
                    this.CO_font.Items.Add(fontFamily.Name);
                }
               // this.CO_font.Width = 140;
                //this.CO_font.Height = 30;
        
                
                this.CO_font.SelectedItem = font;
                this.CO_font.Location = new System.Drawing.Point(66, 390);
                this.CO_font.Size = new System.Drawing.Size(153, 21);
                this.CO_font.SelectedIndexChanged += new EventHandler(CO_SelectedChanged);
                this.LB_font.AutoSize = true;
                this.LB_font.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
                this.LB_font.Location = new System.Drawing.Point(21, 394);
                this.LB_font.Name = "LB_fontsize";
                this.LB_font.Size = new System.Drawing.Size(37, 18);
                this.LB_font.Text = "Font";
                this.GB_text.SuspendLayout();
                this.GB_text.Controls.Add(this.TB_text);
                this.GB_text.Location = new System.Drawing.Point(11, 62);
                this.GB_text.Name = "GB_text";
                this.GB_text.Size = new System.Drawing.Size(208, 158);
                this.GB_text.TabIndex = 3;
                this.GB_text.TabStop = false;
                this.GB_text.Text = "Text";
                this.TB_text.Multiline = true;
                this.TB_text.Text = text;
                this.TB_text.Location = new System.Drawing.Point(11, 25);
                this.TB_text.Size = new System.Drawing.Size(186, 120);
                this.TB_text.Visible = true;
                this.TB_text.Name = "TB_text";
                this.TB_text.TextChanged += new EventHandler(TB_TextChanged);
                this.TB_text.Font = new Font(this.Font, this.Size, this.Style);
                this.GB_text.ResumeLayout(false);
                this.GB_text.PerformLayout();
                this.GB_style.SuspendLayout();
                this.GB_style.Controls.Add(this.CB_bold);
                this.GB_style.Controls.Add(this.CB_italic);
                this.GB_style.Controls.Add(this.CB_line);
                this.GB_style.Controls.Add(this.CB_strikeout);        
                this.GB_style.Location = new System.Drawing.Point(11, 225);
                this.GB_style.Name = "GB_style";
                this.GB_style.Size = new System.Drawing.Size(208, 155);
                this.GB_style.TabIndex = 8;
                this.GB_style.TabStop = false;
                this.GB_style.Text = "Style";
                this.CB_strikeout.Text = "Strikeout";
                this.CB_line.Text = "Underline";
                this.CB_italic.Text = "Italic";
                this.CB_bold.Text = "Bold";
                this.CB_strikeout.Name = "CB_strikeout";
                this.CB_line.Name = "CB_line";
                this.CB_bold.Name = "CB_bold";
                this.CB_italic.Name = "CB_italic";
                this.CB_italic.CheckedChanged += new System.EventHandler(this.CB_CheckedChanged);
                this.CB_bold.CheckedChanged += new System.EventHandler(this.CB_CheckedChanged);
                this.CB_line.CheckedChanged += new System.EventHandler(this.CB_CheckedChanged);
                this.CB_strikeout.CheckedChanged += new System.EventHandler(this.CB_CheckedChanged);
                if ((style & FontStyle.Bold) == FontStyle.Bold)
                {
                    this.CB_bold.Checked = true;
                }
                if ((style & FontStyle.Italic) == FontStyle.Italic)
                {
                    this.CB_italic.Checked = true;
                }
                if ((style & FontStyle.Strikeout) == FontStyle.Strikeout)
                {
                    this.CB_strikeout.Checked = true;
                }
                if ((style & FontStyle.Underline) == FontStyle.Underline) 
                {
                    this.CB_line.Checked = true;
                }
                this.CB_strikeout.Location = new System.Drawing.Point(11, 115);
                this.CB_line.Location = new System.Drawing.Point(11, 85);
                this.CB_bold.Location = new System.Drawing.Point(11, 25); 
                this.CB_italic.Location = new System.Drawing.Point(11, 55); 
                this.GB_style.ResumeLayout(false);
                this.GB_style.PerformLayout();
                // 
                // UD_size
                // 
                this.UD_size.Location = new System.Drawing.Point(158, 34);
                this.UD_size.Maximum = new decimal(new int[] { 80, 0, 0, 0 });
                this.UD_size.Minimum = new decimal(new int[] { 8, 0, 0, 0 });
                this.UD_size.Name = "UD_size";
                this.UD_size.Size = new System.Drawing.Size(60, 24);
                this.UD_size.TabIndex = 4;
                this.UD_size.Value = new decimal(new int[] { (int)size, 0, 0, 0 });
                this.UD_size.ValueChanged += new System.EventHandler(this.UD_size_ValueChanged);
                this.UD_size.ReadOnly = true;
                // 
                //LB Size
                // 
                this.LB_fontsize.AutoSize = true;
                this.LB_fontsize.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
                this.LB_fontsize.Location = new System.Drawing.Point(21, 34);
                this.LB_fontsize.Name = "LB_fontsize";
                this.LB_fontsize.Size = new System.Drawing.Size(37, 18);
                this.LB_fontsize.Text = "Size";               
                this.GB_basicprop.ResumeLayout(false);
                this.GB_basicprop.PerformLayout();
                ((System.ComponentModel.ISupportInitialize)(this.UD_size)).EndInit();
                // 
            }
            private void UD_size_ValueChanged(object sender, EventArgs e)
            {
                this.Size = (uint)UD_size.Value;
                this.TB_text.Font = new Font(this.Font, this.Size, this.Style);
            }
            private void TB_TextChanged(object sender, EventArgs e)
            {
                this.Text = this.TB_text.Text;
                this.TB_text.Font = new Font(this.Font, this.Size, this.Style);
            }
            private void CO_SelectedChanged(object sender, EventArgs e)
            {
                this.Font = (string)this.CO_font.SelectedItem;
                this.TB_text.Font = new Font(this.Font, this.Size, this.Style);
            }
            private void CB_CheckedChanged(object sender, EventArgs e)
            {
                if (this.CB_bold.Checked == true)
                {
                    Style |= FontStyle.Bold;
                }
                else
                {
                    if((FontStyle.Bold & Style) == FontStyle.Bold)
                    {
                        Style ^= FontStyle.Bold;
                    }
                }
                if (this.CB_italic.Checked == true)
                {
                    Style |= FontStyle.Italic;
                }
                else
                {
                    if ((FontStyle.Italic & Style) == FontStyle.Italic)
                    {
                        Style ^= FontStyle.Italic;
                    }
                }
                if (this.CB_line.Checked == true)
                {
                    Style |= FontStyle.Underline;         
                }
                else
                {
                    if ((FontStyle.Underline & Style) == FontStyle.Underline)
                    {
                        Style ^= FontStyle.Underline;
                    }
                }
                if (this.CB_strikeout.Checked == true)
                {
                    Style |= FontStyle.Strikeout;
                }
                else
                {
                    if ((FontStyle.Strikeout & Style) == FontStyle.Strikeout)
                    {
                        Style ^= FontStyle.Strikeout;
                    }
                }
                this.TB_text.Font = new Font(this.Font, this.Size, this.Style);
            }
        }
        /// <summary>
        /// draw point ,create Frame to send to network
        /// : DrawAble
        /// </summary>
        public class TextDraw : DrawAble
        {
            #region Reference
            Text.TextSetting setting;
            #endregion
            #region Construtor
            public TextDraw(B b, Text.TextSetting s)
                : base(b)
            {
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
                                setting = (Text.TextSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Text];
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
            public override States Sketch(params object[] paras)
            {
                UpDowns ud = (UpDowns)paras[3];
                if (ud == UpDowns.Up)
                {
                    MouseEventArgs meva = (MouseEventArgs)paras[2];
                    if (meva.Button == MouseButtons.Left)
                    {
                        this.possition.X = (int)paras[0];
                        this.possition.Y = (int)paras[1];
                        State = States.Final;
                        return States.Start;
                    }
                }
                return States.First;
            }
            protected override void Draw()
            {
                Graphics g = Graphics.FromImage(board.Board.Image);
                g.DrawString(setting.Text,new Font(setting.Font, setting.Size, setting.Style),new SolidBrush(color),(PointF)possition);
                board.Board.Refresh();
                g.Dispose();
            }
            protected override void FillFrame()
            {
                drawableFrame = new Frame();
                drawableFrame.type = FTYPE.DRAW;
                drawableFrame.cmd = CMD.Text;
                drawableFrame.para = new string[7];
                drawableFrame.data = null;
                drawableFrame.para[0] = setting.Font.ToString(); 
                drawableFrame.para[1] = setting.Size.ToString();
                drawableFrame.para[2] = this.Color.ToArgb().ToString();
                drawableFrame.para[3] = Possition.X.ToString();
                drawableFrame.para[4] = Possition.Y.ToString();
                drawableFrame.para[5] = setting.Style.ToString();
                drawableFrame.para[6] = setting.Text.ToString();
                drawableFrame.paraSize = 7 + drawableFrame.para[1].Length;//(10 = 2+8)
                drawableFrame.paraSize += drawableFrame.para[2].Length;
                drawableFrame.paraSize += drawableFrame.para[3].Length;
                drawableFrame.paraSize += drawableFrame.para[4].Length;
                drawableFrame.paraSize += drawableFrame.para[5].Length;
                drawableFrame.paraSize += drawableFrame.para[0].Length;
                drawableFrame.paraSize += drawableFrame.para[6].Length;
            }
        }
    }
}
