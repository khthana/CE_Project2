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
	public struct MyPolygon
	{
		public ArrayList Marks;
		public int Width;
		public int index;
		public string name;
		public string showname;
		public string desc;
		public int shopid;
	}
	
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

		public bool canDraw = false;
		private ArrayList Polygons = null;
		private int clickX = 0;
		private int clickY = 0;
		private bool isSelected = false;
		public Bitmap bmpBack = null;

		// Variable for drawing rectangle
		private int numIndex = 0;
		private int curSelectIndex = 0;
		private MarkControl curMovingMark;
		private System.Windows.Forms.ContextMenu contextMenu1;
		private System.Windows.Forms.MenuItem menuAreaInformation;
		private bool isDrawing = false;
		private bool isSelectedPoly = false;

		public Viewer()
		{

			// This call is required by the Windows.Forms Form Designer.
			InitializeComponent();		
			this.ImageSizeMode = SizeMode.RatioStretch;
			Polygons = new ArrayList();
			
                    
			bmpBack = new Bitmap(pictureBox1.Width,pictureBox1.Height);
			Graphics.FromImage(bmpBack).Clear(Color.Black);
			pictureBox1.Image = (Bitmap)bmpBack.Clone();

			this.Scrollable();
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
				this.Redraw();
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
			this.contextMenu1 = new System.Windows.Forms.ContextMenu();
			this.menuAreaInformation = new System.Windows.Forms.MenuItem();
			this.SuspendLayout();
			// 
			// pictureBox1
			// 
			this.pictureBox1.Cursor = System.Windows.Forms.Cursors.Default;
			this.pictureBox1.Location = new System.Drawing.Point(0, 0);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(568, 450);
			this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pictureBox1.TabIndex = 0;
			this.pictureBox1.TabStop = false;
			this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
			this.pictureBox1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.OnMouseUp);
			this.pictureBox1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.OnMouseMove);
			this.pictureBox1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.OnMouseDown);
			// 
			// contextMenu1
			// 
			this.contextMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																						 this.menuAreaInformation});
			this.contextMenu1.Popup += new System.EventHandler(this.contextMenu1_Popup);
			// 
			// menuAreaInformation
			// 
			this.menuAreaInformation.Index = 0;
			this.menuAreaInformation.Text = "Area Information...";
			this.menuAreaInformation.Click += new System.EventHandler(this.menuItem1_Click);
			// 
			// Viewer
			// 
			this.AutoScroll = true;
			this.BackColor = System.Drawing.Color.Black;
			this.Controls.Add(this.pictureBox1);
			this.Name = "Viewer";
			this.Size = new System.Drawing.Size(568, 456);
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
		{   Form1 tempForm = (Form1) this.ParentForm;
			tempForm.nameTextBox.Enabled = false;
			tempForm.showNameTextBox.Enabled= false;
			tempForm.descTextBox.Enabled= false;
			tempForm.idTextBox.Enabled= false;
			tempForm.Savebutton.Enabled = false;
			tempForm.ResetButton.Enabled = false;

			isSelectedPoly = false;

			if(!canDraw)
				return;

			// Left click = add new polygon
			if(e.Button == MouseButtons.Left)
			{		
				if(!isDrawing)
				{
					if(sender.ToString().Equals("PictureViewer.MarkControl"))
					{
						// Click on marker
						this.SuspendLayout();
						isSelected = true;
						clickX = e.X;
						clickY = e.Y;
						return;
					}	
					else if(getPolyByPoint(new Point(e.X, e.Y)).Width != -1)
					{
						// Show area information on form1
						MyPolygon p = (MyPolygon) Polygons[curSelectIndex];
						tempForm.nameTextBox.Enabled = true;
						tempForm.showNameTextBox.Enabled= true;
						tempForm.descTextBox.Enabled= true;
						tempForm.idTextBox.Enabled = true;
						tempForm.Savebutton.Enabled = true;
						tempForm.ResetButton.Enabled = true;

						tempForm.nameTextBox.Text = p.name;
						tempForm.showNameTextBox.Text = p.showname;
						tempForm.descTextBox.Text = p.desc;
						tempForm.idTextBox.Text = p.shopid.ToString();

						isSelectedPoly = true;
						//contextMenu1.Show(pictureBox1, new Point(e.X, e.Y));
					}
					else
					{
						//Adds red marks that are the beginning/end of the line
						MarkControl mark1 = new MarkControl();
						mark1.Location = new Point(e.X,e.Y);
						//	mark1.ContextMenu = linecmenu;
						pictureBox1.Controls.Add(mark1);

						//Events for moving marks
						mark1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.OnMouseUp);
						mark1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.OnMouseDown);
						mark1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.OnMouseMove);
						
						isDrawing = true;

						// Create new polygon
						MyPolygon curPolygon = new MyPolygon();
						curPolygon.Marks = new ArrayList();
						curPolygon.Marks.Add(mark1);
						curPolygon.Width = 1;
						curPolygon.index = numIndex;
						curPolygon.name = "";
						curPolygon.showname = "";
						curPolygon.desc = "";

						// Add to arraylist
						Polygons.Add(curPolygon);
					}
				}
				else
				{
					// Check that if user click on the first marker of this poly.
					// Mean that user wanna finish this current polygon
					if(sender.ToString().Equals("PictureViewer.MarkControl"))
					{
						MarkControl mc1 = (MarkControl)sender;
						if(checkIsBeginMark(mc1))
						{
							isDrawing = false;
							numIndex++;
						}
					}
					else
					{
						// Add more marker
						MarkControl mark2 = new MarkControl();
						mark2.Location = new Point(e.X,e.Y);
						//			mark2.ContextMenu = linecmenu;
						pictureBox1.Controls.Add(mark2);

						mark2.MouseUp += new System.Windows.Forms.MouseEventHandler(this.OnMouseUp);
						mark2.MouseDown += new System.Windows.Forms.MouseEventHandler(this.OnMouseDown);
						mark2.MouseMove += new System.Windows.Forms.MouseEventHandler(this.OnMouseMove);

						MyPolygon tempPolygon = (MyPolygon) Polygons[numIndex];
						tempPolygon.Marks.Add(mark2);
					}
						
				}
			}
          	else 	//Right click	
			{
				if(isDrawing)
				{
					// Cancel and delete current polygon
					MyPolygon tempPoly = (MyPolygon) Polygons[numIndex];
					Polygons.Remove(tempPoly);

					foreach( MarkControl mc in tempPoly.Marks)
					{
						mc.Dispose();
					}
					isDrawing = false;
				}
				else
				{
					// Right click = Delete selected polygon
					if(getPolyByPoint(new Point(e.X, e.Y)).Width != -1)
					{ 	
						// Delete current selected polygon
						MyPolygon tempPoly = (MyPolygon) Polygons[curSelectIndex];
						Polygons.Remove(tempPoly);

						foreach( MarkControl mc in tempPoly.Marks)
						{
							mc.Dispose();
						}
						
						if(numIndex > 0)
						{
							numIndex--;
						}
						else
							numIndex = 0;
					}
				}
			}

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
         
			foreach(MyPolygon l in Polygons)
			{
				DrawPolygon(l);
			}
		
			// Draw area around selected polygon
			if(isSelectedPoly)
			{
				// Init point array to match with marks in selected polygon
				MyPolygon p = (MyPolygon) Polygons[curSelectIndex];
				Point[] tempPoint = new Point[p.Marks.Count];

				int i = 0;
				foreach(MarkControl mc in p.Marks)
				{
					tempPoint[i] = mc.Center;
					i++;
				}
													
				Graphics g = null;
				g = Graphics.FromImage(pictureBox1.Image);
				g.FillPolygon(new System.Drawing.Drawing2D.HatchBrush(System.Drawing.Drawing2D.HatchStyle.Percent25, Color.Red, Color.Transparent), tempPoint);
				//g.FillPolygon(new System.Drawing.SolidBrush(Color.), tempPoint);
				g.Dispose();
			}

			// Refresh
			pictureBox1.Refresh();	

		}

		//Redraws all the lines and a part of the background
		private void Redraw(MyPolygon poly, Point p)
		{
			Graphics.FromImage(pictureBox1.Image).DrawImage(bmpBack,0,0,pictureBox1.Image.Width,
				pictureBox1.Image.Height);

			foreach(MyPolygon l in Polygons)
			{
				DrawPolygon(l);
			}

			Region r = getRegionByPolygon(poly,p);
			pictureBox1.Invalidate(r);
			pictureBox1.Update();
		}

		//Simply draws a line
		private void DrawPolygon(MyPolygon poly)
		{
			Graphics g = null;
					
			g = Graphics.FromImage(pictureBox1.Image);

			for(int i = 0; i < poly.Marks.Count-1; i++)
			{
				MarkControl tempMark1 = (MarkControl) poly.Marks[i];
				MarkControl tempMark2 = (MarkControl) poly.Marks[i+1];
				g.DrawLine(new Pen(Color.Black,(float)poly.Width), 
					tempMark1.Center.X, tempMark1.Center.Y,
					tempMark2.Center.X, tempMark2.Center.Y);
			}

			if(poly.index != numIndex)
			{
				// Draw close line
				MarkControl tempMark1 = (MarkControl) poly.Marks[0];
				MarkControl tempMark2 = (MarkControl) poly.Marks[poly.Marks.Count-1];
				g.DrawLine(new Pen(Color.Black,(float)poly.Width), 
					tempMark1.Center.X, tempMark1.Center.Y,
					tempMark2.Center.X, tempMark2.Center.Y);
			}

			//MessageBox.Show(poly.index.ToString());
			g.Dispose();
		}

		private void OnMouseUp(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			if(e.Button == MouseButtons.Left)
			{
				isSelected = false; 
				ResumeLayout();
				Redraw();
			}
		}

		private void OnMouseMove(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			if(isSelected)
			{			
				MarkControl mc1 = (MarkControl)sender;
				MyPolygon l = getPolyByMark(mc1);			
	
				Point p = new Point(e.X - clickX + mc1.Left, e.Y - clickY + mc1.Top);
				
				mc1.Location = p;
				
				Redraw(l,p);
			}		
		}

		//Retrieves a polygon object having a mark
		private MyPolygon getPolyByMark(MarkControl m)
		{
			foreach(MyPolygon l in Polygons)
			{
				foreach(MarkControl mc in l.Marks)
				{
					if(mc == m)
					{
						curMovingMark = mc;
						return l;	
					}
				}
			}

			MyPolygon tempPoly = new MyPolygon();
			tempPoly.Width = -1;
			return tempPoly;
		}

		//Retrieves a polygon object by point
		private MyPolygon getPolyByPoint(Point p)
		{
			int count = 0;

			foreach(MyPolygon l in Polygons)
			{
				bool isThisOne = false;

				// Init point array to match with marks in this polygon
				Point[] tempPoint = new Point[l.Marks.Count];

				int i = 0;
				foreach(MarkControl mc in l.Marks)
				{
					tempPoint[i] = mc.Center;
					i++;
				}
						
				if(isPointInPoly(tempPoint, p.X, p.Y))
					isThisOne = true;
			
				if(isThisOne)
				{
					curSelectIndex = count;
					return l;
				}

				count++;
			}

			MyPolygon tempPoly = new MyPolygon();
			tempPoly.Width = -1;
			return tempPoly;
		}

		// Check if this is a beginning marker of this polygon
		private bool checkIsBeginMark(MarkControl mc)
		{
			MyPolygon tempPoly = (MyPolygon) Polygons[numIndex];
			
			if(mc == (MarkControl)tempPoly.Marks[0])
				return true;
			else
				return false;
		}

		//Returns the region to update
		private Region getRegionByPolygon(MyPolygon l, Point p)
		{
			GraphicsPath gp = new GraphicsPath();

            // Init point array to match with marks in this polygon
			Point[] tempPoint = new Point[l.Marks.Count];

			int i = 0;
			foreach(MarkControl mc in l.Marks)
			{
                if(mc == curMovingMark)
				{
					tempPoint[i] = p;
				}
				else
					tempPoint[i] = mc.Center;

				i++;
			}
						
			gp.AddPolygon(tempPoint);
			
			RectangleF rf = gp.GetBounds();
			gp.Dispose();
			
			rf.Inflate(100f,100f);
			
			return new Region(rf);
		}

		public void UpdatePolygon(ArrayList al)
		{
			isSelectedPoly = false;
			// Clear polygon
			foreach(MyPolygon l in Polygons)
			{
				foreach( MarkControl mc in l.Marks)
				{
					mc.Dispose();
				}
			}
			numIndex = 0;
			isDrawing = false;

			// Create new polygon list
			Polygons = new ArrayList();

			foreach(MyPolygon l in al)
			{
				MyPolygon temp = new MyPolygon();
				temp.index = l.index;
				temp.Width = l.Width;
				temp.name = l.name;
				temp.showname = l.showname;
				temp.desc = l.desc;
				temp.shopid = l.shopid;

				temp.Marks = new ArrayList();

				foreach(MarkControl mc in l.Marks)
				{
					MarkControl mark2 = new MarkControl();
					mark2.Location = mc.Location;
					pictureBox1.Controls.Add(mark2);

					mark2.MouseUp += new System.Windows.Forms.MouseEventHandler(this.OnMouseUp);
					mark2.MouseDown += new System.Windows.Forms.MouseEventHandler(this.OnMouseDown);
					mark2.MouseMove += new System.Windows.Forms.MouseEventHandler(this.OnMouseMove);

					temp.Marks.Add(mark2);
				}
				
				Polygons.Add(temp);
				numIndex++;
			}
			
			// Redraw viewer
			Redraw();

		}

		public ArrayList GetPolygon()
		{
			return Polygons;
		}

		// Area information
		private void menuItem1_Click(object sender, System.EventArgs e)
		{
			AreaInformation dlg = new AreaInformation();

			// Show area information
			MyPolygon p = (MyPolygon) Polygons[curSelectIndex];
			dlg.AreaName = p.name;
			dlg.AreaShowName = p.showname;
			dlg.AreaDesc = p.desc;

			// Show dialog
			DialogResult res = dlg.ShowDialog();

			if(res == DialogResult.OK) 
			{
				// Save area data and reinsert into arraylist
				p.name = dlg.AreaName;
				p.showname = dlg.AreaShowName;
				p.desc = dlg.AreaDesc;

				Polygons.RemoveAt(curSelectIndex);
				Polygons.Insert(curSelectIndex, p);

			}

		}

		private bool isPointInPoly(Point[] p, int x, int y)
		{
			int i, j;
			bool c = false;
			for (i = 0, j = p.Length-1; i < p.Length; j = i++) 
			{
				if ((((p[i].Y <= y) && (y < p[j].Y)) ||
					((p[j].Y <= y) && (y < p[i].Y))) &&
					(x < (p[j].X - p[i].X) * (y - p[i].Y) / (p[j].Y - p[i].Y) + p[i].X))
					c = !c;
			}
			return c;
		}

		public void createNewBackground()
		{
			bmpBack = new Bitmap(pictureBox1.Width,pictureBox1.Height);
			Graphics.FromImage(bmpBack).Clear(Color.White);
			pictureBox1.Image = (Bitmap)bmpBack.Clone();
		}

		private void contextMenu1_Popup(object sender, System.EventArgs e)
		{
		
		}

		private void pictureBox1_Click(object sender, System.EventArgs e)
		{
		
		}
		public void Updatevalue(string name,string showname,string FlDesc,int shopid)
		{   
			MyPolygon p = (MyPolygon) Polygons[curSelectIndex];
			p.name = name;
			p.showname =showname;
		    p.desc = FlDesc;
			p.shopid = shopid;
			Polygons.RemoveAt(curSelectIndex);
			Polygons.Insert(curSelectIndex, p);
		}
	
		
	}
}
