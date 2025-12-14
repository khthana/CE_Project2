// rtcdialogs.h
//

#ifndef _RTCDIALOGS_H_
#define _RTCDIALOGS_H_

// Show the logon dialog
HRESULT ShowLoginDialog(HWND hWndParent, 
                        BSTR *pbstrURI, BSTR *pbstrServer, BSTR *pbstrTransport);

// Show the authentication dialog
HRESULT ShowAuthenDialog(HWND hWndParent, PWSTR szRealm,
                       BSTR *pbstrURI, BSTR *pbstrAccount, BSTR *pbstrPassword,
                       BSTR *pbstrServer, BSTR *pbstrTransport);

// Show the incoming watcher dialog
HRESULT ShowWatcherDialog(HWND hWndParent,
                          BSTR bstrName, BSTR bstrURI,
                          BOOL *pfAllow, BOOL *pfAddBuddy);

// Show the address dialog
HRESULT ShowAddressDialog(HWND hWndParent,
                          PWSTR szTitle,
                          BSTR *pbstrURI, BSTR *pbstrName);

// Show the display name dialog
HRESULT ShowDisplayNameDialog(HWND hWndParent,BSTR *pbstrDisplayName);


// Show the incoming session dialog
HRESULT ShowSessionDialog(HWND hwndParent,
                          BSTR bstrName, BSTR bstrURI,
                          BOOL *pfAccept);

// Show additional details about a buddy
HRESULT	ShowBuddyPropertiesDialog(
		HWND hWndParent,
		IRTCBuddy2 *pBuddy);

#endif //_RTCDIALOGS_H_
