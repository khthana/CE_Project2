/*
Module : TRACER.CPP
Purpose: Implementation for an MFC wrapper class to encapsulate TRACE ROUTE functionality
Created: PJN / 17-11-1998
History: PJN / 25-02-2002 1) Updated copyright information
                          2) Class now uses #includes CPing class rather than implemented its
                          own implementation of Ping
                          3) General code tidy up and review
         PJN / 05-05-2002 1) Uses latest CPing class, now by default uses ICMP method in CPing class.
                          2) Sample app provided with tracer now actually observes the "-d" command
                          line option 
                          3) Fixed a bug where a pinging error would cause the tracer loop to exit
                          instead of reporting a non-pingable device

Copyright (c) 1998 - 2002 by PJ Naughter.  (Web: www.naughter.com, Email: pjna@naughter.com)

All rights reserved.

Copyright / Usage Details:

You are allowed to include the source code in any product (commercial, shareware, freeware or otherwise) 
when your product is released in binary form. You are allowed to modify the source code in any way you want 
except you cannot modify the copyright details at the top of each module. If you want to distribute source 
code with your application, then you are only allowed to distribute versions released by the author. This is 
to maintain a single distribution point for the source code. 


*/


/////////////////////////////////  Includes  //////////////////////////////////
#include "stdafx.h"
#include "tracer.h"
#include "ping.h"
#include <limits.h>


/////////////////////////////////  Macros & Statics ///////////////////////////

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif



///////////////////////////////// Implementation //////////////////////////////

BOOL CTraceRoute::Trace(LPCTSTR pszHostName, CTraceRouteReply& trr, UCHAR nHopCount, DWORD dwTimeout, DWORD dwPingsPerHost)
{
	//For correct operation of the T2A macro, see TN059
	USES_CONVERSION;

  //Validate our parameters
  ASSERT(pszHostName);
  ASSERT(trr.GetSize() == 0); //Should be empty initially
  ASSERT(nHopCount > 0);

	//Convert to dotted notation if required
  CString sHostName(pszHostName);
 	LPSTR lpszAscii = T2A((LPTSTR) pszHostName);
	unsigned long	addr = inet_addr(lpszAscii);
	if (addr == INADDR_NONE)
	{
		//Not a dotted address, then do a lookup of the name
		hostent* hp = gethostbyname(lpszAscii);
		if (hp)
    {
      IN_ADDR tAddr;
      tAddr.S_un.S_addr = ((LPIN_ADDR)hp->h_addr)->s_addr;
      addr = ((LPIN_ADDR)hp->h_addr)->s_addr;
      sHostName.Format(_T("%d.%d.%d.%d"), tAddr.S_un.S_un_b.s_b1, tAddr.S_un.S_un_b.s_b2, tAddr.S_un.S_un_b.s_b3, tAddr.S_un.S_un_b.s_b4);
    }
		else
		{
			TRACE(_T("Could not resolve the host name %s\n"), pszHostName);
			return FALSE;
		}
	}

  //Iterate through all the hop count values
  BOOL bReachedHost = FALSE;
  for (UCHAR i=1; i<=nHopCount && !bReachedHost; i++)
  {
    CHostTraceMultiReply htrr;
    htrr.dwError = 0;
    htrr.minRTT = ULONG_MAX;
    htrr.avgRTT = 0;
    htrr.maxRTT = 0;

    //Iterate through all the pings for each host
    DWORD totalRTT = 0;
    CHostTraceSingleReply htsr;
    htsr.Address.S_un.S_addr = 0;
    htsr.dwError = 0;
    BOOL bPingError = FALSE;
    for (DWORD j=0; j<dwPingsPerHost && !bPingError; j++)
    {
	    if (Ping(sHostName, htsr, i, dwTimeout))
      {
        if (htsr.dwError == 0)
        {
          //Acumulate the total RTT
          totalRTT += htsr.RTT;

          //Store away the RTT's
          if (htsr.RTT < htrr.minRTT)
            htrr.minRTT = htsr.RTT;
          if (htsr.RTT > htrr.maxRTT)
            htrr.maxRTT = htsr.RTT;

          //Call the virtual function
          if (!OnPingResult(j+1, htsr))
          {
            SetLastError(ERROR_CANCELLED);
            return FALSE;
          }
        }
        else
        {
          htrr.dwError = htsr.dwError;
          bPingError = TRUE;
        }
      }
      else
      {
        htrr.dwError = GetLastError();
        bPingError = TRUE;
      }
    }
    htrr.Address = htsr.Address;
    if (htrr.dwError == 0)
      htrr.avgRTT = totalRTT / dwPingsPerHost;
    else
    {
      htrr.minRTT = 0;
      htrr.avgRTT = 0;
      htrr.maxRTT = 0;
    }

    //Call the virtual function
    if (!OnSingleHostResult(i, htrr))
    {
      SetLastError(ERROR_CANCELLED);
      return FALSE;
    }

    //Add to the list of hosts
    trr.Add(htrr);

    //Have we reached the final host ?
    if (addr == htrr.Address.S_un.S_addr)
      bReachedHost = TRUE;
  }

  return TRUE;
}

BOOL CTraceRoute::Ping(const CString& sHostName, CHostTraceSingleReply& htsr, UCHAR nTTL, DWORD dwTimeout, int nPacketSize)
{
  CPing ping;

  CPingReply pr;
  BOOL bSuccess = ping.PingUsingICMP(sHostName, pr, nTTL, dwTimeout, nPacketSize);

  if (bSuccess)
  {
    //Ping was successful, copy over the pertinent info
    //into the return structure
		htsr.Address.S_un.S_addr = pr.Address.S_un.S_addr;
	  htsr.RTT = pr.RTT;
  }

  //return the status
	return bSuccess; 
}

BOOL CTraceRoute::OnPingResult(int nPingNum, const CHostTraceSingleReply& htsr)
{
  //Default behaviour is just to trace the result and return
  //TRUE to allow the trace route to continue

  TRACE(_T("OnPingResult: %d, IP: %d.%d.%d.%d, RTT: %d, Error: %d\n"), nPingNum, 
        htsr.Address.S_un.S_un_b.s_b1, htsr.Address.S_un.S_un_b.s_b2, htsr.Address.S_un.S_un_b.s_b3, 
        htsr.Address.S_un.S_un_b.s_b4, htsr.RTT, htsr.dwError);

  return TRUE;
}

BOOL CTraceRoute::OnSingleHostResult(int nHostNum, const CHostTraceMultiReply& htmr)
{
  //Default behaviour is just to trace the result and return
  //TRUE to allow the trace route to continue
  TRACE(_T("OnSingleHostResult: %d, IP: %d.%d.%d.%d, Min RTT: %d, Avg RTT: %d, Max RTT: %d, Error: %d\n"), nHostNum, 
        htmr.Address.S_un.S_un_b.s_b1, htmr.Address.S_un.S_un_b.s_b2, htmr.Address.S_un.S_un_b.s_b3, 
        htmr.Address.S_un.S_un_b.s_b4, htmr.minRTT, htmr.avgRTT, htmr.maxRTT, htmr.dwError);

  return TRUE;
}
