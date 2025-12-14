#if !defined(AFX_ADD_H__86A2770B_671A_4E60_8DB2_770F079DB393__INCLUDED_)
#define AFX_ADD_H__86A2770B_671A_4E60_8DB2_770F079DB393__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Add.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CAdd dialog

class CAdd : public CDialog
{
// Construction
public:
	CAdd(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CAdd)
	enum { IDD = IDD_ADD_DIALOG };
	CString	m_addvocab;
	CString	m_addeadj;
	CString	m_addeadv;
	CString	m_addenoun;
	CString	m_addeprep;
	CString	m_addeverb;
	CString	m_addtadj;
	CString	m_addtadv;
	CString	m_addtnoun;
	CString	m_addtprep;
	CString	m_addtverb;
	CString	m_addeconj;
	CString	m_addeint;
	CString	m_addepron;
	CString	m_addtconj;
	CString	m_addtint;
	CString	m_addtpron;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAdd)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CAdd)
	afx_msg void OnAddok();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ADD_H__86A2770B_671A_4E60_8DB2_770F079DB393__INCLUDED_)
