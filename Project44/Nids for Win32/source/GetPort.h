// GetPort.h: interface for the CGetPort class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_GETPORT_H__A4D824D9_80EA_4002_B583_C227B3616998__INCLUDED_)
#define AFX_GETPORT_H__A4D824D9_80EA_4002_B583_C227B3616998__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define Max_Port_Min 40

class CGetPort  
{
public:
	CString IP_Src;
	CString IP_Dst;
	long Port[Max_Port_Min];
	int Count;
	CGetPort();
	virtual ~CGetPort();

};

#endif // !defined(AFX_GETPORT_H__A4D824D9_80EA_4002_B583_C227B3616998__INCLUDED_)
