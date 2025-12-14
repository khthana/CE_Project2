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
	#region abstract geometries
	/// <summary>
	/// All geometry elements are derived from this abstract supertype; 	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlIncludeAttribute(typeof(AbstractGeometryCollectionBaseType))]
	[XmlIncludeAttribute(typeof(GeometryCollectionType))]
	public abstract class AbstractGeometryType 
	{
		/// <summary>
		/// Geometry ID, geometry element may have an identifying attribute
		/// </summary>
		[XmlAttribute(DataType="ID")]
		public string gid;

		/// <summary>
		/// Spatial Reference System.
		/// </summary>
		[XmlAttribute(DataType="anyURI")]
		public string srsName;

		[XmlIgnore]
		public double PointRadius=0.01; //for drawing ellipse

		public AbstractGeometryType(){ }
		public AbstractGeometryType(string srsName)
		{
			this.srsName=srsName;
		}
		public abstract svg.SvgElement createSvgObject();
		public abstract void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b); 
	}

	/// <summary>
	/// This abstract base type for geometry collections just makes the srsName attribute mandatory.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlIncludeAttribute(typeof(GeometryCollectionType))]
	//use AbstractGeometryType as base class, so we can use this class instead of object for better reference;
	public abstract class AbstractGeometryCollectionBaseType : AbstractGeometryType 
	{
		public AbstractGeometryCollectionBaseType()
		{
			this.srsName=" ";	//srsName is required in this class
		}
		public AbstractGeometryCollectionBaseType(string srsName) : base(srsName)
		{
			this.srsName = srsName;
		}
	}
	#endregion

	#region associative geom

	/// <summary>
	/// Group of attributes that can be attached to any element, thus allowing it to act as a pointer
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	//temporary : must write correct xlink objects
	public class AssociationAttributeGroup //: xlink.simpleLink 
	{
		//using attribute group as base class will strip the namespace out, ???
		[XmlAttribute(DataType="string",Namespace="http://www.w3.org/1999/xlink")]
		public const string type ="simple";
		[XmlAttribute(DataType="anyURI",Namespace="http://www.w3.org/1999/xlink")]
		public string href;
		[XmlAttribute(DataType="anyURI",Namespace="http://www.w3.org/1999/xlink")]
		public string role;
		[XmlAttribute(DataType="anyURI",Namespace="http://www.w3.org/1999/xlink")]
		public string arcrole;
		[XmlAttribute(DataType="anyURI",Namespace="http://www.w3.org/1999/xlink")]
		public string title;

		private string _showString;
		[XmlAttribute("show",Namespace="http://www.w3.org/1999/xlink")]
		public string show
		{
			get	{return _showString;}
			set
			{
				string[] showVals = new string[5]{"new","replace","embed","other","none"};
				if(Array.IndexOf(showVals,value,0,5)<0) throw new ArgumentException(value.ToString()+" value not acceptable for 'show' attribute.");
				_showString=value;
			}
		}

		private string _actuateString;
		[XmlAttribute("actuate",Namespace="http://www.w3.org/1999/xlink")]
		public string actuate
		{
			get	{return _actuateString;}
			set
			{
				string[] actuateVals = new string[4]{"onLoad","onRequest","other","none"};
				if(Array.IndexOf(actuateVals,value,0,4)<0) throw new ArgumentException(value.ToString()+" value not acceptable for 'actuate' attribute.");
				_actuateString=value;
			}
		}

		/// <summary>
		/// allows an element that carries link attributes to indicate that the element is declared in a remote schema rather than by the schema that constrains the current document instance.
		/// </summary>
		[XmlAttribute(DataType="anyURI")]
		public string remoteSchema; 

		public AssociationAttributeGroup(){ }
	}


	/// <summary>
	/// Encapsulates any primitive geometry element.
	/// Array of this class instances ("geometryMember") serves as items in gml.GeometryCollectionType.geometryMember
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("geometryMember", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	//Alternatively, it can function as a simple link that points to a remote geometry.
	public class GeometryAssociationType : gml.AssociationAttributeGroup 
	{
		[XmlElement("Point", typeof(gml.PointType))]
		[XmlElement("LineString", typeof(gml.LineStringType))]
		[XmlElement("LinearRing", typeof(gml.LinearRingType))]
		[XmlElement("Polygon", typeof(gml.PolygonType))]
		[XmlElement("MultiPoint", typeof(gml.MultiPointType))]
		[XmlElement("MultiLineString", typeof(gml.MultiLineStringType))]
		[XmlElement("MultiPolygon", typeof(gml.MultiPolygonType))]
		public gml.AbstractGeometryType Item; //minOccurs=0 , maxOccurs=1
		//this item must also accept any type derived from abstractGeometry
		//and use atributeOverrides on this member to handle derived objects

		/// <summary>
		/// Constructs new GeometryAssociationType
		/// </summary>
		public GeometryAssociationType(){}

		/// <summary>
		/// Constructs new GeometryAssociationType with certain geometry as item
		/// </summary>
		/// <param name="geom">Geometry to associate with</param>
		public GeometryAssociationType(gml.AbstractGeometryType geom){
			this.Item=geom;
		}

		/// <summary>
		/// Creates SVG object associated with the Item field of this class.
		/// </summary>
		/// <returns></returns>
		public svg.SvgElement createSvgElement() 
		{
			return Item.createSvgObject();
		}
		/// <summary>
		/// Draws shapes associated with the Item field of this object.
		/// </summary>
		/// <param name="g">Graphics object to draw to</param>
		/// <param name="p">Pen used in drawing</param>
		/// <param name="b">Brush used in drawing</param>
		public void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b)
		{
			Item.DrawGraphics(ref g, ref p, ref b);
		}
	}
	#endregion

	#region geometry utils

	/// <summary>
	/// Enumeration of coordinate type choice
	/// </summary>
	[Serializable]
	[XmlType(IncludeInSchema = false)]
	public enum CoordChoices
	{
		/// <summary>
		/// indicating gml.CoordType
		/// </summary>
		coord,
		/// <summary>
		/// indicating gml.CoordinatesType
		/// </summary>
		coordinates
	}

	/// <summary>
	/// simple wrapper for coordType and coordinatesType
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	public class CoordWrapper
	{
		public CoordWrapper(){}
	}


	/// <summary>
	/// Represents a coordinate tuple in one, two, or three dimensions.
	/// Currently 3D not supported.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("coord", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class CoordType : CoordWrapper
	{
		[XmlElement(IsNullable=false)]
		public System.Decimal X; //minOccurs=1
		public System.Decimal Y; //minOccurs=0
		public System.Decimal Z; //minOccurs=0

		public CoordType()	{	}
		public CoordType(decimal x)
		{
		}
		public CoordType(decimal x,decimal y)
		{
			this.X=x;
			this.Y=y;
		}
		public CoordType(decimal x,decimal y,decimal z)
		{
			this.X=x;
			this.Y=y;
			this.Z=z;
		}
		/// <summary>
		/// Gets tuple string using specified coordinate separator.
		/// </summary>
		/// <param name="coordseparator">string value separating the coordinate values</param>
		/// <returns>tuple string</returns>
		public string getStringTuple(string coordseparator)
		{
			return this.X.ToString() + coordseparator + this.Y.ToString(); 
		}
		/// <summary>
		/// Gets tuple string using specified coordinate separator and number format info
		/// </summary>
		/// <param name="coordseparator">string value separating the coordinate values</param>
		/// <param name="nfi">Number format info to format the string</param>
		/// <returns>tuple string</returns>
		public string getStringTuple(string coordseparator,System.Globalization.NumberFormatInfo nfi)
		{
			return System.Convert.ToString(this.X,nfi) + coordseparator + System.Convert.ToString(this.Y,nfi); 
		}

		/// <summary>
		/// Gets point string 
		/// </summary>
		/// <returns>string that can be used as polyline data in SVG</returns>
		public string getPointString()
		{
			string str = this.X.ToString() + "," + this.Y.ToString();
			if(this.Z.Equals(null)) str+= "," + this.Z.ToString();
			return str;
		}
		/// <summary>
		/// Gets new PointF from this CoordType
		/// </summary>
		/// <returns>PointF object to be used for drawing graphics</returns>
		public PointF getPointF()
		{
			return new PointF((float)this.X,(float)this.Y);
		}
	}

	#endregion

	#region primitive geometries

	/// <summary>
	/// Geometry type for a single coordinate tuple.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("Point", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class PointType : AbstractGeometryType 
	{
		[XmlElement("coord", typeof(CoordType))]
		[XmlElement("coordinates", typeof(CoordinatesType))]
		public gml.CoordWrapper Item;

		/// <summary>
		/// Constructs new PointType with empty coordinate tuple
		/// </summary>
		public PointType()	{	}

		/// <summary>
		/// Constructs new PointType using specified CoordType
		/// </summary>
		/// <param name="coord"></param>
		/// 
		public PointType(CoordType coord)
		{
			Item = coord;
		}

		/// <summary>
		/// Constructs new PointType using specified CoordinatesType
		/// </summary>
		/// <param name="coordinates"></param>
		public PointType(CoordinatesType coordinates)
		{
			Item = coordinates;
		}

		/// <summary>
		/// Creates a svg circle using the coordinate tuple as center
		/// </summary>
		/// <returns>a svg circle object</returns>
		public override svg.SvgElement createSvgObject()
		{
			svg.circle c;
			if(Item.GetType()==typeof(gml.CoordinatesType))
			{
				gml.CoordinatesType ct = (gml.CoordinatesType)this.Item;
				c = new svg.circle(ct.doubleArray[0] ,ct.doubleArray[1], this.PointRadius);
			}
			else
			{
				c = new svg.circle((double)((gml.CoordType)this.Item).X,(double)((gml.CoordType)this.Item).Y,this.PointRadius);
			}
			return c;
		}

		/// <summary>
		/// Draws ellipse using this point coordinate tuple as center
		/// </summary>
		/// <param name="g">Graphics object to draw ellipse</param>
		/// <param name="p">Pen for drawing</param>
		/// <param name="b">Brush for drawing</param>
		public override void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b)
		{
			float ex,ey;
			if(Item.GetType()==typeof(gml.CoordinatesType))
			{
				gml.CoordinatesType ct = (gml.CoordinatesType)this.Item;
				ex = (float) ct.doubleArray[0];
				ey = (float) ct.doubleArray[1];
			}
			else
			{
				ex=(float)((gml.CoordType)this.Item).X;
				ey=(float)((gml.CoordType)this.Item).Y;
			}
			float frad = (float)this.PointRadius;
			g.DrawEllipse(p,ex-0.5F*frad,ey-0.5F*frad,2.0F*frad,2.0F*frad);
			g.FillEllipse(b,ex-0.5F*frad,ey-0.5F*frad,2.0F*frad,2.0F*frad);
		}
	}

	/// <summary>
	/// Geometry type for 2 or more coordinate tuples, with linear interpolation between them.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("LineString", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class LineStringType : AbstractGeometryType 
	{
		[XmlElement("coord", typeof(CoordType))]	//minOccurs=2
		[XmlElement("coordinates", typeof(CoordinatesType))] //maxOccurs=1
		public gml.CoordWrapper[] Items;

		/// <summary>
		/// Constructs LineStringType with empty coordinate tuples
		/// </summary>
		public LineStringType()		{}

		/// <summary>
		/// Constructs LineStringType using specified CoordinatesType as Item
		/// </summary>
		/// <param name="coordinates">CoordinatesType to extract tuples from</param>
		public LineStringType(CoordinatesType coordinates)
		{
			Items = new gml.CoordinatesType[1]{coordinates};
		}

		/// <summary>
		/// Constructs LineStringType using specified array of CoordType as Item
		/// </summary>
		/// <param name="coords">array of CoordType to extract tuples from</param>
		public LineStringType(CoordType[] coords)
		{
			if(coords.Length<2) throw new System.ArgumentException("must be array of 2 or more gml.CoordType","coords");
			Items=coords;
		}

		/// <summary>
		/// Gets path data from this LineString coordinate tuples
		/// </summary>
		/// <returns>path data for svg path object</returns>
		public string getPathString()
		{
			string str="";
			if(Items[0].GetType()==typeof(gml.CoordinatesType))
			{
				str = ((gml.CoordinatesType)Items[0]).getPathString(); 
			}
			else
			{
				System.Text.StringBuilder sb=new System.Text.StringBuilder(); 
				sb.Append("M "); 
				for(int i=0;i<Items.Length;i++ )
				{
					if(i==1) sb.Append(" L");
					sb.Append(((gml.CoordType) Items[i]).getPointString()+" ");
				}
				str=sb.ToString(); 
			}
			return str;
		}

		/// <summary>
		/// Gets polyline data from this LineString coordinate tuples
		/// </summary>
		/// <returns>polyline data for svg path object</returns>
		public string getPointsString()
		{
			string str="";
			if(Items[0].GetType()==typeof(gml.CoordinatesType))
			{
				str = ((gml.CoordinatesType)Items[0]).getPointsString(); 
			}
			else
			{
				System.Text.StringBuilder sb=new System.Text.StringBuilder(); 
				for(int i=0;i<Items.Length;i++ )
				{
					sb.Append(((gml.CoordType) Items[i]).getPointString()+" ");
				}
				str=sb.ToString(); 
			}
			return str;
		}

		/// <summary>
		/// Creates svg polyline from this LineString coordinate tuples
		/// </summary>
		/// <returns>svg polyline object</returns>
		public override svg.SvgElement createSvgObject()
		{
			//return new svg.path(this.getPathString());
			return new svg.polyline(this.getPointsString());  
		}

		/// <summary>
		/// Gets array of PointF from this LineString coordinate tuples
		/// </summary>
		/// <returns>array of PointF for drawing shapes.</returns>
		public PointF[] getPointFArray()
		{	
			if(Items[0].GetType()==typeof(gml.CoordinatesType))
			{
				return ((gml.CoordinatesType)Items[0]).getPointFArray(); 
			}
			else
			{
				PointF[] pfs = new PointF[Items.Length];
				for(int i=0;i<Items.Length;i++ )
				{
					pfs[i]=((gml.CoordType) Items[i]).getPointF();
				}
				return pfs;
			}
		}

		/// <summary>
		/// Draws line using this LineString coordinate tuples
		/// </summary>
		/// <param name="g">Graphics to draw Line</param>
		/// <param name="p">Pen for drawing</param>
		/// <param name="b">Brush for drawing</param>
		public override void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b)
		{
			PointF[] pfs = getPointFArray();
			if(pfs.Length<2) 
			{
				System.Console.WriteLine("invalid LineString data : PointF[] length < 2  - bypassed."); 
				return;
			}
			g.DrawLines(p,pfs);
		}
	}

	/// <summary>
	/// Geometry type for 4 or more coordinate tuples, with linear interpolation between them; 
	/// The first and last coordinates must be coincident
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("LinearRing", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class LinearRingType : AbstractGeometryType 
	{
		[XmlElement("coord", typeof(CoordType))]	//minOccurs=4
		[XmlElement("coordinates", typeof(CoordinatesType))]
		public gml.CoordWrapper[] Items;

		/// <summary>
		/// Constructs LinearRing with empty coordinates
		/// </summary>
		public LinearRingType(){}

		/// <summary>
		/// Constructs LinearRing using array of CoordType as Item
		/// </summary>
		/// <param name="coords">array of CoordType to extract coordinates from</param>
		public LinearRingType(gml.CoordType[] coords)
		{
			if(coords.Length<4) throw new System.ArgumentException("must be array of 4 or more gml.CoordType","coords"); 
			Items=coords;
		}
		/// <summary>
		/// Constructs LinearRing using a CoordinatesType as Item
		/// </summary>
		/// <param name="coordinates">CoordinatesType to extract coordinates from</param>
		public LinearRingType(gml.CoordinatesType coordinates)
		{
			Items=new gml.CoordinatesType[1]{coordinates};
		}

		/// <summary>
		/// Gets path data from this LinearRing coordinates
		/// </summary>
		/// <returns>path data for svg path object</returns>
		public string getPathString()
		{
			string str="";
			if(Items[0].GetType()==typeof(gml.CoordinatesType))
			{
				str = ((gml.CoordinatesType)Items[0]).getPathString(); 
			}
			else
			{
				System.Text.StringBuilder sb=new System.Text.StringBuilder(); 
				for(int i=0;i<Items.Length;i++ )
				{
					sb.Append(((gml.CoordType) Items[i]).getPointString()+" ");
				}
				str=sb.ToString();
			}
			return str;
		}

		/// <summary>
		/// Creates svg Path object from this LinearRing
		/// </summary>
		/// <returns>svg Path object</returns>
		public override svg.SvgElement createSvgObject()
		{
			return new svg.path(this.getPathString());
		}

		/// <summary>
		/// Gets array of PointF from this LinearRing coordinates.
		/// </summary>
		/// <returns>array of PointF used for drawing</returns>
		public PointF[] getPointFArray()
		{	
			if(Items[0].GetType()==typeof(gml.CoordinatesType))
			{
				return ((gml.CoordinatesType)Items[0]).getPointFArray();
			}
			else
			{
				PointF[] pfs=new PointF[Items.Length];
				for(int i=0;i<Items.Length;i++ )
				{
					pfs[i]=((gml.CoordType)Items[i]).getPointF();
				}
				return pfs;
			}
		}

		/// <summary>
		/// Draws polygon from this LinearRing
		/// </summary>
		/// <param name="g">Graphics to draw polygon</param>
		/// <param name="p">Pen for drawing</param>
		/// <param name="b">Brush for drawing</param>
		public override void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b)
		{
			g.DrawPolygon(p,getPointFArray());
		}
	}


	/// <summary>
	/// Geometry type for sequence of LinearRings, one as outer boundary and zero or more as inner boundaries.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("Polygon", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class PolygonType : AbstractGeometryType 
	{
		/// <summary>
		/// Constructs empty PolygonType
		/// </summary>
		public PolygonType(){	}

		/// <summary>
		/// Constructs new PolygonType with specified outer boundary.
		/// </summary>
		/// <param name="cdt">CoordinatesType as the outer boundary</param>
		public PolygonType(gml.CoordinatesType cdt)
		{
			outerBoundaryIs=new PolygonTypeOuterBoundaryIs(cdt);
		}

		//polygon with one innerboundary
		/// <summary>
		/// Constructs new PolygonType with specified outer boundary and one inner boundary.
		/// </summary>
		/// <param name="outerC">Outer boundary</param>
		/// <param name="innerC">Inner boundary</param>
		public PolygonType(gml.CoordinatesType outerC,gml.CoordinatesType innerC)
		{
			outerBoundaryIs=new PolygonTypeOuterBoundaryIs(outerC);
			innerBoundaryIs=new PolygonTypeInnerBoundaryIs[1]{new PolygonTypeInnerBoundaryIs(innerC)} ;
		}

		/// <summary>
		/// LinearRing which defines outer boundary of the polygon.
		/// </summary>
		[XmlElement("outerBoundaryIs")]
		public PolygonTypeOuterBoundaryIs outerBoundaryIs;	//minOccurs=1

		/// <summary>
		/// Array of LinearRings which defines inner boundaries of the polygon.
		/// </summary>
		[XmlElement("innerBoundaryIs", IsNullable=false)]
		public PolygonTypeInnerBoundaryIs[] innerBoundaryIs=new PolygonTypeInnerBoundaryIs[0]; //minOccurs=0

		/// <summary>
		/// Creates svg Path object from this PolygonType
		/// </summary>
		/// <returns>SVG Path object</returns>
		public override svg.SvgElement createSvgObject()
		{
			svg.path p = new svg.path(outerBoundaryIs.LinearRing.getPathString()+"z "); 
			for (int i=0;i<this.innerBoundaryIs.Length;i++)
			{
				p.d+= " " + this.innerBoundaryIs[i].LinearRing.getPathString()+"z ";
			}
			//check the effects of fill-rule (nonzero,evenodd) property on holes(doughnuts) / islands.
			return p;
		}

		/// <summary>
		/// Draws GraphicsPath from this PolygonType
		/// </summary>
		/// <param name="g">Graphics to draw path</param>
		/// <param name="p">Pen for drawing</param>
		/// <param name="b">Brush for drawing</param>
		public override void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b)
		{
			System.Drawing.Drawing2D.GraphicsPath gp = new System.Drawing.Drawing2D.GraphicsPath();
			gp.AddPolygon(outerBoundaryIs.LinearRing.getPointFArray());	
			for (int i=0;i<this.innerBoundaryIs.Length;i++)
			{
				gp.AddPolygon(innerBoundaryIs[i].LinearRing.getPointFArray());
			}
			g.FillPath(b,gp);
			g.DrawPath(p,gp);
		}

	}

	/// <summary>
	/// Class which encapsulates a LinearRing that acts as outer boundary in a PolygonType
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	public class PolygonTypeOuterBoundaryIs 
	{
		/// <summary>
		/// The LinearRing this outer boundary encapsulates
		/// </summary>
		public LinearRingType LinearRing;
		/// <summary>
		/// Constructs empty outer boundary
		/// </summary>
		public PolygonTypeOuterBoundaryIs()	{	}
		/// <summary>
		/// Constructs outer boundary using specified CoordinatesType
 		/// </summary>
		/// <param name="cdt">CoordinatesType which defines the LinearRing</param>
		public PolygonTypeOuterBoundaryIs(gml.CoordinatesType cdt)
		{
			LinearRing = new LinearRingType(cdt);
		}
	}

	/// <summary>
	/// Class which encapsulates a LinearRing that acts as inner boundaries in a PolygonType
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	public class PolygonTypeInnerBoundaryIs 
	{

		/// <summary>
		/// The LinearRing this inner boundary encapsulates
		/// </summary>
		public LinearRingType LinearRing;
		/// <summary>
		/// Constructs empty inner boundary
		/// </summary>
		public PolygonTypeInnerBoundaryIs()	{	}
		/// <summary>
		/// Constructs inner boundary using specified CoordinatesType
		/// </summary>
		/// <param name="cdt">CoordinatesType which defines the LinearRing</param>
		public PolygonTypeInnerBoundaryIs(gml.CoordinatesType cdt)
		{
			LinearRing=new LinearRingType(cdt);
		}
	}

	#endregion

	#region aggregate geometries

	/// <summary>
	/// Encapsulates one or more geometry types, either mixed or uniform geometry types
	/// The geometry type must be wrapped inside a GeometryAssociation first.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("MultiGeometry", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class GeometryCollectionType : AbstractGeometryCollectionBaseType 
	{
		/// <summary>
		/// Array of GeometryAssociationTypes as members of this collection
		/// </summary>
		[XmlElement("geometryMember")]
		public GeometryAssociationType[] geometryMember=new GeometryAssociationType[0];

		/// <summary>
		/// Constructs empty GeometryCollection and default SRS name
		/// </summary>
		public GeometryCollectionType() : base() {	}

		/// <summary>
		/// Constructs empty GeometryCollection with specified SRS name
		/// </summary>
		/// <param name="srsName">Spatial Reference System name</param>
		public GeometryCollectionType(string srsName) : base(srsName) {}

		/// <summary>
		/// Constructs GeometryCollection with specified SRS name and members.
		/// </summary>
		/// <param name="srsName">Spatial Reference System name</param>
		/// <param name="members">members of this collection</param>
		public GeometryCollectionType(string srsName,GeometryAssociationType[] members) : base(srsName)
		{
			geometryMember=members;
		}

		/// <summary>
		/// Creates svg Group which contains svg object from each members.
		/// </summary>
		/// <returns>svg Group object</returns>
		public override svg.SvgElement createSvgObject()
		{
			svg.group g = new svg.group();
			g.Items = new svg.SvgElement[geometryMember.Length];
			for(int i=0;i<geometryMember.Length;i++ )
			{
				g.Items[i]=geometryMember[i].createSvgElement(); 
			}
			return g;
		}

		/// <summary>
		/// Draws graphics for each member of the collection
		/// </summary>
		/// <param name="g">Graphics to put drawing in</param>
		/// <param name="p">Pen for drawing</param>
		/// <param name="b">Brush for drawing</param>
		public override void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b)
		{
			for(int i=0;i<geometryMember.Length;i++ )
			{
				geometryMember[i].DrawGraphics(ref g, ref p, ref b); 
			}
		}
	}
	
	/// <summary>
	/// Encapsulates one or more PointTypes
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("MultiPoint", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class MultiPointType : GeometryCollectionType 
	{
		/// <summary>
		/// Member of this collection
		/// </summary>
		[XmlElement("pointMember")]
		public gml.GeometryAssociationType[] pointMember;

		/// <summary>
		/// Constructs empty MultiPointType
		/// </summary>
		public MultiPointType() : base() {	}

		/// <summary>
		/// Constructs empty MultiPointType with specified SRS name.
		/// </summary>
		/// <param name="srsName">Spatial Reference System name</param>
		public MultiPointType(string srsName) : base(srsName)
		{}

		/// <summary>
		/// Constructs MultiPointType with specified SRS name and members.
		/// </summary>
		/// <param name="srsName">Spatial Reference System name</param>
		/// <param name="points">members of this collection</param>
		public MultiPointType(string srsName, gml.PointType[] points) : base(srsName)
		{
			pointMember=new gml.GeometryAssociationType[points.Length];
			for(int i=0;i<points.Length;i++)
			{
				pointMember[i]=new gml.GeometryAssociationType(points[i]);			
			}
		}

		/// <summary>
		/// Creates svg Group object from this MultiPointType members.
		/// </summary>
		/// <returns>svg Group which contains svg objects from each member.</returns>
		public override svg.SvgElement createSvgObject()
		{
			svg.group g = new svg.group();
			g.Items = new svg.SvgElement[pointMember.Length];
			for(int i=0;i<pointMember.Length;i++ )
			{
				pointMember[i].Item.PointRadius = this.PointRadius;
				g.Items[i]=pointMember[i].createSvgElement();
			}
			return g;
		}

		/// <summary>
		/// Draws graphics for each member of this collection
		/// </summary>
		/// <param name="g">Graphics object to draw to</param>
		/// <param name="p">Pen for drawing</param>
		/// <param name="b">Brush for drawing</param>
		public override void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b)
		{
			for(int i=0;i<pointMember.Length;i++ )
			{
				pointMember[i].Item.PointRadius = this.PointRadius;
				pointMember[i].DrawGraphics(ref g, ref p, ref b); 
			}			
		}
	}

	/// <summary>
	/// Encapsulates one or more LineStrings
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("MultiLineString", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class MultiLineStringType : GeometryCollectionType 
	{
		/// <summary>
		/// Members of this MultiLineStringType
		/// </summary>
		[XmlElement("lineStringMember")]
		public gml.GeometryAssociationType[] lineStringMember;

		/// <summary>
		/// Constructs empty MultiLineStringType
		/// </summary>
		public MultiLineStringType():base(){}
		/// <summary>
		/// Constructs empty MultiLineStringType with specified SRS name
		/// </summary>
		/// <param name="srsName">Spatial Reference System name</param>
		public MultiLineStringType(string srsName) : base(srsName)
		{}

		/// <summary>
		/// Constructs MultiLineStringType with specified SRS name and members.
		/// </summary>
		/// <param name="srsName">Spatial Reference System name</param>
		/// <param name="LSArray">members of this collection</param>
		public MultiLineStringType(string srsName, gml.LineStringType[] LSArray) : base(srsName)
		{
			lineStringMember=new gml.GeometryAssociationType[LSArray.Length];
			for(int i=0;i<LSArray.Length;i++)
			{
				lineStringMember[i]=new gml.GeometryAssociationType(LSArray[i]);
			}
		}

		/// <summary>
		/// Creates svg Group object using members of this collection
		/// </summary>
		/// <returns>svg Group which contains svg object for each member of the collection</returns>
		public override svg.SvgElement createSvgObject()
		{
			svg.group g = new svg.group();
			g.Items = new svg.SvgElement[lineStringMember.Length];
			for(int i=0;i<lineStringMember.Length;i++ )
			{
				g.Items[i]=lineStringMember[i].createSvgElement(); 
			}
			return g;
		}

		/// <summary>
		/// Draws graphics for each member of the collection
		/// </summary>
		/// <param name="g">Graphics to draw to</param>
		/// <param name="p">Pen for drawing</param>
		/// <param name="b">Brush for drawing</param>
		public override void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b)
		{
			for(int i=0;i<lineStringMember.Length;i++ )
			{
				lineStringMember[i].DrawGraphics(ref g, ref p, ref b); 
			}			
		}
	}

	/// <summary>
	/// Encapsulates one or more PolygonType
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("MultiPolygon", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class MultiPolygonType : GeometryCollectionType 
	{
		/// <summary>
		/// Members of this collection
		/// </summary>
		[XmlElement("polygonMember")]
		//public gml.PolygonType[] polygonMember;
		public gml.GeometryAssociationType[] polygonMember;

		/// <summary>
		/// Constructs empty MultiPolygonType
		/// </summary>
		public MultiPolygonType() : base() {	}
		/// <summary>
		/// Constructs empty MultiPolygonType with specified SRS name
		/// </summary>
		/// <param name="srsName">Spatial Reference System name</param>
		public MultiPolygonType(string srsName) : base(srsName)
		{
		}
		/// <summary>
		/// Constructs MultiPolygonType with specified SRS name and members
		/// </summary>
		/// <param name="srsName">Spatial Reference System name</param>
		/// <param name="PGArray">members of this collection</param>
		public MultiPolygonType(string srsName, gml.PolygonType[] PGArray) : base(srsName)
		{
			polygonMember=new gml.GeometryAssociationType[PGArray.Length];
			for(int i=0;i<PGArray.Length;i++)
			{
				polygonMember[i]=new gml.GeometryAssociationType(PGArray[i]);
			}
		}

		/// <summary>
		/// Creates svg Group object using members of this collection
		/// </summary>
		/// <returns>svg Group which contains svg object for each member of the collection</returns>
		public override svg.SvgElement createSvgObject()
		{
			svg.group g = new svg.group();
			g.Items = new svg.SvgElement[polygonMember.Length];
			for(int i=0;i<polygonMember.Length;i++ )
			{
				g.Items[i]=polygonMember[i].createSvgElement(); 
			}
			return g;
		}

		/// <summary>
		/// Draws graphics for each member of the collection
		/// </summary>
		/// <param name="g">Graphics to draw to</param>
		/// <param name="p">Pen for drawing</param>
		/// <param name="b">Brush for drawing</param>
		public override void DrawGraphics(ref Graphics g, ref Pen p, ref Brush b)
		{
			for(int i=0;i<polygonMember.Length;i++ )
			{
				polygonMember[i].DrawGraphics(ref g, ref p, ref b); 
			}			
		}
	}
	#endregion

}