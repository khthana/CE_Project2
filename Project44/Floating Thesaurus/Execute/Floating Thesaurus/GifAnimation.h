#if !defined(AFX_GIFANIMATION_H__868E5C78_824B_45E1_93B7_D0CEF9B56871__INCLUDED_)
#define AFX_GIFANIMATION_H__868E5C78_824B_45E1_93B7_D0CEF9B56871__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// GifAnimation.h : header file
//

#include "PictureEx.h"	// Added by ClassView
/////////////////////////////////////////////////////////////////////////////
// CGifAnimation dialog

class CGifAnimation : public CDialog
{
// Construction
public:
	CGifAnimation(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CGifAnimation)
	enum { IDD = IDD_GIF_DIALOG };
	CPictureEx	m_picture;
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CGifAnimation)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HCURSOR hCursor;
	HICON m_hIcon;
	CFont m_Font;

	// Generated message map functions
	//{{AFX_MSG(CGifAnimation)
	virtual BOOL OnInitDialog();
	afx_msg void OnMouseHover();
	afx_msg BOOL OnSetCursor(CWnd* pWnd, UINT nHitTest, UINT message);
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	virtual void OnOK();
	virtual void OnCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_GIFANIMATION_H__868E5C78_824B_45E1_93B7_D0CEF9B56871__INCLUDED_)
