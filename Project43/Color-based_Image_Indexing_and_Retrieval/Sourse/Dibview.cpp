// dibview.cpp : implementation of the CDibView class
//
// This is a part of the Microsoft Foundation Classes C++ library.
// Copyright (C) 1992-1998 Microsoft Corporation
// All rights reserved.
//
// This source code is only intended as a supplement to the
// Microsoft Foundation Classes Reference and related
// electronic documentation provided with the library.
// See these sources for detailed information regarding the
// Microsoft Foundation Classes product.

#include "stdafx.h"
#include <math.h>
#include "diblook.h"

#include "dibdoc.h"
#include "dibview.h"
#include "dibapi.h"
#include "diboper.h"
#include "ResultDlg.h"
#include "Threshold.h"
#include "DataDialog.h"
#include "SelectDB.h"
#include "mainfrm.h"

#include <stdio.h>
#include <stdlib.h>
#include <io.h>
#include <math.h>

#define max(a, b)  (((a) > (b)) ? (a) : (b))  
#define min(a, b)  (((a) < (b)) ? (a) : (b))

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

struct Result
{
	CString filename;
	float H;
	double ModelSize;
	CString DATA;
	float avg;
	Result *next_up;
	Result *next_down;
};

/////////////////////////////////////////////////////////////////////////////
// CDibView

IMPLEMENT_DYNCREATE(CDibView, CScrollView)

BEGIN_MESSAGE_MAP(CDibView, CScrollView)
	//{{AFX_MSG_MAP(CDibView)
	ON_COMMAND(ID_EDIT_COPY, OnEditCopy)
	ON_UPDATE_COMMAND_UI(ID_EDIT_COPY, OnUpdateEditCopy)
	ON_COMMAND(ID_EDIT_PASTE, OnEditPaste)
	ON_UPDATE_COMMAND_UI(ID_EDIT_PASTE, OnUpdateEditPaste)
	ON_MESSAGE(WM_DOREALIZE, OnDoRealize)
	ON_WM_LBUTTONDOWN()
	ON_WM_MOUSEMOVE()
	ON_COMMAND(ID_TOOL_MATCHING, OnToolMatching)
	ON_COMMAND(ID_TOOL_DATABASE, OnToolDatabase)
	ON_COMMAND(ID_OPTION_SETBOXCOLOR, OnOptionSetboxcolor)
	ON_COMMAND(ID_OPTION_ROTATEFRAMEBOX, OnOptionRotatebox)
	ON_COMMAND(ID_ELEMENT_CIRCLE, OnElementCircle)
	ON_UPDATE_COMMAND_UI(ID_ELEMENT_CIRCLE, OnUpdateElementCircle)
	ON_COMMAND(ID_ELEMENT_RECTANGLE, OnElementRectangle)
	ON_UPDATE_COMMAND_UI(ID_ELEMENT_RECTANGLE, OnUpdateElementRectangle)
	ON_WM_LBUTTONUP()
	ON_COMMAND(ID_MATCHING_COLORONLY, OnMatchingColoronly)
	ON_COMMAND(ID_MATCHING_SEGMENT, OnMatchingSegment)
	ON_COMMAND(ID_MATCHING_SEGMENTANDROTATION, OnMatchingSegmentandrotation)
	ON_COMMAND(ID_ELEMENT_SELECTALL, OnElementSelectall)
	ON_COMMAND(ID_SELECTDB_SELECTUSEDB, OnSelectdbSelectusedb)
	//}}AFX_MSG_MAP

	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CScrollView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CScrollView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDibView construction/destruction

CDibView::CDibView()
{
	m_database = FALSE;
	boxColor = 0,0,0;
	// default value of threshold
	detail = "no data";
	origin = "65";
	nameDB = "Other";
	
}

CDibView::~CDibView()
{
}

/////////////////////////////////////////////////////////////////////////////
// CDibView drawing

void CDibView::OnDraw(CDC* pDC)
{
	CDibDoc* pDoc = GetDocument();


	HDIB hDIB = pDoc->GetHDIB();
	if (hDIB != NULL)
	{
		LPSTR lpDIB = (LPSTR) ::GlobalLock((HGLOBAL) hDIB);
		int cxDIB = (int) ::DIBWidth(lpDIB);         // Size of DIB - x
		int cyDIB = (int) ::DIBHeight(lpDIB);        // Size of DIB - y
		::GlobalUnlock((HGLOBAL) hDIB);
		CRect rcDIB;
		rcDIB.top = rcDIB.left = 0;
		rcDIB.right = cxDIB;
		rcDIB.bottom = cyDIB;
		CRect rcDest;

		if (pDC->IsPrinting())   // printer DC
		{
			// get size of printer page (in pixels)
			int cxPage = pDC->GetDeviceCaps(HORZRES);
			int cyPage = pDC->GetDeviceCaps(VERTRES);
			// get printer pixels per inch
			int cxInch = pDC->GetDeviceCaps(LOGPIXELSX);
			int cyInch = pDC->GetDeviceCaps(LOGPIXELSY);

			//
			// Best Fit case -- create a rectangle which preserves
			// the DIB's aspect ratio, and fills the page horizontally.
			//
			// The formula in the "->bottom" field below calculates the Y
			// position of the printed bitmap, based on the size of the
			// bitmap, the width of the page, and the relative size of
			// a printed pixel (cyInch / cxInch).
			//
			rcDest.top = rcDest.left = 0;
			rcDest.bottom = (int)(((double)cyDIB * cxPage * cyInch)
					/ ((double)cxDIB * cxInch));
			rcDest.right = cxPage;

		}
		else   // not printer DC
		{
			rcDest = rcDIB;
		}

		::PaintDIB(pDC->m_hDC, &rcDest, hDIB,
			&rcDIB, pDoc->GetDocPalette());
	
		// for show first point of box boundary

			TEXTMETRIC textMetric;
			// Get the current font's height.
			pDC->GetTextMetrics(&textMetric);
			int fontHeight = textMetric.tmHeight;
			// Get the height of the picture.
			int textPos = cyDIB + 10;    
			char str[81];
		
			// Show start point that send to calculate histogram
			wsprintf(str,"starting point = %d,%d",pDoc->start_point.x,pDoc->start_point.y);
			pDC->TextOut(70, textPos, str);
			textPos += fontHeight + 10;

/*
		if (!target1.IsEmpty())
		
		{    
			int tmp = (int)Model_Size1;
			wsprintf(str,"Total size of Model : %d",tmp);
			pDC->TextOut(70, textPos, str);
			textPos += fontHeight;

			tmp = (int)Target_Size1;
			wsprintf(str,"Total size of Target : %d",tmp);
			pDC->TextOut(70, textPos, str);
			textPos += fontHeight;
			SetScrollSizes(MM_TEXT, CSize(cxDIB,textPos));
		}
*/	
		// Draw box boundary
		UINT x1 = pDoc->start_point.x;
		UINT y1 = pDoc->start_point.y;
		UINT x2 = pDoc->end_point.x;
		UINT y2 = pDoc->end_point.y;
	

		boxWidth  = x2 - x1;
		boxHeight = y2 - y1;
		
		////////////////////////////////////////////////////////
		// dieo Modify 
		// add member variable in file dibdoc.h is
		// CRect m_EnclosingRect,
		// int m_SelectElement , 
		// long Raduis
		/////////////////////////////////////////////////////////
		CBrush brush(boxColor);

		if (pDoc->m_SelectElement==1)
		{
			pDC->FrameRect(CRect(x1,y1,x2,y2),&brush);
		}
		else 
		if(pDoc->m_SelectElement==2) 
		{
			pDoc->Radius = static_cast<long>(
						sqrt(static_cast<double>((x2-x1)*(x2-x1)
							+(y2-y1)*(y2-y1))));
			long TmpRadius = pDoc->Radius;
			pDoc->m_EnclosingRect = CRect(x1-TmpRadius,y1-TmpRadius,
									      x1+TmpRadius,y1+TmpRadius);	

			CPen aPen;
			if(!aPen.CreatePen(PS_SOLID,1,boxColor))
			{
				//Pen creation fail
				AfxMessageBox("Pen creation failed drawing a circle",MB_OK);
				AfxAbort();
			}

			CPen* pOldPen = pDC->SelectObject(&aPen); //Select the pen
			CBrush* pOldBrush = static_cast<CBrush*>
								(pDC->SelectStockObject(NULL_BRUSH));


			pDC->Ellipse(pDoc->m_EnclosingRect);

			pDC->SelectObject(pOldPen);	//Restore the old pen				 
			pDC->SelectObject(pOldBrush); //Restore the old brush
		} 
		else pDoc->m_SelectElement = 1;
		// end dieo modify	
	}
}

/////////////////////////////////////////////////////////////////////////////
// CDibView printing

