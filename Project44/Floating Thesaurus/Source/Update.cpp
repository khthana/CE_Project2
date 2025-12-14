// Update.cpp : implementation file
//

#include "stdafx.h"
#include "Dict.h"
#include "Update.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CUpdate dialog


CUpdate::CUpdate(CWnd* pParent /*=NULL*/)
	: CDialog(CUpdate::IDD, pParent)
{
	//{{AFX_DATA_INIT(CUpdate)
	m_upadj = _T("");
	m_upvocab = _T("");
	m_upeadv = _T("");
	m_upeadj = _T("");
	m_upenoun = _T("");
	m_upeprep = _T("");
	m_upeverb = _T("");
	m_uptadj = _T("");
	m_uptadv = _T("");
	m_uptnoun = _T("");
	m_uptprep = _T("");
	m_uptverb = _T("");
	m_upeconj = _T("");
	m_upeint = _T("");
	m_upepron = _T("");
	m_uptconj = _T("");
	m_uptint = _T("");
	m_uptpron = _T("");
	//}}AFX_DATA_INIT
}


void CUpdate::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CUpdate)
	DDX_Text(pDX, IDC_UPADJ, m_upadj);
	DDX_Text(pDX, IDC_UPVOCAB, m_upvocab);
	DDX_Text(pDX, IDC_UPEADV, m_upeadv);
	DDX_Text(pDX, IDC_UPEADJ, m_upeadj);
	DDX_Text(pDX, IDC_UPENOUN, m_upenoun);
	DDX_Text(pDX, IDC_UPEPREP, m_upeprep);
	DDX_Text(pDX, IDC_UPEVERB, m_upeverb);
	DDX_Text(pDX, IDC_UPTADJ, m_uptadj);
	DDX_Text(pDX, IDC_UPTADV, m_uptadv);
	DDX_Text(pDX, IDC_UPTNOUN, m_uptnoun);
	DDX_Text(pDX, IDC_UPTPREP, m_uptprep);
	DDX_Text(pDX, IDC_UPTVERB, m_uptverb);
	DDX_Text(pDX, IDC_UPECONJ, m_upeconj);
	DDX_Text(pDX, IDC_UPEINT, m_upeint);
	DDX_Text(pDX, IDC_UPEPRON, m_upepron);
	DDX_Text(pDX, IDC_UPTCONJ, m_uptconj);
	DDX_Text(pDX, IDC_UPTINT, m_uptint);
	DDX_Text(pDX, IDC_UPTPRON, m_uptpron);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CUpdate, CDialog)
	//{{AFX_MSG_MAP(CUpdate)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CUpdate message handlers
