///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Collections;

using GeoCon.Data;
namespace GeoCon.Classification
{
	/// <summary>
	/// Summary description for IntegerClassifier.
	/// </summary>
	[Serializable]
	public class IntegerClassifier : Classifier
	{
		#region constructors
		public IntegerClassifier(): base(){}
		public IntegerClassifier(ClassificationInfo cinfo) : base(cinfo){}
		public IntegerClassifier(ClassificationInfo cinfo,ArrayList idxs) : base (cinfo,idxs) {}
		#endregion

		#region utilities
		private static int getMinInclusiveIndex(object[] objs,int val)
		{
			if((int)objs[0]>val) return -1;
			if((int)objs[objs.Length-1]<=val) return objs.Length-1;
			for(int i=0;i<objs.Length;i++) if((int)objs[i]>=val) return i;
			return -1;
		}
		private static int getMaxInclusiveIndex(object[] objs,int val)
		{
			if((int)objs[0]>val) return -1;
			if((int)objs[objs.Length-1]<=val) return objs.Length-1;
			for(int i=objs.Length-1;i>-1;i--) if((int)objs[i]<=val) return i;
			return -1;
		}
		private int GetUniqueCount(object[] objs)
		{
			int uniqueCount=1;
			for(int i=1;i<objs.Length;i++) if((int)objs[i]!=(int)objs[i-1]) uniqueCount++;
			return uniqueCount;
		}
		#endregion

		#region equal classification
		public BinCollection ClassifyEqual() 
		{
			int[] idxs=new int[0];
			object[] objs=this.GetSortedNonNullValues(out idxs);
			BinCollection bins = new BinCollection(Setup);
			if(objs.Length==0) return bins;
			if(Setup.BinsCount>=GetUniqueCount(objs)) return ClassifyUnique();

			int rng = (int)objs[objs.Length-1] - (int)objs[0] + 1; //why +1?
			int interval=(int)(Math.Floor((double)rng/(double)(Setup.BinsCount)));
			int remains = rng-interval*Setup.BinsCount;
			Remainder rem=new Remainder(); //remains should be distributed evenly accross bins median
			int[] rempat = rem.GetRemainderPattern(remains,Setup.BinsCount); 
			int vLow = (int)objs[0];
			for(int b=0;b<Setup.BinsCount;b++)
			{
				int vHigh = vLow+interval+rempat[b]-1; //-1 because it's Max Inclusive
				bins.Add(new IntegerBin(vLow,vHigh));
				int mini = getMinInclusiveIndex(objs,vLow);
				int maxi = getMaxInclusiveIndex(objs,vHigh);
				for(int i=mini;i<maxi+1;i++) bins[bins.Count-1].ContentsIndex.Add(idxs[i]);
				vLow=vHigh+1;
			}		

			FillNullBin(bins.NullBin,idxs);
			objs=null;
			idxs=null;
			rem=null;
			rempat=null;

			return bins;
		}
		#endregion

		#region quantile classification
		public BinCollection ClassifyQuantile()
		{
			int[] idxs=new int[0];
			object[] objs=this.GetSortedNonNullValues(out idxs);
			BinCollection bins = new BinCollection(Setup);
			if(objs.Length==0) return bins;
			if(Setup.BinsCount>=GetUniqueCount(objs)) return ClassifyUnique();

			int dcount = objs.Length;
			int interval=(int)(Math.Floor((double)dcount/(double)Setup.BinsCount));
			int remains = dcount-interval*Setup.BinsCount;
			Remainder rem=new Remainder(); //remains should be distributed evenly accross the bins median
			int[] rempat = rem.GetRemainderPattern(remains,Setup.BinsCount); 

			int nLow=0;
			for(int b=0;b<Setup.BinsCount;b++)
			{
				int vLow  = (int)objs[nLow];
				int nHigh = nLow+interval+rempat[b]-1;
				if(nHigh>=objs.Length) nHigh=objs.Length-1;
				int vHigh = (int)objs[nHigh];
				bins.Add(new IntegerBin(vLow,vHigh));
				int mini=Array.IndexOf(objs,vLow);
				int maxi=Array.LastIndexOf(objs,vHigh);
				for(int i=mini;i<maxi+1;i++) bins[bins.Count-1].ContentsIndex.Add(idxs[i]);
				nLow=maxi+1;
			}

			FillNullBin(bins.NullBin,idxs);
			objs=null;
			idxs=null;
			rem=null;
			rempat=null;
			
			return bins;
		}

