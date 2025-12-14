// FirewallAgent.h : main header file for the FIREWALLAGENT application
//

#if !defined(AFX_FIREWALLAGENT_H__6DD8BB75_EDCA_46E1_B228_8EC70CD3FFE2__INCLUDED_)
#define AFX_FIREWALLAGENT_H__6DD8BB75_EDCA_46E1_B228_8EC70CD3FFE2__INCLUDED_

#include "SlaveAgent.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols
#include "W2kFilter.h"	// Added by ClassView

/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentApp:
// See FirewallAgent.cpp for the implementation of this class
//

#define MASTER_IP "203.151.227.16"   // This must have been changed everytime that 
                                   // Server has been changed IP

class CFirewallAgentApp : public CWinApp
{
public:
	CString GetStatsString();
	BOOL StopFilter();
	CObList* LoadLocalRuleSet();
	void SaveLocalRuleSet(CObList* ruleSet);
	BOOL OnStartFilter(CObList* ruleSet);
	CFirewallAgentApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirewallAgentApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CFirewallAgentApp)
	afx_msg void OnAppAbout();
	afx_msg void OnFileOpen();
	afx_msg void OnStartFilter();
	afx_msg void OnStopFilter();
	afx_msg void OnGoOnline();
	afx_msg void OnShowLog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
protected:
	CW2kFilter *m_FilterEngine;
	CSlaveAgent *m_ClientAgent;
private:
	NOTIFYICONDATA m_SystemTray;
};

extern CFirewallAgentApp theApp;



/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIREWALLAGENT_H__6DD8BB75_EDCA_46E1_B228_8EC70CD3FFE2__INCLUDED_)
