// FilterRule.cpp: implementation of the CCFilterRule class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FirewallAgent.h"
#include "FilterRule.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CFilterRule::CFilterRule()
{

}

CFilterRule::~CFilterRule()
{

}

/*---------------------------------------------------------
   StringToIP() - Convert IP String to PBYTE format
  ---------------------------------------------------------
*/
BYTE *CFilterRule::StringToIP(CString IPString)
{
	//BYTE IPByte[4];
	PBYTE IPByte = new BYTE[4];

	IPString.TrimLeft();
	IPString.TrimRight();

	for ( int i=0; i<3; i++ ) 
	{
		int pos = IPString.Find('.');
		CString tmpString = IPString.Left(pos);
		IPByte[i] = atoi(tmpString);
		IPString.Delete(0, pos+1);
	}
	IPByte[3] = atoi(IPString);
	// add exception handler here
	return IPByte;
}

/*---------------------------------------------------------
   CreateRule() - Create CFilterRule object from rule string
  ---------------------------------------------------------
*/
CFilterRule* CFilterRule::CreateRule(CString ruleString)
{
	CString str;
	int stpos = 0;
	int enpos, length;

	CFilterRule *newRule = new CFilterRule;

	for (int i=1; i < 11; i++) 
	{
		length = ruleString.GetLength();
		enpos = ruleString.Find(" ");
		str = ruleString;
		ruleString.Delete(stpos, enpos-stpos+1);
		str.Delete(enpos, length-enpos);
		while (ruleString.Find(" ") == 0)
		{
			ruleString.Delete(0,1);
		}
		str.Delete(enpos, length-enpos);

		switch (i) 
		{
			case 1: newRule->SetRuleNo(str);
					break;
			case 2: newRule->SetSrcAddr(str);
					break;
			case 3: newRule->SetSrcMask(str);
					break;
			case 4: newRule->SetSrcPort(str);
					break;
			case 5: newRule->SetSrcPortRange(str);
					break;
			case 6: newRule->SetDstAddr(str);
					break;
			case 7: newRule->SetDstMask(str);
					break;
			case 8: newRule->SetDstPort(str);
					break;
			case 9:	newRule->SetDstPortRange(str);
					break;
			case 10: newRule->SetProtocol(str);
					break;
		} 
	} // for
	return newRule;
}

/*---------------------------------------------------------
   SameIP() -  Compare 2 IP address whether it is the same 
               or not
  ---------------------------------------------------------
*/
BOOL CFilterRule::SameIP(PBYTE IP1, PBYTE IP2)
{
	if ( (*IP1 == *IP2) &&
		 (*(IP1+1) == *(IP2+1)) &&
		 (*(IP1+2) == *(IP2+2)) &&
		 (*(IP1+3) == *(IP2+3)) )
	{
		return TRUE;
	} 
	else
	{
		return FALSE;
	}
}

/*---------------------------------------------------------
   FormatPortRange() - Not use anymore, can be deleted
  ---------------------------------------------------------
*/
void CFilterRule::FormatPortRange(CString portString, CString &portLowRange, 
								  CString &portHighRange)
{
	if  (portString.Find("=") == 0) 
	{ 
		portString.Delete(0,1);      
		portLowRange = portString;
		portHighRange = portString;
	}
	else if (portString.Find(">") == 0)
	{ 
		portString.Delete(0,1);
		portLowRange = portString;
		portHighRange = "65535";
	}
	else if (portString.Find("<") == 0)
	{ 
		portString.Delete(0,1);  
		portLowRange = "0";
		portHighRange = portString;
	}
	else if (portString.Find("-") != 0)
	{ 
		CString portString2 = portString;
		int szPort = portString.GetLength();
		int pos = portString.Find("-") ;
		portString.Delete(pos, szPort-pos);
		portString2.Delete(0, pos+1);
		portLowRange = portString;
		portHighRange = portString2;
	}
	
}

