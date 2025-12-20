// ImgProc.h : main header file for the IMGPROC application
//

#if !defined(AFX_IMGPROC_H__E1DE38E8_2D02_402A_87B8_378FF846FD3C__INCLUDED_)
#define AFX_IMGPROC_H__E1DE38E8_2D02_402A_87B8_378FF846FD3C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols
//#include "Settings.h"

/////////////////////////////////////////////////////////////////////////////
// CImgProcApp:
// See ImgProc.cpp for the implementation of this class
//

class CImgProcApp : public CWinApp
{
public:
	CImgProcApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CImgProcApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CImgProcApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_IMGPROC_H__E1DE38E8_2D02_402A_87B8_378FF846FD3C__INCLUDED_)
