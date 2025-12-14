// DibV1View.h : interface of the CDibV1View class
//
/////////////////////////////////////////////////////////////////////////////
#include "Block.h"
#include "Paragraph.h"
#include "NormalBound.h"

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
	BOOLEAN DoBlockMark;	
	int directionbegin;
	int Threshold;
	long PicHeight;			// Picture Height 
	long PicWidth;			// Picture Width but depend on block width size
	BYTE* BitPixel;			// Picture in Bit information in each pixel
	BYTE* BitPixelParagraph;  // tell each pixel is in which Paragraph ?
	Block* Block1;			// format of Block in Picture
	BYTE* AddonPixel;		// Show about view that to merge with input image
	long PointerBlock;		// Pointer to Block walking
	long PointerBlockFindSeed;	// Pointer to Block Seed
	int ParagraphCount;			// Counter tell have How many Paragraph in Page first
	CParagraph* Paragraph;  // Max Paragraph is 50
	LinkList* PttoList;		// Pointer to LinkList
	LinkList* PttoListOrder;	// Pointer to LinkListOrder
	long PointerPixelFindSeedx;	// Pointer to seed x dimention for pixel walk around
	long PointerPixelFindSeedy;	// Pointer to seed y dimention for pixel walk around
	LinkListChar* PttoListChar;	// Pointer to List Character
	long PointerPixelx;			// Pointer to Pixel x dimention for Pixel walk around
	long PointerPixely;			// Pointer to Pixel y dimention for Pixel walk around
	int directionpixelbegin;	// direction that pixel begin is 0
	LinkListChar* PttoListCharOld; // Pointer to List Character point to before PttoListChar
	long BlockWidth;			// Block Width
	long BlockHeight;			// Block Height
	LinkListSubParagraph* PttoListSubP; //Pointer to Sub Paragraph Link List
	int ViewSolution;			// Set View Zoom level 
	LinkListChar* PttoPictureList; // Pointer to Picture List
	int language;				// Set language
	LinkListChar PttoListCharfordelete;	// Pointer type LinkListChar for delete methode
	CharLine* CharLinePt;		// Character Line Pointer
	LinkListChar* PttoCharinLine;	// Pointer to Character in Line
	LinkListCharLine* PttoCharLineList;	// Pointer to Character Line
	
	void Preparebitformat();    // Prepare bit format
	void GenBlock();			// Generate Block
	BOOLEAN FindParagraphSeed();	// Find Paragraph Seed
	void WriteBlock(long BlockIndex);	// Write Block in AddonPixel
	void BittobmPixel(int Option);		// Backward to normal format of Pixel information in bitmap
	BOOLEAN FindNextBlock(int directionb);	// Find next Block walk around Paragraph
	void ParagraphBlockMark(int ParagraphIndex);	// Mark Paragraph for not walk around
	void WriteBlockChar();		// Write Block  quadrilateral around character
	int FindNextPixel(int directionb,int ParagraphIndex);	// Find next Pixel
	void MarkPixelChecked(int mode,int ParagraphIndex);		// Mark Pixel have checked
	void MarkDivideParagraphmark(int ParagraphIndex);		// Mark Paragraph 
	CNormalBound LineWalkAround(int ParagraphIndex,long row); // Walk around Char in Line and return fit Line back
	void MakeHistogramAndLine(int ParagraphIndex);			// Make Histogram and Line
	BOOLEAN FindCharacterSeed(int ParagraphIndex);			// Find Character Seed
	void BlocktoBitSetParagraph(int BlockPoint,int Paragraph);	// Form Block to Bit Set all pixel in Block on Paragram
	int CountPointinBlock(long BlockPoint);		// Count Point in block but now return not true but faster

	BOOLEAN BitPixelNew;	// BitPixel allocate status
	BOOLEAN BitPixelParagraphNew;	// BitPixelPargraph allocate status
	BOOLEAN Block1New;		// Block1 allocate status
	BOOLEAN AddonPixelNew;	// AddonPixel allocate status
	BOOLEAN ParagraphNew;	// Paragraph allocate status

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
