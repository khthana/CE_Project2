///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;

namespace GeoCon.Classification
{
	/// <summary>
	/// Bin class in BoolField unique value Classification.
	/// </summary>
	[Serializable]
	public class BoolBin : Bin
	{
		private bool binvalue=false;
		/// <summary>
		/// Constructs new BoolBin with default value;
		/// </summary>
		public BoolBin(){}
		/// <summary>
		/// Constructs new BoolBin with specified value;
		/// </summary>
		/// <param name="BinValue">Boolean value for the bin</param>
		public BoolBin(bool BinValue)
		{
			binvalue=BinValue;
		}
		/// <summary>
		/// Gets a value indicating whether a bool value will fit in this bin or not.
		/// </summary>
		/// <param name="obj">boolvalue to compare to the bin value</param>
		/// <returns>value indicating whether the boolvalue will fit in this bin</returns>
		public override bool isInBin(object obj)
		{ 
			return(binvalue==(bool)obj);
		}
		/// <summary>
		/// Gets or sets the title of the bin which will be displayed in the datagrid.
		/// </summary>
		public override string Title
		{
			get{return binvalue.ToString();}
			set{binvalue=bool.Parse(value);}
		}
	}

	/// <summary>
	/// Bin to be used in StringField Classification
	/// </summary>
	[Serializable]
	public class StringBin : Bin
	{
		//this class mayhap unnecessary, base bin will be sufficient
		private string binvalue=String.Empty;
		public StringBin(){	}
		public StringBin(string BinValue)
		{
			binvalue=BinValue;
		}
		public override bool isInBin(object obj)
		{
			return(obj.ToString()== binvalue);
		}
		public override string Title
		{
			get{return binvalue;}
			set{binvalue=value;}
		}
	}

	/// <summary>
	/// Bin to be used in DateTimeField numeric Classification.
	/// </summary>
	[Serializable]
	public class DateTimeBin : Bin
	{
		private DateTime binvalueMin = DateTime.MaxValue;
		private DateTime binvalueMax = DateTime.MinValue;
		/// <summary>
		/// Constructs DateTimeBin with default bin values;
		/// </summary>
		public DateTimeBin(){}
		/// <summary>
		/// Constructs DateTimeBin with specified bin values;
		/// </summary>
		/// <param name="valuemin">minimum value of the bin</param>
		/// <param name="valuemax">maximum value of the bin</param>
		public DateTimeBin(DateTime valuemin, DateTime valuemax)
		{
			binvalueMin=valuemin;
			binvalueMax=valuemax;
		}

		/// <summary>
		/// Gets a value indicating whether a DateTime value will fit in this bin or not.
		/// </summary>
		/// <param name="obj">DateTime value to compare to the bin value</param>
		/// <returns>value indicating whether the DateTime will fit in this bin</returns>
		public override bool isInBin(object obj)
		{
			return ((DateTime)obj>=binvalueMin && (DateTime)obj<=binvalueMax);
		}

		/// <summary>
		/// Gets the title of the bin which will be displayed in the datagrid.
		/// </summary>
		public override string Title
		{
			get
			{
				if(binvalueMin==binvalueMax) return binvalueMin.ToString("d");
				return binvalueMin.ToString("d")+" - "+binvalueMax.ToString("d");
			}
			set
			{
				//TODO : split and parse string into datetime(s)
			}
		}
	}

	/// <summary>
	/// Bin to be used in IntegerField numeric Classification.
	/// </summary>
	[Serializable]
	public class IntegerBin : Bin
	{
		private int binvalueMin = int.MaxValue;
		private int binvalueMax = -int.MaxValue;

		/// <summary>
		/// Constructs IntegerBin with default bin values;
		/// </summary>
		public IntegerBin(){}

		/// <summary>
		/// Constructs IntegerBin with specified bin values;
		/// </summary>
		/// <param name="valuemin">minimum value of the bin</param>
		/// <param name="valuemax">maximum value of the bin</param>
		public IntegerBin(int valuemin, int valuemax)
		{
			binvalueMin=valuemin;
			binvalueMax=valuemax;
		}

		/// <summary>
		/// Gets a value indicating whether an integer value will fit in this bin or not.
		/// </summary>
		/// <param name="obj">integer value to compare to the bin value</param>
		/// <returns>value indicating whether the value will fit in this bin</returns>
		public override bool isInBin(object obj)
		{
			return ((int)obj>=binvalueMin && (int)obj<=binvalueMax);
		}

		/// <summary>
		/// Gets a value indicating whether an integer value will fit in this bin or not.
		/// </summary>
		/// <param name="obj">integer value to compare to the bin value</param>
		/// <returns>value indicating whether the value will fit in this bin</returns>
		public bool isInBin(int obj)
		{
			return(obj>=binvalueMin && obj<=binvalueMax);
		}

		/// <summary>
		/// Gets the title of the bin which will be displayed in the datagrid.
		/// </summary>
		public override string Title
		{
			get
			{
				if(binvalueMin==binvalueMax) return binvalueMin.ToString();
				return binvalueMin.ToString()+" - "+binvalueMax.ToString();
			}
			set
			{
				//TODO : split and parse string into integer(s)
			}
		}
	}

	/// <summary>
	/// Bin to be used in DoubleField numeric Classification.
	/// </summary>
	[Serializable]
	public class DoubleBin : Bin
	{
		private double binvalueMin = double.MaxValue;
		private double binvalueMax = -double.MaxValue;

		/// <summary>
		/// Constructs DoubleBin with default bin values;
		/// </summary>
		public DoubleBin(){}

		/// <summary>
		/// Constructs DoubleBin with specified bin values;
		/// </summary>
		/// <param name="valuemin">minimum value of the bin</param>
		/// <param name="valuemax">maximum value of the bin</param>
		public DoubleBin(double valuemin, double valuemax)
		{
			binvalueMin=valuemin;
			binvalueMax=valuemax;
		}

		/// <summary>
		/// Gets a value indicating whether an double value will fit in this bin or not.
		/// </summary>
		/// <param name="obj">double value to compare to the bin value</param>
		/// <returns>value indicating whether the value will fit in this bin</returns>
		public override bool isInBin(object obj)
		{
			return ((double)obj>=binvalueMin && (double)obj<=binvalueMax);
		}

		/// <summary>
		/// Gets the title of the bin which will be displayed in the datagrid.
		/// </summary>
		public override string Title
		{
			get
			{
				if(binvalueMin==binvalueMax) return binvalueMin.ToString();
				return binvalueMin.ToString()+" - "+binvalueMax.ToString();
			}
			set
			{
				//TODO : split and parse string into double(s)
			}
		}
	}

}
