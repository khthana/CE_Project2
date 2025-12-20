#ifndef _MYNEURALNETWORKHEADER
#define _MYNEURALNETWORKHEADER

class NeuralNetworkLayer
{
public:
	int			NumberOfNodes;
	int			NumberOfChildNodes;
	int			NumberOfParentNodes;
	double**	Weights;
	double**	WeightChanges;
	double*		NeuronValues;
	double*		DesiredValues;
	double*		Errors;
	double*		BiasWeights;
	double*		BiasValues;
	double		LearningRate;
	char*		file_name; 
	bool		LinearOutput;
	bool		UseMomentum;
	double		MomentumFactor;
	int			option;
	NeuralNetworkLayer*		ParentLayer;
	NeuralNetworkLayer*		ChildLayer;

	NeuralNetworkLayer();

	void	Initialize(int	NumNodes, NeuralNetworkLayer* parent, NeuralNetworkLayer* child);
	void	CleanUp(void);
	void    doubleToStr(char* str,double flpNumber,int numFractDigits);
	void	RandomizeWeights(void);
	void	CalculateErrors(void);
	int		AdjustWeights(void);	
	void    saveweight(void);
	bool	loadweight(void);
	void	setFilename(char* str);// file_name file_name file_name file_name file_name
	void	CalculateNeuronValues(void);
	void	setoption(int opt);

};

// Implements a 3-Layer neural network with one input layer, one hidden layer, and one output layer
class NeuralNetwork 
{
public:
	NeuralNetworkLayer	InputLayer;
	NeuralNetworkLayer	HiddenLayer;
	NeuralNetworkLayer	OutputLayer;
	int     finishtraining;
	void	Initialize(int nNodesInput, int nNodesHidden, int nNodesOutput,int sc);
	void	CleanUp();
	void	SetInput(int i, double value);
	double	GetOutput(int i);
	void	SetDesiredOutput(int i, double value);
	void	FeedForward(void);
	void	BackPropagate(void);
	int		GetMaxOutputID(void);
	double	CalculateError(void);
	void	SetLearningRate(double rate);
	double  getLearningRate(void);
	void	SetLinearOutput(bool useLinear);
	void	SetMomentum(bool useMomentum, double factor);
	void	DumpData(char* filename);
	void    saveWeight(int aa);
	bool	loadWeight(int which);
	int		checkforfinish(void);
	void	setsch(int s);

};

#endif