using System;

namespace k_medoid
{
	/// <summary>
	/// Summary description for Rnd.
	/// </summary>
	public class Rnd
	{
		static private Random rn = new Random();
		static public int Int( int min, int max )
		{
			return (int)( min + ( rn.NextDouble() * (max - min + 1) ) );
		}

		static public double Double( double min, double max )
		{
			return ( min + ( rn.NextDouble() * ( max - min ) ) );
		}

		static public int[] RndInt( int min, int max, int num )
		{
			int[] ret = new int[ num ];

			for (int i=0; i<num; i++)
				ret[i] = Rnd.Int( min, max );

			return ret;
		}

		static public double[] RndDouble( int min, int max, int num )
		{
			double[] ret = new double[ num ];

			for (int i=0; i<num; i++)
				ret[i] = Rnd.Double( min, max );

			return ret;
		}

		static public int[] RndIntNoRep( int min, int max, int num )
		{
			int fromValue = min,
				toValue = max;

			int[] pool = new int[ toValue - fromValue + 1 ];

			for (int i=fromValue; i<=toValue; i++)
				pool[i] = fromValue + i;

			int[] ret = new int[ num ];

			for (int i=0; i<num; i++)
			{
				int temp = Rnd.Int( fromValue, toValue );
				ret[i] = pool[ temp ];
				pool[ temp ] = pool[ toValue-- ];
			}

			return ret;
		}
	}
}
