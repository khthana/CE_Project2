#if !defined(AFX_HANGRESULT_H__5D242541_C561_4E2F_9965_8C6FC5BFE995__INCLUDED_)
#define AFX_HANGRESULT_H__5D242541_C561_4E2F_9965_8C6FC5BFE995__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// HangResult.h : header file
//
#include "PictureEx.h"

/////////////////////////////////////////////////////////////////////////////
// CHangResult dialog

class CHangResult : public CDialog
{
// Construction
public:
	CHangResult(CWnd* pParent = NULL);   // standard constructor
	CHangResult(int w, int l, CWnd* pParent = NULL);
	
// Dialog Data
	//{{AFX_DATA(CHangResult)
	enum { IDD = IDD_RESULT_DIALOG };
	CStatic	m_cwin;
	CStatic	m_close;
	CStatic	m_call;
	CPictureEx m_picture;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CHangResult)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

private:
	int all;
	int win;
	int lose;
	
// Implementation
protected:
	CString SetFormatInt(int i);

	// Generated message map functions
	//{{AFX_MSG(CHangResult)
	virtual BOOL OnInitDialog();
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_HANGRESULT_H__5D242541_C561_4E2F_9965_8C6FC5BFE995__INCLUDED_)
