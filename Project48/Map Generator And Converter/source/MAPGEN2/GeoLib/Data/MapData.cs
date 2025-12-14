///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Collections;
using System.Reflection;
using System.CodeDom;
using System.CodeDom.Compiler;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;

using GeoCon.Classification;
 
namespace GeoCon.Data
{
	/// <summary>
	/// Encapsulates a FieldCollection. Represents a map unit.
	/// </summary>

	[Serializable]
	public class MapData 
	{
		/// <summary>
		/// Constructs new MapData.
		/// </summary>
		public MapData()
		{
			_fields = new FieldCollection(); 
		}

		#region public & private fields

		/// <summary>
		/// Information about this map.
		/// </summary>
		public MapDataInfo Info = new MapDataInfo();

		/// <summary>
		/// The bounding box of this map geometry.
		/// </summary>
		public gml.BoxType BoundingBox;

		/// <summary>
		/// Custom Type which will be used in serializing GML.
		/// This custom type loads on separate AppDomain, so it can be unloaded readily.
		/// </summary>
		public System.Type customType;

		private string _name;
		private bool isactive=true;
		private string _namespaceprefix;
		private string _namespacename;
		private FieldCollection _fields;
		private BinCollection _bins;
		private ClassificationInfo cinfo=new ClassificationInfo();

		#endregion

		#region common properties
		/// <summary>
		/// Gets or sets the name of the map
		/// </summary>
		public string Name
		{
			get{return _name;}
			set{_name=System.Xml.XmlConvert.EncodeName(value);}
		}

		private string desc="";
		/// <summary>
		/// Gets or sets description about this MapData.
		/// </summary>
		public string Description
		{
			get
			{
				return desc;
			}
			set{desc=value;}
		}

		/// <summary>
		/// Gets or sets whether this map is included when exporting,classifying or other operations.
		/// The map also automatically set inactive whenever all of its field are set inactive.
		/// </summary>
		public bool isActive
		{
			get	
			{
				if(isactive)
				{
					if(this.Fields.getActiveCount(false)==0) isactive=false;
				}
				return isactive;
			}
			set 
			{
				if(value)
				{
					if(this.Fields.getActiveCount(false)==0) 
					{
						throw new System.Exception("At least one field must also active."); 
						//System.Windows.Forms.MessageBox.Show("At least one field must also active.");
					}
				}
				isactive=value;
			}
		}


		/// <summary>
		/// Gets or sets custom namespace prefix when user need to distinguish one map namespace to another
		/// when exporting to GML. It must also be supplied with distinguish namespace name.
		/// </summary>
		public string NamespacePrefix
		{
			get{return _namespaceprefix;}
			set{_namespaceprefix=value;}
		}

		/// <summary>
		/// Gets or sets custom namespace name if the user need to distinguish 
		/// one map namespace to another when exporting to GML.
		/// </summary>
		public string NamespaceName
		{
			// TODO : test this feature
			get{return _namespacename;}
			set{_namespacename=value;}
		}

		/// <summary>
		/// Gets or sets data fields collection for this map
		/// </summary>
		public FieldCollection Fields
		{
			get{return _fields;}
			set{_fields=value;}
		}


		#endregion

		#region classification stuff
		/// <summary>
		/// Gets or sets the bins to hold the map classification results.
		/// </summary>
		public BinCollection Bins
		{
			get
			{
				if(_bins==null) 
				{
					if(cinfo.Field==null) 
					{
						if(this.Fields.Count==0) throw new System.Exception("This map contains no data field. Cannot create bins.");
						cinfo.Field = this.Fields[0];
						_bins=cinfo.Field.CreateBins(cinfo,this.Fields.ActiveIndexes);
						GeometryField fgeo = this.Fields.GetGeometryField();
						if(fgeo!=null) _bins.SetSymbolType(fgeo.SymbolType);
					}
				}
				return _bins;
			}
			set{_bins=value;}
		}

		/// <summary>
		/// Gets or sets the classification info, which tell how the map data should be classified.
		/// </summary>
		public ClassificationInfo Classification
		{
			get{return cinfo;}
			set{cinfo=value;}
		}

		/// <summary>
		/// Classify map data using it's classification info.
		/// This will override any previous existing bins.
		/// </summary>
		public void Classify()
		{
			try
			{
				Bins = cinfo.Field.CreateBins(cinfo,Fields.ActiveIndexes);
				//update, because there's a chance that actual Bins.Count < Setup.BinsCount
				Bins.Setup.BinsCount = Bins.Count;

				GeometryField fgeo = this.Fields.GetGeometryField();
				if(fgeo!=null) 
				{
					this.Bins.SetSymbolType(fgeo.SymbolType);
				}
				Bins.InitColors();
			}
			catch (System.Exception exc)
			{
				throw new System.Exception("MapData Classify : "+exc.Message,exc.InnerException);
			}
		}

