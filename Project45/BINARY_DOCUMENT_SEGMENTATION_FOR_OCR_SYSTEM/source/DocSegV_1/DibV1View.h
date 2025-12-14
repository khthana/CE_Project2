// DibV1View.h : interface of the CDibV1View class
//
/////////////////////////////////////////////////////////////////////////////
#include "Block.h"
#include "Paragraph.h"

#if !defined(AFX_DIBV1VIEW_H__B2E8D7BA_F2CE_4181_9E2B_24057969AD6F__INCLUDED_)
#define AFX_DIBV1VIEW_H__B2E8D7BA_F2CE_4181_9E2B_24057969AD6F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CDibV1View : public CScrollView
{
protected: // create from serialization only
	CDibV1View();
	DECLARE_DYNCREATE(CDibV1View)

// Attributes
public:
	CDibV1Doc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDibV1View)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual void OnInitialUpdate(); // called first time after construct
	//}}AFX_VIRTUAL

// Implementation
public:
	void MakeHistogram(int ParagraphIndex);
	int FindCharRight(int ParagraphIndex);
	void FindCharTop();
	void FindCharBottom();
	void MakeCharacterflow(int ParagraphIndex);
	BOOLEAN FindCharacterSeed(int ParagraphIndex);
	void BlocktoBitSetParagraph(int BlockPoint,int Paragraph);
	BOOLEAN DoBlockMark;
	int CountPointinBlock(long BlockPoint);
	int directionbegin;
	int Threshold;
	long PicHeight;
	long PicWidth;
	BYTE* BitPixel;
	BYTE* BitPixelParagraph;
	Block* Block1;
	BYTE* AddonPixel;
	long PointerBlock;
	long PointerBlockFindSeed;
	int ParagraphCount;
	CParagraph* Paragraph;  //Max Paragraph is 50
	LinkList* PttoList;
	LinkList* PttoListOrder;
	long PointerPixelFindSeedx;
	long PointerPixelFindSeedy;
	LinkListChar* PttoListChar;
	long PointerPixelx;
	long PointerPixely;
	int directionpixelbegin;
	LinkListChar* PttoListCharOld;
	long BlockWidth;
	long BlockHeight;
	LinkListSubParagraph* PttoListSubP;
	int ViewSolution;
	LinkListChar* PttoChar1;
	LinkListChar* PttoChar2;
	LinkListChar* PttoChartmp;
	LinkListChar* BaseChar;
	LinkListChar* PttoPictureList;
	int language;
	LinkListChar PttoListCharfordelete;
	
	void Preparebitformat();
	void GenBlock();
	BOOLEAN FindParagraphSeed();
	void WriteBlock(long BlockIndex);
	void BittobmPixel(int Option);
	BOOLEAN FindNextBlock(int directionb);
	void ParagraphBlockMark(int ParagraphIndex);
	void WriteBlockChar();
	int FindNextPixel(int directionb,int ParagraphIndex);
	void MarkPixelChecked(int mode,int ParagraphIndex);

	BOOLEAN BitPixelNew;
	BOOLEAN BitPixelParagraphNew;
	BOOLEAN Block1New;
	BOOLEAN AddonPixelNew;
	BOOLEAN ParagraphNew;

	virtual ~CDibV1View();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CDibV1View)
	afx_msg void OnFindseedp();
	afx_msg void OnNextblock();
	afx_msg void OnNextblockend();
	afx_msg void OnCompleteall();
	afx_msg void OnShowviewParagraph1();
	afx_msg void OnShowviewParagraph2();
	afx_msg void OnCharacternext();
	afx_msg void OnZoom1();
	afx_msg void OnZoom2();
	afx_msg void OnZoom3();
	afx_msg void OnZoomMedium();
	afx_msg void OnLanguageEnglish();
	afx_msg void OnLanguageThai();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in DibV1View.cpp
inline CDibV1Doc* CDibV1View::GetDocument()
   { return (CDibV1Doc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DIBV1VIEW_H__B2E8D7BA_F2CE_4181_9E2B_24057969AD6F__INCLUDED_)
