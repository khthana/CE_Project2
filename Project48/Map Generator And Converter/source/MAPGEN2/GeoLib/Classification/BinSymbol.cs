///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Drawing;

namespace GeoCon.Classification
{
	/// <summary>
	/// Symbol of a bin.
	/// </summary>
	[Serializable]
	public class BinSymbol
	{
		/// <summary>
		/// The type of the symbol
		/// </summary>
		public SymbolTypeEnum Type = SymbolTypeEnum.Point;

		private double _pointradiusmap=1.0;
		private double PointRadiusGUI=0.35; //% of datagrid cell height, the actual pointradius=0.35*PointRadiusMap

		private double _linewidthmap=0.25;
		private const double LineWidthGUI=1.0; //pen width in datagrid cell symbol

		private System.Drawing.Pen _pen;
		private System.Drawing.SolidBrush _brush;

		/// <summary>
		/// Constucts new symbol with default pen and brush.
		/// </summary>
		public BinSymbol()
		{
			_pen = new Pen(Color.Black);
			_pen.Width=(float)(LineWidthGUI*LineWidthMap);
			Random rnd = new Random();
			_brush  = new SolidBrush(Color.FromArgb(255,rnd.Next(0,255),rnd.Next(0,255),rnd.Next(0,255)));
		}

		/// <summary>
		/// Gets or sets the symbol pen property
		/// </summary>
		public Pen Pen
		{
			get{return _pen;}
			set
			{
				_pen=value;
				//TODO: add updating routine here
			}
		}
		/// <summary>
		/// Gets or sets the symbol pen width
		/// </summary>
		public double LineWidthMap  //as % of map diagonal, in map view and svg
		{
			get{return _linewidthmap;}
			set
			{
				_linewidthmap=value;
				_pen.Width=(float)(LineWidthGUI*_linewidthmap);
			}
		}

		/// <summary>
		/// Point radius (as % of map diagonal) for PointType symbol
		/// </summary>
		public double PointRadiusMap
		{
			get{return _pointradiusmap;} //in map view and svg; this is the value that appear in the styleform
			set
			{
				_pointradiusmap=value;
				PointRadiusGUI=0.35*_pointradiusmap;
			}
		}

		/// <summary>
		/// Gets or sets the symbol brush property
		/// </summary>
		public SolidBrush Brush
		{
			get{return _brush;}
			set
			{
				_brush=value;
			}
		}

		/// <summary>
		/// Draws the symbol
		/// </summary>
		/// <param name="g">graphics in where to draw the symbol</param>
		/// <param name="rect">the rectangle boundary of the symbol </param>
		public void DrawIcon(Graphics g, Rectangle rect)
		{
			Region oldclip = g.Clip;
			g.Clip = new Region(rect);

			switch (this.Type)
			{
				case SymbolTypeEnum.None :
					//do nothing
					break;
				case SymbolTypeEnum.Point :
					float dim = (float)PointRadiusGUI*rect.Height;
					float px  = rect.Left + 0.5F*rect.Width - 0.5F*dim;
					float py  = rect.Top + 0.5F*rect.Height - 0.5F*dim;
					g.FillEllipse(this.Brush,px,py,dim,dim);
					g.DrawEllipse(this.Pen,px,py,dim,dim);
					break;
				case SymbolTypeEnum.Line :
					float xs = rect.X + 0.15F*rect.Width;
					float ys = rect.Y + 0.5F*rect.Height;
					float x1 = rect.X + 0.375F*rect.Width; 
					float y1 = rect.Y - 0.5F*rect.Height; 
					float x2 = rect.X + 0.625F*rect.Width; 
					float y2 = rect.Y + 1.5F*rect.Height; 
					float xe = rect.X + 0.85F*rect.Width;
					float ye = ys;
					g.DrawBezier(this.Pen,xs,ys,x1,y1,x2,y2,xe,ye);
					break;
				case SymbolTypeEnum.Polygon :
					float xp = rect.Left + 0.1F*rect.Width; 
					float yp = rect.Top + 0.1F*rect.Height;
					g.FillRectangle(this.Brush,xp,yp,0.8F*rect.Width,0.8F*rect.Height);
					g.DrawRectangle(this.Pen,xp,yp,0.8F*rect.Width,0.8F*rect.Height);
					break;
				default:
					float xpd = rect.Left + 0.3F*rect.Width; 
					float ypd = rect.Top + 0.3F*rect.Height;
					g.FillRectangle(this.Brush,xpd,ypd,0.4F*rect.Width,0.4F*rect.Height);
					g.DrawRectangle(this.Pen,xpd,ypd,0.4F*rect.Width,0.4F*rect.Height);
					break;
			}
			g.Clip=oldclip;
			oldclip.Dispose();
		}

		/// <summary>
		/// Gets the css text represents the style of this symbol.
		/// </summary>
		/// <returns>the css text</returns>
		public string GetCSSText()
		{
			string css="{";

			if(this.Type == SymbolTypeEnum.Line )
			{
				css+="fill:none;";
			}
			else
			{
				css+="fill:"+"RGB("+Convert.ToInt16(Brush.Color.R)+","+Convert.ToInt16(Brush.Color.G)+","+Convert.ToInt16(Brush.Color.B)+")"+";";
				css+="fill-opacity:"+(Convert.ToInt16(Brush.Color.A)/255F).ToString()+";";
			}

			if(Convert.ToInt16(Pen.Color.A)==0) //transparent color
			{
				css+="stroke:none;";
				css+="}";
				return css;
			}

			css+="stroke:" + "RGB("+ Convert.ToInt16(Pen.Color.R)+","+Convert.ToInt16(Pen.Color.G)+","+Convert.ToInt16(Pen.Color.B)+")"+";";
			css+="stroke-width:"+Pen.Width.ToString()+";";

			if(Pen.DashStyle!=System.Drawing.Drawing2D.DashStyle.Solid)
			{
				css+="stroke-dasharray:";
				float[] ab = Pen.DashPattern;
				for(int p=0;p<ab.Length;p++)
				{
					css+=ab[p].ToString();
					if(p<ab.Length-1) css+=",";
				}
				css+=";";
			}			
			css+="}";
			return css;
		}

	}

	/// <summary>
	/// Symbol type enumeration
	/// </summary>
	public enum SymbolTypeEnum : int
	{
		None = -1,
		Point = 0,
		Line = 1,
		Polygon = 2,
		Mixed = 99
	}

}
