using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Windows.Forms;
using System.IO;
using System.Diagnostics;
namespace W
{
    namespace Image
    {
        /// <summary>
        /// Define setting propertie of point
        /// Define forms to receive setting info this form add with groupbox
        /// : IDrawSetting
        /// </summary>
        public class ImageSetting : IDrawSetting
        {
          
            private System.Windows.Forms.Button BT_image;
            private System.Windows.Forms.TextBox TB_image;
            private System.Windows.Forms.GroupBox GB_basicprop;
            private System.Windows.Forms.Label LB_image;

            private DrawAble drawAble;
            public void SetDrawableObject(DrawAble obj)
            {
                drawAble = obj;
            }

          
            internal System.Drawing.Image imgOverlay;
            private string filename;
           
            public string Filename
            {
                set
                {
                    this.filename= value;
                }
                get
                {
                    return filename;
                }
            }
            public ImageSetting()
            {
               
            }
            /// <summary>
            /// create form in groupbox
            /// </summary>
            /// <param name="menu">menu of groupbox which create form</param>
            public void initializeSettingForm(IMenu menu)
            {
                this.BT_image = new System.Windows.Forms.Button();
                this.TB_image = new System.Windows.Forms.TextBox();
                this.LB_image = new System.Windows.Forms.Label();
                this.GB_basicprop = menu.GetPropertiesBox();
                this.GB_basicprop.SuspendLayout();
                
                // 
                // GB_basicprop
                // 
                this.GB_basicprop.Controls.Add(this.BT_image);
                this.GB_basicprop.Controls.Add(this.TB_image);
                this.GB_basicprop.Controls.Add(this.LB_image);
                // 
                // BT_image
                // 
                this.BT_image.Location = new System.Drawing.Point(141, 30);
                this.BT_image.Size = new System.Drawing.Size(77, 24);       
                this.BT_image.Click += new System.EventHandler(this.BT_image_Click);
                this.BT_image.Text = "Browse";
                this.BT_image.BackColor = Color.LightGreen;
                //
                //TB_image
                //
                this.TB_image.Text = filename;
                this.TB_image.Location = new System.Drawing.Point(11, 68);          
                this.TB_image.Size = new System.Drawing.Size(206, 70);
                this.TB_image.Multiline = true;
                this.TB_image.ReadOnly = true;
                this.TB_image.Cursor = Cursors.No;
                this.TB_image.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.0F,FontStyle.Bold);
                //
                //LB_image
                //
                this.LB_image.Location = new System.Drawing.Point(11, 30);
                this.LB_image.Text = "Image File";

                // 
                //LB Size
                // 
               
                this.GB_basicprop.ResumeLayout(false);
                this.GB_basicprop.PerformLayout();
                

                // 
            }
            private void BT_image_Click(object sender, EventArgs e)
            {
                OpenFileDialog opf = new OpenFileDialog();
                opf.Filter = "Image Files(*.BMP;*.JPG;*.GIF)|*.BMP;*.JPG;*.GIF";
                opf.ShowDialog();
                filename = opf.FileName;
                TB_image.Text = filename;
                if (File.Exists(filename))
                {
                    imgOverlay = Imager.Imager.CreateImage(filename);
                }
               

            }

        }
        /// <summary>
        /// draw point ,create Frame to send to network
        /// : DrawAble
        /// </summary>
        public class ImageDraw : DrawAble
        {
            public override Frame DrawableFrame
            {
                get
                {
                    return drawableFrame;
                }
            }
            #region Reference
            Image.ImageSetting setting;

