// QuickShow.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "Redirect.h"
#include "QuickShow.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CString QuickCommand;
/////////////////////////////////////////////////////////////////////////////
// CQuickShow dialog


CQuickShow::CQuickShow(CWnd* pParent /*=NULL*/)
	: CDialog(CQuickShow::IDD, pParent)
{
	//{{AFX_DATA_INIT(CQuickShow)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CQuickShow::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CQuickShow)
	DDX_Control(pDX, IDC_EDIT1, m_Output);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CQuickShow, CDialog)
	//{{AFX_MSG_MAP(CQuickShow)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CQuickShow message handlers

void CQuickShow::DoCommand(CString ThisIP)
{
		if (QuickCommand != "") {
		int whereAdd = QuickCommand.Replace("@a@",ThisIP);
		CRedirect Redirect(QuickCommand, &m_Output);
		Redirect.Run();
		Redirect.Stop();
		}
}