BOOL CDibView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

/////////////////////////////////////////////////////////////////////////////
// CDibView commands


LRESULT CDibView::OnDoRealize(WPARAM wParam, LPARAM)
{
	ASSERT(wParam != NULL);
	CDibDoc* pDoc = GetDocument();
	if (pDoc->GetHDIB() == NULL)
		return 0L;  // must be a new document

	CPalette* pPal = pDoc->GetDocPalette();
	if (pPal != NULL)
	{
		CMainFrame* pAppFrame = (CMainFrame*) AfxGetApp()->m_pMainWnd;
		ASSERT_KINDOF(CMainFrame, pAppFrame);

		CClientDC appDC(pAppFrame);
		// All views but one should be a background palette.
		// wParam contains a handle to the active view, so the SelectPalette
		// bForceBackground flag is FALSE only if wParam == m_hWnd (this view)
		CPalette* oldPalette = appDC.SelectPalette(pPal, ((HWND)wParam) != m_hWnd);

		if (oldPalette != NULL)
		{
			UINT nColorsChanged = appDC.RealizePalette();
			if (nColorsChanged > 0)
				pDoc->UpdateAllViews(NULL);
			appDC.SelectPalette(oldPalette, TRUE);
		}
		else
		{
			TRACE0("\tSelectPalette failed in CDibView::OnPaletteChanged\n");
		}
	}

	return 0L;
}

void CDibView::OnInitialUpdate()
{
	CScrollView::OnInitialUpdate();
	ASSERT(GetDocument() != NULL);
	SetScrollSizes(MM_TEXT, GetDocument()->GetDocSize());	}


void CDibView::OnActivateView(BOOL bActivate, CView* pActivateView,
					CView* pDeactiveView)
{
	CScrollView::OnActivateView(bActivate, pActivateView, pDeactiveView);

	if (bActivate)
	{
		ASSERT(pActivateView == this);
		OnDoRealize((WPARAM)m_hWnd, 0);   // same as SendMessage(WM_DOREALIZE);
	}
}

void CDibView::OnEditCopy()
{
	CDibDoc* pDoc = GetDocument();
	// Clean clipboard of contents, and copy the DIB.

	if (OpenClipboard())
	{
		BeginWaitCursor();
		EmptyClipboard();
		SetClipboardData (CF_DIB, CopyHandle((HANDLE) pDoc->GetHDIB()) );
		CloseClipboard();
		EndWaitCursor();
	}
}



void CDibView::OnUpdateEditCopy(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(GetDocument()->GetHDIB() != NULL);
}


void CDibView::OnEditPaste()
{
	HDIB hNewDIB = NULL;

	if (OpenClipboard())
	{
		BeginWaitCursor();

		hNewDIB = (HDIB) CopyHandle(::GetClipboardData(CF_DIB));

		CloseClipboard();

		if (hNewDIB != NULL)
		{
			CDibDoc* pDoc = GetDocument();
			pDoc->ReplaceHDIB(hNewDIB); // and free the old DIB
			pDoc->InitDIBData();    // set up new size & palette
			pDoc->SetModifiedFlag(TRUE);

			SetScrollSizes(MM_TEXT, pDoc->GetDocSize());
			OnDoRealize((WPARAM)m_hWnd,0);  // realize the new palette
			pDoc->UpdateAllViews(NULL);
		}
		EndWaitCursor();
	}
}


void CDibView::OnUpdateEditPaste(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(::IsClipboardFormatAvailable(CF_DIB));
}

