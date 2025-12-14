using System;
using System.Data;

namespace bp_nnet
{
	/// <summary>
	/// Summary description for BPN.
	/// </summary>

	public class Tools
	{
		static Random r = new Random();

		public static double getRnd( int x )
		{
			double temp = 0;

			while ( temp == 0 )
				temp = ( ( r.NextDouble() * 4.8 ) - 2.4 ) / x;

			return temp;
		}

		public static double sigmoid( double x )
		{
			return ( 1 / ( 1 + Math.Exp( -x ) ) );
		}

		public static double sse( double[] Desiredoutput, double[] output )
		{
			double ret = 0;

			if ( Desiredoutput.Length != output.Length )
				throw new Exception();

			for (int i=0; i<output.Length; i++)
				ret += Math.Pow( Desiredoutput[i] - output[i], 2 );

			return ret;
		}
	}

	public class BPN
	{
		private DataSet dataSource;
		private DataTable	input2hidden, hidden2output;
		private double maxEpoch, learningRate, satisSse;
		private int x,y,z;
		private double[] inX;
		private double[][] in2hide;
		private double[] hideX, hideBias,hideY, hideGradient;
		private double[][] hide2out;
		private double[] outX, outBias, outY, outGradient, outDesired, outError;
		//----------//

		public BPN(){}

		public BPN(	int hiddenSize, double maxEpoch, double learnRate, double satisSse, DataSet ds )
		{
			this.maxEpoch	= maxEpoch;
			this.satisSse	= satisSse;
			this.learningRate = learnRate;

			this.SetDetail( ds, hiddenSize );

			this.Initialize();
		}

		public void SetCriterion(	double maxEpoch, double learnRate, double satisSse )
		{
			this.maxEpoch	= maxEpoch;
			this.satisSse	= satisSse;
			this.learningRate = learnRate;
		}

		public void SetDetail( DataSet ds, int hiddenSize )
		{
			this.y = hiddenSize;
			if ( y == 0 )
				throw new Exception( "No Hidden Layer." );
			//-----//
			this.x = 0;
			this.z = 0;
			this.dataSource = ds;

			for (int count=0; count<dataSource.Tables["detail"].Columns.Count; count++)
				if ( dataSource.Tables["detail"].Rows[0][count].ToString() == "i" )
					x++;
				else if ( dataSource.Tables["detail"].Rows[0][count].ToString() == "o" )
					z++;

			if ( x == 0 || z == 0 )
				throw new Exception( "Invalid xml file." );
			//-------------------//
			this.inX = new double[x];
			this.in2hide = new double[x][];

			for (int i=0; i<x; i++)
				this.in2hide[i] = new double[y];
			//---------------------//
			this.hideX = new double[y];
			this.hideY = new double[y];
			this.hideBias = new double[y];
			this.hideGradient = new double[y];
			this.hide2out = new double[y][];

			for (int j=0; j<y; j++)
				this.hide2out[j] = new double[z];
			//--------------------//
			this.outX = new double[z];
			this.outY = new double[z];
			this.outGradient = new double[z];
			this.outDesired = new double[z];
			this.outError = new double[z];
			this.outBias = new double[z];
		}

		public void Initialize()
		{
			for (int i=0; i<x; i++)
				for (int j=0; j<y; j++)
					this.in2hide[i][j] = Tools.getRnd( x+1 );

			for (int j=0; j<y; j++)
			{
				for (int k=0; k<z; k++)
					this.hide2out[j][k] = Tools.getRnd( y+1 );

				this.hideBias[j] = Tools.getRnd( x+1 );
			}

			for (int k=0; k<z; k++)
			{
				this.outBias[k] = Tools.getRnd( y+1 );
			}

		}

		private void InputTrainActivation( int row )
		{
			for (int i=0; i<x; i++)
				inX[i] = Convert.ToDouble(
							dataSource.Tables["train"].Rows[row]["X_"+i.ToString()] );

			for (int k=0; k<z; k++)
				this.outDesired[k] = Convert.ToDouble(
									dataSource.Tables["train"].Rows[row]["Y_"+k.ToString()] );
		}

		private void InputTestActivation( int row )
		{
			for (int i=0; i<x; i++)
				inX[i] = Convert.ToDouble(
							dataSource.Tables["test"].Rows[row]["X_"+i.ToString()] );

			for (int k=0; k<z; k++)
				this.outDesired[k] = Convert.ToDouble(
									dataSource.Tables["test"].Rows[row]["Y_"+k.ToString()] );
		}

