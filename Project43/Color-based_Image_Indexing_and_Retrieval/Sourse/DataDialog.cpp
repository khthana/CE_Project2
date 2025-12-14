// DataDialog.cpp : implementation file
//

#include "stdafx.h"
#include "diblook.h"
#include "DataDialog.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDataDialog dialog


CDataDialog::CDataDialog(CWnd* pParent /*=NULL*/)
	: CDialog(CDataDialog::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDataDialog)
	m_data = _T("");
	//}}AFX_DATA_INIT
}


void CDataDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDataDialog)
	DDX_Text(pDX, IDC_DATA, m_data);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDataDialog, CDialog)
	//{{AFX_MSG_MAP(CDataDialog)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDataDialog message handlers
