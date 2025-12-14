///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Collections;
using System.Drawing;
using GeoCon.Data;


namespace GeoCon.Classification
{
	/// <summary>
	/// Collection of Bin.
	/// </summary>
	[Serializable]
	public class BinCollection : CollectionBase
	{
		private ClassificationInfo cinfo=new ClassificationInfo();
		private Bin _nullbin=new Bin(null);
		private bool nullshowed=false;

		/// <summary>
		/// Constructs empty bin collection
		/// </summary>
		public BinCollection(){}
		/// <summary>
		/// Constructs new BinCollection using a classification info object
		/// </summary>
		/// <param name="Info">The classification parameters</param>
		public BinCollection(ClassificationInfo Info)
		{
			this.Setup=Info;
		}
		/// <summary>
		/// Gets or sets bin at specified index
		/// </summary>
		public Bin this[int index]
		{
			get{return (Bin)this.List[index];}
			set{this.List[index]=value;}
		}
		/// <summary>
		/// Adds new bin to this collection
		/// </summary>
		/// <param name="bin">bin to add</param>
		/// <returns>index of the newly added bin</returns>
		public int Add(Bin bin)
		{
			return this.List.Add(bin);
		}

		/// <summary>
		/// Gets or sets ClassificationInfo of this bin, which tells how the classification should be carried out.
		/// </summary>
		public ClassificationInfo Setup
		{
			get{return cinfo;}
			set
			{
				cinfo=value;
				this.NullBin=new Bin(cinfo.Field.NullSymbol);
			}
		}
		/// <summary>
		/// Gets or sets the special bin which will hold null values / no data object in a Field.
		/// </summary>
		public Bin NullBin
		{
			get{return _nullbin;}
			set{_nullbin=value;}
		}

		public void ShowNullBin()
		{
			if(nullshowed) return; //already added
			if(NullBin.ContentsCount==0) return; //no null to show
			this.Add(NullBin);
			nullshowed = true;
		}

		/// <summary>
		/// Sets the symbol type of each bin in this collection.
		/// </summary>
		/// <param name="type">enumerated type of BinSymbol</param>
		public void SetSymbolType(SymbolTypeEnum type)
		{
			for(int i=0;i<this.Count;i++) this[i].Symbol.Type=type;
			//and don't forget the null bin
			this.NullBin.Symbol.Type=type;
		}

		#region CSS style
		/// <summary>
		/// Creates CSS text for a map, this text will be the textnode child of a style 'element'.
		/// </summary>
		/// <param name="mapname">name of the map this style will be applied to</param>
		/// <param name="diagonal">diagonal of the map bounding box</param>
		/// <returns>the CSS text</returns>
		public string GetCSSText(string mapname,double diagonal){
			System.Text.StringBuilder sb=new System.Text.StringBuilder();
			for(int k=0;k<this.Count;k++ )
			{
				Bin bin = this[k];
				float oldwidth=bin.Symbol.Pen.Width;
				bin.Symbol.Pen.Width = (float)(bin.Symbol.LineWidthMap*diagonal/100.0); 
				sb.Append("\r.style-"+mapname.Replace("_","-")+"-"+k.ToString()+" "+bin.Symbol.GetCSSText()); 
				bin.Symbol.Pen.Width = oldwidth;
			}
			return sb.ToString();
		}
		public int GetTotalContentsCount()
		{
			int count=0;
			for(int i=0;i<this.Count;i++)
			{
				count+=this[i].ContentsCount;
			}
			return count;
		}
		#endregion

		#region colors
		/// <summary>
		/// Initializes colors for each bin, depends on the Classfication type.
		/// </summary>
		public void InitColors()
		{
			switch(this.Setup.Type)
			{
				case ClassificationType.SingleValue:
					InitRandomColor();
					break;
				case ClassificationType.UniqueValues :
					InitRandomColor();
					break;
				case ClassificationType.EqualInterval:
					InitGradualColor();
					break;
				case ClassificationType.Quantiles:
					InitGradualColor();
					break;
				case ClassificationType.NaturalBreaks:
					InitGradualColor();
					break;
				default:
					InitRandomColor();
					break;
			}
		}

