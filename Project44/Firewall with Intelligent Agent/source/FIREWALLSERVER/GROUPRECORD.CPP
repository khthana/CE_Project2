// GroupRecord.cpp : implementation file
//

#include "stdafx.h"
#include "firewallserver.h"
#include "GroupRecord.h"
#include "RulesetTab.h"
#include "RuleTab.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CGroupRecord dialog


CGroupRecord::CGroupRecord(CWnd* pParent /*=NULL*/)
	: CDialog(CGroupRecord::IDD, pParent)
{
	//{{AFX_DATA_INIT(CGroupRecord)
	m_groupname = _T("");
	m_group = _T("");
	m_ruleset = _T("");
	//}}AFX_DATA_INIT
}


void CGroupRecord::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CGroupRecord)
	DDX_Control(pDX, IDC_OK, m_bOK);
	DDX_Control(pDX, IDC_UPDATE, m_bUpdate);
	DDX_Control(pDX, IDC_RULETAB, m_bRuletab);
	DDX_Control(pDX, IDC_DELETE, m_bDelete);
	DDX_Control(pDX, IDC_ADD, m_bAdd);
	DDX_Text(pDX, IDC_GPNAME, m_groupname);
	DDX_Text(pDX, IDC_GROUP, m_group);
	DDX_Text(pDX, IDC_RULELIST, m_ruleset);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CGroupRecord, CDialog)
	//{{AFX_MSG_MAP(CGroupRecord)
	ON_BN_CLICKED(IDC_ADD, OnAdd)
	ON_BN_CLICKED(IDC_DELETE, OnDelete)
	ON_BN_CLICKED(IDC_RULETAB, OnRuletab)
	ON_BN_CLICKED(IDC_UPDATE, OnUpdate)
	ON_BN_CLICKED(IDC_OK, OnOk)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CGroupRecord message handlers

BOOL CGroupRecord::OnInitDialog() 
{
	CDialog::OnInitDialog();
	CString buffer;
	if (gpname.GetLength()>0)
	{
	m_group = gp;
	m_groupname = gpname;
	buffer.Format("SELECT [Rule] FROM [RuleSet] WHERE [Group]="+gp);

	rs.m_pDatabase = &(theApp.m_db);
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
	m_ruleset = allrule;
	rs.Close();
	}
	UpdateData(FALSE);
	
	return TRUE;  
}

/* Add New Group */
void CGroupRecord::OnAdd() 
{
	CString temp;
	UpdateData(TRUE);
	
	CString buffer;
	buffer.Format("INSERT INTO SetType ([Group],Type) VALUES ("+m_group+",'"+m_groupname+"')");	
	theApp.m_db.ExecuteSQL(buffer);

    m_ruleset = m_ruleset+" ";
	CString str=" ";
	int stpos = 0;
	int enpos,length;

    while (str!="")
	{
        length = m_ruleset.GetLength();
		enpos = m_ruleset.Find(" ") ;
		str = m_ruleset ;
		m_ruleset.Delete(stpos,enpos-stpos+1);
		str.Delete(enpos,length-enpos);
		if (str=="") { break;}
		else
		{
		buffer.Format("INSERT INTO RuleSet ([Group],[Rule]) VALUES ("+m_group+","+str+")");
		theApp.m_db.ExecuteSQL(buffer);
		}
	}
	MessageBox("Insert Completed");	
	UpdateData(FALSE);
	EndDialog(0);
	CRulesetTab rulesetdlg;
	rulesetdlg.DoModal();
}

/* Delete Group */
void CGroupRecord::OnDelete() 
{
	UpdateData(TRUE);
	CString buffer;
	buffer.Format("DELETE FROM RuleSet WHERE [GROUP] = "+m_group);
    theApp.m_db.ExecuteSQL(buffer);
	buffer.Format("DELETE FROM SetType WHERE [GROUP] = "+m_group);
	theApp.m_db.ExecuteSQL(buffer);
	MessageBox("Group"+m_group+" has been deleted");
	EndDialog(0);
	CRulesetTab rulesetdlg;
	rulesetdlg.DoModal();
	
}

/* Update Group detail */
void CGroupRecord::OnUpdate() 
{
	UpdateData(TRUE);

	CString buffer;
	buffer.Format("DELETE FROM RuleSet WHERE [GROUP] = "+m_group);
    theApp.m_db.ExecuteSQL(buffer);
	buffer.Format("DELETE FROM SetType WHERE [GROUP] = "+m_group);
	theApp.m_db.ExecuteSQL(buffer);


	buffer.Format("INSERT INTO SetType ([Group],Type) VALUES ("+m_group+",'"+m_groupname+"')");	
	theApp.m_db.ExecuteSQL(buffer);

    m_ruleset = m_ruleset+" ";
	CString str=" ";
	int stpos = 0;
	int enpos,length;

    while (str!="")
	{
        length = m_ruleset.GetLength();
		enpos = m_ruleset.Find(" ") ;
		str = m_ruleset ;
		m_ruleset.Delete(stpos,enpos-stpos+1);
		str.Delete(enpos,length-enpos);
		if (str=="") { break;}
		else
		{
		buffer.Format("INSERT INTO RuleSet ([Group],[Rule]) VALUES ("+m_group+","+str+")");
		theApp.m_db.ExecuteSQL(buffer);
		}
	
	}
	
	MessageBox("Update Complete");
	EndDialog(0);
	CRulesetTab rulesetdlg;
	rulesetdlg.DoModal();
	
}

/* Get m_row from RulesetTab class 
   m_row is GroupNo + GroupType */
void CGroupRecord::getgroup(CString m_row)
{
	int enpos=0;
	enpos = m_row.Find(" ");
	gp = m_row;
	gpname = m_row;                         
	gp.Delete(enpos,m_row.GetLength()-1);   // Group No
	gpname.Delete(0,enpos+14);              // Group Type
	
}
/* Click "Rule Table" button will appear Rule Table Dialog(IDD_RULETAB)  */
void CGroupRecord::OnRuletab() 
{
	CRuleTab ruledlg;
	ruledlg.DoModal();
	
}

/* Click "OK" button "Group Record" Dialog will disappear */
void CGroupRecord::OnOk() 
{
	EndDialog(0);
	CRulesetTab rulesetdlg;
	rulesetdlg.DoModal();
	
}
