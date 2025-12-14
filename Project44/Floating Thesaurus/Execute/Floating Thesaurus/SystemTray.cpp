// SystemTray.cpp : implementation file
//

#include "stdafx.h"
#include "SystemTray.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#undef TRY
#undef CATCH
#undef END_CATCH
#define TRY try
#define CATCH(ex_class, ex_object) catch(ex_class* ex_object)
#define END_CATCH

#ifndef _countof
#define _countof(x) ( sizeof(x) / sizeof(x[0]) )
#endif

IMPLEMENT_DYNAMIC(CSystemTray, CWnd)

UINT CSystemTray::m_nMaxTooltipLength  = 64;     // This may change...
const UINT CSystemTray::m_nTaskbarCreatedMsg = ::RegisterWindowMessage(_T("TaskbarCreated"));
CWnd  CSystemTray::m_wndInvisible;

/////////////////////////////////////////////////////////////////////////////
// CSystemTray

CSystemTray::CSystemTray()
{
    Initialise();
}

CSystemTray::CSystemTray(CWnd* pParent,             // The window that will recieve tray notifications
                         UINT uCallbackMessage,     // the callback message to send to parent
                         LPCTSTR szToolTip,         // tray icon tooltip
                         HICON icon,                // Handle to icon
                         UINT uID,                  // Identifier of tray icon
                         BOOL bHidden)				// Balloon timeout (w2k)
{
    Initialise();
    Create(pParent, uCallbackMessage, szToolTip, icon, uID, bHidden);
}

void CSystemTray::Initialise()
{
    memset(&m_tnd, 0, sizeof(m_tnd));

    m_bEnabled = FALSE;
    m_bHidden  = TRUE;
    m_bRemoved = TRUE;

    m_DefaultMenuItemID    = 0;
    m_DefaultMenuItemByPos = TRUE;

    m_bShowIconPending = FALSE;

	m_pTargetWnd = NULL;
	m_uCreationFlags = 0;
}

BOOL CSystemTray::Create(CWnd* pParent, UINT uCallbackMessage, LPCTSTR szToolTip, 
                         HICON icon, UINT uID, BOOL bHidden /*=FALSE*/)
{
    // this is only for Windows 95 (or higher)
    m_bEnabled = (GetVersion() & 0xff) >= 4;
    if (!m_bEnabled) 
    {
        ASSERT(FALSE);
        return FALSE;
    }

    m_nMaxTooltipLength = _countof(m_tnd.szTip);
    
    // Make sure we avoid conflict with other messages
    ASSERT(uCallbackMessage >= WM_APP);

    // Tray only supports tooltip text up to m_nMaxTooltipLength) characters
    ASSERT(AfxIsValidString(szToolTip));
    ASSERT(_tcslen(szToolTip) <= m_nMaxTooltipLength);

    // Create an invisible window
    CWnd::CreateEx(0, AfxRegisterWndClass(0), _T(""), WS_POPUP, 0,0,0,0, NULL, 0);

    // load up the NOTIFYICONDATA structure
    m_tnd.cbSize = sizeof(NOTIFYICONDATA);
    m_tnd.hWnd   = pParent->GetSafeHwnd()? pParent->GetSafeHwnd() : m_hWnd;
    m_tnd.uID    = uID;
    m_tnd.hIcon  = icon;
    m_tnd.uFlags = NIF_MESSAGE | NIF_ICON | NIF_TIP;
    m_tnd.uCallbackMessage = uCallbackMessage;
    _tcsncpy(m_tnd.szTip, szToolTip, m_nMaxTooltipLength-1);

    m_bHidden = bHidden;

	m_uCreationFlags = m_tnd.uFlags;	// Store in case we need to recreate in OnTaskBarCreate

    BOOL bResult = TRUE;
    if (!m_bHidden)
    {
        bResult = Shell_NotifyIcon(NIM_ADD, &m_tnd);
        m_bShowIconPending = m_bHidden = m_bRemoved = !bResult;
    }
    
    return bResult;
}

