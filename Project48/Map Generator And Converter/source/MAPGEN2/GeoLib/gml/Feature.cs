///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
 
using System;
using System.Xml;  
using System.Xml.Schema;
using System.Xml.Serialization;

namespace gml
{

	#region absract feature types
	/// <summary>
	/// All features must derived from this abstract class.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	//[XmlIncludeAttribute(typeof(AbstractFeatureCollectionBaseType))]
	public abstract class AbstractFeatureType //: MarshalByRefObject
	{
		/// <summary>
		/// Description about this feature
		/// </summary>
		[XmlElement("description")] public string description;	//minOccurs=0
		/// <summary>
		/// Name of the feature
		/// </summary>
		[XmlElement("name")] public string name;				//minOccurs=0

		/// <summary>
		/// Bounding box of the feature
		/// </summary>
		[XmlElement("boundedBy", typeof(gml.BoundingShapeType))]
		public gml.BoundingShapeType boundedBy;					//minOccurs=0

		/// <summary>
		/// ID of the feature
		/// </summary>
		[XmlAttribute(DataType="ID")] public string fid;		//optional

		//add additional properties here in derived class (e.g non-geometry feature data)

		/// <summary>
		/// Constructs empty feature
		/// </summary>
		public AbstractFeatureType(){	}

		/// <summary>
		/// Constructs empty feature with specified bounding.
		/// </summary>
		/// <param name="bound">Bounding type of this feature</param>
		public AbstractFeatureType(gml.BoundingShapeType bound)
		{
			boundedBy=bound;
		}
	}

	/// <summary>
	/// Feature Collection base type with mandatory bounding shape property.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	public abstract class AbstractFeatureCollectionBaseType : gml.AbstractFeatureType 
	{
		/// <summary>
		/// Constructs AbstractFeatureCollectionBaseType with bounding type set to NullType
		/// </summary> 
		public AbstractFeatureCollectionBaseType()
		{
			//since boundedBy is mandatory here, assign default value of 'unknown'
			boundedBy = new gml.BoundingShapeType(new gml.NullType());
		}
		/// <summary>
		/// Constructs AbstractFeatureCollectionBaseType with specified bounding type.
		/// </summary>
		/// <param name="bound">Bounding shape type of this collection</param>
		public AbstractFeatureCollectionBaseType(gml.BoundingShapeType bound)
		{
			boundedBy = bound;
		}
	}

	/// <summary>
	/// A feature collection contains zero or more featureMember elements.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	//[XmlIncludeAttribute(typeof(AbstractFeatureType))]
	public abstract class AbstractFeatureCollectionType : gml.AbstractFeatureCollectionBaseType 
	{
		/// <summary>
		/// Members of this collection
		/// </summary>
		[XmlElement("featureMember")]
		public FeatureAssociationType[] featureMember=null; 

		/// <summary>
		/// Constructs AbstractFeatureCollectionType with default bounding type.
		/// </summary>
		public AbstractFeatureCollectionType():base()	{	}
		/// <summary>
		/// Constructs AbstractFeatureCollectionType with specified bounding type.
		/// </summary>
		/// <param name="bound">Bounding type of the collection</param>
		public AbstractFeatureCollectionType(gml.BoundingShapeType bound) : base(bound)	{}
		/// <summary>
		/// Constructs AbstractFeatureCollectionType with specified bounding type and members.
		/// </summary>
		/// <param name="bound">Bounding type of the collection</param>
		/// <param name="features">Members of this collection</param>
		public AbstractFeatureCollectionType(gml.BoundingShapeType bound,gml.FeatureAssociationType[] features) : base(bound)
		{
			setMembers(features);
		}
		/// <summary>
		/// Constructs AbstractFeatureCollectionType with default bounding type and specified members.
		/// </summary>
		/// <param name="features">Members of this collection</param>
		public AbstractFeatureCollectionType(gml.FeatureAssociationType[] features) : base()
		{
			setMembers(features);
		}
		/// <summary>
		/// Sets members of this collection to specified features.
		/// </summary>
		/// <param name="features">features which will be the members</param>
		public void setMembers(gml.FeatureAssociationType[] features)
		{
			featureMember=features;
		}
		/// <summary>
		/// Adds specified features to existing members of this collection.
		/// </summary>
		/// <param name="features">feature members to add to the collection</param>
		public void addMembers(gml.FeatureAssociationType[] features)
		{
			if(featureMember==null) 
			{
				featureMember=features;
				return;
			}
			long total= featureMember.Length + features.Length;
			gml.FeatureAssociationType[] temp = new FeatureAssociationType[total]; 
			featureMember.CopyTo(temp,0);
			features.CopyTo(temp,featureMember.Length);
			featureMember=temp;
		}
	}
	#endregion

