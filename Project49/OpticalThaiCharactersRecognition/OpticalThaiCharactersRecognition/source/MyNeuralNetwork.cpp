#include "stdafx.h"
#include "MyNeuralNetwork.h"
#include <malloc.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>
#include <math.h>
#include <stdio.h>


#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

/////////////////////////////////////////////////////////////////////////////////////////////////
// NeuralNetworkLayer Class
/////////////////////////////////////////////////////////////////////////////////////////////////
NeuralNetworkLayer::NeuralNetworkLayer()
{
	ParentLayer = NULL;
	ChildLayer = NULL;
	LinearOutput = false;
	UseMomentum = false;
	MomentumFactor = 0.9;
}

void NeuralNetworkLayer::Initialize(int NumNodes, NeuralNetworkLayer* parent, NeuralNetworkLayer* child)
{
	int	i, j;

	// Allocate memory
	NeuronValues = (double*) malloc(sizeof(double) * NumberOfNodes);
	DesiredValues = (double*) malloc(sizeof(double) * NumberOfNodes);
	Errors = (double*) malloc(sizeof(double) * NumberOfNodes);

	if(parent != NULL)
	{		
		ParentLayer = parent;
	}

	if(child != NULL)
	{
		ChildLayer = child;

	
		Weights = (double**) malloc(sizeof(double*) * NumberOfNodes);
		WeightChanges = (double**) malloc(sizeof(double*) * NumberOfNodes);
		for(i = 0; i<NumberOfNodes; i++)
		{
			Weights[i] = (double*) malloc(sizeof(double) * NumberOfChildNodes);
			WeightChanges[i] = (double*) malloc(sizeof(double) * NumberOfChildNodes);
		}

		BiasValues = (double*) malloc(sizeof(double) * NumberOfChildNodes);
		BiasWeights = (double*) malloc(sizeof(double) * NumberOfChildNodes);
	} else {
		Weights = NULL;
		BiasValues = NULL;
		BiasWeights = NULL;
	}

	// Make sure everything contains zeros
	for(i=0; i<NumberOfNodes; i++)
	{
		NeuronValues[i] = 0;
		DesiredValues[i] = 0;
		Errors[i] = 0;
		
		if(ChildLayer != NULL)
			for(j=0; j<NumberOfChildNodes; j++)
			{
				Weights[i][j] = 0;
				WeightChanges[i][j] = 0;
			}
	}

	if(ChildLayer != NULL)
		for(j=0; j<NumberOfChildNodes; j++)
		{
			BiasValues[j] = -1;
			BiasWeights[j] = 0;
		}

}

void NeuralNetworkLayer::CleanUp(void)
{
	int	i;

	free(NeuronValues);
	free(DesiredValues);
	free(Errors);
	
	if(Weights != NULL)
	{
		for(i = 0; i<NumberOfNodes; i++)
		{
			free(Weights[i]);
			free(WeightChanges[i]);
		}

		free(Weights);
		free(WeightChanges);
	}

	if(BiasValues != NULL) free(BiasValues);
	if(BiasWeights != NULL) free(BiasWeights);
}

void NeuralNetworkLayer::RandomizeWeights(void)
{
	int	i,j;
	int	min = 0;
	int	max = 200;
	int	number;

	srand( (unsigned)time( NULL ) );

	for(i=0; i<NumberOfNodes; i++)
	{
		for(j=0; j<NumberOfChildNodes; j++)
		{	
			number = (((abs(rand())%(max-min+1))+min));    
    
			if(number>max)
				number = max;

			if(number<min)
    			number = min;		
			
			Weights[i][j] = number / 100.0f - 1;
		}
	}
	
	for(j=0; j<NumberOfChildNodes; j++)
	{
			number = (((abs(rand())%(max-min+1))+min));    
    
			if(number>max)
				number = max;

			if(number<min)
    			number = min;		
			
			BiasWeights[j] = number / 100.0f - 1;		
	}
}

