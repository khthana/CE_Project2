// InputLayer.cpp: implementation of the CInputLayer class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "InputLayer.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CInputLayer::CInputLayer()
{
	//TRACE("CInputLayer::CInputLayer()\n");
}

CInputLayer::CInputLayer(int i, int o)
{
	//TRACE("CInputLayer::CInputLayer(int,int)\n");
	m_NumberInputs = i;
	m_NumberOutputs = o;
	m_Outputs		= new double[m_NumberOutputs];
	m_OrigOutputs	= new double[m_NumberOutputs];
	m_NoiseFactor	= 0;
}

CInputLayer::~CInputLayer()
{
	//TRACE("CInputLayer::~CInputLayer()\n");
	SAFE_DELETE_ARRAY(m_Outputs);
	SAFE_DELETE_ARRAY(m_OrigOutputs);
}

void CInputLayer::CalcOut()
{
	//TRACE("CInputLayer::CalcOut()\n");
	for(int i=0;i<m_NumberOutputs;i++)
		m_Outputs[i] = m_OrigOutputs[i]*(1+m_NoiseFactor*RandomWeight(1));
}

void CInputLayer::SetNF(double NF)
{
	//TRACE("CInputLayer::SetNF(double NF)\n");
	m_NoiseFactor = NF;
}

