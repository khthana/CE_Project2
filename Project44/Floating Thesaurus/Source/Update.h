#if !defined(AFX_UPDATE_H__3CF9AA27_188A_4BF2_B499_8CB384AB97F4__INCLUDED_)
#define AFX_UPDATE_H__3CF9AA27_188A_4BF2_B499_8CB384AB97F4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Update.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CUpdate dialog

class CUpdate : public CDialog
{
// Construction
public:
	CUpdate(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CUpdate)
	enum { IDD = IDD_UPDATE_DIALOG };
	CString	m_upadj;
	CString	m_upvocab;
	CString	m_upeadv;
	CString	m_upeadj;
	CString	m_upenoun;
	CString	m_upeprep;
	CString	m_upeverb;
	CString	m_uptadj;
	CString	m_uptadv;
	CString	m_uptnoun;
	CString	m_uptprep;
	CString	m_uptverb;
	CString	m_upeconj;
	CString	m_upeint;
	CString	m_upepron;
	CString	m_uptconj;
	CString	m_uptint;
	CString	m_uptpron;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CUpdate)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CUpdate)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_UPDATE_H__3CF9AA27_188A_4BF2_B499_8CB384AB97F4__INCLUDED_)
