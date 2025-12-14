// InputLayer.h: interface for the CInputLayer class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_INPUTLAYER_H__10F39EA9_C719_4726_BAE2_F15790628CE4__INCLUDED_)
#define AFX_INPUTLAYER_H__10F39EA9_C719_4726_BAE2_F15790628CE4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Layer.h"

class CInputLayer : public CLayer  
{
public:
	CInputLayer(int i, int o);
	CInputLayer();
	virtual ~CInputLayer();
	virtual void CalcOut();
	void SetNF(double NF);

	friend CNetwork;
private:
	double m_NoiseFactor;
	double* m_OrigOutputs;
};

#endif // !defined(AFX_INPUTLAYER_H__10F39EA9_C719_4726_BAE2_F15790628CE4__INCLUDED_)
