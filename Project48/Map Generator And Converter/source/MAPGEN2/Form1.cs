using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using GeoCon.Data;
using GeoCon.Classification;
using mapdata;

namespace MAPGEN2
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.MenuItem menuItem1;
		private System.Windows.Forms.MenuItem menuItem2;
		private System.Windows.Forms.MenuItem menuItem3;
		private System.Windows.Forms.ToolBar toolBar1;
		private System.Windows.Forms.CheckedListBox Layers;
		private System.Windows.Forms.ToolBarButton bmoveup;
		private System.Windows.Forms.ToolBarButton bmovedown;
		private System.Windows.Forms.ToolBarButton bZoomin;
		private System.Windows.Forms.ToolBarButton bZoomout;
		private System.Windows.Forms.ToolBarButton bZoomorigin;
		private System.Windows.Forms.TabControl tabControl1;
		private System.Windows.Forms.Panel mappanel;
		private System.Windows.Forms.MenuItem menuItem4;
		private System.Windows.Forms.MenuItem menuItem5;
		private System.Windows.Forms.MenuItem menuItem6;
		private System.Windows.Forms.MenuItem menuItem7;
		private System.Windows.Forms.MenuItem menuItem8;
		private System.Windows.Forms.MenuItem menuItem9;
		private System.Windows.Forms.DataGrid GridField;
		private System.Windows.Forms.TabPage tViewField;
		private System.Windows.Forms.TabPage tViewData;
		private System.Windows.Forms.DataGrid GridData;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Panel border;
		private System.Windows.Forms.MenuItem menuItem10;
		private System.Windows.Forms.MenuItem menuItem11;
		private System.Windows.Forms.TabPage tViewTable;
		private System.Windows.Forms.DataGrid GridTable;
		private System.Windows.Forms.ToolBarButton CreateMap;
		private System.Windows.Forms.MenuItem menuItem12;
		private System.Windows.Forms.MenuItem menuItem13;
		private System.Windows.Forms.MenuItem menuItem14;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
			mappanel.Paint+=new PaintEventHandler(mappanel_Paint);
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
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.menuItem1 = new System.Windows.Forms.MenuItem();
			this.menuItem2 = new System.Windows.Forms.MenuItem();
			this.menuItem3 = new System.Windows.Forms.MenuItem();
			this.menuItem7 = new System.Windows.Forms.MenuItem();
			this.menuItem8 = new System.Windows.Forms.MenuItem();
			this.menuItem4 = new System.Windows.Forms.MenuItem();
			this.menuItem5 = new System.Windows.Forms.MenuItem();
			this.menuItem6 = new System.Windows.Forms.MenuItem();
			this.menuItem9 = new System.Windows.Forms.MenuItem();
			this.menuItem10 = new System.Windows.Forms.MenuItem();
			this.menuItem11 = new System.Windows.Forms.MenuItem();
			this.menuItem12 = new System.Windows.Forms.MenuItem();
			this.menuItem13 = new System.Windows.Forms.MenuItem();
			this.toolBar1 = new System.Windows.Forms.ToolBar();
			this.bZoomin = new System.Windows.Forms.ToolBarButton();
			this.bZoomout = new System.Windows.Forms.ToolBarButton();
			this.bZoomorigin = new System.Windows.Forms.ToolBarButton();
			this.CreateMap = new System.Windows.Forms.ToolBarButton();
			this.bmoveup = new System.Windows.Forms.ToolBarButton();
			this.bmovedown = new System.Windows.Forms.ToolBarButton();
			this.Layers = new System.Windows.Forms.CheckedListBox();
			this.tabControl1 = new System.Windows.Forms.TabControl();
			this.tViewField = new System.Windows.Forms.TabPage();
			this.GridField = new System.Windows.Forms.DataGrid();
			this.tViewData = new System.Windows.Forms.TabPage();
			this.GridData = new System.Windows.Forms.DataGrid();
			this.tViewTable = new System.Windows.Forms.TabPage();
			this.GridTable = new System.Windows.Forms.DataGrid();
			this.mappanel = new System.Windows.Forms.Panel();
			this.panel1 = new System.Windows.Forms.Panel();
			this.border = new System.Windows.Forms.Panel();
			this.menuItem14 = new System.Windows.Forms.MenuItem();
			this.tabControl1.SuspendLayout();
			this.tViewField.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.GridField)).BeginInit();
			this.tViewData.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.GridData)).BeginInit();
			this.tViewTable.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.GridTable)).BeginInit();
			this.panel1.SuspendLayout();
			this.border.SuspendLayout();
			this.SuspendLayout();
			// 
			// mainMenu1
			// 
			this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem1,
																					  this.menuItem10,
																					  this.menuItem13,
																					  this.menuItem14});
			// 
			// menuItem1
			// 
			this.menuItem1.Index = 0;
			this.menuItem1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem2,
																					  this.menuItem4,
																					  this.menuItem9});
			this.menuItem1.Text = "File";
			// 
			// menuItem2
			// 
			this.menuItem2.Index = 0;
			this.menuItem2.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem3,
																					  this.menuItem7,
																					  this.menuItem8});
			this.menuItem2.Text = "Import";
			// 
			// menuItem3
			// 
			this.menuItem3.Index = 0;
			this.menuItem3.Text = "SHP File";
			this.menuItem3.Click += new System.EventHandler(this.menuItem3_Click);
			// 
			// menuItem7
			// 
			this.menuItem7.Index = 1;
			this.menuItem7.Text = "SVG File";
			this.menuItem7.Click += new System.EventHandler(this.menuItem7_Click);
			// 
			// menuItem8
			// 
			this.menuItem8.Index = 2;
			this.menuItem8.Text = "GML File";
			this.menuItem8.Click += new System.EventHandler(this.menuItem8_Click);
			// 
			// menuItem4
			// 
			this.menuItem4.Index = 1;
			this.menuItem4.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem5,
																					  this.menuItem6});
			this.menuItem4.Text = "Export";
			this.menuItem4.Click += new System.EventHandler(this.menuItem4_Click);
			// 
			// menuItem5
			// 
			this.menuItem5.Index = 0;
			this.menuItem5.Text = "SVG File";
			this.menuItem5.Click += new System.EventHandler(this.menuItem5_Click);
			// 
			// menuItem6
			// 
			this.menuItem6.Index = 1;
			this.menuItem6.Text = "GML File";
			this.menuItem6.Click += new System.EventHandler(this.menuItem6_Click);
			// 
			// menuItem9
			// 
			this.menuItem9.Index = 2;
			this.menuItem9.Text = "Exit";
			this.menuItem9.Click += new System.EventHandler(this.menuItem9_Click);
			// 
			// menuItem10
			// 
			this.menuItem10.Index = 1;
			this.menuItem10.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					   this.menuItem11,
																					   this.menuItem12});
			this.menuItem10.Text = "Database";
			// 
			// menuItem11
			// 
			this.menuItem11.Index = 0;
			this.menuItem11.Text = "Save";
			this.menuItem11.Click += new System.EventHandler(this.menuItem11_Click);
			// 
			// menuItem12
			// 
			this.menuItem12.Index = 1;
			this.menuItem12.Text = "Load";
			this.menuItem12.Click += new System.EventHandler(this.menuItem12_Click);
			// 
			// menuItem13
			// 
			this.menuItem13.Index = 2;
			this.menuItem13.Text = "Create";
			this.menuItem13.Click += new System.EventHandler(this.menuItem13_Click);
			// 
			// toolBar1
			// 
			this.toolBar1.Buttons.AddRange(new System.Windows.Forms.ToolBarButton[] {
																						this.bZoomin,
																						this.bZoomout,
																						this.bZoomorigin,
																						this.CreateMap,
																						this.bmoveup,
																						this.bmovedown});
			this.toolBar1.DropDownArrows = true;
			this.toolBar1.Location = new System.Drawing.Point(0, 0);
			this.toolBar1.Name = "toolBar1";
			this.toolBar1.ShowToolTips = true;
			this.toolBar1.Size = new System.Drawing.Size(568, 42);
			this.toolBar1.TabIndex = 3;
			this.toolBar1.ButtonClick += new System.Windows.Forms.ToolBarButtonClickEventHandler(this.toolBar1_ButtonClick);
			// 
			// bZoomin
			// 
			this.bZoomin.Text = "Zoom In";
			// 
			// bZoomout
			// 
			this.bZoomout.Text = "Zoom Out";
			// 
			// bZoomorigin
			// 
			this.bZoomorigin.Text = "Zoom normal";
			// 
			// CreateMap
			// 
			this.CreateMap.Text = "Create Map";
			// 
			// bmoveup
			// 
			this.bmoveup.Text = "Move Up";
			// 
			// bmovedown
			// 
			this.bmovedown.Text = "Move Down";
			// 
			// Layers
			// 
			this.Layers.Dock = System.Windows.Forms.DockStyle.Fill;
			this.Layers.Location = new System.Drawing.Point(0, 0);
			this.Layers.Name = "Layers";
			this.Layers.Size = new System.Drawing.Size(300, 64);
			this.Layers.TabIndex = 4;
			this.Layers.SelectedIndexChanged += new System.EventHandler(this.Layers_SelectedIndexChanged);
			// 
			// tabControl1
			// 
			this.tabControl1.Controls.Add(this.tViewField);
			this.tabControl1.Controls.Add(this.tViewData);
			this.tabControl1.Controls.Add(this.tViewTable);
			this.tabControl1.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.tabControl1.Location = new System.Drawing.Point(0, 67);
			this.tabControl1.Name = "tabControl1";
			this.tabControl1.SelectedIndex = 0;
			this.tabControl1.Size = new System.Drawing.Size(300, 300);
			this.tabControl1.TabIndex = 6;
			// 
			// tViewField
			// 
			this.tViewField.Controls.Add(this.GridField);
			this.tViewField.Location = new System.Drawing.Point(4, 22);
			this.tViewField.Name = "tViewField";
			this.tViewField.Size = new System.Drawing.Size(292, 274);
			this.tViewField.TabIndex = 1;
			this.tViewField.Text = "View Field";
			// 
			// GridField
			// 
			this.GridField.DataMember = "";
			this.GridField.Dock = System.Windows.Forms.DockStyle.Fill;
			this.GridField.HeaderForeColor = System.Drawing.SystemColors.ControlText;
			this.GridField.Location = new System.Drawing.Point(0, 0);
			this.GridField.Name = "GridField";
			this.GridField.Size = new System.Drawing.Size(292, 274);
			this.GridField.TabIndex = 0;
			// 
			// tViewData
			// 
			this.tViewData.Controls.Add(this.GridData);
			this.tViewData.Location = new System.Drawing.Point(4, 22);
			this.tViewData.Name = "tViewData";
			this.tViewData.Size = new System.Drawing.Size(292, 274);
			this.tViewData.TabIndex = 2;
			this.tViewData.Text = "View Data";
			// 
			// GridData
			// 
			this.GridData.DataMember = "";
			this.GridData.Dock = System.Windows.Forms.DockStyle.Fill;
			this.GridData.HeaderForeColor = System.Drawing.SystemColors.ControlText;
			this.GridData.Location = new System.Drawing.Point(0, 0);
			this.GridData.Name = "GridData";
			this.GridData.Size = new System.Drawing.Size(292, 274);
			this.GridData.TabIndex = 0;
			// 
			// tViewTable
			// 
			this.tViewTable.Controls.Add(this.GridTable);
			this.tViewTable.Location = new System.Drawing.Point(4, 22);
			this.tViewTable.Name = "tViewTable";
			this.tViewTable.Size = new System.Drawing.Size(292, 274);
			this.tViewTable.TabIndex = 3;
			this.tViewTable.Text = "View Table";
			// 
			// GridTable
			// 
			this.GridTable.DataMember = "";
			this.GridTable.Dock = System.Windows.Forms.DockStyle.Fill;
			this.GridTable.HeaderForeColor = System.Drawing.SystemColors.ControlText;
			this.GridTable.Location = new System.Drawing.Point(0, 0);
			this.GridTable.Name = "GridTable";
			this.GridTable.Size = new System.Drawing.Size(292, 274);
			this.GridTable.TabIndex = 0;
			// 
			// mappanel
			// 
			this.mappanel.AutoScroll = true;
			this.mappanel.Location = new System.Drawing.Point(0, 0);
			this.mappanel.Name = "mappanel";
			this.mappanel.Size = new System.Drawing.Size(248, 256);
			this.mappanel.TabIndex = 2;
			this.mappanel.Paint += new System.Windows.Forms.PaintEventHandler(this.mappanel_Paint);
			// 
			// panel1
			// 
			this.panel1.Controls.Add(this.Layers);
			this.panel1.Controls.Add(this.tabControl1);
			this.panel1.Dock = System.Windows.Forms.DockStyle.Right;
			this.panel1.Location = new System.Drawing.Point(268, 42);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(300, 367);
			this.panel1.TabIndex = 7;
			// 
			// border
			// 
			this.border.AutoScroll = true;
			this.border.Controls.Add(this.mappanel);
			this.border.Dock = System.Windows.Forms.DockStyle.Fill;
			this.border.Location = new System.Drawing.Point(0, 42);
			this.border.Name = "border";
			this.border.Size = new System.Drawing.Size(268, 367);
			this.border.TabIndex = 8;
			// 
			// menuItem14
			// 
			this.menuItem14.Index = 3;
			this.menuItem14.Text = "Bounding";
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(568, 409);
			this.Controls.Add(this.border);
			this.Controls.Add(this.panel1);
			this.Controls.Add(this.toolBar1);
			this.Menu = this.mainMenu1;
			this.Name = "Form1";
			this.Text = "Map Generator and Converter";
			this.Load += new System.EventHandler(this.Form1_Load);
			this.tabControl1.ResumeLayout(false);
			this.tViewField.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.GridField)).EndInit();
			this.tViewData.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.GridData)).EndInit();
			this.tViewTable.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.GridTable)).EndInit();
			this.panel1.ResumeLayout(false);
			this.border.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}
		private DataView tableDataview;
		private MapDataCollection maps;

		private MapData ReadMap(string filename)
		{
			string ext = System.IO.Path.GetExtension(filename);
			switch (ext.ToLower())
			{
				case ".shp" :
					return ReadShp(filename);
				default:
					System.Windows.Forms.MessageBox.Show("Not Support "+ext); 
					break;
			}
			return null;
		}

		private MapData ReadShp(string filename)
		{
			GeoCon.shp.ShapeReader sr=new GeoCon.shp.ShapeReader(filename);
			//sr.StatusChange+=new StatusEventHandler(myStatusHandler); 
			MapData map=sr.Read();

			sr.Close();
			sr=null;
			return map;
		}

		private void menuItem3_Click(object sender, System.EventArgs e)
		{
			System.Windows.Forms.OpenFileDialog ofd=new OpenFileDialog(); 
			ofd.Multiselect =true;
			ofd.Filter="Shape file(*.shp)|*.shp";
			ofd.ShowDialog();
			this.Update();

			string[] fns = ofd.FileNames;
			ofd.Dispose();
			ofd=null;
			if (fns==null || fns.Length<1)return;
			Cursor.Current = Cursors.WaitCursor; 
		
			if(maps==null) maps=new MapDataCollection();
			for(int m=0;m<fns.Length;m++)
			{
				int i = maps.Add(ReadMap(fns[m]));
				if(i<0) continue;
				Layers.Items.Add(maps[i].Name,true);
				string origName=System.IO.Path.GetFileNameWithoutExtension(fns[m]);
				maps[i].Name=origName;
			}
			Cursor.Current = Cursors.Default;
		}

		private void mappanel_Paint(object sender, PaintEventArgs e)
		{
			try
			{
				if(maps==null) return;
				int activelayers=0;
				for(int i=0;i<maps.Count;i++) activelayers+=maps[i].Fields.getActiveCount(false); 
				if(activelayers<1) return; //no active layers

				gml.BoxType box=maps.GetBoundingBox();
				float l = (float)box.Left; 
				float b = (float)box.Bottom; 
				float r = (float)box.Right; 
				float t = (float)box.Top; 
				//b= 1384225.625F;
				//t = 1465514.75F;
				//l= 715838F;
				//r = 807625.1875F;


				float scl = 1*Math.Min(mappanel.Bounds.Width/(r-l),mappanel.Bounds.Height/(t-b));
				Graphics g = e.Graphics;

				g.Transform = new System.Drawing.Drawing2D.Matrix(1,0,0,-1,0,scl*(b+t));
				g.TranslateTransform(-l*scl,-b*scl,System.Drawing.Drawing2D.MatrixOrder.Append);
				g.ScaleTransform(scl,scl,System.Drawing.Drawing2D.MatrixOrder.Prepend);
				float maxdim = Math.Max(r-l,t-b);
				double diagonal = (Math.Sqrt((r-l)*(r-l)+(t-b)*(t-b)));

				Pen p = new Pen(Color.Red,maxdim/200);
				Brush br = Brushes.DarkBlue;

				//for(int i=0;i<maps.Count;i++)
				for(int i=maps.Count-1; i>=0;i--)
				{
					if(!Layers.GetItemChecked(i)) continue;
					if(!maps[i].isActive) continue;

					GeometryField fgeo=maps[i].Fields.GetGeometryField();
					for(int k=0;k<maps[i].Bins.Count;k++)
					{
						Bin bin = maps[i].Bins[k];
						p = bin.Symbol.Pen; 
						br= bin.Symbol.Brush; 

						//point-radius scaling
						double pr = 0.01*bin.Symbol.PointRadiusMap*diagonal;

						//line-width scaling
						float oldwidth=p.Width;
						p.Width = (float)(0.01*bin.Symbol.LineWidthMap*diagonal); 

						foreach (int ci in bin.ContentsIndex)
						{
							if(fgeo[ci]==null || fgeo[ci]==fgeo.NullSymbol) continue;
							gml.GeometryPropertyType gpt = (gml.GeometryPropertyType)(fgeo[ci]);
							if(gpt.Item==null) continue;
							gpt.Item.PointRadius=pr;
							gpt.Item.DrawGraphics(ref g, ref p, ref br);
							gpt=null;				
						}
						p.Width = oldwidth;//width re-scaling
					}
				}
			}
			catch{}

		}


		private void maptodb()
		{
			mapdata.database db = new mapdata.database();

			db.query("delete from bounding");
			double bottom = maps.GetBoundingBox().Bottom;
			double top = maps.GetBoundingBox().Top;
			double left = maps.GetBoundingBox().Left;
			double right = maps.GetBoundingBox().Right;

			string boundingsql = "insert into bounding values(" + bottom +","+top+","+left+","+right+")";
			db.query(boundingsql);

			if(maps==null) return;
			int activelayers=0;
			for(int i=0;i<maps.Count;i++) activelayers+=maps[i].Fields.getActiveCount(false); 
			if(activelayers<1) return; //no active layers

			for(int i=0;i<maps.Count;i++)
			{
				if(!Layers.GetItemChecked(i)) continue;
				if(!maps[i].isActive) continue;

				// create table
				string sql = "DROP TABLE "  + maps[i].Name ;
				try
				{
					db.query(sql);
				}
				catch{	}
				sql = "DELETE FROM format where tablename ='"  + maps[i].Name +"'";
				try
				{
					db.query(sql);
				}
				catch{	}
				sql = "CREATE TABLE " + maps[i].Name + " ( ";
				for(int j=0;j<	maps[i].Fields.Count;j++)
				{
					string colname = maps[i].Fields[j].Name;
					sql+= colname + " text ";
					if (j<maps[i].Fields.Count-1) sql+= " , ";


					string sqlcolumn = "insert into format values('" +maps[i].Name+  "','"+colname+ "','"+maps[i].Fields[j].TypeString+"')";
					try{db.query(sqlcolumn);}
					catch{}	
				}
				sql+= ")";
				try
				{
					db.query(sql);
				}
				catch{	}

				GeometryField fgeo=maps[i].Fields.GetGeometryField();
				for(int k=0;k<maps[i].Bins.Count;k++)
				{
					Bin bin = maps[i].Bins[k];

					foreach (int ci in bin.ContentsIndex)
					{
						string geo = ""; 

						if(fgeo[ci]==null || fgeo[ci]==fgeo.NullSymbol) continue;
						gml.GeometryPropertyType gpt = (gml.GeometryPropertyType)(fgeo[ci]);
						if(gpt.Item==null) continue;
						
						gml.GeometryPropertyType a = (gml.GeometryPropertyType)fgeo[ci];		
						svg.SvgElement s = a.Item.createSvgObject();
						if (s.GetType() == typeof(svg.circle))
						{
							svg.circle ss = (svg.circle)(s);
							geo = ss.cx+","+ss.cy;
						}
						if (s.GetType() == typeof(svg.polygon))
						{
							svg.polygon ss = (svg.polygon)(s);
							geo = ss.points;
						}
						if (s.GetType() == typeof(svg.polyline))
						{
							svg.polyline ss = (svg.polyline)(s);
							geo = ss.points;
						}
						if (s.GetType() == typeof(svg.path))
						{
							svg.path ss = (svg.path)(s);
							geo = ss.d;
						}
						string sql2 = "insert into "+maps[i].Name+ " values ( ";
						for(int m =0;m<maps[i].Fields.Count;m++)
						{
							
							if(m<maps[i].Fields.Count-1) sql2+=	"'"+maps[i].Fields[m][ci].ToString().Replace("'","''")+"',";
							if(m==maps[i].Fields.Count-1) sql2+="'"+geo+"'";
						}
						sql2+= " ) ";
						db.query(sql2);
					}
				}
			}
			db.close();
		}

		private void dbtomap()
		{
			mapdata.database db = new mapdata.database();
						
			if(maps==null) maps = new MapDataCollection();
			//int activelayers=0;
			//for(int i=0;i<maps.Count;i++) activelayers+=maps[i].Fields.getActiveCount(false); 
			//if(activelayers<1) return; //no active layers
			maps.Clear();

			double bottom=0;
			double top=0;
			double left=0;
			double right=0;

			try
			{
				db.query("select * from bounding");
				while(db.dr.Read())
				{
					bottom = Convert.ToDouble(db.dr["bottom"]);
					top = Convert.ToDouble(db.dr["top"]);
					left = Convert.ToDouble(db.dr["left"]);
					right = Convert.ToDouble(db.dr["right"]);
				}
			}
			catch{}

			string sqltable = "select distinct tablename from format";
			db.query(sqltable);
			while(db.dr.Read())
			{
				
				string table = "" + db.dr["tablename"];
				MapData m =  new MapData();
				m.BoundingBox = new gml.BoxType(left,top,right,bottom);
				m.Info.BoundsBottom = bottom;
				m.Info.BoundsTop = top;
				m.Info.BoundsLeft = left;
				m.Info.BoundsRight = right;

				m.Name = table;

				mapdata.database db2 = new database();
				string sqlcolumn = "select * from format where tablename = '"+table+  "'";
				db2.query(sqlcolumn);
				while(db2.dr.Read())
				{
					string typename = ""+db2.dr["typename"];
					if (typename=="Int32")
					{
						GeoCon.Data.Field fi = new GeoCon.Data.IntegerField();
						fi.Name2 = db2.dr["columnname"].ToString();
						m.Fields.Add(fi);
					}
					else if (typename=="String")
					{
						GeoCon.Data.Field fi = new GeoCon.Data.StringField();
						fi.Name2 = db2.dr["columnname"].ToString();
						m.Fields.Add(fi);
					}
					else if (typename=="Double")
					{
						GeoCon.Data.Field fi = new GeoCon.Data.DoubleField();
						fi.Name2 = db2.dr["columnname"].ToString();
						m.Fields.Add(fi);
					}
					else if (typename=="PolygonPropertyType")
					{
						GeoCon.Data.Field fi = new GeoCon.Data.GeometryField();
						fi.Name2 = db2.dr["columnname"].ToString();
						fi.Type = typeof(gml.PolygonType);
						m.Fields.Add(fi);
					}
					else if (typename=="LineStringPropertyType")
					{
						GeoCon.Data.Field fi = new GeoCon.Data.GeometryField();
						fi.Name2 = db2.dr["columnname"].ToString();
						fi.Type = typeof(gml.LineStringType);
						m.Fields.Add(fi);
						
					}
					else if (typename=="PointPropertyType")
					{
						GeoCon.Data.Field fi = new GeoCon.Data.GeometryField();
						fi.Name2 = db2.dr["columnname"].ToString();
						fi.Type = typeof(gml.PointPropertyType);
						m.Fields.Add(fi);
					}
					else
					{
						int xxx=1;
					}
				}
				db2.close();
				maps.Add(m);
				Layers.Items.Add(m.Name,true);
			}

			for(int i=0;i<maps.Count;i++)
			{
				string table = maps[i].Name;
				string sql = "select * from "+table;
				db.query(sql);
				while(db.dr.Read())
				{
					
					for(int j=0;j<maps[i].Fields.Count;j++)
					{
						string fieldname = maps[i].Fields[j].Name;
						if (maps[i].Fields[j].TypeString == "PolygonType")
						{
							string data = ""+db.dr[j];

							string[] data2 = data.Replace("M","").Replace("L","").Replace("z","").Trim().Split(new char[]{' ',','});
							double[] data3 = new double[data2.Length];
							int d=0;
							int dd=0;
							while(dd<data2.Length)
							{
								try
								{
									data3[d] = Convert.ToDouble(data2[dd]);
									d++;
								}
								catch{}
								dd++;
							}						

							gml.CoordinatesType c = new gml.CoordinatesType(data3);
							gml.PolygonType data4 = new gml.PolygonType(c);
			
							maps[i].Fields[j].Add(new gml.PolygonPropertyType(data4));
						}
						else if (maps[i].Fields[j].TypeString == "LineStringType")
						{
							string data = ""+db.dr[j];
							string[] data2 = data.Trim().Split(new char[]{' ',','});
							double[] data3 = new double[data2.Length];
							for(int d=0;d<data2.Length;d++) data3[d] = Convert.ToDouble(data2[d]);
							
							gml.CoordinatesType c = new gml.CoordinatesType(data3);
							gml.LineStringType data4 = new gml.LineStringType(c);
			
							maps[i].Fields[j].Add(new gml.LineStringPropertyType(data4));
						}
						else if (maps[i].Fields[j].TypeString == "PointPropertyType")
						{
							string data = ""+db.dr[j];
							string[] data2 = data.Trim().Split(new char[]{' ',','});
							double[] data3 = new double[data2.Length];
							for(int d=0;d<data2.Length;d++) data3[d] = Convert.ToDouble(data2[d]);
							
							gml.CoordinatesType c = new gml.CoordinatesType(data3);
							gml.PointType data4 = new gml.PointType(c);
			
							maps[i].Fields[j].Add(new gml.PointPropertyType(data4));
						}
						else if (maps[i].Fields[j].TypeString == "Int32")
						{
							string data = ""+db.dr[j];
							maps[i].Fields[j].Add(data);
						}
						else if (maps[i].Fields[j].TypeString == "Double")
						{
							string data = ""+db.dr[j];
							maps[i].Fields[j].Add(data);
						}
						else if (maps[i].Fields[j].TypeString == "String")
						{
							string data = ""+db.dr[j];
							maps[i].Fields[j].Add(data);
						}
						else
						{
							string data = ""+db.dr[j];
							maps[i].Fields[j].Add(data);
						}
					

					}
				}
			}
			db.close();
		}

		private void RefreshTable()
		{
			if(GridField.DataSource==null) return;
			FieldCollection fc = (FieldCollection) GridField.DataSource;
			//we must update whenever there are changes to a field's : isActive & name properties
			//if(fc.isUpToDate) return;

			GridTable.Visible=false;
			try
			{
				//System.Data.DataTable dt = fc.CreateDataTable();
				if(tableDataview!=null) tableDataview.Dispose();
				tableDataview = new DataView(fc.CreateDataTable());
				tableDataview.AllowNew=false;
				tableDataview.RowFilter=fc.FilterString;
				tableDataview.RowStateFilter=DataViewRowState.CurrentRows;

				DataGridTableStyle dgts = new DataGridTableStyle();
				for (int i=0;i<tableDataview.Table.Columns.Count;i++ )
				{
					DataGridColumnStyle bc = new DataGridTextBoxColumn();
					bc.Width=70;
					if(tableDataview.Table.Columns[i].DataType==typeof(bool))
					{
						bc = new DataGridBoolColumn();
						bc.Width=40;
					} 
					else if(i==tableDataview.Table.Columns.Count-1) //index column
					{
						bc.Width=0;
						bc.ReadOnly=true;
					}
					bc.MappingName=tableDataview.Table.Columns[i].ColumnName; 
					bc.HeaderText=tableDataview.Table.Columns[i].ColumnName;
					dgts.GridColumnStyles.Add(bc);
				}
				dgts.AlternatingBackColor=Color.Honeydew;
				dgts.RowHeadersVisible=false;
				GridTable.TableStyles.Clear();
				GridTable.TableStyles.Add(dgts);
				GridTable.DataSource=tableDataview;
			}
			catch{}
			GridTable.Visible=true;
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{
		}


		private void toolBar1_ButtonClick(object sender, System.Windows.Forms.ToolBarButtonClickEventArgs e)
		{
			if (e.Button == this.bmoveup)
			{
				changeLayerIndex(Layers.SelectedIndex,Layers.SelectedIndex-1);
			}
			if(e.Button == this.bmovedown)
			{
				changeLayerIndex(Layers.SelectedIndex,Layers.SelectedIndex+1);
			}
			if(e.Button == this.bZoomin)
			{
				mappanel.Size=new Size(mappanel.Size.Width*3/2,mappanel.Size.Height*3/2);
				mappanel.Invalidate();
			}
			if(e.Button == this.bZoomout)
			{
				mappanel.Size=new Size(mappanel.Size.Width*2/3,mappanel.Size.Height*2/3);
				mappanel.Invalidate();
			}
			if(e.Button == this.bZoomorigin)
			{
				mappanel.Size=border.ClientSize;
				mappanel.Invalidate();
			}
			if(e.Button == this.CreateMap)
			{
				MapGen.Form1 f1 = new MapGen.Form1();
				f1.Show();
			}
		}

		private void changeLayerIndex(int idxfrom,int idxto)
		{
			if(maps==null) return;
			if(maps.Count==0) return;
			if(idxfrom<0 || idxto>maps.Count-1 || idxfrom>maps.Count-1 || idxto<0) return;

			maps.MoveItem(idxfrom,idxto);
			Layers.Items.Clear();
			for(int i=0;i<maps.Count;i++)
				Layers.Items.Add(maps[i].Name,true);
			Layers.SelectedIndex=idxto;
		}


		private void menuItem9_Click(object sender, System.EventArgs e)
		{
			Application.Exit();
		}

		private void Layers_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			for (int i=0;i<maps.Count;i++)
			maps[i].isActive=Layers.GetItemChecked(i);

			mappanel.Refresh();
			GridField.SetDataBinding(maps[Layers.SelectedIndex].Fields,"");
			GridData.SetDataBinding(maps[Layers.SelectedIndex].Info.CreateDataTable(),"");
			//GridTable.SetDataBinding(maps[Layers.SelectedIndex].Bins,"");
			RefreshTable();
			this.menuItem14.Text = "left:"+maps.GetBoundingBox().Left+"right:"+maps.GetBoundingBox().Right+"top:"+maps.GetBoundingBox().Top+"bottom:"+maps.GetBoundingBox().Bottom;
		}


		private void menuItem6_Click(object sender, System.EventArgs e)
		{
			try
			{
				if(maps==null) return;
				this.Update();
				if(maps.Count==0) 
				{
					MessageBox.Show("No file(s) currently loaded.\nPlease.","Warning",MessageBoxButtons.OK,MessageBoxIcon.Warning);
					return;
				}
				System.Windows.Forms.SaveFileDialog sfd=new SaveFileDialog(); 
				sfd.Filter="GML |*.gml";
				sfd.ShowDialog();

				this.Update();
				if(sfd.FileName=="" || sfd.FileName==null)return;
				string fn = System.IO.Path.GetFileNameWithoutExtension(sfd.FileName)+".gml";
				sfd.Dispose();
				sfd=null;

				Cursor.Current = Cursors.WaitCursor; 

				System.DateTime sebelum=System.DateTime.Now;
				string xsfile=System.IO.Path.GetFileNameWithoutExtension(fn)+".xsd";
				//commented out because it'll put the dynamic assembly in default domain, therefore can't be unloaded.
				//maps.StatusChange+=new StatusEventHandler(myStatusHandler);;
				maps.writeApplicationSchema(xsfile,false);	
				maps.ExportGML(fn,false);

				//System.TimeSpan rentang = System.DateTime.Now.Subtract(sebelum);
				//this.progressBar1.Value=this.progressBar1.Minimum;
				Cursor.Current = Cursors.Default;
			}
			catch (System.Exception exc)
			{
				System.Windows.Forms.MessageBox.Show("Error in exporting gml file \r"+exc.Message);
				//Console.WriteLine(exc.Message);
			}

		}

		private void menuItem5_Click(object sender, System.EventArgs e)
		{
			try
			{
				if(maps==null) return;
				if(maps.Count==0) 
				{
					MessageBox.Show("No map currently loaded.\rPlease.","Warning",MessageBoxButtons.OK,MessageBoxIcon.Warning);
					return;
				}
				System.Windows.Forms.SaveFileDialog sfd=new SaveFileDialog(); 
				sfd.Filter="SVG |*.svg";
				sfd.ShowDialog();

				this.Update();
				if(sfd.FileName=="" || sfd.FileName==null)return;
				string fn = System.IO.Path.GetFileNameWithoutExtension(sfd.FileName)+".svg";

				sfd.Dispose();
				sfd=null;

				Cursor.Current = Cursors.WaitCursor; 
				System.DateTime sebelum=System.DateTime.Now;
				//commented out because it'll put the dynamic assembly in default domain, therefore can't be unloaded.
				//maps.StatusChange+=new StatusEventHandler(myStatusHandler);
				maps.ExportSVG(fn);

				System.TimeSpan rentang = System.DateTime.Now.Subtract(sebelum);




				Cursor.Current = Cursors.Default;
			}
			catch (System.Exception exc)
			{
				System.Windows.Forms.MessageBox.Show("Error in Exporting svg file \r"+exc.Message);				

			}
		}

		private void menuItem7_Click(object sender, System.EventArgs e)
		{
			try
			{
				if(maps==null) maps = new MapDataCollection();

				System.Windows.Forms.OpenFileDialog ofd=new OpenFileDialog(); 
				ofd.Filter="SVG |*.svg";
				ofd.ShowDialog();

				this.Update();
				if(ofd.FileName=="" || ofd.FileName==null)return;
				string fn = System.IO.Path.GetFileNameWithoutExtension(ofd.FileName)+".svg";

				ofd.Dispose();
				ofd=null;

				Cursor.Current = Cursors.WaitCursor; 

				maps.ImportSVG(fn);

				for(int i=0;i<maps.Count;i++)
					Layers.Items.Add(maps[i].Name,true);

				Cursor.Current = Cursors.Default;
			}
			catch (System.Exception exc)
			{
				System.Windows.Forms.MessageBox.Show("Error in Importing SVG file \r"+exc.Message);				

			}
		}

		private void menuItem11_Click(object sender, System.EventArgs e)
		{
			this.maptodb();
		}

		private void menuItem8_Click(object sender, System.EventArgs e)
		{
			try
			{
				if(maps==null) maps = new MapDataCollection();

				System.Windows.Forms.OpenFileDialog ofd=new OpenFileDialog(); 
				ofd.Filter="GML |*.gml";
				ofd.ShowDialog();

				this.Update();
				if(ofd.FileName=="" || ofd.FileName==null)return;
				string fn = System.IO.Path.GetFileNameWithoutExtension(ofd.FileName)+"gml";

				ofd.Dispose();
				ofd=null;

				Cursor.Current = Cursors.WaitCursor; 
	
				maps.ImportGML(fn);

				for(int i=0;i<maps.Count;i++)
					Layers.Items.Add(maps[i].Name,true);

				Cursor.Current = Cursors.Default;
			}
			catch (System.Exception exc)
			{
				System.Windows.Forms.MessageBox.Show("Error in Importing GML file \r"+exc.Message);				

			}		
		}

		private void menuItem12_Click(object sender, System.EventArgs e)
		{
			this.dbtomap();
		}

		private void menuItem13_Click(object sender, System.EventArgs e)
		{
			MapGen.Form1 f1 = new MapGen.Form1();
			f1.Show();
		}

		private void menuItem4_Click(object sender, System.EventArgs e)
		{
		
		}
	}
}
