// Layer.cpp: implementation of the CLayer class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Layer.h"

#include <math.h>

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CLayer::CLayer()
{
	//TRACE("CLayer::CLayer()\n");
	m_Inputs = 0;
	m_Outputs = 0;
	m_NumberInputs = NULL;
	m_NumberOutputs = NULL;
}

CLayer::~CLayer()
{
	//TRACE("CLayer::~CLayer()\n");
}


double Squash(double X)
{
/**/
	if(X>15)
		return 1;
	else if(X<-15)
		return 0;
	return 1.0/(1.0+exp(-X));
/**/

/*
	const double ConstA = 1.716;
	const double ConstB = 0.667;
	return 2*ConstA/(1+exp(-1*ConstB*X))-ConstA;
	//return 1/(1+exp(-1*ConstB*X));
/**/

//	return ((exp(X)-exp(-X))/(exp(X)+exp(-X))+1)/2;
}

double RandomWeight(DWORD Fi)
{
	//return (2.4*2*(rand()%100)/100.0 -2.4)/Fi;
	return (2*(rand()%100)/100.0-1);
}