// W2kFilter.cpp: implementation of the CW2kFilter class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FirewallAgent.h"
#include "W2kFilter.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

#include "FilterRule.h"
#include "LogDlg.h"


//BACKUP BYTE CW2kFilter::m_LocalIP[4];
//BACKUP INTERFACE_HANDLE CW2kFilter::s_hIf = NULL;

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CW2kFilter::CW2kFilter()
{
	s_hIf = NULL;

}

CW2kFilter::~CW2kFilter()
{

}

/* ----------------------------------------------------------------------
   StartFilter(): Create & Bind Filter Interface using rules from ruleSet
   ----------------------------------------------------------------------
*/

BOOL CW2kFilter::StartFilter(CObList* ruleSet)
{
	 
	/*
	hEvent = CreateEvent(NULL, FALSE, FALSE, NULL);
	if ( PfMakeLog(hEvent) != NO_ERROR ) 
	{
		//DEBUG
		MessageBox(NULL, "PfMakeLog Error", "Error", 
			MB_ICONINFORMATION);
	}
	*/
	currentRuleSet = ruleSet;
	
	if ( ruleSet->IsEmpty() ) 
		return FALSE;

	if (s_hIf == NULL) {
		PfCreateInterface(0, PF_ACTION_FORWARD, PF_ACTION_FORWARD, TRUE,
			TRUE, &s_hIf);
	}
	POSITION pos = ruleSet->GetHeadPosition();
	
	while ( pos != NULL ) 
	{
		CFilterRule* rule = (CFilterRule*)ruleSet->GetNext(pos);
		PF_FILTER_DESCRIPTOR ipFlt;

		// Substitute 127.0.0.0 with real local IP Address
		PBYTE localAddr = (PBYTE)"\x7F\x00\x00\x00"; // 127.0.0.0
		PBYTE srcAddr = CFilterRule::SameIP(rule->GetSrcAddr(),
								localAddr) ? m_LocalIP : rule->GetSrcAddr();
		PBYTE dstAddr = CFilterRule::SameIP(rule->GetDstAddr(),
								localAddr) ? m_LocalIP : rule->GetDstAddr();
		
		memset( &ipFlt, 0, sizeof(ipFlt) );
		// setup new filter descriptor
		ipFlt.dwFilterFlags = FD_FLAGS_NOSYN;
		ipFlt.dwRule		= rule->GetRuleNo();
		ipFlt.pfatType		= PF_IPV4;
		ipFlt.dwProtocol	= rule->GetProtocol() == "TCP" 
								? FILTER_PROTO_TCP : 
								rule->GetProtocol() == "UDP" 
								? FILTER_PROTO_UDP :
								rule->GetProtocol() == "ICMP"
								? FILTER_PROTO_ICMP :
								  FILTER_PROTO_ANY;
		ipFlt.fLateBound    = 0;

		ipFlt.wSrcPort		= rule->GetSrcPort();
		ipFlt.wSrcPortHighRange = rule->GetSrcPortRange();
		ipFlt.wDstPort		= rule->GetDstPort();
		ipFlt.wDstPortHighRange = rule->GetDstPortRange();
			
		ipFlt.SrcAddr		= srcAddr;
		ipFlt.SrcMask		= rule->GetSrcMask();
		ipFlt.DstAddr		= dstAddr;
		ipFlt.DstMask		= rule->GetDstMask();
		
		if ( CFilterRule::SameIP(m_LocalIP, srcAddr) )
		{ // Is Output Filter
			if (PfAddFiltersToInterface(s_hIf, 0, NULL, 1, &ipFlt, NULL) 
				!= NO_ERROR)  
			{
				return FALSE;
			}

		}
		else if ( CFilterRule::SameIP(m_LocalIP, dstAddr) )
		{ // Is Input Filter
			if (PfAddFiltersToInterface(s_hIf, 1, &ipFlt, 0, NULL, NULL)
				!= NO_ERROR)
			{
				return FALSE;
			}
		}
		else
		{ // This filter does not relate to this client
			//TODO: What should we do?
		}
	}

	if (PfBindInterfaceToIPAddress(s_hIf, PF_IPV4, m_LocalIP) == NO_ERROR) 
	{
		return true;
	}
	else
	{
		return false;	
	}
}

/* ------------------------------------------------------------
   SetLocalIP(): Set internal local IP Address from localIP
   ------------------------------------------------------------
*/
void CW2kFilter::SetLocalIP(PBYTE localIP)
{
	m_LocalIP[0] = *localIP;
	m_LocalIP[1] = *(localIP+1);
	m_LocalIP[2] = *(localIP+2);
	m_LocalIP[3] = *(localIP+3);
}


