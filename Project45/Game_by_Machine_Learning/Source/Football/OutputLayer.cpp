// OutputLayer.cpp: implementation of the COutputLayer class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "OutputLayer.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

COutputLayer::COutputLayer()
{
	//TRACE("COutputLayer::COutputLayer()\n");
}

COutputLayer::COutputLayer(DWORD i,DWORD o)
: CMiddleLayer(i,o)
{
	//TRACE("COutputLayer::COutputLayer(DWORD i,DWORD o)\n");
	m_OutputErrors		= new double[m_NumberOutputs];
}

COutputLayer::~COutputLayer()
{
	//TRACE("COutputLayer::~COutputLayer()\n");
	SAFE_DELETE_ARRAY(m_OutputErrors);
}

void COutputLayer::CalcError(double& SumSquareError)
{
	//TRACE("void COutputLayer::CalcError(double& SumSquareError)\n");
	DWORD i,j,k;
	double Acc=0;
	double TotalError=0;

	for(j=0;j<m_NumberOutputs;j++)
	{
		m_OutputErrors[j] = m_ExpectedValues[j]-m_Outputs[j];
		TotalError += m_OutputErrors[j]*m_OutputErrors[j];
		m_OutputErrors[j] *= m_Outputs[j]*(1-m_Outputs[j]);
	}

	SumSquareError = TotalError;
	
	for(i=0;i<m_NumberInputs;i++)
	{
		k=i*m_NumberOutputs;
		for(j=0;j<m_NumberOutputs;j++)
		{
			m_BackErrors[i] = m_Weights[k+j]*m_OutputErrors[j];
			Acc+=m_BackErrors[i];
		}
		m_BackErrors[i] = Acc;
		Acc = 0;
		m_BackErrors[i] *= m_Inputs[i]*(1-m_Inputs[i]);
	}
}

