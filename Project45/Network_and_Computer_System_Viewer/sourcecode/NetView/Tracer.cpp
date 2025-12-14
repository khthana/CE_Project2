// Tracer.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "Tracer.h"
#include "Redirect.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTracer dialog


CTracer::CTracer(CWnd* pParent /*=NULL*/)
	: CDialog(CTracer::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTracer)
	m_Ip = _T("");
	//}}AFX_DATA_INIT
}


void CTracer::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTracer)
	DDX_Control(pDX, IDC_EDIT2, m_Output);
	DDX_Text(pDX, IDC_EDIT1, m_Ip);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CTracer, CDialog)
	//{{AFX_MSG_MAP(CTracer)
	ON_BN_CLICKED(IDC_BUTTON1, OnTrace)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTracer message handlers

void CTracer::OnTrace() 
{
	// TODO: Add your control notification handler code here
		UpdateData(TRUE);
	CString command = ".\\bin\\tracer\\tracer ";
	if (m_Ip != "") {
	command = command + m_Ip;
	CRedirect Redirect(command, &m_Output);
	Redirect.Run();
	Redirect.Stop();
	}
}
