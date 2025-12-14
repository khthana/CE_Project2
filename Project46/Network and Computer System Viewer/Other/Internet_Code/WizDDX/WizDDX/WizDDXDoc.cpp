// WizDDXDoc.cpp : implementation of the CWizDDXDoc class
//

#include "stdafx.h"
#include "WizDDX.h"

#include "WizDDXDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWizDDXDoc

IMPLEMENT_DYNCREATE(CWizDDXDoc, CDocument)

BEGIN_MESSAGE_MAP(CWizDDXDoc, CDocument)
	//{{AFX_MSG_MAP(CWizDDXDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWizDDXDoc construction/destruction

CWizDDXDoc::CWizDDXDoc()
{
	// TODO: add one-time construction code here

}

CWizDDXDoc::~CWizDDXDoc()
{
}

BOOL CWizDDXDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CWizDDXDoc serialization

void CWizDDXDoc::Serialize(CArchive& ar)
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
// CWizDDXDoc diagnostics

#ifdef _DEBUG
void CWizDDXDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CWizDDXDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CWizDDXDoc commands
