using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Windows.Forms;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace PictureViewer
{
	public enum SizeMode
	{
		Scrollable,
		RatioStretch
	}
	/// <summary>
	/// Summary description for Viewer.
	/// </summary>
	public class Viewer : System.Windows.Forms.UserControl
	{
		private System.Windows.Forms.PictureBox pictureBox1;
		private System.ComponentModel.IContainer components;	
		private SizeMode sizeMode;

		private struct Line
		{
			public MarkControl mark1;
			public MarkControl mark2;
			public int Width;
		}

		private ArrayList Lines = null;
		private int clickX = 0;
		private int clickY = 0;
		private bool isSelected = false;
		public Bitmap bmpBack = null;

		public Viewer()
		{
			// This call is required by the Windows.Forms Form Designer.
			InitializeComponent();		
			this.ImageSizeMode = SizeMode.RatioStretch;
			Lines = new ArrayList();

			bmpBack = new Bitmap(pictureBox1.Width,pictureBox1.Height);
			Graphics.FromImage(bmpBack).Clear(Color.White);
			pictureBox1.Image = (Bitmap)bmpBack.Clone();
            
			this.SetStyle(ControlStyles.DoubleBuffer, true);
			this.SetStyle(ControlStyles.UserPaint, true);
			this.SetStyle(ControlStyles.AllPaintingInWmPaint, true);
		}

		/// <summary> 
		/// Clean up any resources being used.
		/// </summary>
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
		
		public Image Image
		{
			get{return this.pictureBox1.Image;}
			set
			{
				this.pictureBox1.Image = value;
				this.SetLayout();
				//this.ChangeSize();
			}
		}
		public SizeMode ImageSizeMode
		{
			get{return this.sizeMode;}
			set
			{						
				this.sizeMode = value;				
				this.AutoScroll = (this.sizeMode == SizeMode.Scrollable );				
				this.SetLayout();				
			}
		}

		private void RatioStretch()
		{
			float pRatio = (float)this.Width/this.Height;
			float imRatio = (float)this.pictureBox1.Image.Width/this.pictureBox1.Image.Height;

			if ( this.Width >= this.pictureBox1.Image.Width && this.Height >= this.pictureBox1.Image.Height )
			{				
				this.pictureBox1.Width = this.pictureBox1.Image.Width;
				this.pictureBox1.Height = this.pictureBox1.Image.Height;				
			}
			else if( this.Width > this.pictureBox1.Image.Width && this.Height < this.pictureBox1.Image.Height)
			{
				this.pictureBox1.Height = this.Height;
				this.pictureBox1.Width = (int)(this.Height * imRatio);			
			}
			else if( this.Width < this.pictureBox1.Image.Width && this.Height > this.pictureBox1.Image.Height)
			{				
				this.pictureBox1.Width = this.Width;
				this.pictureBox1.Height = (int)(this.Width / imRatio);									
			}
			else if ( this.Width < this.pictureBox1.Image.Width && this.Height < this.pictureBox1.Image.Height )
			{
				if (this.Width >= this.Height )
				{
					//width image
					if ( this.pictureBox1.Image.Width >= this.pictureBox1.Image.Height && imRatio >= pRatio )
					{
						this.pictureBox1.Width = this.Width;
						this.pictureBox1.Height = (int)(this.Width / imRatio);
					}
					else
					{							
						this.pictureBox1.Height = this.Height;
						this.pictureBox1.Width = (int)(this.Height * imRatio);
					}					
				}
				else
				{
					//width image
					if ( this.pictureBox1.Image.Width < this.pictureBox1.Image.Height && imRatio < pRatio )
					{						
						this.pictureBox1.Height = this.Height;
						this.pictureBox1.Width = (int)(this.Height * imRatio);
					}
					else // height image
					{													
						this.pictureBox1.Width = this.Width;
						this.pictureBox1.Height = (int)(this.Width / imRatio);						
					}
				}
			}			
			this.CenterImage();
		}
		private void Scrollable()
		{
			this.pictureBox1.Width = this.pictureBox1.Image.Width;
			this.pictureBox1.Height = this.pictureBox1.Image.Height;
			this.CenterImage();
		}
		private void SetLayout()
		{
			if ( this.pictureBox1.Image == null )
				return;
			if ( this.sizeMode == SizeMode.RatioStretch )
				this.RatioStretch();
			else
			{
				this.AutoScroll = false;
				this.Scrollable();	
				this.AutoScroll = true;
			
			}
		}
		private void CenterImage()
		{
			int top = (int)((this.Height - this.pictureBox1.Height)/2.0);
			int left = (int)((this.Width - this.pictureBox1.Width)/2.0);
			if ( top < 0 )
				top = 0;
			if ( left < 0 )
				left = 0;
			this.pictureBox1.Top = top;
			this.pictureBox1.Left = left;		
		}

		#region Component Designer generated code
		/// <summary> 
		/// Required method for Designer support - do not modify 
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.SuspendLayout();
			// 
			// pictureBox1
			// 
			this.pictureBox1.Cursor = System.Windows.Forms.Cursors.Default;
			this.pictureBox1.Location = new System.Drawing.Point(24, 32);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(296, 208);
			this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pictureBox1.TabIndex = 0;
			this.pictureBox1.TabStop = false;
			this.pictureBox1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.OnMouseUp);
			this.pictureBox1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.OnMouseMove);
			this.pictureBox1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.OnMouseDown);
			// 
			// Viewer
			// 
			this.AutoScroll = true;
			this.BackColor = System.Drawing.Color.Black;
			this.Controls.Add(this.pictureBox1);
			this.Name = "Viewer";
			this.Size = new System.Drawing.Size(352, 272);
			this.Resize += new System.EventHandler(this.Viewer_Resize);
			this.Load += new System.EventHandler(this.Viewer_Load);
			this.ResumeLayout(false);

		}
		#endregion

		private void Viewer_Load(object sender, System.EventArgs e)
		{
			this.pictureBox1.Width = 0;
			this.pictureBox1.Height = 0;
			this.SetLayout();
		}

		private void Viewer_Resize(object sender, System.EventArgs e)
		{
			this.SetLayout();
		}

		private void OnMouseDown(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			// If click on marker
			if(sender.ToString().Equals("PictureViewer.MarkControl"))
			{
				this.SuspendLayout();
				isSelected = true;
				clickX = e.X;
				clickY = e.Y;
				return;
			}

			//Adds red marks that are the beginning/end of the line
			MarkControl mark1 = new MarkControl();
			mark1.Location = new Point(e.X,e.Y);
//			mark1.ContextMenu = linecmenu;
			pictureBox1.Controls.Add(mark1);
			
			MarkControl mark2 = new MarkControl();
			mark2.Location = new Point(100,100);
//			mark2.ContextMenu = linecmenu;
			pictureBox1.Controls.Add(mark2);

			//Line Struct contains the information for a single line
			Line line = new Line();
			line.mark1 = mark1;
			line.mark2 = mark2;
			line.Width = 1;


			//Events for moving marks
			mark1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.OnMouseUp);
			mark1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.OnMouseDown);
			mark1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.OnMouseMove);

			mark2.MouseUp += new System.Windows.Forms.MouseEventHandler(this.OnMouseUp);
			mark2.MouseDown += new System.Windows.Forms.MouseEventHandler(this.OnMouseDown);
			mark2.MouseMove += new System.Windows.Forms.MouseEventHandler(this.OnMouseMove);

			//Adds Line object to an arraylist
			Lines.Add(line);
			Redraw();
		}
		

		//Redraws all the lines and the background too
		private void Redraw()
		{
			if(bmpBack!=null)
				pictureBox1.Image = (Bitmap)bmpBack.Clone();
			else 
			{
				pictureBox1.Image = new Bitmap(pictureBox1.Width,pictureBox1.Height);
				Graphics.FromImage(pictureBox1.Image).Clear(Color.Transparent);
			}
         
			foreach(Line l in Lines)
			{
				DrawLine(l);
			}
			pictureBox1.Refresh();	
		}

		//Redraws all the lines and a part of the background
		private void Redraw(Line line, Point p)
		{
			Graphics.FromImage(pictureBox1.Image).DrawImage(bmpBack,0,0,pictureBox1.Image.Width,
				pictureBox1.Image.Height);

			foreach(Line l in Lines)
			{
				DrawLine(l);
			}

			Region r = getRegionByLine(line,p);
			pictureBox1.Invalidate(r);
			pictureBox1.Update();
		}

		//Simply draws a line
		private void DrawLine(Line line)
		{
			Graphics g = null;
					
			g = Graphics.FromImage(pictureBox1.Image);
			g.DrawLine(new Pen(Color.Black,(float)line.Width),line.mark1.Center.X,line.mark1.Center.Y,line.mark2.Center.X,line.mark2.Center.Y);		
			g.Dispose();
		}

		private void OnMouseUp(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			isSelected = false; 
			ResumeLayout();
			Redraw();
		}

		private void OnMouseMove(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			if(isSelected)
			{			
				MarkControl mc1 = (MarkControl)sender;
				Line l = getLineByMark(mc1);			
	
				Point p = new Point(e.X - clickX + mc1.Left, e.Y - clickY + mc1.Top);
				
				mc1.Location = p;
				
				Redraw(l,p);
			}		
		}

		//Retrieves a Line object having a mark
		private Line getLineByMark(MarkControl m)
		{
			foreach(Line l in Lines)
			{
				if(l.mark1 == m || l.mark2 == m)
					return l;	
			}

			Line tempLine = new Line();
			tempLine.Width = -1;
			return tempLine;
		}

		//Returns the region to update
		private Region getRegionByLine(Line l, Point p)
		{
			GraphicsPath gp = new GraphicsPath();
			gp.AddPolygon(new Point[]{l.mark1.Center,l.mark2.Center,p,l.mark1.Center});
			
			RectangleF rf = gp.GetBounds();
			gp.Dispose();
			
			rf.Inflate(100f,100f);
			
			return new Region(rf);
		}

	}
}
