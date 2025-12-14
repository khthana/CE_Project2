#if !defined(AFX_SYSTEMTRAY_H__A9012DEA_92F0_46DC_AE1E_28456769BB86__INCLUDED_)
#define AFX_SYSTEMTRAY_H__A9012DEA_92F0_46DC_AE1E_28456769BB86__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SystemTray.h : header file
//
#ifndef _INCLUDED_SYSTEMTRAY_H_
#define _INCLUDED_SYSTEMTRAY_H_

#define NIIF_NONE 0

#include <afxtempl.h>
/////////////////////////////////////////////////////////////////////////////
// CSystemTray window

class CSystemTray : public CWnd
{
// Construction/destruction
public:
	CSystemTray();
	CSystemTray(CWnd* pWnd, UINT uCallbackMessage, LPCTSTR szTip, 
		HICON icon, UINT uID, BOOL bhidden = FALSE);
    virtual ~CSystemTray();

    DECLARE_DYNAMIC(CSystemTray)

// Attributes
public:

// Operations
public:
    BOOL Enabled() { return m_bEnabled; }
    BOOL Visible() { return !m_bHidden; }

    // Create the tray icon
    Create(CWnd* pParent, UINT uCallbackMessage, LPCTSTR szTip, 
		HICON icon, UINT uID, BOOL bHidden = FALSE);

    // Change or retrieve the Tooltip text
    BOOL    SetTooltipText(LPCTSTR pszTooltipText);
    BOOL    SetTooltipText(UINT nID);
    CString GetTooltipText() const;

    // Change or retrieve the icon displayed
    BOOL  SetIcon(HICON hIcon);
    BOOL  SetIcon(LPCTSTR lpszIconName);
    BOOL  SetIcon(UINT nIDResource);
    BOOL  SetStandardIcon(LPCTSTR lpIconName);
    BOOL  SetStandardIcon(UINT nIDResource);
    HICON GetIcon() const;

    BOOL  HideIcon();
    BOOL  ShowIcon();
    BOOL  AddIcon();
    BOOL  RemoveIcon();
    BOOL  MoveToRight();

    // Change menu default item
    void GetMenuDefaultItem(UINT& uItem, BOOL& bByPos);
    BOOL SetMenuDefaultItem(UINT uItem, BOOL bByPos);

    // Change or retrieve the window to send notification messages to
    BOOL  SetNotificationWnd(CWnd* pNotifyWnd);
    CWnd* GetNotificationWnd() const;

    // Change or retrieve the window to send menu commands to
    BOOL  SetTargetWnd(CWnd* pTargetWnd);
    CWnd* GetTargetWnd() const;

    // Change or retrieve  notification messages sent to the window
    BOOL  SetCallbackMessage(UINT uCallbackMessage);
    UINT  GetCallbackMessage() const;

// Static functions
public:
    static void MinimiseToTray(CWnd* pWnd);
    static void MaximiseFromTray(CWnd* pWnd);

public:
    // Default handler for tray notification message
    virtual LRESULT OnTrayNotification(WPARAM uID, LPARAM lEvent);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSystemTray)
	protected:
	virtual LRESULT WindowProc(UINT message, WPARAM wParam, LPARAM lParam);
	//}}AFX_VIRTUAL

// Implementation
public:
    void Initialise();
    void InstallIconPending();

// Implementation
protected:
    NOTIFYICONDATA  m_tnd;
    BOOL            m_bEnabled;         // does O/S support tray icon?
    BOOL            m_bHidden;          // Has the icon been hidden?
    BOOL            m_bRemoved;         // Has the icon been removed?
    BOOL            m_bShowIconPending; // Show the icon once tha taskbar has been created
	CWnd*           m_pTargetWnd;       // Window that menu commands are sent

    UINT         m_DefaultMenuItemID;
    BOOL         m_DefaultMenuItemByPos;
	UINT         m_uCreationFlags;

// Static data
protected:
    static BOOL RemoveTaskbarIcon(CWnd* pWnd);

    static UINT  m_nMaxTooltipLength;
    static const UINT m_nTaskbarCreatedMsg;
    static CWnd  m_wndInvisible;

    static void GetTrayWndRect(LPRECT lprect);

	// Generated message map functions
protected:
	//{{AFX_MSG(CSystemTray)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	afx_msg void OnSettingChange(UINT uFlags, LPCTSTR lpszSection);
    void OnTaskbarCreated(WPARAM wParam, LPARAM lParam);
	DECLARE_MESSAGE_MAP()
};

#endif
/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SYSTEMTRAY_H__A9012DEA_92F0_46DC_AE1E_28456769BB86__INCLUDED_)
