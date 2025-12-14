// DictDoc.cpp : implementation of the CDictDoc class
//

#include "stdafx.h"
#include "Dict.h"

#include "DictSet.h"
#include "DictDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDictDoc

IMPLEMENT_DYNCREATE(CDictDoc, CDocument)

BEGIN_MESSAGE_MAP(CDictDoc, CDocument)
	//{{AFX_MSG_MAP(CDictDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDictDoc construction/destruction

CDictDoc::CDictDoc()
{
}

CDictDoc::~CDictDoc()
{
}

BOOL CDictDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// (SDI documents will reuse this document)
	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CDictDoc diagnostics

#ifdef _DEBUG
void CDictDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CDictDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CDictDoc commands
