// CRtcdialogs.cpp

#include "stdafx.h"
#define MAX_LOADSTRING 100
DWORD txtColor = 0x00ff00;


// RegistryGet : get input from edit box and remember it in registry

HRESULT RegistryGet(WCHAR * szValueName, 
					WCHAR * szData)
{
    HKEY hKey;
    LONG lResult;
    DWORD cbSize = MAX_STRING * sizeof(WCHAR);

    lResult = RegOpenKeyW(
        HKEY_CURRENT_USER,
        L"Software\\Microsoft\\rtcsample",
        &hKey);

    if (lResult != ERROR_SUCCESS)
    {
        return E_FAIL;
    }    

    lResult = RegQueryValueExW(
        hKey,
        szValueName,
        NULL,
        NULL,
        (LPBYTE)szData,
        &cbSize
        );

    RegCloseKey(hKey);

    if (lResult != ERROR_SUCCESS)
    {
        return E_FAIL;
    }

    return S_OK;
}


// RegistrySet : set text in editbox control by get value from registry


HRESULT RegistrySet(WCHAR * szValueName, 
					WCHAR * szData)
{
    HKEY hKey;
    LONG lResult;

    lResult = RegCreateKeyW(
        HKEY_CURRENT_USER,
        L"Software\\Microsoft\\rtcsample",
        &hKey);

    if (lResult != ERROR_SUCCESS)
    {
        return E_FAIL;
    }

    lResult = RegSetValueExW(
        hKey,
        szValueName,
        0,
        REG_SZ,
        (LPBYTE)szData,
        (DWORD) ((wcslen(szData) + 1) * sizeof(WCHAR))
        );

    RegCloseKey(hKey);

    if (lResult != ERROR_SUCCESS)
    {
        return E_FAIL;
    }

    return S_OK;
}


// CleanUserURI : add "sip:" before user uri

void AddSipUserURI(WCHAR * szURI)
{
    // If the user URI does not start with sip: then add it
    if (wcsncmp(szURI, L"sip:", 4))
    {
        WCHAR szTemp[MAX_STRING];

        wcscpy(szTemp, szURI);
        _snwprintf(szURI, MAX_STRING, L"sip:%s", szTemp);
        szURI[MAX_STRING-1] = L'\0';
    }

    // cut any parameters to the user URI
    WCHAR *ch = wcschr(szURI, L';');

    if (ch != NULL)
    {
        *ch = L'\0';
    }
}

// GetStringFromEditBox 

void GetStringFromEditBox(HWND hwndDlg, int nDlgItem, BSTR *pbstr) 
{
	int len;

	len = (int) SendDlgItemMessage(hwndDlg, nDlgItem, WM_GETTEXTLENGTH,0,0);


	if(len) {
		*pbstr= ::SysAllocStringLen(NULL, len + 1);
		SendDlgItemMessage(hwndDlg, nDlgItem, WM_GETTEXT, len+1, (LPARAM) (*pbstr));
	} else
		*pbstr = NULL;

	return;
}

// SetStringInEditBox

void SetStringInEditBox(HWND hwndDlg, int nDlgItem, BSTR bstr)
{
	SendDlgItemMessage(hwndDlg, nDlgItem, WM_SETTEXT, 0,(LPARAM) bstr);
}

// GetIntFromEditBox

BOOL GetIntFromEditBox(HWND hwndDlg, int DlgItem, int* pi)
{
	BSTR p = NULL;

	GetStringFromEditBox(hwndDlg, DlgItem, &p);

	if( p == NULL)
		return FALSE;

	long l = -1;
	l = wcstol(p,NULL,10);
	SysFreeString(p);

	*pi = (int) l;
	return TRUE;
}

// SetIntEditBox

void SetIntInEditBox(HWND hwndDlg, int DlgItem, int i)
{
		
	WCHAR p[MAX_PATH] = {0};
	swprintf(p,L"%d",i);
	BSTR bstrP = ::SysAllocString(p);

	if (bstrP)
	{
		SetStringInEditBox(hwndDlg, DlgItem, bstrP);
		::SysFreeString(bstrP);
	}
}


// LOGIN_PARAMETER : parameter used when logon


struct LOGIN_PARAMETER
{
    WCHAR szUserURI[MAX_STRING];
    WCHAR szServer[MAX_STRING];
    WCHAR szTransport[MAX_STRING];
};


