// CRtcwin.cpp

#include "stdafx.h"
#include <assert.h>

#define MAX_COMPUTER_NAME_LENGTH 300


HINSTANCE	hInst;

int iconOnNode;
int iconOffNode;
int iconOn;
int iconOff;
int iconAway;
int iconBusy;
int iconPhone;


// CRTCWin : constructor crtcwin

CRTCWin::CRTCWin()
{
    m_hWnd = NULL;
    m_hStatusBar = NULL;
	m_hBuddyTree = NULL;
	
	m_hOfflineParent = NULL;
	m_hOnlineParent = NULL;
    m_pClient = NULL;
    m_pProfile = NULL;
    m_pEvents = NULL;
    m_enState = RTCRS_NOT_REGISTERED;
    m_fPresenceEnabled = FALSE;
    m_lCookie = 0;
	m_nLogonAttemptCount = 0;
	ZeroMemory((void *)&m_OD, sizeof(OPTIONS_DATA));

	bstrDisplayName = NULL;
}

// ~CRTCWin : destructor crtcwin
 
CRTCWin::~CRTCWin()
{

	if(m_OD.bstrAppName) 
		SysFreeString(m_OD.bstrAppName);

//	if(m_OD.bstrAppVer)
//		SysFreeString(m_OD.bstrAppVer);

}


// RegisterClass : register class crtcwin


HRESULT CRTCWin::RegisterClass()
{
    // Register the window class
    WNDCLASS wc;
    ATOM atom;

    ZeroMemory(&wc, sizeof(WNDCLASS));

    wc.style         = CS_HREDRAW | CS_VREDRAW;
    wc.lpfnWndProc   = (WNDPROC)CRTCWin::WindowProc;
    wc.hInstance     = GetModuleHandle(NULL);
    wc.hIcon         = LoadIcon(wc.hInstance, (LPCTSTR)IDI_APP);
    wc.hCursor       =
        LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = 
        GetSysColorBrush(COLOR_3DFACE);
    wc.lpszMenuName  = MAKEINTRESOURCE(IDR_MENU_APP);
    wc.lpszClassName = APP_CLASS;

    atom = ::RegisterClass( &wc );

    if ( !atom )
    {
        return E_FAIL;
    }

	hInst = wc.hInstance;

    return S_OK;
}


// AddSession : create session (im/av)

HRESULT CRTCWin::AddSession(IRTCSession * pSession, RTC_SESSION_TYPE enType)
{
	// Is this an audio/video session?
    BOOL fAVSession = (enType == RTCST_PC_TO_PC || enType == RTCST_PC_TO_PHONE);    

    // Create the session window
    HWND hWnd;
    HRESULT hr = S_OK;

    hWnd = CreateWindowExW(
                0,
                (fAVSession) ? AV_CLASS : IM_CLASS,
                (fAVSession) ? AV_TITLE : IM_TITLE,
                WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN | WS_CLIPSIBLINGS,
                CW_USEDEFAULT, CW_USEDEFAULT,
                (fAVSession) ? AV_WIDTH : IM_WIDTH,
                (fAVSession) ? AV_HEIGHT : IM_HEIGHT,
                NULL,
                NULL,
                GetModuleHandle(NULL),
                NULL);    

    if ( !hWnd )
    {  
        return E_FAIL;
    }

    // Initialize the window
    CRTCSession * pSessWindow = 
        (CRTCSession *)GetWindowLongPtr(hWnd, GWLP_USERDATA);

    pSessWindow->m_pSession = pSession;
    pSessWindow->m_pSession->AddRef();
    pSessWindow->m_pWin = this;

    // Make the main call window visible
    ShowWindow( hWnd, SW_SHOW );
    UpdateWindow( hWnd );

    // Add window to the list
    m_SessionList.push_back(pSessWindow);

    return hr;
}


// RemoveSession


HRESULT CRTCWin::RemoveSession(CRTCSession * pSessWindow)
{
	std::vector<CRTCSession *>::iterator it;
    
    if (!m_SessionList.empty())
    {
        // Find the window
        for(it=m_SessionList.begin();
            it < m_SessionList.end();
            it++)
        {
            if (*it == pSessWindow)
            {
                // Remove the window
                m_SessionList.erase(it);
                break;
            }
        }
    }

    return S_OK;
}


// FindSession : check a session in the session list


HRESULT CRTCWin::FindSession(IRTCSession * pSession,CRTCSession ** ppSessWindow)
{
	std::vector<CRTCSession *>::iterator it;     

    if (!m_SessionList.empty())
    {
        for(it=m_SessionList.begin();
            it < m_SessionList.end();
            it++)
        {
            if ((*it)->m_pSession == pSession)
            {
                *ppSessWindow = (*it);         
                return S_OK;
            }
        }
    }

    *ppSessWindow = NULL;
    return E_FAIL;
}


// CleanupSessions : clear all session

HRESULT CRTCWin::CleanupSessions()
{
	std::vector<CRTCSession *>::iterator it;     

    if (!m_SessionList.empty())
    {
        for(it=m_SessionList.begin();
            it < m_SessionList.end();
            it++)
        {
            PostMessage((*it)->m_hWnd, WM_CLOSE, 0, 0);
        }
    }

    return S_OK;
}



// AddWatchers


HRESULT CRTCWin::AddWatchers()
{
	HRESULT hr = S_OK;

    // Create the watchers window
    HWND hWnd;

    hWnd = CreateWindowExW(
                0,
                WATHER_CLASS,
                WATHER_TITLE,
                WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN | WS_CLIPSIBLINGS,
                CW_USEDEFAULT, CW_USEDEFAULT,
                WATHER_WIDTH,
                WATHER_HEIGHT,
                NULL,
                NULL,
                GetModuleHandle(NULL),
                NULL);    

    if ( !hWnd )
    {  
        return E_FAIL;
    }

    // Initialize the window
    CRTCWatcher * pWatcherWindow = (CRTCWatcher *)GetWindowLongPtr(hWnd, GWLP_USERDATA);

    pWatcherWindow->m_pClient = m_pClient;
    pWatcherWindow->m_pClient->AddRef();

    pWatcherWindow->m_pWin = this;

    // Make the watcher window visible
    ShowWindow( hWnd, SW_SHOW );
    UpdateWindow( hWnd );

    // Add window to the list
    m_WatchersList.push_back(pWatcherWindow);

    return hr;
}


// RemoveWatchers


HRESULT CRTCWin::RemoveWatchers(CRTCWatcher * pWatcherWindow)
{
	std::vector<CRTCWatcher *>::iterator it;
    
    if (!m_WatchersList.empty())
    {
        // Find the window
        for(it=m_WatchersList.begin();
            it < m_WatchersList.end();
            it++)
        {
            if (*it == pWatcherWindow)
            {
                // Remove the window
                m_WatchersList.erase(it);
                break;
            }
        }
    }

    return S_OK;
}

// CleanupWatchers


HRESULT CRTCWin::CleanupWatchers()
{
	std::vector<CRTCWatcher *>::iterator it;     

    if (!m_WatchersList.empty())
    {
        for(it=m_WatchersList.begin();
            it < m_WatchersList.end();
            it++)
        {
            PostMessage((*it)->m_hWnd, WM_CLOSE, 0, 0);
        }
    }

    return S_OK;
}


// ShowMessageBox


void CRTCWin::ShowMessageBox(PWSTR szText,UINT uType)
{
    MessageBoxW(m_hWnd, szText, APP_TITLE, uType);
}


// SetStatusText

void CRTCWin::SetStatusText(PWSTR szText)
{
    SetWindowTextW(m_hStatusBar, szText);
    InvalidateRect(m_hStatusBar, NULL, FALSE);
}


// GetUserURI : get local user uri


HRESULT CRTCWin::GetUserURI(BSTR *pbstrURI)
{
    HRESULT hr;

    if (m_pProfile != NULL)
    {
        // Get the user URI from the profile
        hr = m_pProfile->get_UserURI(pbstrURI);

        if (FAILED(hr))
        {
            return hr;
        }
    }
    else
    {
        // Get the user URI from the client
        hr = m_pClient->get_LocalUserURI(pbstrURI);

        if (FAILED(hr))
        {
            return hr;
        }
    }


    return S_OK;
}


// GetUserName : get local user name


HRESULT CRTCWin::GetUserName(BSTR *pbstrName)
{
    HRESULT hr;

    if (m_pProfile != NULL)
    {
        // Get the user name from the profile
		hr = m_pClient->get_LocalUserName(pbstrName);


        if (FAILED(hr))
        {
            return hr;
        }
    }
    else
    {
        // Get the user name from the client
        hr = m_pClient->get_LocalUserName(pbstrName);

        if (FAILED(hr))
        {
            return hr;
        }
    }

    return S_OK;
}



// FindBuddyNode : Is buddy in node ?


HRESULT CRTCWin::TreeViewHelper_FindBuddyNode(IRTCBuddy * pBuddy, LPTVITEMEX pTvix, int *piTree)
{
	if (pTvix == NULL || piTree == NULL)
		return E_POINTER;


	TVITEMEX tvix;
	ZeroMemory(&tvix, sizeof(TVITEMEX));
	ZeroMemory(pTvix, sizeof(TVITEMEX));

	// Start with searching the online tree

	HTREEITEM child;
	
	child = 	TreeView_GetNextItem(	m_hBuddyTree,
										m_hOnlineParent,
										TVGN_CHILD
									);
	tvix.hItem = child;
	tvix.mask = TVIF_PARAM;
	TreeView_GetItem(m_hBuddyTree, &tvix);

	while (child != NULL && tvix.lParam != (LPARAM) pBuddy)
	{
		child = 
		TreeView_GetNextItem(	m_hBuddyTree,
								child,
								TVGN_NEXT
							);

		tvix.hItem = child;
		tvix.mask = TVIF_PARAM;
		TreeView_GetItem(m_hBuddyTree, &tvix);
	}

	if (tvix.lParam == (LPARAM) pBuddy)
	{
		pTvix->hItem = child;
		pTvix->lParam = tvix.lParam;
		if (piTree)
		{
			*piTree = 1;
		}
		return S_OK;
	}

	// Not found in online tree. Search the offline tree
	
	child = 	TreeView_GetNextItem(	m_hBuddyTree,
										m_hOfflineParent,
										TVGN_CHILD
									);

	tvix.hItem = child;
	TreeView_GetItem(m_hBuddyTree, &tvix);

	while (child != NULL && tvix.lParam != (LPARAM) pBuddy)
	{
		child = 
		TreeView_GetNextItem(	m_hBuddyTree,
								child,
								TVGN_NEXT
							);
		tvix.hItem = child;
		tvix.mask = TVIF_PARAM;
		TreeView_GetItem(m_hBuddyTree, &tvix);
	}

	if (child != NULL && tvix.lParam == (LPARAM) pBuddy)
	{
		pTvix->hItem = child;
		pTvix->lParam = tvix.lParam;
		if (piTree)
		{
			*piTree = 0;
		}
		return S_OK;
	}	
	
	return E_FAIL;


}

// TreeViewHelper_InsertNode : insert buddy at tree view (repaint treeview)

