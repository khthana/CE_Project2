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
	/// Field for storing integer values
	/// </summary>
	[Serializable]
	public class IntegerField : NumericField
	{
		/// <summary>
		/// Constructs default IntegerField
		/// </summary>
		public IntegerField()
		{
			this.SchemaDataType = "integer";
			this.Type=typeof(int);
		}

		/// <summary>
		/// Constructs new DoubleField with specified digits
		/// </summary>
		/// <param name="totdigit">total digits</param>
		/// <param name="fracdigit">fraction digits, which will always be 0</param>
		public IntegerField(int totdigit,int fracdigit) : base(totdigit,fracdigit)
		{
			this.SchemaDataType = "integer";
			this.Type=typeof(int);
		}

		#region classification
		/// <summary>
		/// Create Bins which will holds classification values of this field data.
		/// </summary>
		/// <param name="cinfo">Classification info on how to classify.</param>
		/// <returns>Collection of bins</returns>
		public override BinCollection CreateBins(ClassificationInfo cinfo,System.Collections.ArrayList indexes)
		{
			IntegerClassifier c = new IntegerClassifier(cinfo,indexes);
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