// LoginDialogProc : Login process


INT_PTR CALLBACK LoginDialogProc(
  HWND hwndDlg,  
  UINT uMsg,     
  WPARAM wParam, 
  LPARAM lParam  
)
{
    LOGIN_PARAMETER *pLD;
    pLD = (LOGIN_PARAMETER *)GetWindowLongPtr(hwndDlg, DWLP_USER);

    switch (uMsg) 
    { 
    case WM_INITDIALOG:
        {
            SetWindowLongPtr(hwndDlg, DWLP_USER, lParam);

            pLD = (LOGIN_PARAMETER *)lParam;

        }
        return TRUE;

    case WM_COMMAND: 
        switch (LOWORD(wParam)) 
        { 
        case IDOK: 
            {
			
                GetDlgItemTextW(
                    hwndDlg,
                    IDC_EDIT_LOGON_USERURI, 
                    pLD->szUserURI,
                    MAX_STRING
                    );

                GetDlgItemTextW(
                    hwndDlg,
                    IDC_EDIT_LOGON_IPSERVER, 
                    pLD->szServer,
                    MAX_STRING
                    );

                GetDlgItemTextW(
                    hwndDlg,
                    IDC_COMBO_LOGON_TRANSPORT, 
                    pLD->szTransport,
                    MAX_STRING
                    );

                RegistrySet(L"UserURI", pLD->szUserURI);
                RegistrySet(L"Server", pLD->szServer);
                RegistrySet(L"Transport", pLD->szTransport);


		if ((wcscmp(pLD->szUserURI, L"")==0) && (wcscmp(pLD->szServer, L"")==0))
		    MessageBox(hwndDlg,L"Please Enter Values for Server and URI", L"Error", MB_OK);

                // Fall through
            }

        case IDCANCEL: 
            EndDialog(hwndDlg, wParam);

            return TRUE; 
        } 
    } 

    return FALSE; 
}

// ShowLoginDialog : show login dialog


HRESULT ShowLoginDialog(HWND hWndParent,
                        BSTR *pbstrURI, 
						BSTR *pbstrServer, 
						BSTR *pbstrTransport)
{
    INT_PTR iRes;
    LOGIN_PARAMETER ld;
    
    // Show the dialog
    iRes = DialogBoxParam(
        GetModuleHandle(NULL),
        MAKEINTRESOURCE(IDD_DIALOG_LOGIN),
        hWndParent,
        (DLGPROC)LoginDialogProc,
        (LPARAM)&ld
        );

	// get result from login dialog

    if (iRes == IDOK)
    {
        // Check for empty strings
        if (ld.szUserURI[0] == L'\0')
        {
            return E_FAIL;
        }

        // add sip before user URI
        AddSipUserURI(ld.szUserURI);

        *pbstrURI = SysAllocString(ld.szUserURI);

        if (!(*pbstrURI))
        {
            return E_OUTOFMEMORY;
        }

        *pbstrServer = SysAllocString(ld.szServer);

        if (!(*pbstrServer))
        {
            SAFE_FREE_STRING(*pbstrURI);
            return E_OUTOFMEMORY;
        }

        *pbstrTransport = SysAllocString(ld.szTransport);

        if (!(*pbstrTransport))
        {
            SAFE_FREE_STRING(*pbstrURI);
            SAFE_FREE_STRING(*pbstrServer);
            return E_OUTOFMEMORY;
        }

        return S_OK;
    }

    return E_FAIL;
}



// AUTHEN_PARAMETER : parameter used when authentication


struct AUTHEN_PARAMETER
{
    WCHAR szUserURI[MAX_STRING];
    WCHAR szAccount[MAX_STRING];
    WCHAR szPassword[MAX_STRING];
    WCHAR szServer[MAX_STRING];
    WCHAR szTransport[MAX_STRING];
	WCHAR szUserName[MAX_STRING];
    PWSTR szRealm;
};

// AuthenDialogProc : authentiaction process


