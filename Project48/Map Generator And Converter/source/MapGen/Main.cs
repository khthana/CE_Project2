using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;

namespace MapGen
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		Image background = new Bitmap(500,500);
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.Button Save;
		private System.Windows.Forms.Button bLoad;
		private System.Windows.Forms.TextBox tID;
		private System.Windows.Forms.TextBox tDetail;
		private System.Windows.Forms.Button bSaveSVG;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.ComboBox cClass;
		private System.Windows.Forms.ComboBox cType;
		private System.Windows.Forms.Button bLoadImage;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.PictureBox mapbox;
		private System.Windows.Forms.Button bLoadSVG;
		private System.Windows.Forms.ListView listView1;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.ColumnHeader columnHeader2;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form1()
		{
			InitializeComponent();
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
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
			System.Windows.Forms.ListViewItem listViewItem1 = new System.Windows.Forms.ListViewItem("ID");
			System.Windows.Forms.ListViewItem listViewItem2 = new System.Windows.Forms.ListViewItem("Detail");
			System.Windows.Forms.ListViewItem listViewItem3 = new System.Windows.Forms.ListViewItem("Type");
			System.Windows.Forms.ListViewItem listViewItem4 = new System.Windows.Forms.ListViewItem("Clasee");
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.Save = new System.Windows.Forms.Button();
			this.bLoad = new System.Windows.Forms.Button();
			this.tID = new System.Windows.Forms.TextBox();
			this.tDetail = new System.Windows.Forms.TextBox();
			this.bSaveSVG = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.cClass = new System.Windows.Forms.ComboBox();
			this.cType = new System.Windows.Forms.ComboBox();
			this.label4 = new System.Windows.Forms.Label();
			this.bLoadImage = new System.Windows.Forms.Button();
			this.panel1 = new System.Windows.Forms.Panel();
			this.mapbox = new System.Windows.Forms.PictureBox();
			this.bLoadSVG = new System.Windows.Forms.Button();
			this.listView1 = new System.Windows.Forms.ListView();
			this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
			this.panel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// textBox1
			// 
			this.textBox1.Location = new System.Drawing.Point(8, 8);
			this.textBox1.Name = "textBox1";
			this.textBox1.Size = new System.Drawing.Size(72, 20);
			this.textBox1.TabIndex = 1;
			this.textBox1.Text = "textBox1";
			// 
			// Save
			// 
			this.Save.Location = new System.Drawing.Point(520, 232);
			this.Save.Name = "Save";
			this.Save.TabIndex = 4;
			this.Save.Text = "Save";
			this.Save.Click += new System.EventHandler(this.Save_Click);
			// 
			// bLoad
			// 
			this.bLoad.Location = new System.Drawing.Point(520, 264);
			this.bLoad.Name = "bLoad";
			this.bLoad.TabIndex = 5;
			this.bLoad.Text = "Load";
			this.bLoad.Click += new System.EventHandler(this.Load_Click);
			// 
			// tID
			// 
			this.tID.Location = new System.Drawing.Point(576, 336);
			this.tID.Name = "tID";
			this.tID.Size = new System.Drawing.Size(104, 20);
			this.tID.TabIndex = 6;
			this.tID.Text = "textBox2";
			// 
			// tDetail
			// 
			this.tDetail.Location = new System.Drawing.Point(576, 368);
			this.tDetail.Multiline = true;
			this.tDetail.Name = "tDetail";
			this.tDetail.Size = new System.Drawing.Size(104, 48);
			this.tDetail.TabIndex = 7;
			this.tDetail.Text = "textBox3";
			// 
			// bSaveSVG
			// 
			this.bSaveSVG.Location = new System.Drawing.Point(600, 232);
			this.bSaveSVG.Name = "bSaveSVG";
			this.bSaveSVG.TabIndex = 10;
			this.bSaveSVG.Text = "SaveSVG";
			this.bSaveSVG.Click += new System.EventHandler(this.bSaveSVG_Click);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(512, 336);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(16, 23);
			this.label1.TabIndex = 11;
			this.label1.Text = "ID";
			this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(512, 368);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(48, 23);
			this.label2.TabIndex = 12;
			this.label2.Text = "Detail";
			this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(512, 424);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(48, 23);
			this.label3.TabIndex = 13;
			this.label3.Text = "Type";
			this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// cClass
			// 
			this.cClass.Items.AddRange(new object[] {
														"building",
														"struct",
														"water",
														"road",
														"rail",
														"amphur"});
			this.cClass.Location = new System.Drawing.Point(576, 456);
			this.cClass.Name = "cClass";
			this.cClass.Size = new System.Drawing.Size(104, 21);
			this.cClass.TabIndex = 14;
			this.cClass.Text = "comboBox1";
			// 
			// cType
			// 
			this.cType.Items.AddRange(new object[] {
													   "polygon",
													   "polyline",
													   "point"});
			this.cType.Location = new System.Drawing.Point(576, 424);
			this.cType.Name = "cType";
			this.cType.Size = new System.Drawing.Size(104, 21);
			this.cType.TabIndex = 15;
			this.cType.Text = "comboBox1";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(512, 456);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(48, 23);
			this.label4.TabIndex = 16;
			this.label4.Text = "Class";
			this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// bLoadImage
			// 
			this.bLoadImage.Location = new System.Drawing.Point(512, 488);
			this.bLoadImage.Name = "bLoadImage";
			this.bLoadImage.Size = new System.Drawing.Size(80, 23);
			this.bLoadImage.TabIndex = 17;
			this.bLoadImage.Text = "Load Image";
			this.bLoadImage.Click += new System.EventHandler(this.bLoadImage_Click);
			// 
			// panel1
			// 
			this.panel1.AutoScroll = true;
			this.panel1.Controls.Add(this.mapbox);
			this.panel1.Location = new System.Drawing.Point(8, 24);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(500, 500);
			this.panel1.TabIndex = 18;
			// 
			// mapbox
			// 
			this.mapbox.BackColor = System.Drawing.SystemColors.Window;
			this.mapbox.Location = new System.Drawing.Point(0, 0);
			this.mapbox.Name = "mapbox";
			this.mapbox.Size = new System.Drawing.Size(500, 500);
			this.mapbox.TabIndex = 1;
			this.mapbox.TabStop = false;
			// 
			// bLoadSVG
			// 
			this.bLoadSVG.Location = new System.Drawing.Point(600, 264);
			this.bLoadSVG.Name = "bLoadSVG";
			this.bLoadSVG.TabIndex = 19;
			this.bLoadSVG.Text = "LoadSVG";
			this.bLoadSVG.Click += new System.EventHandler(this.bLoadSVG_Click);
			// 
			// listView1
			// 
			this.listView1.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																						this.columnHeader1,
																						this.columnHeader2});
			this.listView1.GridLines = true;
			this.listView1.Items.AddRange(new System.Windows.Forms.ListViewItem[] {
																					  listViewItem1,
																					  listViewItem2,
																					  listViewItem3,
																					  listViewItem4});
			this.listView1.Location = new System.Drawing.Point(520, 24);
			this.listView1.Name = "listView1";
			this.listView1.Size = new System.Drawing.Size(160, 192);
			this.listView1.TabIndex = 20;
			this.listView1.View = System.Windows.Forms.View.Details;
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Column";
			// 
			// columnHeader2
			// 
			this.columnHeader2.Text = "Value";
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(688, 526);
			this.Controls.Add(this.listView1);
			this.Controls.Add(this.bLoadSVG);
			this.Controls.Add(this.panel1);
			this.Controls.Add(this.bLoadImage);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.cType);
			this.Controls.Add(this.cClass);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.bSaveSVG);
			this.Controls.Add(this.tDetail);
			this.Controls.Add(this.tID);
			this.Controls.Add(this.textBox1);
			this.Controls.Add(this.bLoad);
			this.Controls.Add(this.Save);
			this.Name = "Form1";
			this.Text = "Form1";
			this.Load += new System.EventHandler(this.Form1_Load);
			this.panel1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion



		Font font;
		Brush brush;
		Pen pen;
		mapdata.allplace		places;
		mapdata.place			curplace;
		int dragi=-1;		// polygon selected
		int dragj=-1;		// point of polygon	
		Boolean drag=false;

		private void Form1_Load(object sender, System.EventArgs e)
		{
			font = new Font("ms sans serif",16);
			brush = new SolidBrush(Color.Blue);
			pen = new Pen(brush);

			places = new mapdata.allplace();

			mapbox.Image = new Bitmap(500,500);
			showpolys();
			mapbox.MouseDown+=new MouseEventHandler(mapbox_MouseDown);
			mapbox.MouseMove+=new MouseEventHandler(mapbox_MouseMove);
			mapbox.MouseUp+=new MouseEventHandler(mapbox_MouseUp);
		}


		private void mapbox_MouseMove(object sender, System.Windows.Forms.MouseEventArgs e) 
		{
			textBox1.Text = ((drag)?"drag":"")+ "x:"+e.X + " y:"+e.Y;
			if (drag)
			{
				places[dragi].points.RemoveAt(dragj);
				places[dragi].points.Insert(dragj,new PointF(e.X,e.Y));
				showpolys();
			}
		}

		private void mapbox_MouseUp(object sender, System.Windows.Forms.MouseEventArgs e) 
		{
			drag=false;
		}

		private void mapbox_MouseDown(object sender, System.Windows.Forms.MouseEventArgs e) 
		{	
			
			if(e.Button==MouseButtons.Right && e.Clicks==1)
			{
				if (curplace.points.Count>0)curplace.points.RemoveAt(curplace.points.Count-1);
				showpolys();
			}
			if(e.Button==MouseButtons.Left && e.Clicks==1)
			{
				if (curplace==null)
				{
					dragi=-1;
					dragj=-1;
					for(int i=0;i<places.places.Count;i++)
					{
						mapdata.place p = places[i];
						for(int j=0;j<p.points.Count;j++)
						{
							PointF point = (PointF)p.points[j];
							if (distance(point,e.X,e.Y)<5)
							{
								dragi = i;
								dragj = j;
								drag=true;
							}
						}
					}
					if(dragi==-1)
					{
						curplace = new mapdata.place(this.tID.Text,this.tDetail.Text,this.cType.Text,this.cClass.Text);
					}
					showpolys();
				}
				if (drag==false)
				{
					if(curplace.points.Count>0)
					{
						if(distance((PointF)curplace.points[curplace.points.Count-1],e.X,e.Y) > 5)
						{
							curplace.points.Add(new PointF(e.X,e.Y));
							showpolys();
						}
					}
					else
					{
						curplace.points.Add(new PointF(e.X,e.Y));
						showpolys();
					}
					
				}
			}
			if(e.Button==MouseButtons.Left && e.Clicks==2)
			{
				if (curplace.points.Count>1)
				{
					places.insert(curplace);
					curplace = null;
					showpolys();
				}
				//}
			}

		}


		private void showpolys()
		{
			Image temp = new Bitmap(background);
			Graphics gc = Graphics.FromImage(temp);
			//gc.Clear(Color.White);
			//gc.DrawImageUnscaled(background,0,0,mapbox.Width,mapbox.Height);
			for(int i=0;i<places.places.Count;i++)
			{
				//PointF[] p = (PointF[])((places[i]).points).ToArray(typeof(PointF));
				//gc.DrawPolygon(pen,p);
				places.draw(gc);
			}
			if(drag)
			{
				PointF[] p = (PointF[])((places[dragi]).points).ToArray(typeof(PointF));
				int cx = Convert.ToInt32(p[dragj].X);
				int cy = Convert.ToInt32(p[dragj].Y);
				gc.DrawEllipse(pen,cx-2,cy-2,4,4);
			}
			if (curplace!=null && curplace.points.Count>1)
			{
				PointF[] p = (PointF[])curplace.points.ToArray(typeof(PointF));
				gc.DrawLines(pen,p);
			}
			if(curplace!=null && !drag) for(int i=0;i<curplace.points.Count;i++) gc.DrawEllipse(pen,((PointF)curplace.points[i]).X-2,((PointF)curplace.points[i]).Y-2,4,4);
			gc.Dispose();	
			mapbox.Image = temp;
			//showlist
			//ListObject.Items.Clear();
			for(int i=0;i<places.places.Count;i++)
			{
				mapdata.place p = places[i];
				string[] t = new string[] {p.id,p.detail};
				ListViewItem l = new ListViewItem(t);
				l.Tag = i;
				//ListObject.Items.Add(l);
			}
		}


		int distance(int x1,int y1,int x2,int y2)
		{
			int dx=x1-x2;
			int dy=y1-y2;
			return (int)Math.Sqrt((dx*dx)+(dy*dy));
		}

		int distance(PointF p1,int x2,int y2)
		{
			int dx=Convert.ToInt32(p1.X)-x2;
			int dy=Convert.ToInt32(p1.Y)-y2;
			return (int)Math.Sqrt((dx*dx)+(dy*dy));
		}

		int distance(PointF p1,PointF p2)
		{
			int dx=Convert.ToInt32(p1.X)-Convert.ToInt32(p2.X);
			int dy=Convert.ToInt32(p1.Y)-Convert.ToInt32(p2.Y);
			return (int)Math.Sqrt((dx*dx)+(dy*dy));
		}



		private void Save_Click(object sender, System.EventArgs e)
		{
			places.exportdatabase();
		}

		private void Load_Click(object sender, System.EventArgs e)
		{
			places.importdatabase();
			showpolys();
		}

		private void bSaveSVG_Click(object sender, System.EventArgs e)
		{
			System.Windows.Forms.SaveFileDialog sf = new SaveFileDialog();
			sf.Filter = "SVG files (*.svg)|*.svg|All files (*.*)|*.*";
			sf.ShowDialog();
			if (sf.FileName!="") places.exportsvg(sf.FileName);
		}

		private void bLoadImage_Click(object sender, System.EventArgs e)
		{
			System.Windows.Forms.OpenFileDialog ofd=new OpenFileDialog(); 
			ofd.Filter="Imagefile Types|*.bmp;*.jpg;*.tif";
			ofd.ShowDialog();

			string filename = ofd.FileName;

			ofd.Dispose();
			
			
			background = new Bitmap(filename);
			mapbox.Width = background.Width;
			mapbox.Height = background.Height;

			showpolys();
		}

		private void bLoadSVG_Click(object sender, System.EventArgs e)
		{
			System.Windows.Forms.OpenFileDialog of = new OpenFileDialog();
			of.Filter = "SVG files (*.svg)|*.svg|All files (*.*)|*.*";
			of.ShowDialog();	
			if (of.FileName!="") places.importsvg(of.FileName);
			showpolys();
		}




	}


}
