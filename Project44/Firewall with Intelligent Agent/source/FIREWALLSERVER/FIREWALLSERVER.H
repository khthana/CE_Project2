// FirewallServer.h : main header file for the FIREWALLSERVER application
//

#if !defined(AFX_FIREWALLSERVER_H__8D5C4C60_6FF3_4479_B294_B95938ADCADA__INCLUDED_)
#define AFX_FIREWALLSERVER_H__8D5C4C60_6FF3_4479_B294_B95938ADCADA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols
class CMasterAgent;

/////////////////////////////////////////////////////////////////////////////
// CFirewallServerApp:
// See FirewallServer.cpp for the implementation of this class
//

class CFirewallServerApp : public CWinApp
{
public:
	void SendLogRequest(CString clientIP);
	void StopFilter(CString clientIP);
	void SendRuleSet(CString clientIP);
	CFirewallServerApp();
	CDatabase m_db;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirewallServerApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CFirewallServerApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
protected:
	CMasterAgent* m_pMasterAgent;
};
extern CFirewallServerApp theApp;


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIREWALLSERVER_H__8D5C4C60_6FF3_4479_B294_B95938ADCADA__INCLUDED_)
