// Registry.cpp: implementation of the CRegistry class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "NidsForWin.h"
#include "Registry.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CRegistry::CRegistry()
{
	m_hRootKey = HKEY_LOCAL_MACHINE;

}

CRegistry::~CRegistry()
{

}

BOOL CRegistry::OpenReg(CString KeyStr)
{
	if (::RegOpenKeyEx(HKEY_LOCAL_MACHINE, LPCTSTR(KeyStr), 0,
		KEY_WRITE|KEY_READ|KEY_SET_VALUE, &m_hRootKey) != ERROR_SUCCESS)
		return FALSE;
	m_CurrentKey = KeyStr;
	return TRUE;

}

BOOL CRegistry::CreateKey(CString strKey)
{
	/* Use CreateKey to add a new key to the registry. 
		Key is the name of the key to create. Key must be 
		an absolute name. An absolute key 
		begins with a backslash (\) and is a subkey of 
		the root key. */
	
	DWORD dwDisposition;
	HKEY hKey = NULL;

	OpenReg(m_CurrentKey);

	if (::RegCreateKeyEx(m_hRootKey, LPCTSTR(strKey), 0, REG_NONE,
		REG_OPTION_NON_VOLATILE, KEY_WRITE|KEY_READ, NULL, &hKey,
		&dwDisposition)	!= ERROR_SUCCESS)
		return FALSE;
	m_hRootKey = hKey;
	m_CurrentKey += "\\\\"+ strKey;
	::RegCloseKey(m_hRootKey);
	return TRUE;
}


BOOL CRegistry::DeleteValue(const CString strName)
{
	/* Call DeleteValue to remove a specific data value 
		associated with the current key. Name is string 
		containing the name of the value to delete. Keys can contain 
		multiple data values, and every value associated with a key 
		has a unique name. */

	LONG lResult;
	LPCTSTR lpszEntry = strName;

	OpenReg(m_CurrentKey);

	lResult = ::RegDeleteValue(m_hRootKey, lpszEntry);

	if (lResult != ERROR_SUCCESS)
		return FALSE;
	::RegCloseKey(m_hRootKey);
	return TRUE;
}

BOOL CRegistry::AddValue(CString value,CString data)
{
	/* Call AddValue to add a specific data value 
		associated with the current key. Name is string 
		containing the name of the value to delete. Keys can contain 
		multiple data values, and every value associated with a key 
		has a unique name. */

	LPCTSTR lpszEntry = value;
	LPCTSTR lpszValue = data ; 

	OpenReg(m_CurrentKey);

	if (::RegSetValueEx(m_hRootKey, lpszEntry, NULL, REG_SZ,(LPBYTE)lpszValue,
		(lstrlen(lpszValue)+1)*sizeof(TCHAR)) != ERROR_SUCCESS)
		return FALSE;
	::RegCloseKey(m_hRootKey);
	return TRUE;
}

int CRegistry::GetValueCount()
{
	/* Call this function to determine the number of subkeys.
		the function returns -1 on error */

	/* Call this function to determine the number of subkeys.
		the function returns -1 on error */

	OpenReg(m_CurrentKey);

	LONG lResult;
	DWORD dwSubKeyCount, dwValueCount, dwClassNameLength,
		dwMaxSubKeyName, dwMaxValueName, dwMaxValueLength;
	FILETIME ftLastWritten;

	_TCHAR szClassBuffer[CLASS_NAME_LENGTH];
		
	dwClassNameLength = CLASS_NAME_LENGTH;
	lResult = ::RegQueryInfoKey(m_hRootKey, szClassBuffer, &dwClassNameLength,
		NULL, &dwSubKeyCount, &dwMaxSubKeyName, NULL, &dwValueCount,
		&dwMaxValueName, &dwMaxValueLength, NULL, &ftLastWritten);
				
	if (lResult != ERROR_SUCCESS) return -1;

	::RegCloseKey(m_hRootKey);

	return (int)dwValueCount;
}

BOOL CRegistry::GetRegistryList(CStringArray &ArrayValueData)
{
	DWORD dwType, dwCount;
	long index = 0;
	LONG lResult = 0;
	CHAR ValueName[50];
	DWORD dwcValueName = 50;
	CString data;
	ValueName[0] = '\0';
	dwCount = 50;

	if ( OpenReg(m_CurrentKey) == FALSE ) return FALSE;

	lResult = RegEnumValue(m_hRootKey,index,ValueName,//regenumvalue return the key value names.
	&dwcValueName,NULL,&dwType,NULL,&dwCount);
	while(lResult != ERROR_NO_MORE_ITEMS)
	{
		RegQueryValueEx(m_hRootKey, ValueName, NULL, &dwType,
			(LPBYTE)data.GetBuffer(dwCount/sizeof(TCHAR)), &dwCount);
		data.ReleaseBuffer();
		CString str = (CString)ValueName;
		if(!(str.IsEmpty())) //neglecting the default value. 
		{
			str = (CString)ValueName + "#" + data;//concatenating the key value and its data 
			//separating with #
			ArrayValueData.Add((LPCTSTR)str);
		}
		++index;
		dwcValueName = 50;
		lResult = RegEnumValue(m_hRootKey,index,ValueName,&dwcValueName,NULL,&dwType,NULL,
			&dwCount);
	}
	::RegCloseKey(m_hRootKey);
	return TRUE;

}