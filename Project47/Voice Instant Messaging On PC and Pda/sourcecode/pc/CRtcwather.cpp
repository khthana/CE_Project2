// CRtcwatcher.cpp
//

#include "stdafx.h"
#include <assert.h>

// CRTCWatcher


CRTCWatcher::CRTCWatcher()
{
    m_hWnd = NULL;
    m_hWatcherList = NULL;
	m_hButtonOK = NULL;
    m_pClient = NULL;
}


// ~CRTCWatcher


CRTCWatcher::~CRTCWatcher()
{
}


// RegisterClass


HRESULT CRTCWatcher::RegisterClass()
{
    // Register the window class
    WNDCLASS wc;
    ATOM atom;

    ZeroMemory(&wc, sizeof(WNDCLASS));

    wc.style         = CS_HREDRAW | CS_VREDRAW;
    wc.lpfnWndProc   = (WNDPROC)CRTCWatcher::WindowProc;
    wc.hInstance     = GetModuleHandle(NULL);
    wc.hIcon         = NULL;
    wc.hCursor       = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = GetSysColorBrush(COLOR_3DFACE);
    wc.lpszMenuName  = NULL;
    wc.lpszClassName = WATHER_CLASS;

    atom = ::RegisterClass( &wc );

    if ( !atom )
    {
        return E_FAIL;
    }

    return S_OK;
}


// UpdateWatcherList : get uri, watcher state


HRESULT CRTCWatcher::UpdateWatcherList(IRTCWatcher * pWatcher)
{
	HRESULT hr;


    if (pWatcher == NULL)
    {
        return S_OK;
    }

    // Get the watcher state
    RTC_WATCHER_STATE enState;
    RTC_ACE_SCOPE     enScope;

    hr = pWatcher->get_State(&enState);

    if (FAILED(hr))
    {
        return hr;
    }

    IRTCWatcher2 * pWatcher2 = NULL;

    hr = pWatcher->QueryInterface(
            __uuidof(IRTCWatcher2),
            (void **)&pWatcher2);

    if (FAILED(hr))
    {
        return hr;
    }

    // Get the ACE scope (ALL, DOMAIN, USER)
    hr = pWatcher2->get_Scope(&enScope);
    
    if (FAILED(hr))
    {
        SAFE_RELEASE(pWatcher2);
        return hr;
    }

    // Get the watcher name
    BSTR bstrName = NULL;
	BSTR bstrURI = NULL;

    hr = pWatcher->get_Name(&bstrName);

    if (SUCCEEDED(hr) && !wcscmp(bstrName, L""))
    {
        // Treat an emptry string as a failure
        SAFE_FREE_STRING(bstrName);
        hr = E_FAIL;
    }
  
	if (FAILED(hr))
    {
        bstrName = L"null";
        return hr;
    }

	
	hr = pWatcher->get_PresentityURI(&bstrURI);

	if (SUCCEEDED(hr) && !wcscmp(bstrURI, L""))
    {
        // Treat an emptry string as a failure
        SAFE_FREE_STRING(bstrURI);
        hr = E_FAIL;
    }

	if (FAILED(hr))
    {
		bstrURI = L"null";
        return hr;
    }
	

    // Build a string for the listbox
    WCHAR szWatcher[MAX_STRING];

    switch(enState)
    {
    case RTCWS_OFFERING:
        _snwprintf(szWatcher, MAX_STRING, L"%ws (Offering)",
            bstrURI);
        break;
    case RTCWS_ALLOWED:
        _snwprintf(szWatcher, MAX_STRING, L"%ws (Allowed)",
            bstrURI);

        break;
    case RTCWS_BLOCKED:
        _snwprintf(szWatcher, MAX_STRING, L"%ws (Blocked)",
            bstrURI);
        break;
    case RTCWS_DENIED:
        _snwprintf(szWatcher, MAX_STRING, L"%ws (Denied)",
            bstrURI);
        break;
    case RTCWS_PROMPT:
        _snwprintf(szWatcher, MAX_STRING, L"%ws (Prompt)",
            bstrURI);
        break;
    default:
        _snwprintf(szWatcher, MAX_STRING, L"%ws",
            bstrURI);
        break;
    }

    szWatcher[MAX_STRING-1] = L'\0';

    SAFE_FREE_STRING(bstrName);
	SAFE_FREE_STRING(bstrURI);


    // Is the watcher in the list?
    LVFINDINFO lvfi;    
    ZeroMemory(&lvfi, sizeof(LVFINDINFO));

    lvfi.flags = LVFI_PARAM;
    lvfi.lParam = (LPARAM)pWatcher;

    int iRes = ListView_FindItem(m_hWatcherList, -1, &lvfi);

    if (iRes == -1)
    {
        // Watcher is not in the list
        // Add the watcher to the list  
        LVITEM lvi;
        ZeroMemory(&lvi, sizeof(LVITEM));

        lvi.mask = LVIF_TEXT | LVIF_PARAM;
        lvi.pszText = szWatcher;
        lvi.lParam = (LPARAM)pWatcher;

        iRes = ListView_InsertItem(m_hWatcherList, &lvi);

        if (iRes == -1)
        {
            return E_FAIL;
        }


		// Add Ref for watcher


        // An RTC watcher reference will be kept by the list
        // Add the reference here
        pWatcher->AddRef();


    }
    else
    {
        // Watcher is in the list
        // Update the list entry
        LVITEM lvi;
        ZeroMemory(&lvi, sizeof(LVITEM));

        lvi.mask = LVIF_TEXT;
        lvi.pszText = szWatcher;
        lvi.iItem = iRes;

        iRes = ListView_SetItem(m_hWatcherList, &lvi);

        if (iRes == -1)
        {
            return E_FAIL;
        }
    }

    return S_OK;
}