		private void HiddenActivation()
		{
			for (int j=0; j<y; j++)
			{
				this.hideX[j] = 0;

				for (int i=0; i<x; i++)
					this.hideX[j] += inX[i] * in2hide[i][j];
				this.hideY[j] = Tools.sigmoid( this.hideX[j] - this.hideBias[j] );
			}
		}

		private void OutputActivation()
		{
			for (int k=0; k<z; k++)
			{
				this.outX[k] = 0;

				for (int j=0; j<y; j++)
					this.outX[k] += hideY[j] * hide2out[j][k];
				this.outY[k] = Tools.sigmoid( this.outX[k] - this.outBias[k] );
			}
		}

		private void GradientCalculate()
		{
			for (int k=0; k<z; k++)
			{
				outError[k] = outDesired[k] - outY[k];
				outGradient[k] = outY[k] * ( 1 - outY[k] ) * outError[k];
			}
			//----------------//
			for (int j=0; j<y; j++)
			{
				double sum=0;
				for (int k=0; k<z; k++)
					sum += outGradient[k] * hide2out[j][k];
				hideGradient[j] = hideY[j] * ( 1 - hideY[j] ) * sum;
			}
		}

		private void WeightTraining()
		{
			for (int k=0; k<z; k++)
				for (int j=0; j<y; j++)
				{
					if (hide2out[j][k] != 0)
					{
						hide2out[j][k] += learningRate * hideY[j] * outGradient[k];
						outBias[k] -= learningRate * outGradient[k];
					}
				}
			//----------------//
			for (int j=0; j<y; j++)
				for (int i=0; i<x; i++)
				{
					if (in2hide[i][j] != 0)
					{
						in2hide[i][j] += learningRate * inX[i] * hideGradient[j];
						hideBias[j] -= learningRate * hideGradient[j];
					}
				}
		}

		public DataSet Training()
		{
			int epoch;
			DateTime before, after;
			DataSet ret = new DataSet( "Training" );
			DataTable stat = new DataTable( "Statistic" );

			stat.Columns.Add( "key", typeof(string) );
			stat.Columns.Add( "value", typeof(double) );
			
			int maxRow = dataSource.Tables["train"].Rows.Count;
			double sse = 0;

			before = DateTime.Now;
			for (epoch=0; (epoch<maxEpoch) || (maxEpoch<=0); epoch++)
			{
				sse=0;
				for (int row=0; row<maxRow; row++)
				{
					this.InputTrainActivation( row );
					this.HiddenActivation();
					this.OutputActivation();
					this.GradientCalculate();
					this.WeightTraining();

					sse += Tools.sse( outDesired, outY );
				}

				if ( sse < satisSse )
					break;
			}

			after = DateTime.Now;

			DataRow r1 = stat.NewRow();
			r1["key"] = "time";
			r1["value"] = ((TimeSpan)(after-before)).TotalSeconds;
			stat.Rows.Add( r1 );

			DataRow r2 = stat.NewRow();
			r2["key"] = "epoch";
			r2["value"] = epoch == maxEpoch ? epoch : epoch+1;
			stat.Rows.Add( r2 );

			DataRow r3 = stat.NewRow();
			r3["key"] = "sse";
			r3["value"] = sse;;
			stat.Rows.Add( r3 );

			ret.Tables.Add( stat );

			return ret;
		}

