// Project1Doc.h : interface of the CProject1Doc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_PROJECT1DOC_H__C17F6FAB_01F4_11D5_B914_FA9A480DD735__INCLUDED_)
#define AFX_PROJECT1DOC_H__C17F6FAB_01F4_11D5_B914_FA9A480DD735__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Dib.h"

#define BLACK 0
#define WHITE 255
#define PICSIZE 128*128
#define MAXPROTOTYPE 50000

#define PUSH_NULL 0
#define PUSH_IMAGE 1
#define PUSH_TRAIN 2
#define PUSH_CLASS 3
#define PUSH_CLEAR 4


class CProject1Doc : public CDocument
{
public:
	
	int push;
	double MinimumBasePt;
	

	BOOL en_image, en_load, en_save_m, en_save_l, en_save_as;
	BOOL en_train, en_class, en_show, en_clear;


	CDIBitmap* m_pDIB;
	
	//Image Processing

	double CentroidX,CentroidY;

	int BasePt[100];
	int NumBasePt;

	BYTE TempTbl[PICSIZE];
	BYTE SegmentTbl[PICSIZE];
	BYTE EdgeTbl[PICSIZE];
	
	struct EdgePt { 
		double X,Y,Rad,RadNrml,Deg;
	} ChainCode[PICSIZE],TChainCode[PICSIZE];
	
	int NumChainPt, NumTChainPt;
	int MaxRadPt, TMaxRadPt;

	struct structPiece {
		double Area,Bound,MaxRad,MinRad;
	} Piece[12];

	// Neural Network

	CString InputName;
	CString FileName;
	int NumPrototype;

	struct structInputLayer {		
		double Data[48];
	} InputLayer;			/* Input Layer		*/

	struct structNetwork {					
		CString Name;		/* Output Layer		*/
		double Rad;			/* Hidden Layer		*/
		double Data[48];	/*					*/
	} Network[MAXPROTOTYPE]; 

public:
	void Segmentation();
	void CalcCentroid();
	void EdgeDetection();
	void ChainCoding();
	
	void CalcChain();
	void CalcChainRadius();	
	void CalcChainMaxRadiusPt();
	void CalcChainDegree();
	void CalcChainRadiusNormalize();

	void GetTChainCode();
	void CalcTChainRotate(double deg); // 0-360 
		
	void CalcEachPiece(int base);
	void CalcEachPieceArea(int base);
	void CalcEachPieceBound(int base);
	void CalcEachPieceMaxRad(int base);
	void CalcEachPieceMinRad(int base);

	
		
	//void CalcEachPiece();
	//void CalcEachArea();
	


protected: // create from serialization only
	CProject1Doc();
	DECLARE_DYNCREATE(CProject1Doc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CProject1Doc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CProject1Doc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CProject1Doc)
	afx_msg void OnButtonTrain();
	afx_msg void OnButtonLoad();
	afx_msg void OnButtonSaveAs();
	afx_msg void OnUpdateButtonSaveAs(CCmdUI* pCmdUI);
	afx_msg void OnUpdateButtonTrain(CCmdUI* pCmdUI);
	afx_msg void OnUpdateButtonLoad(CCmdUI* pCmdUI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROJECT1DOC_H__C17F6FAB_01F4_11D5_B914_FA9A480DD735__INCLUDED_)
