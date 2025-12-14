///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Collections;

using GeoCon.Data;

namespace GeoCon.Classification
{
	/// <summary>
	/// Summary description for Classifier.
	/// </summary>
	[Serializable]
	public class Classifier
	{
		public ArrayList indexes;
		public ClassificationInfo Setup;

		#region constructors
		public Classifier()
		{
			//always throw exception?
		}
		public Classifier(ClassificationInfo cinfo)
		{
			Setup=cinfo;
		}
		public Classifier(ClassificationInfo cinfo,ArrayList idxs)
		{
			Setup=cinfo;
			indexes = idxs;
		}
		#endregion

		#region utilities
		protected ArrayList GetNonNullIndexes()
		{
			Field f=Setup.Field;
			if(indexes==null)
			{
				indexes=new ArrayList();
				for(int i=0;i<f.Count;i++) indexes.Add(i); 
			}
			ArrayList nnidx=new ArrayList();
			for(int j=0;j<indexes.Count;j++)
			{
				if(f[(int)indexes[j]]!=f.NullSymbol) nnidx.Add(indexes[j]);
			}
			return nnidx;
		}
		private object[] GetNonNullValues(out int[] idxs)
		{
			ArrayList aidx = GetNonNullIndexes();
			idxs=new int[aidx.Count];
			aidx.CopyTo(idxs); 
			object[] objs=new object[idxs.Length];
			for(int i=0;i<idxs.Length;i++)
			{
				objs[i]=Setup.Field[idxs[i]];
			}
			return objs;
		}
		protected object[] GetSortedNonNullValues(out int[] idxs)
		{
			object[] objs=GetNonNullValues(out idxs);
			Array.Sort(objs,idxs);
			return objs;
		}
		protected object[] GetActiveValues()
		{
			Field f=Setup.Field;
			if(indexes==null)
			{
				indexes=new ArrayList();
				for(int i=0;i<f.Count;i++) indexes.Add(i); 
			}
			object[] objs=new object[indexes.Count];
			for(int i=0;i<indexes.Count;i++)
			{
				objs[i]=Setup.Field[(int)(indexes[i])];
			}
			return objs;
		}
		protected void FillNullBin(Bin nullBin, int[] idxs)
		{
			int nullcount=indexes.Count-idxs.Length;
			if(nullcount<=0) return; //no null here
			int nc=0;
			for(int i=0;i<indexes.Count;i++)
			{
				//if(Setup.Field[(int)indexes[i]]==Setup.Field.NullSymbol) 
				if(Setup.Field[(int)indexes[i]].Equals(Setup.Field.NullSymbol)) 
				{
					nullBin.ContentsIndex.Add(indexes[i]);
					nc++;
					if(nc>nullcount) return; //all null have been added
				}
			}
		}
		#endregion

		#region single classification
		public BinCollection ClassifySingle()
		{
			Bin b = new Bin();
			b.DataType=Setup.Field.Type;
			if(indexes==null)
			{
				indexes=new ArrayList();
				for(int i=0;i<Setup.Field.Count;i++) indexes.Add(i);
			}
			for(int i=0;i<indexes.Count;i++) b.AddIndex((int)(indexes[i]));
			BinCollection bins = new BinCollection(Setup);

			bins.Add(b);
			return bins;
		}
		#endregion

		#region unique classification
		public virtual BinCollection ClassifyUnique()
		{
			BinCollection bins = new BinCollection(Setup);
			int[] idxs=new int[0];
			object[] objs=this.GetSortedNonNullValues(out idxs);
			if(objs.Length==0) return bins;

			bins.Add(new Bin(objs[0]));
			bins[bins.Count-1].DataType=Setup.Field.Type;
			bins[bins.Count-1].AddIndex(idxs[0]);
			for(int i=1;i<objs.Length;i++)
			{
				if(object.Equals(objs[i-1],objs[i]))
				//if(objs[i-1]==objs[i])
				{
					bins[bins.Count-1].AddIndex(idxs[i]);
				}
				else
				{
					bins.Add(new Bin(objs[i]));
					bins[bins.Count-1].DataType=Setup.Field.Type;
					bins[bins.Count-1].AddIndex(idxs[i]);
				}
			}

			FillNullBin(bins.NullBin,idxs);
			objs=null;
			idxs=null;
			return bins;
		}
		#endregion

	}
}
