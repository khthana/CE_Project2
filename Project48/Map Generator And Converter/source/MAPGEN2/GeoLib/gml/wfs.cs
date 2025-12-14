///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Xml;  
using System.Xml.Schema;
using System.Xml.Serialization;

namespace wfs
{
	/// <summary>
	/// Encapsulates a collection of FeatureAssociation.
	/// Defines a container for the response to a GetFeature request.  
	/// </summary>
	// If the request is GetFeatureWithLock, the lockId attribute must be populated.  
	// The lockId attribute can otherwise be safely ignored.
	[Serializable]
	[XmlType("FeatureCollection", Namespace="http://www.opengis.net/wfs")]
	public class FeatureCollectionType : gml.AbstractFeatureCollectionType
	{
		public string lockId;	//optional

		[XmlAttribute(DataType="string",Namespace="http://www.w3.org/2001/XMLSchema")]
		public string schemaLocation; //optional

		/// <summary>
		/// Creates new FeatureCollectionType with no members and null bounding box.
		/// </summary>
		public FeatureCollectionType() : base() {}

		/// <summary>
		/// Creates new FeatureCollectionType with no members and specified bounding box.
		/// </summary>
		/// <param name="bound">the bounding box of the collection</param>
		public FeatureCollectionType(gml.BoundingShapeType bound) : base(bound)	{}

		/// <summary>
		/// Creates new FeatureCollectionType specified members and null bounding box.
		/// </summary>
		/// <param name="features">feature members of the collection</param>
		public FeatureCollectionType(gml.FeatureAssociationType[] features) : base(features) {}
	}
}


