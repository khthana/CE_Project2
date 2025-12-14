// Signature.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "Signature.h"

#include "MainFrm.h"
#include "IpFrame.h"
#include "SignatureDoc.h"
#include "SignatureView.h"
#include "WaitDlg.h"
#include "math.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSignatureApp

BEGIN_MESSAGE_MAP(CSignatureApp, CWinApp)
	//{{AFX_MSG_MAP(CSignatureApp)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
	//}}AFX_MSG_MAP
	// Standard file based document commands
	ON_COMMAND(ID_FILE_NEW, CWinApp::OnFileNew)
	ON_COMMAND(ID_FILE_OPEN, CWinApp::OnFileOpen)
	// Standard print setup command
	ON_COMMAND(ID_FILE_PRINT_SETUP, CWinApp::OnFilePrintSetup)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSignatureApp construction

CSignatureApp::CSignatureApp()
{
	m_user = "";
	m_pic = NULL;
	m_pDataOb = NULL;
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CSignatureApp object

CSignatureApp theApp;

static const CLSID clsid =
{ 0xf65842e3, 0xf2e, 0x11d6, { 0xbb, 0x32, 0x0, 0xe0, 0x7d, 0x3, 0x26, 0xbe } };

/////////////////////////////////////////////////////////////////////////////
// CSignatureApp initialization

BOOL CSignatureApp::InitInstance()
{
	InitRegistry();
	// Initialize OLE libraries
	if (!AfxOleInit())
	{
		AfxMessageBox(IDP_OLE_INIT_FAILED);
		return FALSE;
	}

	// Standard initialization

#ifdef _AFXDLL
	Enable3dControls();			// Call this when using MFC in a shared DLL
#else
	Enable3dControlsStatic();	// Call this when linking to MFC statically
#endif

	// Change the registry key under which our settings are stored.
	SetRegistryKey(_T("Local AppWizard-Generated Applications"));

	LoadStdProfileSettings();  // Load standard INI file options (including MRU)

	// Register document templates

	CSingleDocTemplate* pDocTemplate;
	pDocTemplate = new CSingleDocTemplate(
		IDR_MAINFRAME,
		RUNTIME_CLASS(CSignatureDoc),
		RUNTIME_CLASS(CMainFrame),       // main SDI frame window
		RUNTIME_CLASS(CSignatureView));
	pDocTemplate->SetServerInfo(
		IDR_SRVR_EMBEDDED, IDR_SRVR_INPLACE,
		RUNTIME_CLASS(CInPlaceFrame));
	AddDocTemplate(pDocTemplate);
	m_server.ConnectTemplate(clsid, pDocTemplate, TRUE);

	// Enable DDE Execute open
	EnableShellOpen();
	RegisterShellFileTypes(TRUE);

	// Parse command line for standard shell commands, DDE, file open
	CCommandLineInfo cmdInfo;
	ParseCommandLine(cmdInfo);

	if (cmdInfo.m_bRunEmbedded || cmdInfo.m_bRunAutomated)
	{
		COleTemplateServer::RegisterAll();

		// Application was run with /Embedding or /Automation.  Don't show the
		//  main window in this case.
		return TRUE;
	}

	m_server.UpdateRegistry(OAT_DOC_OBJECT_SERVER);
	COleObjectFactory::UpdateRegistryAll();

	// Dispatch commands specified on the command line
	if (!ProcessShellCommand(cmdInfo))
		return FALSE;
	
	m_pMainWnd->SetWindowText("ISAG SIGNATURE");
	m_pMainWnd->ShowWindow(SW_SHOW);
	m_pMainWnd->UpdateWindow();

	// Enable drag/drop open
	m_pMainWnd->DragAcceptFiles();

	return TRUE;
}


/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
		// No message handlers
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

// App command to run the dialog
void CSignatureApp::OnAppAbout()
{
	CAboutDlg aboutDlg;
	aboutDlg.DoModal();
}

/////////////////////////////////////////////////////////////////////////////
// CSignatureApp message handlers

//IsagSignature = IsagSign
// ************************* Init *******************************
void CSignatureApp::InitRegistry()
{	
	HKEY mainhk = NULL, hk = NULL;
	DWORD todo, signum;
//	SECURITY_DESCRIPTOR sd;

	todo = REG_CREATED_NEW_KEY;
//	InitializeSecurityDescriptor(&sd, SECURITY_DESCRIPTOR_REVISION);
//	SetSecurityDescriptorOwner(&sd, , TRUE);
	RegCreateKeyEx(HKEY_LOCAL_MACHINE, "Software\\IsagSignature",
		0, "IsagSignature", REG_OPTION_NON_VOLATILE, KEY_READ|KEY_WRITE,
		NULL, &mainhk, &todo);
	RegQueryInfoKey(mainhk, NULL, NULL, NULL, &signum, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL);
	if (signum == 0)
	{	
		addUser("IsagSignature", "", 1, 2, "");
		addUserKey("TEMP", "", 2);
	}
//	RegSetKeySecurity(mainhk, GROUP_SECURITY_INFORMATION, NULL);
//	RegCreateKeyEx(mainhk, "Test",
//		0, "", REG_OPTION_NON_VOLATILE, 0,
//		NULL, &mainhk, &todo);
//	RegSetValueEx(mainhk, "signum", 0, REG_DWORD, (BYTE *)&Val, sizeof(DWORD));
}

// ********************** Add New User *************************

bool CSignatureApp::addUser(CString name, CString surname, BYTE algid, BYTE sigsize, CString picfile)
{	
	HKEY mainhk = NULL, hk = NULL;
	CString kname;
	bool succ = false;
	CWaitDlg waitdlg;
	
	// Wait Dialog
	waitdlg.Create(IDD_WAIT, NULL);
	waitdlg.UpdateWindow();
	BeginWaitCursor();

	if (surname.GetLength() != 0) 
		kname = name+" "+surname;
	else 
		kname = name;
	if (createReg(kname) == true)
	{	
		if (addUserKey(name, surname, sigsize))
		{	
			setRegVal(kname, "Alg", REG_BINARY, &algid, 1);
			if (picfile != "")
			{	
				setRegVal(kname, "Picfile", REG_SZ, (BYTE *)(picfile.GetBuffer(0)), picfile.GetLength());
				if (m_isagsig.SignFile("IsagSignature", picfile, false))
				{	
					setRegVal(kname, "Flags", REG_BINARY, m_isagsig.GetSignVal(), m_isagsig.GetSignValLen());
				
				}
			}
			succ = true;
		}
		else // User Cancel during Create Key Container
		{	
			deleteUser(kname);
		}
	}
	EndWaitCursor();
	waitdlg.DestroyWindow();
	return succ;
}

bool CSignatureApp::addUserKey(CString name, CString surname, BYTE sigsize)
{   
	CString kname;
	HCRYPTPROV hProv;
	HCRYPTKEY hKey;
	
	unsigned char *szUserName = new unsigned char[100];//[100];
	char *temp = new char[100];
	DWORD dwUserNameLen = 100, SigLen;
	if (surname.GetLength() != 0) 
		kname = name+" "+surname;
	else 
		kname = name;
	
	if(!CryptAcquireContext(&hProv, kname, MS_DEF_PROV, PROV_RSA_FULL, 0))
	{	//Creating User Key Container
		if(!CryptAcquireContext(&hProv, kname, MS_DEF_PROV, PROV_RSA_FULL, CRYPT_NEWKEYSET))
		{	
			AfxMessageBox("Error during:\r\n\tCreate "+kname+"Key Container");
			return false;
		}
	}
   
	if(!CryptGetUserKey(hProv, AT_SIGNATURE, &hKey))
	{	// Create Signature Key Pair
		if(GetLastError() == NTE_NO_KEY)
		{	
			DWORD myflag = CRYPT_USER_PROTECTED;
			
			if (kname == "TEMP" || kname == "IsagSignature") 
				myflag = 0;
			
			// Change value from Dialog to number of bits.
			// And Shift it left 16 bit (4 char in HEX)
			SigLen = (DWORD)(pow(2, sigsize)*512*65536);
			if(!CryptGenKey(hProv,AT_SIGNATURE,SigLen|myflag,&hKey)) // 512 bytes
			{	
				AfxMessageBox("Error during:\r\n\tCreate Signature Key Pair");
				return false;
			
			}
			else
			{		
				CryptDestroyKey(hKey);		
			}
		}
		else
		{   
			AfxMessageBox("Error during:\r\n\tGet Signature Key Pair.");
			return false;
		}
	}
	if(!CryptGetUserKey(hProv, AT_KEYEXCHANGE, &hKey))
	{	
		//AfxMessageBox(hKey);
		if(GetLastError() == NTE_NO_KEY)
		{	
			if(!CryptGenKey(hProv,AT_KEYEXCHANGE,0,&hKey))
			{	
				AfxMessageBox("Error during:\r\n\tCreate Exchange Key Pair");
				return false;
			}
			else
			{	
				CryptDestroyKey(hKey);		
			}
		}
		else
		{   
			AfxMessageBox("Error during:\r\n\tGet Exchange Key Pair.");
			return false;
		}
	}

	CryptReleaseContext(hProv, 0);
	return true;
}

// ******************** Delete User **************************

bool CSignatureApp::deleteUser(CString name)
{
	HKEY mainhk = NULL, hk = NULL;
	DWORD todo;

	todo = REG_OPENED_EXISTING_KEY;
	RegCreateKeyEx(HKEY_LOCAL_MACHINE, "Software\\IsagSignature",
		0, "", REG_OPTION_NON_VOLATILE, KEY_READ|KEY_WRITE,
		NULL, &mainhk, &todo);
	
	if (!deleteUserKey(name));
	else 
		if (RegOpenKeyEx(mainhk, name, 0, NULL, &hk) == ERROR_SUCCESS)
		{	
			RegDeleteKey(mainhk, name);
			RegCloseKey(mainhk);
			RegCloseKey(hk);
			return true;
		}
	// don't have username or user key
	RegCloseKey(mainhk);
	return false;
}

bool CSignatureApp::deleteUserKey(CString name)
{   
	HCRYPTPROV hProv;
		
	if(CryptAcquireContext(&hProv, name, MS_DEF_PROV, PROV_RSA_FULL, 0))
	{	
		if (!CryptAcquireContext(&hProv, name, MS_DEF_PROV, PROV_RSA_FULL, CRYPT_DELETEKEYSET))
		{	
			return false;
		}
		return true;
	}
	return false;
}
// ***************** Check User Pic **********************

bool CSignatureApp::LoadPicFile(CString user)
{	
	HKEY mainhk = NULL, hk = NULL;
	
	BYTE *fname = NULL;
	BYTE *fsig = NULL;
	DWORD size = 256;
	bool succ = false;
	
	fname = getRegVal(user, "Picfile", REG_SZ, &size);
	if (fname != NULL)
	{	
		size = 2048;
		fsig = getRegVal(user, "Flags", REG_BINARY, &size);
		if (fsig != NULL)
		{
			BYTE *alg;
			DWORD alglen = 1;
			
			alg = theApp.getRegVal("IsagSignature", "Alg", REG_BINARY, &alglen);
			m_isagsig.SetSign(fsig, size, *alg);
			if (m_isagsig.VerifySig("IsagSignature", fname, false) == TRUE)
			{
				m_pic = (HBITMAP)LoadImage(NULL, (LPCTSTR)fname, IMAGE_BITMAP,
					200, 80, LR_LOADFROMFILE);
				if (m_pic != NULL)
				{
					succ = true;
				}
			}
		}
	}
	else 
		succ = true;
	return succ;
}

// ********************* Manage User Reg ************************

HKEY CSignatureApp::hasUser(CString name)
{	
	HKEY mainhk = NULL, hk = NULL;
	bool succ = false;
		
	RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\\IsagSignature",
		0, NULL, &mainhk);
	if (mainhk != NULL)
	{	
		RegOpenKeyEx(mainhk, name, 0, NULL, &hk);
	}
	return hk;
}

