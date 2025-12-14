///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Xml;  
using System.Xml.Schema;
using System.Xml.Serialization;
using System.Drawing;

namespace gml
{
	/// <summary>
	/// 
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("Box", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class BoxType : AbstractGeometryType 
	{
		/// <summary>
		/// 
		/// </summary>
		public BoxType() {	}

		/// <summary>
		/// Constructs new BoxType by supplying array of doubles as boundary
		/// </summary>
		/// <param name="dbls">array of boundary values in the form of [left,top,right,bottom]</param>
		public BoxType(double[] dbls)
		{
			this.Choice=CoordChoices.coordinates;
			this.Left = dbls[0];
			this.Top  = dbls[1];
			this.Right= dbls[2];
			this.Bottom = dbls[3];
		}
		/// <summary>
		/// Constructs new box using specified boundary values.
		/// </summary>
		/// <param name="left">minimum x</param>
		/// <param name="top">maximum y</param>
		/// <param name="right">maximum x</param>
		/// <param name="bottom">minimum y</param>
		public BoxType(double left, double top, double right, double bottom)
		{
			this.Choice=CoordChoices.coordinates;
			this.Left = left;
			this.Top  = top;
			this.Right= right;
			this.Bottom = bottom;
		}
		/// <summary>
		/// Constructs new BoxType from a CoordinatesType
		/// </summary>
		/// <param name="cd">coordinates type with two tuples in its array</param>
		public BoxType(gml.CoordinatesType cd)
		{
			this.Choice=CoordChoices.coordinates;
			this.Left = cd.doubleArray[0];
			this.Top  = cd.doubleArray[1];
			this.Right= cd.doubleArray[2];
			this.Bottom = cd.doubleArray[3];	
		}
		/// <summary>
		/// Constructs new BoxType using two CoordType
		/// </summary>
		/// <param name="point0">upperleft point</param>
		/// <param name="point1">lowerright point</param>
		public BoxType(gml.CoordType point0, gml.CoordType point1)
		{
			this.Choice=CoordChoices.coord;
			this.Left = (double)point0.X;
			this.Top  = (double)point0.Y;
			this.Right= (double)point1.X;
			this.Bottom = (double)point1.Y;
		}

		/// <summary>
		/// Gets the value of this BoxType, either in CoordType or CoordinatesType
		/// depends on the BoxType.Choice enum value.
		/// </summary>
		[XmlElement("coord", typeof(CoordType))]	//minOccurs=2 , maxOccurs=2
		[XmlElement("coordinates", typeof(CoordinatesType))]
		public gml.CoordWrapper[] Items
		{
			get
			{
				if(this.Choice==CoordChoices.coord )
				{
					return new gml.CoordType[2]{new gml.CoordType((decimal)Left,(decimal)Top),new gml.CoordType((decimal)Right,(decimal)Bottom)};
				}
				else
				{
					return new gml.CoordinatesType[1]{new gml.CoordinatesType(new double[4]{Left,Top,Right,Bottom})};
				}
			}
			set
			{
			}
		}

		/// <summary>
		/// Wether this BoxType will have it's value treated as CoordType or CoordinatesType.
		/// </summary>
		[XmlChoiceIdentifier("Choice")]
		[XmlIgnore]
		public CoordChoices Choice=CoordChoices.coordinates;

		///convention : point0=UpperLeft, point1=LowerRight
		///thus coordinates value should be = "point0.X,point0.Y point1.X,point1.Y"
		private double _left,_right,_top,_bottom;

		/// <summary>
		/// Gets or sets the left boundary or X-minimum.
		/// </summary>
		[XmlIgnore]
		public double Left //point0.X
		{	
			get{return _left;}
			set{_left=value;}
		}

		/// <summary>
		/// Gets or sets the top boundary or Y-maximum.
		/// </summary>
		[XmlIgnore]
		public double Top //point0.Y
		{	
			get{return _top;}
			set{_top=value;}
		}

		/// <summary>
		/// Gets or sets the right boundary or X-maximum.
		/// </summary>
		[XmlIgnore]
		public double Right //point1.X
		{	
			get{return _right;}
			set{_right=value;}
		}

		/// <summary>
		/// Gets or sets the bottom boundary or Y-minimum.
		/// </summary>
		[XmlIgnore]
		public double Bottom //point1.Y
		{	
			get{return _bottom;}
			set{_bottom=value;}
		}

		/// <summary>
		/// Gets the area of this BoxType
		/// </summary>
		[XmlIgnore]
		public double Area
		{
			get { return ((this.Right-this.Left)*(this.Top-this.Bottom)); }
		}

		/// <summary>
		/// Union this BoxType with another. The union will only affect this BoxType.
		/// </summary>
		/// <param name="box">another BoxType to union to</param>
		public void UnionWith(gml.BoxType box)
		{
			if(box==null) return;
			this.Left = System.Math.Min(this.Left,box.Left);
			this.Top = System.Math.Max(this.Top,box.Top);
			this.Right = System.Math.Max(this.Right,box.Right);
			this.Bottom = System.Math.Min(this.Bottom,box.Bottom);
			//return new BoxType(new CoordinatesType(new double[4]{pl,pt,pr,pb}));
		}

		/// <summary>
		/// Gets a value indicating whether this BoxType contains another BoxType.
		/// </summary>
		/// <param name="abox">another BoxType to compare with</param>
		/// <returns>a value indicating whether this BoxType contains another BoxType</returns>
		public bool isContains(gml.BoxType abox)
		{
			return (this.Left <= abox.Left && this.Right>=abox.Right && this.Bottom<=abox.Bottom && this.Top>=abox.Top);
		}
		/// <summary>
		/// Gets a value indicating whether this BoxType is contained in the other BoxType.
		/// </summary>
		/// <param name="abox">another BoxType to compare with</param>
		/// <returns>a value indicating whether this BoxType is contained inside the other BoxType</returns>
		public bool isContainedIn(gml.BoxType abox)
		{
			if(this==abox) return false;
			return (this.Left >= abox.Left && this.Right<=abox.Right && this.Bottom>=abox.Bottom && this.Top<=abox.Top);
		}
		/// <summary>
		/// Gets a value indicating whether this BoxType area is larger than another.
		/// </summary>
		/// <param name="abox">another BoxType to compare this one with</param>
		/// <returns>a value indicating whether this BoxType has larger area</returns>
		public bool isLargerThan(gml.BoxType abox)
		{
			if(this==abox) return false;
			return (this.Area > abox.Area);
		}

		/// <summary>
		/// Draws a rectangle on a System.Drawing.Graphics
		/// </summary>
		/// <param name="g">the graphics used in drawing</param>
		/// <param name="p">the pen to use for drawing</param>
		/// <param name="b">the brush to use for drawing</param>
		public override	void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b)
		{
			g.DrawRectangle(p,(float)Left, (float)Bottom, (float)(Right-Left), (float)(Top-Bottom));
		}

		/// <summary>
		/// Creates a svg.rect object
		/// </summary>
		/// <returns>svg.rect object for this BoxType</returns>
		public override svg.SvgElement createSvgObject()
		{
			//because the coord move from top to bottom, height=bottom-top;
			return new svg.rect(Left,Top,Right - Left,Bottom - Top);
		}
	}
}