INT_PTR CALLBACK AuthenDialogProc(
  HWND hwndDlg,  
  UINT uMsg,     
  WPARAM wParam, 
  LPARAM lParam  
)
{
    AUTHEN_PARAMETER *pAD;
    pAD = (AUTHEN_PARAMETER *)GetWindowLongPtr(hwndDlg, DWLP_USER);

    switch (uMsg) 
    { 
    case WM_INITDIALOG:
        {
            // Store the AUTHEN_PARAMETER pointer in the
            // window's user data
            SetWindowLongPtr(hwndDlg, DWLP_USER, lParam);

            pAD = (AUTHEN_PARAMETER *)lParam;

            if (pAD->szRealm != NULL)
            {
                SetDlgItemTextW(hwndDlg, IDC_STATIC_AUTH_REALM,
                                pAD->szRealm);
            }

			
 
            if (RegistryGet(L"UserURI", pAD->szUserURI) == S_OK)
            {
                SetDlgItemTextW(hwndDlg, IDC_EDIT_AUTH_USERURI,
                                pAD->szUserURI);
            }

			int uriSize;
			uriSize = wcslen(pAD->szUserURI);
			
			
			int realmSize;
			realmSize = wcslen(pAD->szRealm);

			int nameSize;
			nameSize = uriSize - (realmSize+1);

			pAD->szAccount[0] = L'';
			pAD->szUserName[0] = L'';
			

			wcsncat(pAD->szUserName ,pAD->szUserURI,nameSize);

			_snwprintf(pAD->szAccount, MAX_STRING, L"%ws\\%ws",pAD->szRealm,pAD->szUserName);
			
			SetDlgItemTextW(hwndDlg, IDC_EDIT_AUTH_ACCOUNT,pAD->szAccount);

            RegistryGet(L"Server", pAD->szServer);
            RegistryGet(L"Transport", pAD->szTransport);

        }
        return TRUE;

    case WM_COMMAND: 
        switch (LOWORD(wParam)) 
        { 
        case IDOK: 
            {
                GetDlgItemTextW(
                    hwndDlg,
                    IDC_EDIT_AUTH_USERURI, 
                    pAD->szUserURI,
                    MAX_STRING
                    );

                GetDlgItemTextW(
                    hwndDlg,
                    IDC_EDIT_AUTH_ACCOUNT, 
                    pAD->szAccount,
                    MAX_STRING
                    );

                GetDlgItemTextW(
                    hwndDlg,
                    IDC_EDIT_AUTH_PASSWORD, 
                    pAD->szPassword,
                    MAX_STRING
                    );

                RegistrySet(L"UserURI", pAD->szUserURI);
                RegistrySet(L"Account", pAD->szAccount);


            }

        case IDCANCEL: 
            EndDialog(hwndDlg, wParam); 
            return TRUE; 
        } 
    } 

    return FALSE; 
}

// ShowAuthenDialog : show authentication dialog


HRESULT ShowAuthenDialog(HWND hWndParent, 
						 PWSTR szRealm,
						 BSTR *pbstrURI, 
						 BSTR *pbstrAccount, 
						 BSTR *pbstrPassword,
                         BSTR *pbstrServer, 
						 BSTR *pbstrTransport)
{
    INT_PTR iRes;
    AUTHEN_PARAMETER ad;

    ad.szRealm = szRealm;
    
    // Show the dialog
    iRes = DialogBoxParam(
        GetModuleHandle(NULL),
        MAKEINTRESOURCE(IDD_DIALOG_AUTH),
        hWndParent,
        (DLGPROC)AuthenDialogProc,
        (LPARAM)&ad
        );

    if (iRes == IDOK)
    {
        // Check for empty strings
        if ((ad.szUserURI[0] == L'\0') ||
            (ad.szAccount[0] == L'\0') ||
            (ad.szPassword[0] == L'\0'))
        {
            return E_FAIL;
        }

        // Cleanup the user URI
        AddSipUserURI(ad.szUserURI);

        *pbstrURI = SysAllocString(ad.szUserURI);

        if (!(*pbstrURI))
        {
            // Out of memory
            return E_OUTOFMEMORY;
        }

        *pbstrAccount = SysAllocString(ad.szAccount);

        if (!(*pbstrAccount))
        {
            // Out of memory
            SAFE_FREE_STRING(*pbstrURI);
            return E_OUTOFMEMORY;
        }

        *pbstrPassword = SysAllocString(ad.szPassword);

        if (!(*pbstrPassword))
        {
            // Out of memory
            SAFE_FREE_STRING(*pbstrURI);
            SAFE_FREE_STRING(*pbstrAccount);
            return E_OUTOFMEMORY;
        }

        *pbstrServer = SysAllocString(ad.szServer);

        if (!(*pbstrServer))
        {
            // Out of memory
            SAFE_FREE_STRING(*pbstrURI);
            SAFE_FREE_STRING(*pbstrAccount);
            SAFE_FREE_STRING(*pbstrPassword);
            return E_OUTOFMEMORY;
        }

        *pbstrTransport = SysAllocString(ad.szTransport);

        if (!(*pbstrTransport))
        {
            // Out of memory
            SAFE_FREE_STRING(*pbstrURI);
            SAFE_FREE_STRING(*pbstrAccount);
            SAFE_FREE_STRING(*pbstrPassword);
            SAFE_FREE_STRING(*pbstrServer);
            return E_OUTOFMEMORY;
        }

        return S_OK;
    }

    return E_FAIL;
}