		#endregion

		#region natural classification
		public BinCollection ClassifyNatural()
		{
			int[] idxs=new int[0];
			object[] objs=this.GetSortedNonNullValues(out idxs);
			BinCollection bins = new BinCollection(Setup);
			if(objs.Length==0) return bins;
			if(Setup.BinsCount>=GetUniqueCount(objs)) return ClassifyUnique();

			int[] kclass= getNaturalBreaks(objs,Setup.BinsCount);
			int mini=0;
			for(int b=1;b<Setup.BinsCount+1;b++)
			{
				int index=(b==Setup.BinsCount)? kclass[Setup.BinsCount - 1] : kclass[b - 1];
				int maxi = index;
				if(mini<0) mini=0;
				if(mini>=objs.Length) mini=objs.Length-1;
				int vLow = (int)objs[mini];
				if(mini>maxi || maxi<0 || maxi>=objs.Length) maxi=mini;
				int vHigh = (int)objs[maxi];
				bins.Add(new IntegerBin(vLow,vHigh));
				for(int i=mini;i<maxi+1;i++) bins[bins.Count-1].ContentsIndex.Add(idxs[i]);
				vLow=vHigh;
				mini=maxi+1;
			}

			FillNullBin(bins.NullBin,idxs);

			kclass=null;
			idxs=null;
			objs=null;

			return bins;
		}

		/// <summary>
		/// Gets Jenks break indexes.  This algorithm is taken from GeoTools project (www.geotools.org)
		/// </summary>
		/// <param name="values">data values in which to find breaks</param>
		/// <param name="count">number of breaks desired</param>
		/// <returns>Index of breaks inside data values</returns>
		private static int[] getNaturalBreaks(object[] values,int count)
		{
			int numdata = values.Length;
			int[] st = new int[numdata];
			int[][] mat1 = new int[numdata + 1][];
			int[][] mat2 = new int[numdata + 1][];
			for(int i=0;i<numdata+1;i++)
			{
				mat1[i]=new int[count+1];
				mat2[i]=new int[count+1];
			}
			for (int i = 1; i<count+1; i++) 
			{
				mat1[1][i] = 1;
				mat2[1][i] = 0;
				for (int j = 2; j<=numdata; j++) mat2[j][i] = int.MaxValue;
			}
			int v = 0;
			for (int l = 2; l < numdata+1; l++) 
			{
				int s1 = 0;
				int s2 = 0;
				int w = 0;
				for (int m = 1; m < l+1; m++) 
				{
					int i3 = l - m + 1;
					int val = (int)values[i3-1];
					s2 += val * val;
					s1 += val;
					w++;
					v = s2 - (s1 * s1) / w;
					int i4 = i3 - 1;
					if (i4 != 0) 
					{
						for (int j = 2; j < count+1; j++) 
						{
							if (mat2[l][j] >= (v + mat2[i4][j - 1])) 
							{
								mat1[l][j] = i3;
								mat2[l][j] = v + mat2[i4][j - 1];
							}
						}
					}
				}
				mat1[l][1] = 1;
				mat2[l][1] = v;
			}

			int k = numdata; 
			int[] kclass = new int[count];
			kclass[count - 1] = values.Length - 1;
			for (int j = count; j > 1; j--) 
			{
				int id =  (int) (mat1[k][j]) - 2;
				kclass[j - 2] = id;
				k = (int) mat1[k][j] - 1;
			}

			st=null;
			mat1=null;
			mat2=null;
			return kclass;
		}
		#endregion
	}
}
