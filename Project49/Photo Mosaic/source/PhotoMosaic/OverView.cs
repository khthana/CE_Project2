using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace PhotoMosaic
{
	public class OverView : System.Windows.Forms.Form
	{
		private System.Windows.Forms.PictureBox pic_show;

		private System.ComponentModel.Container components = null;
        private bool isRectangle;
        private double tileWidth;
		public OverView()
		{
            InitializeComponent();
		}

        public bool Polygon
        {
            get
            {
                return isRectangle;
            }
            set
            {
                isRectangle = value;
            }
        }
       public double TileWidth
        {
            get
            {
                return tileWidth;
            }
            set
            {
                tileWidth = value;
            }
        }
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(OverView));
            this.pic_show = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pic_show)).BeginInit();
            this.SuspendLayout();
            // 
            // pic_show
            // 
            this.pic_show.Image = ((System.Drawing.Image)(resources.GetObject("pic_show.Image")));
            this.pic_show.Location = new System.Drawing.Point(16, 16);
            this.pic_show.Name = "pic_show";
            this.pic_show.Size = new System.Drawing.Size(409, 478);
            this.pic_show.TabIndex = 0;
            this.pic_show.TabStop = false;
            // 
            // OverView
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(446, 521);
            this.Controls.Add(this.pic_show);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "OverView";
            this.Text = "OverView";
            this.Load += new System.EventHandler(this.OverView_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pic_show)).EndInit();
            this.ResumeLayout(false);

		}
		#endregion
		public int NoTileWidth = 0;
		public int NoTileHeight = 0;
		private void OverView_Load(object sender, System.EventArgs e)
		{
            if (isRectangle)
                CreateRectangle();
            else
                CreateHexagon();
		}

        private void CreateRectangle()
        {
            int width = PhotoMosaic.bit_original_show.Width;
            int height = PhotoMosaic.bit_original_show.Height;
            if (width > height)
            {
                width = pic_show.Width;
                height = width * height / PhotoMosaic.bit_original_show.Width;
            }
            else
            {
                height = pic_show.Height;
                width = height * width / PhotoMosaic.bit_original_show.Height;
            }
            Bitmap bmp = new Bitmap(PhotoMosaic.bit_original_show, width, height);
            pic_show.Width = bmp.Width;
            pic_show.Height = bmp.Height;
            this.Width = bmp.Width + 3 * pic_show.Left;
            this.Height = bmp.Height + 4 * pic_show.Top;

            width = bmp.Width / NoTileWidth;
            height = bmp.Height / NoTileHeight;
            int CarryWidth = bmp.Width % NoTileWidth;
            int CarryHeight = bmp.Height % NoTileHeight;
            int startHeight = 0;
            //int R = 0,G =0, B =0;
            for (int i = 0; i < NoTileHeight; i++)
            {
                int startWidth = 0;
                int OneHeight = 0;
                if (i < CarryHeight)
                    OneHeight = 1;
                for (int j = 0; j < NoTileWidth; j++)
                {
                    int OneWidth = 0;
                    if (j < CarryWidth)
                        OneWidth = 1;
                    int count = 0;
                    int R = 0, G = 0, B = 0;
                    for (int k = startHeight; k < startHeight + height + OneHeight; k++)
                        for (int l = startWidth; l < startWidth + width + OneWidth; l++)
                        {
                            count++;
                            R += bmp.GetPixel(l, k).R;
                            G += bmp.GetPixel(l, k).G;
                            B += bmp.GetPixel(l, k).B;
                        }
                    R /= count; B /= count; G /= count;
                    for (int k = startHeight; k < startHeight + height + OneHeight; k++)
                        for (int l = startWidth; l < startWidth + width + OneWidth; l++)
                        {
                            bmp.SetPixel(l, k, Color.FromArgb(R, G, B));
                        }
                    startWidth += width + OneWidth;
                }
                startHeight += height + OneHeight;
            }
            pic_show.Image = bmp;
            pic_show.Refresh();
        }

        private void CreateHexagon()
        {
            int width = PhotoMosaic.bit_original_show.Width;
            int height = PhotoMosaic.bit_original_show.Height;
            if (width > height)
            {
                width = pic_show.Width;
                height = width * height / PhotoMosaic.bit_original_show.Width;
            }
            else
            {
                height = pic_show.Height;
                width = height * width / PhotoMosaic.bit_original_show.Height;
            }
            Bitmap bmp = new Bitmap(PhotoMosaic.bit_original_show, width, height);
            pic_show.Width = bmp.Width;
            pic_show.Height = bmp.Height;
            this.Width = bmp.Width + 3 * pic_show.Left;
            this.Height = bmp.Height + 4 * pic_show.Top;

            //width = bmp.Width / NoTileWidth;
            //height = bmp.Height / NoTileHeight;
            

            //---------
            int oldwidth = width;
            int oldheight = height;
            double RHexa = (double)(width - TileWidth) /TileWidth;
            RHexa /= (double)2;
            RHexa = RHexa / (double)Math.Cos(Math.PI / 6);
			int r = Convert.ToInt16(RHexa);
			int rsin30 = Convert.ToInt16(r*Math.Sin(Math.PI/6));
			int rcos30 = Convert.ToInt16(r*Math.Cos(Math.PI/6));
			int blockX = width/(2*rcos30) + 3;
			int blockY =height/((3*r)/2) +3;

			Bitmap bit_original = new Bitmap(width+(4*rcos30),height+(4*r));
			Graphics original = Graphics.FromImage(bit_original);
			original.FillRectangle(new SolidBrush(Color.Gray),0,0,bit_original.Width,bit_original.Height);
			original.DrawImage(bmp,rcos30,r/2,width,height);
			bmp = new Bitmap(bit_original);
			
			SolidBrush brush = new SolidBrush(Color.White);
			Point p1 = new Point(Convert.ToInt32(r*Math.Cos(Math.PI/6))-1,1);
			Point p2 =new Point(0,Convert.ToInt16(r*Math.Sin(Math.PI/6)));
			Point p3 =new Point(2*Convert.ToInt16(r*Math.Cos(Math.PI/6))-1,Convert.ToInt16(r*Math.Sin(Math.PI/6))+1);
			Point p4 = new Point(0,Convert.ToInt32(r*Math.Sin(Math.PI/6))+r);
			Point p5 = new Point(2*Convert.ToInt16(r*Math.Cos(Math.PI/6))-1,Convert.ToInt32(r*Math.Sin(Math.PI/6))+r-1);
			Point p6 =new Point(Convert.ToInt32(r*Math.Cos(Math.PI/6))-1,(2*Convert.ToInt16(r*Math.Sin(Math.PI/6))) +r);		
			Bitmap b_hexagon = new Bitmap(2*r,2*r);	
			Graphics g = Graphics.FromImage(b_hexagon);
			g.FillPolygon(brush,new Point[]{p1,p2,p4,p6,p5,p3});
			int[,] DelayOriginalHex = new int[blockX,blockY];
			int[,] ElementOriginalHex =  new int[blockX,blockY];

			int startX = 0;
			int startY = 0;			
			int ElementY =0;

			height = bit_original.Height/(r+rsin30);
			if(bit_original.Height - (height * (r+rsin30)) < rsin30)
				height --;
			
            //วนทั้งภาพ
			while(startY <= bit_original.Height- (r*2))
			{
				int ElementX =0;
				if(ElementY%2 == 0)
				startX = 0;
				else
				startX = Convert.ToInt16(r*Math.Cos(Math.PI/6));
				while(startX <= bit_original.Width - (2*Convert.ToInt16(r*Math.Cos(Math.PI/6))))
				{
					int c = 0;
                    int[] for_i = new int[] { 0, r, 0, r, r, 2 * r, r, 2 * r };
                    int[] for_j = new int[] { 0, rcos30, rcos30, 2 * rcos30, 0, rcos30, rcos30, 2 * rcos30 };
                    //เก็บสีที่ main photo
                    //Bitmap picMain = new Bitmap(1, 1);
                    c = 0;
                    int R = 0, G = 0, B = 0;
					for(int k =0; k< for_i.Length;k+=2)
					{
						for(int i = for_i[k]; i < for_i[k+1];i++)
							for(int j = for_j[k]; j <for_j[k+1];j++)
								if(b_hexagon.GetPixel(j,i).R == 255 && b_hexagon.GetPixel(j,i).G == 255 && b_hexagon.GetPixel(j,i).B == 255)
								{
									R += bit_original.GetPixel(j+startX,i+startY).R;
									G += bit_original.GetPixel(j+startX,i+startY).G;
									B += bit_original.GetPixel(j+startX,i+startY).B;
									c++;
								}  
					}
                    R /= c; G /= c; B /= c;
                    //picMain.SetPixel(k / 4, (k / 2) % 2, Color.FromArgb(R / c, G / c, B / c));
                    //Paint
                    for (int k = 0; k < for_i.Length; k += 2)
                    {
                        for (int i = for_i[k]; i < for_i[k + 1]; i++)
                            for (int j = for_j[k]; j < for_j[k + 1]; j++)
                                if (b_hexagon.GetPixel(j, i).R == 255 && b_hexagon.GetPixel(j, i).G == 255 && b_hexagon.GetPixel(j, i).B == 255)
                                {
                                    bmp.SetPixel(j + startX, i + startY, Color.FromArgb(R,G,B));
                                }
                    }
                    startX += 2 * Convert.ToInt16(r * Math.Cos(Math.PI / 6));
                    ElementX++;
                }
                startY += (r * 3) / 2;
                ElementY++;
            }
            Bitmap bit_temp = new Bitmap(bmp);
            bmp = new Bitmap(oldwidth, oldheight);
            for (int i = 0; i < oldheight; i++)
                for (int j = 0; j < oldwidth; j++)
                {
                    bmp.SetPixel(j, i, bit_temp.GetPixel(j + rcos30, i + r / 2));
                }
            pic_show.Image = bmp;
            pic_show.Refresh();
        } 
	}
}
