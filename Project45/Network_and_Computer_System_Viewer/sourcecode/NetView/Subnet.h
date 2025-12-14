#if !defined(AFX_SUBNET_H__C1419CDC_D0C8_43C0_9188_B6E4BB8D8A62__INCLUDED_)
#define AFX_SUBNET_H__C1419CDC_D0C8_43C0_9188_B6E4BB8D8A62__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Subnet.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSubnet DAO recordset

//##ModelId=3E9ABEE701FE
class CSubnet : public CDaoRecordset
{
public:
	//##ModelId=3E9ABEE70214
	CSubnet(CDaoDatabase* pDatabase = NULL);
	DECLARE_DYNAMIC(CSubnet)

// Field/Param Data
	//{{AFX_FIELD(CSubnet, CDaoRecordset)
	//##ModelId=3E9ABEE7020A
	long	m_ID;
	//##ModelId=3E9ABEE70209
	CString	m_Subnet;
	//}}AFX_FIELD

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSubnet)
	public:
	//##ModelId=3E9ABEE70213
	virtual CString GetDefaultDBName();		// Default database name
	//##ModelId=3E9ABEE70212
	virtual CString GetDefaultSQL();		// Default SQL for Recordset
	//##ModelId=3E9ABEE7020E
	virtual void DoFieldExchange(CDaoFieldExchange* pFX);  // RFX support
	//}}AFX_VIRTUAL

// Implementation
#ifdef _DEBUG
	//##ModelId=3E9ABEE7020D
	virtual void AssertValid() const;
	//##ModelId=3E9ABEE7020B
	virtual void Dump(CDumpContext& dc) const;
#endif
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SUBNET_H__C1419CDC_D0C8_43C0_9188_B6E4BB8D8A62__INCLUDED_)