void CDibView::Rgbvalue() 
{
	CDibDoc* pDoc = GetDocument();

	int x1 = pDoc->start_point.x;
	int y1 = pDoc->start_point.y;
	int x2 = pDoc->end_point.x;
	int y2 = pDoc->end_point.y;
	int oX = x1;
	int oY = y1;
	
	boxWidth = x2 - x1;
	boxHeight = y2- y1;

	////////////////////////////////////////////////////////////
	/// dieo modify 14/01/2544
	if (pDoc->m_SelectElement == 2)
	{
		x2 = x1+pDoc->Radius;
		y2 = y1+pDoc->Radius;
		x1 = x1-pDoc->Radius;
		y1 = y1-pDoc->Radius;
		boxWidth = x2 - x1;
		boxHeight = y2- y1;
		boxWidth = abs(boxWidth);
		boxHeight = abs(boxHeight);
	}
	int quarterWidth = boxWidth/4;
	int quarterHeight = boxHeight/4;
	CString detailSelection = "";
	//// end dieo modify


	HDIB hDIB = pDoc->GetHDIB();
	LPSTR lpDIB = (LPSTR) ::GlobalLock((HGLOBAL) hDIB);
	int width = (int) ::DIBWidth(lpDIB);         // Size of DIB - x
	int height = (int) ::DIBHeight(lpDIB);        // Size of DIB - y
	::GlobalUnlock((HGLOBAL) hDIB);
		

	// check that already defined boundary yet
	if (boxHeight > 0 && boxWidth > 0)
	{	
		// check box boundary if outside picture not store histogram & file
		if (x2 > width || y2 > height)
		{
			AfxMessageBox("Outside boundary! Choose new area");
			if (!target1.IsEmpty())
				target1.Empty();
			if (!target2.IsEmpty())
				target2.Empty();
			if (!target3.IsEmpty())
				target3.Empty();
			if (!target4.IsEmpty())
				target4.Empty();
			if (!target5.IsEmpty())
				target5.Empty();
		}
		else
		{
			CPalette* cPal = pDoc->GetDocPalette();

/////////////// save value in temp buff for show /////////////////////

			BeginWaitCursor();

			ToScreen hisbuff0 = InitHistogram(hisbuff0);
			ToScreen hisbuff1 = InitHistogram(hisbuff1);
			ToScreen hisbuff2 = InitHistogram(hisbuff2);
			ToScreen hisbuff3 = InitHistogram(hisbuff3);
			ToScreen hisbuff4 = InitHistogram(hisbuff4);
			ToScreen hisbuff5 = InitHistogram(hisbuff5);
	
			///// start dieo modify divition 5 part ////////
			if (pDoc->m_SelectElement == 1)
			{
				if (!pDoc->m_SelectAll)
					detailSelection = " (Select Regtangle).";
				else
					detailSelection = " (Select All).";
								
				/////******** part0 *********////
				
					int pX = x1;
					int pY = y1;
					for (int v0 = 0; v0 < boxHeight;++v0)
					{
						for (int h = 0; h <boxWidth;++h)
						{							
							HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
							hisbuff0 = :: StoreHistogram(hisbuff0,value);
							pX += 1;		
						}//end for h	
						pX = x1;
						pY += 1;
					}// end for v
				
				/////******** part1 *********////
					pX = x1;
					pY = y1;
					int tmpQuarterWidth = (quarterWidth*2);
					for (int v1 = 0; v1 < (quarterHeight*2);++v1)
					{
						for (int h = 0; h < tmpQuarterWidth;++h)
						{							
							HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
							hisbuff1 = :: StoreHistogram(hisbuff1,value);
							pX += 1;		
						}//end for h	
						pX = x1;
						pY += 1;
						if (pY >= (y1+quarterHeight))
								tmpQuarterWidth = quarterWidth;
					}// end for v

					/////******** part2 *********////
					pX = x1+(quarterWidth*2);
					pY = y1;
					tmpQuarterWidth = (quarterWidth*2);
					for (int v2 = 0; v2 < (quarterHeight*2);++v2)
					{
						for (int h = 0; h < tmpQuarterWidth;++h)
						{
							
							HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
							hisbuff2 = :: StoreHistogram(hisbuff2,value);
							pX += 1;		
						}//end for h
						//pX1 = x1+(quarterWidth*2);
						pY += 1;
						if (pY >= (y1+quarterHeight))
						{
								tmpQuarterWidth = quarterWidth;
								pX = x1+(quarterWidth*3);
						}
						else pX = x1+(quarterWidth*2);
					}// end for v
		
					/////******** part3 *********////
					pX = x1+(quarterWidth*3);
					pY = y1+(quarterHeight*2);
					tmpQuarterWidth = quarterWidth;
					for (int v3 = 0; v3 < (quarterHeight*2);++v3)
					{
						for (int h = 0; h < tmpQuarterWidth;++h)
						{
							
							HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
							hisbuff3 = :: StoreHistogram(hisbuff3,value);
							pX += 1;		
						}//end for h
						//pX1 = x1+(quarterWidth*2);
						pY += 1;
						if (pY >= (y1+(quarterHeight*3)))
						{
								tmpQuarterWidth = quarterWidth;
								pX = x1+(quarterWidth*2);
						}
						else pX = x1+(quarterWidth*3);
					}// end for v
				
					/////******** part4 *********////
					pX = x1;
					pY = y1+(quarterHeight*2);
					tmpQuarterWidth = quarterWidth;
					for (int v4 = 0; v4 < (quarterHeight*2);++v4)
					{
						for (int h = 0; h < tmpQuarterWidth;++h)
						{
							
							HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
							hisbuff4 = :: StoreHistogram(hisbuff4,value);
							pX += 1;		
						}//end for h	
						pX = x1;
						pY += 1;
						if (pY >= (y1+quarterHeight*3))
								tmpQuarterWidth = quarterWidth*2;
					}// end for v
			
					/////******** part5 *********////
					pX = x1+quarterWidth;
					pY = y1+quarterHeight;
					tmpQuarterWidth = quarterWidth*2;
					for (int v5 = 0; v5 < (quarterHeight*2);++v5)
					{
						for (int h = 0; h < tmpQuarterWidth;++h)
						{
							
							HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
							hisbuff5 = :: StoreHistogram(hisbuff5,value);
							pX += 1;		
						}//end for h	
						pX = x1+quarterWidth;
						pY += 1;
					}// end for v
			
			}// end if m_SelectElement == Rectangle
			else
			if (pDoc->m_SelectElement == 2) 
			{
				long ChkBound = 0;

				detailSelection = " (Select Circle).";
					/////******** part0 *********////
				
					int pX = x1;
					int pY = y1;
					for (int v0 = 0; v0 <= boxHeight;++v0)
					{
						for (int h = 0; h <= boxWidth;++h)
						{		
							ChkBound = static_cast<long>(
										sqrt(static_cast<double>((pX-oX)*(pX-oX)
										+(pY-oY)*(pY-oY))));
							if (ChkBound <= pDoc->Radius)
							{
								HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
								hisbuff0 = :: StoreHistogram(hisbuff0,value);
							}
							pX += 1;		
						}//end for h	
						pX = x1;
						pY += 1;
					}// end for v
				
					/////******** part1 *********////
					pX = x1;
					pY = y1;
					int tmpQuarterWidth = (quarterWidth*2);
					for (int v1 = 0; v1 < (quarterHeight*2);++v1)
					{
						for (int h = 0; h < tmpQuarterWidth;++h)
						{		
							ChkBound = static_cast<long>(
										sqrt(static_cast<double>((pX-oX)*(pX-oX)
										+(pY-oY)*(pY-oY))));
							if (ChkBound <= pDoc->Radius)
							{
								HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
								hisbuff1 = :: StoreHistogram(hisbuff1,value);
							}
							pX += 1;		
						}//end for h	
						pX = x1;
						pY += 1;
						if (pY >= (y1+quarterHeight))
								tmpQuarterWidth = quarterWidth;
					}// end for v
			
					/////******** part2 *********////
					pX = x1+(quarterWidth*2);
					pY = y1;
					tmpQuarterWidth = (quarterWidth*2);
					for (int v2 = 0; v2 < (quarterHeight*2);++v2)
					{
						for (int h = 0; h < tmpQuarterWidth;++h)
						{
							
							ChkBound = static_cast<long>(
										sqrt(static_cast<double>((pX-oX)*(pX-oX)
										+(pY-oY)*(pY-oY))));
							if (ChkBound <= pDoc->Radius)
							{
								HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
								hisbuff2 = :: StoreHistogram(hisbuff2,value);
							}
							pX += 1;		
						}//end for h
						//pX1 = x1+(quarterWidth*2);
						pY += 1;
						if (pY >= (y1+quarterHeight))
						{
								tmpQuarterWidth = quarterWidth;
								pX = x1+(quarterWidth*3);
						}
						else pX = x1+(quarterWidth*2);
					}// end for v
		
					/////******** part3 *********////
					pX = x1+(quarterWidth*3);
					pY = y1+(quarterHeight*2);
					tmpQuarterWidth = quarterWidth;
					for (int v3 = 0; v3 < (quarterHeight*2);++v3)
					{
						for (int h = 0; h < tmpQuarterWidth;++h)
						{
							ChkBound = static_cast<long>(
										sqrt(static_cast<double>((pX-oX)*(pX-oX)
										+(pY-oY)*(pY-oY))));
							if (ChkBound <= pDoc->Radius)
							{
								HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
								hisbuff3 = :: StoreHistogram(hisbuff3,value);
							}
							pX += 1;		
						}//end for h
						//pX1 = x1+(quarterWidth*2);
						pY += 1;
						if (pY >= (y1+(quarterHeight*3)))
						{
								tmpQuarterWidth = quarterWidth;
								pX = x1+(quarterWidth*2);
						}
						else pX = x1+(quarterWidth*3);
					}// end for v
		
					/////******** part4 *********////
					pX = x1;
					pY = y1+(quarterHeight*2);
					tmpQuarterWidth = quarterWidth;
					for (int v4 = 0; v4 < (quarterHeight*2);++v4)
					{
						for (int h = 0; h < tmpQuarterWidth;++h)
						{
							ChkBound = static_cast<long>(
										sqrt(static_cast<double>((pX-oX)*(pX-oX)
										+(pY-oY)*(pY-oY))));
							if (ChkBound <= pDoc->Radius)
							{
								HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
								hisbuff4 = :: StoreHistogram(hisbuff4,value);
							}
							pX += 1;		
						}//end for h	
						pX = x1;
						pY += 1;
						if (pY >= (y1+quarterHeight*3))
								tmpQuarterWidth = quarterWidth*2;
					}// end for v
			
					/////******** part5 *********////
					pX = x1+quarterWidth;
					pY = y1+quarterHeight;
					tmpQuarterWidth = quarterWidth*2;
					for (int v5 = 0; v5 < (quarterHeight*2);++v5)
					{
						for (int h = 0; h < tmpQuarterWidth;++h)
						{			
							HSVQUAD	value = ::findHSV(hDIB,cPal,pX,pY);
							hisbuff5 = :: StoreHistogram(hisbuff5,value);
							pX += 1;		
						}//end for h	
						pX = x1+quarterWidth;
						pY += 1;
					}// end for v
			}// end if m_SelectElement == Circle
			// end dieo modify ///////////////////	
			EndWaitCursor();
// END TRANSFORM AND QUANTIZE
////////////////////////////////////////////////////////////////////
			
			target0 = CountHistogram(hisbuff0);
			target1 = CountHistogram(hisbuff1);
			target2 = CountHistogram(hisbuff2);
			target3 = CountHistogram(hisbuff3);
			target4 = CountHistogram(hisbuff4);
			target5 = CountHistogram(hisbuff5);

			if (m_database == TRUE)
			{
				CDataDialog data;
				data.DoModal();
				if (data.m_data != "")
					detail = data.m_data;
				//AfxMessageBox(detail);

				// get save path from application
				extern	CString path;
				CString name = path;
				name.Replace("\\","/");
				//name += "/hisDB/";
				name += "/"+nameDB+"/";

				// get picture name for save
				name += pDoc->GetTitle();
				
				target0 += "part0\n";
				target1 += "part1\n";
				target2 += "part2\n";
				target3 += "part3\n";
				target4 += "part4\n";
				target5 += detail+detailSelection;

				// save picture and histogram and return file's buffer
				::SaveFile(hDIB,name,target0,target1,target2,target3,target4,target5);
			}

			// for show Array's Size of target & model		
			Invalidate();
				
		}// end of else in picture boundary
	
	}//end of if open image
	else
	{
		AfxMessageBox("Please select area to compute histogram");
		if (!target1.IsEmpty())
		{
			target0.Empty();
			target1.Empty();
			target2.Empty();
			target3.Empty();
			target4.Empty();
			target5.Empty();
		}
	}
}


void CDibView::OnLButtonDown(UINT nFlags, CPoint point) 
{
	
	CClientDC aDC(this);//1
	OnPrepareDC(&aDC);	//2
	aDC.DPtoLP(&point);	//3
	//// Three lint Ohn modity ///////
	CDibDoc* pDoc = GetDocument();
	/////////////////////////////////////////////////////////////
	//dieo modify set capturing mouse message
	/////////////////////////////////////////////////////////////
	SetCapture();
	pDoc->m_SelectAll = false;
	//end dieo modify

	HDIB hDIB = pDoc->GetHDIB();
	if (hDIB != NULL)
	{	
		pDoc -> start_point = point;
		////////////////////////////////////////////////////////
		// dieo modify set end point  initial start = end point
		////////////////////////////////////////////////////////
		pDoc -> end_point = point;
		// end dieo modify
		Invalidate();
	}
	else
		AfxMessageBox("no image");

	//CScrollView::OnLButtonDown(nFlags, point);

}

