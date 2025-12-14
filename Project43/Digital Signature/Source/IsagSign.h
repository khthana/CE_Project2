// IsagSign.h : main header file for the ISAGSIGN application
//

#if !defined(AFX_ISAGSIGN_H__8A5F6385_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
#define AFX_ISAGSIGN_H__8A5F6385_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_

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
// CIsagSignApp:
//

class CIsagSignApp : public CWinApp
{
public:
	COleTemplateServer m_server;
	CWnd *m_pIpFrame;
	IStorage *m_pStorage;
	IStream *m_pStream;
	IDataObject *m_pDataOb;
	CIsagSig m_isagsig;
	CString m_user;
	HBITMAP m_pic;

	CIsagSignApp();
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
	HCRYPTKEY putUserKey(BYTE* buff, DWORD len);
	
	// ********************* Check Error ***************************
	
	static void chkSTGresult(HRESULT hresult)
	{	if (hresult == S_OK) AfxMessageBox("OK");
		else if (hresult == STG_E_FILENOTFOUND) AfxMessageBox("1");
		else if (hresult == STG_E_ACCESSDENIED) AfxMessageBox("2");
		else if (hresult == STG_E_LOCKVIOLATION) AfxMessageBox("3");
		else if (hresult == STG_E_SHAREVIOLATION) AfxMessageBox("4");
		else if (hresult == STG_E_FILEALREADYEXISTS) AfxMessageBox("5");
		else if (hresult == STG_E_TOOMANYOPENFILES) AfxMessageBox("6");
		else if (hresult == STG_E_INSUFFICIENTMEMORY) AfxMessageBox("7");
		else if (hresult == STG_E_INVALIDNAME) AfxMessageBox("8");
		else if (hresult == STG_E_INVALIDPOINTER) AfxMessageBox("9");
		else if (hresult == STG_E_INVALIDFLAG) AfxMessageBox("10");
		else if (hresult == STG_E_INVALIDFUNCTION) AfxMessageBox("11");
		else if (hresult == STG_E_OLDFORMAT) AfxMessageBox("12");
		//else if (hresult == STG_E_NOTSIMPLEFORMAT) AfxMessageBox("13");
		else if (hresult == STG_E_OLDDLL) AfxMessageBox("14");
		else if (hresult == STG_E_PATHNOTFOUND) AfxMessageBox("15");
	}

	static void chkSigresult(DWORD hresult)
	{	if (hresult == ERROR_INVALID_HANDLE) AfxMessageBox("0");
		else if (hresult == ERROR_INVALID_PARAMETER) AfxMessageBox("1");
		else if (hresult == NTE_BAD_FLAGS) AfxMessageBox("2");
		else if (hresult == NTE_BAD_HASH) AfxMessageBox("3");
		else if (hresult == NTE_BAD_KEY) AfxMessageBox("4");
		else if (hresult == NTE_BAD_SIGNATURE) AfxMessageBox("5");
		else if (hresult == NTE_BAD_UID) AfxMessageBox("6");
		else if (hresult == NTE_NO_MEMORY) AfxMessageBox("7");
	}




// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CIsagSignApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CIsagSignApp)
	afx_msg void OnAppAbout();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

extern CIsagSignApp NEAR theApp;
/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ISAGSIGN_H__8A5F6385_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