// ClearWatcherList


HRESULT CRTCWatcher::ClearWatcherList(IRTCWatcher * pWatcher)
{
	HRESULT hr = S_OK;

    if (pWatcher == NULL)
    {
        return S_OK;
    }
    
    // Is the watcher in the list?
    LVFINDINFO lvfi;    
    ZeroMemory(&lvfi, sizeof(LVFINDINFO));

    lvfi.flags = LVFI_PARAM;
    lvfi.lParam = (LPARAM)pWatcher;

    int iRes = ListView_FindItem(m_hWatcherList, -1, &lvfi);

    if (iRes != -1)
    {       
        // Watcher is in the list
        // Remove the list entry
        ListView_DeleteItem(m_hWatcherList, iRes);

		
		// release IRTCWatcher

        // Release the watcher reference
        SAFE_RELEASE(pWatcher);        

    }

    return hr;
}


// ClearWatcherList
 

HRESULT CRTCWatcher::ClearWatcherList()
{
	LVITEM lvi;
    ZeroMemory(&lvi, sizeof(LVITEM));
    
    lvi.mask = LVIF_PARAM;

    // Iterate through the list and remove each item
    while (ListView_GetItem(m_hWatcherList, &lvi))
    {
        IRTCWatcher * pWatcher = (IRTCWatcher *)(lvi.lParam);

        // Remove the list entry
        ListView_DeleteItem(m_hWatcherList, 0);

        // Release the watcher reference
        SAFE_RELEASE(pWatcher);        
    }

    return S_OK;
}


// PopulateWatcherList : enumerating watchers and populating ui
 

HRESULT CRTCWatcher::PopulateWatcherList()
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

    // Enumerate watchers and populate list
    IRTCEnumWatchers * pEnum = NULL;
    IRTCWatcher * pWatcher = NULL;

    hr = pPresence->EnumerateWatchers(&pEnum);

    SAFE_RELEASE(pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    while (pEnum->Next(1, &pWatcher, NULL) == S_OK)
    {
        // Update the watcher list entry
        UpdateWatcherList(pWatcher);

        SAFE_RELEASE(pWatcher);
    }

    SAFE_RELEASE(pEnum);

    return S_OK;
}