// WATCHER_PARAMETER : parameter used when wather


struct WATCHER_PARAMETER
{
    BSTR bstrName;
    BSTR bstrURI;
    BOOL fAllow;
    BOOL fAddBuddy;
};

// WatcherDialogProc : watcher process
 

INT_PTR CALLBACK WatcherDialogProc(
  HWND hwndDlg,  // handle to dialog box
  UINT uMsg,     // message
  WPARAM wParam, // first message parameter
  LPARAM lParam  // second message parameter
)
{
    WATCHER_PARAMETER *pWD;
    pWD = (WATCHER_PARAMETER *)GetWindowLongPtr(hwndDlg, DWLP_USER);

    switch (uMsg) 
    { 
    case WM_INITDIALOG:
        {
            // Store the WATCHER_PARAMETER pointer in the
            // window's user data
            SetWindowLongPtr(hwndDlg, DWLP_USER, lParam);
            pWD = (WATCHER_PARAMETER *)lParam;

            // Populate the watcher text
            SendDlgItemMessageW(hwndDlg, IDC_STATIC_WATCHER_NAME,
                WM_SETTEXT, 0, (LPARAM)(pWD->bstrName));

            SendDlgItemMessageW(hwndDlg, IDC_STATIC_WATCHER_URI,
                WM_SETTEXT, 0, (LPARAM)(pWD->bstrURI));

            // Check the add buddy box by default
            SendDlgItemMessage(hwndDlg, IDC_CHECK_WATCHER_ADD_BUDDY,
                                BM_SETCHECK, BST_CHECKED, 0);
        }
        return TRUE;

    case WM_COMMAND: 
        switch (LOWORD(wParam)) 
        { 
        case IDC_BUTTON_WATCHER_ALLOW: 
            {
                pWD->fAddBuddy = (SendDlgItemMessage( 
                                hwndDlg, 
                                IDC_CHECK_WATCHER_ADD_BUDDY,
                                BM_GETCHECK, 
                                0, 0) == BST_CHECKED);

                pWD->fAllow = TRUE;

                EndDialog(hwndDlg, IDOK); 
            }
            return TRUE;

        case IDC_BUTTON_WATCHER_BLOCK:
            {
                pWD->fAddBuddy = (SendDlgItemMessage( 
                                hwndDlg, 
                                IDC_CHECK_WATCHER_ADD_BUDDY,
                                BM_GETSTATE, 
                                0, 0) == BST_CHECKED);

                pWD->fAllow = FALSE;

                EndDialog(hwndDlg, IDOK); 
            }
            return TRUE;

        case IDCANCEL: 
            EndDialog(hwndDlg, wParam); 
            return TRUE; 
        } 
    } 

    return FALSE; 
}

// ShowWatcherDialog : show watcher dialog

HRESULT ShowWatcherDialog(
        HWND hWndParent,
        BSTR bstrName, BSTR bstrURI,
        BOOL *pfAllow, BOOL *pfAddBuddy)
{
    INT_PTR iRes;
    WATCHER_PARAMETER wd;
    
    wd.bstrName = bstrName;
    wd.bstrURI = bstrURI;

    // Show the dialog
    iRes = (int) DialogBoxParam(
        GetModuleHandle(NULL),
        MAKEINTRESOURCE(IDD_DIALOG_WATCHER),
        hWndParent,
        (DLGPROC)WatcherDialogProc,
        (LPARAM)&wd
        );

    if (iRes == IDOK)
    {
        *pfAllow = wd.fAllow;
        *pfAddBuddy = wd.fAddBuddy;

        return S_OK;
    }

    return E_FAIL;
}



