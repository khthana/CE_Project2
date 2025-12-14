using System;
using System.Data;
namespace k_medoid
{
	/// <summary>
	/// Summary description for K_medoid.
	/// </summary>
	public class K_medoid
	{
		private static double[][] obj;
		private static int maxRow;

		public static DataTable Cluster( DataTable tabIn, int numGroup, string nameCol, int numCol )
		{
			DataTable tab = tabIn.Copy();
			tab.Columns.Add( "group", typeof(int) );
			maxRow = tab.Rows.Count;
			//-----------------------------------------------------------------//
			double currentScore = 0;
			int[] group = new int[ maxRow ];
			obj = new double[ maxRow ][];

			for (int i=0; i<maxRow; i++)
			{
				obj[i] = new double[ numCol ];
				for (int j=0; j<numCol; j++)
					obj[i][j] = Convert.ToDouble( tab.Rows[i][ nameCol + j.ToString() ] );
			}
			//----------------------------------------------------------------//
			int[] currentCent = Rnd.RndIntNoRep( 0, maxRow-1, numGroup );
			currentScore = TotalCost( currentCent, group );

			for (int rn=0; rn<10; rn++)
			{
				int[] testCent = Rnd.RndIntNoRep( 0, maxRow-1, numGroup );
				double testScore = TotalCost( testCent, group );

				if ( testScore < currentScore )
				{
					currentCent = testCent;
					currentScore = TotalCost( currentCent, group );
				}
				else if ( testScore > currentScore )
					rn--;
			}
			//----------------------------------------------------------------//
			for (int g=0; g<maxRow; g++)
				tab.Rows[g][ "group" ] = group[g];

			for (int i=0; i<maxRow; i++)
				for (int j=0; j<numCol; j++)
					tab.Rows[i][ nameCol+j ] = obj[i][j];

			return tab;
		}

		private static double TotalCost( int[] center, int[] g )
		{
			double cost = 0,
					ret = 0;

			for (int i=0; i<obj.Length; i++)
			{
				cost = Cost( obj[i], obj[ center[0] ] );
				g[i] = 0;

				for (int j=0; j<center.Length; j++)
				{
					int now = center[j];

					if ( Cost( obj[i], obj[ now ] ) < cost )
					{
						cost = Cost( obj[i], obj[ now ] );
						g[i] = j;
					}
				}

				ret += cost;
			}

			return ret;
		}

		private static double Cost( double[] a, double[] b )
		{
			double ret = 0;
			if ( a.Length != b.Length )
				throw new Exception( "dimension error" );

			for (int i=0; i<a.Length; i++)
				ret += Math.Pow( (a[i] - b[i]), 2 );

			return ret;
		}
	}
}
