// LimitDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Basic.h"
#include "LimitDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLimitDlg dialog


CLimitDlg::CLimitDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CLimitDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLimitDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CLimitDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLimitDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CLimitDlg, CDialog)
	//{{AFX_MSG_MAP(CLimitDlg)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLimitDlg message handlers
