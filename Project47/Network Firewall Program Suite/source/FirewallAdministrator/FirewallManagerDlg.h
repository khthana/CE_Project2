// FirewallManagerDlg.h : header file
//

#if !defined(AFX_FIREWALLMANAGERDLG_H__2A58928B_1042_4D1E_9CC1_8EB03AC98A5B__INCLUDED_)
#define AFX_FIREWALLMANAGERDLG_H__2A58928B_1042_4D1E_9CC1_8EB03AC98A5B__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "ADConnect.h"
#include "sockUtil.h"
#include "RuleManage.h"

/////////////////////////////////////////////////////////////////////////////
// CFirewallManagerDlg dialog

class CFirewallManagerDlg : public CDialog
{
// Construction
public:
	CFirewallManagerDlg(CWnd* pParent = NULL);	// standard constructor
	ADConnect ADCon;

	CString GetUser();
	CString GetUserDN();
	CString dwAddressToString(DWORD dwAddress);

	void GetDataFromAD();
	void ListMemberOf();
	void AddRuleToList(	unsigned long srcIp, 
						unsigned long srcMask,
						unsigned short srcPort, 
						unsigned long dstIp, 
						unsigned long dstMask,
						unsigned short dstPort, 
						unsigned int protocol, 
						int action );
	void UpdateList();
	void AddRule();
	void BreakLongRule(CString sLongRule);
	void IPStringToIPBYTE(CString sIP);

	int SetPosition(int);

// Dialog Data
	//{{AFX_DATA(CFirewallManagerDlg)
	enum { IDD = IDD_FIREWALLMANAGER_DIALOG };
	CIPAddressCtrl	m_cSrcMask;
	CIPAddressCtrl	m_cSrcAddr;
	CIPAddressCtrl	m_cDstMask;
	CIPAddressCtrl	m_cDstAddr;
	CListCtrl	m_cListRuleOfGroup;
	CListBox	m_cListGroup;
	CString	m_sNumberOfGroup;
	CString	m_sNumberOfRule;
	CString	m_sAction;
	CString	m_sProtocol;
	CString	m_sDstPort;
	CString	m_sSrcPort;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirewallManagerDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	BOOL bEditRule;				// Check First Click Add Rule Button
	CRuleManage* ruleManage;
	BYTE ip01,ip02,ip03,ip04;

	int iFWGroupNo;
	int iFWGroupAll;
	int iADGroupAll;
	int iADGroupBegin;
	int iADGroupNo;
	int iCountRule;
	int iRulePosition;

	CString sAllowAll;
	CString sDenyAll;

	CString sUserName;
	CString sUserDN;

	CStringArray rmDistinguishedName;
	CStringArray gName;
	CStringArray gDistinguishedName;

	CString sSrcAddress;
	CString sSrcMask;
	CString sSrcPort;
	CString sDstAddress;
	CString sDstMask;
	CString sDstPort;
	CString sProtocol;
	CString sAction;

	CString sServerAddress;
	CString sServerRuleIn;
	CString sServerRuleOut;

	unsigned long srcIp;
	unsigned long srcMask;
	unsigned short srcPort;
	unsigned long dstIp;
	unsigned long dstMask;
	unsigned short dstPort;
	unsigned int protocol;
	int iAction;

	// Generated message map functions
	//{{AFX_MSG(CFirewallManagerDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnSelchangeListboxGroup();
	afx_msg void OnButtonAddRule();
	afx_msg void OnButtonEditRule();
	afx_msg void OnButtonDeleteRule();
	afx_msg void OnButtonDefaultRule();
	afx_msg void OnButtonClearRule();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()


};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIREWALLMANAGERDLG_H__2A58928B_1042_4D1E_9CC1_8EB03AC98A5B__INCLUDED_)
