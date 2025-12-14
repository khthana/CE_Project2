// Network.cpp: implementation of the CNetwork class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Network.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

bool CNetwork::m_TrainError = false;

CNetwork::CNetwork()
{
	m_NumberLayers = 0;
	m_NumberPatts = 0;
	memset(m_InputPatt,0,sizeof(m_InputPatt));
	memset(m_OutputPatt,0,sizeof(m_OutputPatt));
	memset(m_LayerSize,0,sizeof(m_LayerSize));
	memset(m_Layers,0,sizeof(m_Layers));
	CreateDefaultNetwork();
}

CNetwork::~CNetwork()
{
	for(DWORD i=0;i<m_NumberPatts;i++)
	{
		SAFE_DELETE_ARRAY(m_InputPatt[i]);
		SAFE_DELETE_ARRAY(m_OutputPatt[i]);
	}
	for(i=0;i<m_NumberLayers;i++)
		SAFE_DELETE(m_Layers[i]);
}

void CNetwork::SetLayers(DWORD Layers)
{
	m_NumberLayers = Layers;
}

void CNetwork::SetLayerNo(DWORD LayerNo,DWORD Node)
{
	m_LayerSize[LayerNo] = Node;
}

DWORD CNetwork::GetLayerNo(DWORD LayerNo)
{
	ASSERT(LayerNo<m_NumberLayers);
	return m_LayerSize[LayerNo];
}

void CNetwork::SetupNetwork()
{
	DWORD i;
	for(i=0;i<MAX_LAYERS;i++)
	{
		SAFE_DELETE(m_Layers[i]);
	}

	m_Layers[0] = new CInputLayer(0,m_LayerSize[0]);

	for(i=0;i<m_NumberLayers-2;i++) {
		m_Layers[i+1] = new CMiddleLayer(m_LayerSize[i],m_LayerSize[i+1]);
	}
	
	m_Layers[m_NumberLayers-1] = new COutputLayer(m_LayerSize[m_NumberLayers-2],m_LayerSize[m_NumberLayers-1]);

	//SAFE_DELETE_ARRAY(m_Layers[m_NumberLayers-1]->m_Inputs);
	for(i=1;i<m_NumberLayers;i++) 
	{
		m_Layers[i]->m_Inputs = m_Layers[i-1]->m_Outputs;
	}

	for(i=1;i<m_NumberLayers-1;i++) 
	{
		//SAFE_DELETE_ARRAY(((COutputLayer*)m_Layers[i])->m_OutputErrors);
		((COutputLayer*)m_Layers[i])->m_OutputErrors = ((COutputLayer*)m_Layers[i+1])->m_BackErrors;
	}
}

void CNetwork::RandomizeWeights()
{
	for(DWORD i=1;i<m_NumberLayers;i++)
		((COutputLayer*)m_Layers[i])->RandomWeights();
}

void CNetwork::UpdateWeights(const double LR, const double MC)
{
	for(DWORD i=m_NumberLayers-1;i>0;i--)
		((COutputLayer*)m_Layers[i])->UpdateWeights(LR,MC);
}

void CNetwork::UpdateMomentum()
{
	for(DWORD i=1;i<m_NumberLayers;i++)
		((COutputLayer*)m_Layers[i])->UpdateMomentum();
}

void CNetwork::ForwardProp()
{
	for(DWORD i=0;i<m_NumberLayers;i++)
		((COutputLayer*)m_Layers[i])->CalcOut();
}

void CNetwork::BackwardProp(double &err)
{
	((COutputLayer*)m_Layers[m_NumberLayers-1])->CalcError(err);
	
	for (DWORD i=m_NumberLayers-2;i>0;i--)
		((CMiddleLayer*)m_Layers[i])->CalcError();
}

void CNetwork::SetNF(double NF)
{
	((CInputLayer*)m_Layers[0])->SetNF(NF);
}

void CNetwork::SetupPattern(DWORD patt)
{
	DWORD i;
	DWORD ins = m_Layers[0]->m_NumberOutputs;
	DWORD outs = m_Layers[m_NumberLayers-1]->m_NumberOutputs;

	for(i=0;i<ins;i++)
		((CInputLayer*)m_Layers[0])->m_OrigOutputs[i] = m_InputPatt[patt][i];

	for(i=0;i<outs;i++)
		((COutputLayer*)m_Layers[m_NumberLayers-1])->
			m_ExpectedValues[i] = m_OutputPatt[patt][i];
}

void CNetwork::SetPattern(double* input,double* output)
{
	DWORD ins = m_LayerSize[0];
	DWORD outs = m_LayerSize[m_NumberLayers-1];
	m_InputPatt[m_NumberPatts] = new double[ins];
	m_OutputPatt[m_NumberPatts] = new double[outs];
	memcpy(m_InputPatt[m_NumberPatts],input,ins*sizeof(double));
	memcpy(m_OutputPatt[m_NumberPatts],output,outs*sizeof(double));
	m_NumberPatts++;
}

void CNetwork::SetInput(double * input)
{
	DWORD ins = m_LayerSize[0];
	for(DWORD i=0;i<ins;i++)
		((CInputLayer*)m_Layers[0])->m_OrigOutputs[i] = input[i];
}

void CNetwork::WriteWeights(FILE*file)
{
	for(DWORD i=1; i<m_NumberLayers; i++)
	{
		fprintf(file,"Layer %d : \n",i);
		((COutputLayer*)m_Layers[i])->WriteWeights(i,file);
	}
}

