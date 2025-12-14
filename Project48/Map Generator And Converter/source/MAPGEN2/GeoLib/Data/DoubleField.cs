///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Globalization;

using GeoCon.Classification;
 
namespace GeoCon.Data
{
	/// <summary>
	/// Field for storing double values
	/// </summary>
	[Serializable]
	public class DoubleField : NumericField
	{
		/// <summary>
		/// Constructs new default DoubleField.
		/// </summary>
		public DoubleField()
		{
			this.SchemaDataType = "double";
			this.Type=typeof(double);
		}
		/// <summary>
		/// Constructs new DoubleField with specified digits
		/// </summary>
		/// <param name="totdigit">total digits</param>
		/// <param name="fracdigit">fraction digits</param>
		public DoubleField(int totdigit,int fracdigit) : base(totdigit,fracdigit)
		{
			this.SchemaDataType = "double";
			this.Type=typeof(double);
		}

		#region classification

		/// <summary>
		/// Create Bins which will holds classification values of this field data.
		/// </summary>
		/// <param name="cinfo">Classification info on how to classify.</param>
		/// <returns>Collection of bins</returns>
		public override BinCollection CreateBins(ClassificationInfo cinfo,System.Collections.ArrayList indexes)
		{
			DoubleClassifier c = new DoubleClassifier(cinfo,indexes);
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
