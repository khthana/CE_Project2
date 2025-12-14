// DictSet.h : interface of the CDictSet class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_DICTSET_H__1D87BEA0_E2A1_49DA_AE0E_F81EA349D2C3__INCLUDED_)
#define AFX_DICTSET_H__1D87BEA0_E2A1_49DA_AE0E_F81EA349D2C3__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CDictSet : public CDaoRecordset
{
public:
	CDictSet(CDaoDatabase* pDatabase = NULL);
	DECLARE_DYNAMIC(CDictSet)

// Field/Param Data
	//{{AFX_FIELD(CDictSet, CDaoRecordset)
	CString	m_code;
	CString	m_tenglish;
	CString	m_tsyn;
	CString	m_tant;
	CString	m_tword;
	CString	m_eword;
	//}}AFX_FIELD

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDictSet)
	public:
	virtual CString GetDefaultDBName();	// REVIEW:  Get a comment here
	virtual CString GetDefaultSQL(); 	// default SQL for Recordset
	virtual void DoFieldExchange(CDaoFieldExchange* pFX);	// RFX support
	//}}AFX_VIRTUAL

// Implementation
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DICTSET_H__1D87BEA0_E2A1_49DA_AE0E_F81EA349D2C3__INCLUDED_)

