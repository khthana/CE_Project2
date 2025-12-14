// NewClient.cpp : implementation file
//

#include "stdafx.h"
#include "firewallserver.h"
#include "NewClient.h"
#include "RulesetTab.h"
#include "DBpartDlg.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CNewClient dialog


CNewClient::CNewClient(CWnd* pParent /*=NULL*/)
	: CDialog(CNewClient::IDD, pParent)
{
	//{{AFX_DATA_INIT(CNewClient)
	m_group = _T("");
	m_ipaddr = _T("");
	//}}AFX_DATA_INIT
}


void CNewClient::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CNewClient)
	DDX_Control(pDX, IDC_CANCEL, m_bCancel);
	DDX_Control(pDX, IDC_OK, m_bOK);
	DDX_Control(pDX, IDC_DETAIL, m_bDetail);
	DDX_Text(pDX, IDC_GROUP, m_group);
	DDX_Text(pDX, IDC_IPADDR, m_ipaddr);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CNewClient, CDialog)
	//{{AFX_MSG_MAP(CNewClient)
	ON_BN_CLICKED(IDC_DETAIL, OnDetail)
	ON_BN_CLICKED(IDC_OK, OnOk)
	ON_BN_CLICKED(IDC_CANCEL, OnCancel)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CNewClient message handlers

void CNewClient::OnDetail() 
{
	CRulesetTab rulesetdlg;
	rulesetdlg.DoModal();
	
}

BOOL CNewClient::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
    	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CNewClient::OnOk() 
{
	UpdateData(TRUE);
	CString buffer;
	buffer.Format("INSERT INTO Client (ClientIP,[Group]) VALUES ('"+m_ipaddr+"',"+m_group+")");
    theApp.m_db.ExecuteSQL(buffer);
	MessageBox("Insert Completed");
	EndDialog(0);
	CDBpartDlg dbdlg;
	dbdlg.DoModal();
	
}

void CNewClient::OnCancel() 
{
	EndDialog(0);
	CDBpartDlg dbdlg;
	dbdlg.DoModal();
	
}