void NeuralNetworkLayer::CalculateErrors(void)
{
	int		i, j;
	double	sum;
	
	if(ChildLayer == NULL) // output layer
	{
		for(i=0; i<NumberOfNodes; i++)
		{
			Errors[i] = (DesiredValues[i] - NeuronValues[i]) * NeuronValues[i] * (1.0f - NeuronValues[i]);
		}
	} else if(ParentLayer == NULL) { // input layer
		for(i=0; i<NumberOfNodes; i++)
		{
			Errors[i] = 0.0f;
		}
	} else { // hidden layer
		for(i=0; i<NumberOfNodes; i++)
		{
			sum = 0;
			for(j=0; j<NumberOfChildNodes; j++)
			{
				sum += ChildLayer->Errors[j] * Weights[i][j];	
			}
			Errors[i] = sum * NeuronValues[i] * (1.0f - NeuronValues[i]);
		}
	}
}
void NeuralNetworkLayer::setoption(int opt)
{
	option = opt;
}
int NeuralNetworkLayer::AdjustWeights(void)
{
	int		i, j;	
	double	dw;
	//double  sumofdw = 0.0;
	int numberofweightok = 0;

	if(ChildLayer != NULL)
	{
		for(i=0; i<NumberOfNodes; i++)
		{
			for(j=0; j<NumberOfChildNodes; j++)
			{
				dw = LearningRate * ChildLayer->Errors[j] * NeuronValues[i];
				Weights[i][j] += dw + MomentumFactor * WeightChanges[i][j];			
				WeightChanges[i][j] = dw;
				if(option == 1)
				{
					//sumofdw += dw;
					if(dw <= 0.0005)
					{
						++numberofweightok;
					}
				}
				else if(option == 2)
				{
				}
				else if(option == 3)
				{
				}
			}
		}

		for(j=0; j<NumberOfChildNodes; j++)
		{
			BiasWeights[j] += LearningRate * ChildLayer->Errors[j] * BiasValues[j];
		}
	}
	return numberofweightok;
}

void NeuralNetworkLayer::doubleToStr(char* str,double flpNumber,int numFractDigits)
{
  double flpIP, zeros, round;
  int i, remainder, strLen;
  char sign = ' ';					// a ' ' or '-' will be output for more uniform display output

  if(numFractDigits < 0 || numFractDigits > 15)
		return;								//  FrmAlert(ALERTID_ERROR);

  if(flpNumber < 0.0)
  { 
	  flpNumber = -flpNumber;
      sign = '-';
  }

  zeros = 1.0;
  for (i=0; i<numFractDigits; i++)
     zeros *= 10;


  //zeros = pow(10, numFractDigits);			// get the rounding constant
  //round = 0.5/zeros;

  flpNumber = modf(flpNumber/* +round */, &flpIP);		// get integer and fractional parts

  if(sign == '-') 
  {
	str[0] = sign;
	_ltoa( (long)flpIP,&str[1],10);				//   (&str[1], (long) flpIP);//StrIToA
	strLen = strlen(str);					// put in the decimal point and terminate the string
	str[strLen] = '.';
	str[numFractDigits+strLen+1] = '\0';
  }
  else
  {
	_ltoa( (long)flpIP,&str[0],10);
	strLen = strlen(str);
	str[strLen] = '.';
	str[numFractDigits+strLen+1] = '\0';
  }

  flpNumber = flpNumber * zeros;			// fractional part

  for(i=numFractDigits+strLen; i>strLen; i--)		// convert the integer part
  {
	  remainder = fmod(flpNumber,10);
      str[i] = remainder + 0x30;
      flpNumber /= 10;
  }
}