// DoAddWatcher :  adding watcher


HRESULT CRTCWatcher::DoAddWatcher(BSTR bstrURI, BSTR bstrName, RTC_WATCHER_STATE enState)
{
	HRESULT hr;

    // Get the RTC client presence interface
    IRTCClientPresence2 * pPresence = NULL;

    hr = m_pClient->QueryInterface(
            __uuidof(IRTCClientPresence2),
            (void **)&pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    // Add the watcher
    IRTCWatcher2 * pWatcher = NULL;

    hr = pPresence->AddWatcherEx(
            bstrURI,
            bstrName,
            NULL,
            enState,
            VARIANT_TRUE,
            RTCAS_SCOPE_USER,
            NULL,
            0,
            &pWatcher);

    SAFE_RELEASE(pPresence);

    if (FAILED(hr))
    {
        return hr;
    }

    if (pWatcher)
    {
        // Update the watcher list entry
        UpdateWatcherList(pWatcher);
        SAFE_RELEASE(pWatcher);
    }

	return S_OK;
}


// DoRemoveWatcher :  removing a watcher


HRESULT CRTCWatcher::DoRemoveWatcher(IRTCWatcher *pWatcher)
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

    // Remove the watcher
    hr = pPresence->RemoveWatcher(pWatcher);

    SAFE_RELEASE(pPresence);

    if (FAILED(hr))
    {
        return hr;
    }


    return S_OK;
}


// DoSetWatcherState : set watcher's state
 

HRESULT CRTCWatcher::DoSetWatcherState(IRTCWatcher *pWatcher, RTC_WATCHER_STATE enState)
{
	HRESULT hr;

	assert (pWatcher != NULL);

	if (pWatcher == NULL)
	{
		return E_POINTER;
	}

    hr = pWatcher->put_State(enState);
    
    if (FAILED(hr))
    {
        return hr;
    }


    return S_OK;
}


// WindowProc
 

LRESULT CALLBACK CRTCWatcher::WindowProc(
  HWND hWnd,      // handle to window
  UINT uMsg,      // message identifier
  WPARAM wParam,  // first message parameter
  LPARAM lParam   // second message parameter
)
{
    CRTCWatcher * me = NULL;
    LRESULT  lr = 0;

    if ( uMsg == WM_CREATE )
    {
        // Create an instance of the class
        me = new CRTCWatcher;
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
        me = (CRTCWatcher *)GetWindowLongPtr(hWnd, GWLP_USERDATA);

        switch( uMsg )
        {        
        case WM_DESTROY:
            lr = me->OnDestroy(uMsg, wParam, lParam);

            // Delete the object instance
            delete me;
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

        case WM_POPULATE:
            me->PopulateWatcherList();
            break;
      
        default:
            lr = DefWindowProc( hWnd, uMsg, wParam, lParam );
        }
    }

    return lr;
}


// OnCreate
 

LRESULT CRTCWatcher::OnCreate(UINT uMsg, WPARAM wParam, LPARAM lParam)
{

	// WM_CREATE has three parameters. We will pass them to our Create Proc for future use
	// They are not all currently used.

	UNREFERENCED_PARAMETER(wParam);
	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);


    // Create the watcher list
    m_hWatcherList = CreateWindowExW(
        WS_EX_CLIENTEDGE,
        L"SysListView32",
        NULL,
        WS_CHILD | WS_VISIBLE |
        LVS_SINGLESEL | LVS_SORTASCENDING |
        LVS_AUTOARRANGE | LVS_SMALLICON,
        0, 0,
        0, 0,
        m_hWnd,
        (HMENU)IDC_WATCHERLIST,
        GetModuleHandle(NULL),
        NULL);

    if ( !m_hWatcherList )
    {
        return -1;
    }

	// Create Button OK
	m_hButtonOK = CreateWindowExW(
        0,
        L"BUTTON",
        L"OK",
        WS_CHILD | WS_VISIBLE | WS_CLIPSIBLINGS | BS_PUSHBUTTON,
        0, 0,
        0, 0,
        m_hWnd,
        (HMENU)IDC_WATCHER_OK,
        GetModuleHandle(NULL),
        NULL);
    
    if ( !m_hButtonOK )
    {
        return -1;
    }

    PostMessage(m_hWnd, WM_POPULATE, 0, 0);

    return 0;
}


