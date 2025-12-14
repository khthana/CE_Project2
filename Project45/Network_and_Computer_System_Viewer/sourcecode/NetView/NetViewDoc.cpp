// NetViewDoc.cpp : implementation of the CNetViewDoc class
//

#include "stdafx.h"
#include "NetView.h"
#include "NetworkParameter.h"
#include "NetViewDoc.h"
#include "Data.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CNetViewDoc

IMPLEMENT_DYNCREATE(CNetViewDoc, CDocument)

BEGIN_MESSAGE_MAP(CNetViewDoc, CDocument)
	//{{AFX_MSG_MAP(CNetViewDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

int first=0;
CString QuickCommand;

/////////////////////////////////////////////////////////////////////////////
// CNetViewDoc construction/destruction

CNetViewDoc::CNetViewDoc()
{
	// TODO: add one-time construction code here
}

CNetViewDoc::~CNetViewDoc()
{
}

BOOL CNetViewDoc::OnNewDocument()
{
	
	if (!CDocument::OnNewDocument())
		return FALSE;
	all_host.RemoveAll();
	InvalidateRect(NULL,NULL,TRUE);
	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)
	m_sizeViewDoc = CSize(1500,1500);
	CData db;

	db.Open(dbOpenDynaset,_T("Select * From HostActive"));
	while(!db.IsEOF())
	{
		db.Delete();
		db.MoveNext();
		if(db.IsEOF()) break;
	}
	if(first!=0)
	{
		CNetworkParameter* nParam=new CNetworkParameter;
		nParam->DoModal();
	}
	//first=1;
	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CNetViewDoc serialization

void CNetViewDoc::Serialize(CArchive& ar)
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
// CNetViewDoc diagnostics

#ifdef _DEBUG
void CNetViewDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CNetViewDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CNetViewDoc commands
