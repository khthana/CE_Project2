// Layer.h: interface for the CLayer class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LAYER_H__92FA22F3_E7E0_400A_9E12_E578E59BD526__INCLUDED_)
#define AFX_LAYER_H__92FA22F3_E7E0_400A_9E12_E578E59BD526__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <iostream>

class CNetwork;

using namespace std;

class CLayer  
{
public:
	CLayer();
	virtual ~CLayer();
protected:
	DWORD m_NumberInputs;
	DWORD m_NumberOutputs;
	double* m_Outputs;
	double* m_Inputs;

	friend CNetwork;	
public:
	virtual void CalcOut() = 0;
};

extern double Squash(double X);
extern double RandomWeight(DWORD Fi);

#endif // !defined(AFX_LAYER_H__92FA22F3_E7E0_400A_9E12_E578E59BD526__INCLUDED_)
