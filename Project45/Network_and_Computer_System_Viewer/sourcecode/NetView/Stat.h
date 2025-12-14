#if !defined(AFX_STAT_H__3B702070_C909_46F8_AD3F_249ED4C6973E__INCLUDED_)
#define AFX_STAT_H__3B702070_C909_46F8_AD3F_249ED4C6973E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Stat.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CStat DAO recordset

//##ModelId=3E9ABEE40312
class CStat : public CDaoRecordset
{
public:
	//##ModelId=3E9ABEE40327
	CStat(CDaoDatabase* pDatabase = NULL);
	DECLARE_DYNAMIC(CStat)

// Field/Param Data
	//{{AFX_FIELD(CStat, CDaoRecordset)
	//##ModelId=3E9ABEE4031E
	CString	m_IP;
	//##ModelId=3E9ABEE4031D
	CString	m_Time;
	//##ModelId=3E9ABEE4031C
	CString	m_Date;
	//}}AFX_FIELD

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CStat)
	public:
	//##ModelId=3E9ABEE40326
	virtual CString GetDefaultDBName();		// Default database name
	//##ModelId=3E9ABEE40324
	virtual CString GetDefaultSQL();		// Default SQL for Recordset
	//##ModelId=3E9ABEE40322
	virtual void DoFieldExchange(CDaoFieldExchange* pFX);  // RFX support
	//}}AFX_VIRTUAL

// Implementation
#ifdef _DEBUG
	//##ModelId=3E9ABEE40321
	virtual void AssertValid() const;
	//##ModelId=3E9ABEE4031F
	virtual void Dump(CDumpContext& dc) const;
#endif
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STAT_H__3B702070_C909_46F8_AD3F_249ED4C6973E__INCLUDED_)
