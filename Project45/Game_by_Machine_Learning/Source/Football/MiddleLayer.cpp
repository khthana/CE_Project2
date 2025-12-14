// MiddleLayer.cpp: implementation of the CMiddleLayer class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "MiddleLayer.h"
#include <float.h>

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CMiddleLayer::CMiddleLayer()
{
	//TRACE("CMiddleLayer::CMiddleLayer()\n");
}

CMiddleLayer::CMiddleLayer(DWORD i,DWORD o)
{
	//TRACE("CMiddleLayer::CMiddleLayer(DWORD i,DWORD o)\n");
	m_NumberInputs = i;
	m_NumberOutputs = o;
	m_Weights			= new double[m_NumberInputs*m_NumberOutputs];
	m_OutputErrors		= NULL;
	m_Threshole			= new double[m_NumberOutputs];
	m_Outputs			= new double[m_NumberOutputs];
	m_BackErrors		= new double[m_NumberInputs];
	m_ExpectedValues	= new double[m_NumberOutputs];
	m_CurrDeltas		= new double[m_NumberInputs*m_NumberOutputs];
	m_PastDeltas		= new double[m_NumberInputs*m_NumberOutputs];
	memset(m_CurrDeltas,0,sizeof(double)*m_NumberInputs*m_NumberOutputs);
	memset(m_PastDeltas,0,sizeof(double)*m_NumberInputs*m_NumberOutputs);
}

CMiddleLayer::~CMiddleLayer()
{
	//TRACE("CMiddleLayer::~CMiddleLayer()\n");
	SAFE_DELETE_ARRAY(m_Weights);
	SAFE_DELETE_ARRAY(m_BackErrors);
	SAFE_DELETE_ARRAY(m_Threshole);
	SAFE_DELETE_ARRAY(m_Outputs);
	SAFE_DELETE_ARRAY(m_ExpectedValues);
	SAFE_DELETE_ARRAY(m_CurrDeltas);
	SAFE_DELETE_ARRAY(m_PastDeltas);
}

void CMiddleLayer::CalcError()
{
	//TRACE("CMiddleLayer::CalcError()\n");
	DWORD i,j,k;
	double Acc=0;
	for(i=0;i<m_NumberInputs;i++)
	{
		k=i*m_NumberOutputs;
		for(j=0;j<m_NumberOutputs;j++)
		{
			m_BackErrors[i] = m_Weights[k+j]*m_OutputErrors[j];
			Acc+=m_BackErrors[i]*m_BackErrors[i];
		}
		m_BackErrors[i] = Acc;
		Acc = 0;
		m_BackErrors[i] *= m_Inputs[i]*(1-m_Inputs[i]);
	}
}

void CMiddleLayer::CalcOut()
{
	//TRACE("void CMiddleLayer::CalcOut()\n");
	DWORD i,j,k;
	double Acc=0;
	for(j=0;j<m_NumberOutputs;j++)
	{
		for(i=0;i<m_NumberInputs;i++)
		{
			k=i*m_NumberOutputs;
			if(m_Weights[k+j]*m_Weights[k+j]>DBL_MAX)
			{
				CNetwork::m_TrainError = true;
				return ;
			}
			m_Outputs[j] = m_Weights[k+j]*m_Inputs[i];
			Acc += m_Outputs[j];
		}
		m_Outputs[j] = Squash(Acc-m_Threshole[j]);
		Acc = 0;
	}
}

void CMiddleLayer::RandomWeights()
{
	//TRACE("void CMiddleLayer::RandomWeights()\n");
	DWORD i,j,k;
	double Discard = RandomWeight(m_NumberInputs);
	for(i=0;i<m_NumberInputs;i++)
	{
		k=i*m_NumberOutputs;
		for(j=0;j<m_NumberOutputs;j++)
		{
			m_Weights[k+j] = RandomWeight(m_NumberInputs);
		}
	}	
	for(j=0;j<m_NumberOutputs;j++)
	{
		m_Threshole[j] = RandomWeight(m_NumberInputs);
	}
}

