///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Xml;  
using System.Xml.Schema;
using System.Xml.Serialization;
using System.Collections;

//this are incomplete and even incorrect svg implementation.
//just to assist me in exporting simple svg doc, not reading.
//will next .NET version adopt SVG?? maybe not, maybe XAML.

namespace svg
{
	#region abstract svgclass
	/// <summary>
	/// abstract class as the base of all elements in svg namespace.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.w3.org/2000/svg")]
	public abstract class SvgElement
	{
		public SvgElement()
		{
			//styleHash = new Hashtable();
		}
		[XmlAttribute] public string id;
		[XmlAttribute] public string transform;
		[XmlAttribute] public string @class; 
//		[XmlIgnore] private Hashtable styleHash; 
//		[XmlAttribute] 
//		public string style
//		{
//			get
//			{	
//				string str=null;
//				IDictionaryEnumerator dic = styleHash.GetEnumerator();
//				while(dic.MoveNext()==true)
//				{
//					str+=dic.Key+":"+dic.Value+";";
//				}
//				return str;
//			}
//			set
//			{
//				styleHash.Clear();
//				string[] entries=value.Split(';');
//				for(int i=entries.GetLowerBound(0);i<entries.Length;i++)
//				{
//					string[] kv = entries[i].Split(':');
//					if(kv.Length<2)continue;
//					styleHash.Add(kv[0].Trim(),kv[1].Trim());
//				}
//			}
//		}
//		public void setStyle(string propertyname, string Value)
//		{
//			if(styleHash.Contains(propertyname)) 
//			{
//				styleHash[propertyname]=Value;
//			}
//			else
//			{
//				styleHash.Add(propertyname,Value); 
//			}
//		}
//		public string getStyle(string propertyname)
//		{
//			return (string)styleHash[propertyname];
//		}

		//		[XmlAttribute] public string xmlbase;
		//		[XmlIgnore]	public SvgElement viewportElement;
	}

	/// <summary>
	/// abstract point class which holds coordinate for a point.
	/// </summary>
	public abstract class SvgPoint
	{
		public double x;
		public double y;
	}
	/// <summary>
	/// abstract class for transform attribute.
	/// </summary>
	public abstract class SvgTransform
	{
		public SvgMatrix matrix;
		public string type;
		public string getTransformString()
		{
			return "";
		}
	}
	/// <summary>
	/// abstract class represents svg transformation matrix.
	/// </summary>
	public abstract class SvgMatrix
	{
		public double a;
		public double b;
		public double c;
		public double d;
		public double e;
		public double f;
		public string getMatrixString()
		{
			return "";
		}
	}
	#endregion

	/// <summary>
	/// Root Svg Element.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.w3.org/2000/svg")]
	public class svg : SvgElement
	{
		[XmlAttribute] public string x;
		[XmlAttribute] public string y;
		[XmlAttribute] public string width;
		[XmlAttribute] public string height;
		[XmlAttribute] public string viewBox;
		[XmlAttribute] public string preserveAspectRatio;

		[XmlElement(Type=typeof(svg))]
		[XmlElement(Type=typeof(group))]
		[XmlElement(Type=typeof(style))]
		[XmlElement("path",typeof(path))]
		[XmlElement("circle",typeof(circle))]
		[XmlElement("ellipse",typeof(ellipse))]
		[XmlElement("line",typeof(line))]
		[XmlElement("polyline",typeof(polyline))]
		[XmlElement("polygon",typeof(polygon))]
		[XmlElement("rect",typeof(rect))]
		public SvgElement[] Items;

		/// <summary>
		/// create new SVG element whithout any child.
		/// </summary>
		public svg() { }

