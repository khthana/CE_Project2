/*
Module : TRACER.H
Purpose: Interface for an MFC wrapper class to encapsulate TRACE ROUTE functionality
Created: PJN / 17-11-1998


Copyright (c) 1998 - 2002 by PJ Naughter.  (Web: www.naughter.com, Email: pjna@naughter.com)

All rights reserved.

Copyright / Usage Details:

You are allowed to include the source code in any product (commercial, shareware, freeware or otherwise) 
when your product is released in binary form. You are allowed to modify the source code in any way you want 
except you cannot modify the copyright details at the top of each module. If you want to distribute source 
code with your application, then you are only allowed to distribute versions released by the author. This is 
to maintain a single distribution point for the source code. 

*/


/////////////////////////// Macros ///////////////////////////

#ifndef __TRACER_H__
#define __TRACER_H__


#ifndef __AFXTEMPL_H__
#pragma message("To avoid this message please put afxtempl.h in your PCH")
#include <afxtempl.h>
#include "winsock2.h"
#endif


/////////////////////////// Classes /////////////////////////////////

struct CHostTraceSingleReply
{
  DWORD    dwError;  //GetLastError for this replier
	in_addr	 Address;  //The IP address of the replier
	unsigned long RTT; //Round Trip time in milliseconds for this replier
};

struct CHostTraceMultiReply
{
  DWORD    dwError; //GetLastError for this host
	in_addr	 Address; //The IP address of the replier
	DWORD    minRTT;  //Minimum round trip time in milliseconds
  DWORD    avgRTT;  //Average round trip time in milliseconds
  DWORD    maxRTT;  //Maximum round trip time in milliseconds
};

typedef CArray<CHostTraceMultiReply, CHostTraceMultiReply&> CTraceRouteReply;



//The actual class which does the Trace Route
class CTraceRoute 
{
public:
//Methods
  BOOL Trace(LPCTSTR pszHostName, CTraceRouteReply& trr, UCHAR nHopCount = 30, DWORD dwTimeout = 30000, DWORD dwPingsPerHost = 3); 

//Overidables
  virtual BOOL OnPingResult(int nPingNum, const CHostTraceSingleReply& htsr);
  virtual BOOL OnSingleHostResult(int nHostNum, const CHostTraceMultiReply& htmr);

protected:
  virtual BOOL Ping(const CString& sHostName, CHostTraceSingleReply& htsr, UCHAR nTTL, DWORD dwTimeout, int nPacketSize = 32);
};

#endif //__TRACER_H__

