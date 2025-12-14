#if !defined(AFX_MACDB_H__08FB4EA6_557F_4234_8D51_5677A4C88450__INCLUDED_)
#define AFX_MACDB_H__08FB4EA6_557F_4234_8D51_5677A4C88450__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// MacDB.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CMacDB DAO recordset

//##ModelId=3E9ABEEA014E
class CMacDB : public CDaoRecordset
{
public:
	//##ModelId=3E9ABEEA0163
	CMacDB(CDaoDatabase* pDatabase = NULL);
	DECLARE_DYNAMIC(CMacDB)

// Field/Param Data
	//{{AFX_FIELD(CMacDB, CDaoRecordset)
	//##ModelId=3E9ABEEA015A
	CString	m_Company_id;
	//##ModelId=3E9ABEEA0159
	CString	m_Organization;
	//}}AFX_FIELD

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMacDB)
	public:
	//##ModelId=3E9ABEEA0162
	virtual CString GetDefaultDBName();		// Default database name
	//##ModelId=3E9ABEEA0160
	virtual CString GetDefaultSQL();		// Default SQL for Recordset
	//##ModelId=3E9ABEEA015E
	virtual void DoFieldExchange(CDaoFieldExchange* pFX);  // RFX support
	//}}AFX_VIRTUAL

// Implementation
#ifdef _DEBUG
	//##ModelId=3E9ABEEA015D
	virtual void AssertValid() const;
	//##ModelId=3E9ABEEA015B
	virtual void Dump(CDumpContext& dc) const;
#endif
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MACDB_H__08FB4EA6_557F_4234_8D51_5677A4C88450__INCLUDED_)