bool CSignatureApp::createReg(CString name)
{	
	HKEY mainhk = NULL, hk = NULL;
	DWORD todo, result;
	bool succ = false;
		
	hk = hasUser(name);
	if (hk == NULL)
	{	// Not found this name
		RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\\IsagSignature",
			0, NULL, &mainhk);
		todo = REG_CREATED_NEW_KEY;
		result = RegCreateKeyEx(mainhk, name, 0, "", REG_OPTION_NON_VOLATILE, KEY_READ|KEY_WRITE,
					NULL, &hk, &todo);
		if (result == ERROR_SUCCESS) 
			succ = true;
	}
	RegCloseKey(mainhk);
	RegCloseKey(hk);
	return succ;
}

bool CSignatureApp::setRegVal(CString name, LPTSTR valname, DWORD type,
						   BYTE* pdata, DWORD datalen)
{	
	HKEY mainhk = NULL, hk = NULL;
	DWORD result;
	bool succ = false;

	hk = hasUser(name);
	if (hk != NULL)
	{
		result = RegSetValueEx(hk, valname, NULL, type, pdata, datalen);
		if (result == ERROR_SUCCESS) 
			succ = true;
	}
	RegCloseKey(mainhk);
	RegCloseKey(hk);
	return succ;
}

BYTE* CSignatureApp::getRegVal(CString name, CString valname, DWORD type,
						   DWORD *pdatalen)
{	
	HKEY mainhk = NULL, hk = NULL;
	BYTE *pdata = NULL;
	DWORD mtype, result;
	mtype = type;
	pdata = new BYTE[*pdatalen];
	hk = hasUser(name);

	if (hk != NULL)
	{	
		result = RegQueryValueEx(hk, valname, NULL, &mtype, pdata, pdatalen);
		if (result != ERROR_SUCCESS) 
		{	
			delete pdata;
			pdata = NULL;
		}
	}
	RegCloseKey(mainhk);
	RegCloseKey(hk);
	return pdata;
}
// ********************* User Key I/O ***************************

BYTE* CSignatureApp::getUserKey(CString name, DWORD *plen)
{

	HCRYPTPROV hProv;
	HCRYPTKEY hKey;
	BYTE *buff;
		
	if(!CryptAcquireContext(&hProv, name, MS_DEF_PROV, PROV_RSA_FULL, 0))
	{	
		AfxMessageBox("Error during:\r\n\tAcquire Context "+name+"Key Container");
		exit(1);
	}
	if(!CryptGetUserKey(hProv, AT_SIGNATURE, &hKey))
	{
		AfxMessageBox("Error during:\r\n\tGet user key");
		exit(1);
	}
	// Get Length of key BLOB
	if(!CryptExportKey(hKey, 0, PUBLICKEYBLOB, 0, NULL, plen))
	{	
		AfxMessageBox("Error during:\r\n\tGet key length");
		exit(1);
	}

	buff = (BYTE *)malloc(*plen);//new BYTE[*plen];
	if(!CryptExportKey(hKey, 0, PUBLICKEYBLOB, 0, buff, plen))
	{	
		AfxMessageBox("Error during:\r\n\tExport user key");
		exit(1);
	}
	return buff;
}