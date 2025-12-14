// Signature.h : main header file for the SIGNATURE application
//

#if !defined(AFX_SIGNATURE_H__F65842E7_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_)
#define AFX_SIGNATURE_H__F65842E7_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#define _WIN32_WINNT 0x0400

#include "resource.h"       // main symbols
#include "wincrypt.h"
#include "isagsig.h"

/////////////////////////////////////////////////////////////////////////////
// CSignatureApp:
// See Signature.cpp for the implementation of this class
//

class CSignatureApp : public CWinApp
{
public:

	CWnd *m_pIpFrame;
	IStorage *m_pStorage;
	IStream *m_pStream;
	IDataObject *m_pDataOb;
	COleDataObject pObject;
	CIsagSig m_isagsig;
	CString m_user;
	HBITMAP m_pic;

	CSignatureApp();
	void InitRegistry();
	bool addUser(CString name, CString surname, BYTE algid, BYTE sigsize, CString picfile);
	bool addUserKey(CString name, CString surname, BYTE sigsize);

	bool deleteUser(CString name);
	bool deleteUserKey(CString name);

	bool LoadPicFile(CString user);

	HKEY hasUser(CString name);
	bool createReg(CString name);
	bool setRegVal(CString name, LPTSTR valname, DWORD type,
		BYTE *pdata, DWORD datalen);
	BYTE* getRegVal(CString name, CString valname, DWORD type,
		DWORD* pdatalen);
		
	BYTE* getUserKey(CString name, DWORD *plen);
	//HCRYPTKEY putUserKey(BYTE* buff, DWORD len);
	

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSignatureApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	COleTemplateServer m_server;
	//{{AFX_MSG(CSignatureApp)
	afx_msg void OnAppAbout();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

extern CSignatureApp NEAR theApp;
/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SIGNATURE_H__F65842E7_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_)