CSystemTray::~CSystemTray()
{
    RemoveIcon();
    DestroyWindow();
}

BOOL CSystemTray::MoveToRight()
{
    RemoveIcon();
    return AddIcon();
}

BOOL CSystemTray::AddIcon()
{
    if (!m_bRemoved)
        RemoveIcon();

    if (m_bEnabled)
    {
        m_tnd.uFlags = NIF_MESSAGE | NIF_ICON | NIF_TIP;
        if (!Shell_NotifyIcon(NIM_ADD, &m_tnd))
            m_bShowIconPending = TRUE;
        else
            m_bRemoved = m_bHidden = FALSE;
    }
    return (m_bRemoved == FALSE);
}

BOOL CSystemTray::RemoveIcon()
{
    m_bShowIconPending = FALSE;

    if (!m_bEnabled || m_bRemoved)
        return TRUE;

    m_tnd.uFlags = 0;
    if (Shell_NotifyIcon(NIM_DELETE, &m_tnd))
        m_bRemoved = m_bHidden = TRUE;

    return (m_bRemoved == TRUE);
}

BOOL CSystemTray::HideIcon()
{
    if (!m_bEnabled || m_bRemoved || m_bHidden)
        return TRUE;

        RemoveIcon();

    return (m_bHidden == TRUE);
}

BOOL CSystemTray::ShowIcon()
{
    if (m_bRemoved)
        return AddIcon();

    if (!m_bHidden)
        return TRUE;

        AddIcon();

    return (m_bHidden == FALSE);
}

BOOL CSystemTray::SetIcon(HICON hIcon)
{
    if (!m_bEnabled)
        return FALSE;

    m_tnd.uFlags = NIF_ICON;
    m_tnd.hIcon = hIcon;

    if (m_bHidden)
        return TRUE;
    else
        return Shell_NotifyIcon(NIM_MODIFY, &m_tnd);
}

BOOL CSystemTray::SetIcon(LPCTSTR lpszIconName)
{
    HICON hIcon = (HICON) ::LoadImage(AfxGetResourceHandle(), 
                                      lpszIconName,
                                      IMAGE_ICON, 
                                      0, 0,
                                      LR_DEFAULTCOLOR);

    return SetIcon(hIcon);
}

BOOL CSystemTray::SetIcon(UINT nIDResource)
{
    return SetIcon(MAKEINTRESOURCE(nIDResource));
}

BOOL CSystemTray::SetStandardIcon(LPCTSTR lpIconName)
{
    HICON hIcon = LoadIcon(NULL, lpIconName);

    return SetIcon(hIcon);
}

BOOL CSystemTray::SetStandardIcon(UINT nIDResource)
{
	return SetStandardIcon(MAKEINTRESOURCE(nIDResource));
}
 
HICON CSystemTray::GetIcon() const
{
    return (m_bEnabled)? m_tnd.hIcon : NULL;
}

/////////////////////////////////////////////////////////////////////////////
// CSystemTray tooltip text manipulation

BOOL CSystemTray::SetTooltipText(LPCTSTR pszTip)
{
    ASSERT(AfxIsValidString(pszTip)); // (md)
    ASSERT(_tcslen(pszTip) < m_nMaxTooltipLength);

    if (!m_bEnabled) 
        return FALSE;

    m_tnd.uFlags = NIF_TIP;
    _tcsncpy(m_tnd.szTip, pszTip, m_nMaxTooltipLength-1);

    if (m_bHidden)
        return TRUE;
    else
        return Shell_NotifyIcon(NIM_MODIFY, &m_tnd);
}

BOOL CSystemTray::SetTooltipText(UINT nID)
{
    CString strText;
    VERIFY(strText.LoadString(nID));

    return SetTooltipText(strText);
}

