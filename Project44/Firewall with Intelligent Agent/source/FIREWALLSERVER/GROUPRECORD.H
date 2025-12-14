#if !defined(AFX_GROUPRECORD_H__3F3C1869_7735_4873_8157_3678A5CF0DEB__INCLUDED_)
#define AFX_GROUPRECORD_H__3F3C1869_7735_4873_8157_3678A5CF0DEB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// GroupRecord.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CGroupRecord dialog

class CGroupRecord : public CDialog
{
// Construction
public:
	CGroupRecord(CWnd* pParent = NULL);   // standard constructor
	void getgroup(CString m_row);


// Dialog Data
	//{{AFX_DATA(CGroupRecord)
	enum { IDD = IDD_GROUPRECORD };
	CButton	m_bOK;
	CButton	m_bUpdate;
	CButton	m_bRuletab;
	CButton	m_bDelete;
	CButton	m_bAdd;
	CString	m_groupname;
	CString	m_group;
	CString	m_ruleset;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CGroupRecord)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CGroupRecord)
	afx_msg void OnAdd();
	virtual BOOL OnInitDialog();
	afx_msg void OnDelete();
	afx_msg void OnRuletab();
	afx_msg void OnUpdate();
	afx_msg void OnOk();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
    CString gp;
	CString gpname;
	CRecordset rs;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_GROUPRECORD_H__3F3C1869_7735_4873_8157_3678A5CF0DEB__INCLUDED_)