// DisplayNameDialogProc : change display name process

INT_PTR CALLBACK DisplayNameDialogProc(
  HWND hwndDlg,  // handle to dialog box
  UINT uMsg,     // message
  WPARAM wParam, // first message parameter
  LPARAM lParam  // second message parameter
)
{
	BSTR pDND;
    pDND = (BSTR)GetWindowLongPtr(hwndDlg, DWLP_USER);


    switch (uMsg) 
    { 
    case WM_INITDIALOG:
        {
            
			SetWindowLongPtr(hwndDlg, DWLP_USER, lParam);
            pDND = (BSTR)lParam;
			           
            SendDlgItemMessage(hwndDlg, IDC_EDIT_DISPLAY_NAME, WM_SETTEXT, 0,(LPARAM) pDND);

        }
        return TRUE;

    case WM_COMMAND: 
        switch (LOWORD(wParam)) 
        { 
        case IDOK: 
            {				
				if(pDND)
					SysFreeString(pDND);

				int len;

				len = (int) SendDlgItemMessage(hwndDlg, IDC_EDIT_DISPLAY_NAME, WM_GETTEXTLENGTH,0,0);


				if(len) {
					pDND= ::SysAllocStringLen(NULL, len + 1);
					SendDlgItemMessage(hwndDlg, IDC_EDIT_DISPLAY_NAME, WM_GETTEXT, len+1, (LPARAM)pDND);
				} else
					pDND = NULL;
            }

        case IDCANCEL: 
            EndDialog(hwndDlg, wParam); 
            return TRUE; 
        } 
    } 

    return FALSE;

}

// ShowDisplayNameDialog : show display name dialog

HRESULT ShowDisplayNameDialog(
		HWND hWndParent,
		BSTR *pbstrDisplayName)
{
	INT_PTR iRes;
 
    // Show the dialog
    iRes = DialogBoxParam(
    GetModuleHandle(NULL),
    MAKEINTRESOURCE(IDD_DIALOG_DISPLAYNAME),
    hWndParent,
    (DLGPROC)DisplayNameDialogProc,
    (LPARAM) *pbstrDisplayName
    );

	if (iRes == IDOK)
    {
        return S_OK;
    }
   
    return  S_OK; 

}

// ADDRESS_PARAMETER  

struct ADDRESS_PARAMETER
{
    PWSTR szTitle;
    WCHAR szURI[MAX_STRING];
    WCHAR szName[MAX_STRING];
};

// ShowAddressDialog : show name dialog or uri dialog or name&uri dialog

// AddressDialogProc : get address name process

INT_PTR CALLBACK AddressDialogProc(
  HWND hwndDlg,  // handle to dialog box
  UINT uMsg,     // message
  WPARAM wParam, // first message parameter
  LPARAM lParam  // second message parameter
)
{
    ADDRESS_PARAMETER *pAD;
    pAD = (ADDRESS_PARAMETER *)GetWindowLongPtr(hwndDlg, DWLP_USER);
	
    switch (uMsg) 
    { 
    case WM_INITDIALOG:
        {
            				
			// Store the ADDRESS_PARAMETER pointer in the
            // window's user data
            SetWindowLongPtr(hwndDlg, DWLP_USER, lParam);
            pAD = (ADDRESS_PARAMETER *)lParam;

            // Set the dialog title
            SetWindowText(hwndDlg, pAD->szTitle);
			
        }
        return TRUE;

    case WM_COMMAND: 
        switch (LOWORD(wParam)) 
        { 
        case IDOK: 
            {
                GetDlgItemTextW(
                    hwndDlg,
                    IDC_EDIT_ADDRESS_URI, 
                    pAD->szURI,
                    MAX_STRING
                    );

                GetDlgItemTextW(
                    hwndDlg,
                    IDC_EDIT_ADDRESS_NAME, 
                    pAD->szName,
                    MAX_STRING
                    );
            }

        case IDCANCEL: 
            EndDialog(hwndDlg, wParam); 
            return TRUE; 
        } 
    } 

    return FALSE; 
}

