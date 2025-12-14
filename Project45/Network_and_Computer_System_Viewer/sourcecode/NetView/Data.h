#if !defined(AFX_DATA_H__28E033BA_751A_4B13_AE39_FF34F56F63CD__INCLUDED_)
#define AFX_DATA_H__28E033BA_751A_4B13_AE39_FF34F56F63CD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Data.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CData DAO recordset

//##ModelId=3E9ABEE900C1
class CData : public CDaoRecordset
{
public:
	//##ModelId=3E9ABEE900E2
	CData(CDaoDatabase* pDatabase = NULL);
	DECLARE_DYNAMIC(CData)

// Field/Param Data
	//{{AFX_FIELD(CData, CDaoRecordset)
	//##ModelId=3E9ABEE900D8
	long	m_ID;
	//##ModelId=3E9ABEE900D7
	CString	m_IP;
	//##ModelId=3E9ABEE900D6
	CString	m_Host;
	//##ModelId=3E9ABEE900D5
	long	m_Id_subnet;
	//##ModelId=3E9ABEE900D2
	long	m_OS;
	//##ModelId=3E9ABEE900D1
	CString	m_OSName;
	//##ModelId=3E9ABEE900D0
	CString	m_Mac;
	//##ModelId=3E9ABEE900CF
	CString	m_OpenPort;
	//##ModelId=3E9ABEE900CE
	long	m_Nimda;
	//##ModelId=3E9ABEE900CD
	long	m_Snmp;
	//##ModelId=3E9ABEE900CC
	long	m_Share;
	//}}AFX_FIELD

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CData)
	public:
	//##ModelId=3E9ABEE900E1
	virtual CString GetDefaultDBName();		// Default database name
	//##ModelId=3E9ABEE900E0
	virtual CString GetDefaultSQL();		// Default SQL for Recordset
	//##ModelId=3E9ABEE900DC
	virtual void DoFieldExchange(CDaoFieldExchange* pFX);  // RFX support
	//}}AFX_VIRTUAL

// Implementation
#ifdef _DEBUG
	//##ModelId=3E9ABEE900DB
	virtual void AssertValid() const;
	//##ModelId=3E9ABEE900D9
	virtual void Dump(CDumpContext& dc) const;
#endif
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DATA_H__28E033BA_751A_4B13_AE39_FF34F56F63CD__INCLUDED_)