		public DataSet Testing()
		{
			DateTime before, after;
			DataSet ret = new DataSet( "Testing" );
			DataTable test = new DataTable( "Test" ),
					  stat = new DataTable( "Statistic" );

			stat.Columns.Add( "key", typeof(string) );
			stat.Columns.Add( "value", typeof(double) );

			test.Columns.Add( "example", typeof(int) );
			test.Columns.Add( "result", typeof(string) );

			for (int k=0; k<z; k++)
			{
				test.Columns.Add( "output " + k.ToString(), typeof(string) );
				test.Columns.Add( "desired " + k.ToString(), typeof(string) );
			}

			int maxRow = dataSource.Tables[ "test" ].Rows.Count,
				correct = 0;
			before = DateTime.Now;

			for (int row=0; row<maxRow; row++)
			{
				this.InputTestActivation( row );
				this.HiddenActivation();
				this.OutputActivation();

				DataRow r = test.NewRow();
				r[ "example" ] = row + 1;
				bool ok = true;

				for (int k=0; k<z; k++)
				{
					r[ "output "+k.ToString() ] = outY[k].ToString( "0.0000" );
					r[ "desired "+k.ToString() ] = outDesired[k].ToString( "0.0000" );
					if ( Math.Abs( outDesired[k] - outY[k] ) > 0.5 )
						ok = false;
				}

				if ( ok )
				{
					r[ "result" ] = "ok";
					correct++;
				}
				else
					r["result"] = "no";

				test.Rows.Add( r );
			}

			after = DateTime.Now;

			DataRow r1 = stat.NewRow();
			r1["key"] = "accuracy";
			r1["value"] = ( (double)correct / (double)maxRow ) * 100;
			stat.Rows.Add( r1 );

			DataRow r2	= stat.NewRow();
			r2["key"]	= "time";
			r2["value"]	=( (TimeSpan)(after-before) ).TotalSeconds;
			stat.Rows.Add( r2 );

			ret.Tables.Add( stat );
			ret.Tables.Add( test );

			return ret;
		}

		public void SetInput2hidden( DataTable tab )
		{
			if ( tab.Rows.Count != x + 1 |
				tab.Columns.Count != y + 1 )
				throw new Exception( "Dimension mismatch" );

			for (int j=0; j<y; j++)
			{
				for (int i=0; i<x; i++)
					in2hide[i][j] = Convert.ToDouble( tab.Rows[i][ "hidden " + j.ToString() ] );
				hideBias[j] = Convert.ToDouble( tab.Rows[x][ "hidden " + j.ToString() ] );
			}
		}

		public void SetHidden2output( DataTable tab )
		{
			if ( tab.Rows.Count != y + 1 ||
				tab.Columns.Count != z + 1 )
				throw new Exception( "Dimension mismatch" );

			for (int k=0; k<z; k++)
			{
				for (int j=0; j<y; j++)
					hide2out[j][k] = Convert.ToDouble(
									tab.Rows[j][ "output " + k.ToString() ] );

				outBias[k] = Convert.ToDouble(
							tab.Rows[y][ "output " + k.ToString() ] );
			}
		}

		public DataSet GetWeights()
		{
			input2hidden = new DataTable( "input2hidden" );
			hidden2output = new DataTable( "hidden2output" );

			input2hidden.Columns.Add( "name", typeof(string) );

			for (int j=0; j<y; j++)
				input2hidden.Columns.Add( "hidden " + j.ToString(), typeof(double) );

			for (int i=0; i<x; i++)
			{
				DataRow r = input2hidden.NewRow();

				for (int j=0; j<y; j++)
					r[ "hidden " + j.ToString() ] = in2hide[i][j];

				r["name"] = "input " + i.ToString();
				input2hidden.Rows.Add( r );
			}

			DataRow r2 = input2hidden.NewRow();

			for (int j=0; j<y; j++)
				r2[ "hidden " + j.ToString() ] = hideBias[j];
			r2[ "name" ] = "bias";

			input2hidden.Columns[ "name" ].ReadOnly = true;
			input2hidden.Rows.Add( r2 );

			hidden2output.Columns.Add( "name", typeof(string) );
			for (int k=0; k<z; k++)
				hidden2output.Columns.Add( "output " + k.ToString(), typeof(double) );

			for (int j=0; j<y; j++)
			{
				DataRow r = hidden2output.NewRow();

				for (int k=0; k<z; k++)
					r[ "output " + k.ToString() ] = hide2out[j][k];

				r["name"] = "hidden " + j.ToString();
				hidden2output.Rows.Add( r );
			}

			DataRow r3 = hidden2output.NewRow();

			for (int k=0; k<z; k++)
				r3[ "output " + k.ToString() ] = outBias[k];

			r3[ "name" ] = "bias";

			hidden2output.Rows.Add( r3 );
			hidden2output.Columns[ "name" ].ReadOnly = true;
			
			DataSet ds = new DataSet( "Weights" );
			ds.Tables.Add( input2hidden.Copy() );
			ds.Tables.Add( hidden2output.Copy() );

			return ds;
		}
	}
}
