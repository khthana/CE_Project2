// Network.h: interface for the CNetwork class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_NETWORK_H__A791644B_82AC_42BB_AC46_9F91CAA457C6__INCLUDED_)
#define AFX_NETWORK_H__A791644B_82AC_42BB_AC46_9F91CAA457C6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define MAX_LAYERS	5
#define MAX_VECTORS	1000

#include "Layer.h"

class CNetwork  
{
public:
	CNetwork();
	virtual ~CNetwork();
private:
	CLayer*	m_Layers[MAX_LAYERS];
	DWORD m_NumberLayers;
	DWORD m_LayerSize[MAX_LAYERS];

    double* m_InputPatt[MAX_VECTORS];
    double* m_OutputPatt[MAX_VECTORS];
	DWORD m_NumberPatts;

	double m_MomentumConst;
	double m_LearningRate;
	double m_NoiseFactor;
	double m_ErrorTolerance;
public:
	void ClearPattern();
	void CreateDefaultNetwork();
	static bool m_TrainError;
	DWORD GetNumberPatts();
	void GetOutput(double* Output);
	void TrainNetwork();
	DWORD m_MaxCycles;
	double m_SumSquareError;
	BOOL SaveNetwork(LPCSTR FileName);
	BOOL LoadNetwork(LPCSTR FileName);
	DWORD GetOutputLayerNode();
	DWORD GetInputLayerNode();
	void SetLayers(DWORD Layers);
	DWORD GetLayerNo(DWORD LayerNo);
	void SetLayerNo(DWORD LayerNo,DWORD Node);
	void SetupNetwork();
	void RandomizeWeights();
	void UpdateWeights(const double, const double);
	void UpdateMomentum();
	
	void ForwardProp();
	void BackwardProp(double &err);
	void SetupPattern(DWORD patt);
	void SetNF(double NF);	
	void SetPattern(double* input,double* output);
	void SetInput(double * input);

	void WriteWeights(FILE*);
	void ReadWeights(FILE*);
	void ListWeights();
	void WriteOutputs(FILE*);
	void ListOutputs();
	void ListErrors();
};

#endif // !defined(AFX_NETWORK_H__A791644B_82AC_42BB_AC46_9F91CAA457C6__INCLUDED_)