HRESULT CRTCWin::TreeViewHelper_InsertNode(IRTCBuddy * pBuddy, WCHAR * szBuddy, int enStatus)
{
	assert (pBuddy != NULL);

	if (pBuddy == NULL)
	{
		return E_POINTER;
	}

	TV_ITEM tviNewItem;
	ZeroMemory(&tviNewItem, sizeof(TV_ITEM));

	


	// Main item

	tviNewItem.mask = TVIF_TEXT | TVIF_IMAGE | TVIF_SELECTEDIMAGE | TVIF_PARAM; //TVIF_TEXT;
	tviNewItem.pszText = szBuddy; 
	tviNewItem.lParam = (LPARAM)pBuddy;


	// Group into online or offline group? 

	TVINSERTSTRUCT tvis;
	ZeroMemory(&tvis, sizeof(TVINSERTSTRUCT));

	if (enStatus == (int) RTCXS_PRESENCE_OFFLINE)
	{
		tviNewItem.iImage = iconOff;
		tviNewItem.iSelectedImage = iconOff;
		tvis.hParent = (HTREEITEM) m_hOfflineParent;
	}
	else
	{
		//change icon follow status
		
		switch (enStatus)
		{
			case RTCXS_PRESENCE_AWAY:
				 tviNewItem.iImage = iconAway;
				 tviNewItem.iSelectedImage = iconAway;
			break;
			case RTCXS_PRESENCE_IDLE:
				 tviNewItem.iImage = iconAway;
				 tviNewItem.iSelectedImage = iconAway; 
			break;
			case RTCXS_PRESENCE_BUSY:
				 tviNewItem.iImage = iconBusy;
				 tviNewItem.iSelectedImage = iconBusy;	
			break;
			case RTCXS_PRESENCE_BE_RIGHT_BACK:
				 tviNewItem.iImage = iconAway;
				 tviNewItem.iSelectedImage = iconAway;		
			break;
			case RTCXS_PRESENCE_ON_THE_PHONE:
				 tviNewItem.iImage = iconPhone;
				 tviNewItem.iSelectedImage = iconPhone;		
			break;
			case RTCXS_PRESENCE_OUT_TO_LUNCH:
				 tviNewItem.iImage = iconAway;
				 tviNewItem.iSelectedImage = iconAway;		
			break;
			default:
				 tviNewItem.iImage = iconOn;
				 tviNewItem.iSelectedImage = iconOn;
			break;
		}
		
		tvis.hParent = (HTREEITEM) m_hOnlineParent;
	}


	tvis.hInsertAfter = TVI_SORT;
	tvis.item = tviNewItem;

	
	HTREEITEM hti = TreeView_InsertItem(m_hBuddyTree, &tvis);
	
    if (hti == NULL)
	{
		return E_FAIL;
	}

	// An RTC buddy reference will be kept by the list
    // Add the reference here
	pBuddy->AddRef();

	// Now Add all of the presence devices to the parent node if the buddy isn't offline
	if (enStatus == (int) RTCXS_PRESENCE_OFFLINE)
	{
		return S_OK;
	}

	return S_OK;
}

 
// UpdateBuddyList : get buddy's display name or uri and thier status


HRESULT CRTCWin::UpdateBuddyList(IRTCBuddy * pBuddy)
{
	HRESULT hr;

    if (pBuddy == NULL)
    {
        return S_OK;
    }

    // Get the buddy status
    RTC_PRESENCE_STATUS enStatus = RTCXS_PRESENCE_OFFLINE;

    hr = pBuddy->get_Status(&enStatus);

    // Get the buddy name
    BSTR bstrName = NULL;

	IRTCBuddy2 *pBuddy2;
	pBuddy->QueryInterface(__uuidof(IRTCBuddy2), (LPVOID *)&pBuddy2);
    
    hr = pBuddy2->get_PresenceProperty(RTCPP_DISPLAYNAME, &bstrName);

	SAFE_RELEASE(pBuddy2);

    if (SUCCEEDED(hr) && !wcscmp(bstrName, L""))
    {
        // Treat an emptry string as a failure
        SAFE_FREE_STRING(bstrName);
        hr = E_FAIL;
    }

    if (FAILED(hr))
    {
        hr = pBuddy->get_PresentityURI(&bstrName);

        if (SUCCEEDED(hr) && !wcscmp(bstrName, L""))
        {
            // Treat an emptry string as a failure
            SAFE_FREE_STRING(bstrName);
            hr = E_FAIL;
        }

        if (FAILED(hr))
        {
            return hr;
        }
    }

    // Build a string for the main buddy node.
    WCHAR szBuddy[MAX_STRING];
	
    switch (enStatus)
    {
    case RTCXS_PRESENCE_OFFLINE:
        _snwprintf(szBuddy, MAX_STRING, L"%ws (Offline)", bstrName);
        break;
    case RTCXS_PRESENCE_ONLINE:
        _snwprintf(szBuddy, MAX_STRING, L"%ws (Online)", bstrName);
        break;
    case RTCXS_PRESENCE_AWAY:
        _snwprintf(szBuddy, MAX_STRING, L"%ws (Away)", bstrName);
        break;
    case RTCXS_PRESENCE_IDLE:
        _snwprintf(szBuddy, MAX_STRING, L"%ws (Idle)", bstrName);
        break;
    case RTCXS_PRESENCE_BUSY:
        _snwprintf(szBuddy, MAX_STRING, L"%ws (Busy)", bstrName);
        break;
    case RTCXS_PRESENCE_BE_RIGHT_BACK:
        _snwprintf(szBuddy, MAX_STRING, L"%ws (Be right back)", bstrName);
        break;
    case RTCXS_PRESENCE_ON_THE_PHONE:
        _snwprintf(szBuddy, MAX_STRING, L"%ws (On the phone)", bstrName);
        break;
    case RTCXS_PRESENCE_OUT_TO_LUNCH:
        _snwprintf(szBuddy, MAX_STRING, L"%ws (Out to lunch)", bstrName);
        break;
    default:
        _snwprintf(szBuddy, MAX_STRING, L"%ws", bstrName);
        break;
    }

    szBuddy[MAX_STRING-1] = L'\0';

    SAFE_FREE_STRING(bstrName);
    
	
    // Is the buddy in the tree?
	TVITEMEX tvix;
	int whichTree;

	ZeroMemory(&tvix, sizeof(TVITEMEX));

	HRESULT hFound = TreeViewHelper_FindBuddyNode(pBuddy, &tvix, &whichTree);

	if (hFound == E_FAIL)
    {
        // Buddy is not in the list
		// Create new TreeView Item
		
		TreeViewHelper_InsertNode(pBuddy, szBuddy, enStatus);
    }
    else
    {
		TreeView_DeleteItem(m_hBuddyTree, tvix.hItem);
		
		TreeViewHelper_InsertNode(pBuddy, szBuddy, enStatus);
			
		// Release the buddy reference
		SAFE_RELEASE(pBuddy);
	}


    return S_OK;
}

// ClearBuddyList : clear buddy item (repaint treeview)


HRESULT CRTCWin::ClearBuddyList(IRTCBuddy * pBuddy)
{
	HRESULT hr;
    
    if (pBuddy == NULL)
    {
        return S_OK;
    }

	// Is the buddy in the tree?
	TVITEMEX tvix;
	ZeroMemory(&tvix, sizeof(TVITEMEX));
	int whichTree;

	hr = TreeViewHelper_FindBuddyNode(pBuddy, &tvix, &whichTree);

	if (hr == S_OK)
	{
		TreeView_DeleteItem(m_hBuddyTree, tvix.hItem);
		
		SAFE_RELEASE(pBuddy);
	}

    return S_OK;
}


// ClearBuddyList :  clean up all buddy item (repaint treeview)
 

HRESULT CRTCWin::ClearBuddyList()
{
	HTREEITEM child;
	TVITEMEX tvix;

	// Online Nodes

	child = TreeView_GetNextItem(m_hBuddyTree, m_hOnlineParent, TVGN_CHILD);

	while (child != NULL)
	{
		HTREEITEM temp;

		// Retrieve the item
		ZeroMemory(&tvix, sizeof(TVITEMEX));
		tvix.mask = TVIF_PARAM;
		tvix.hItem = child;
		TreeView_GetItem(m_hBuddyTree, &tvix);

		// Release the buddy
		IRTCBuddy *pBuddy = (IRTCBuddy *) tvix.lParam;
		if (pBuddy)
		{
			SAFE_RELEASE(pBuddy);
		}
	

		// Delete the node and move on
		temp = TreeView_GetNextItem(m_hBuddyTree, child, TVGN_NEXT);
		TreeView_DeleteItem(m_hBuddyTree, child);
		child = temp;
	}

	//Offline Node
	
	child = TreeView_GetNextItem(m_hBuddyTree, m_hOfflineParent, TVGN_CHILD);

	while (child != NULL)
	{
		HTREEITEM temp;
		
		// Retrieve the item
		ZeroMemory(&tvix, sizeof(TVITEMEX));
		tvix.mask = TVIF_PARAM;
		tvix.hItem = child;
		TreeView_GetItem(m_hBuddyTree, &tvix);

		// Release the buddy
		IRTCBuddy *pBuddy = (IRTCBuddy *) tvix.lParam;
		if (pBuddy)
		{
			SAFE_RELEASE(pBuddy);
		}
		// Delete the node and move on
		temp = TreeView_GetNextItem(m_hBuddyTree, child, TVGN_NEXT);
		TreeView_DeleteItem(m_hBuddyTree, child);
		child = temp;
		
	}
	
    return S_OK;
}


// PopulateBuddyList : count buddy item
 

