///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Xml;
using System.Xml.Schema;
using System.CodeDom;
using System.CodeDom.Compiler;
using System.Collections; 

using GeoCon.Classification;

namespace GeoCon.Data
{
	/// <summary>
	/// Abstract collection of object, represents a column in a map.
	/// </summary>
	[Serializable]
	public abstract class Field : CollectionBase
	{
		public Field(){}
		
		#region collection properties
		/// <summary>
		/// Gets or sets object at specified index.
		/// </summary>
		public object this[int index]
		{
			get{return this.List[index];}
			set{this.List[index]=value;}
		}
		/// <summary>
		/// Adds object to the the collection.
		/// </summary>
		/// <param name="val">the object to add to the collection</param>
		/// <returns>index of the newly added object in the collection</returns>
		public int Add(object val)
		{
			//TODO : check new value against field's facets
			return this.List.Add(val);
		}
		#endregion

		#region common properties

		private string _name;
		private bool isactive=true;

		/// <summary>
		/// Is this field can be classified using numeric classification type.
		/// </summary>
		protected bool _isNumeric=false;

		/// <summary>
		/// Gets or sets the data type which will be used in constructing schema object for this field. 
		/// For System.DateTime you can specify either "dateTime","date",or "time".
		/// </summary>
		protected string SchemaDataType="string";

		/// <summary>
		/// Gets a value whether this field is a collection of gml.GeometryProperty.
		/// </summary>
		protected bool _isGeometry=false;

		/// <summary>
		/// Gets or sets the status of this field, whether it only accept unique values or not. Currently unused.
		/// </summary>
		public bool isUnique;

		/// <summary>
		/// Gets or sets the status of this field as an index field. Currently unused.
		/// </summary>
		public bool isIndex;

		/// <summary>
		/// Gets or sets a status of this field compared to it's parent fieldcollection datatable.
		/// whether this field has changed since the last time it's parent fieldcollection's create a datatable.
		/// </summary>
		public bool isUpToDate=false;

		/// <summary>
		/// Gets or sets the data type of this field.
		/// </summary>
		public System.Type Type=typeof(string);

		//public int Index=-1; //the index of this field in a FieldCollection

		/// <summary>
		/// Gets or sets the symbol/object denoting null value for this field. 
		/// </summary>
		public object NullSymbol=System.DBNull.Value;

		/// <summary>
		/// Gets or sets the name of the field.
		/// If the value supplied is not a valid XML name, it will be encoded.
		/// </summary>
		public string Name
		{
			get {return _name;}
			set	
			{
				//_name=(System.Xml.XmlConvert.EncodeName(value)).Replace(".","_");
				_name=(System.Xml.XmlConvert.EncodeLocalName(value));
				//_name = value;
				_name=_name.Replace("-","_x002D_");	//not allowed in class/property name
				_name=_name.Replace(".","_x002E_");	//not allowed in class/property name
				isUpToDate=false;
			}
		}

		public string Name2
		{
			get {return _name;}
			set	
			{
				//_name=(System.Xml.XmlConvert.EncodeName(value)).Replace(".","_");
				//_name=(System.Xml.XmlConvert.EncodeLocalName(value));
				_name = value;
				//_name=_name.Replace("-","_x002D_");	//not allowed in class/property name
				//_name=_name.Replace(".","_x002E_");	//not allowed in class/property name
				isUpToDate=false;
			}
		}

		private string desc="";
		/// <summary>
		/// Gets or sets description about this Field.
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
		/// Gets or sets the value indicating whether this field is included in exporting or classification.
		/// </summary>
		public bool isActive
		{
			get	{return isactive;}
			set 
			{
				isactive=value;
				isUpToDate=false;
			}
		}
		/// <summary>
		/// Gets a value indicating whether this field can be classified using numeric classification type.
		/// </summary>
		public bool isNumeric
		{
			get {return _isNumeric;}
		}
		/// <summary>
		/// Gets a value whether this field is a collection of gml.GeometryProperty.
		/// </summary>
		public bool isGeometry
		{
			get {return _isGeometry;}
		}

		/// <summary>
		/// Gets the field type as string for use in datagrid.
		/// </summary>
		public string TypeString
		{
			get	
			{
				if(Type==null) return "";
				int dotpos=Type.ToString().LastIndexOf('.');
				return Type.ToString().Substring(dotpos+1);
			}
		}

		#endregion

		#region classification

		/// <summary>
		/// Classify this field data into bins. 
		/// </summary>
		/// <param name="cinfo">Classification info which tells how the field should be classified</param>
		/// <param name="indexes">active indexes of this field data (those didn't get filtered out).</param>
		/// <returns>A collection of classification Bin which hold the classification results.</returns>
		public abstract BinCollection CreateBins(ClassificationInfo cinfo,ArrayList indexes);

		#endregion

		#region code builder stuff

		/// <summary>
		/// Creates a code declaration for this field, represents a field declaration in a class declaration.
		/// </summary>
		/// <returns>CodeTypeMember for this field</returns>
		public virtual CodeTypeMember CreateCodeType()
		{	
			CodeMemberField cmf = new CodeMemberField(this.Type,this.Name);
			cmf.Attributes = MemberAttributes.Public;

//			CodeAttributeArgument caa = new CodeAttributeArgument("IsNullable",new System.CodeDom.CodePrimitiveExpression(false));
//			CodeAttributeArgument[] caas = new CodeAttributeArgument[1]{caa};
//			CodeAttributeDeclaration cad = new CodeAttributeDeclaration("XmlElement",caas);
//			cmf.CustomAttributes.Add(cad);

			return cmf;
		}
		#endregion

		#region schema stuffs
		/// <summary>
		/// Create a schema element object for this field.
		/// </summary>
		/// <returns>schema type object which will be a sequence member inside a complex type declaration.</returns>
		public abstract XmlSchemaElement CreateSchemaElement();

		/// <summary>
		/// Create a schema type object for this field 
		/// </summary>
		/// <returns>the schema type of this field schema element.</returns>
		protected abstract XmlSchemaType CreateSchemaType();

		/// <summary>
		/// Adds a facet to a certain schema simple type.
		/// </summary>
		/// <param name="restriction">The schema simple type restriction into where the facet will be added.</param>
		/// <param name="facet">the schema facet object</param>
		/// <param name="facetvalue">the value of the facet</param>
		protected void addFacet(XmlSchemaSimpleTypeRestriction restriction, XmlSchemaFacet facet, string facetvalue)
		{
			if(facetvalue!=null) 
			{
				facet.Value = facetvalue;
				restriction.Facets.Add(facet);
			}
		}

		/// <summary>
		/// Creates annotation for this Field schema element.
		/// </summary>
		/// <returns>new schema annotation object</returns>
		protected XmlSchemaAnnotation CreateAnnotation()
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

	}

}
