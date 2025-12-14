// LogMonitorSet.h : interface of the CLogMonitorSet class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_LOGMONITORSET_H__E3802FB8_AD18_48B8_AF5B_FA6647D4765C__INCLUDED_)
#define AFX_LOGMONITORSET_H__E3802FB8_AD18_48B8_AF5B_FA6647D4765C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CLogMonitorSet : public CRecordset
{
public:
	CLogMonitorSet(CDatabase* pDatabase = NULL);
	DECLARE_DYNAMIC(CLogMonitorSet)

// Field/Param Data
	//{{AFX_FIELD(CLogMonitorSet, CRecordset)
	CString	m_AttackType;
	CString	m_AttackDate;
	CString	m_AttackTime;
	CString	m_Group;
	CString	m_AttackDst;
	CString	m_AttackSrc;
	long	m_LogNo;
	CString	m_User;
	//}}AFX_FIELD

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLogMonitorSet)
	public:
	virtual CString GetDefaultConnect();	// Default connection string
	virtual CString GetDefaultSQL(); 	// default SQL for Recordset
	virtual void DoFieldExchange(CFieldExchange* pFX);	// RFX support
	//}}AFX_VIRTUAL

// Implementation
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LOGMONITORSET_H__E3802FB8_AD18_48B8_AF5B_FA6647D4765C__INCLUDED_)

