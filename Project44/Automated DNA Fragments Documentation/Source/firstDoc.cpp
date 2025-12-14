// firstDoc.cpp : implementation of the CFirstDoc class
//

#include "stdafx.h"
#include "first.h"

#include "dibapi.h"
#include "firstDoc.h"
#include "firstView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CFirstDoc

IMPLEMENT_DYNCREATE(CFirstDoc, CDocument)

BEGIN_MESSAGE_MAP(CFirstDoc, CDocument)
	//{{AFX_MSG_MAP(CFirstDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFirstDoc construction/destruction

CFirstDoc::CFirstDoc()
{
	// TODO: add one-time construction code here
	select = false;
	pPalDIB = new CPalette;
}

CFirstDoc::~CFirstDoc()
{
	if (hDIB != NULL)
	{
		::GlobalFree((HGLOBAL) hDIB);
	}
		if (pPalDIB != NULL)
	{
		delete pPalDIB;
	}
}

BOOL CFirstDoc::OnNewDocument()
{
	//if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	//return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CFirstDoc serialization

void CFirstDoc::Serialize(CArchive& ar)
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
// CFirstDoc diagnostics

#ifdef _DEBUG
void CFirstDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CFirstDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CFirstDoc commands

BOOL CFirstDoc::OnOpenDocument(LPCTSTR lpszPathName) 
{

	extern BOOL open_list;
	open_list = false;
	if (!CDocument::OnOpenDocument(lpszPathName))
		return FALSE;
	file_name = lpszPathName;
	::LoadBMP(lpszPathName,&hDIB,pPalDIB,&bmHeight,&bmWidth);

	return TRUE;
}