void NeuralNetworkLayer::saveweight(void) 
{
	int i,j;
    char *WText = new char [30];
	CString towrite;
	CStdioFile file;
	CFileException feError;

	// Write file
	if(ChildLayer != NULL) 
	{
		if( file.Open( file_name , CFile::modeWrite | CFile::modeCreate, &feError ) )
		{
			for(i = 0;i < NumberOfNodes;i++) 
			{
				for(j = 0;j < NumberOfChildNodes;j++)
				{
					doubleToStr(WText,Weights[i][j],10);
					towrite = WText;
					file.WriteString( towrite + "\n" );      
					//contents[ t ] + m_eol
					//_file_.Write(
				}
			}
			for(j=0; j<NumberOfChildNodes; j++)
			{
				//[j] += LearningRate * ChildLayer->Errors[j] * BiasValues[j];
				doubleToStr(WText,BiasWeights[j],10);
				towrite = WText;
				file.WriteString( towrite + "\n" );
			}
			file.Close();
		}
	}
}
bool NeuralNetworkLayer::loadweight(void)
{
	int i,j;
	double res;
	char *stopstring;
	CString toread;
	CStdioFile file;
	CFileException feError;
	int counter = 0,counter_1 = 0;
	int limit = NumberOfNodes * NumberOfChildNodes;
	bool toret = false;

	if(ChildLayer != NULL)
	{
		if( file.Open( file_name, CFile::modeRead, &feError ) )
		{
			//CString line;
			while( file.ReadString( toread ) )
			{
				res = strtod( toread, &stopstring );
				if(counter < limit)
				{
					i = counter / NumberOfChildNodes; //i is row
					j =	counter % NumberOfChildNodes; //j is column
					Weights[i][j] = res;
					counter++;//		counter++;
				}
				else
				{
					BiasWeights[counter_1] = res;
					counter_1++;
				}
			}
			//contents.Add( line );
			if((counter > 0)&&(counter_1 > 0))
				toret = true;		//counter_1counter_1

			if(counter_1 == NumberOfChildNodes)
			{
				file.Close();
			}
		}
	}
	return toret;
}

void NeuralNetworkLayer::setFilename(char *str)
{
	file_name = str; //file_name file_name file_name file_name file_name file_name
}
void NeuralNetworkLayer::CalculateNeuronValues(void)
{
	int		i,j;
	double	x;
	
	if(ParentLayer != NULL)
	{
		for(j=0; j<NumberOfNodes; j++)
		{
			x = 0;
			for(i=0; i<NumberOfParentNodes; i++)
			{
				x += ParentLayer->NeuronValues[i] * ParentLayer->Weights[i][j];
			}			
			x += ParentLayer->BiasValues[j] * ParentLayer->BiasWeights[j];
			
			if((ChildLayer == NULL) && LinearOutput)
				NeuronValues[j] = x;
			else
				NeuronValues[j] = 1.0f/(1+exp(-x));				
		}
	}
}



/////////////////////////////////////////////////////////////////////////////////////////////////
// NeuralNetwork Class
/////////////////////////////////////////////////////////////////////////////////////////////////

