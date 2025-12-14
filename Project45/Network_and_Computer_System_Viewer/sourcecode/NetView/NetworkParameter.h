#if !defined(AFX_NETWORKPARAMETER_H__F16C09E4_10FF_456B_A570_CF4D7D17A22A__INCLUDED_)
#define AFX_NETWORKPARAMETER_H__F16C09E4_10FF_456B_A570_CF4D7D17A22A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// NetworkParameter.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CNetworkParameter dialog

//##ModelId=3E9ABEE5030A
class CNetworkParameter : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEE50379
	void OnRefresh();
	//##ModelId=3E9ABEE50372
	CNetworkParameter(CWnd* pParent = NULL);   // standard constructor
//	BOOL Create();
	//##ModelId=3E9ABEE50371
	void FindOS();
	//##ModelId=3E9ABEE50370
	void Listhost();
	//##ModelId=3E9ABEE5036F
	void ListPort();
// Dialog Data
	//{{AFX_DATA(CNetworkParameter)
	enum { IDD = IDD_ScanParam };
	//##ModelId=3E9ABEE50348
	CEdit	m_Edit5;
	//##ModelId=3E9ABEE5033E
	CEdit	m_Edit4;
	//##ModelId=3E9ABEE50337
	CEdit	m_Edit3;
	//##ModelId=3E9ABEE50332
	CEdit	m_Edit2;
	//##ModelId=3E9ABEE5032A
	CEdit	m_Edit1;
	//##ModelId=3E9ABEE50320
	CIPAddressCtrl	m_IP2;
	//##ModelId=3E9ABEE5031B
	CIPAddressCtrl	m_IP1;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNetworkParameter)
	protected:
	//##ModelId=3E9ABEE50368
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//##ModelId=3E9ABEE50367
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
protected:
	//##ModelId=3E9ABEE50316
	CWnd* m_pParent;
	//##ModelId=3E9ABEE5030C
	int m_nID;

	// Generated message map functions
	//{{AFX_MSG(CNetworkParameter)
	//##ModelId=3E9ABEE50366
	virtual void OnOK();
	//##ModelId=3E9ABEE50365
	virtual void OnCancel();
	//##ModelId=3E9ABEE50364
	afx_msg void OnSingle();
	//##ModelId=3E9ABEE5035D
	afx_msg void OnRange();
	//##ModelId=3E9ABEE5035C
	afx_msg void OnSubnet();
	//##ModelId=3E9ABEE5035B
	virtual BOOL OnInitDialog();
	//##ModelId=3E9ABEE5035A
	afx_msg void OnView();
	//##ModelId=3E9ABEE50350
	afx_msg void OnFieldchangedIpaddress1(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()


};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NETWORKPARAMETER_H__F16C09E4_10FF_456B_A570_CF4D7D17A22A__INCLUDED_)
