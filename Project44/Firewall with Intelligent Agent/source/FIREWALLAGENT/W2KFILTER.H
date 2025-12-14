// W2kFilter.h: interface for the CW2kFilter class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_W2KFILTER_H__5E09335E_BD59_410D_A47E_EACF947358F5__INCLUDED_)
#define AFX_W2KFILTER_H__5E09335E_BD59_410D_A47E_EACF947358F5__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Fltdefs.h"  // Windows2000 Packet Filter API



class CW2kFilter  
{
public:
	CString GetStatsString();
	CString log;


	CString IpToString(PBYTE ip);
	void GetStats();
	BOOL StopFilter();
	void SetLocalIP(PBYTE localIP);
	BOOL StartFilter(CObList*);
	CW2kFilter();
	virtual ~CW2kFilter();

protected:
	PF_INTERFACE_STATS m_iStats;
	HANDLE hEvent;
	BYTE m_LocalIP[4];
	INTERFACE_HANDLE s_hIf;
private:
	CObList* currentRuleSet;
	


};

#endif // !defined(AFX_W2KFILTER_H__5E09335E_BD59_410D_A47E_EACF947358F5__INCLUDED_)