// OnDestroy
 

LRESULT CRTCWatcher::OnDestroy(UINT uMsg, WPARAM wParam, LPARAM lParam)
{  
	// WM_DESTROY has three parameters. We will pass them to our Destroy Proc for future use
	// They are not all currently used.

	UNREFERENCED_PARAMETER(wParam);
	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);

    // Cleanup the watcher list
    ClearWatcherList();

    // Release the RTC client
    SAFE_RELEASE(m_pClient);

    if (m_pWin)
    {
        // Remove the window from the watchers list
        m_pWin->RemoveWatchers(this);
    }

    return 0;
}


// OnClose
 

LRESULT CRTCWatcher::OnClose(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	// WM_CLOSE has three parameters. We will pass them to our Close Proc for future use
	// They are not all currently used.

	UNREFERENCED_PARAMETER(wParam);
	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);


    DestroyWindow(m_hWnd);

    return 0;
}


// OnSize
 

LRESULT CRTCWatcher::OnSize(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	// WM_SIZE has three parameters. We will pass them to our Size Proc for future use
	// They are not all currently used.

	UNREFERENCED_PARAMETER(wParam);
	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);

    RECT rcWnd, rcWatcherList, rcButtonOK;

    const int SIZE_EDGE = 5;
	const int BUTTON_WIDTH = 80;
	const int BUTTON_HEIGHT = 30;

    GetClientRect(m_hWnd, &rcWnd);

    
	
	rcButtonOK.bottom = rcWnd.bottom - SIZE_EDGE;
	rcButtonOK.top = rcButtonOK.bottom - BUTTON_HEIGHT;
	rcButtonOK.right = rcWnd.right - SIZE_EDGE;
	rcButtonOK.left = rcButtonOK.right - BUTTON_WIDTH;
	
	MoveWindow(
		m_hButtonOK,
		rcButtonOK.left,
        rcButtonOK.top,
        (rcButtonOK.right - rcButtonOK.left),
        (rcButtonOK.bottom - rcButtonOK.top),
        TRUE);
	
	// Resize the watcher list
    rcWatcherList.bottom = rcButtonOK.top - SIZE_EDGE;
    rcWatcherList.top = rcWnd.top + SIZE_EDGE;
    rcWatcherList.right = rcWnd.right - SIZE_EDGE;
    rcWatcherList.left = rcWnd.left + SIZE_EDGE;
    
    MoveWindow(
        m_hWatcherList,
        rcWatcherList.left,
        rcWatcherList.top,
        (rcWatcherList.right - rcWatcherList.left),
        (rcWatcherList.bottom - rcWatcherList.top),
        TRUE);

    SendMessage(m_hWatcherList, LVM_SETCOLUMNWIDTH,
        (WPARAM)0, MAKELPARAM(rcWatcherList.right - rcWatcherList.left,0));

	

    return 0;
}


// OnCommand
 

LRESULT CRTCWatcher::OnCommand(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	// WM_CREATE has three parameters. We will pass them to our Create Proc for future use
	// They are not all currently used.

	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);


    HRESULT hr = S_OK;

    switch(LOWORD(wParam))
    {
    case IDC_WATCHER_OK:
		PostMessage(m_hWnd, WM_CLOSE, 0, 0);
		break;
    }

    return hr;
}


// OnNotify
 