void CDibView::OnMouseMove(UINT nFlags, CPoint point) 
{
	CClientDC aDC(this); // from Ohn
	OnPrepareDC(&aDC);	// from Ohn
	CDibDoc* pDoc = GetDocument();
	HDIB hDIB = pDoc->GetHDIB();

	if (hDIB != NULL)
	
	{
		// dieo modify (this == GetCapture())
		while (nFlags && (this == GetCapture()))
		{
			aDC.DPtoLP(&point);// Ohn
			pDoc -> end_point = point;
			nFlags = 0;			
			Invalidate();
		}
	}
	
	else
		AfxMessageBox("no image");

  //CScrollView::OnMouseMove(nFlags, point);
}

void CDibView::OnToolMatching() 
{ 
	Rgbvalue(); // deliver target1,...,target5
	GetThreshold(); //read threashold 

	if (show == FALSE)
	{
		target0.Empty();
		target1.Empty();
		target2.Empty();
		target3.Empty();
		target4.Empty();
		target5.Empty();
	}

	if (!target0.IsEmpty())
	{
		struct _finddata_t his_file;
		long hFile;
	
		extern	CString path;

		// to find in path /*.his
		CString dir = path;
		dir.Replace("\\","/");
	
		//dir += "/hisDB/";		
		dir += "/"+nameDB+"/";
				
		// Find first .his file in specified directory 	
		CString model0,model1,model2,model3,model4,model5;
		model0 ="";
		model1 ="";
		model2 ="";
		model3 ="";
		model4 ="";
		model5 ="";

		if( (hFile = _findfirst( dir + "*.his", &his_file )) == -1L )
			AfxMessageBox("Can't find .his file");
	
		else
		{    
			//AfxMessageBox("Found .his file");
				
			// for first file that has .his
			CStdioFile fileRead( dir + his_file.name, CFile::modeRead );
			fileRead.ReadString(model0);
			fileRead.ReadString(model1);
			fileRead.ReadString(model2);
			fileRead.ReadString(model3);
			fileRead.ReadString(model4);
			fileRead.ReadString(model5);
			fileRead.Close();

			// CONVERT MODEL 1 part 0 //			 
			int c = 0;
			int order = 0;
			int expo = 0;
			int count = 0;
			double num = 0 ;
		    expo = model0.Find('|');
			model0.SetAt(expo,'x');
			--expo;
			int total = 0;
			char cnum;
	
		while (model0.GetAt(c) != '*')
		{
			if(model0.GetAt(++c) != '*')
			{ c--;

			if (model0.GetAt(c) == 'x' )
			{ 
				if (model0.GetAt(++c) != ' ')
				{
					c--;
					expo = model0.Find('|');
					model0.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model0.Find('|');
					model0.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model0.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff0[order++] = num;}
			}
			} // end if up
		}
		// END CONVET MODEL 1  part 0 
	
			
			// CONVERT MODEL 1 part 1 //			 
			c = 0;
			order = 0;
			expo = 0;
			count = 0;
			num = 0 ;
		    expo = model1.Find('|');
			model1.SetAt(expo,'x');
			--expo;
			total = 0;
	
		while (model1.GetAt(c) != '*')
		{
			if(model1.GetAt(++c) != '*')
			{ c--;

			if (model1.GetAt(c) == 'x' )
			{ 
				if (model1.GetAt(++c) != ' ')
				{
					c--;
					expo = model1.Find('|');
					model1.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model1.Find('|');
					model1.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model1.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff1[order++] = num;}
			}
			} // end if up
		}
		// END CONVET MODEL 1  part 1 
	
	
		// CONVERT MODEL 1 part 2 //
			c = 0;
			order = 0;
			expo = 0;
			count = 0;
			num = 0 ;
		    expo = model2.Find('|');
			model2.SetAt(expo,'x');
			--expo;
			total = 0;
				
		while (model2.GetAt(c) != '*')
		{
			if(model2.GetAt(++c) != '*')
			{ c--;

			if (model2.GetAt(c) == 'x' )
			{ 
				if (model2.GetAt(++c) != ' ')
				{
					c--;
					expo = model2.Find('|');
					model2.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model2.Find('|');
					model2.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model2.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff2[order++] = num;}
			}
			} // end if up
		}
		// END CONVET MODEL 1 part 2 // 
	

		// CONVERT MODEL 1 part 3 //
			c = 0;
			order = 0;
			expo = 0;
			count = 0;
			num = 0 ;
		    expo = model3.Find('|');
			model3.SetAt(expo,'x');
			--expo;
			total = 0;
				
		while (model3.GetAt(c) != '*')
		{
			if(model3.GetAt(++c) != '*')
			{ c--;

			if (model3.GetAt(c) == 'x' )
			{ 
				if (model3.GetAt(++c) != ' ')
				{
					c--;
					expo = model3.Find('|');
					model3.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model3.Find('|');
					model3.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model3.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff3[order++] = num;}
			}
			} // end if up
		}
		// END CONVET MODEL 1 part 3 // 
	

		// CONVERT MODEL 1 part 4 //
			c = 0;
			order = 0;
			expo = 0;
			count = 0;
			num = 0 ;
		    expo = model4.Find('|');
			model4.SetAt(expo,'x');
			--expo;
			total = 0;
				
		while (model4.GetAt(c) != '*')
		{
			if(model4.GetAt(++c) != '*')
			{ c--;

			if (model4.GetAt(c) == 'x' )
			{ 
				if (model4.GetAt(++c) != ' ')
				{
					c--;
					expo = model4.Find('|');
					model4.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model4.Find('|');
					model4.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model4.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff4[order++] = num;}
			}
			} // end if up
		}
		// END CONVET MODEL 1 part 4 // 
	

		// CONVERT MODEL 1 part 5 //
		    c = 0;
			order = 0;
			expo = 0;
			count = 0;
			num = 0 ;
		    expo = model5.Find('|');
			model5.SetAt(expo,'x');
			--expo;
			total = 0;
				
		while (model5.GetAt(c) != '*')
		{
			if(model5.GetAt(++c) != '*')
			{ c--;

			if (model5.GetAt(c) == 'x' )
			{ 
				if (model5.GetAt(++c) != ' ')
				{
					c--;
					expo = model5.Find('|');
					model5.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model5.Find('|');
					model5.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model5.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff5[order++] = num;}
			}
			} // end if up
		}
		// END CONVET MODEL 1 part 5 // 
		
		// CATCH DATA part5
		CString DATAtemp;
		DATAtemp = "";
		c++;
		while (c != model5.GetLength())
		{DATAtemp += model5.GetAt(c++) ;}
		// END CATCH DATA part 5

		//CONVERT TARGET part 0 //
			
			   c = 0;
			   order = 0;
			   count = 0;
			   num = 0 ;
			   expo = target0.Find('|'); 
		if (expo != -1 )
		{

			 target0.SetAt(expo,'x');
			--expo;

		while (target0.GetAt(c) != '*')
		{
			if(target0.GetAt(++c) != '*') // if up
			{ c--;
	
			if (target0.GetAt(c) == 'x' )
			{ 
				if (target0.GetAt(++c) != ' ')
				{
					c--;
					expo = target0.Find('|');
					target0.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = target0.Find('|');
					target0.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = target0.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{target_buff0[order++] = num;}
			}
			} // end if up
		}
		} // end if
		// END CONVERT TARGET part 0 //

		//CONVERT TARGET part 1 //
			
			   c = 0;
			   order = 0;
			   count = 0;
			   num = 0 ;
			   expo = target1.Find('|'); 
		if (expo != -1 )
		{

			 target1.SetAt(expo,'x');
			--expo;

		while (target1.GetAt(c) != '*')
		{
			if(target1.GetAt(++c) != '*') // if up
			{ c--;
	
			if (target1.GetAt(c) == 'x' )
			{ 
				if (target1.GetAt(++c) != ' ')
				{
					c--;
					expo = target1.Find('|');
					target1.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = target1.Find('|');
					target1.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = target1.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{target_buff1[order++] = num;}
			}
			} // end if up
		}
		} // end if
		// END CONVERT TARGET part 1 //

		//CONVERT TARGET part 2 //
			
			   c = 0;
			   order = 0;
			   count = 0;
			   num = 0 ;
			   expo = target2.Find('|'); 
		if (expo != -1 )
		{

			 target2.SetAt(expo,'x');
			--expo;

		while (target2.GetAt(c) != '*')
		{
			if(target2.GetAt(++c) != '*') // if up
			{ c--;
	
			if (target2.GetAt(c) == 'x' )
			{ 
				if (target2.GetAt(++c) != ' ')
				{
					c--;
					expo = target2.Find('|');
					target2.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = target2.Find('|');
					target2.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = target2.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{target_buff2[order++] = num;}
			}
			} // end if up
		}
		} // end if
		// END CONVERT TARGET part 2 //


		//CONVERT TARGET part 3 //
			
			   c = 0;
			   order = 0;
			   count = 0;
			   num = 0 ;
			   expo = target3.Find('|'); 
		if (expo != -1 )
		{

			 target3.SetAt(expo,'x');
			--expo;

		while (target3.GetAt(c) != '*')
		{
			if(target3.GetAt(++c) != '*') // if up
			{ c--;
	
			if (target3.GetAt(c) == 'x' )
			{ 
				if (target3.GetAt(++c) != ' ')
				{
					c--;
					expo = target3.Find('|');
					target3.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = target3.Find('|');
					target3.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = target3.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{target_buff3[order++] = num;}
			}
			} // end if up
		}
		} // end if
		// END CONVERT TARGET part 3 //

		//CONVERT TARGET part 4 //
			
			   c = 0;
			   order = 0;
			   count = 0;
			   num = 0 ;
			   expo = target4.Find('|'); 
		if (expo != -1 )
		{

			 target4.SetAt(expo,'x');
			--expo;

		while (target4.GetAt(c) != '*')
		{
			if(target4.GetAt(++c) != '*') // if up
			{ c--;
	
			if (target4.GetAt(c) == 'x' )
			{ 
				if (target4.GetAt(++c) != ' ')
				{
					c--;
					expo = target4.Find('|');
					target4.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = target4.Find('|');
					target4.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = target4.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{target_buff4[order++] = num;}
			}
			} // end if up
		}
		} // end if
		// END CONVERT TARGET part 4 //

		//CONVERT TARGET part 5 //
			
			   c = 0;
			   order = 0;
			   count = 0;
			   num = 0 ;
			   expo = target5.Find('|'); 
		if (expo != -1 )
		{

			 target5.SetAt(expo,'x');
			--expo;

		while (target5.GetAt(c) != '*')
		{
			if(target5.GetAt(++c) != '*') // if up
			{ c--;
	
			if (target5.GetAt(c) == 'x' )
			{ 
				if (target5.GetAt(++c) != ' ')
				{
					c--;
					expo = target5.Find('|');
					target5.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = target5.Find('|');
					target5.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = target5.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{target_buff5[order++] = num;}
			}
			} // end if up
		}
		} // end if
		// END CONVERT TARGET part 5 //


			// NORMALIZATION //
			Model_Size1 = 0;
			Target_Size1 =0;
			double Top,Down;
			double old_target0[32];
			double old_target1[32];
			double old_target2[32];
			double old_target3[32];
			double old_target4[32];
			double old_target5[32];

			//Target_Size1 = boxWidth * boxHeight;
			//Old_Target1 = Target_Size1;
			for (int k=0;k<=31;++k)
			{
				old_target0[k] = target_buff0[k];
				old_target1[k] = target_buff1[k];
				old_target2[k] = target_buff2[k];
				old_target3[k] = target_buff3[k];
				old_target4[k] = target_buff4[k];
				old_target5[k] = target_buff5[k];
			}

			for (int i=27;i<=31;++i)
			{
				Model_Size1 = model_buff1[i]+model_buff2[i]
							+model_buff3[i]+model_buff4[i]
							+model_buff5[i]+Model_Size1;
				Target_Size1 = target_buff1[i]+target_buff2[i]
							+target_buff3[i]+target_buff4[i]
							+target_buff5[i]+Target_Size1;

			}

			Old_Target1 = Target_Size1;

			double Normalize;
			Top = max(Target_Size1,Model_Size1);
			Down = min(Target_Size1,Model_Size1);
			Normalize = Top/Down;// always more than or equal 1 
			//Normalize = floor(Normalize);

			   if (Normalize == 0.0)
				{Normalize = 1;}
			   if (Top == Model_Size1) // Model is bigger than target
			   {  for (int i = 0;i <=32;++i)
					{
						target_buff0[i] = target_buff0[i]*Normalize;
						target_buff1[i] = target_buff1[i]*Normalize;
						target_buff2[i] = target_buff2[i]*Normalize;
						target_buff3[i] = target_buff3[i]*Normalize;
						target_buff4[i] = target_buff4[i]*Normalize;
						target_buff5[i] = target_buff5[i]*Normalize;
					}
				  Target_Size1 = Target_Size1*Normalize;
			   }
			   else 
				{
				   for (int j = 0;j <=32;++j)
				   { 
					   model_buff0[j] = model_buff0[j]*Normalize;
					   model_buff1[j] = model_buff1[j]*Normalize;
					   model_buff2[j] = model_buff2[j]*Normalize;
					   model_buff3[j] = model_buff3[j]*Normalize;
					   model_buff4[j] = model_buff4[j]*Normalize;
					   model_buff5[j] = model_buff5[j]*Normalize;
				   }
				   Model_Size1 = Model_Size1*Normalize;
				}	

			// for show model size
	
			// END NORMALIZATION //
			CDibDoc* pDoc = GetDocument();
			int selectmatching = pDoc->m_SelectMatching;
			float Ma	=  0;
			float Mh	=  0;
			float Mh1_1 =  0;
			float Mh1_2 =  0;
			float Mh1_3 =  0;
			float Mh1_4 =  0;
			float Mh1_t	=  0;

			float Mh2_1 =  0;
			float Mh2_2 =  0;
			float Mh2_3 =  0;
			float Mh2_4 =  0;
			float Mh2_t	=  0;
		
			float Mh3_1 =  0;
			float Mh3_2 =  0;
			float Mh3_3 =  0;
			float Mh3_4 =  0;
		    float Mh3_t	=  0;

			float Mh4_1 =  0;
			float Mh4_2 =  0;
			float Mh4_3 =  0;
			float Mh4_4 =  0;
			float Mh4_t	=  0;

			float Mh_Max = 0;

			int flexibility = 20;

			if (threshold <= flexibility) flexibility = 0;

			Ma	=  HisIntersectAVG(target_buff1,model_buff1);
			Ma	=  Ma+HisIntersectAVG(target_buff2,model_buff2);
			Ma	=  Ma+HisIntersectAVG(target_buff3,model_buff3);
			Ma	=  Ma+HisIntersectAVG(target_buff4,model_buff4);
			Ma	=  Ma+HisIntersectAVG(target_buff5,model_buff5);

			float Mh5   =  HisIntersectH(target_buff5,model_buff5);

		if (selectmatching == 1) // matching for color only
		{
			Ma = HisIntersectAVG(target_buff0,model_buff0);
			Mh = HisIntersectH(target_buff0,model_buff0);
		}
		else if (selectmatching == 2) // matching for 5 part segment
		{
			if ((Mh5*100) >= (float)threshold) 
			{
			
				Mh1_1 =  HisIntersectH(target_buff1,model_buff1);
				Mh1_2 =  HisIntersectH(target_buff2,model_buff2);
				Mh1_3 =  HisIntersectH(target_buff3,model_buff3);
				Mh1_4 =  HisIntersectH(target_buff4,model_buff4);
				
				if(((Mh1_1*100) >= (float)(threshold-flexibility)) &&
					((Mh1_2*100) >= (float)(threshold-flexibility)) &&
					((Mh1_3*100) >= (float)(threshold-flexibility)) &&
					((Mh1_4*100) >= (float)(threshold-flexibility)) )
						Mh1_t	=  (Mh1_1+Mh1_2+Mh1_3+Mh1_4+Mh5)/5;	

				Mh = Mh1_t;
			}
			else Ma = 0;
		}
		else if (selectmatching == 3) // matching for 5 part segment and rotation
		{
			if ((Mh5*100) >= (float)(threshold)) 
			{
			
				Mh1_1 =  HisIntersectH(target_buff1,model_buff1);
				Mh1_2 =  HisIntersectH(target_buff2,model_buff2);
				Mh1_3 =  HisIntersectH(target_buff3,model_buff3);
				Mh1_4 =  HisIntersectH(target_buff4,model_buff4);

				Mh2_1 =  HisIntersectH(target_buff1,model_buff4);
				Mh2_2 =  HisIntersectH(target_buff2,model_buff1);
				Mh2_3 =  HisIntersectH(target_buff3,model_buff2);
				Mh2_4 =  HisIntersectH(target_buff4,model_buff3);

				Mh3_1 =  HisIntersectH(target_buff1,model_buff3);
				Mh3_2 =  HisIntersectH(target_buff2,model_buff4);
				Mh3_3 =  HisIntersectH(target_buff3,model_buff1);
				Mh3_4 =  HisIntersectH(target_buff4,model_buff2);

				Mh4_1 =  HisIntersectH(target_buff1,model_buff2);
				Mh4_2 =  HisIntersectH(target_buff2,model_buff3);
				Mh4_3 =  HisIntersectH(target_buff3,model_buff4);
				Mh4_4 =  HisIntersectH(target_buff4,model_buff1);

				if(((Mh1_1*100) >= (float)(threshold-flexibility)) &&
					((Mh1_2*100) >= (float)(threshold-flexibility)) &&
					((Mh1_3*100) >= (float)(threshold-flexibility)) &&
					((Mh1_4*100) >= (float)(threshold-flexibility)) )
						Mh1_t	=  (Mh1_1+Mh1_2+Mh1_3+Mh1_4+Mh5)/5;	
			
				if(((Mh2_1*100) >= (float)(threshold-flexibility)) &&
					((Mh2_2*100) >= (float)(threshold-flexibility)) &&
					((Mh2_3*100) >= (float)(threshold-flexibility)) &&
					((Mh2_4*100) >= (float)(threshold-flexibility)) )
						Mh2_t	=  (Mh2_1+Mh2_2+Mh2_3+Mh2_4+Mh5)/5;
				
				if(((Mh1_1*100) >= (float)(threshold-flexibility)) &&
					((Mh3_2*100) >= (float)(threshold-flexibility)) &&
					((Mh3_3*100) >= (float)(threshold-flexibility)) &&
					((Mh3_4*100) >= (float)(threshold-flexibility)) )
						Mh3_t	=  (Mh3_1+Mh3_2+Mh3_3+Mh3_4+Mh5)/5;
								
				if(((Mh4_1*100) >= (float)(threshold-flexibility)) &&
					((Mh4_2*100) >= (float)(threshold-flexibility)) &&
					((Mh4_3*100) >= (float)(threshold-flexibility)) &&
					((Mh4_4*100) >= (float)(threshold-flexibility)) )
						Mh4_t	=  (Mh4_1+Mh4_2+Mh4_3+Mh4_4+Mh5)/5;

				Mh_Max = max(Mh1_t,Mh2_t);
				Mh_Max = max(Mh_Max,Mh3_t);
				Mh	 = max(Mh_Max,Mh4_t);
				if (Mh == 0) Ma = 0;
			
			}
			else Ma = 0;
		}
///////////////////////////////////////////////////////////
////////////// histogram intersection
				
			// initial value of list
			Result *node = NULL, *list_h = NULL, *list_t = NULL , *insert = NULL;

			// create new node
			node = new Result;				
			node->filename = his_file.name;
			node->avg = Ma;
			node->H = Mh;
			node->ModelSize = Model_Size1;
			node->DATA = DATAtemp;
			list_h = node;
			list_t = node;
			list_t->next_down = NULL;
			list_t->next_up = NULL;
		
			// find similarity
				
			// for all other file that has .his in that directory
			while ( _findnext( hFile, &his_file ) == 0 )
			{
				model0 ="";
				model1 =""; //dieo modify
				model2 ="";
				model3 ="";
				model4 ="";
				model5 ="";
				
				CStdioFile fileRead( dir + his_file.name, CFile::modeRead );
				fileRead.ReadString(model0);
				fileRead.ReadString(model1);
				fileRead.ReadString(model2);
				fileRead.ReadString(model3);
				fileRead.ReadString(model4);
				fileRead.ReadString(model5);
				fileRead.Close();
			// call histogram intersection

			// CONVERT MODEL 2 part 0 //			 
			c = 0;
			order = 0;
			expo = 0;
			count = 0;
			num = 0 ;
		    expo = model0.Find('|');
			model0.SetAt(expo,'x');
			--expo;
			total = 0;
				
		while (model0.GetAt(c) != '*')
		{
			if(model0.GetAt(++c) != '*')
			{ c--;

			if (model0.GetAt(c) == 'x' )
			{ 
				if (model0.GetAt(++c) != ' ')
				{
					c--;
					expo = model0.Find('|');
					model0.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model0.Find('|');
					model0.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model0.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff0[order++] = num;}
			}
			} // end if up
		}
		// END CONVET MODEL 2  part 0 

			//CONVET MODEL 2 part 1//
			c = 0;
			order = 0;
			expo = 0 ;
			count = 0;
			num = 0 ;
		    expo = model1.Find('|');
			model1.SetAt(expo,'x');
			--expo;
			total = 0;
			
		while (model1.GetAt(c) != '*')
		{
			if(model1.GetAt(++c) != '*')
			{ c--;

			if (model1.GetAt(c) == 'x' )
			{ 
				if (model1.GetAt(++c) != ' ')
				{
					c--;
					expo = model1.Find('|');
					model1.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model1.Find('|');
					model1.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model1.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff1[order++] = num;}
			}
			} //end if up
		}
		// END CONVERT MODEL 2 part 1 //
	

		// CONVERT MODEL 2 part 2 //
		    c = 0;
			order = 0;
			expo = 0 ;
			count = 0;
			num = 0 ;
		    expo = model2.Find('|');
			model2.SetAt(expo,'x');
			--expo;
			total = 0;
			
		while (model2.GetAt(c) != '*')
		{
			
			if(model2.GetAt(++c) != '*')
			{ c--;

			if (model2.GetAt(c) == 'x' )
			{ 
				if (model2.GetAt(++c) != ' ')
				{
					c--;
					expo = model2.Find('|');
					model2.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model2.Find('|');
					model2.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model2.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff2[order++] = num;}
			}
			} //end if up
		}
		// END CONVERT MODEL 2 part 2 //
		

		// CONVERT MODEL 2 part 3 //
			c = 0;
			order = 0;
			expo = 0;
			count = 0;
			num = 0 ;
		    expo = model3.Find('|');
			model3.SetAt(expo,'x');
			--expo;
			total = 0;
				
		while (model3.GetAt(c) != '*')
		{
			if(model3.GetAt(++c) != '*')
			{ c--;

			if (model3.GetAt(c) == 'x' )
			{ 
				if (model3.GetAt(++c) != ' ')
				{
					c--;
					expo = model3.Find('|');
					model3.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model3.Find('|');
					model3.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model3.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff3[order++] = num;}
			}
			} // end if up
		}
		// END CONVET MODEL 2 part 3 // 
		
		// CONVERT MODEL 2 part 4 //
			c = 0;
			order = 0;
			expo = 0;
			count = 0;
			num = 0 ;
		    expo = model4.Find('|');
			model4.SetAt(expo,'x');
			--expo;
			total = 0;
				
		while (model4.GetAt(c) != '*')
		{
			if(model4.GetAt(++c) != '*')
			{ c--;

			if (model4.GetAt(c) == 'x' )
			{ 
				if (model4.GetAt(++c) != ' ')
				{
					c--;
					expo = model4.Find('|');
					model4.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model4.Find('|');
					model4.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model4.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff4[order++] = num;}
			}
			} // end if up
		}
		// END CONVET MODEL 2 part 4 // 
		
		// CONVERT MODEL 2 part 5 //
		    c = 0;
			order = 0;
			expo = 0;
			count = 0;
			num = 0 ;
		    expo = model5.Find('|');
			model5.SetAt(expo,'x');
			--expo;
			total = 0;
				
		while (model5.GetAt(c) != '*')
		{
			if(model5.GetAt(++c) != '*')
			{ c--;

			if (model5.GetAt(c) == 'x' )
			{ 
				if (model5.GetAt(++c) != ' ')
				{
					c--;
					expo = model5.Find('|');
					model5.SetAt(expo,'x');
					expo = expo - (c + 2) ;
					++c; 
					num = 0;
				}else
				{
					expo = model5.Find('|');
					model5.SetAt(expo,'x');
					expo = expo -( c + 2);
					num = 0 ; 
					++c;
				}
			}
			else
			{
				cnum = model5.GetAt(c++);
				count = asctoint(cnum);
				num = pow(10,expo)*count+num;				
				--expo;
			  if (expo == -1)
				{model_buff5[order++] = num;}
			}
			} // end if up
		}
		// END CONVET MODEL 2 part 5 // 
		
		// CATCH DATA part5
		DATAtemp = "";
		c++;
		while (c != model5.GetLength())
		{DATAtemp += model5.GetAt(c++) ;}
		// END CATCH DATA part 5

//-----------------------------------------------------------------//
			// NORMALIZATION //
			
		     Model_Size1 = 0;
			 Target_Size1 = Old_Target1;
			 for(int k=0;k<=31;++k)
			 {
				 target_buff0[k] = old_target0[k];
				 target_buff1[k] = old_target1[k];
				 target_buff2[k] = old_target2[k];
				 target_buff3[k] = old_target3[k];
				 target_buff4[k] = old_target4[k];
				 target_buff5[k] = old_target5[k];
			 }
		
			 for (int i=27;i<=31;++i)
			 {
				 Model_Size1 = model_buff1[i]+model_buff2[i]
							+model_buff3[i]+model_buff4[i]
							+model_buff5[i]+Model_Size1;
			 }

			 Top = max(Target_Size1,Model_Size1);
			 Down = min(Target_Size1,Model_Size1);
			 Normalize = Top/Down;// always more than or equal 1 
			 //Normalize = floor(Normalize);
			   if (Normalize == 0.0) 
				{Normalize = 1;}
			   if (Top == Model_Size1) // target is bigger than model
			   {  
				   for (int i = 0;i <=32;++i)
				   {
					 target_buff0[i] = target_buff0[i]*Normalize;
					 target_buff1[i] = target_buff1[i]*Normalize;
					 target_buff2[i] = target_buff2[i]*Normalize;
					 target_buff3[i] = target_buff3[i]*Normalize;
					 target_buff4[i] = target_buff4[i]*Normalize;
					 target_buff5[i] = target_buff5[i]*Normalize;
				   }
				   Target_Size1 = Target_Size1*Normalize;
			   }
			   else 
				{
				   for (int j = 0;j <=32;++j)
				   { 
					   model_buff0[j] = model_buff0[j]*Normalize;
					   model_buff1[j] = model_buff1[j]*Normalize;
					   model_buff2[j] = model_buff2[j]*Normalize;
					   model_buff3[j] = model_buff3[j]*Normalize;
					   model_buff4[j] = model_buff4[j]*Normalize;
					   model_buff5[j] = model_buff5[j]*Normalize;
				   }
				   Model_Size1 = Model_Size1*Normalize;
				}	
			// END NORMALIZATION //
			
		Ma		= 0;
			Mh1_1	= 0;
			Mh1_2	= 0;
			Mh1_3	= 0;
			Mh1_4	= 0;
			Mh1_t	= 0;
			Mh2_1	= 0;
			Mh2_2	= 0;
			Mh2_3	= 0;
			Mh2_4	= 0;
			Mh2_t	= 0;
			Mh3_1	= 0;
			Mh3_2	= 0;
			Mh3_3	= 0;
			Mh3_4	= 0;
			Mh3_t	= 0;
			Mh4_1	= 0;
			Mh4_2	= 0;
			Mh4_3	= 0;
			Mh4_4	= 0;
			Mh4_t	= 0;
			Mh5	    = 0;
			Mh		= 0;
			Mh_Max  = 0;

			Ma	  =  HisIntersectAVG(target_buff1,model_buff1);
			Ma	  =  Ma+HisIntersectAVG(target_buff2,model_buff2);
  		    Ma	  =  Ma+HisIntersectAVG(target_buff3,model_buff3);
			Ma	  =  Ma+HisIntersectAVG(target_buff4,model_buff4);
			Ma	  =  Ma+HisIntersectAVG(target_buff5,model_buff5);

			Mh5	  =  HisIntersectH(target_buff5,model_buff5);		

		if (selectmatching == 1) // matching for color only
		{
			Ma = HisIntersectAVG(target_buff0,model_buff0);
			Mh = HisIntersectH(target_buff0,model_buff0);
		}
		else if (selectmatching == 2) // matching for 5 part segment
		{
			if ((Mh5*100) >= (float)threshold) 
			{
			
				Mh1_1 =  HisIntersectH(target_buff1,model_buff1);
				Mh1_2 =  HisIntersectH(target_buff2,model_buff2);
				Mh1_3 =  HisIntersectH(target_buff3,model_buff3);
				Mh1_4 =  HisIntersectH(target_buff4,model_buff4);

				if(((Mh1_1*100) >= (float)(threshold-flexibility)) &&
					((Mh1_2*100) >= (float)(threshold-flexibility)) &&
					((Mh1_3*100) >= (float)(threshold-flexibility)) &&
					((Mh1_4*100) >= (float)(threshold-flexibility)) )
						Mh1_t	=  (Mh1_1+Mh1_2+Mh1_3+Mh1_4+Mh5)/5;
				
				Mh = Mh1_t;
			}
			else Ma = 0;
		}
		else if (selectmatching == 3) // matching for 5 part segment and rotation
		{
			if ((Mh5*100) >= (float)(threshold)) 
			{
			
				Mh1_1 =  HisIntersectH(target_buff1,model_buff1);
				Mh1_2 =  HisIntersectH(target_buff2,model_buff2);
				Mh1_3 =  HisIntersectH(target_buff3,model_buff3);
				Mh1_4 =  HisIntersectH(target_buff4,model_buff4);

				Mh2_1 =  HisIntersectH(target_buff1,model_buff4);
				Mh2_2 =  HisIntersectH(target_buff2,model_buff1);
				Mh2_3 =  HisIntersectH(target_buff3,model_buff2);
				Mh2_4 =  HisIntersectH(target_buff4,model_buff3);

				Mh3_1 =  HisIntersectH(target_buff1,model_buff3);
				Mh3_2 =  HisIntersectH(target_buff2,model_buff4);
				Mh3_3 =  HisIntersectH(target_buff3,model_buff1);
				Mh3_4 =  HisIntersectH(target_buff4,model_buff2);

				Mh4_1 =  HisIntersectH(target_buff1,model_buff2);
				Mh4_2 =  HisIntersectH(target_buff2,model_buff3);
				Mh4_3 =  HisIntersectH(target_buff3,model_buff4);
				Mh4_4 =  HisIntersectH(target_buff4,model_buff1);

				if(((Mh1_1*100) >= (float)(threshold-flexibility)) &&
					((Mh1_2*100) >= (float)(threshold-flexibility)) &&
					((Mh1_3*100) >= (float)(threshold-flexibility)) &&
					((Mh1_4*100) >= (float)(threshold-flexibility)) )
						Mh1_t	=  (Mh1_1+Mh1_2+Mh1_3+Mh1_4+Mh5)/5;	
				
				if(((Mh2_1*100) >= (float)(threshold-flexibility)) &&
					((Mh2_2*100) >= (float)(threshold-flexibility)) &&
					((Mh2_3*100) >= (float)(threshold-flexibility)) &&
					((Mh2_4*100) >= (float)(threshold-flexibility)) )
						Mh2_t	=  (Mh2_1+Mh2_2+Mh2_3+Mh2_4+Mh5)/5;
				
				if(((Mh1_1*100) >= (float)(threshold-flexibility)) &&
					((Mh3_2*100) >= (float)(threshold-flexibility)) &&
					((Mh3_3*100) >= (float)(threshold-flexibility)) &&
					((Mh3_4*100) >= (float)(threshold-flexibility)) )
						Mh3_t	=  (Mh3_1+Mh3_2+Mh3_3+Mh3_4+Mh5)/5;
						
				if(((Mh4_1*100) >= (float)(threshold-flexibility)) &&
					((Mh4_2*100) >= (float)(threshold-flexibility)) &&
					((Mh4_3*100) >= (float)(threshold-flexibility)) &&
					((Mh4_4*100) >= (float)(threshold-flexibility)) )
						Mh4_t	=  (Mh4_1+Mh4_2+Mh4_3+Mh4_4+Mh5)/5;


				Mh_Max = max(Mh1_t,Mh2_t);
				Mh_Max = max(Mh_Max,Mh3_t);
				Mh	 = max(Mh_Max,Mh4_t);
				if (Mh == 0) Ma = 0;
			}
			else Ma = 0;	
		}
		
//*****************************************************************//		

			// SORT OF LIST //  	
			float pot = 0;
			

			insert = list_h;
			list_t = list_h;
			node = new Result;
		while(insert)
		{
			pot = insert->H ;
		//	pot = insert->avg;
	
			list_t = insert;
			if (Mh/*Ma*/ > pot) // top  
			{
				if (insert->next_up == NULL) // one child
				{
					list_h = node;
					node->next_down = insert;
					node->next_up = NULL;
					insert->next_up = node;
			
					insert = NULL;
				}
				else  // there is node up and down child
				{
					list_t = insert->next_up;
					list_t->next_down = node;
					node->next_up = list_t;
					insert->next_up = node;
					node->next_down = insert;
			
				}
				insert = NULL;
			}
			else if (insert->next_down == NULL)  //end of list   // rear  
			{
				node->next_up = insert;
				insert->next_down = node;
				node->next_down = NULL;
			
				insert = NULL;
			}  // end else if
			else { insert = insert->next_down ;}
			
		} // end while
				node->filename = his_file.name;
				node->avg = Ma;
				node->H = Mh;
				node->ModelSize = Model_Size1;
				node->DATA = DATAtemp;

			// END SORT OF LIST//
				
			}// end while
	//} // end if (Mh != 0)		

	//		char buff_str[10];
	//		int list_length = 0;

			// for pass avg value
			float match;
			CString info;
			float Tthres;
			bool  firsttime = false ;
			Tthres = (float)threshold/100;
						
			int times = 0;
			BOOL reset;
			//	insert = list_h;
			CResultDlg Dlg;
			reset = FALSE;
			while (list_h)
			{		
				node = list_h;
				list_h = list_h->next_down;
				CString n = node->filename + " ";
				match = node->H;
				info = node->DATA;

				if ( match < Tthres)
				{	list_h = NULL;	}
				else
				{
				// For show result dialog
				n.Replace(".his",".bmp");
				n.Replace(".HIS",".bmp");

				CString fileResult = dir+n;
			 	times += 1;
				Dlg.InitPath(fileResult,n,match,info,reset);
				if (reset == TRUE)
					reset = FALSE;
				firsttime = true ;
				if (times % 5 == 0)
				{
				reset = TRUE;						
					//Dlg.DoModal();
					// IDOK = NEXT, IDCANCEL = BACK
					if (Dlg.DoModal() == IDCANCEL) 
					{
						for (int i=1;i<6;i++)
							list_h = list_h->next_up;
							times--;
					}
				}
					// list BACK 5 image
				}
		
			
			if (firsttime == false)
				{ 
					AfxMessageBox("NO picture found");
					list_h = NULL;
				}
			else 
			{	
				if (list_h == NULL) // not divide by 5
				{   

					if (times < 5) //picture found less than 5
					{
						Dlg.DoModal(); 
						reset = TRUE;						
					}
					if (times > 5 && times % 5 != 0)
					{

					reset = TRUE;
						if (Dlg.DoModal() == IDCANCEL) 
					{
							list_h = node; 
						for (int i=1;i<6;i++)
						{
							list_h = list_h->next_up;
							times--;
						}
						for (int j=1;j <= (times%5);j++)
						{
							list_h = list_h->next_up;
							times--;
						}
						list_h = list_h->next_up;
						times--;
					}
			
					}
				}			
				//Dlg.DoModal();
			
			}
				
			} // end while
			delete node;			
			delete list_h;
				
		} // end of can found .his file
	
		_findclose( hFile );

	} // end of check for target histogram

}

ToScreen CDibView::InitHistogram(ToScreen bu)
{
// INITIAL BUFFER OF HISTOGRAM TO 0
	for (int ih = 0;ih < 19;++ih)
		bu.hue[ih]=0;
	for (int is = 0;is < 5;++is)
		bu.sat[is]=0;
	for (int iv = 0;iv < 5;++iv)
		bu.val[iv]=0;
	for (int ig =0;ig <6;++ig)
		bu.gra[ig] = 0;
// END INITIAL BUFFER OF HISTOGRAM OT 0
	return bu;
}

CString CDibView::CountHistogram(ToScreen hisbuff)
{
	CString histogram;
	char temp[10];
	
	for (int hcount = 0;hcount<19;++hcount)
	{ 
		histogram += _itoa(hisbuff.hue[hcount],temp,10);
		histogram += "|";
	}		
		histogram += " ";
	for (int scount = 0;scount<4;++scount)
	{
		histogram += _itoa(hisbuff.sat[scount],temp,10);
		histogram += "|";
	}
		histogram += " ";
	for (int vcount = 0;vcount<4;++vcount)
	{
		histogram += _itoa(hisbuff.val[vcount],temp,10);
		histogram += "|";
	}
		histogram += " ";
	for (int gcount = 0;gcount<5;++gcount)
	{
		histogram += _itoa(hisbuff.gra[gcount],temp,10);
		histogram += "|";
	}
	//	histogram += " ";
	histogram += "*";
	return histogram;
}

void CDibView::OnToolDatabase() 
{
	//m_database = !m_database;
	m_database = true;
	Rgbvalue();
	m_database = false;
}

void CDibView::OnOptionSetboxcolor() 
{
	CColorDialog dlgColor(boxColor);
	if (dlgColor.DoModal() == IDOK)
	{
		boxColor = dlgColor.GetColor();
		Invalidate();
	}	
}

void CDibView::OnOptionRotatebox() 
{
/*	int height = boxHeight;
	boxHeight = boxWidth;
	boxWidth = height;
	Invalidate();
*/
}

float CDibView::HisIntersectAVG(double target_buff[32],double model_buff[32])
{
		// HISTOGRAM INTERSECTION AVG 1
			int order = 0 ;
			double mini_val = 0;
			double total_min = 0;
			double total_model = 0;
			while (order < 32)  //real is 31 count from 0
			{
				if((order != 18)||(order != 22)||(order != 26)||(order != 31))
				{
					total_model = total_model + model_buff[++order]; // min of model
					mini_val = min(target_buff[order],model_buff[order]); // min of model and target
					total_min = total_min + mini_val;   // total of model and target compare
				}
			}
			float Ma ;
			Ma =  (float)total_min/(float)total_model;
			return Ma;
		// END HISTOGRAM INTERSECTION AVG 1	

}

float CDibView::HisIntersectH(double target_buff[19],double model_buff[19])
{
			int order = 0 ;
			double mini_val = 0;
			double total_min = 0;
			double total_model = 0;
			while (order <= 17)  //real is 18
			{
					total_model = total_model + model_buff[order]; // min of model
					mini_val = min(target_buff[order],model_buff[order]); // min of model and target
					total_min = total_min + mini_val;   // total of model and target compare
					order++;
			}
			//total_model = total_model + model_buff[order];
			float Mh ;
			Mh =  (float)total_min/(float)total_model;
			return Mh;
}


int CDibView::asctoint(char cnum)
{
	int total = 0;
	total = 10*total+(cnum-'0');
	return total;
}

void CDibView::GetThreshold()
{
	CThreshold tdlg;
	tdlg.m_threshold = origin;

	if	(tdlg.DoModal() == IDOK)
	{	
		threshold = atoi(tdlg.m_threshold);
		show = TRUE;
		if (threshold > 100)
		{
			CString msg;
			msg = "Threshold can't more than 100!\n Threshold set to default ";
			msg += origin;		msg += "%.";
			AfxMessageBox(msg);
			threshold = atoi(origin);
				//tdlg.m_threshold = origin;
				//Invalidate();
				//threshold = atoi(tdlg.m_threshold);
		}			
	}
	else
		show = FALSE;
}

void CDibView::OnElementCircle() 
{
	CDibDoc* pDoc = GetDocument();
	pDoc->m_SelectElement = 2;
	
}

void CDibView::OnUpdateElementCircle(CCmdUI* pCmdUI) 
{
	CDibDoc* pDoc = GetDocument();
	pCmdUI->SetCheck(pDoc->m_SelectElement==2);
	
}

void CDibView::OnElementRectangle() 
{
	CDibDoc* pDoc = GetDocument();
	pDoc->m_SelectElement = 1;
	
}

void CDibView::OnUpdateElementRectangle(CCmdUI* pCmdUI) 
{
	CDibDoc* pDoc = GetDocument();
	pCmdUI->SetCheck(pDoc->m_SelectElement==1);
	
}

void CDibView::OnLButtonUp(UINT nFlags, CPoint point) 
{
	////////////////////////////////////////////////////////////
	// dieo modify capture mouse message and check outoff bround
	////////////////////////////////////////////////////////////
	if(this == GetCapture())
		ReleaseCapture();	//Stop capturing mouse message
	// end dieo modify

	//CScrollView::OnLButtonUp(nFlags, point);
}

void CDibView::OnMatchingColoronly() 
{
	// dieo modify
	CDibDoc* pDoc = GetDocument();
	pDoc->m_SelectMatching = 1;
	OnToolMatching();
	
}

void CDibView::OnMatchingSegment() 
{
	// dieo modify
	CDibDoc* pDoc = GetDocument();
	pDoc->m_SelectMatching = 2;
	OnToolMatching();
}

void CDibView::OnMatchingSegmentandrotation() 
{
	// dieo modify
	CDibDoc* pDoc = GetDocument();
	pDoc->m_SelectMatching = 3;
	OnToolMatching();
}
//dieo modify
void CDibView::OnElementSelectall() 
{
	CClientDC aDC(this);

	CDibDoc* pDoc = GetDocument();
	HDIB hDIB = pDoc->GetHDIB();
	LPSTR lpDIB = (LPSTR) ::GlobalLock((HGLOBAL) hDIB);
	int width = (int) ::DIBWidth(lpDIB);         // Size of DIB - x
	int height = (int) ::DIBHeight(lpDIB);        // Size of DIB - y
	::GlobalUnlock((HGLOBAL) hDIB);
		
	pDoc->m_SelectAll = true;
	pDoc->m_SelectElement = 1;
	
	pDoc->start_point.x = 1;
	pDoc->start_point.y = 1;
	pDoc->end_point.x = width-1;
	pDoc->end_point.y = height-1;
	
	OnDraw(&aDC);	
}
//end dieo modify

void CDibView::OnSelectdbSelectusedb() 
{
	CSelectDB sel;
	sel.m_EditData = nameDB;
	sel.DoModal();
	nameDB = sel.m_EditData;
}