            #endregion
            #region Construtor
            public ImageDraw(B b, Image.ImageSetting s)
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
                                setting = (Image.ImageSetting)board.ObjectsSetting.settings[(int)Basic2DObjects.Image];
                                possition = System.Drawing.Point.Empty;
                                drawableFrame = null;
                                this.board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                                //State = States.Start;
                            } break;
                        case States.Final:
                            {
                                board.backImage = (System.Drawing.Image)board.Board.Image.Clone();
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
                if ((ud != UpDowns.Down) && (ud != UpDowns.Neutral))
                {
                    MouseEventArgs meva = (MouseEventArgs)paras[2];
                    if (meva.Button == MouseButtons.Left)
                    {
                        if (File.Exists(setting.Filename))
                        {
                            drawableFrame = new Frame();
                            drawableFrame.data = Imager.Imager.CvImageToByteArray(setting.imgOverlay);
                            if (drawableFrame.data.Length <= 65255)
                            {

                                board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                                board.backImage = (System.Drawing.Image)board.Board.Image.Clone();
                                this.possition.X = (int)paras[0];
                                this.possition.Y = (int)paras[1];
                                State = States.Final;
                                return States.Extra;
                            }
                            else
                            {
                                MessageBox.Show(" Image too Large ");
                            }
                         
                        }
                    }
                }
                if (ud == UpDowns.Neutral)
                {
                    board.Board.Image = (System.Drawing.Image)board.backImage.Clone();
                    board.backImage = (System.Drawing.Image)board.Board.Image.Clone();
                    this.possition.X = (int)paras[0];
                    this.possition.Y = (int)paras[1];
                   
                    if(File.Exists(setting.Filename))
                    { 
                        Graphics g = Graphics.FromImage(board.Board.Image);
                        g.DrawImage(setting.imgOverlay,possition.X,possition.Y);
                        g.Dispose();
                    }

                   // g.DrawRectangle(new Pen(Brushes.Black), (float)possition.X+1, (float)possition.Y+1, setting.Size , setting.Size );
                   
                    board.Board.Refresh();
                }
                return States.Final;
            }
            protected override void Draw()
            {
                Graphics g_ = Graphics.FromImage(board.backImage);
                g_.DrawImage(setting.imgOverlay, possition.X, possition.Y);

                // g.FillRectangle(new SolidBrush(Color.White), (float)possition.X, (float)possition.Y, setting.Size + 2, setting.Size + 2);
                g_.Dispose();
                Graphics g = Graphics.FromImage(board.Board.Image);
                g.DrawImage(setting.imgOverlay, possition.X, possition.Y);
               
               // g.FillRectangle(new SolidBrush(Color.White), (float)possition.X, (float)possition.Y, setting.Size + 2, setting.Size + 2);
                g.Dispose();
                board.Board.Refresh();
            }
           
       
            protected override void FillFrame()
            {
               
                   
                    drawableFrame.type = FTYPE.DRAW;
                    drawableFrame.cmd = CMD.Image;
                    drawableFrame.para = new string[2];
                   
                    drawableFrame.para[0] = Possition.X.ToString();
                    drawableFrame.para[1] = Possition.Y.ToString();
                    drawableFrame.paraSize = 2 + drawableFrame.para[0].Length;//(10 = 2+8)
                    drawableFrame.paraSize += drawableFrame.para[1].Length;
                    
              
            }
            public void Send()
            {
                /*
                try
                {
                    byte[] data = new byte[250];
                    using (MemoryStream m = new MemoryStream(imgbuff, false))
                    {
                        do
                        {
                            int r= m.Read(data, 0, 250);
                            Frame fraecv me = new Frame();
                            frame.type = FTYPE.DRAW;
                            frame.cmd = CMD.Image;
                            frame.para = new string[2];
                            frame.data = data;
                            frame.para[0] = "data";
                            frame.para[1] = recv.ToString();
                            frame.paraSize = 6 + frame.para[1].Length;

                            board.Net.Send(frame);

                            Debug.Print(m.Position.ToString() + "data");
                        }
                        while (m.Length != m.Position);
                    }
                    Frame f;
                    f = new Frame();
                    f.data = null;
                    f.type = FTYPE.DRAW;
                    f.cmd = CMD.Image;
                    f.para = new string[1];
                    f.para[0] = "stop";
                    f.paraSize = 5;
                    board.Net.Send(f);
                    Debug.Print("stop_");

                    board.imgBlockState = false;
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.ToString()+" Send");
                }
                 * */

            }
        }
    }
}