LRESULT CRTCWatcher::OnNotify(UINT uMsg, WPARAM wParam, LPARAM lParam)
{    
	// WM_NOTIFY has three parameters. We will pass them to our Notify Proc for future use
	// They are not all currently used.

	UNREFERENCED_PARAMETER(uMsg);


    int idCtrl = (int)wParam;
    LPNMHDR pnmh = (LPNMHDR)lParam;
    HRESULT hr = S_OK;

    if ( (pnmh->code == NM_CLICK) ||
         (pnmh->code == NM_RCLICK) )
    {
        if ( idCtrl == IDC_WATCHERLIST )
        {
            // The user clicked on the watcher list
            LVHITTESTINFO lvht;
            ZeroMemory(&lvht, sizeof(LVHITTESTINFO));

            POINT pt;
            GetCursorPos(&pt);

            lvht.pt = pt;
            MapWindowPoints(NULL, pnmh->hwndFrom, &lvht.pt, 1 );
            
            int iRes = ListView_HitTest(pnmh->hwndFrom, &lvht);

            if (iRes == -1)
            {
                return 0;
            }

            if (lvht.flags & LVHT_ONITEM)
            {
                // The user clicked on a watcher
                LVITEM lvi;
                ZeroMemory(&lvi, sizeof(LVITEM));
    
                lvi.mask = LVIF_PARAM;
                lvi.iItem = iRes;

                // Get the watcher item
                if (!ListView_GetItem(m_hWatcherList, &lvi))
                {
                    return 0;
                }
                
                IRTCWatcher * pWatcher = (IRTCWatcher *)(lvi.lParam);

                // Show the watcher menu
                HMENU hMenuRes = LoadMenu( 
                    GetModuleHandle(NULL),
                    MAKEINTRESOURCE(IDR_MENU_WATCHER));

                HMENU hMenu = GetSubMenu(hMenuRes, 0);

                // Show the popup menu
                UINT uID = TrackPopupMenu(hMenu,
                    TPM_LEFTALIGN | TPM_RIGHTBUTTON |
                    TPM_NONOTIFY | TPM_RETURNCMD,
                    pt.x, pt.y, 0, m_hWnd, NULL);

                switch (uID)
                {
                case ID_WATCHER_ALLOW:
                    // Allow the watcher
                    DoSetWatcherState(pWatcher, RTCWS_ALLOWED);
                    break;

                case ID_WATCHER_BLOCK:
                    // Block the watcher
                    DoSetWatcherState(pWatcher, RTCWS_BLOCKED);
                    break;

                case ID_WATCHER_REMOVE:
                    // Remove the watcher
                    if (SUCCEEDED(DoRemoveWatcher(pWatcher)))
                    {                    
                        // Release the watcher reference
                        SAFE_RELEASE(pWatcher);

                        // Delete the watcher from the list
                        ListView_DeleteItem(m_hWatcherList, iRes);
                    }
                    break;
                }
            }
        }
    }

    return hr;
}


// DeliverWatcher
 

HRESULT CRTCWatcher::DeliverWatcher(IRTCWatcher * pWatcher, RTC_WATCHER_EVENT_TYPE enType, LONG lStatus)
{
	switch (enType)
    {
    case RTCWET_WATCHER_ADD:
        {
            if (SUCCEEDED(lStatus))
            {
                // Update the watcher list entry
                UpdateWatcherList(pWatcher);
            }
            else
            {
                // Delete the watcher from the list
                ClearWatcherList(pWatcher);
            }
        }
        break;

    case RTCWET_WATCHER_REMOVE:
        {
            if (SUCCEEDED(lStatus))
            {
                // Delete the watcher from the list
                ClearWatcherList(pWatcher);
            }
            else
            {
                // Update the watcher list entry
                UpdateWatcherList(pWatcher);
            }
        }
        break;

    case RTCWET_WATCHER_UPDATE:
        {
            // Update the wathcer list entry
            UpdateWatcherList(pWatcher);
        }
        break;
    }

    return S_OK;
}