		/// <summary>
		/// create new SVG element whith elements as children.
		/// </summary>
		public svg(SvgElement[] elements)
		{
			Items=elements;
		}
		/// <summary>
		/// set the canvas size for this SVG element.
		/// </summary>
		/// <param name="xs">x-coordinate of the upperleft corner</param>
		/// <param name="ys">y-coordinate of the upperleft corner</param>
		/// <param name="ws">width of the svg</param>
		/// <param name="hs">height of the svg</param>
		public void setDimension(string xs,string ys,string ws,string hs)
		{
			x = xs;
			y = ys;
			width = ws;
			height = hs;
		}
		public void AddSvgElement(SvgElement element)
		{
		}
		public void AddSvgElements(SvgElement[] element)
		{
		}
	}
	/// <summary>
	/// represents svg style attribute
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.w3.org/2000/svg")]
	public class style : SvgElement
	{
		public style(){}
		[XmlAttribute] public string type="text/css";
		private string cssvalue;
		[XmlText]
		public string Item
		{
			get{return cssvalue;}
			set{cssvalue=value;}
		}
	}

	/// <summary>
	/// represents svgRect element
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.w3.org/2000/svg")]
	public class rect : SvgElement
	{
		[XmlAttribute] public double x;
		[XmlAttribute] public double y;
		[XmlAttribute] public double width;
		[XmlAttribute] public double height;
		public rect()	{	}
		public rect(double X,double Y, double Width, double Height)	
		{
			x=X;
			y=Y;
			width=Width;
			height=Height;
		}
	}

	/// <summary>
	/// represents svgCircle element.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.w3.org/2000/svg")]
	public class circle : SvgElement
	{
		[XmlAttribute] public double cx;
		[XmlAttribute] public double cy;
		[XmlAttribute] public double r;
		public circle()	{	}
		public circle(double CX,double CY,double R)	
		{	
			cx=CX;
			cy=CY;
			r=R;
		}
	}

	/// <summary>
	/// represents svgEllipse element.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.w3.org/2000/svg")]
	public class ellipse : SvgElement
	{
		[XmlAttribute] public double cx;
		[XmlAttribute] public double cy;
		[XmlAttribute] public double rx;
		[XmlAttribute] public double ry;
		public ellipse()	{	}
		public ellipse(double CX,double CY,double RX,double RY)
		{
			cx=CX;
			cy=CY;
			rx=RX;
			ry=RY;
		}
	}

	/// <summary>
	/// represents svgPath element.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.w3.org/2000/svg")]
	public class path : SvgElement
	{
		[XmlAttribute] public string d;
		public path(){}
		public path(string pathdata)
		{
			d=pathdata;
		}
	}

	/// <summary>
	/// represents svgLine element.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.w3.org/2000/svg")]
	public class line : SvgElement
	{
		[XmlAttribute]	public double x1;
		[XmlAttribute]	public double y1;
		[XmlAttribute]	public double x2;
		[XmlAttribute]	public double y2;
		public line()	{	}
		public line(double X1,double Y1,double X2,double Y2)
		{
			x1=X1;
			y1=Y1;
			x2=X2;
			y2=Y2;
		}
	}

	/// <summary>
	/// represent svgPolyline element.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.w3.org/2000/svg")]
	public class polyline : SvgElement
	{
		[XmlAttribute] public string points;
		public polyline(){	}
		public polyline(string pointsdata)
		{
			points=pointsdata;
		}
	}

	/// <summary>
	/// represents svgPolygon element.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.w3.org/2000/svg")]
	public class polygon : SvgElement
	{
		[XmlAttribute] public string points;
		public polygon()	{	}
		public polygon(string pointsdata)
		{
			points=pointsdata;
		}
	}

	/// <summary>
	/// represents svgGroup element.
	/// </summary>
	[Serializable]
	[XmlType("g",Namespace="http://www.w3.org/2000/svg")]
	public class group : SvgElement	
	{
		[XmlElement(Type=typeof(svg))]
		[XmlElement(Type=typeof(group))]
		[XmlElement("path",typeof(path))]
		[XmlElement("circle",typeof(circle))]
		[XmlElement("ellipse",typeof(ellipse))]
		[XmlElement("line",typeof(line))]
		[XmlElement("polyline",typeof(polyline))]
		[XmlElement("polygon",typeof(polygon))]
		[XmlElement("rect",typeof(rect))]
		public SvgElement[] Items;

		public group(){	}
		public group(SvgElement[] elements)
		{
			Items=elements;
		}
	}

}
