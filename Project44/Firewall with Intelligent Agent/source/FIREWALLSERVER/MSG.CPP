// Msg.cpp: implementation of the CMsg class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
//#include "FirewallServer.h"
#include "Msg.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

IMPLEMENT_DYNCREATE(CMsg, CObject)

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CMsg::CMsg()
{
	Init();
}

CMsg::~CMsg()
{

}

void CMsg::Serialize(CArchive &ar)
{
	if (ar.IsStoring())
	{
		ar << m_command;
		ar << m_pData;
	}
	else
	{
		ar >> m_command;
		ar >> m_pData;
	}
}

void CMsg::Init()
{
	m_command = _T("");
	m_pData = NULL;
}