void NeuralNetwork::saveWeight(int aa)
{
	char *WText = new char [30];
	CString towrite;
	CStdioFile file;
	CFileException feError;

	if(aa == 0)
	{
		InputLayer.setFilename("input_1.txt");
		HiddenLayer.setFilename("hidden_1.txt");
		OutputLayer.setFilename("output_1.txt");
	}
	else //mean here aa is equal to one
	{
		InputLayer.setFilename("input_2.txt");
		HiddenLayer.setFilename("hidden_2.txt");
		OutputLayer.setFilename("output_2.txt");
	}

	if( file.Open( "neuron.txt" , CFile::modeWrite | CFile::modeCreate, &feError ) )
	{
		_itoa( InputLayer.NumberOfNodes , WText , 10 );
		towrite = WText;
		file.WriteString( towrite + "\n" );

		_itoa( HiddenLayer.NumberOfNodes , WText , 10 );
		towrite = WText;
		file.WriteString( towrite + "\n" );

		_itoa( OutputLayer.NumberOfNodes , WText , 10 );
		towrite = WText;
		file.WriteString( towrite + "\n");

		file.Close();
	}

	InputLayer.saveweight();
	HiddenLayer.saveweight();
	OutputLayer.saveweight();
	delete[] WText;
}
bool NeuralNetwork::loadWeight(int which) //we must specify which file to load
{
	bool b1,b2,b3;
	int input , hidden , output;
	CString toread;
	CStdioFile file;
	CFileException feError;

	if(which == 0)
	{
		InputLayer.setFilename("input_1.txt");
		HiddenLayer.setFilename("hidden_1.txt");
		OutputLayer.setFilename("output_1.txt");
	}
	else
	{
		InputLayer.setFilename("input_2.txt");
		HiddenLayer.setFilename("hidden_2.txt");
		OutputLayer.setFilename("output_2.txt");
	}

	if( file.Open( "neuron.txt" , CFile::modeRead, &feError ) )
	{
		file.ReadString( toread );
		input = atoi( toread ) ;

		file.ReadString( toread );
		hidden = atoi( toread );

		file.ReadString( toread );
		output = atoi( toread );

		Initialize(input,hidden,output,0);
		file.Close();	
	}
	else
	{
		return false;
	}
	b1 = InputLayer.loadweight();
	b2 = HiddenLayer.loadweight();
	b3 = OutputLayer.loadweight();

	if((b1 == true)&&(b2 == true))
		return true;
	else
		return false;
}
void NeuralNetwork::Initialize(int nNodesInput, int nNodesHidden, int nNodesOutput,int sc)
{
	InputLayer.NumberOfNodes = nNodesInput;
	InputLayer.NumberOfChildNodes = nNodesHidden;
	InputLayer.NumberOfParentNodes = 0;	
	InputLayer.Initialize(nNodesInput, NULL, &HiddenLayer);
	InputLayer.RandomizeWeights();
	//InputLayer.setFilename("input.txt");

	HiddenLayer.NumberOfNodes = nNodesHidden;
	HiddenLayer.NumberOfChildNodes = nNodesOutput;
	HiddenLayer.NumberOfParentNodes = nNodesInput;		
	HiddenLayer.Initialize(nNodesHidden, &InputLayer, &OutputLayer);
	HiddenLayer.RandomizeWeights();
	//HiddenLayer.setFilename("hidden.txt");
	
	OutputLayer.NumberOfNodes = nNodesOutput;
	OutputLayer.NumberOfChildNodes = 0;
	OutputLayer.NumberOfParentNodes = nNodesHidden;		
	OutputLayer.Initialize(nNodesOutput, &HiddenLayer, NULL);	
	//OutputLayer.setFilename("output.txt");

	finishtraining = 0;
	setsch(sc);
}

void NeuralNetwork::CleanUp()
{
	InputLayer.CleanUp();
	HiddenLayer.CleanUp();
	OutputLayer.CleanUp();
}

void	NeuralNetwork::SetInput(int i, double value)
{
	if((i>=0) && (i<InputLayer.NumberOfNodes))
	{
		InputLayer.NeuronValues[i] = value;
	}
}

double	NeuralNetwork::GetOutput(int i)
{
	if((i>=0) && (i<OutputLayer.NumberOfNodes))
	{
		return OutputLayer.NeuronValues[i];
	}

	return (double) INT_MAX; // to indicate an error
}

void NeuralNetwork::SetDesiredOutput(int i, double value)
{
	if((i>=0) && (i<OutputLayer.NumberOfNodes))
	{
		OutputLayer.DesiredValues[i] = value;
	}
}

void NeuralNetwork::FeedForward(void)
{
	InputLayer.CalculateNeuronValues();
	HiddenLayer.CalculateNeuronValues();
	OutputLayer.CalculateNeuronValues();
}
void NeuralNetwork::setsch(int s) 
{
	InputLayer.setoption(s);
	HiddenLayer.setoption(s);
	OutputLayer.setoption(s);
}
void NeuralNetwork::BackPropagate(void)
{
	int hiddencounter,inputcounter;
	hiddencounter = 0;
	inputcounter = 0;

	OutputLayer.CalculateErrors();
	HiddenLayer.CalculateErrors();

	hiddencounter = HiddenLayer.AdjustWeights();
	inputcounter = InputLayer.AdjustWeights();

	if((hiddencounter == (HiddenLayer.NumberOfNodes * HiddenLayer.NumberOfChildNodes)) &&
      (inputcounter == (InputLayer.NumberOfNodes * InputLayer.NumberOfChildNodes)))
		finishtraining = 1;
	else
		finishtraining = 0;
}
int NeuralNetwork::checkforfinish(void)
{
	return finishtraining;  //checkforfinish
}

int	NeuralNetwork::GetMaxOutputID(void)
{
	int		i, id;
	double	maxval;

	maxval = OutputLayer.NeuronValues[0];
	id = 0;

	for(i=1; i<OutputLayer.NumberOfNodes; i++)
	{
		if(OutputLayer.NeuronValues[i] > maxval)
		{
			maxval = OutputLayer.NeuronValues[i];
			id = i;
		}
	}

	return id;
}

