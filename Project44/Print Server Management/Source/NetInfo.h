// NetInfo.h: interface for the CNetInfo class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_NETINFO_H__E30FE996_4865_11D5_9EB4_000102FB9990__INCLUDED_)
#define AFX_NETINFO_H__E30FE996_4865_11D5_9EB4_000102FB9990__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <afxtempl.h>
#include <lm.h>

namespace ssl_net {
#define USER_LIST		CList<NET_DISPLAY_USER, NET_DISPLAY_USER&>
#define MACHINE_LIST	CList<NET_DISPLAY_MACHINE, NET_DISPLAY_MACHINE&>
#define GROUP_LIST		CList<NET_DISPLAY_GROUP, NET_DISPLAY_GROUP>

#define LEVEL_USER		1
#define LEVEL_MACHINE	2
#define LEVEL_GROUP		3
	class CNetInfo  
	{
	public:
		CNetInfo();
		virtual ~CNetInfo();

		static DWORD GetUserInfo (USER_LIST* pUsers, LPCSTR pServer = NULL); // Retrieve User Account information for a server
		static DWORD GetMachineInfo (MACHINE_LIST* pMachines, LPCSTR pServer = NULL); // Retrieve Machine information for a server
		static DWORD GetGroupInfo (GROUP_LIST* pGroups, LPCSTR pServer = NULL);	// Retrieve Group Account information for a server
		static void CleanUp();
		static CString FormatMessage (DWORD dwError); // Format a Win32 error code into it's text description
	
	private:
    static void* m_pBuffer;
		static LPWSTR GetWideString (LPCSTR pString); // Converts a string to Unicode wide-character format
		// Must call GlobalFree for the returned LPWSTR
	};
}

#endif // !defined(AFX_NETINFO_H__E30FE996_4865_11D5_9EB4_000102FB9990__INCLUDED_)
