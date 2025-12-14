// MiddleLayer.h: interface for the CMiddleLayer class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_MIDDLELAYER_H__F0961574_1604_4D67_AD62_5FE3F1EC1C8A__INCLUDED_)
#define AFX_MIDDLELAYER_H__F0961574_1604_4D67_AD62_5FE3F1EC1C8A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Layer.h"

class CMiddleLayer : public CLayer  
{
public:
	CMiddleLayer();
	CMiddleLayer(DWORD i,DWORD o);
	virtual  ~CMiddleLayer();
	virtual void CalcError();
	virtual void CalcOut();

	void RandomWeights();
	void UpdateWeights(const double Beta,const double Alpha);
	void UpdateMomentum();

	void LoadWeights(CFile&file);
	void SaveWeights(CFile&file);

	void ListWeights();
	void WriteWeights(DWORD, FILE *);
	void ReadWeights(DWORD, FILE *);
	void ListErrors();
	void ListOutputs();

protected:
	double* m_Weights;
	double* m_Threshole;
	double* m_OutputErrors;
	double* m_BackErrors;
	double* m_ExpectedValues;
	double* m_CurrDeltas;
	double* m_PastDeltas;

	friend CNetwork;
};

#endif // !defined(AFX_MIDDLELAYER_H__F0961574_1604_4D67_AD62_5FE3F1EC1C8A__INCLUDED_)