double NeuralNetwork::CalculateError(void)
{
	int		i;
	double	error = 0;

	for(i=0; i<OutputLayer.NumberOfNodes; i++)
	{
		error += pow(OutputLayer.NeuronValues[i] - OutputLayer.DesiredValues[i], 2);
	}

	error = error / OutputLayer.NumberOfNodes;

	return error;
}

void NeuralNetwork::SetLearningRate(double rate)
{
	InputLayer.LearningRate = rate;
	HiddenLayer.LearningRate = rate;
	OutputLayer.LearningRate = rate;
} 
double NeuralNetwork::getLearningRate()
{
	return InputLayer.LearningRate;
}
void	NeuralNetwork::SetLinearOutput(bool useLinear)
{
	InputLayer.LinearOutput = useLinear;
	HiddenLayer.LinearOutput = useLinear;
	OutputLayer.LinearOutput = useLinear;
}

void	NeuralNetwork::SetMomentum(bool useMomentum, double factor)
{
	InputLayer.UseMomentum = useMomentum;
	HiddenLayer.UseMomentum = useMomentum;
	OutputLayer.UseMomentum = useMomentum;

	InputLayer.MomentumFactor = factor;
	HiddenLayer.MomentumFactor = factor;
	OutputLayer.MomentumFactor = factor;

}

void NeuralNetwork::DumpData(char* filename)
{
	FILE*	f;
	int		i, j;

	f = fopen(filename, "w");
	
	fprintf(f, "--------------------------------------------------------\n");
	fprintf(f, "Input Layer\n");
	fprintf(f, "--------------------------------------------------------\n");
	fprintf(f, "\n");
	fprintf(f, "Node Values:\n");
	fprintf(f, "\n");
	for(i=0; i<InputLayer.NumberOfNodes; i++)		
		fprintf(f, "(%d) = %f\n", i, InputLayer.NeuronValues[i]);
	fprintf(f, "\n");
	fprintf(f, "Weights:\n");
	fprintf(f, "\n");
	for(i=0; i<InputLayer.NumberOfNodes; i++)
		for(j=0; j<InputLayer.NumberOfChildNodes; j++)
			fprintf(f, "(%d, %d) = %f\n", i, j, InputLayer.Weights[i][j]);
	fprintf(f, "\n");
	fprintf(f, "Bias Weights:\n");
	fprintf(f, "\n");
	for(j=0; j<InputLayer.NumberOfChildNodes; j++)
		fprintf(f, "(%d) = %f\n", j, InputLayer.BiasWeights[j]);

	fprintf(f, "\n");
	fprintf(f, "\n");

	fprintf(f, "--------------------------------------------------------\n");
	fprintf(f, "Hidden Layer\n");
	fprintf(f, "--------------------------------------------------------\n");
	fprintf(f, "\n");
	fprintf(f, "Weights:\n");
	fprintf(f, "\n");
	for(i=0; i<HiddenLayer.NumberOfNodes; i++)
		for(j=0; j<HiddenLayer.NumberOfChildNodes; j++)
			fprintf(f, "(%d, %d) = %f\n", i, j, HiddenLayer.Weights[i][j]);
	fprintf(f, "\n");
	fprintf(f, "Bias Weights:\n");
	fprintf(f, "\n");
	for(j=0; j<HiddenLayer.NumberOfChildNodes; j++)
		fprintf(f, "(%d) = %f\n", j, HiddenLayer.BiasWeights[j]);

	fprintf(f, "\n");
	fprintf(f, "\n");

	fprintf(f, "--------------------------------------------------------\n");
	fprintf(f, "Output Layer\n");
	fprintf(f, "--------------------------------------------------------\n");
	fprintf(f, "\n");
	fprintf(f, "Node Values:\n");
	fprintf(f, "\n");
	for(i=0; i<OutputLayer.NumberOfNodes; i++)		
		fprintf(f, "(%d) = %f\n", i, OutputLayer.NeuronValues[i]);
	fprintf(f, "\n");


	fclose(f);
}