void CNetwork::ReadWeights(FILE* WeightsFile)
{
	DWORD i;for (i=1; i<m_NumberLayers; i++)
		((COutputLayer*)m_Layers[i])->ReadWeights(i,WeightsFile);
	
}

void CNetwork::ListWeights()
{
	for(DWORD i=1; i<m_NumberLayers; i++)
	{
		cout << "layer number : " <<i<< "\n";
		((COutputLayer*)m_Layers[i])->ListWeights();
	}
}

void CNetwork::WriteOutputs(FILE*)
{

}

void CNetwork::ListOutputs()
{
	for(DWORD i=1;i<m_NumberLayers;i++)
	{
		printf("layer number : %d\n",i);
		((COutputLayer*)m_Layers[i])->ListOutputs();
	}

}

void CNetwork::ListErrors()
{

}

DWORD CNetwork::GetInputLayerNode()
{
	return m_LayerSize[0];
}

DWORD CNetwork::GetOutputLayerNode()
{
	return m_LayerSize[m_NumberLayers-1];
}

BOOL CNetwork::LoadNetwork(LPCSTR FileName)
{
	DWORD Version;
	CFile file;
	if(file.Open(FileName,CFile::modeRead))
	{
		file.Read(&Version				,sizeof(Version));
		if(Version != NEURAL_VERSION) 
			return FALSE;
		file.Read(&m_NumberLayers,sizeof(m_NumberLayers));
		if(m_NumberLayers> 5)
			return FALSE;
		file.Read(&m_LayerSize,sizeof(m_LayerSize));
		SetupNetwork();
		for(DWORD i=1;i<m_NumberLayers;i++)
			((COutputLayer*)m_Layers[i])->LoadWeights(file);
		file.Close();
	}
	return TRUE;
}

BOOL CNetwork::SaveNetwork(LPCSTR FileName)
{
	DWORD Version = NEURAL_VERSION;
	CFile file;
	if(file.Open(FileName,CFile::modeWrite | CFile::modeCreate))
	{
		file.Write(&Version			,sizeof(Version));
		file.Write(&m_NumberLayers	,sizeof(m_NumberLayers));
		file.Write(&m_LayerSize		,sizeof(m_LayerSize));
		for(DWORD i=1;i<m_NumberLayers;i++)
			((COutputLayer*)m_Layers[i])->SaveWeights(file);
		file.Close();
#ifdef _DEBUG
		CNetwork* NetworkDebug = new CNetwork();
		NetworkDebug->LoadNetwork(FileName);
		ASSERT(m_NumberLayers == NetworkDebug->m_NumberLayers);
		for(int l=0;l<MAX_LAYERS;l++)
			ASSERT(m_LayerSize[l] == NetworkDebug->m_LayerSize[l]);
		delete NetworkDebug;
#endif 

		return TRUE;
	}
	return FALSE;
}

void CNetwork::TrainNetwork()
{
	DWORD TotalCycles = 0;
	double NewNF = m_NoiseFactor;
	double SumSquareError = m_ErrorTolerance+1;

	SetupNetwork();
	RandomizeWeights();
	SetNF(NewNF);
	while(TotalCycles<m_MaxCycles && SumSquareError>m_ErrorTolerance)
	{
		SumSquareError = 0;
		double Error;

		UpdateMomentum();
		for(DWORD i=0;i<m_NumberPatts;i++)
		{
			SetupPattern(i);
			ForwardProp();
			BackwardProp(Error);
			SumSquareError += Error*Error;
			UpdateWeights(m_LearningRate,m_MomentumConst);
		}

		static DWORD l = 0;
		if(l++%10==0) 
		{
			TRACE("Cycle : %5d SSE %.2f RATE %.2f\n",TotalCycles,SumSquareError,m_LearningRate);
			printf("Cycle : %5d SSE %.2f RATE %.2f\n",TotalCycles,SumSquareError,m_LearningRate);
		}
		
		TotalCycles++;
		if(TotalCycles>0.7*m_MaxCycles)
			NewNF = 0;
		else if(TotalCycles>0.5*m_MaxCycles)
			NewNF = 0.25*m_NoiseFactor;
		else if(TotalCycles>0.3*m_MaxCycles)
			NewNF = 0.50*m_NoiseFactor;
		else if(TotalCycles>0.1*m_MaxCycles)
			NewNF = 0.75*m_NoiseFactor;
		SetNF(NewNF);
	}
	TRACE("Cycle : %5d SSE %.2f RATE %.2f\n",TotalCycles,SumSquareError,m_LearningRate);
	printf("Cycle : %5d\n",TotalCycles);
}

void CNetwork::GetOutput(double *Output)
{
	DWORD outs = m_LayerSize[m_NumberLayers-1];
	memcpy(Output,m_Layers[m_NumberLayers-1]->m_Outputs,outs*sizeof(double));
}

DWORD CNetwork::GetNumberPatts()
{
	return m_NumberPatts;
}

void CNetwork::CreateDefaultNetwork()
{
	SetLayers(3);
	SetLayerNo(0,2*NUMBER_OF_PLAYERS*2+1);
	SetLayerNo(1,2*NUMBER_OF_PLAYERS*2+2);
	SetLayerNo(2,1);

	SetupNetwork();
	RandomizeWeights();
}

void CNetwork::ClearPattern()
{
	for(DWORD i=0;i<m_NumberPatts;i++)
	{
		SAFE_DELETE_ARRAY(m_InputPatt[i]);
		SAFE_DELETE_ARRAY(m_OutputPatt[i]);
	}
	m_NumberPatts = 0;
}