		/// <summary>
		/// Initializes new random colors for bins in this collecion.
		/// </summary>
		public void InitRandomColor()
		{
			Color[] cs = CreateRandomColors(this.Count);
			this.NullBin.Symbol.Pen.Color=Color.Black; 
			this.NullBin.Symbol.Brush.Color=Color.Gray;
			AssignColor(cs);
			cs=null;
		}
		/// <summary>
		/// Initializes new gradual colors for bins in this collecion.
		/// The start and end colors are generated randomly.
		/// </summary>
		public void InitGradualColor()
		{
			Color[] cs = CreateRandomColors(2);
			Color color1=cs[0];
			Color color2=cs[1];
			InitGradualColor(color1, color2);
			cs=null;
		}

		/// <summary>
		/// Initializes new gradual colors for bins in this collecion.
		/// </summary>
		/// <param name="color1">Start color of the gradation</param>
		/// <param name="color2">End color of the gradation</param>
		public void InitGradualColor(Color color1, Color color2)
		{
			Color[] cs = CreateGradualColors(color1, color2,this.Count);
			this.NullBin.Symbol.Pen.Color=Color.Black; 
			this.NullBin.Symbol.Brush.Color=Color.Gray;
			AssignColor(cs);
			cs=null;
		}
		/// <summary>
		/// Assigns array of colors to this bin collection member
		/// </summary>
		/// <param name="colors">array of colors to assign</param>
		private void AssignColor(Color[] colors)
		{
			switch(NullBin.Symbol.Type)
			{
				case SymbolTypeEnum.None :
					break;
				case SymbolTypeEnum.Point :
					setBrushColors(colors);
					break;
				case SymbolTypeEnum.Line :
					setPenColors(colors);
					break;
				case SymbolTypeEnum.Polygon :
					setBrushColors(colors);
					break;
				case SymbolTypeEnum.Mixed :
					setBrushColors(colors);
					break;
				default:
					break;
			}
		}
		/// <summary>
		/// Sets symbol pen color of each bin in this collection
		/// </summary>
		/// <param name="colors">Colors to assign to the pens.</param>
		private void setPenColors(Color[] colors)
		{
			for(int i=0;i<this.Count;i++) 
			{
				this[i].Symbol.Pen.Color=colors[i];
			}
		}
		/// <summary>
		/// Sets symbol brush color of each bin in this collection
		/// </summary>
		/// <param name="colors">Colors to assign to the brushes.</param>
		private void setBrushColors(Color[] colors)
		{
			for(int i=0;i<this.Count;i++) this[i].Symbol.Brush.Color=colors[i];
		}
		/// <summary>
		/// Creates new random colors
		/// </summary>
		/// <param name="count">number of random colors to create</param>
		/// <returns>array of random colors</returns>
		private Color[] CreateRandomColors(int count)
		{
			Color[] clrs=new Color[count];
			Random rnd = new Random();
			for(int i=0;i<count;i++)
			{
				clrs[i]=Color.FromArgb(rnd.Next(0,255),rnd.Next(0,255),rnd.Next(0,255));
			}
			return clrs;
		}
		/// <summary>
		/// Creates new gradual colors.
		/// </summary>
		/// <param name="cstart">Start color of the gradation</param>
		/// <param name="cend">End color of the gradation</param>
		/// <param name="count">Number of gradation, including the start and end.</param>
		/// <returns>Array of gradual colors</returns>
		private Color[] CreateGradualColors(Color cstart,Color cend,int count)
		{
			Color[] clrs=new Color[count];
			clrs[0]= cstart;
			clrs[count-1]= cend;
			if(count<=2) return clrs;

			int r0 =(int)(cstart.R);
			int g0 =(int)(cstart.G);
			int b0 =(int)(cstart.B);

			int r1 =(int)(cend.R);
			int g1 =(int)(cend.G);
			int b1 =(int)(cend.B);

			int rintv = (r1-r0)/(count-1);
			int gintv = (g1-g0)/(count-1);
			int bintv = (b1-b0)/(count-1);

			for(int i=1;i<count-1;i++)
			{
				clrs[i]=Color.FromArgb(r0+i*rintv,g0+i*gintv,b0+i*bintv);
			}
			return clrs;
		}
		#endregion
	}
}
