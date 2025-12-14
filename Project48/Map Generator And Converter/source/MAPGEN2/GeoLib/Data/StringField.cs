///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Xml;
using System.Xml.Schema;

using GeoCon.Classification;

namespace GeoCon.Data
{
	/// <summary>
	/// Field for storing String values.
	/// </summary>
	[Serializable]
	public class StringField : Field
	{

		/// <summary>
		/// Constructs default StringField
		/// </summary>
		public StringField()
		{
			this.NullSymbol=String.Empty;
		}
		/// <summary>
		/// Constructs StringField with a specified string length
		/// </summary>
		/// <param name="maxlength">maximum length of string</param>
		public StringField(int maxlength)
		{
			FacetMaxLengthValue = maxlength.ToString(); 
			this.NullSymbol=String.Empty;
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
		/// Value attribute of Length facet.
		/// </summary>
		public string FacetLengthValue;

		/// <summary>
		/// Value attribute of MaxLength facet.
		/// </summary>
		public string FacetMaxLengthValue;

		/// <summary>
		/// Value attribute of MinLength facet.
		/// </summary>
		public string FacetMinLengthValue;

		/// <summary>
		/// Adds facet values for this field into its schema type.
		/// </summary>
		/// <param name="xsst">schema type of this field</param>
		protected void addFacets(ref XmlSchemaSimpleTypeRestriction xsst)
		{
			addFacet(xsst,new XmlSchemaPatternFacet(),FacetPatternValue);
			addFacet(xsst,new XmlSchemaWhiteSpaceFacet(),FacetWhitespaceValue);

			addFacet(xsst, new XmlSchemaEnumerationFacet(), FacetEnumValue);
			addFacet(xsst, new XmlSchemaLengthFacet(), FacetLengthValue);
			addFacet(xsst, new XmlSchemaMaxLengthFacet(), FacetMaxLengthValue);
			addFacet(xsst, new XmlSchemaMinLengthFacet(), FacetMinLengthValue);
		}
		/// <summary>
		/// Creates a schema element object for StringField.
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

		/// <summary>
		/// Creates a schema type object for this field 
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
		#endregion

		/// <summary>
		/// Create Bins which will holds classification values of this field data.
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
