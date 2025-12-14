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
	/// Summary description for NumericField.
	/// </summary>
	/// 
	[Serializable]
	public abstract class NumericField : Field
	{
		public NumericField() 
		{
			this._isNumeric=true;
			//this.NullSymbol=System.DBNull;
		}
		public NumericField(int totdigit,int fracdigit)
		{
			this._isNumeric=true;
			//this.NullSymbol=null;
			FacetTotalDigitsValue	= totdigit.ToString();
			FacetFractionDigitsValue= fracdigit.ToString();
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
		/// Value attribute of TotalDigits facet.
		/// </summary>
		public string FacetTotalDigitsValue;

		/// <summary>
		/// Value attribute of FractionDigits facet.
		/// </summary>
		public string FacetFractionDigitsValue;

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

			addFacet(xsst, new XmlSchemaTotalDigitsFacet(), FacetTotalDigitsValue);
			addFacet(xsst, new XmlSchemaFractionDigitsFacet(), FacetFractionDigitsValue);
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

	}

}
