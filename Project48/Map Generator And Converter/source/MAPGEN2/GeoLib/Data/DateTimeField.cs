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
	/// Field to holds DateTime values.
	/// </summary>
	[Serializable]
	public class DateTimeField : Field
	{
		/// <summary>
		/// Constructs new DateTimeField
		/// </summary>
		public DateTimeField()
		{
			//it can be classified like NumericField but it doesn't derived from NumericField
			//because it has different applicable facets and DateTime requires different treatment in classification
			this._isNumeric = true;
			//this.NullSymbol = DateTime.MinValue;
			//this.SchemaDataType = "dateTime";
			this.SchemaDataType = "date";
			this.Type=typeof(System.DateTime);
		}

		#region indexer
		/// <summary>
		/// Gets or sets a DateTime value at specified index.
		/// </summary>
		public new DateTime this[int index]
		{
			get {return (DateTime)this.List[index];}
			set {this.List[index]=value;}
		}
		#endregion

		public override CodeTypeMember CreateCodeType()
		{
			CodeMemberField cmf = new CodeMemberField(Type,Name);
			cmf.Attributes = MemberAttributes.Public;

			if(SchemaDataType!="dateTime") //force System.DateTime to use schema datatype other than "dateTime"
			{
				CodeAttributeArgument caa = new CodeAttributeArgument("DataType",new CodePrimitiveExpression(SchemaDataType));
				CodeAttributeArgument[] caas = new CodeAttributeArgument[1]{caa};
				CodeAttributeDeclaration cad = new CodeAttributeDeclaration("XmlElement",caas);
				cmf.CustomAttributes.Add(cad);
			}

			return cmf;
		}


		#region schema stuff
		/// <summary>
		/// Value attribute of Pattern facet.
		/// </summary>
		public string FacetPatternValue;

		/// <summary>
		/// Value attribute of Whitespace facet.
		/// </summary>
		public string FacetWhitespaceValue;

		/// <summary>
		/// Value attribute of Enum facet.
		/// </summary>
		public string FacetEnumValue;

		/// <summary>
		/// Value attribute of MaxExclusive facet.
		/// </summary>
		public string FacetMaxExclusiveValue;

		/// <summary>
		/// Value attribute of MinExclusive facet.
		/// </summary>
		public string FacetMinExclusiveValue;

		/// <summary>
		/// Value attribute of MaxInclusive facet.
		/// </summary>
		public string FacetMaxInclusiveValue;

		/// <summary>
		/// Value attribute of MinInclusive facet.
		/// </summary>
		public string FacetMinInclusiveValue;

		/// <summary>
		/// Adds facet values for this field into its schema type.
		/// </summary>
		/// <param name="xsst">schema type of this field</param>
		protected void addFacets(ref XmlSchemaSimpleTypeRestriction xsst)
		{
			addFacet(xsst,new XmlSchemaPatternFacet(),FacetPatternValue);
			addFacet(xsst,new XmlSchemaWhiteSpaceFacet(),FacetWhitespaceValue);

			addFacet(xsst, new XmlSchemaEnumerationFacet(), FacetEnumValue);
			addFacet(xsst, new XmlSchemaMaxExclusiveFacet(), FacetMaxExclusiveValue);
			addFacet(xsst, new XmlSchemaMaxInclusiveFacet(), FacetMaxInclusiveValue);
			addFacet(xsst, new XmlSchemaMinExclusiveFacet(), FacetMinExclusiveValue);
			addFacet(xsst, new XmlSchemaMinInclusiveFacet(), FacetMinInclusiveValue);
		}

		/// <summary>
		/// Creates a schema type object for DateTimeField 
		/// </summary>
		/// <returns>the schema type of this field schema element.</returns>
		protected override XmlSchemaType CreateSchemaType()
		{
			XmlSchemaSimpleTypeRestriction xsRestrict = new XmlSchemaSimpleTypeRestriction();
			xsRestrict.BaseTypeName = new XmlQualifiedName(this.SchemaDataType,"http://www.w3.org/2001/XMLSchema");
			addFacets(ref xsRestrict);

			XmlSchemaSimpleType xsType = new XmlSchemaSimpleType();
			xsType.Content = xsRestrict;
			return xsType;
		}

		/// <summary>
		/// Creates a schema element object for DateTimeField.
		/// </summary>
		/// <returns>schema type object which will be a sequence member inside a complex type declaration.</returns>
		public override XmlSchemaElement CreateSchemaElement()
		{
			XmlSchemaElement xse = new XmlSchemaElement();
			xse.Name=Name; 
			xse.IsNillable=true;
			xse.MinOccurs=0;
			xse.MaxOccurs=1;
			xse.SchemaType = CreateSchemaType(); 
			if(this.Description!=String.Empty) xse.Annotation = this.CreateAnnotation();
			return xse;
		}
		#endregion

		#region classification

		/// <summary>
		/// Create Bins which will holds classification values of this field data.
		/// </summary>
		/// <param name="cinfo">Classification info on how to classify.</param>
		/// <returns>Collection of bins</returns>
		public override BinCollection CreateBins(ClassificationInfo cinfo,System.Collections.ArrayList indexes)
		{
			DateTimeClassifier c = new DateTimeClassifier(cinfo,indexes);
			BinCollection bins;
			switch (cinfo.Type)
			{
				case ClassificationType.SingleValue :
					bins = c.ClassifySingle();
					break;
				case ClassificationType.UniqueValues :
					bins = c.ClassifyUnique();
					break;
				case ClassificationType.EqualInterval :
					bins = c.ClassifyEqual();
					break;
				case ClassificationType.Quantiles :
					bins = c.ClassifyQuantile();
					break;
				case ClassificationType.NaturalBreaks :
					bins = c.ClassifyNatural();
					break;
				default :
					bins = c.ClassifySingle();
					break;
			}
			c=null;
			return bins;
		}
		#endregion
	}
}