/*---------------------------------------------------------
   Serialize() - Make CFilterRule objects serializable
  ---------------------------------------------------------
*/
void CFilterRule::Serialize(CArchive &archive)
{
	CObject::Serialize( archive );
	
	if (archive.IsStoring()) {

		archive << m_ruleNo;
		// Serialize Arrays
		for (int i=0; i<4; i++) 
		{
			archive << m_SrcAddr[i];
			archive << m_SrcMask[i];
			archive << m_DstAddr[i];
			archive << m_DstMask[i];
		}
		archive << m_SrcPort;
		archive << m_SrcPortRange;
		archive << m_DstPort;
		archive << m_DstPortRange;
		archive << m_Protocol;
	
	} else {
		archive >> m_ruleNo;
		// De-Serialize Arrays
		for (int i=0; i<4; i++) 
		{
			archive >> m_SrcAddr[i];
			archive >> m_SrcMask[i];
			archive >> m_DstAddr[i];
			archive >> m_DstMask[i];
		}
		archive >> m_SrcPort;
		archive >> m_SrcPortRange;
		archive >> m_DstPort;
		archive >> m_DstPortRange;
		archive >> m_Protocol;
	}
}





//////////////////////////////////////////////////////////////////////
// Mutator Functions
//////////////////////////////////////////////////////////////////////

void CFilterRule::SetRuleNo(const CString ruleNo)
{
	m_ruleNo = atoi(ruleNo);
}


void CFilterRule::SetSrcAddr(const CString SrcAddr)
{
	PBYTE IP = StringToIP(SrcAddr);
	m_SrcAddr[0] = *IP;
	m_SrcAddr[1] = *(IP+1);
	m_SrcAddr[2] = *(IP+2);
	m_SrcAddr[3] = *(IP+3);
}

void CFilterRule::SetSrcMask(const CString SrcMask)
{
	PBYTE IP = StringToIP(SrcMask);
	m_SrcMask[0] = *IP;
	m_SrcMask[1] = *(IP+1);
	m_SrcMask[2] = *(IP+2);
	m_SrcMask[3] = *(IP+3);
}

void CFilterRule::SetSrcPort(const CString SrcPort)
{
	//TODO: add integrity check here
	//      maybe create a function to handle the job?
	m_SrcPort = atoi(SrcPort);
}

void CFilterRule::SetSrcPortRange(const CString SrcPortRange)
{
	//TODO: add integrity check here
	m_SrcPortRange = atoi(SrcPortRange);
}

void CFilterRule::SetDstAddr(const CString DstAddr)
{
	PBYTE IP = StringToIP(DstAddr);
	m_DstAddr[0] = *IP;
	m_DstAddr[1] = *(IP+1);
	m_DstAddr[2] = *(IP+2);
	m_DstAddr[3] = *(IP+3);
}

void CFilterRule::SetDstMask(const CString DstMask)
{
	PBYTE IP = StringToIP(DstMask);
	m_DstMask[0] = *IP;
	m_DstMask[1] = *(IP+1);
	m_DstMask[2] = *(IP+2);
	m_DstMask[3] = *(IP+3);
}

void CFilterRule::SetDstPort(const CString DstPort)
{
	//TODO: add integrity check here
	m_DstPort = atoi(DstPort);
}

void CFilterRule::SetDstPortRange(const CString DstPortRange)
{
	//TODO: add integrity check here
	m_DstPortRange = atoi(DstPortRange);
}

void CFilterRule::SetProtocol(const CString Protocol)
{

	m_Protocol = Protocol;
}


//////////////////////////////////////////////////////////////////////
// Accessor Functions
//////////////////////////////////////////////////////////////////////

int CFilterRule::GetRuleNo()
{
	return m_ruleNo;
}

PBYTE CFilterRule::GetSrcAddr() 
{
	return m_SrcAddr;
}

PBYTE CFilterRule::GetSrcMask()
{
	return m_SrcMask;
}

WORD CFilterRule::GetSrcPort() const
{
	return m_SrcPort;
}

WORD CFilterRule::GetSrcPortRange() const
{
	return m_SrcPortRange;
}

PBYTE CFilterRule::GetDstAddr()
{
	return m_DstAddr;
}

PBYTE CFilterRule::GetDstMask()
{
	return m_DstMask;
}

WORD CFilterRule::GetDstPort() const
{
	return m_DstPort;
}

WORD CFilterRule::GetDstPortRange() const
{
	return m_DstPortRange;
}

CString CFilterRule::GetProtocol() const
{
	return m_Protocol;
}


IMPLEMENT_SERIAL(CFilterRule, CObject, 1)