HRESULT ShowAddressDialog(HWND hWndParent,
                          PWSTR szTitle,
                          BSTR *pbstrURI, BSTR *pbstrName)
{
    INT_PTR iRes;
    ADDRESS_PARAMETER ad;
    
    ad.szTitle = szTitle;

    // Show the dialog
    iRes = DialogBoxParam(
        GetModuleHandle(NULL),
        MAKEINTRESOURCE(pbstrName ? (pbstrURI ? IDD_DIALOG_ADDRESS_NAME : IDD_DIALOG_NAME) : IDD_DIALOG_URI),
        hWndParent,
        (DLGPROC)AddressDialogProc,
        (LPARAM)&ad
        );

    if (iRes == IDOK)
    {
        if (pbstrURI)
        {
            // Check for empty strings
            if (ad.szURI[0] == L'\0')
            {
                return E_FAIL;
            }

            *pbstrURI = SysAllocString(ad.szURI);

            if (!(*pbstrURI))
            {
                // Out of memory
                return E_OUTOFMEMORY;
            }
        }

        if (pbstrName)
        {
            *pbstrName = SysAllocString(ad.szName);

            if (!(*pbstrName))
            {
                // Out of memory
                SAFE_FREE_STRING(*pbstrURI);

                return E_OUTOFMEMORY;
            }
        }

        return S_OK;
    }

    return E_FAIL;
}


// SESSION_PARAMETER : parameter used when create session


struct SESSION_PARAMETER
{
    BSTR bstrName;
    BSTR bstrURI;
    BOOL fAccept;
};

// SessionDialogProc : session dialog process


INT_PTR CALLBACK SessionDialogProc(
  HWND hwndDlg,  // handle to dialog box
  UINT uMsg,     // message
  WPARAM wParam, // first message parameter
  LPARAM lParam  // second message parameter
)
{
    SESSION_PARAMETER *pSD;
    pSD = (SESSION_PARAMETER *)GetWindowLongPtr(hwndDlg, DWLP_USER);

    switch (uMsg) 
    { 
    case WM_INITDIALOG:
        {
            // Store the SESSION_PARAMETER pointer in the
            // window's user data
            SetWindowLongPtr(hwndDlg, DWLP_USER, lParam);
            pSD = (SESSION_PARAMETER *)lParam;

            // Populate the session text
            SendDlgItemMessageW(hwndDlg, IDC_STATIC_SESSION_NAME,
                WM_SETTEXT, 0, (LPARAM)(pSD->bstrName));

            SendDlgItemMessageW(hwndDlg, IDC_STATIC_SESSION_URI,
                WM_SETTEXT, 0, (LPARAM)(pSD->bstrURI));
        }
        return TRUE;

    case WM_COMMAND: 
        switch (LOWORD(wParam)) 
        { 
        case IDC_BUTTON_SESSION_ACCEPT: 
            {
                pSD->fAccept = TRUE;

                EndDialog(hwndDlg, IDOK); 
            }
            return TRUE;

        case IDC_BUTTON_SESSION_REJECT:
        case IDCANCEL: 
            {
                pSD->fAccept = FALSE;

                EndDialog(hwndDlg, IDOK); 
            }
            return TRUE; 
        } 
    } 

    return FALSE; 
}

// ShowSessionDialog : show session dialog

HRESULT ShowSessionDialog(
        HWND hWndParent,
        BSTR bstrName, BSTR bstrURI,
        BOOL *pfAccept)
{
    INT_PTR iRes;
    SESSION_PARAMETER sd;
    
    sd.bstrName = bstrName;
    sd.bstrURI = bstrURI;

    // Show the dialog
    iRes = DialogBoxParam(
        GetModuleHandle(NULL),
        MAKEINTRESOURCE(IDD_DIALOG_SESSION),
        hWndParent,
        (DLGPROC)SessionDialogProc,
        (LPARAM)&sd
        );

    if (iRes == IDOK)
    {
        *pfAccept = sd.fAccept;

        return S_OK;
    }

    return E_FAIL;
}

// OptionsDialogProc : option dialog process

