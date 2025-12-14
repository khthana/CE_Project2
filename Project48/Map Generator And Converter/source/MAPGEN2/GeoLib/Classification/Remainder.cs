///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;

namespace GeoCon.Classification
{
	/// <summary>
	/// Distribute remainder evenly accross median in EqualInterval and Quantile Classification
	/// Not sure if this is correct, but it's ok for small class number. For larger class the result is not so good.
	/// </summary>
	public class Remainder
	{
		/// <summary>
		/// Constructs new remainder class
		/// </summary>
		public Remainder()
		{
		}

		/// <summary>
		/// Struct which holds information about a range of bins.
		/// </summary>
		private struct BinsRange
		{
			public int Remains; //number of remainder to distribute in a range
			public int Start;	//range start index
			public int End;		//range end index (inclusive)
			public int Count;	//for convenience
			public bool IsLeft;	//whether this range is on the left of the median
			public BinsRange(int remains,int start,int end,bool isleft)
			{
				this.Remains=remains;
				this.Start=start;
				this.End=end;
				this.Count=End-Start+1;
				this.IsLeft=isleft;
			}
			public override string ToString()
			{
				string s="";
				s+=IsLeft? "L " : "R ";
				s+=" Rem:"+Remains.ToString()+" C:"+Count.ToString()+" S:"+Start.ToString()+" E:"+End.ToString();
				return s;
			}
		}

	
		/// <summary>
		/// Get the pattern of the remainder distribution inside a range.
		/// </summary>
		/// <param name="remains">number of remainder</param>
		/// <param name="binscount">number of bins in which the remainder to be distributed</param>
		/// <returns>array of int, where value=1 indicates the bin has a remainder to add</returns>
		public int[] GetRemainderPattern(int remains,int binscount)
		{
			int[] tempe=new int[binscount];
			for(int i=0;i<binscount-1;i++) tempe[i]=0;
			if(remains<=0) return tempe;
			BinsRange br=new BinsRange(remains,0,tempe.Length-1,true);
			AssignRemainder(new BinsRange[1]{br},ref tempe);
//			Console.Write("habis ({0}/{1}) : ",remains,binscount);
//			testempe(tempe);
			return tempe;
		}

		/// <summary>
		/// Assigns remainders to an array.
		/// </summary>
		/// <param name="brs">Array of BinsRange structures</param>
		/// <param name="pattern">array of integer which will hold the remainder distribution</param>
		private void AssignRemainder(BinsRange[] brs,ref int[] pattern)
		{
			for(int i=0;i<brs.Length;i++)
			{
				BinsRange br=brs[i];
				if(br.Remains==0) continue;
				int mi1=0; //median index 1
				int mi2=0; //median index 2, both equal if there's only one median
				if(br.Count==br.Remains) //all set
				{
					for(int j=br.Start;j<br.End+1;j++) pattern[j]=1;
					br.Remains=0;
				}
				if(br.Remains==1) //only one left
				{
					if(br.Start==0) SetBinsMedian(br.Start,ref br,ref pattern);
					if(br.End==(pattern.Length-1)) SetBinsMedian(br.End,ref br,ref pattern);
				}

				if(!isEven(br.Remains) && !isEven(br.Count)) //one median, set if there's any remainder left
				{
					mi1 = mi2 = br.Start + (br.Count-1)/2;
					SetBinsMedian(mi1,ref br,ref pattern);
				}
				else if(!isEven(br.Remains) && isEven(br.Count)) //two medians, set the left one or the right one, depends on which half we're working on now
				{
					mi1=br.Start + (br.Count/2)-1;
					mi2=br.Start + br.Count/2;
					SetBinsMedian(br.IsLeft? mi1 : mi2,ref br,ref pattern);
				}
				else if(isEven(br.Remains) && !isEven(br.Count)) //one median, do not set
				{
					//don't set now, let this range split some more,median is EXCLUSIVE to the split
					mi1=mi2=br.Start + (br.Count-1)/2;
				}
				else if(isEven(br.Remains) && isEven(br.Count)) //two medians
				{			
                    //don't set now, just let it split,medians is INCLUSIVE to the split	
					mi1=br.Start + br.Count/2;
					mi2=br.Start + (br.Count/2)- 1;
				}
				//now, br.Remains is either 0 or even number, br.Count is even number.
				if(br.Remains==0) continue; //no remainder to distribute

				//else, split both the remainder & bins
				BinsRange brL=new BinsRange(br.Remains/2,br.Start,mi1-1,false);
				if(brL.Start<=pattern.Length/2) brL.IsLeft=true;
				BinsRange brR=new BinsRange(br.Remains/2,mi2+1,br.End,false);
				if(brR.Start<=pattern.Length/2) brR.IsLeft=true;
				
				AssignRemainder(new BinsRange[2]{brL,brR},ref pattern);
			}
		}

		/// <summary>
		/// Gets a value indicating whether an integer value is an even value.
		/// </summary>
		/// <param name="num">integer value to check</param>
		/// <returns>value indicating whether this integer is even.</returns>
		private static bool isEven(int num)
		{
			if(num==0) return false;
			return ((double)num/2.0 == Math.Floor((double)num/2.0));
		}

		/// <summary>
		/// Set a remainder to the median of a BinsRange
		/// </summary>
		/// <param name="index">an index of the pattern array</param>
		/// <param name="br">BinsRange where the median reside</param>
		/// <param name="pattern">array of integer which will hold the remainder distribution</param>
		private static void SetBinsMedian(int index, ref BinsRange br, ref int[] pattern)
		{
			if(br.Remains<=0) return;
			if(index<0 || index>=pattern.Length) Console.WriteLine("error {0} {1}",index,br);
			if(pattern[index]<1) //is this needed? i think not
			{
				pattern[index]=1;
				br.Remains-=1;
			}
		}

		/// <summary>
		/// just a test
		/// </summary>
		/// <param name="rempat">remainder pattern</param>
		private static void testempe(int[] rempat)
		{
			for(int i=0;i<rempat.Length;i++)
			{
				Console.Write("{0} ",rempat[i]);
			}
			Console.WriteLine("");
		}

	}
}