void CMiddleLayer::UpdateWeights(const double LR, const double MC)
{
	//TRACE("void CMiddleLayer::UpdateWeights(const double Beta, const double Alpha)\n");
	DWORD i,j,k;
	double Delta;
	for(i=0;i<m_NumberInputs;i++)
	{
		k=i*m_NumberOutputs;
		for(j=0;j<m_NumberOutputs;j++)
		{
			Delta = LR*m_OutputErrors[j]*m_Inputs[i] +
				MC*m_PastDeltas[k+j];
			m_Weights[k+j] += Delta;
			m_CurrDeltas[k+j] = Delta;
		}
	}	
	for(j=0;j<m_NumberOutputs;j++)
	{
		m_Threshole[j] += -1*LR*m_OutputErrors[j];
	}
}

void CMiddleLayer::UpdateMomentum()
{
	//TRACE("void CMiddleLayer::UpdateMomentum()\n");
	double* Temp;

	Temp = m_PastDeltas;
	m_PastDeltas = m_CurrDeltas;
	m_CurrDeltas = Temp;
	memset(m_CurrDeltas,0,sizeof(double)*m_NumberInputs*m_NumberOutputs);
}

void CMiddleLayer::ListWeights()
{
	//TRACE("void CMiddleLayer::ListWeights()\n");
	DWORD i,j,k;
	for(i=0; i< m_NumberInputs; i++)
	{
		k=i*m_NumberOutputs;
		for (j=0; j< m_NumberOutputs; j++)
			printf(" weight[%d,%d] is: %.4f",i,j,m_Weights[k+j]);
	}
	printf("\n");
	for (j=0; j< m_NumberOutputs; j++)
		printf(" threshold[%d] is: %.4f",j,m_Threshole[j]);
	printf("\n");
}

void CMiddleLayer::WriteWeights(DWORD LayerNo, FILE *WeightFile)
{
	DWORD i,j,k;
	for (i=0; i< m_NumberInputs; i++)
	{
		fprintf(WeightFile,"%i ",LayerNo);
		k=i*m_NumberOutputs;
		for (j=0; j< m_NumberOutputs; j++)
		{
			fprintf(WeightFile,"%f ",m_Weights[k+j]);
		}                     
		fprintf(WeightFile,"\n");
    }
}

void CMiddleLayer::ReadWeights(DWORD LayerNo, FILE *WeightFile)
{
	DWORD i,j,k;
	double fp;
	for (i=0; i< m_NumberInputs; i++)
	{
		k=i*m_NumberOutputs;
		for (j=0; j< m_NumberOutputs; j++)
		{
			fscanf(WeightFile,"%f ",&fp);
			m_Weights[k+j] = fp;
		}                     
	}
	for (j=0; j< m_NumberOutputs; j++)
	{
		fscanf(WeightFile,"%f ",&fp);
		m_Threshole[j] = fp;
	}                     
}

void CMiddleLayer::ListErrors()
{
}

void CMiddleLayer::ListOutputs()
{
	for(DWORD j=0; j< m_NumberOutputs; j++)
	{
		printf("outputs[%d] is: %.4f\n",j,m_Outputs[j]);
	}
}

void CMiddleLayer::LoadWeights(CFile &file)
{
	//TRACE("void CMiddleLayer::LoadWeights(CFile &file)\n");
	DWORD i,j,k;
	for(i=0;i<m_NumberInputs;i++)
	{
		k=i*m_NumberOutputs;
		for(j=0;j<m_NumberOutputs;j++)
			file.Read(&m_Weights[k+j],sizeof(m_Weights[0]));
	}
}

void CMiddleLayer::SaveWeights(CFile &file)
{
	//TRACE("void CMiddleLayer::SaveWeights(CFile &file)\n");
	DWORD i,j,k;
	for(i=0;i<m_NumberInputs;i++)
	{
		k=i*m_NumberOutputs;
		for(j=0;j<m_NumberOutputs;j++)
			file.Write(&m_Weights[k+j],sizeof(m_Weights[0]));
	}
}
