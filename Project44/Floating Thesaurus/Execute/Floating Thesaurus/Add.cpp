// Add.cpp : implementation file
//

#include "stdafx.h"
#include "Dict.h"
#include "Add.h"	// For Add Record Method

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAdd dialog


CAdd::CAdd(CWnd* pParent /*=NULL*/)
	: CDialog(CAdd::IDD, pParent)
{
	//{{AFX_DATA_INIT(CAdd)
	m_addvocab = _T("");
	m_addeadj = _T("");
	m_addeadv = _T("");
	m_addenoun = _T("");
	m_addeprep = _T("");
	m_addeverb = _T("");
	m_addtadj = _T("");
	m_addtadv = _T("");
	m_addtnoun = _T("");
	m_addtprep = _T("");
	m_addtverb = _T("");
	m_addeconj = _T("");
	m_addeint = _T("");
	m_addepron = _T("");
	m_addtconj = _T("");
	m_addtint = _T("");
	m_addtpron = _T("");
	//}}AFX_DATA_INIT
}


void CAdd::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAdd)
	DDX_Text(pDX, IDC_ADDVOCAB, m_addvocab);
	DDX_Text(pDX, IDC_ADDEADJ, m_addeadj);
	DDX_Text(pDX, IDC_ADDEADV, m_addeadv);
	DDX_Text(pDX, IDC_ADDENOUN, m_addenoun);
	DDX_Text(pDX, IDC_ADDEPREP, m_addeprep);
	DDX_Text(pDX, IDC_ADDEVERB, m_addeverb);
	DDX_Text(pDX, IDC_ADDTADJ, m_addtadj);
	DDX_Text(pDX, IDC_ADDTADV, m_addtadv);
	DDX_Text(pDX, IDC_ADDTNOUN, m_addtnoun);
	DDX_Text(pDX, IDC_ADDTPREP, m_addtprep);
	DDX_Text(pDX, IDC_ADDTVERB, m_addtverb);
	DDX_Text(pDX, IDC_ADDECONJ, m_addeconj);
	DDX_Text(pDX, IDC_ADDEINT, m_addeint);
	DDX_Text(pDX, IDC_ADDEPRON, m_addepron);
	DDX_Text(pDX, IDC_ADDTCONJ, m_addtconj);
	DDX_Text(pDX, IDC_ADDTINT, m_addtint);
	DDX_Text(pDX, IDC_ADDTPRON, m_addtpron);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CAdd, CDialog)
	//{{AFX_MSG_MAP(CAdd)
	ON_BN_CLICKED(IDADDOK, OnAddok)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CAdd message handlers

void CAdd::OnAddok() 
{
	UpdateData(TRUE);
	CDialog::OnOK();
	
}
