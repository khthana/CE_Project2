// ValidDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Signature.h"
#include "ValidDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CValidDlg dialog


CValidDlg::CValidDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CValidDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CValidDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CValidDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CValidDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CValidDlg, CDialog)
	//{{AFX_MSG_MAP(CValidDlg)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CValidDlg message handlers