	#region feature association
	/// <summary>
	/// Array of this class instances serve as items on
	/// gml.AbstractFeatureCollectionType.featureMember
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("featureMember", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	//must include any derived custom class here or at runtime later
	public class FeatureAssociationType : gml.AssociationAttributeGroup 
	{
		
		/// <summary>
		/// enclose either gml.Feature or gml.FeatureCollection as a member
		/// </summary>
		public gml.AbstractFeatureType Item;
		//and ... any derivation of gml.AbstractFeatureType?
	
		/// <summary>
		/// Constructs empty FeatureAssociationType
		/// </summary>
		public FeatureAssociationType(){}
		/// <summary>
		/// Constructs FeatureAssociationType with new member
		/// </summary>
		/// <param name="newItem">FeatureType to be set as member</param>
		public FeatureAssociationType(gml.AbstractFeatureType newItem)
		{
			Item = newItem;
		}
	}
	#endregion

	#region basic geometry properties

	//TODO : create superclass for GeometryProperty, this is not really a correct derivation by restriction

	/// <summary>
	/// simple geometric property encapsulates a geometry element
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("geometryProperty", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	[XmlIncludeAttribute(typeof(MultiGeometryPropertyType))]
	[XmlIncludeAttribute(typeof(MultiPolygonPropertyType))]
	[XmlIncludeAttribute(typeof(MultiLineStringPropertyType))]
	[XmlIncludeAttribute(typeof(MultiPointPropertyType))]
	[XmlIncludeAttribute(typeof(LineStringPropertyType))]
	[XmlIncludeAttribute(typeof(PolygonPropertyType))]
	[XmlIncludeAttribute(typeof(PointPropertyType))]
//	[XmlIncludeAttribute(typeof(NullGeometryPropertyType))] //not gml spec
	public class GeometryPropertyType : gml.AssociationAttributeGroup , IComparable 
	{
		/// <summary>
		/// Geometry element encapsulated by this property.
		/// </summary>
		[XmlElement("Point", typeof(gml.PointType))]
		[XmlElement("LineString", typeof(gml.LineStringType))]
		[XmlElement("LinearRing", typeof(gml.LinearRingType))]
		[XmlElement("Polygon", typeof(gml.PolygonType))]
		[XmlElement("MultiPoint", typeof(gml.MultiPointType))]
		[XmlElement("MultiLineString", typeof(gml.MultiLineStringType))]
		[XmlElement("MultiPolygon", typeof(gml.MultiPolygonType))]
		//or any derivation of gml.AbstractGeometryType
		public gml.AbstractGeometryType Item;

		/// <summary>
		/// Constructs empty GeometryPropertyType
		/// </summary>
		public GeometryPropertyType()	{}
		/// <summary>
		/// Constructs GeometryPropertyType which encapsulates a GeometryType
		/// </summary>
		/// <param name="geom">GeometryType as Item of this property</param>
		public GeometryPropertyType(gml.AbstractGeometryType geom)
		{
			Item = geom;
		}

		[XmlIgnore]
		protected virtual int objcomp
		{
			get{return 0;}
		}
		public int CompareTo(object obj)
		{
			if(obj==null || obj==System.DBNull.Value) return -1;
			if(!typeof(GeometryPropertyType).IsInstanceOfType(obj)) return -1;
			if(this.objcomp > ((GeometryPropertyType)obj).objcomp) 
			{
				return 1;
			}
			else if(this.objcomp == ((GeometryPropertyType)obj).objcomp) 
			{
				return 0;
			}
			return -1;
		}
		public override bool Equals(object obj)
		{
			if(CompareTo(obj)==0) return true;
			return false;
		}
		public override int GetHashCode()
		{
			return base.GetHashCode ();
		}
		public override string ToString()
		{
			return this.GetType().Name;
		}

	}

//	/// <summary>
//	/// this is not gml spec
//	/// </summary>
//	[Serializable]
//	[XmlType(Namespace="http://www.opengis.net/gml",IncludeInSchema = false)]
//	[XmlRoot("empty", Namespace="http://www.opengis.net/gml", IsNullable=false)]
//	public class NullGeometryPropertyType : GeometryPropertyType 
//	{
//		public NullGeometryPropertyType()	{}
//	}

	/// <summary>
	/// Encapsulates a single point to represent position, location, or centerOf properties.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("pointProperty", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class PointPropertyType : GeometryPropertyType 
	{
		//Item already in the base class
		/// <summary>
		/// Constructs empty PointProperty
		/// </summary>
		public PointPropertyType()	{	}
		/// <summary>
		/// Constructs PointProperty which encapsulates a PointType.
		/// </summary>
		/// <param name="aPoint">PointType to be set as Item for this property</param>
		public PointPropertyType(gml.PointType aPoint) : base(aPoint){}

		[XmlIgnore]
		protected override int objcomp{get{return 10;}}	
	}
	/// <summary>
	/// Encapsulates a single point to represent location property. Alias for pointProperty
	/// </summary>
	public class location : PointPropertyType {	public location(){ } }
	/// <summary>
	/// Encapsulates a single point to represent centerOf property. Alias for pointProperty
	/// </summary>
	public class centerOf : PointPropertyType {	public centerOf(){ } }
	/// <summary>
	/// Encapsulates a single point to represent position property. Alias for pointProperty
	/// </summary>
	public class position : PointPropertyType {	public position(){ } }


	/// <summary>
	/// Encapsulates a single LineString to represent centerLineOf or edgeOf properties.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("lineStringProperty", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class LineStringPropertyType : GeometryPropertyType 
	{
		/// <summary>
		/// Constructs empty LineStringProperty.
		/// </summary>
		public LineStringPropertyType()	{	}
		/// <summary>
		/// Constructs LineStringProperty which encapsulates a LineStringType.
		/// </summary>
		/// <param name="aLine">LineStringType to be set as Item for this property</param>
		public LineStringPropertyType(gml.LineStringType aLine) : base(aLine)	{}

		[XmlIgnore]
		protected override int objcomp{get{return 20;}}
	}
	/// <summary>
	/// Encapsulates a single LineString to represent edgeOf property. Alias for lineStringProperty
	/// </summary>
	public class edgeOf : LineStringPropertyType { public edgeOf(){ } }
	/// <summary>
	/// Encapsulates a single LineString to represent centerLineOf property. Alias for lineStringProperty
	/// </summary>
	public class centerLineOf : LineStringPropertyType { public centerLineOf(){ } }


	/// <summary>
	/// Encapsulates a single polygon to represent coverage or extentOf properties.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("polygonProperty", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class PolygonPropertyType : GeometryPropertyType 
	{
		/// <summary>
		/// Constructs empty PolygonProperty.
		/// </summary>
		public PolygonPropertyType(){	}
		/// <summary>
		/// Constructs PolygonProperty which encapsulates a PolygonType.
		/// </summary>
		/// <param name="aPgon">PolygonType to be set as Item for this property</param>
		public PolygonPropertyType(gml.PolygonType aPgon) : base(aPgon)	{}

		[XmlIgnore]
		protected override int objcomp{get{return 30;}}
	}
	
	/// <summary>
	/// Encapsulates a single polygon to represent extentOf property. Alias for polygonProperty.
	/// </summary>
	public class extentOf : PolygonPropertyType { public extentOf(){ } }
	/// <summary>
	/// Encapsulates a single polygon to represent coverage property. Alias for polygonProperty.
	/// </summary>
	public class coverage : PolygonPropertyType { public coverage(){ } }
	#endregion

	#region aggregate geometry properties
	/// <summary>
	/// Encapsulates a MultiGeometry element.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("multiGeometryProperty", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class MultiGeometryPropertyType : GeometryPropertyType
	{
		//Item already in base class
		/// <summary>
		/// The MultiGeometry element encapsulated by this property.
		/// </summary>
		public GeometryCollectionType MultiGeometry;

		/// <summary>
		/// Constructs new MultiGeometryProperty.
		/// </summary>
		public MultiGeometryPropertyType()	{	}
		/// <summary>
		/// Constructs new MultiGeometryProperty which encapsulates a GeometryCollection.
		/// </summary>
		/// <param name="coll">GeometryCollection to be set as Item for this property</param>
		public MultiGeometryPropertyType(gml.GeometryCollectionType coll) : base(coll)	{}

		[XmlIgnore]
		protected override int objcomp{get{return 40;}}
	}

	/// <summary>
	/// Encapsulates a MultiPoint element to represent the following 
	/// discontiguous geometric properties: multiLocation, multiPosition, multiCenterOf.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("multiPointProperty", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class MultiPointPropertyType : GeometryPropertyType 
	{
		//Item already in base class
		/// <summary>
		/// Constructs empty MultiPointProperty
		/// </summary>
		public MultiPointPropertyType()	{}
		/// <summary>
		/// Constructs new MultiPointProperty which encapsulates a MultiPointType.
		/// </summary>
		/// <param name="mpoint">MultiPoint to be set as Item for this property</param>
		public MultiPointPropertyType(gml.MultiPointType mpoint) : base(mpoint) {}

		[XmlIgnore]
		protected override int objcomp{get{return 50;}}
	}

	/// <summary>
	/// Encapsulates a MultiPoint element to represent multiLocation. Alias for MultiPointProperty
	/// </summary>
	public class multiLocation : MultiPointPropertyType {	public multiLocation(){ } }
	/// <summary>
	/// Encapsulates a MultiPoint element to represent multiCenterOf. Alias for MultiPointProperty
	/// </summary>
	public class multiCenterOf : MultiPointPropertyType {	public multiCenterOf(){ } }
	/// <summary>
	/// Encapsulates a MultiPoint element to represent multiPosition. Alias for MultiPointProperty
	/// </summary>
	public class multiPosition : MultiPointPropertyType {	public multiPosition(){ } }


	/// <summary>
	/// Encapsulates a MultiLineString element to represent the following
	/// discontiguous geometric properties: multiEdgeOf, multiCenterLineOf.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("multiLineStringProperty", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class MultiLineStringPropertyType : GeometryPropertyType 
	{
		/// <summary>
		/// Constructs new empty MultiLineStringProperty.
		/// </summary>
		public MultiLineStringPropertyType(){}
		/// <summary>
		/// Constructs new MultiLineStringProperty which encapsulates a MultiLineStringType.
		/// </summary>
		/// <param name="mlstring">MultiLineString to be set as Item for this property</param>
		public MultiLineStringPropertyType(gml.MultiLineStringType mlstring) : base(mlstring)	{}

		[XmlIgnore]
		protected override int objcomp{get{return 60;}}
	}

	/// <summary>
	/// Encapsulates a MultiLineString element to represent multiCenterLineOf. Alias for MultiLineStringProperty. 
	/// </summary>
	public class multiCenterLineOf : MultiLineStringPropertyType { public multiCenterLineOf(){ } }
	/// <summary>
	/// Encapsulates a MultiLineString element to represent multiEdgeOf. Alias for MultiLineStringProperty. 
	/// </summary>
	public class multiEdgeOf : MultiLineStringPropertyType { public multiEdgeOf(){ } }


	/// <summary>
	/// Encapsulates a MultiPolygon to represent the following discontiguous 
	/// geometric properties: multiCoverage, multiExtentOf.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("multiPolygonProperty", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class MultiPolygonPropertyType : GeometryPropertyType 
	{
		/// <summary>
		/// Constructs new empty MultiPolygonProperty.
		/// </summary>
		public MultiPolygonPropertyType() { }
		/// <summary>
		/// Constructs new MultiPolygonProperty which encapsulates a MultiPolygonType.
		/// </summary>
		/// <param name="mpgon">MultiPolygon to be set as Item for this property</param>
		public MultiPolygonPropertyType(gml.MultiPolygonType mpgon) : base(mpgon){}

		[XmlIgnore]
		protected override int objcomp{get{return 70;}}
	}
	/// <summary>
	/// Encapsulates a MultiPolygon to represent multiExtentOf. Alias for multiPolygonProperty. 
	/// </summary>
	public class multiExtentOf : MultiPolygonPropertyType { public multiExtentOf(){ } }
	/// <summary>
	/// Encapsulates a MultiPolygon to represent multiCoverage. Alias for multiPolygonProperty. 
	/// </summary>
	public class multiCoverage : MultiPolygonPropertyType { public multiCoverage(){ } }
	#endregion

	#region bounding box and nulltype
	/// <summary>
	/// Bounding shapes--a Box or a null element.
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("boundedBy", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class BoundingShapeType 
	{
		/// <summary>
		/// The bounding shape value.
		/// </summary>
		[XmlElement("Box", typeof(BoxType))]
		[XmlElement("null", typeof(NullType))]
		public object Item;
		
		/// <summary>
		/// Constructs new BoundingShape with default NullType unknown.
		/// </summary>
		public BoundingShapeType()	{ Item=new NullType();	}
		/// <summary>
		/// Constructs new BoundingShape from a BoxType.
		/// </summary>
		/// <param name="box"></param>
		public BoundingShapeType(gml.BoxType box)
		{
			Item=box;
		}
		/// <summary>
		/// Constructs new BoundingShape from a specified NullType.
		/// </summary>
		/// <param name="boxnull"></param>
		public BoundingShapeType(gml.NullType boxnull)
		{
			Item=boxnull;
		}
	}

	/// <summary>
	/// If a bounding shape is not provided for a feature collection
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	public class NullType
	{
		/// <summary>
		/// String value of the NullType choice
		/// </summary>
		[XmlChoiceIdentifier("itemType")]
		[XmlText]
		public string NullChoice;

		/// <summary>
		/// Enumerated choice of the NullType
		/// </summary>
		[XmlIgnore]
		public NullTypeChoice itemType;

		/// <summary>
		/// create NullType with initial choice "unknown"
		/// </summary>
		public NullType()
		{
			NullChoice ="unknown";
			itemType = NullTypeChoice.unknown;
		}

		/// <summary>
		/// create NullType with choice value of :
		/// "inapplicable","unknown","unavailable","missing"
		/// </summary>
		public NullType(string choiceString)
		{
			NullChoice=choiceString;
			switch (choiceString) 
			{
				case "inapplicable" :
					itemType=NullTypeChoice.inapplicable; 
					break;
				case "unknown" :
					itemType=NullTypeChoice.unknown;
					break;
				case "unavailable" :
					itemType=NullTypeChoice.unavailable;
					break;
				case "missing" :
					itemType=NullTypeChoice.missing;
					break;
				default:
					NullChoice=null;
					throw new System.ArgumentOutOfRangeException("choice : ",choiceString," not applicable for gml:NullType."); 
					//break;
			}
		}
	}

	/// <summary>
	/// Enumeration for reasons of using this NullType 
	/// </summary>
	[Serializable]
	[XmlType(IncludeInSchema = false)]
	public enum NullTypeChoice 
	{
		inapplicable,
		unknown,
		unavailable,
		missing,
	}
	#endregion

}


