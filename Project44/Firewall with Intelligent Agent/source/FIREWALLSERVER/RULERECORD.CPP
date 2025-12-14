// RuleRecord.cpp : implementation file
//

#include "stdafx.h"
#include "firewallserver.h"
#include "RuleRecord.h"
#include "RuleTab.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRuleRecord dialog


CRuleRecord::CRuleRecord(CWnd* pParent /*=NULL*/)
	: CDialog(CRuleRecord::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRuleRecord)
	m_dprange = _T("");
	m_dstaddr = _T("");
	m_dstmask = _T("");
	m_dstport = _T("");
	m_ptcol = _T("");
	m_rule = _T("");
	m_sprange = _T("");
	m_srcaddr = _T("");
	m_srcmask = _T("");
	m_srcport = _T("");
	//}}AFX_DATA_INIT
}


void CRuleRecord::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRuleRecord)
	DDX_Control(pDX, IDC_UPDATE, m_bUpdate);
	DDX_Control(pDX, IDC_OK, m_bOK);
	DDX_Control(pDX, IDC_DELETE, m_bDel);
	DDX_Control(pDX, IDC_ADD, m_bAdd);
	DDX_Text(pDX, IDC_DPRANGE, m_dprange);
	DDX_Text(pDX, IDC_DSTADDR, m_dstaddr);
	DDX_Text(pDX, IDC_DSTMASK, m_dstmask);
	DDX_Text(pDX, IDC_DSTPORT, m_dstport);
	DDX_Text(pDX, IDC_PTCOL, m_ptcol);
	DDX_Text(pDX, IDC_RULE, m_rule);
	DDX_Text(pDX, IDC_SPRANGE, m_sprange);
	DDX_Text(pDX, IDC_SRCADDR, m_srcaddr);
	DDX_Text(pDX, IDC_SRCMASK, m_srcmask);
	DDX_Text(pDX, IDC_SRCPORT, m_srcport);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CRuleRecord, CDialog)
	//{{AFX_MSG_MAP(CRuleRecord)
	ON_BN_CLICKED(IDC_ADD, OnAdd)
	ON_BN_CLICKED(IDC_DELETE, OnDelete)
	ON_BN_CLICKED(IDC_OK, OnOk)
	ON_BN_CLICKED(IDC_UPDATE, OnUpdate)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRuleRecord message handlers

/* Add new Rule */ 
void CRuleRecord::OnAdd() 
{
	UpdateData(TRUE);
	CString buffer;
	buffer.Format("INSERT INTO [Rule] ([Rule],SrcAddr,SrcMask,SrcPort,SPRange,DstAddr,DstMask,DstPort,DPRange,Ptcol) VALUES ("+m_rule+",'"+m_srcaddr+"','"+m_srcmask+"','"+m_srcport+"','"+m_sprange+"','"+m_dstaddr+"','"+m_dstmask+"','"+m_dstport+"','"+m_dprange+"','"+m_ptcol+"')");
	theApp.m_db.ExecuteSQL(buffer);
	MessageBox("Insert Completed");
	EndDialog(0);
	CRuleTab ruledlg;
	ruledlg.DoModal();
}

/* Delete Existing Rule */
void CRuleRecord::OnDelete() 
{
    UpdateData(TRUE);
	CString buffer;
	buffer.Format("DELETE FROM [Rule] WHERE [Rule]="+m_rule);
    theApp.m_db.ExecuteSQL(buffer);
	MessageBox(m_rule+" has been deleted");
	EndDialog(0);
	CRuleTab ruledlg;
	ruledlg.DoModal();
}

/* Update Rule when some fields have changed */
void CRuleRecord::OnUpdate() 
{
	UpdateData(TRUE);
	CString buffer;
	buffer.Format("UPDATE [Rule] SET SrcAddr='"+m_srcaddr+"',SrcMask='"+m_srcmask+"',SrcPort='"+m_srcport+"',SPRange='"+m_sprange+"',DstAddr='"+m_dstaddr+"',DstMask='"+m_dstmask+"',DstPort='"+m_dstport+"',DPRange='"+m_dprange+"',Ptcol='"+m_ptcol+"' WHERE [Rule]="+m_rule);
    theApp.m_db.ExecuteSQL(buffer);
	MessageBox("Update Complete");
}

/* Get Rule detail in one row from RuleTab Dialog */
void CRuleRecord::GetRule(CString m_row)
{
	m_rulerow = m_row;
	
}

BOOL CRuleRecord::OnInitDialog() 
{
	CDialog::OnInitDialog();

	/* Cut space in m_rulerow & Put each field in new variable that can be displayed on Dialog*/
    int choice=1;
	int length=0;;
	CString str;
	int enpos,enpos1,enpos2;
	int stpos=0;

	if(m_rulerow.GetLength()>0)
	{
	while(choice<=10)
	{
	str = m_rulerow ;
	enpos = m_rulerow.Find(" ") ;
	enpos1=enpos;
	enpos2=enpos+1;
    length = m_rulerow.GetLength();
	while ((enpos2==enpos1+1) && (enpos2 < length))
	{  
		enpos1=enpos2;
		enpos2=str.Find(" ",enpos2+1);
	} // end while ((enpos2==enpos1+1) && (enpos2 < length))
	m_rulerow.Delete(stpos,enpos1+1);
	str.Delete(enpos1,length-enpos1);	
	
    switch(choice)
    {
    case 1:  { m_rule=str;       
		       break;
			 }
    case 2:  { m_srcaddr=str;
			   break;
			 }
	case 3:  { m_srcmask=str;
	           break;
			 }
	case 4:  { m_srcport=str;
		       break;
			 }
	case 5:  { m_sprange=str;
		       break;
			 }
	case 6:  { m_dstaddr=str;
			   break;
			 }
	case 7:  { m_dstmask=str;
	           break;
			 }
	case 8:  { m_dstport=str;
		       break;
			 }
	case 9:  { m_dprange=str;
		       break;
			 }
	case 10: { m_ptcol=str;
		       break;
			 }
	default: break;
	} // end switch
	choice++;
	} // end while(choice<=10)
	} // end if
	UpdateData(FALSE);
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

/* Click "Cancel" button to cancel & Dialog will disappear */
void CRuleRecord::OnOk() 
{   
	EndDialog(0);
	CRuleTab ruledlg;
	ruledlg.DoModal();
	
}
