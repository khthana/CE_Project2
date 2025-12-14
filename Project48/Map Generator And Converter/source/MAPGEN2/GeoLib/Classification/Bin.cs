///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Collections;

namespace GeoCon.Classification
{
	/// <summary>
	/// Bin class to be used in single or unique value classification.
	/// </summary>
	[Serializable]
	public class Bin
	{
		/// <summary>
		/// DataType of the objects contained in this bin.
		/// </summary>
		public System.Type DataType=typeof(string);
		private object binvalue=null;
		private ArrayList _contents=new ArrayList();
		private BinSymbol _symbol;

		/// <summary>
		/// Constructs empty bin
		/// </summary>
		public Bin(){}

		/// <summary>
		/// Constructs new bin with specified bin value.
		/// </summary>
		/// <param name="BinValue">value of the bin</param>
		public Bin(object BinValue)
		{
			binvalue=BinValue; //this constructor for unique bins
		}

		/// <summary>
		/// Gets or sets the symbol of the bin which will be displayed in the datagrid and holds the feature styles.
		/// </summary>
		public BinSymbol Symbol
		{
			get
			{
				if(_symbol==null) _symbol=new BinSymbol();
				return _symbol;
			}
			set{_symbol=value;}
		}

		/// <summary>
		/// Gets or sets the title of the bin which will be displayed in the datagrid.
		/// </summary>
		public virtual string Title
		{
			get
			{
				if(binvalue==System.DBNull.Value) return "(null)";
				if(binvalue==null) return "";
				return binvalue.ToString();
			}
			set
			{
				//binvalue=System.Convert.ChangeType(value,this.DataType); 
				//TODO : throw exception or just do nothing?;
			}
		}

		/// <summary>
		/// Gets a value indicating whether an object will fit in this bin or not.
		/// </summary>
		/// <param name="obj">object to compare to the bin value</param>
		/// <returns>value indicating whether the object will fit in this bin</returns>
		public virtual bool isInBin(object obj)
		{
			return (obj==binvalue);
		}

		/// <summary>
		/// Gets the arraylist containing indexes of object contained in this bin.
		/// Index value specifies the position of an object in a Field.
		/// </summary>
		public ArrayList ContentsIndex
		{
			get{return _contents;}
		}
		/// <summary>
		/// Adds new index to the ContentsIndex
		/// </summary>
		/// <param name="index">index to add</param>
		public void AddIndex(int index)
		{
			_contents.Add(index);
		}
		/// <summary>
		/// Number of objects contains in this bin
		/// </summary>
		public int ContentsCount
		{
			get{return this.ContentsIndex.Count;}
		}
	}
}
