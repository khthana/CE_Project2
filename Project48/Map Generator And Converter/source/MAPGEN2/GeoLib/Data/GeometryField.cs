///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Xml;
using System.Xml.Schema;
using System.CodeDom;

using GeoCon.Classification;
namespace GeoCon.Data
{
	/// <summary>
	/// Field for gml.GeometryPropertyType.
	/// </summary>
	[Serializable]
	public class GeometryField : Field  
	{
		/// <summary>
		/// Bounding box of this GeometryField
		/// </summary>
		public gml.BoxType BoundingBox;

		/// <summary>
		/// Type of symbol suitable for this GeometryField. Used in Bin.Symbol.Type
		/// </summary>
		public SymbolTypeEnum SymbolType = SymbolTypeEnum.None;

		/// <summary>
		/// Constructs default GeometryField
		/// </summary>
		public GeometryField()
		{
			this.Name="TheGeometry";
			this._isGeometry=true;
			this.Type=null;
			this.SchemaDataType ="";
		}

		#region Add method overload
		/// <summary>
		/// Adds a geometry property
		/// </summary>
		/// <param name="gprop">geometry property object to add</param>
		/// <returns>index of the newly added geometry property</returns>
		public int Add(gml.GeometryPropertyType gprop)
		{
			if(Type!=geometryPT) checkType(gprop); //already the most general
			return this.List.Add(gprop);
		}

		private static System.Type geometryPT=typeof(gml.GeometryPropertyType);
		private static System.Type pointPT=typeof(gml.PointPropertyType);
		private static System.Type linestringPT=typeof(gml.LineStringPropertyType );
		private static System.Type polygonPT=typeof(gml.PolygonPropertyType);
		private static System.Type mpointPT=typeof(gml.MultiPointPropertyType);
		private static System.Type mlinestringPT=typeof(gml.MultiLineStringPropertyType);
		private static System.Type mpolygonPT=typeof(gml.MultiPolygonPropertyType);
		private static System.Type mgeometryPT=typeof(gml.MultiGeometryPropertyType);

		/// <summary>
		/// Check the type of geometry property instance 
		/// </summary>
		/// <param name="gprop">geometry property to check</param>
		private void checkType(gml.GeometryPropertyType gprop)
		{
			if(pointPT.IsInstanceOfType(gprop))
			{
				adjustType(pointPT);
				SymbolType=SymbolTypeEnum.Point;
			}
			else if(linestringPT.IsInstanceOfType(gprop))
			{
				adjustType(linestringPT);
				SymbolType=SymbolTypeEnum.Line;
			}
			else if(polygonPT.IsInstanceOfType(gprop))
			{
				adjustType(polygonPT);
				SymbolType=SymbolTypeEnum.Polygon;
			}
			else if(mpointPT.IsInstanceOfType(gprop))
			{
				adjustType(mpointPT);
				SymbolType=SymbolTypeEnum.Point;
			}
			else if(mlinestringPT.IsInstanceOfType(gprop))
			{
				adjustType(mlinestringPT);
				SymbolType=SymbolTypeEnum.Line;
			}
			else if(mpolygonPT.IsInstanceOfType(gprop))
			{
				adjustType(mpolygonPT);
				SymbolType=SymbolTypeEnum.Polygon;
			}		
			else if(mgeometryPT.IsInstanceOfType(gprop))
			{
				adjustType(mgeometryPT);
				SymbolType=SymbolTypeEnum.Mixed;
			}
			else	//ie. gprop=null ?
			{
				//do nothing
			}
		}

		/// <summary>
		/// Updates this field Type,DataType and SymboType according to a geometry type.
		/// </summary>
		/// <param name="theType">the type of the geometry property</param>
		private void adjustType(System.Type theType)
		{
			if(Type==null) 
			{
				Type=theType;
				SchemaDataType=Type.Name;
			}
			else
			{
				if(Type!=theType) 
				{
					Type=geometryPT; //set to the most general
					SchemaDataType=Type.Name;
					SymbolType=SymbolTypeEnum.Mixed;
				}
			}
		}

		#endregion

		#region schema
		/// <summary>
		/// Creates a schema element object for GeometryField.
		/// </summary>
		/// <returns>schema type object which will be a sequence member inside a complex type declaration.</returns>
		public override XmlSchemaElement CreateSchemaElement()
		{
			XmlSchemaElement xse = new XmlSchemaElement();
			xse.Name=Name; 
			xse.IsNillable=true;
			xse.MinOccurs=0;
			xse.MaxOccurs=1;
			xse.SchemaTypeName = new XmlQualifiedName(SchemaDataType,"http://www.opengis.net/gml");
			if(this.Description!=String.Empty) xse.Annotation = this.CreateAnnotation();
			return xse;
		}

		/// <summary>
		/// Creates a schema type object for this Field. Always return null.
		/// Currently unused.
		/// </summary>
		/// <returns>always null</returns>
		protected override XmlSchemaType CreateSchemaType()
		{
			//we don't need this
			return null;
 		}
		#endregion

		public override System.CodeDom.CodeTypeMember CreateCodeType()
		{
			CodeMemberField cmf = new CodeMemberField(Type,Name);
			cmf.Attributes = MemberAttributes.Public;

			//do not serialized null shape 
			CodeAttributeArgument caa = new CodeAttributeArgument("IsNullable",new System.CodeDom.CodePrimitiveExpression(false));
			CodeAttributeArgument[] caas = new CodeAttributeArgument[1]{caa};
			CodeAttributeDeclaration cad = new CodeAttributeDeclaration("XmlElement",caas);
			cmf.CustomAttributes.Add(cad);

			return cmf;
		}


		/// <summary>
		/// Create Bins using single value classification type.
		/// </summary>
		/// <param name="cinfo">Classification info on how to classify.</param>
		/// <returns>Collection of bins</returns>
		public override BinCollection CreateBins(ClassificationInfo cinfo,System.Collections.ArrayList indexes)
		{
			Classifier c = new Classifier(cinfo,indexes);
			BinCollection bins;
			switch (cinfo.Type)
			{
				case ClassificationType.SingleValue :
					bins = c.ClassifySingle();
					break;
				case ClassificationType.UniqueValues :
					bins = c.ClassifyUnique();
					break;
				default :
					bins = c.ClassifySingle();
					break;
			}
			c=null;
			return bins;
		}
	}
}
