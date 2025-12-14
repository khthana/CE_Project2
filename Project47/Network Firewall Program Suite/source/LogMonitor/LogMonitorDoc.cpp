// LogMonitorDoc.cpp : implementation of the CLogMonitorDoc class
//

#include "stdafx.h"
#include "LogMonitor.h"

#include "LogMonitorSet.h"
#include "LogMonitorDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLogMonitorDoc

IMPLEMENT_DYNCREATE(CLogMonitorDoc, CDocument)

BEGIN_MESSAGE_MAP(CLogMonitorDoc, CDocument)
	//{{AFX_MSG_MAP(CLogMonitorDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLogMonitorDoc construction/destruction

CLogMonitorDoc::CLogMonitorDoc()
{
	// TODO: add one-time construction code here

}

CLogMonitorDoc::~CLogMonitorDoc()
{
}

BOOL CLogMonitorDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CLogMonitorDoc diagnostics

#ifdef _DEBUG
void CLogMonitorDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CLogMonitorDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CLogMonitorDoc commands