INT_PTR CALLBACK OptionsDialogProc(
  HWND hwndDlg,  // handle to dialog box
  UINT uMsg,     // message
  WPARAM wParam, // first message parameter
  LPARAM lParam  // second message parameter
)
{
    OPTIONS_DATA *pOD;
    pOD = (OPTIONS_DATA *)GetWindowLongPtr(hwndDlg, DWLP_USER);

    switch (uMsg) 
    { 
    case WM_INITDIALOG:
		{
			// Store the OPTIONS_DATA pointer in the
            // window's user data
            SetWindowLongPtr(hwndDlg, DWLP_USER, lParam);

			pOD = (OPTIONS_DATA *) lParam;

			//Display the settings that were last saved
			//BEGIN
			if(pOD->bstrAppName)
				SetStringInEditBox(hwndDlg, IDC_EDIT_OPTIONS_NAME, pOD->bstrAppName);
			
			if(pOD->bstrAppVer)
				SetStringInEditBox(hwndDlg, IDC_EDIT_OPTIONS_NUM, pOD->bstrAppVer);
			
			//If MaxBW was previously enforced
			if(pOD->EnabledOptions & RTCWIN_OPTIONS_MAXBW) {
				//Check the checkbox
				SendDlgItemMessage(hwndDlg, IDC_CHECK_OPTIONS_APPBW, BM_SETCHECK, BST_CHECKED, 0);	
				SetIntInEditBox(hwndDlg, IDC_EDIT_OPTIONS_APPBW, pOD->lMaxBW);		
			}

			//If T120 negotiation was previously enforced
			if(pOD->EnabledOptions & RTCWIN_OPTIONS_T120) {
				//Check the checkbox
				SendDlgItemMessage(hwndDlg, IDC_CHECK_OPTIONS_T120, BM_SETCHECK, BST_CHECKED, 0);	
			}


			//Display Encryption Settings
			int nDlgItm;

			//Check the right radio button for AV encryption
			switch(pOD->enAVLevel) {
			case RTCSECL_UNSUPPORTED:		
					nDlgItm = IDC_RADIO_AVENC_OPTIONS_UNSUPP;
					break;						
			case RTCSECL_SUPPORTED:
					nDlgItm = IDC_RADIO_AVENC_OPTIONS_SUPP;
					break;						

			case RTCSECL_REQUIRED:
					nDlgItm = IDC_RADIO_AVENC_OPTIONS_REQ;
					break;

			default:
					nDlgItm = -1;
					break;						
			}

			if (nDlgItm != -1)
			{
				CheckRadioButton(hwndDlg, 
						 IDC_RADIO_AVENC_OPTIONS_UNSUPP, IDC_RADIO_AVENC_OPTIONS_REQ,
						 nDlgItm);
			}


			//Check the right radio button for T120 encryption
			switch(pOD->enT120Level) {
			case RTCSECL_UNSUPPORTED:
					nDlgItm = IDC_RADIO_T120ENC_OPTIONS_UNSUPP; 
					break;						
			case RTCSECL_SUPPORTED:
					nDlgItm = IDC_RADIO_T120ENC_OPTIONS_SUPP;
					break;						

			case RTCSECL_REQUIRED:
					nDlgItm = IDC_RADIO_T120ENC_OPTIONS_REQ;
					break;						
			}

			CheckRadioButton(hwndDlg, 
							 IDC_RADIO_T120ENC_OPTIONS_UNSUPP, IDC_RADIO_T120ENC_OPTIONS_REQ,
							 nDlgItm);
			
			//Display the settings that were last saved
			//END           
		}

        return TRUE;

    case WM_COMMAND: 
        switch (LOWORD(wParam)) 
        { 
        case IDOK: 
            {
				//We are about to get the strings from the edit control. Free up the older strings.
				if(pOD->bstrAppName)
					SysFreeString(pOD->bstrAppName);

				if(pOD->bstrAppVer)
					SysFreeString(pOD->bstrAppVer);

				//Copy the AppName and AppVer strings from the edit control buffer to the OPTIONS_DATA structure

				GetStringFromEditBox(hwndDlg, IDC_EDIT_OPTIONS_NAME, &pOD->bstrAppName);
				GetStringFromEditBox(hwndDlg, IDC_EDIT_OPTIONS_NUM, &pOD->bstrAppVer);
				
				//MaxBW
				if( BST_CHECKED == SendDlgItemMessage(hwndDlg, IDC_CHECK_OPTIONS_APPBW, BM_GETCHECK, 0, 0))
				{
					//the item is checked. lets get the string from the edit box, convert to string and send it.
					int i;

					if( GetIntFromEditBox(hwndDlg, IDC_EDIT_OPTIONS_APPBW, &i) == TRUE) {
						pOD->lMaxBW = i;
						pOD->EnabledOptions |= RTCWIN_OPTIONS_MAXBW;
					}

				} else {
					//Edit control box was NOT checked
					pOD->EnabledOptions &=  ~RTCWIN_OPTIONS_MAXBW;
					pOD->lMaxBW = 0;
				}


				//T120 negotiation
				if( BST_CHECKED == SendDlgItemMessage(hwndDlg, IDC_CHECK_OPTIONS_T120, BM_GETCHECK, 0, 0))
				{
					pOD->EnabledOptions |= RTCWIN_OPTIONS_T120;

				} else {
					//Checkbox was NOT checked
					pOD->EnabledOptions &=  ~RTCWIN_OPTIONS_T120;
				}


				//***** Encryption Settings
				
				//AV Encryption Settings
				if(BST_CHECKED == IsDlgButtonChecked(hwndDlg, IDC_RADIO_AVENC_OPTIONS_UNSUPP)) 
					pOD->enAVLevel = RTCSECL_UNSUPPORTED;
				else if(BST_CHECKED == IsDlgButtonChecked(hwndDlg, IDC_RADIO_AVENC_OPTIONS_SUPP)) 
					pOD->enAVLevel = RTCSECL_SUPPORTED;
				else
					pOD->enAVLevel = RTCSECL_REQUIRED;
				
				//T120  Settings
				if(BST_CHECKED == IsDlgButtonChecked(hwndDlg, IDC_RADIO_T120ENC_OPTIONS_UNSUPP)) 
					pOD->enT120Level = RTCSECL_UNSUPPORTED;
				else if(BST_CHECKED == IsDlgButtonChecked(hwndDlg, IDC_RADIO_T120ENC_OPTIONS_SUPP))
					pOD->enT120Level = RTCSECL_SUPPORTED;
				else
					pOD->enT120Level = RTCSECL_REQUIRED;
				
                EndDialog(hwndDlg, IDOK); 
				return TRUE; 
            }
            
         
		case IDCANCEL:		{
				EndDialog(hwndDlg, IDCANCEL);
				return TRUE;
			}

		default: 
			return FALSE;
		}

		return FALSE;
    } 

    return FALSE; 
}

