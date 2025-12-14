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
	/// A field which holds boolean values.
	/// </summary>
	[Serializable]
	public class BoolField : Field
	{
		public BoolField()	
		{
			this.SchemaDataType = "Boolean";
			this.Type=typeof(bool);
		}

		#region schema stuffs

		/// <summary>
		/// Value attribute of Pattern facet.
		/// </summary>
		public string FacetPatternValue;

		/// <summary>
		/// Value attribute of Whitespace facet.
		/// </summary>
		public string FacetWhitespaceValue;

		/// <summary>
		/// Adds facet values for this field into its schema type.
		/// </summary>
		/// <param name="xsst">schema type of this field</param>
		private void addFacets(ref XmlSchemaSimpleTypeRestriction xsst)
		{
			addFacet(xsst,new XmlSchemaPatternFacet(),FacetPatternValue);
			addFacet(xsst,new XmlSchemaWhiteSpaceFacet(),FacetWhitespaceValue);
		}

		/// <summary>
		/// Create a schema type object for boolean field 
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
		/// Create a schema element object for boolean field.
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
		public override BinCollection CreateBins(ClassificationInfo cinfo, System.Collections.ArrayList indexes)
		{
			//BoolClassifier c = new BoolClassifier(cinfo,indexes);
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
		#endregion
	}
}