CString CSystemTray::GetTooltipText() const
{
    CString strText;
    if (m_bEnabled)
        strText = m_tnd.szTip;

    return strText;
}

/////////////////////////////////////////////////////////////////////////////
// CSystemTray notification window stuff

BOOL CSystemTray::SetNotificationWnd(CWnd* pWnd)
{
    if (!m_bEnabled) 
        return FALSE;

    // Make sure Notification window is valid
    if (!pWnd || !::IsWindow(pWnd->GetSafeHwnd()))
    {
        ASSERT(FALSE);
        return FALSE;
    }

    m_tnd.hWnd = pWnd->GetSafeHwnd();
    m_tnd.uFlags = 0;

    if (m_bHidden)
        return TRUE;
    else
        return Shell_NotifyIcon(NIM_MODIFY, &m_tnd);
}

CWnd* CSystemTray::GetNotificationWnd() const
{
    return CWnd::FromHandle(m_tnd.hWnd);
}

// Change or retrive the window to send menu commands to
BOOL CSystemTray::SetTargetWnd(CWnd* pTargetWnd)
{
    m_pTargetWnd = pTargetWnd;
    return TRUE;
} // CSystemTray::SetTargetWnd()

CWnd* CSystemTray::GetTargetWnd() const
{
    if (m_pTargetWnd)
        return m_pTargetWnd;
    else
        return AfxGetMainWnd();
} // CSystemTray::GetTargetWnd()

/////////////////////////////////////////////////////////////////////////////
// CSystemTray notification message stuff

BOOL CSystemTray::SetCallbackMessage(UINT uCallbackMessage)
{
    if (!m_bEnabled)
        return FALSE;

    // Make sure we avoid conflict with other messages
    ASSERT(uCallbackMessage >= WM_APP);

    m_tnd.uCallbackMessage = uCallbackMessage;
    m_tnd.uFlags = NIF_MESSAGE;

    if (m_bHidden)
        return TRUE;
    else
        return Shell_NotifyIcon(NIM_MODIFY, &m_tnd);
}

UINT CSystemTray::GetCallbackMessage() const
{
    return m_tnd.uCallbackMessage;
}

/////////////////////////////////////////////////////////////////////////////
// CSystemTray menu manipulation

BOOL CSystemTray::SetMenuDefaultItem(UINT uItem, BOOL bByPos)
{
    if ((m_DefaultMenuItemID == uItem) && (m_DefaultMenuItemByPos == bByPos)) 
        return TRUE;

    m_DefaultMenuItemID = uItem;
    m_DefaultMenuItemByPos = bByPos;   

    CMenu menu, *pSubMenu;

    if (!menu.LoadMenu(m_tnd.uID))
        return FALSE;

    pSubMenu = menu.GetSubMenu(0);
    if (!pSubMenu)
        return FALSE;

    ::SetMenuDefaultItem(pSubMenu->m_hMenu, m_DefaultMenuItemID, m_DefaultMenuItemByPos);

    return TRUE;
}

void CSystemTray::GetMenuDefaultItem(UINT& uItem, BOOL& bByPos)
{
    uItem = m_DefaultMenuItemID;
    bByPos = m_DefaultMenuItemByPos;
}

/////////////////////////////////////////////////////////////////////////////
// CSystemTray message handlers

BEGIN_MESSAGE_MAP(CSystemTray, CWnd)
	//{{AFX_MSG_MAP(CSystemTray)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
	ON_WM_SETTINGCHANGE()
    ON_REGISTERED_MESSAGE(CSystemTray::m_nTaskbarCreatedMsg, OnTaskbarCreated)
END_MESSAGE_MAP()

// This is called whenever the taskbar is created (eg after explorer crashes
// and restarts. Please note that the WM_TASKBARCREATED message is only passed
// to TOP LEVEL windows (like WM_QUERYNEWPALETTE)
void CSystemTray::OnTaskbarCreated(WPARAM /*wParam*/, LPARAM /*lParam*/) 
{
    InstallIconPending();
}

