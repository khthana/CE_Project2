// OutputLayer.h: interface for the COutputLayer class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_OUTPUTLAYER_H__8E7B0C34_E9E4_4E41_8FF5_8C495F9FDCE2__INCLUDED_)
#define AFX_OUTPUTLAYER_H__8E7B0C34_E9E4_4E41_8FF5_8C495F9FDCE2__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "MiddleLayer.h"

class COutputLayer : public CMiddleLayer
{
public:
	COutputLayer();
	COutputLayer(DWORD i,DWORD o);
	virtual ~COutputLayer();
	virtual void CalcError(double& SumSquareError);

};

#endif // !defined(AFX_OUTPUTLAYER_H__8E7B0C34_E9E4_4E41_8FF5_8C495F9FDCE2__INCLUDED_)