/* ------------------------------------------------------------
   StopFilter(): Stop & Remove Filter Interface
   ------------------------------------------------------------
*/
BOOL CW2kFilter::StopFilter()
{
	if ( (PfUnBindInterface(s_hIf) == NO_ERROR) && (PfDeleteInterface(s_hIf) == NO_ERROR) )
	{
		s_hIf = NULL;
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}

/* -------------------------------------------------------------
   GetStats(): Get Interface's statistic, still not completed
   -------------------------------------------------------------
*/
void CW2kFilter::GetStats()
{
	DWORD bufferSize, result;
	CObList* rs = currentRuleSet;
	CLogDlg logdlg;

	
	// Interface must be initilized first
	if (s_hIf == NULL)
		return;

	bufferSize = sizeof(PF_INTERFACE_STATS);
	
	// first call to get the correct buffer size
	result = PfGetInterfaceStatistics(s_hIf, &m_iStats, &bufferSize, FALSE);
	result = PfGetInterfaceStatistics(s_hIf, &m_iStats, &bufferSize, FALSE);
	if (result == NO_ERROR)
	{
		log = "";
	//	CStdioFile WriteFile("log.txt", CFile::modeCreate|CFile::modeWrite);
		for (int i = 0; i < rs->GetCount(); i++) 
		{
			
			if ( (m_iStats.FilterInfo[i].info.dwRule > 0) &&
				 (m_iStats.FilterInfo[i].info.dwRule < 999) )
			{
					POSITION pos = rs->GetHeadPosition();
					
					while ( pos != NULL ) 
					{
						CFilterRule* rule = (CFilterRule*)rs->GetNext(pos);
			  			if ( (DWORD) rule->GetRuleNo() == m_iStats.FilterInfo[i].info.dwRule)
						{
							CString r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
							r1.Format("%d",rule->GetRuleNo());
							r2 = IpToString(rule->GetSrcAddr());
							r3 = IpToString(rule->GetSrcMask());
							r4.Format("%d",rule->GetSrcPort());
							r5.Format("%d",rule->GetSrcPortRange());
							r6 = IpToString(rule->GetDstAddr());
							r7 = IpToString(rule->GetDstMask());
							r8.Format("%d",rule->GetDstPort());
							r9.Format("%d",rule->GetDstPortRange());
							r10.Format("%s",rule->GetProtocol());
							r11.Format("%d", m_iStats.FilterInfo[i].dwNumPacketsFiltered);
							log = log + r1 + "   " + r2 + "   " + r3 + "   " + r4 +"   " + 
								r5 + "   " + r6 + "   " + r7 + "   " + r8 + "   " + 
								r9 + "   " + r10 + "   " + r11 + "\n\r";
							logdlg.GetLog(log);
							
							
						}
					}
					
					
			}
		} // for
		
	
        
		logdlg.DoModal();
		
	}
	else 
	{
		// Some unexpected error occured
	}
}

/* -------------------------------------------------------------
   IpToString(): Convert Byte IP to String IP
   -------------------------------------------------------------
*/
CString CW2kFilter::IpToString(PBYTE ip)
{
	CString ip1,ip2,ip3,ip4;
	ip1.Format("%d",*ip);
	ip2.Format("%d",*(ip+1));
	ip3.Format("%d",*(ip+2));
	ip4.Format("%d",*(ip+3));
	
	return ip1+"."+ip2+"."+ip3+"."+ip4;
}

/* -------------------------------------------------------------
   GetStatsString(): Get interface's statistic as string
   -------------------------------------------------------------
*/
CString CW2kFilter::GetStatsString()
{
	DWORD bufferSize, result;
	CObList* rs = currentRuleSet;

	
	// Interface must be initilized first
	if (s_hIf == NULL)
		return "";

	bufferSize = sizeof(PF_INTERFACE_STATS);
	
	// first call to get the correct buffer size
	result = PfGetInterfaceStatistics(s_hIf, &m_iStats, &bufferSize, FALSE);
	result = PfGetInterfaceStatistics(s_hIf, &m_iStats, &bufferSize, FALSE);
	if (result == NO_ERROR)
	{
		log = "";
	//	CStdioFile WriteFile("log.txt", CFile::modeCreate|CFile::modeWrite);
		for (int i = 0; i < rs->GetCount(); i++) 
		{
			
			if ( (m_iStats.FilterInfo[i].info.dwRule > 0) &&
				 (m_iStats.FilterInfo[i].info.dwRule < 999) )
			{
					POSITION pos = rs->GetHeadPosition();
					
					while ( pos != NULL ) 
					{
						CFilterRule* rule = (CFilterRule*)rs->GetNext(pos);
			  			if ( (DWORD) rule->GetRuleNo() == m_iStats.FilterInfo[i].info.dwRule)
						{
							CString r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
							r1.Format("%d",rule->GetRuleNo());
							r2 = IpToString(rule->GetSrcAddr());
							r3 = IpToString(rule->GetSrcMask());
							r4.Format("%d",rule->GetSrcPort());
							r5.Format("%d",rule->GetSrcPortRange());
							r6 = IpToString(rule->GetDstAddr());
							r7 = IpToString(rule->GetDstMask());
							r8.Format("%d",rule->GetDstPort());
							r9.Format("%d",rule->GetDstPortRange());
							r10.Format("%s",rule->GetProtocol());
							r11.Format("%d", m_iStats.FilterInfo[i].dwNumPacketsFiltered);
							log = log + r1 + "   " + r2 + "   " + r3 + "   " + r4 +"   " + 
								r5 + "   " + r6 + "   " + r7 + "   " + r8 + "   " + 
								r9 + "   " + r10 + "   " + r11 + "\n\r";
							
						}
					}
			}
		} // for
	}
	else 
	{
		// Some unexpected error occured
		return "";
	}
	return log;
}
