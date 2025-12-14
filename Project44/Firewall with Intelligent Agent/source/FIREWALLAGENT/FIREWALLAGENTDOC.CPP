// FirewallAgentDoc.cpp : implementation of the CFirewallAgentDoc class
//

#include "stdafx.h"
#include "FirewallAgent.h"

#include "FirewallAgentDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentDoc

IMPLEMENT_DYNCREATE(CFirewallAgentDoc, CDocument)

BEGIN_MESSAGE_MAP(CFirewallAgentDoc, CDocument)
	//{{AFX_MSG_MAP(CFirewallAgentDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentDoc construction/destruction

CFirewallAgentDoc::CFirewallAgentDoc()
{
	// TODO: add one-time construction code here

}

CFirewallAgentDoc::~CFirewallAgentDoc()
{
}

BOOL CFirewallAgentDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return false;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return true;
}



/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentDoc serialization

void CFirewallAgentDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentDoc diagnostics

#ifdef _DEBUG
void CFirewallAgentDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CFirewallAgentDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentDoc commands
