#if !defined(AFX_DLGMAIN_H__37975248_B02E_4F5B_902D_868E65B3BCAB__INCLUDED_)
#define AFX_DLGMAIN_H__37975248_B02E_4F5B_902D_868E65B3BCAB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgMain.h : header file
//
#include "winioctl.h"

#include "ADConnect.h"
#include "RuleManage.h"
#include "PacketFilter.h"

#include "TDriver.h"
#include "Driver\FwHookDrv.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgMain dialog

class CDlgMain : public CDialog
{
// Construction
public:
	CDlgMain(CWnd* pParent = NULL);   // standard constructor
	~CDlgMain();   // destructor

	BOOL OnInitDialog();

	CString GetUser();
	CString GetUserDN();
	void ListMemberOf();

	BOOL StopFilter();
	BOOL StartFilter();	

	CRuleManage* ruleGroup;

// Dialog Data
	//{{AFX_DATA(CDlgMain)
	enum { IDD = IDD_DIALOG_MAIN };
	CListBox	m_cListGroup;
	CListBox	m_cListLog;
	CString	m_sUserName;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgMain)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CRuleManage* ruleFilter;

	ADConnect ADCon;

	CString sUserName;
	CString sUserDN;
	CString sGroup;

	CStringArray saADGroup;
	CStringArray saGroupRule;

	void AddGroupRule();

	CString sSrcAddress;
	CString sSrcMask;
	CString sSrcPort;
	CString sDstAddress;
	CString sDstMask;
	CString sDstPort;
	CString sProtocol;
	CString sAction;

	unsigned long srcIp;
	unsigned long srcMask;
	unsigned short srcPort;
	unsigned long dstIp;
	unsigned long dstMask;
	unsigned short dstPort;
	unsigned int protocol;
	int iAction;

	BOOL AddFilterToFw(unsigned long srcIp, 
					   unsigned long srcMask,
					   unsigned short srcPort, 
					   unsigned long dstIp,
					   unsigned long dstMask,
					   unsigned short dstPort,
					   unsigned int protocol,
					   int action);

	TDriver filterDriver;

	BOOL AddNidsRule(CString Src);

	// Generated message map functions
	//{{AFX_MSG(CDlgMain)
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	int iDefaultAction;
	void OnStop();
	void OnStart();

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGMAIN_H__37975248_B02E_4F5B_902D_868E65B3BCAB__INCLUDED_)
