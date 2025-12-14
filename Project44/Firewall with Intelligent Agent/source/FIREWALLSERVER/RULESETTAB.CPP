// RulesetTab.cpp : implementation file
//

#include "stdafx.h"
#include "firewallserver.h"
#include "RulesetTab.h"
#include "DBpartDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRulesetTab dialog


CRulesetTab::CRulesetTab(CWnd* pParent /*=NULL*/)
	: CDialog(CRulesetTab::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRulesetTab)
	m_group = _T("");
	//}}AFX_DATA_INIT
	m_pGroupRecord = new CGroupRecord();
}


void CRulesetTab::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRulesetTab)
	DDX_Control(pDX, IDC_OK, m_bOK);
	DDX_Control(pDX, IDC_NEWGROUP, m_bNew);
	DDX_Control(pDX, IDC_LISTRE, m_rulelist);
	DDX_Control(pDX, IDC_LISTGP, m_grouplist);
	DDX_LBString(pDX, IDC_LISTGP, m_group);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CRulesetTab, CDialog)
	//{{AFX_MSG_MAP(CRulesetTab)
	ON_LBN_DBLCLK(IDC_LISTGP, OnDblclkListgp)
	ON_BN_CLICKED(IDC_NEWGROUP, OnNewgroup)
	ON_BN_CLICKED(IDC_OK, OnOk)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRulesetTab message handlers

BOOL CRulesetTab::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	CString buffer;
	CString m_gp;                             // GroupNo
	CString m_type;							  // GroupType
	CString getgroup="";                      // GroupNo + GroupType (just only one row)
	CString groupno="";                       // List of GroupNo
	buffer.Format("SELECT * FROM [SetType]"); // Get GroupNo. , GroupType (which is the comment 
	                                          // for group ex.. group1 is used for blocking telnet)
    rs.m_pDatabase = &(theApp.m_db);
	rs.Open(CRecordset::forwardOnly,buffer);
	int i=0;
	while(i<rs.GetRecordCount())
	{
	  rs.GetFieldValue("Group",m_gp);
	  rs.GetFieldValue("Type",m_type);
	  getgroup = m_gp+"              "+m_type;
	  groupno = groupno+m_gp+" ";
	  m_grouplist.AddString(getgroup);        // Display getgroup(GroupNo+GroupType) in ListBox
	  rs.MoveNext();
	  i++;
	} 
	rs.Close();


	CString no="";							  // Get only one GroupNo from list of GroupNo to get Rule of that group
	int enpos;                                // Get position of Blank
	
    for(int k=1;k<=i;k++)
	{

	no = groupno;							  
	enpos = groupno.Find(" ");
	no.Delete(enpos,groupno.GetLength()-1);
	groupno.Delete(0,enpos+1);
	
	buffer.Format("SELECT [Rule] FROM [RuleSet] WHERE [GROUP]="+no);
	rs.Open(CRecordset::forwardOnly,buffer);
	

	CString allrule="";
	int j=0;
	while(j<rs.GetRecordCount())
	{
		CString rule;
		rs.GetFieldValue("Rule",rule);
		allrule=allrule+rule+" ";
		rs.MoveNext();
		j++;
	}
	m_rulelist.AddString(allrule);					// Display only RuleNo of that Group
	rs.Close();
	}

	UpdateData(FALSE);
	return TRUE;  
}
/* Double Click on GroupNo will appear GroupRecord Dialog(IDD_GROUPRECORD)
   to add , update , delete Group Rule*/
void CRulesetTab::OnDblclkListgp() 
{
	int position=m_grouplist.GetCurSel();
	UpdateData(TRUE);
	m_grouplist.GetText(position,m_row);
    EndDialog(0);
	m_pGroupRecord->getgroup(m_row);                // m_row is GroupNo + GroupType
	m_pGroupRecord->DoModal();
	
}

/* Click "New Group" button will appear Blank Group Record Dialog to add new Group */ 
void CRulesetTab::OnNewgroup() 
{   
	EndDialog(0);
    CGroupRecord gprecdlg;
    gprecdlg.DoModal();
}

/* Click "OK" button Dialog will disappear */
void CRulesetTab::OnOk() 
{
	EndDialog(0);
}
