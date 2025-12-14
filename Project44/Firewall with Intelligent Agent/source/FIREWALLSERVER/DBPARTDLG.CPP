// DBpartDlg.cpp : implementation file
//

#include "stdafx.h"
#include "firewallserver.h"
#include "DBpartDlg.h"
#include "RuleTab.h"
#include "RulesetTab.h"
#include "NewClient.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDBpartDlg dialog


CDBpartDlg::CDBpartDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDBpartDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDBpartDlg)
	//}}AFX_DATA_INIT
	m_pDBconnect = new CDBconnect();
	m_pClientInfo = new CClientInfo();
}


void CDBpartDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDBpartDlg)
	DDX_Control(pDX, IDC_OK, m_bOK);
	DDX_Control(pDX, IDC_SENDRULE, m_bSent);
	DDX_Control(pDX, IDC_STOPFILTER, m_bStop);
	DDX_Control(pDX, IDC_RULETAB, m_ruletable);
	DDX_Control(pDX, IDC_REMOVECLIENT, m_bRemove);
	DDX_Control(pDX, IDC_NEWCLIENT, m_bNew);
	DDX_Control(pDX, IDC_GROUPTAB, m_grouptable);
	DDX_Control(pDX, IDC_CLIENTLIST, m_Client);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDBpartDlg, CDialog)
	//{{AFX_MSG_MAP(CDBpartDlg)
	ON_NOTIFY(NM_CLICK, IDC_CLIENTLIST, OnClickClientlist)
	ON_NOTIFY(NM_DBLCLK, IDC_CLIENTLIST, OnDblclkClientlist)
	ON_BN_CLICKED(IDC_GROUPTAB, OnGrouptab)
	ON_BN_CLICKED(IDC_NEWCLIENT, OnNewclient)
	ON_BN_CLICKED(IDC_REMOVECLIENT, OnRemoveclient)
	ON_BN_CLICKED(IDC_RULETAB, OnRuletab)
	ON_BN_CLICKED(IDC_SENDRULE, OnSendrule)
	ON_BN_CLICKED(IDC_STOPFILTER, OnStopfilter)
	ON_BN_CLICKED(IDC_OK, OnOk)
	ON_BN_CLICKED(IDC_GET_LOG, OnGetLog)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDBpartDlg message handlers
/* Main Dialog */
BOOL CDBpartDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	CString all_ip;                  // all_ip is the list of client ipaddr ; get via DBconnect::GetClientList
	CString tempi;					 // tempi is used for get amount of Client in the network by quering from Database
	int i;							 // number of Client in the network
	int enpos;                       // find the position of blank 
	all_ip = m_pDBconnect->GetClientList();
	enpos = all_ip.Find(" ");
	tempi = all_ip;
	all_ip.Delete(0,enpos+1);
	tempi.Delete(enpos,all_ip.GetLength()+1);
	i = atoi(tempi);           

	/* Display Client in ListControl */
	LV_ITEM item;
	CImageList *imgnormal;
	imgnormal = new CImageList();
	imgnormal->Create(32,32,ILC_MASK,2,0);
	imgnormal->Add(AfxGetApp()->LoadIcon(IDI_ONLINE));    // blue icon : Client is online
	imgnormal->Add(AfxGetApp()->LoadIcon(IDI_OFFLINE));   // gray icon : Client is offline (haven't taken an effect now)

	m_Client.SetImageList(imgnormal,LVSIL_NORMAL);
	
	int n=0;
	int length;
	int stpos=0;
	while (n<i)
	{
					
	char x[15];						 // ipaddress of Client 				
   	item.mask=LVIF_TEXT|LVIF_IMAGE;
	item.iItem=n;
	item.iSubItem=0;
	item.iImage=0;

	CString str;					 // str is used for getting each ip from all_ip
	str = all_ip ;
	enpos = all_ip.Find(" ") ;
	int enpos1=enpos;
	int enpos2=enpos+1;
    length = all_ip.GetLength();
	while ((enpos2==enpos1+1) && (enpos2 < length))
	{  
		enpos1=enpos2;
		enpos2=str.Find(" ",enpos2+1);
	}
	
	all_ip.Delete(stpos,enpos1+1);
	str.Delete(enpos1,length-enpos1);
	strcpy(x,str);
	item.pszText=x;
	m_Client.InsertItem(&item);
	n++;
	}
	
	return TRUE;  
}

/* Get pszText ( ClientIP ) when click on the icon */
void CDBpartDlg::OnClickClientlist(NMHDR* pNMHDR, LRESULT* pResult) 
{
	int count=m_Client.GetSelectionMark();
	ipsending = m_Client.GetItemText(count,0);
	*pResult = 0;
}

/* Get pszText ( ClientIP ) when double click on the icon 
   then send the ip to ClientInfo to query the rule for that ip
   and display the dialog "Client Infomation"(IDD_CLIENTINFO) */
void CDBpartDlg::OnDblclkClientlist(NMHDR* pNMHDR, LRESULT* pResult) 
{
	int count=m_Client.GetSelectionMark();
	ip = m_Client.GetItemText(count,0);
	m_pClientInfo->GetIPAddr(ip);
	m_pClientInfo->DoModal();
	*pResult = 0;
}

/* Click "Group Table" button to display "Group Table" Dialog(IDD_RULESETTAB) */
void CDBpartDlg::OnGrouptab() 
{
	CRulesetTab rulesetdlg;
	rulesetdlg.DoModal();
	
}

/* Click "Rule Table" button to display "Rule Table" Dialog(IDD_RULETAB) */
void CDBpartDlg::OnRuletab() 
{
	CRuleTab ruledlg;
	ruledlg.DoModal();

	
}

/* Click "Start Filter" button to send ruleset to agent 
   (by using DBconnect)*/
void CDBpartDlg::OnSendrule() 
{
	
	m_pDBconnect->SendRule(ipsending);
	
	
}

/* Click "Stop Filter" button to stop agent not to work */
void CDBpartDlg::OnStopfilter() 
{
	
   theApp.StopFilter(ipsending);
	
}

/* Click " NewClient" button to Add new Client 
   "New Client" dialog(IDD_NEWCLIENT) will appear */
void CDBpartDlg::OnNewclient() 
{
	EndDialog(0);
	CNewClient newdlg;
	newdlg.DoModal();
}

/* Click "Remove Client" button to remove Client */ 
void CDBpartDlg::OnRemoveclient() 
{
	UpdateData(TRUE);
	m_pDBconnect->RemoveIP(ipsending);
	EndDialog(0);
	CDBpartDlg dbdlg;
	dbdlg.DoModal();
}

/* Click "Exit" to end the program */
void CDBpartDlg::OnOk() 
{
    EndDialog(0);	
}

/* This function still cannot work properly */
void CDBpartDlg::OnGetLog() 
{
	theApp.SendLogRequest(ipsending);
	
}
