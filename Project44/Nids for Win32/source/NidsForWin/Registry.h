// Registry.h: interface for the CRegistry class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_REGISTRY_H__BE382D4A_5317_4F44_A97E_C13D7B10ACD2__INCLUDED_)
#define AFX_REGISTRY_H__BE382D4A_5317_4F44_A97E_C13D7B10ACD2__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define CLASS_NAME_LENGTH 255

class CRegistry  
{
public:
	CRegistry();
	virtual ~CRegistry();

protected:
	HKEY m_hRootKey;
	CString m_CurrentKey;

public:
	BOOL OpenReg(CString KeyStr);
	BOOL CreateKey(CString strKey);
	BOOL AddValue(CString value,CString data);
	BOOL DeleteValue(const CString strName);
	int GetValueCount();
	BOOL GetRegistryList(CStringArray &);
};

#endif // !defined(AFX_REGISTRY_H__BE382D4A_5317_4F44_A97E_C13D7B10ACD2__INCLUDED_)
