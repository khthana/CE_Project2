// ADConnect.h: interface for the ADConnect class.
// Version 0.03
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ADCONNECT_H__9750ED06_B394_4375_84D3_AA1F539F0AFB__INCLUDED_)
#define AFX_ADCONNECT_H__9750ED06_B394_4375_84D3_AA1F539F0AFB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

//adsi use
#include <activeds.h>

//OLE2T and T2OLE use
#include <atlconv.h>

#pragma comment(lib, "Lib/adsiid.lib")
#pragma comment(lib, "Lib/activeds.lib")

class ADConnect
{
public:
	bool SetDeleteRule(CString Path, int Order);
//	bool SetEditRule(CString Path, CString NewRule,int Order);
	bool SetNewRule(CString Path, CString NewRule);
	bool GetRule(CString Path,CStringArray& Rule);
	bool GetMemberOf(CString UserPath,CStringArray& MemberOf);
	bool GetMember(CString GroupPath,CStringArray& Member);
	//bool GetUserList(CString& Name,CString& DistinguishedName);
	bool ADConnect::GetList(CString View,CStringArray& Name,CStringArray& DistinguishedName);
	CString GetDoMain();
	ADConnect();
	virtual ~ADConnect();

	bool SetNewLog(CString Path, CString NewLog);
	bool GetLog(CString Path,CStringArray& Log);
	bool SetDeleteLog(CString Path, int Order);	
};

#endif // !defined(AFX_ADCONNECT_H__9750ED06_B394_4375_84D3_AA1F539F0AFB__INCLUDED_)