//	ShowBuddyPropertiesDialog : show buddy properties

HRESULT	ShowBuddyPropertiesDialog(
		HWND hWndParent,
		IRTCBuddy2 *pBuddy)
{
	HRESULT hr = S_OK;
	int nRemainingLength = 0;

	// String to store all of the information:
	WCHAR wszBuddyInformation[MAX_XML_STRING] = {0};
	BSTR bstrName = NULL;
	BSTR bstrURI = NULL;
	VARIANT_BOOL fPersistent;
	RTC_PRESENCE_STATUS enStatus = RTCXS_PRESENCE_OFFLINE;
	BSTR bstrNotes = NULL;

	WCHAR *wszPresenceStates[] = {
		L"Offline",
		L"Online",
		L"Away",
		L"Idle",
		L"Busy",
		L"Be Right Back",
		L"On The Phone",
		L"Out Of Lunch",
		L"Unknown"
	};

	// Generic Buddy Information:

	hr = pBuddy->get_PresenceProperty(RTCPP_DISPLAYNAME, &bstrName);
	
	hr = pBuddy->get_PresentityURI(&bstrURI);
	
	hr = pBuddy->get_Persistent(&fPersistent);
	
	hr = pBuddy->get_Status(&enStatus);
	

	// Concatenate the Buddy Information to the main string
	_snwprintf(wszBuddyInformation, MAX_XML_STRING-1, L"Name = %s\nURI = %s\nStatus = %s\nPersistent = %s",
			bstrName, 
			bstrURI,
			wszPresenceStates[enStatus],
			fPersistent? L"True":L"False"
			);
	
	wszBuddyInformation[MAX_XML_STRING-1] = L'\0';

	// Display the box with all of the information:
	MessageBox(hWndParent, wszBuddyInformation, L"Buddy Properties", MB_ICONINFORMATION);

	SAFE_FREE_STRING(bstrName);
	SAFE_FREE_STRING(bstrURI);
	SAFE_FREE_STRING(bstrNotes);

	return S_OK;
}




