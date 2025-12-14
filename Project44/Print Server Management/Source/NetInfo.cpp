// CNetInfo.cpp: implementation of the CNetInfo class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Basic.h"
#include "NetInfo.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

using namespace ssl_net;

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
void* CNetInfo::m_pBuffer = NULL;

CNetInfo::CNetInfo() {
}

CNetInfo::~CNetInfo() {
}

//////////////////////////////////////////////////////////////////////
// Public static functions
//////////////////////////////////////////////////////////////////////

DWORD CNetInfo::GetUserInfo (USER_LIST* pUsers, LPCSTR pServer/*= NULL*/){
	// Get the server name as a wide-character string
	LPWSTR pWideServer;
	if (NULL != pServer && 0 != strlen(pServer)) {
		pWideServer = GetWideString (pServer);
	}
	else {
		pWideServer = NULL;
	}

	int nIndex = 0;
	DWORD dwCount;
	NET_DISPLAY_USER* ndu;
	DWORD dwResult, i;
	// Call NetQueryDisplayInformation starting with index 0 until there is no more data
	do {
		dwResult = NetQueryDisplayInformation ((LPCWSTR)pWideServer, 1, nIndex, 10, 24, &dwCount, &m_pBuffer);
		if ((dwResult == ERROR_SUCCESS) || (dwResult == ERROR_MORE_DATA)) {
			for (i = 0, ndu = (NET_DISPLAY_USER*)m_pBuffer; i < dwCount; ++ i, ++ ndu) {
				// Add new structure to list
				pUsers->AddHead (*ndu);
				if (dwCount > 0){
					nIndex = ((NET_DISPLAY_USER*)m_pBuffer)[dwCount - 1].usri1_next_index;
				}
			}
		}
	} while (dwResult == ERROR_MORE_DATA);
	
	// Free memory allocated in GetWideString
	if (NULL != pWideServer) {
		GlobalFree (pWideServer);
	}

	return dwResult;
}

DWORD CNetInfo::GetMachineInfo (MACHINE_LIST* pMachines, LPCSTR pServer/*= NULL*/) {
	// Get the server name as a wide-character string
	LPWSTR pWideServer;
	if (NULL != pServer && 0 != strlen(pServer)) {
		pWideServer = GetWideString (pServer);
	}
	else {
		pWideServer = NULL;
	}

	int nIndex = 0;
	DWORD dwCount;
	NET_DISPLAY_MACHINE* ndu;
	DWORD dwResult, i;
	// Call NetQueryDisplayInformation starting with index 0 until there is no more data
	do {
		dwResult = NetQueryDisplayInformation ((LPCWSTR)pWideServer, 2, nIndex, 10, 24, &dwCount, &m_pBuffer);
		if ((dwResult == ERROR_SUCCESS) || (dwResult == ERROR_MORE_DATA)) {
			for (i = 0, ndu = (NET_DISPLAY_MACHINE*)m_pBuffer; i < dwCount; ++ i, ++ ndu) {
				// Add new structure to list
				pMachines->AddHead (*ndu);
				if (dwCount > 0){
					nIndex = ((NET_DISPLAY_MACHINE*)m_pBuffer)[dwCount - 1].usri2_next_index;
				}
			}
		}
	} while (dwResult == ERROR_MORE_DATA);
	
	// Free memory allocated in GetWideString
	if (NULL != pWideServer) {
		GlobalFree (pWideServer);
	}

	return dwResult;
}

DWORD CNetInfo::GetGroupInfo (GROUP_LIST* pGroups, LPCSTR pServer/*= NULL*/) {
	// Get the server name as a wide-character string
	LPWSTR pWideServer;
	if (NULL != pServer && 0 != strlen(pServer)) {
		pWideServer = GetWideString (pServer);
	}
	else {
		pWideServer = NULL;
	}

	int nIndex = 0;
	DWORD dwCount;
	NET_DISPLAY_GROUP* ndu;
	DWORD dwResult, i;
	// Call NetQueryDisplayInformation starting with index 0 until there is no more data
	do {
		dwResult = NetQueryDisplayInformation ((LPCWSTR)pWideServer, 3, nIndex, 10, 24, &dwCount, &m_pBuffer);
		if ((dwResult == ERROR_SUCCESS) || (dwResult == ERROR_MORE_DATA)) {
			for (i = 0, ndu = (NET_DISPLAY_GROUP*)m_pBuffer; i < dwCount; ++ i, ++ ndu) {
				// Add new structure to list
				pGroups->AddHead (*ndu);
				if (dwCount > 0){
					nIndex = ((NET_DISPLAY_GROUP*)m_pBuffer)[dwCount - 1].grpi3_next_index;
				}
			}
		}
	} while (dwResult == ERROR_MORE_DATA);
	
	// Free memory allocated in GetWideString
	if (NULL != pWideServer) {
		GlobalFree (pWideServer);
	}

	return dwResult;
}

void CNetInfo::CleanUp() {
  if (NULL != m_pBuffer) {
    NetApiBufferFree (m_pBuffer);
  }
}

CString CNetInfo::FormatMessage (DWORD dwError) {	
	LPVOID lpMsgBuf; // Windows will allocate
	::FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |
		FORMAT_MESSAGE_FROM_SYSTEM, 0,
		dwError,
		MAKELANGID(LANG_NEUTRAL,
		SUBLANG_DEFAULT), // Default language
		(LPTSTR)&lpMsgBuf, 0, NULL );
	CString szMessage ((LPTSTR)lpMsgBuf);
	// Free the buffer that was allocated using LocalAlloc()
	::LocalFree( lpMsgBuf ); 

	return szMessage;
}

//////////////////////////////////////////////////////////////////////
// Private functions
//////////////////////////////////////////////////////////////////////

LPWSTR CNetInfo::GetWideString (LPCSTR pString) {
	// Converts a string into a Unicode wide-character string
	// Adds zero-termination
	LPWSTR pWideServer;
	int nBytesSource = strlen(pString) * 2;
	// Query the number of WChars required to store the destination string
	int nWCharNeeded = MultiByteToWideChar (CP_ACP, MB_PRECOMPOSED, pString, nBytesSource, NULL, 0);
	
	// Allocate the required amount of space plus 2 more bytes for '\0'
	pWideServer = (LPWSTR)GlobalAlloc (GPTR, (nWCharNeeded + 1) * 2);
	
	// Do the conversion
	nWCharNeeded = MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, pString,
		nBytesSource,(LPWSTR)pWideServer, nWCharNeeded);
	
	if (0L == nWCharNeeded) {
		pWideServer = NULL;
	}
	else {
		*(LPWSTR)(pWideServer + nWCharNeeded) = L'\0';
	}

	return pWideServer;
}