void CSystemTray::OnSettingChange(UINT uFlags, LPCTSTR lpszSection) 
{
	CWnd::OnSettingChange(uFlags, lpszSection);

    if (uFlags == SPI_SETWORKAREA)
        InstallIconPending();	
}

LRESULT CSystemTray::OnTrayNotification(UINT wParam, LONG lParam) 
{
    //Return quickly if its not for this tray icon
    if (wParam != m_tnd.uID)
        return 0L;

    CMenu menu, *pSubMenu;
    CWnd *pTargetWnd = GetTargetWnd();
    if (!pTargetWnd)
        return 0L;

    // Clicking with right button brings up a context menu
    if (LOWORD(lParam) == WM_RBUTTONUP)
    {    
        if (!menu.LoadMenu(m_tnd.uID))
            return 0;
        
        pSubMenu = menu.GetSubMenu(0);
        if (!pSubMenu)
            return 0;

        // Make chosen menu item the default (bold font)
        ::SetMenuDefaultItem(pSubMenu->m_hMenu, m_DefaultMenuItemID, m_DefaultMenuItemByPos);

        // Display and track the popup menu
        CPoint pos;
        GetCursorPos(&pos);

        pTargetWnd->SetForegroundWindow(); 
        
        ::TrackPopupMenu(pSubMenu->m_hMenu, 0, pos.x, pos.y, 0, 
                         pTargetWnd->GetSafeHwnd(), NULL);

        // BUGFIX: See "PRB: Menus for Notification Icons Don't Work Correctly"
        pTargetWnd->PostMessage(WM_NULL, 0, 0);

        menu.DestroyMenu();
    } 
    else if (LOWORD(lParam) == WM_LBUTTONDBLCLK) 
    {
        // double click received, the default action is to execute default menu item
		CWnd *pTargetWnd = GetTargetWnd();
		MaximiseFromTray(pTargetWnd);
    }

    return 1;
}

LRESULT CSystemTray::WindowProc(UINT message, WPARAM wParam, LPARAM lParam) 
{
    if (message == m_tnd.uCallbackMessage)
        return OnTrayNotification(wParam, lParam);
	
	return CWnd::WindowProc(message, wParam, lParam);
}

void CSystemTray::InstallIconPending()
{
    // Is the icon display pending, and it's not been set as "hidden"?
    if (!m_bShowIconPending || m_bHidden)
        return;

	// Reset the flags to what was used at creation
	m_tnd.uFlags = m_uCreationFlags;

    // Try and recreate the icon
    m_bHidden = !Shell_NotifyIcon(NIM_ADD, &m_tnd);

    // If it's STILL hidden, then have another go next time...
    m_bShowIconPending = !m_bHidden;

    ASSERT(m_bHidden == FALSE);
}

/////////////////////////////////////////////////////////////////////////////
// For minimising/maximising from system tray

BOOL CALLBACK FindTrayWnd(HWND hwnd, LPARAM lParam)
{
    TCHAR szClassName[256];
    GetClassName(hwnd, szClassName, 255);

    // Did we find the Main System Tray? If so, then get its size and keep going
    if (_tcscmp(szClassName, _T("TrayNotifyWnd")) == 0)
    {
        CRect *pRect = (CRect*) lParam;
        ::GetWindowRect(hwnd, pRect);
        return TRUE;
    }

    // Did we find the System Clock? If so, then adjust the size of the rectangle
    // we have and quit (clock will be found after the system tray)
    if (_tcscmp(szClassName, _T("TrayClockWClass")) == 0)
    {
        CRect *pRect = (CRect*) lParam;
        CRect rectClock;
        ::GetWindowRect(hwnd, rectClock);
        // if clock is above system tray adjust accordingly
        if (rectClock.bottom < pRect->bottom-5) // 10 = random fudge factor.
            pRect->top = rectClock.bottom;
        else
            pRect->right = rectClock.left;
        return FALSE;
    }
 
    return TRUE;
}
 
