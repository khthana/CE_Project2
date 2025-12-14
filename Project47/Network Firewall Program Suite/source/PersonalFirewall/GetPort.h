// GetPort.h: interface for the CGetPort class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_GETPORT_H__4BF9695D_DD3B_4913_9A4E_F10DFD5A4CE6__INCLUDED_)
#define AFX_GETPORT_H__4BF9695D_DD3B_4913_9A4E_F10DFD5A4CE6__INCLUDED_

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

#endif // !defined(AFX_GETPORT_H__4BF9695D_DD3B_4913_9A4E_F10DFD5A4CE6__INCLUDED_)
