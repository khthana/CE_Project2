// InvalidDlg1.cpp : implementation file
//

#include "stdafx.h"
#include "Signature.h"
#include "InvalidDlg1.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CInvalidDlg dialog


CInvalidDlg::CInvalidDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CInvalidDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CInvalidDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CInvalidDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CInvalidDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CInvalidDlg, CDialog)
	//{{AFX_MSG_MAP(CInvalidDlg)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CInvalidDlg message handlers