		#endregion

		#region codebuilder stuff
		/// <summary>
		/// Creates a new code declaration to represent a class for this MapData.
		/// </summary>
		/// <returns></returns>
		public CodeTypeDeclaration getCodeType()
		{
			//create new class
			CodeTypeDeclaration ctDecl = new CodeTypeDeclaration(Name);

			//the class is based on abstractFeature or abstractFeatureCollection
			ctDecl.BaseTypes.Add(typeof(gml.AbstractFeatureType));
			//add member fields
			ctDecl.Members.AddRange(Fields.getCodeMemberCollection());
			
			return ctDecl;
		}

		#endregion

		#region schema stuff
		/// <summary>
		/// Creates the complextype and global element declaration for this MapData.
		/// </summary>
		/// <param name="xs">The schema where the complextype & element will reside.</param>
		/// <param name="theBase">Qualified Name of the base type</param>
		/// <param name="theSubstitute">Qualified Name of the substitution group</param>
		public void createSchemaType(ref XmlSchema xs, XmlQualifiedName theBase, XmlQualifiedName theSubstitute)
		{
			XmlSchemaComplexType xsct=Fields.getSchemaComplexType(Name,theBase);
			if(this.Description!=String.Empty) xsct.Annotation = this.CreateAnnotation(); 

			//add the complex type to the schema
			xs.Items.Add(xsct);

			XmlSchemaElement xsge = new XmlSchemaElement();
			//set the global element type to the complex type
			xsge.Name = this.Name; 
			xsge.SchemaTypeName = new XmlQualifiedName(xsct.Name, xs.TargetNamespace);
			xsge.SubstitutionGroup = theSubstitute;
			//add the global element to the schema
			xs.Items.Add(xsge);
		}

		/// <summary>
		/// Creates annotation for this MapData ComplexType.
		/// </summary>
		/// <returns>new schema annotation object</returns>
		private XmlSchemaAnnotation CreateAnnotation()
		{
			XmlSchemaDocumentation xsdoc = new XmlSchemaDocumentation();
			XmlDocument xdoc = new XmlDocument();
			xsdoc.Markup = new XmlNode[1] {xdoc.CreateTextNode(this.Description)};
			XmlSchemaAnnotation ann = new XmlSchemaAnnotation();
			ann.Items.Add(xsdoc); 
			xdoc=null;
			xsdoc=null;
			return ann;
		}

		#endregion

		#region gml stuff

		/// <summary>
		/// Calls this FieldCollection CreateFeatureAssociations method.
		/// </summary>
		/// <param name="members">instances of custom type(s) which will act as feature members</param>
		/// <returns>new FeatureAssociation for this MapData FieldCollection</returns>
		public gml.FeatureAssociationType[] CreateFeatureAssociations(object[] members)
		{
			return Fields.CreateFeatureAssociations(members);
		}

		/// <summary>
		/// Creates ElementAttribute to be used in attribute overrides
		/// </summary>
		/// <param name="customType">the custom type of this map</param>
		/// <param name="nsnames">namespaces to add the custom namespace</param>
		/// <param name="targetNS">target namespace for the element</param>
		/// <returns>ElementAttribute for this map</returns>
		public XmlElementAttribute getElementAttribute(Type customType, ref XmlSerializerNamespaces nsnames, string targetNS)
		{ 
			//TODO : change this to use code builder custom attributes instead.
			XmlElementAttribute xea = new XmlElementAttribute(customType.Name,customType);
			xea.Type = customType;
			xea.Form = System.Xml.Schema.XmlSchemaForm.Qualified; 
			if(this.NamespaceName!=targetNS && this.NamespaceName!=String.Empty) 
			{
				xea.Namespace = this.NamespaceName;
				nsnames.Add(this.NamespacePrefix,this.NamespaceName);
			}
			else	//use targetnamespace
			{
				xea.Namespace = targetNS;
			}

			return xea;
		}
		#endregion

//		public void CleanUp()
//		{
//			customType=null;
//			_name=null;
//			_namespaceprefix=null;
//			_namespacename=null;
//			_fields.Dispose();
//			_fields=null;
//			BoundingBox=null;
//			_bins.Dispose();
//			_bins=null;
//			
//		}

	}
}