HRESULT CRTCWin::PopulateBuddyList()
{
	HRESULT hr;

    // Get the RTC client presence interface
    IRTCClientPresence * pPresence = NULL;

    hr = m_pClient->QueryInterface(
            __uuidof(IRTCClientPresence),
            (void **)&pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    // Enumerate buddies and populate list
    IRTCEnumBuddies * pEnum = NULL;
    IRTCBuddy * pBuddy = NULL;

    hr = pPresence->EnumerateBuddies(&pEnum);

    SAFE_RELEASE(pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    while (pEnum->Next(1, &pBuddy, NULL) == S_OK)
    {
        // Update the buddy list entry
        UpdateBuddyList(pBuddy);

        SAFE_RELEASE(pBuddy);
    }

    SAFE_RELEASE(pEnum);

    return S_OK;
}


// DoLogOn : when user input uri/ip. application will find server
 

HRESULT CRTCWin::DoLogOn(BSTR bstrURI, BSTR bstrServer, BSTR bstrTransport)
{
	HRESULT hr;

    if (m_pProfile)
    {
        // Already logged on
        ShowMessageBox(L"Logon Pass!",MB_OK);

        return S_FALSE;
    }

	m_nLogonAttemptCount = 0;

    hr = DoGetProfile(bstrURI, bstrServer, bstrTransport);

    if (FAILED(hr))
    {
        ShowMessageBox(L"Logon failed!",MB_ICONERROR);

        return hr;
    }

    SetStatusText(L"Finding server");

    // Enable/disable menu items
    HMENU hMenu = GetMenu(m_hWnd);

    EnableMenuItem(hMenu, ID_FILE_LOGON, MF_GRAYED);
    EnableMenuItem(hMenu, ID_FILE_LOGOFF, MF_GRAYED);

    return S_OK;
}


// OnLoggingOn : when application connecting server


HRESULT CRTCWin::OnLoggingOn()
{
	SetStatusText(L"Conecting Server");

    // Enable/disable menu items
    HMENU hMenu = GetMenu(m_hWnd);

    EnableMenuItem(hMenu, ID_FILE_LOGON, MF_GRAYED);
    EnableMenuItem(hMenu, ID_FILE_LOGOFF, MF_ENABLED);

    return S_OK;
}


// OnLoggedOn :  when login already
 

HRESULT CRTCWin::OnLoggedOn()
{
	HRESULT hr = S_OK;
    BSTR bstrURI = NULL;
    WCHAR szStatus[MAX_STRING];

    hr = GetUserURI(&bstrURI);

    if (FAILED(hr))
    {
        _snwprintf(szStatus, MAX_STRING, L"logged on");
	szStatus[MAX_STRING - 1] = L'\0';
    }
    else
    {
        _snwprintf(szStatus, MAX_STRING, L"[URI] %ws", bstrURI);
	szStatus[MAX_STRING - 1] = L'\0';

        SAFE_FREE_STRING(bstrURI);
    }

    SetStatusText(szStatus);

    PopulateBuddyList();

    // Enable/disable menu items
    HMENU hMenu = GetMenu(m_hWnd);

    EnableMenuItem(hMenu, ID_FILE_LOGON, MF_GRAYED);
    EnableMenuItem(hMenu, ID_FILE_LOGOFF, MF_ENABLED);
    
	EnableMenuItem(hMenu, ID_CONTACTS_ADDBUDDY, MF_ENABLED);  
    EnableMenuItem(hMenu, ID_CONTACTS_BLOCK, MF_ENABLED);
	
	EnableMenuItem(hMenu, ID_ACTION_MESSAGE, MF_ENABLED);
	EnableMenuItem(hMenu, ID_ACTION_CALL, MF_ENABLED);

    return S_OK;
}


// DoLogOff : when application will log off

HRESULT CRTCWin::DoLogOff()
{
	HRESULT hr = S_OK;

    if (!m_pProfile)
    {
        // Already logged off
        OnLoggedOff();
        return S_OK;
    }

    // Disable profile
    DoEnableProfile(FALSE, 0, 0);

    SAFE_RELEASE(m_pProfile);

    return hr;
}


// OnLoggingOff : log off inprogress
 

HRESULT CRTCWin::OnLoggingOff()
{
	SetStatusText(L"Logging off");

    // Enable/disable menu items
    HMENU hMenu = GetMenu(m_hWnd);

    EnableMenuItem(hMenu, ID_FILE_LOGON, MF_GRAYED);
    EnableMenuItem(hMenu, ID_FILE_LOGOFF, MF_GRAYED);
    
	EnableMenuItem(hMenu, ID_CONTACTS_ADDBUDDY, MF_GRAYED);
    EnableMenuItem(hMenu, ID_CONTACTS_BLOCK, MF_GRAYED);

	EnableMenuItem(hMenu, ID_ACTION_MESSAGE, MF_GRAYED);
	EnableMenuItem(hMenu, ID_ACTION_CALL, MF_GRAYED); 

    return S_OK;
}


// OnLoggedOff : when application log off already
 

HRESULT CRTCWin::OnLoggedOff()
{
	SetStatusText(L"Logged off");

    // Disable presence
    DoEnablePresence(FALSE);  

    // Cleanup the watcher windows
    CleanupWatchers();

    // Enable/disable menu items
    HMENU hMenu = GetMenu(m_hWnd);

    EnableMenuItem(hMenu, ID_FILE_LOGON, MF_ENABLED);
    EnableMenuItem(hMenu, ID_FILE_LOGOFF, MF_GRAYED);
    
	EnableMenuItem(hMenu, ID_CONTACTS_ADDBUDDY, MF_GRAYED);
    EnableMenuItem(hMenu, ID_CONTACTS_BLOCK, MF_GRAYED);

	EnableMenuItem(hMenu, ID_ACTION_MESSAGE, MF_GRAYED);
	EnableMenuItem(hMenu, ID_ACTION_CALL, MF_GRAYED);

    return S_OK;
}

// DoGetProfile : get profile of user


HRESULT CRTCWin::DoGetProfile(BSTR bstrURI, BSTR bstrServer, BSTR bstrTransport)
{
	HRESULT hr;

    // Find transport 

	long lTransport = 0;
	
    if (bstrTransport != NULL)
    {
        if (!_wcsicmp(bstrTransport, L"UDP"))
        {
            lTransport = RTCTR_UDP;
        }
        else if (!_wcsicmp(bstrTransport, L"TCP"))
        {
            lTransport = RTCTR_TCP;
        }
        else if (!_wcsicmp(bstrTransport, L"TLS"))
        {
            lTransport = RTCTR_TLS;
        }
    }
	

    // Get the RTC client provisioning interface
    IRTCClientProvisioning2 * pProv = NULL;

    hr = m_pClient->QueryInterface(
            __uuidof(IRTCClientProvisioning2),
            (void **)&pProv);

    if (FAILED(hr))
    {
        return hr;
    }

    // Get the profile
    hr = pProv->GetProfile(
            NULL,           // bstrUserAccount
            NULL,           // bstrUserPassword
            bstrURI,        // bstrUserURI
            bstrServer,     // bstrServer
            lTransport,     // lTransport
            0               // lCookie
            );

    SAFE_RELEASE(pProv);

    if (FAILED(hr))
    {
        return hr;    
    }

    return S_OK;
}


// DoEnableProfile 


HRESULT CRTCWin::DoEnableProfile(BOOL fEnable, long lRegisterFlags, long lRoamingFlags)
{
	HRESULT hr;

    // Get the RTC client provisioning interface
    IRTCClientProvisioning2 * pProv = NULL;

    hr = m_pClient->QueryInterface(
            __uuidof(IRTCClientProvisioning2),
            (void **)&pProv);

    if (FAILED(hr))
    {
        return hr;
    }

    if (fEnable)
    {
        // Enable the RTC profile object
        hr = pProv->EnableProfileEx(m_pProfile, lRegisterFlags, lRoamingFlags);

        SAFE_RELEASE(pProv);

        if (FAILED(hr))
        {
            return hr;    
        }
    }
    else
    {
        // Disable the RTC profile object
        hr = pProv->DisableProfile(m_pProfile);

        SAFE_RELEASE(pProv);

        if (FAILED(hr))
        {
            return hr;    
        }
    }

    return S_OK;
}


// DoRegister


HRESULT CRTCWin::DoRegister()
{
	HRESULT hr;


    // Enable presence
    hr = DoEnablePresence(TRUE);

    if (FAILED(hr))
    {
        return hr;
    }

    // Enable the RTC profile object
    hr = DoEnableProfile(TRUE,
        RTCRF_REGISTER_ALL,
        RTCRMF_BUDDY_ROAMING |
        RTCRMF_WATCHER_ROAMING |
        RTCRMF_PRESENCE_ROAMING |
        RTCRMF_PROFILE_ROAMING
        );

    if (FAILED(hr))
    {
        return hr;    
    }
    
    return S_OK;
}


// DoAuth : after get user uri and password. this function will call doregister
 

HRESULT CRTCWin::DoAuth(BSTR bstrURI, BSTR bstrAccount, BSTR bstrPassword)
{
	HRESULT hr;

    // set credentials for login with password
    hr = m_pProfile->SetCredentials(bstrURI, bstrAccount, bstrPassword);

    if (FAILED(hr))
    {
        return hr;
    }

    // Re-register
    hr = DoRegister();

    if (FAILED(hr))
    {
        return hr;
    }


    return S_OK;
}


// DoEnablePresence
 

HRESULT CRTCWin::DoEnablePresence(BOOL fEnable)
{    

// EnablePresenceEx on a Profile (which you can create using GetProfile).
// required before calling EnableProfileEx.


    IRTCClientPresence2 * pPresence = NULL;
    HRESULT hr;

    if (m_fPresenceEnabled == fEnable)
    {
        // Already in correct state
        return S_FALSE;
    }

    // Cleanup the buddy list
    ClearBuddyList();

    // Get the RTC client presence interface
    hr = m_pClient->QueryInterface(
            __uuidof(IRTCClientPresence2),
            (void **)&pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    if (fEnable)
    {

        // Build the filename for presence storage
        // from the user URI
        VARIANT varStorage;
        VariantInit(&varStorage);
        varStorage.vt = VT_BSTR;  
        BSTR bstrURI = NULL;

        hr = m_pProfile->get_UserURI(&bstrURI);
        
        if (FAILED(hr))
        {
            SAFE_RELEASE(pPresence);
            return hr;
        }

        WCHAR * pch = bstrURI;
        size_t cch;
	cch  = wcslen(bstrURI) + wcslen(L"presence_.xml") + 1;

        while (*pch != L'\0')
        {
            // Replace all non-alphanumeric characters
            // in the URI with underscore
            if (!((*pch >= L'a') && (*pch <= L'z')) &&
                !((*pch >= L'A') && (*pch <= L'Z')) &&
                !((*pch >= L'0') && (*pch <= L'9')))
            {
                *pch = L'_';
            }

            pch++;
        }

        // Allocate space for the filename
        varStorage.bstrVal = SysAllocStringLen(NULL, (ULONG) cch);

        if (!varStorage.bstrVal)
        {
            // Out of memory
            SAFE_RELEASE(pPresence);
            SAFE_FREE_STRING(bstrURI);
            return E_OUTOFMEMORY;
        }

        // Create the filename
        _snwprintf(varStorage.bstrVal, cch, L"presence_%ws.xml", bstrURI);
        SAFE_FREE_STRING(bstrURI);              
        
        // Enable presence
        hr = pPresence->EnablePresenceEx(m_pProfile, varStorage, 0);        
        VariantClear(&varStorage);

        if (FAILED(hr))
        {
            SAFE_RELEASE(pPresence);
            return hr;
        }

        // Set a presence property
        BSTR bstrPropName = SysAllocString(L"http://schemas.microsoft.com/rtc/rtcsample");
        BSTR bstrPropVal = SysAllocString(L"<name> rtcsample </rtcsample>");
        
        if (bstrPropName && bstrPropVal)
        {
		hr = pPresence->SetPresenceData(bstrPropName, bstrPropVal);


        }
		
	wchar_t wszCnBuffer[MAX_COMPUTER_NAME_LENGTH]; // Max computer name length is 256 I believe
	BOOL fSuccessComputerName = FALSE;
	DWORD dwLength = MAX_COMPUTER_NAME_LENGTH - 1;
	fSuccessComputerName = GetComputerNameW(wszCnBuffer, &dwLength);

	if (fSuccessComputerName)
	{
		#define SAMPLE_STR_SIZE 13
		// ( size of "(RTCSampleT)" + 1)

		wchar_t *wszNewDeviceName = new wchar_t[dwLength + 1 + SAMPLE_STR_SIZE + 1];

		if (!wszNewDeviceName)
			return E_OUTOFMEMORY;

		wcscpy(wszNewDeviceName, wszCnBuffer);
		wcscat(wszNewDeviceName, L" (RTCSampleT)");

		BSTR bstrDeviceName = ::SysAllocString(wszNewDeviceName);
		delete [] wszNewDeviceName;

		hr = pPresence->put_PresenceProperty(RTCPP_DEVICE_NAME, bstrDeviceName);
		SAFE_FREE_STRING(bstrDeviceName);
	}

        SAFE_FREE_STRING(bstrPropName);
        SAFE_FREE_STRING(bstrPropVal);
        
    }
    else
    {
        // Disable presence
        hr = pPresence->DisablePresence();

        if (FAILED(hr))
        {
            SAFE_RELEASE(pPresence);
            return hr;
        }
    }

    // Set the enabled flag
    m_fPresenceEnabled = fEnable;

    SAFE_RELEASE(pPresence);


    return S_OK;
}


// DoAddBuddy : add a new contact
 

HRESULT CRTCWin::DoAddBuddy(BSTR bstrURI, BSTR bstrName)
{
	HRESULT hr;


    // Get the RTC client presence interface
    IRTCClientPresence * pPresence = NULL;

    hr = m_pClient->QueryInterface(
            __uuidof(IRTCClientPresence),
            (void **)&pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    // Add the buddy
    IRTCBuddy * pBuddy = NULL;

    hr = pPresence->AddBuddy(
            bstrURI,
            bstrName,
            NULL,
            VARIANT_TRUE,
            NULL,
            0,
            &pBuddy);

    SAFE_RELEASE(pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    if (pBuddy)
    {
        // Update the buddy list entry
        UpdateBuddyList(pBuddy);
        SAFE_RELEASE(pBuddy);
    }


    return S_OK;
}


// DoRefreshBuddy : refresh buddy (online/offline)


HRESULT CRTCWin::DoRefreshBuddy(IRTCBuddy *pBuddy)
{
	HRESULT hr;

    // Get the IRTCBuddy2 interface
    IRTCBuddy2 * pBuddy2 = NULL;
	
    hr = pBuddy->QueryInterface(
            __uuidof(IRTCBuddy2),
            (void **)&pBuddy2);
	
    if (FAILED(hr))
    {
        return hr;
    }

    // Refresh the buddy
    hr = pBuddy2->Refresh();

    SAFE_RELEASE(pBuddy2);

    if (FAILED(hr))
    {
        return hr;
    }


    return S_OK;
}


 
// DoRemoveBuddy :  remove a contact


HRESULT CRTCWin::DoRemoveBuddy(IRTCBuddy *pBuddy)
{
	HRESULT hr;


    // Get the RTC client presence interface
    IRTCClientPresence * pPresence = NULL;

    hr = m_pClient->QueryInterface(
            __uuidof(IRTCClientPresence),
            (void **)&pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    // Remove the buddy
    hr = pPresence->RemoveBuddy(pBuddy);

    SAFE_RELEASE(pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    return S_OK;
}


// DoCall :  action communicate with buddy (im/av)


HRESULT CRTCWin::DoCall(RTC_SESSION_TYPE enType, BSTR bstrURI, BSTR bstrName)
{
	HRESULT hr;
	LONG    lGetMedia;


    if (enType == RTCST_PC_TO_PC || enType == RTCST_PC_TO_PHONE)
    {
        // can use it one time at the same time
        if (CRTCAVSession::m_Singleton != NULL)
        {
            ShowMessageBox(L"An audio/video call is in progress!",MB_ICONSTOP);

            return S_FALSE;
        }

    }

	hr = m_pClient->get_PreferredMediaTypes(&lGetMedia);
	if (FAILED(hr))
    {
        return hr;
    }

    // Create the session
    IRTCSession * pSession = NULL;

    hr = m_pClient->CreateSession(
        enType,
        NULL,
        NULL,
        0,
        &pSession
        );

    if (FAILED(hr))
    {
        return hr;
    }


    // Add the participant to the session
    hr = pSession->AddParticipant(
        bstrURI,
        bstrName,
        NULL
        );

    if (FAILED(hr))
    {
        SAFE_RELEASE(pSession);
        return hr;
    }

    // Add the session to the session list
    // This will create the session window
    hr = AddSession(pSession, enType);
    
    SAFE_RELEASE(pSession);

    if (FAILED(hr))
    {    
        return hr;
    }

    return S_OK;
}


// DoSetPresence : set status
 

HRESULT CRTCWin::DoSetPresence(RTC_PRESENCE_STATUS enStatus)
{
	HRESULT hr;
    UINT id = 0;

    // Check the appropriate menu item
    switch(enStatus)
    {
    case RTCXS_PRESENCE_OFFLINE:
        id = ID_FILE_PRESENCESTATUS_OFFLINE;
        break;

    case RTCXS_PRESENCE_ONLINE:
        id = ID_FILE_PRESENCESTATUS_ONLINE;
        break;

    case RTCXS_PRESENCE_AWAY:
        id = ID_FILE_PRESENCESTATUS_AWAY;
        break;

    case RTCXS_PRESENCE_IDLE:
        id = ID_FILE_PRESENCESTATUS_IDLE;
        break;

    case RTCXS_PRESENCE_BUSY:
        id = ID_FILE_PRESENCESTATUS_BUSY;
        break;

    case RTCXS_PRESENCE_BE_RIGHT_BACK:
        id = ID_FILE_PRESENCESTATUS_BERIGHTBACK;
        break;

    case RTCXS_PRESENCE_ON_THE_PHONE:
        id = ID_FILE_PRESENCESTATUS_ONTHEPHONE;
        break;

    case RTCXS_PRESENCE_OUT_TO_LUNCH:
        id = ID_FILE_PRESENCESTATUS_OUTTOLUNCH;
        break;
    }

    CheckMenuRadioItem(
        GetMenu(m_hWnd),   // handle to menu
        ID_FILE_PRESENCESTATUS_OFFLINE,  // identifier or position of first item
        ID_FILE_PRESENCESTATUS_OUTTOLUNCH,   // identifier or position of last item
        id,  // identifier or position of menu item
        MF_BYCOMMAND    // function options
        );


    // Get the RTC client presence interface
    IRTCClientPresence * pPresence = NULL;

    hr = m_pClient->QueryInterface(
            __uuidof(IRTCClientPresence),
            (void **)&pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    // Set the local presence status
    hr = pPresence->SetLocalPresenceInfo(enStatus, NULL);

    SAFE_RELEASE(pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    return S_OK;
}


// DoDisplayName
HRESULT CRTCWin::DoDisplayName()
{
	HRESULT hr = S_OK;
	
	m_pClient->get_LocalUserName(&bstrDisplayName);


	ShowDisplayNameDialog(m_hWnd,&bstrDisplayName);

	m_pClient->put_LocalUserName(bstrDisplayName);

	SendMessageW(m_hClientName,WM_SETTEXT,0,(LPARAM)bstrDisplayName);


	return hr;
}


// DoBuddyProperties : show buddy's property

HRESULT	CRTCWin::DoBuddyProperties(IRTCBuddy *pBuddy)
{
	HRESULT hr = S_OK;

	IRTCBuddy2 *pBuddy2;

	pBuddy->QueryInterface(__uuidof(IRTCBuddy2),(LPVOID *)&pBuddy2);

	ShowBuddyPropertiesDialog(NULL,pBuddy2);

	SAFE_RELEASE(pBuddy2);

	return hr;

}

// WindowProc : main function in this class
//				check event (create, command, notify, rtc_event, close, destroy )
 

LRESULT CALLBACK CRTCWin::WindowProc(
  HWND hWnd,      // handle to window
  UINT uMsg,      // message identifier
  WPARAM wParam,  // first message parameter
  LPARAM lParam   // second message parameter
)
{
    CRTCWin * me = NULL;
    LRESULT  lr = 0;

    if ( uMsg == WM_CREATE )
    {
		// Create an instance of the class
        me = new CRTCWin;
        me->m_hWnd = hWnd;

        // Store the class instance pointer in the
        // window's user data for later retrieval
        SetWindowLongPtr(hWnd, GWLP_USERDATA, (LONG_PTR)me);
       
        lr = me->OnCreate(uMsg, wParam, lParam);
    }
    else
    {
        // Retrieve the class instance pointer from the
        // window's user data
        me = (CRTCWin *)GetWindowLongPtr(hWnd, GWLP_USERDATA);

        switch( uMsg )
        {        
        case WM_DESTROY:
            
			lr = me->OnDestroy(uMsg, wParam, lParam);

            // Delete the object instance
            delete me;

            // Quit the application
            PostQuitMessage(0);
            break;

        case WM_CLOSE:
			lr = me->OnClose(uMsg, wParam, lParam);
            break;

        case WM_SIZE:
			lr = me->OnSize(uMsg, wParam, lParam);
            break;

        case WM_COMMAND:
			lr = me->OnCommand(uMsg, wParam, lParam);
            break;

        case WM_NOTIFY:
			lr = me->OnNotify(uMsg, wParam, lParam);
            break;

        case WM_RTC_EVENT:
			lr = me->OnRTCEvent(uMsg, wParam, lParam);
            break;
      
        default:
			lr = DefWindowProc( hWnd, uMsg, wParam, lParam );
        }
    }

    return lr;
}


// :OnCreate : when create main application
 

LRESULT CRTCWin::OnCreate(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	UNREFERENCED_PARAMETER(wParam);
	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);
	

	HIMAGELIST hImageList;      // Image list array hadle
	HBITMAP hBitMap;            // bitmap handler


    // Create the status bar
    m_hStatusBar = CreateStatusWindow(
        WS_CHILD | WS_VISIBLE,
        NULL,
        m_hWnd,
        IDC_STATUSBAR
        );

    if ( !m_hStatusBar )
    {
        return -1;
    }

	// Create the buddy tree view
    m_hBuddyTree = CreateWindowExW(
        WS_EX_CLIENTEDGE,
        L"SysTreeView32",
        NULL,
        WS_CHILD | WS_VISIBLE | 
		TVS_TRACKSELECT | TVS_LINESATROOT | TVS_HASBUTTONS,
        0, 0,
        0, 0,
        m_hWnd,
        (HMENU)IDC_BUDDYTREE,
        GetModuleHandle(NULL),
        NULL);

    if ( !m_hBuddyTree )
    {
        return -1;
    }


	// Create text name
	m_hContactText = CreateWindowExW(
		0,
        L"STATIC",
        L"Name:",
        WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN | WS_CLIPSIBLINGS,
        0, 0,
        0, 0,
        m_hWnd,
        NULL,
        GetModuleHandle(NULL),
        NULL);
	
	if ( !m_hContactText )
    {
        return -1;
    }

	// Create the Add buddy button
    m_hAddBuddy = CreateWindowExW(
        0,
        L"BUTTON",
        L"+ Add a Contact",
        WS_CHILD | WS_VISIBLE | WS_CLIPSIBLINGS | BS_PUSHBUTTON,
        0, 0,
        0, 0,
        m_hWnd,
        (HMENU)IDC_ADD_BUDDY,
        GetModuleHandle(NULL),
        NULL);
    
    if ( !m_hAddBuddy )
    {
        return -1;
    }

	// Create the Name control
    m_hClientName = CreateWindowEx(
        WS_EX_CLIENTEDGE,
        L"EDIT",
        NULL,
        WS_CHILD | WS_VISIBLE | WS_CLIPSIBLINGS | WS_TABSTOP | 
		ES_READONLY,
        0, 0,
        0, 0,
        m_hWnd,
        (HMENU)IDC_CLIENT_NAME,
        GetModuleHandle(NULL),
        NULL);
    
    if ( !m_hClientName )
    {
        return -1;
    }


	//create image list
	hImageList = ImageList_Create(16,16,ILC_COLOR16,7,0);

	hBitMap = LoadBitmap(hInst,MAKEINTRESOURCE(IDB_ONLINENODE));
	iconOnNode = ImageList_Add(hImageList, hBitMap, NULL);
	DeleteObject(hBitMap);

	hBitMap = LoadBitmap(hInst,MAKEINTRESOURCE(IDB_OFFLINENODE));
	iconOffNode = ImageList_Add(hImageList, hBitMap, NULL);
	DeleteObject(hBitMap);
	
	hBitMap = LoadBitmap(hInst,MAKEINTRESOURCE(IDB_ONLINE));
	iconOn = ImageList_Add(hImageList, hBitMap, NULL);
	DeleteObject(hBitMap);
	
	hBitMap = LoadBitmap(hInst,MAKEINTRESOURCE(IDB_OFFLINE));
	iconOff = ImageList_Add(hImageList, hBitMap, NULL);
	DeleteObject(hBitMap);

	hBitMap = LoadBitmap(hInst,MAKEINTRESOURCE(IDB_AWAY));
	iconAway = ImageList_Add(hImageList, hBitMap, NULL);
	DeleteObject(hBitMap);

	hBitMap = LoadBitmap(hInst,MAKEINTRESOURCE(IDB_BUSY));
	iconBusy = ImageList_Add(hImageList, hBitMap, NULL);
	DeleteObject(hBitMap);

	hBitMap = LoadBitmap(hInst,MAKEINTRESOURCE(IDB_PHONE));
	iconPhone = ImageList_Add(hImageList, hBitMap, NULL);
	DeleteObject(hBitMap);


	if(ImageList_GetImageCount(hImageList) < 7)
		return FALSE;

	TreeView_SetImageList(m_hBuddyTree, hImageList, TVSIL_NORMAL);



	
	// Add online and offline groups

	TV_ITEM tviNewItem;
	ZeroMemory(&tviNewItem, sizeof(TV_ITEM));


	TVINSERTSTRUCT tvis;
	ZeroMemory(&tvis, sizeof(TVINSERTSTRUCT));

	HTREEITEM hti;


	tviNewItem.mask = TVIF_TEXT | TVIF_IMAGE | TVIF_SELECTEDIMAGE | TVIF_PARAM; //TVIF_TEXT;
	tviNewItem.pszText = L"Online";
	tviNewItem.iImage = iconOnNode;
	tviNewItem.iSelectedImage = iconOnNode;


	tvis.hParent = TVI_ROOT;
	tvis.hInsertAfter = TVI_ROOT;
	tvis.item = tviNewItem;

	hti = TreeView_InsertItem(m_hBuddyTree, &tvis);


    if (hti == NULL)
    {
		return E_FAIL;
	}
	else
	{
		m_hOnlineParent = (HWND) hti;
	}

	ZeroMemory(&tviNewItem, sizeof(TV_ITEM));
	
	
	tviNewItem.mask = TVIF_TEXT | TVIF_IMAGE | TVIF_SELECTEDIMAGE | TVIF_PARAM; //TVIF_TEXT;
	tviNewItem.pszText = L"Offline";
	tviNewItem.iImage = iconOffNode;
	tviNewItem.iSelectedImage = iconOffNode;



	ZeroMemory(&tvis, sizeof(TVINSERTSTRUCT));
    
	tvis.hParent = TVI_ROOT;
	tvis.hInsertAfter = TVI_ROOT;
	tvis.item = tviNewItem;
	
	hti = TreeView_InsertItem(m_hBuddyTree, &tvis);

    if (hti == NULL)
    {
		return E_FAIL;
	}
	else
	{
		m_hOfflineParent = (HWND) hti;
	}
	
	// create an RTC Client object and query its version,
	// Initialize the client, 
	// set its event filter for the events we are interested in,
	// set the listen mode, 
	// attach the event sink.

    // Create the RTC client
    HRESULT hr;

    hr = CoCreateInstance(
        __uuidof(RTCClient),
        NULL,
        CLSCTX_INPROC_SERVER,
        __uuidof(IRTCClient2),
        (LPVOID *)&m_pClient
        );

    if (FAILED(hr))
    {
        ShowMessageBox(L"RTC Client v1.1 or higher required!",MB_ICONWARNING);
        return -1;
    }

    long lVersion;

    hr = m_pClient->get_Version(&lVersion);

    if (FAILED(hr))
    {
        ShowMessageBox(L"RTC Client v1.1 or higher required!",MB_ICONWARNING);
        return -1;
    }
	
	// check version (in this computer must use version of rtc over than 1.2)
    if (lVersion < 0x00010002)
    {
        // Unsupported RTCDLL version
        ShowMessageBox(L"RTC Client v1.2 or higher required!",MB_ICONWARNING);
        return -1;
    }

    // Initialize the RTC client
    hr = m_pClient->Initialize();

    if (FAILED(hr))
    {
        SAFE_RELEASE(m_pClient);
        return -1;
    }

    // Determine the event filter
    long lFlags = RTCEF_REGISTRATION_STATE_CHANGE |
                  RTCEF_SESSION_STATE_CHANGE |
                  RTCEF_PARTICIPANT_STATE_CHANGE |
                  RTCEF_MESSAGING |
                  RTCEF_MEDIA |
                  RTCEF_INTENSITY |
                  RTCEF_CLIENT |
                  RTCEF_BUDDY |
                  RTCEF_BUDDY2 |
                  RTCEF_WATCHER |
                  RTCEF_WATCHER2 |
                  RTCEF_GROUP |
                  RTCEF_USERSEARCH |
                  RTCEF_ROAMING |
                  RTCEF_PROFILE |
                  RTCEF_PRESENCE_PROPERTY | 
                  RTCEF_PRESENCE_DATA | 
				  RTCE_MEDIA_REQUEST;

    // Set the event filter for the RTC client
    hr = m_pClient->put_EventFilter(lFlags);

    if ( FAILED(hr) )
    {
        SAFE_RELEASE(m_pClient);
        return -1;
    }

    // Set the listen mode for RTC client
    // RTCLM_BOTH opens the standard SIP port 5060,
    
	hr = m_pClient->put_AllowedPorts(RTCTR_TCP, RTCLM_BOTH);
	if ( FAILED(hr) )
    {
        SAFE_RELEASE(m_pClient);
        return -1;
    }

	hr = m_pClient->put_AllowedPorts(RTCTR_UDP, RTCLM_BOTH);
    if ( FAILED(hr) )
    {
        SAFE_RELEASE(m_pClient);
        return -1;
    }

	// Answer Mode Calls

	hr = m_pClient->put_AnswerMode(RTCST_PC_TO_PC, RTCAM_OFFER_SESSION_EVENT);
	if ( FAILED(hr) )
	{
	        SAFE_RELEASE(m_pClient);
	        return -1;
	}

	hr = m_pClient->put_AnswerMode(RTCST_IM, RTCAM_AUTOMATICALLY_ACCEPT);
	if ( FAILED(hr) )
	{
	        SAFE_RELEASE(m_pClient);
	        return -1;
	}

	hr = m_pClient->put_AnswerMode(RTCST_MULTIPARTY_IM, RTCAM_AUTOMATICALLY_ACCEPT);
	if ( FAILED(hr) )
	{
	        SAFE_RELEASE(m_pClient);
	        return -1;
	}

	hr = m_pClient->put_AnswerMode(RTCST_APPLICATION, RTCAM_OFFER_SESSION_EVENT);
	if ( FAILED(hr) )
	{
	        SAFE_RELEASE(m_pClient);
	        return -1;
	}

	hr = m_pClient->put_AnswerMode(RTCST_PC_TO_PHONE, RTCAM_AUTOMATICALLY_REJECT);
	if ( FAILED(hr) )
	{
	        SAFE_RELEASE(m_pClient);
	}

	hr = m_pClient->put_AnswerMode(RTCST_PHONE_TO_PHONE, RTCAM_AUTOMATICALLY_REJECT);
	if ( FAILED(hr) )
	{
	        SAFE_RELEASE(m_pClient);
	}


    // Create the event sink object
    m_pEvents = new CRTCEvents;

    if (!m_pEvents)
    {
        // Out of memory
        SAFE_RELEASE(m_pClient);
        return -1;
    }

    // Advise for events from the RTC client
    hr = m_pEvents->Advise( m_pClient, m_hWnd );

    if ( FAILED(hr) )
    {
        SAFE_RELEASE(m_pClient);
        return -1;
    }

    // Register the client Version
    BSTR bstr = ::SysAllocString(L"RTCSample_Test_Version");
    hr = m_pClient->put_ClientName( bstr);
	::SysFreeString(bstr);

    WCHAR p[128];

    swprintf(p,L"Built:%S.%S", __DATE__,__TIME__);

    bstr = ::SysAllocString(p);
    hr = m_pClient->put_ClientCurVer( bstr);
    ::SysFreeString(bstr);
    


    if ( FAILED(hr) )
    {
        SAFE_RELEASE(m_pClient);
        return -1;
    }


    // Initialize presence status
    DoSetPresence(RTCXS_PRESENCE_ONLINE);

    // Show the login dialog
    PostMessage(m_hWnd, WM_COMMAND, MAKEWPARAM(ID_FILE_LOGON, 0), 0);
    return 0;
}


// OnDestroy : when application will destroy (shutdown)
 

LRESULT CRTCWin::OnDestroy(UINT uMsg, WPARAM wParam, LPARAM lParam)
{  
	// WM_DESTROY has three parameters. We will pass them to our Destroy Proc for future use
	// They are not currently used.

	UNREFERENCED_PARAMETER(wParam);
	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);

    // Release the RTC profile
    SAFE_RELEASE(m_pProfile);

    // Cleanup the buddy list
    ClearBuddyList();

	
    if (m_pClient)
    {
        if (m_pEvents)
        {
            // Unadvise for events from the RTC client
            m_pEvents->Unadvise(m_pClient);
            m_pEvents = NULL;
        }

        // Shutdown the RTC client
        m_pClient->Shutdown();

        // Release the RTC client
        SAFE_RELEASE(m_pClient);
    }
    return 0;
}


// OnClose : prepare shutdown before OnDestroy


LRESULT CRTCWin::OnClose(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	// WM_CLOSE has three parameters. We will pass them to our Close Proc for future use
	// They are not currently used.

	UNREFERENCED_PARAMETER(wParam);
	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);

    HRESULT hr = S_OK;


    // Cleanup the existing session windows
    CleanupSessions();

    // Cleanup the watcher windows
    CleanupWatchers();


    if (m_pClient)
    {
        // Prepare the RTC client object for shutdown
        hr = m_pClient->PrepareForShutdown();
    }

    if (!m_pClient || FAILED(hr))
    {
        //prepare for shutdown so should destroy window
        DestroyWindow(m_hWnd);
    }
    else
    {
        // The RTC client object is preparing to shutdown.
        // We should wait for the RTCCET_ASYNC_CLEANUP_DONE
        // event before we shutdown the RTC client. For now
        // just hide the window
        ShowWindow(m_hWnd, SW_HIDE);
    }

    return 0;
}

// OnSize :  change size main dialog
 

LRESULT CRTCWin::OnSize(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	RECT rcWnd, rcStatusBar, rcBuddyList, rcContactText,rcAddBuddy,rcClientName;

    const int SIZE_EDGE = 5;
	const int TEXT_HEIGHT = 20;
	const int SIZE_BUTTON = 20;

    GetClientRect(m_hWnd, &rcWnd);

    // Resize the status bar
    SendMessage(m_hStatusBar, uMsg, wParam, lParam);

    GetClientRect(m_hStatusBar, &rcStatusBar);

	// client name edit box
	rcClientName.top = rcWnd.top + SIZE_EDGE;
	rcClientName.bottom = rcClientName.top + TEXT_HEIGHT;
	rcClientName.left = 50 + SIZE_EDGE;
	rcClientName.right = rcWnd.right - SIZE_EDGE;
	
	MoveWindow(
		m_hClientName,
		rcClientName.left,
		rcClientName.top,
		(rcClientName.right - rcClientName.left),
		(rcClientName.bottom - rcClientName.top),
		TRUE);

	BSTR name;
	GetUserName(&name);

	SendMessageW(m_hClientName, WM_SETTEXT, 0, (LPARAM) name);
	
	// Client Name static text
	rcContactText.top = rcWnd.top + SIZE_EDGE;
	rcContactText.left = rcWnd.left + SIZE_EDGE;
	rcContactText.right = rcClientName.left - SIZE_EDGE;
	rcContactText.bottom = rcContactText.top + TEXT_HEIGHT;

	MoveWindow(
        m_hContactText,
        rcContactText.left,
        rcContactText.top,
        (rcContactText.right - rcContactText.left),
        (rcContactText.bottom - rcContactText.top),
        TRUE);

	// Tree view
	rcBuddyList.top = rcClientName.bottom + SIZE_EDGE;
    rcBuddyList.right = rcWnd.right - SIZE_EDGE;
    rcBuddyList.left = rcWnd.left + SIZE_EDGE;
	rcBuddyList.bottom = rcWnd.bottom - (rcStatusBar.bottom - rcStatusBar.top) - 2*SIZE_EDGE - SIZE_BUTTON;
    
	MoveWindow(
        m_hBuddyTree,
        rcBuddyList.left,
        rcBuddyList.top,
        (rcBuddyList.right - rcBuddyList.left),
        (rcBuddyList.bottom - rcBuddyList.top),
        TRUE);
	
	// add contact button
	rcAddBuddy.left = rcWnd.left + SIZE_EDGE;
	rcAddBuddy.right = rcAddBuddy.left + 110;
	rcAddBuddy.top = rcBuddyList.bottom + SIZE_EDGE;
	rcAddBuddy.bottom = rcAddBuddy.top + SIZE_BUTTON;

	MoveWindow(
        m_hAddBuddy,
        rcAddBuddy.left,
        rcAddBuddy.top,
        (rcAddBuddy.right - rcAddBuddy.left),
        (rcAddBuddy.bottom - rcAddBuddy.top),
        TRUE);


    return 0;
}


// OnCommand : when get command from controls
 

LRESULT CRTCWin::OnCommand(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	// WM_COMMAND has three parameters. We will pass them to our Command Proc for future use
	// They are not all currently used.

	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);

    HRESULT hr;

    switch(LOWORD(wParam))
    {
    // menu login...
	case ID_FILE_LOGON:
        {

            BSTR bstrURI = NULL;
            BSTR bstrServer = NULL;
            BSTR bstrTransport = NULL;

            // show login dialog
			hr = ShowLoginDialog(m_hWnd, &bstrURI, &bstrServer, &bstrTransport);

            if (FAILED(hr))
            {
				//click cancle button at login dialog so loggedoff
				OnLoggedOff();
                break;
            }


			//always use TCP because when use UDP and TLS it can't log in
			bstrTransport = L"TCP";

            DoLogOn(bstrURI, bstrServer, bstrTransport);

            SAFE_FREE_STRING(bstrURI);
            SAFE_FREE_STRING(bstrServer);
            SAFE_FREE_STRING(bstrTransport);
        }
        break;

    //menu logout
	case ID_FILE_LOGOFF:
        DoLogOff();
        break;

    //menu exit
	case ID_FILE_EXIT:
        PostMessage(m_hWnd, WM_CLOSE, 0, 0);
        break;
	
	//menu status group
	case ID_FILE_PRESENCESTATUS_OFFLINE:
        DoSetPresence(RTCXS_PRESENCE_OFFLINE);
        break;

    case ID_FILE_PRESENCESTATUS_ONLINE:
        DoSetPresence(RTCXS_PRESENCE_ONLINE);
        break;

    case ID_FILE_PRESENCESTATUS_AWAY:
        DoSetPresence(RTCXS_PRESENCE_AWAY);
        break;

    case ID_FILE_PRESENCESTATUS_IDLE:
        DoSetPresence(RTCXS_PRESENCE_IDLE);
        break;

    case ID_FILE_PRESENCESTATUS_BUSY:
        DoSetPresence(RTCXS_PRESENCE_BUSY);
        break;

    case ID_FILE_PRESENCESTATUS_BERIGHTBACK:
        DoSetPresence(RTCXS_PRESENCE_BE_RIGHT_BACK);
        break;

    case ID_FILE_PRESENCESTATUS_ONTHEPHONE:
        DoSetPresence(RTCXS_PRESENCE_ON_THE_PHONE);
        break;

    case ID_FILE_PRESENCESTATUS_OUTTOLUNCH:
        DoSetPresence(RTCXS_PRESENCE_OUT_TO_LUNCH);
        break;

	// button add buddy
	case IDC_ADD_BUDDY:
		
	// menu add a contact
    case ID_CONTACTS_ADDBUDDY:
        {
            BSTR bstrURI = NULL;
            BSTR bstrName = NULL;

            // Show the add buddy dialog
            hr = ShowAddressDialog(m_hWnd, L"Add a contact", &bstrURI, &bstrName);

            if (FAILED(hr))
            {
                break;
            }
        
            // Add the buddy
            DoAddBuddy(bstrURI, bstrName);

            SAFE_FREE_STRING(bstrURI);
            SAFE_FREE_STRING(bstrName);
        }
        break;
	// menu Block/unblock
	case ID_CONTACTS_BLOCK:
		{
			AddWatchers();
		}
			break;
	//menu Start Audio/Video Conversation...
    case ID_ACTION_CALL:
        {
            BSTR bstrURI = NULL;

            // Show the call dialog
            hr = ShowAddressDialog(m_hWnd, L"Call To", &bstrURI, NULL);

            if (FAILED(hr))
            {
                break;
            }

            // Call the user
            DoCall(RTCST_PC_TO_PC, bstrURI, NULL);

            SAFE_FREE_STRING(bstrURI);
        }
        break;
	//menu Send an Instant Message...
    case ID_ACTION_MESSAGE:
        {
            BSTR bstrURI = NULL;

            // Show the call dialog
            hr = ShowAddressDialog(m_hWnd, L"Conversation with", &bstrURI, NULL);

            if (FAILED(hr))
            {
                break;
            }

			// Send a message to the user
            DoCall(RTCST_MULTIPARTY_IM, bstrURI, NULL);

            SAFE_FREE_STRING(bstrURI);
        }
        break;

	case ID_SETTINGS_DISPLAYNAME:
		DoDisplayName();
		break;
    }

    return 0;
}


// OnNotify : when user action with main dialog


LRESULT CRTCWin::OnNotify(UINT uMsg, WPARAM wParam, LPARAM lParam)
{    
	// WM_NOTIFY has three parameters. We will pass them to our Notify Proc for future use
	// They are not currently used.

	UNREFERENCED_PARAMETER(uMsg);

    int idCtrl = (int)wParam;
    LPNMHDR pnmh = (LPNMHDR)lParam;
    HRESULT hr;

	//when right click on name for choose action
	//when double click on name for chat
	if ( (pnmh->code == NM_RCLICK) ||(pnmh->code == NM_DBLCLK))
    {
		if ( idCtrl == IDC_BUDDYTREE )
        {
            // The user clicked on the buddy list
			TVHITTESTINFO tvht;

			ZeroMemory(&tvht, sizeof(TVHITTESTINFO));

            POINT pt;
            GetCursorPos(&pt);

            tvht.pt = pt;
            MapWindowPoints(NULL, pnmh->hwndFrom, &tvht.pt, 1 );
            
            HTREEITEM htriRes = TreeView_HitTest(pnmh->hwndFrom, &tvht);

            if (htriRes == NULL)
            {
                return 0;
            }

            if (tvht.flags & TVHT_ONITEM)
            {
                // The user clicked on a buddy
                TVITEMEX tvi;
                ZeroMemory(&tvi, sizeof(TVITEM));
    
                tvi.mask = TVIF_PARAM;
                tvi.hItem = htriRes;

                // Get the buddy item
                if (!TreeView_GetItem(m_hBuddyTree, &tvi))
                {
                    return 0;
                }

				if (tvi.lParam == NULL)
				{
					// We're on a parent, not a buddy. Return.
					return 0;
				}
                
                
				//name that hitted = pBuddy
				IRTCBuddy * pBuddy = (IRTCBuddy *)(tvi.lParam);
                
                // Get the buddy URI
                BSTR bstrURI = NULL;
                hr = pBuddy->get_PresentityURI(&bstrURI);

                if (FAILED(hr))
                {
                    return 0;
                }
                
                // Get the buddy name
                BSTR bstrName = NULL;
				IRTCBuddy2 *pBuddy2;

				//pBuddy queryinterface for to be pBuddy2
				pBuddy->QueryInterface(__uuidof(IRTCBuddy2), (LPVOID *)&pBuddy2);

                hr = pBuddy2->get_PresenceProperty(RTCPP_DISPLAYNAME, &bstrName);

				SAFE_RELEASE(pBuddy2);

                if (FAILED(hr) && (hr != RTC_E_NOT_EXIST))
                {
                    // get_Name failed
                    SAFE_FREE_STRING(bstrURI);
                    return 0;
                }


				//add Nueng
				//Get the buddy status
				RTC_PRESENCE_STATUS buddyStatus = RTCXS_PRESENCE_OFFLINE;
				hr = pBuddy->get_Status(&buddyStatus);
				
                if(pnmh->code == NM_DBLCLK && buddyStatus != RTCXS_PRESENCE_OFFLINE)
				{
					DoCall(RTCST_MULTIPARTY_IM, bstrURI, bstrName);
				}
				else if(pnmh->code == NM_RCLICK && buddyStatus != RTCXS_PRESENCE_OFFLINE)
				{
				
					// Show the buddy menu
					HMENU hMenuRes = LoadMenu( 
						GetModuleHandle(NULL),
						MAKEINTRESOURCE(IDR_MENU_BUDDY));

					HMENU hMenu = GetSubMenu(hMenuRes, 0);

					// Show the popup menu
					UINT uID = TrackPopupMenu(hMenu,
	                    TPM_LEFTALIGN | TPM_RIGHTBUTTON |
						TPM_NONOTIFY | TPM_RETURNCMD,
						pt.x, pt.y, 0, m_hWnd, NULL);
                
					switch (uID)
					{
					case ID_BUDDY_CALL:
						// Call the buddy
						DoCall(RTCST_PC_TO_PC, bstrURI, bstrName);
						break;

	                case ID_BUDDY_MESSAGE:
						// Send a message to the buddy
						DoCall(RTCST_MULTIPARTY_IM, bstrURI, bstrName);
						break;

					case ID_BUDDY_REFRESH:
						// Refresh the buddy
						DoRefreshBuddy(pBuddy);
						break;

					case ID_BUDDY_REMOVE:
						// Remove the buddy
						if (SUCCEEDED(DoRemoveBuddy(pBuddy)))
						{                    
							// Release the buddy reference
							SAFE_RELEASE(pBuddy);

							// Delete the buddy from the tree
							TreeView_DeleteItem(m_hBuddyTree, htriRes);

							TreeView_DeleteItem(m_hBuddyTree, htriRes);
						}
						break;

					case ID_BUDDY_PROPERTIES:
						//Display Presence Property Dialog
						DoBuddyProperties(pBuddy);
						break;
					}
				}
				else if(pnmh->code == NM_RCLICK && buddyStatus == RTCXS_PRESENCE_OFFLINE)
				{
				
					// Show the buddy menu
					HMENU hMenuRes = LoadMenu( 
						GetModuleHandle(NULL),
						MAKEINTRESOURCE(IDR_MENU_BUDDY2));

					HMENU hMenu = GetSubMenu(hMenuRes, 0);

					// Show the popup menu
					UINT uID = TrackPopupMenu(hMenu,
	                    TPM_LEFTALIGN | TPM_RIGHTBUTTON |
						TPM_NONOTIFY | TPM_RETURNCMD,
						pt.x, pt.y, 0, m_hWnd, NULL);

					EnableMenuItem(hMenu, ID_BUDDY_MESSAGE, MF_GRAYED); 
                
					switch (uID)
					{
					case ID_BUDDY_REFRESH:
						// Refresh the buddy
						DoRefreshBuddy(pBuddy);
						break;

					case ID_BUDDY_REMOVE:
						// Remove the buddy
						if (SUCCEEDED(DoRemoveBuddy(pBuddy)))
						{                    
							// Release the buddy reference
							SAFE_RELEASE(pBuddy);

							// Delete the buddy from the tree
							TreeView_DeleteItem(m_hBuddyTree, htriRes);

						
							TreeView_DeleteItem(m_hBuddyTree, htriRes);
						}
						break;

					case ID_BUDDY_PROPERTIES:
						//Display Presence Property Dialog
						DoBuddyProperties(pBuddy);
						break;
					}
				}
                SAFE_FREE_STRING(bstrURI);
            }
        }
    }

    return 0;
}


// OnRTCEvent : receive rtc event
 

LRESULT CRTCWin::OnRTCEvent(UINT uMsg, WPARAM wParam, LPARAM lParam)
{

	// WM_RTC_EVENT has three parameters. We will pass them to our Event Handler Proc for future use
	// They are not all currently used.

	UNREFERENCED_PARAMETER(uMsg);

    IDispatch * pDisp = (IDispatch *)lParam;
    RTC_EVENT enEvent = (RTC_EVENT)wParam;
    HRESULT hr;

    // Based on the RTC_EVENT type, query for the 
    // appropriate event interface and call a helper
    // method to handle the event
    switch ( enEvent )
    {
        case RTCE_REGISTRATION_STATE_CHANGE:
            {
                IRTCRegistrationStateChangeEvent * pEvent = NULL;
                
                hr = pDisp->QueryInterface( __uuidof(IRTCRegistrationStateChangeEvent),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCRegistrationStateChangeEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }              
            }
            break;

        case RTCE_SESSION_STATE_CHANGE:
            {
                IRTCSessionStateChangeEvent * pEvent = NULL;
                
                hr = pDisp->QueryInterface( __uuidof(IRTCSessionStateChangeEvent),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCSessionStateChangeEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }              
            }
            break;

        case RTCE_PARTICIPANT_STATE_CHANGE:
            {
                IRTCParticipantStateChangeEvent * pEvent = NULL;
                
                hr = pDisp->QueryInterface( __uuidof(IRTCParticipantStateChangeEvent),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCParticipantStateChangeEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }              
            }
            break;

        case RTCE_MESSAGING:
            {
                IRTCMessagingEvent * pEvent = NULL;
                
                hr = pDisp->QueryInterface( __uuidof(IRTCMessagingEvent),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCMessagingEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }              
            }
            break;

        case RTCE_MEDIA:
            {
                IRTCMediaEvent * pEvent = NULL;

                hr = pDisp->QueryInterface( __uuidof(IRTCMediaEvent),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCMediaEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }
            }
            break;

		case RTCE_MEDIA_REQUEST:
			{
				IRTCMediaRequestEvent *pEvent = NULL;

				hr = pDisp->QueryInterface( __uuidof(IRTCMediaRequestEvent), (void **) &pEvent);

				if (SUCCEEDED(hr))
				{
					OnRTCMediaRequestEvent(pEvent);
					SAFE_RELEASE(pEvent);

				}
			}
			break;

        case RTCE_INTENSITY:
            {
                IRTCIntensityEvent * pEvent = NULL;

                hr = pDisp->QueryInterface( __uuidof(IRTCIntensityEvent),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCIntensityEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }
            }
            break;

        case RTCE_CLIENT:
            {
                IRTCClientEvent * pEvent = NULL;

                hr = pDisp->QueryInterface( __uuidof(IRTCClientEvent),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCClientEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }
            }
            break;

        case RTCE_BUDDY:
            {
                IRTCBuddyEvent2 * pEvent = NULL;

                hr = pDisp->QueryInterface( __uuidof(IRTCBuddyEvent2),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCBuddyEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }
            }
            break;

        case RTCE_WATCHER:
            {
                IRTCWatcherEvent2 * pEvent = NULL;

                hr = pDisp->QueryInterface( __uuidof(IRTCWatcherEvent2),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCWatcherEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }
            }
            break;

        case RTCE_ROAMING:
            {
                IRTCRoamingEvent * pEvent = NULL;

                hr = pDisp->QueryInterface( __uuidof(IRTCRoamingEvent),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCRoamingEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }
            }
            break;

        case RTCE_PROFILE:
            {
                IRTCProfileEvent2 * pEvent = NULL;

                hr = pDisp->QueryInterface( __uuidof(IRTCProfileEvent2),
                                            (void **)&pEvent );

                if (SUCCEEDED(hr))
                {
                    OnRTCProfileEvent(pEvent);
                    SAFE_RELEASE(pEvent);
                }
            }
            break;
    }

    // Release the event
    SAFE_RELEASE(pDisp);


    return 0;
}


// OnRTCRegistrationStateChangeEvent : when register status have been changed
//										ex. login logoff authen
 

void CRTCWin::OnRTCRegistrationStateChangeEvent(IRTCRegistrationStateChangeEvent *pEvent)
{
	HRESULT hr;


    // Get the registration state
    RTC_REGISTRATION_STATE enState;
    long lStatusCode;

    hr = pEvent->get_State(&enState);

    if (FAILED(hr))
    {
        return;
    }

    // Get the status code
    hr = pEvent->get_StatusCode(&lStatusCode);

    if (FAILED(hr))
    {
        return;
    }

    hr = lStatusCode;

    switch(enState)
    {
    case RTCRS_UNREGISTERING:
        // Logoff in progress        
        OnLoggingOff();
        break;

    case RTCRS_NOT_REGISTERED:
        // Logged off        
        OnLoggedOff();
        break;

    case RTCRS_REGISTERING:
        // Logon in progress        
        OnLoggingOn();
        break;

    case RTCRS_REGISTERED:
        // Logged on
        OnLoggedOn();
        break;

    case RTCRS_REJECTED:
    case RTCRS_ERROR:
        {
            
            // Check if we need to authenticate
            if (m_nLogonAttemptCount < 3 &&
				((hr == RTC_E_STATUS_CLIENT_FORBIDDEN) ||
				(hr == RTC_E_STATUS_CLIENT_UNAUTHORIZED) ||
                (hr == RTC_E_STATUS_CLIENT_PROXY_AUTHENTICATION_REQUIRED)))
            {
				m_nLogonAttemptCount++;

				BSTR bstrURI = NULL; 
                BSTR bstrAccount = NULL; 
                BSTR bstrPassword = NULL; 
                BSTR bstrRealm = NULL;

                BSTR bstrServer = NULL;
                BSTR bstrTransport = NULL;

                hr = m_pProfile->get_Realm(&bstrRealm);


                // Display the authentication dialog  
                hr = ShowAuthenDialog(m_hWnd, bstrRealm,
                    &bstrURI, &bstrAccount, &bstrPassword,
                    &bstrServer, &bstrTransport);

                SAFE_FREE_STRING(bstrRealm);
                SAFE_FREE_STRING(bstrServer);
                SAFE_FREE_STRING(bstrTransport);

                if (FAILED(hr))
                {
                    DoLogOff();
                    OnLoggedOff();

                    ShowMessageBox(L"Logon failed!",MB_ICONERROR);
                    return;
                }

                // Do the authentication
                hr = DoAuth(bstrURI, bstrAccount, bstrPassword);

                SAFE_FREE_STRING(bstrURI);
                SAFE_FREE_STRING(bstrAccount);
                SAFE_FREE_STRING(bstrPassword);

                if (FAILED(hr))
                {
                    DoLogOff();
                    OnLoggedOff();

                    ShowMessageBox(L"Logon failed!",MB_ICONERROR);
                    return;
                }
            }
            else
            {
                DoLogOff();
                OnLoggedOff();

                // If we were logging on the show error
                if (m_enState == RTCRS_REGISTERING)
                {
                    ShowMessageBox(L"Logon failed!",MB_ICONERROR);
                }
                return;
            }
        }
        break;

    case RTCRS_LOGGED_OFF:
        // The user logged on at another client
        // The user is logged off from this client
	ShowMessageBox(L"The Server has logged you off (Perhaps you logged in from another location)",MB_ICONSTOP);
        DoLogOff();
	OnLoggedOff();
        break;

    case RTCRS_LOCAL_PA_LOGGED_OFF:
        // The user logged on at another client
        // The user's presence state is no longer sent from this client

        SetStatusText(L"Logged on (Presence disabled)");
        break;

    case RTCRS_REMOTE_PA_LOGGED_OFF:
        // The user logged off on another client that was sending his
        // presence state. We can ignore this.
        break;
    }

    m_enState = enState;

}

// OnRTCSessionStateChangeEvent : when session state have been changed
//									ex. addparticipant, terminate session


void CRTCWin::OnRTCSessionStateChangeEvent(IRTCSessionStateChangeEvent *pEvent)
{

    IRTCSession * pSession = NULL;
    CRTCSession * pSessWindow = NULL;
    RTC_SESSION_STATE enState;
    HRESULT hr;


    hr = pEvent->get_State(&enState);

    if (FAILED(hr))
    {
        return;
    }

    hr = pEvent->get_Session(&pSession);

    if (FAILED(hr))
    {
        return;
    }

    // Is this session in our session list?
    hr = FindSession(pSession, &pSessWindow);    

    if (FAILED(hr))
    {
        if (enState == RTCSS_INCOMING)
        {
            // This is a new session
            RTC_SESSION_TYPE enType;

            hr = pSession->get_Type(&enType);

            if (FAILED(hr))
            {
                SAFE_RELEASE(pSession);
                return;
            }            



            if (enType == RTCST_PC_TO_PC || enType == RTCST_PC_TO_PHONE)
            {

                // This is an AV call
                if (CRTCAVSession::m_Singleton != NULL)
                {
                    // If another AV call is in progress, then can't use it again
                    pSession->Terminate(RTCTR_BUSY);

                    SAFE_RELEASE(pSession);
                    return;
                }

                // Get the participant object
                IRTCEnumParticipants * pEnum = NULL;
                IRTCParticipant * pParticipant = NULL;

                hr = pSession->EnumerateParticipants(&pEnum);

                if (FAILED(hr))
                {
                    // EnumerateParticipants failed
                    SAFE_RELEASE(pSession);
                    return;
                }

                hr = pEnum->Next(1, &pParticipant, NULL);

                SAFE_RELEASE(pEnum);

                if (hr != S_OK)
                {
                    SAFE_RELEASE(pSession);
                    return;
                }

                // Get the participant URI
                BSTR bstrURI = NULL;

                hr = pParticipant->get_UserURI(&bstrURI);

                if (FAILED(hr))
                {
                    SAFE_RELEASE(pSession);
                    SAFE_RELEASE(pParticipant);
                    return;
                }

                // Get the participant name
                BSTR bstrName = NULL;

                hr = pParticipant->get_Name(&bstrName);

                SAFE_RELEASE(pParticipant);

                if (FAILED(hr) && (hr != RTC_E_NOT_EXIST))
                {
                    SAFE_FREE_STRING(bstrURI);
                    SAFE_RELEASE(pSession);
                    return;
                }

                // Ring the bell
                m_pClient->PlayRing(RTCRT_PHONE, VARIANT_TRUE);

                // Show the session dialog
                BOOL fAccept;

                hr = ShowSessionDialog(m_hWnd, bstrName, bstrURI, &fAccept);    

                SAFE_FREE_STRING(bstrURI);
                SAFE_FREE_STRING(bstrName);

                if (FAILED(hr))
                {                  
                    SAFE_RELEASE(pSession);
                    return;
                }

                if (fAccept)
                {
                    // Accept the session
                    hr = pSession->Answer();

                    if (FAILED(hr))
                    {
                        SAFE_RELEASE(pSession);
                        return;
                    }
                }
                else
                {
                    // Reject the session
                    pSession->Terminate(RTCTR_REJECT);

                    SAFE_RELEASE(pSession);
                    return;
                }
            }
            else
            {
                // This is an IM call
                m_pClient->PlayRing(RTCRT_MESSAGE, VARIANT_TRUE);
            }
            // Add the session to the session list
            // This will create the session window
            hr = AddSession(pSession, enType);

            if (FAILED(hr))
            {
                SAFE_RELEASE(pSession);
                return;
            }
        }
      SAFE_RELEASE(pSession);

		return;
    }    

    SAFE_RELEASE(pSession);


    // Deliver the session state to the session window
    pSessWindow->DeliverSessionState(enState);
}

// OnRTCParticipantStateChangeEvent : when participant state have been changed
//										ex. addparticipant, removeparticipant, participant leaves session
 

void CRTCWin::OnRTCParticipantStateChangeEvent(IRTCParticipantStateChangeEvent *pEvent)
{

    IRTCSession * pSession = NULL;
    CRTCSession * pSessWindow = NULL;
    IRTCParticipant * pParticipant = NULL;
    RTC_PARTICIPANT_STATE enState;
    HRESULT hr;


    hr = pEvent->get_Participant(&pParticipant);

    if (FAILED(hr))
    {
        return;
    }

    hr = pParticipant->get_Session(&pSession);

    if (FAILED(hr))
    {
        SAFE_RELEASE(pParticipant);
        return;
    }
        
    hr = FindSession(pSession, &pSessWindow);

    SAFE_RELEASE(pSession);

    if (FAILED(hr))
    {
        SAFE_RELEASE(pParticipant);
        return;
    }

    // Get the participant state
    hr = pEvent->get_State(&enState);

    if (FAILED(hr))
    {
        SAFE_RELEASE(pParticipant);
        return;
    }

    // Deliver the participant state to the session window
    pSessWindow->DeliverParticipantState(pParticipant, enState);

    SAFE_RELEASE(pParticipant);
}

// OnRTCMessagingEvent : when we get message (status or im message)
 

void CRTCWin::OnRTCMessagingEvent(IRTCMessagingEvent *pEvent)
{

    IRTCSession * pSession = NULL;
    CRTCSession * pSessWindow = NULL;
    IRTCParticipant * pParticipant = NULL;
    RTC_MESSAGING_EVENT_TYPE enType;
    RTC_MESSAGING_USER_STATUS enStatus;
    BSTR bstrContentType = NULL;
    BSTR bstrMessage = NULL;
    HRESULT hr;

    hr = pEvent->get_Session(&pSession);

    if (FAILED(hr))
    {
        return;
    }
    
    hr = FindSession(pSession, &pSessWindow);

    SAFE_RELEASE(pSession);

    if (FAILED(hr))
    {
        return;
    }

    hr = pEvent->get_EventType(&enType);

    if (FAILED(hr))
    {
        return;
    }

    hr = pEvent->get_Participant(&pParticipant);

    if (FAILED(hr))
    {
        return;
    }

    if (enType == RTCMSET_MESSAGE)
    {
        hr = pEvent->get_MessageHeader(&bstrContentType);

		//sound when message incoming
		m_pClient->PlayRing(RTCRT_MESSAGE, VARIANT_TRUE);
		
		
		if (FAILED(hr))
        {
            SAFE_RELEASE(pParticipant);
            return;
        }

        hr = pEvent->get_Message(&bstrMessage);

        if (FAILED(hr))
        {
            SAFE_RELEASE(pParticipant);
            SAFE_FREE_STRING(bstrContentType);
            return;
        }

        // Deliver the message to the session window
        pSessWindow->DeliverMessage(pParticipant, bstrContentType, bstrMessage);

        SAFE_FREE_STRING(bstrContentType);
        SAFE_FREE_STRING(bstrMessage);
    }
    else if (enType == RTCMSET_STATUS)
    {
        hr = pEvent->get_UserStatus(&enStatus);

        if (FAILED(hr))
        {
            return;
        }

        // Deliver the user status to the session window
        pSessWindow->DeliverUserStatus(pParticipant, enStatus);
    }

    SAFE_RELEASE(pParticipant);    

}

// OnRTCMediaEvent : when media status have been changed
//						ex. add/remove audio or vdo, T120 (app sharing, whiteboard)
 

void CRTCWin::OnRTCMediaEvent(IRTCMediaEvent *pEvent)
{


    long lMediaType;
    RTC_MEDIA_EVENT_TYPE enType;
    RTC_MEDIA_EVENT_REASON enReason;
    HRESULT hr;

    hr = pEvent->get_MediaType(&lMediaType);


    if (FAILED(hr))
    {
        return;
    }

    hr = pEvent->get_EventType(&enType);

    if (FAILED(hr))
    {
        return;
    }

    hr = pEvent->get_EventReason(&enReason);

    if (FAILED(hr))
    {
        return;
    }

    if (CRTCAVSession::m_Singleton != NULL)
    {
        // Deliver the media state to the session window
        (CRTCAVSession::m_Singleton)->DeliverMedia(lMediaType, enType, enReason);
    }


}


// OnRTCMediaEvent : when PC-PC session requests to add/remove media streams.

 
void CRTCWin::OnRTCMediaRequestEvent(IRTCMediaRequestEvent *pEvent)
{
	long lCurMediaType;
	long lProposedMediaType;
	HRESULT hr;

	hr = pEvent->get_CurrentMedia(&lCurMediaType);
	
	if( FAILED(hr))
		return;

	hr = pEvent->get_ProposedMedia(&lProposedMediaType);
	
	if( FAILED(hr))
		return;

	pEvent->Accept(lProposedMediaType);

	return;
}

// OnRTCIntensityEvent : when volume changed by control (from ui)

void CRTCWin::OnRTCIntensityEvent(IRTCIntensityEvent *pEvent)
{

    RTC_AUDIO_DEVICE enDevice;
    long lLevel, lMin, lMax;
    HRESULT hr;

    hr = pEvent->get_Direction(&enDevice);

    if (FAILED(hr))
    {
        return;
    }

    hr = pEvent->get_Level(&lLevel);

    if (FAILED(hr))
    {
        return;
    }

    hr = pEvent->get_Min(&lMin);

    if (FAILED(hr))
    {
        return;
    }

    hr = pEvent->get_Max(&lMax);

    if (FAILED(hr))
    {
        return;
    }

    // Normalize level to between zero and 100
    if ((lMax - lMin) == 0)
    {
        lLevel = 0;
    }
    else
    {
        lLevel = (lLevel - lMin) * 100 / (lMax - lMin);
    }

    if (CRTCAVSession::m_Singleton != NULL)
    {
        // Deliver the intensity state to the session window
        (CRTCAVSession::m_Singleton)->DeliverIntensity(enDevice, lLevel);
    }

}

// OnRTCClientEvent : when user's information changed
//						ex. ip address, network quality


void CRTCWin::OnRTCClientEvent(IRTCClientEvent *pEvent)
{

    HRESULT hr;

    // Get the client event tyoe
    RTC_CLIENT_EVENT_TYPE enEventType;

    hr = pEvent->get_EventType(&enEventType);

    if (FAILED(hr))
    {
        return;
    }

    if ( enEventType == RTCCET_ASYNC_CLEANUP_DONE )
    {
        // The RTC client has finished preparing for
        // shutdown. Destroy the window now.
        DestroyWindow(m_hWnd);
    }
    else
    {
        if (CRTCAVSession::m_Singleton != NULL)
        {
            // Deliver the client state to the session window
            (CRTCAVSession::m_Singleton)->DeliverClient(enEventType);
        }
    }

}

// OnRTCBuddyEvent : buddy's state changed
//						ex. add/remove buddy, buddy's status, subscription state


void CRTCWin::OnRTCBuddyEvent(IRTCBuddyEvent2 *pEvent)
{
    HRESULT hr;
    RTC_BUDDY_EVENT_TYPE enType;
    long lStatus;

    hr = pEvent->get_EventType(&enType);

    if (FAILED(hr))
    {
        return;
    }

    // Get the status
    hr = pEvent->get_StatusCode(&lStatus);

    if (FAILED(hr))
    {
        return;
    }

    // Get the buddy object
    IRTCBuddy * pBuddy = NULL;

    hr = pEvent->get_Buddy(&pBuddy);

    if (FAILED(hr))
    {
        return;
    }

    switch (enType)
    {
    case RTCBET_BUDDY_ADD:
        {

            if (SUCCEEDED(lStatus))
            {
                // Update the buddy list entry
                UpdateBuddyList(pBuddy);
            }
            else
            {
                // Delete the buddy from the list
                ClearBuddyList(pBuddy);
            }
        }
        break;

    case RTCBET_BUDDY_REMOVE:
        {

            if (SUCCEEDED(lStatus))
            {
                // Delete the buddy from the list
                ClearBuddyList(pBuddy);
            }
            else
            {
                // Update the buddy list entry
                UpdateBuddyList(pBuddy);
            }
        }
        break;

    case RTCBET_BUDDY_UPDATE:
        {
            // Update the buddy list entry
            UpdateBuddyList(pBuddy);
        }
        break;

    case RTCBET_BUDDY_SUBSCRIBED:
	{
	    if (FAILED(lStatus))
	      UpdateBuddyList(pBuddy);
	}
	break;


    case RTCBET_BUDDY_STATE_CHANGE:
        {
            // Update the buddy list entry
            UpdateBuddyList(pBuddy);
        }
        break;
    }

    SAFE_RELEASE(pBuddy);


}

// OnRTCWatcherEvent : when watcher's state changed
//						ex. add/remove watcher, watcher's attributes
 

void CRTCWin::OnRTCWatcherEvent(IRTCWatcherEvent2 *pEvent)
{
    HRESULT hr;
    RTC_WATCHER_EVENT_TYPE enType;
    long lStatus;

    hr = pEvent->get_EventType(&enType);

    if (FAILED(hr))
    {
        return;
    }

    // Get the status
    hr = pEvent->get_StatusCode(&lStatus);

    if (FAILED(hr))
    {
        return;
    }

    // Get the watcher object
    IRTCWatcher * pWatcher = NULL;

    hr = pEvent->get_Watcher(&pWatcher);

    if (FAILED(hr))
    {
        return;
    }

    switch (enType)
    {
    case RTCWET_WATCHER_ADD:
        break;

    case RTCWET_WATCHER_REMOVE:
        break;

    case RTCWET_WATCHER_UPDATE:
        break;

    case RTCWET_WATCHER_OFFERING:
        {
          // Get the watcher URI
            BSTR bstrURI = NULL;

            hr = pWatcher->get_PresentityURI(&bstrURI);

            if (FAILED(hr))
            {
                SAFE_RELEASE(pWatcher);
                return;
            }

            // Get the watcher name
            BSTR bstrName = NULL;

            hr = pWatcher->get_Name(&bstrName);

            if (FAILED(hr) && (hr != RTC_E_NOT_EXIST))
            {
                SAFE_FREE_STRING(bstrURI);
                SAFE_RELEASE(pWatcher);
                return;
            }

			//play ring when incoming watcher dialog
			m_pClient->PlayRing(RTCRT_MESSAGE, VARIANT_TRUE);
			
			
			// Show the incoming watcher dialog
            BOOL fAllow, fAddBuddy;

            hr = ShowWatcherDialog(m_hWnd, bstrName, bstrURI, &fAllow, &fAddBuddy);    

            if (FAILED(hr))
            {
                SAFE_FREE_STRING(bstrURI);
                SAFE_FREE_STRING(bstrName);
                SAFE_RELEASE(pWatcher);
                return;
            }

            // Set the watcher to be allowed or blocked
            hr = pWatcher->put_State(fAllow ? RTCWS_ALLOWED : RTCWS_BLOCKED);

            if (FAILED(hr))
            {
                SAFE_FREE_STRING(bstrURI);
                SAFE_FREE_STRING(bstrName);
                SAFE_RELEASE(pWatcher);
                return;
            }

            // Shall we add the user as a buddy?
            if (fAddBuddy)
            {
                hr = DoAddBuddy(bstrURI, bstrName);

                if (FAILED(hr))
                {
                    SAFE_FREE_STRING(bstrURI);
                    SAFE_FREE_STRING(bstrName);
                    SAFE_RELEASE(pWatcher);
                    return;
                }
            }

            SAFE_FREE_STRING(bstrURI);
            SAFE_FREE_STRING(bstrName);
        }
        break;
    }

    // Deliver events to the watcher windows
    std::vector<CRTCWatcher *>::iterator it;     

    if (!m_WatchersList.empty())
    {
        for(it=m_WatchersList.begin();
            it < m_WatchersList.end();
            it++)
        {
            (*it)->DeliverWatcher(pWatcher, enType, lStatus);
        }
    }

    SAFE_RELEASE(pWatcher);


}


// OnRTCRoamingEvent : when roaming event change
//						ex. add/remove, enable (EnableProfileEx())
 

void CRTCWin::OnRTCRoamingEvent(IRTCRoamingEvent *pEvent)
{
    HRESULT hr;
    RTC_ROAMING_EVENT_TYPE enType;
    long lStatusCode;

    hr = pEvent->get_EventType(&enType);

    if (FAILED(hr))
    {
        return;
    }

    hr = pEvent->get_StatusCode(&lStatusCode);

    if (FAILED(hr))
    {
        return;
    }

    hr = lStatusCode;

    switch (enType)
    {
    case RTCRET_BUDDY_ROAMING:
        break;

    case RTCRET_WATCHER_ROAMING:
        break;

    case RTCRET_PRESENCE_ROAMING:        
        break;

    case RTCRET_PROFILE_ROAMING:        
        break;
    }



}

// OnRTCProfileEvent : when our profile crated or updated
//						ex. crated by GetProfile()
//							updated by server 
 

void CRTCWin::OnRTCProfileEvent(IRTCProfileEvent2 *pEvent)
{

    HRESULT hr;
    RTC_PROFILE_EVENT_TYPE enType;
    long lStatusCode;

    hr = pEvent->get_EventType(&enType);

    if (FAILED(hr))
    {
        return;
    }

    hr = pEvent->get_StatusCode(&lStatusCode);

    if (FAILED(hr))
    {
        return;
    }

    hr = lStatusCode;

    switch (enType)
    {
    case RTCPFET_PROFILE_GET:
        {

            if (FAILED(hr))
            {
                DoLogOff();
                OnLoggedOff();

                ShowMessageBox(L"Logon failed!",MB_ICONERROR);
                return;
            }
            else
            {
                // Provisioning was successful.
                // Get the RTC profile object from the event
                IRTCProfile *p = NULL;
 
                hr = pEvent->get_Profile(&p);
                if(p)  {
                   p->QueryInterface(__uuidof(IRTCProfile2), (void **)&m_pProfile);
                   SAFE_RELEASE(p); 
                } else
                   hr = E_NOINTERFACE;
				
                if (FAILED(hr))
                {
                    DoLogOff();
                    OnLoggedOff();

                    ShowMessageBox(L"Logon failed!",MB_ICONERROR);
                    return;
                }
				
				
				//use password for login (Authentication)
				hr = m_pProfile->put_AllowedAuth(RTCAU_DIGEST);

                // Register the profile
                hr = DoRegister();

                if (FAILED(hr))
                {
                    DoLogOff();
                    OnLoggedOff();

                    ShowMessageBox(L"Logon failed!",MB_ICONERROR);        
                    return;  
                }
            }
        }
        break;

    case RTCPFET_PROFILE_UPDATE:
        // Ignore updates
        break;
   }




}