// enhanced version by Matthew Ellis <m.t.ellis@bigfoot.com>
void CSystemTray::GetTrayWndRect(LPRECT lprect)
{
#define DEFAULT_RECT_WIDTH 150
#define DEFAULT_RECT_HEIGHT 30

    HWND hShellTrayWnd = ::FindWindow(_T("Shell_TrayWnd"), NULL);
    if (hShellTrayWnd)
    {
        ::GetWindowRect(hShellTrayWnd, lprect);
        EnumChildWindows(hShellTrayWnd, FindTrayWnd, (LPARAM)lprect);
        return;
    }
    APPBARDATA appBarData;
    appBarData.cbSize=sizeof(appBarData);
    if (SHAppBarMessage(ABM_GETTASKBARPOS,&appBarData))
    {
        // We know the edge the taskbar is connected to, so guess the rect of the
        // system tray. Use various fudge factor to make it look good
        switch(appBarData.uEdge)
        {
        case ABE_LEFT:
        case ABE_RIGHT:
            // We want to minimize to the bottom of the taskbar
            lprect->top    = appBarData.rc.bottom-100;
            lprect->bottom = appBarData.rc.bottom-16;
            lprect->left   = appBarData.rc.left;
            lprect->right  = appBarData.rc.right;
            break;
            
        case ABE_TOP:
        case ABE_BOTTOM:
            // We want to minimize to the right of the taskbar
            lprect->top    = appBarData.rc.top;
            lprect->bottom = appBarData.rc.bottom;
            lprect->left   = appBarData.rc.right-100;
            lprect->right  = appBarData.rc.right-16;
            break;
        }
        return;
    }
    
    if (hShellTrayWnd)
    {
        ::GetWindowRect(hShellTrayWnd, lprect);
        if (lprect->right - lprect->left > DEFAULT_RECT_WIDTH)
            lprect->left = lprect->right - DEFAULT_RECT_WIDTH;
        if (lprect->bottom - lprect->top > DEFAULT_RECT_HEIGHT)
            lprect->top = lprect->bottom - DEFAULT_RECT_HEIGHT;
        
        return;
    }
    
    SystemParametersInfo(SPI_GETWORKAREA,0, lprect, 0);
    lprect->left = lprect->right - DEFAULT_RECT_WIDTH;
    lprect->top  = lprect->bottom - DEFAULT_RECT_HEIGHT;
}

BOOL CSystemTray::RemoveTaskbarIcon(CWnd* pWnd)
{
    LPCTSTR pstrOwnerClass = AfxRegisterWndClass(0);

    // Create static invisible window
    if (!::IsWindow(m_wndInvisible.m_hWnd))
    {
		if (!m_wndInvisible.CreateEx(0, pstrOwnerClass, _T(""), WS_POPUP,
				CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
				NULL, 0))
			return FALSE;
    }

    pWnd->SetParent(&m_wndInvisible);

    return TRUE;
}

void CSystemTray::MinimiseToTray(CWnd* pWnd)
{
    RemoveTaskbarIcon(pWnd);
    pWnd->ModifyStyle(WS_VISIBLE, 0);
}

void CSystemTray::MaximiseFromTray(CWnd* pWnd)
{
    pWnd->SetParent(NULL);
    pWnd->ModifyStyle(0, WS_VISIBLE);
    pWnd->RedrawWindow(NULL, NULL, RDW_UPDATENOW | RDW_ALLCHILDREN | RDW_FRAME |
                                   RDW_INVALIDATE | RDW_ERASE);

    // Move focus away and back again to ensure taskbar icon is recreated
    if (::IsWindow(m_wndInvisible.m_hWnd))
        m_wndInvisible.SetActiveWindow();
    pWnd->SetActiveWindow();
    pWnd->SetForegroundWindow();
}
