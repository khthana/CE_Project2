///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using GeoCon.Data;
 
namespace GeoCon.Classification
{
	/// <summary>
	/// Enumeration of Classification type 
	/// </summary>
	public enum ClassificationType : int
	{
		None = -1,
		SingleValue = 0,
		UniqueValues = 1,
		EqualInterval = 2,
		Quantiles = 3,
		NaturalBreaks = 4
	}

	/// <summary>
	/// Classification Info, holds information on how a field should be classified.
	/// </summary>
	[Serializable]
	public class ClassificationInfo
	{
		/// <summary>
		/// Constructs default Classification info, which is a single value classification
		/// </summary>
		public ClassificationInfo(){}

		private ClassificationType _type = ClassificationType.SingleValue;
		/// <summary>
		/// Gets or sets the type of the classification
		/// </summary>
		public ClassificationType Type
		{
			get {return _type;}
			set {
				_type=value;
				if((int)_type>1 && _field!=null)
				{
					if(!_field.isNumeric) Field=null;
				}
				if((int)_type==0) _count = 1;
			}
		}

		/// <summary>
		/// Gets the type of the classification as string
		/// </summary>
		public string TypeString
		{
			get
			{
				switch ((int)this.Type)
				{
					case 0:
						return "Single";
					case 1:
						return "Unique";
					case 2:
						return "Equal Interval";
					case 3:
						return "Quantile";
					case 4:
						return "Natural Breaks";
					default:
						break;
				}
				return "";
			}
		}

		private int _count=1;
		/// <summary>
		/// Gets or sets the number of bins to create
		/// </summary>
		public int BinsCount
		{
			get {return _count;}
			set {
				_count=value;
				if((int)Type==0) _count = 1;
			}
		}


		private Field _field;
		/// <summary>
		/// Gets or sets the Field to classify
		/// </summary>
		public Field Field
		{
			get {return _field;}
			set {
				_field=value;
				if(_field==null || (!_field.isNumeric && ((int)Type)>1 )) Type=ClassificationType.SingleValue;
			}
		}

		/// <summary>
		/// Gets the classified field name
		/// </summary>
		public string FieldName
		{
			get 
			{
				if(Field==null) return "";
				return Field.Name;
			}
		}
	}
}
