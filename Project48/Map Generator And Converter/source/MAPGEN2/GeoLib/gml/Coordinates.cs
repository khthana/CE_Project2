///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Xml;  
using System.Xml.Schema;
using System.Xml.Serialization;
using System.Drawing;

namespace gml
{

	/// <summary>
	/// 
	/// </summary>
	[Serializable]
	[XmlType(Namespace="http://www.opengis.net/gml")]
	[XmlRoot("coordinates", Namespace="http://www.opengis.net/gml", IsNullable=false)]
	public class CoordinatesType  : CoordWrapper
	{
		#region CoordinatesType attributes
		/// <summary>
		/// 
		/// </summary>
		[XmlAttribute()]
		[System.ComponentModel.DefaultValueAttribute(".")]
		public string @decimal = ".";

		/// <summary>
		/// 
		/// </summary>
		[XmlAttribute()]
		[System.ComponentModel.DefaultValueAttribute(",")]
		public string cs = ","; //coord separator

		/// <summary>
		/// 
		/// </summary>
		[XmlAttribute()]
		[System.ComponentModel.DefaultValueAttribute(" ")]
		public string ts = " "; //tuple separator
		#endregion

		/// <summary>
		/// Array of doubles in the form of {x0,y0,x1,y1,...,xn,yn} 
		/// </summary>
		[XmlIgnore()] 
		public double[] doubleArray;
		//this may seems a bit strange; but it's A LOT faster and smaller
		//than jagged array,rectangular array or point-like struct 
		//(at least in this operation; i have tested, measured and compared them).

		/// <summary>
		/// Array of z values, one for each coordinate tuple
		/// </summary>
		[XmlIgnore()] 
		public double[] zArray;

		[XmlIgnore()] 
		public bool hasZ=false;

		/// <summary>
		/// constructs new CoordinatesType with empty array.
		/// </summary>
		public CoordinatesType()
		{
			doubleArray=new double[0];
		}

		/// <summary>
		/// constructs new CoordinatesType with specified array of doubles
		/// </summary>
		/// <param name="vals">Array of doubles in the form of [x0,y0,x1,y1,...,xn,yn]</param>
		public CoordinatesType(double[] vals)
		{
			doubleArray=vals;
		}
		
		/// <summary>
		/// Create a SVG pathdata for this array of coordinates.
		/// </summary>
		/// <returns>SVG pathdata</returns>
		public string getPathString()
		{
			System.Text.StringBuilder sb = new System.Text.StringBuilder(""); 
			if(doubleArray.Length>0) 
			{
				sb.Append("M "); 
				sb.Append(doubleArray[0].ToString()+","+doubleArray[1].ToString()); 
			}
			if(doubleArray.Length>1) sb.Append(" L ");
			for (int n=1;n<doubleArray.Length/2;n++)
			{
				sb.Append(doubleArray[2*n].ToString()+","+doubleArray[2*n+1].ToString()+" ");
			}
			return sb.ToString();
		}

		/// <summary>
		/// Create a SVG polyline points data
		/// </summary>
		/// <returns>SVG polyline points data</returns>
		public string getPointsString()
		{
			System.Text.StringBuilder sb = new System.Text.StringBuilder(""); 
			for (int n=0;n<doubleArray.Length/2;n++)
			{
				sb.Append(doubleArray[2*n].ToString()+","+doubleArray[2*n+1].ToString()+" ");
			}
			return sb.ToString();
		}

		/// <summary>
		/// Creates float points array, usually for drawing graphics.
		/// </summary>
		/// <returns>array of points</returns>
		public PointF[] getPointFArray()
		{
			PointF[] pfs = new PointF[doubleArray.Length/2];
			for(int i=0;i<doubleArray.Length/2;i++)
			{
				pfs[i] = new PointF((float)doubleArray[2*i],(float)doubleArray[2*i+1]); 
			}
			return pfs;
		}

		/// <summary>
		/// Gets a text value which will be the xml text in gml for 'coordinates' element.
		/// </summary>
		[XmlText()]
		public string Value
		{
			get
			{
				System.Text.StringBuilder sb = new System.Text.StringBuilder(""); 
				if(hasZ)
				{
					for (int n=0;n<doubleArray.Length/2;n++)
					{
//Console.WriteLine("z : {0}",zArray[n]);
						int xi=2*n;
						sb.Append(doubleArray[xi].ToString() + this.cs + doubleArray[xi+1].ToString() + this.cs + this.zArray[n].ToString() + this.ts );
					}
				}
				else
				{
					for (int n=0;n<doubleArray.Length/2;n++)
					{
						int xi=2*n;
						sb.Append(doubleArray[xi].ToString() + this.cs + doubleArray[xi+1].ToString()+this.ts );
					}
				}
				return sb.ToString();
			}
			set{}
		}
	}
}