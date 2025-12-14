// UpdateBox.cpp : implementation file
//

#include "stdafx.h"
#include "Dict.h"
#include "UpdateBox.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CUpdateBox dialog


CUpdateBox::CUpdateBox(CWnd* pParent /*=NULL*/)
	: CDialog(CUpdateBox::IDD, pParent)
{
	//{{AFX_DATA_INIT(CUpdateBox)
	m_editvocab = _T("");
	//}}AFX_DATA_INIT
}


void CUpdateBox::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CUpdateBox)
	DDX_Text(pDX, IDC_EDIT_VOCAB, m_editvocab);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CUpdateBox, CDialog)
	//{{AFX_MSG_MAP(CUpdateBox)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CUpdateBox message handlers
