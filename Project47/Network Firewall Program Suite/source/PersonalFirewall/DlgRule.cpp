// DlgRule.cpp : implementation file
//

#include "stdafx.h"
#include "PersonalFirewall.h"
#include "DlgRule.h"

#include "sockUtil.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgRule dialog


CDlgRule::CDlgRule(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgRule::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgRule)
	m_sHostAddress = _T("");
	m_sNumberOfGroupRule = _T("");
	//}}AFX_DATA_INIT
}


void CDlgRule::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgRule)
	DDX_Control(pDX, IDC_LIST_RULE, m_cListRule);
	DDX_Text(pDX, IDC_STATIC_HOST_IP, m_sHostAddress);
	DDX_Text(pDX, IDC_STATIC_NUMBER_OF_GROUP_RULE, m_sNumberOfGroupRule);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgRule, CDialog)
	//{{AFX_MSG_MAP(CDlgRule)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgRule message handlers
BOOL CDlgRule::OnInitDialog()
{
	CDialog::OnInitDialog();

// Add Column to list Control server rule
	m_cListRule.InsertColumn(0, "Source Address",LVCFMT_LEFT , 93, 0);
	m_cListRule.InsertColumn(1, "Source Mask",LVCFMT_LEFT , 93, 1);
	m_cListRule.InsertColumn(2, "Source Port",LVCFMT_LEFT ,81, 2);
	m_cListRule.InsertColumn(3, "Dest. Address",LVCFMT_LEFT , 93, 3);
	m_cListRule.InsertColumn(4, "Dest. Mask",LVCFMT_LEFT , 93, 4);
	m_cListRule.InsertColumn(5, "Dest. Port",LVCFMT_LEFT , 81, 5);
	m_cListRule.InsertColumn(6, "Protocol",LVCFMT_LEFT ,51, 6);
	m_cListRule.InsertColumn(7, "Action",LVCFMT_LEFT , 50, 7);

	m_cListRule.SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_GRIDLINES);

	COLORREF crBkColor = ::GetSysColor(COLOR_3DFACE);
	m_cListRule.SetBkColor(crBkColor);

// create new object
	ruleGroup = new CRuleManage();

	m_sHostAddress = " " + ruleGroup->GetClientIP();

	UpdateData(FALSE);

	return TRUE;  // return TRUE  unless you set the focus to a control
}
void CDlgRule::UpdateGroupRuleList()
{
	// Update list control
	m_cListRule.DeleteAllItems();

	unsigned int i;
	for( i = 0;i < ruleGroup->nRules ; i++)
	{
		AddGroupRuleToList(ruleGroup->rules[i].sourceIp,
					  ruleGroup->rules[i].sourceMask,
					  ruleGroup->rules[i].sourcePort,
					  ruleGroup->rules[i].destinationIp,
					  ruleGroup->rules[i].destinationMask,
					  ruleGroup->rules[i].destinationPort,
					  ruleGroup->rules[i].protocol,
					  ruleGroup->rules[i].action);
	}

	m_sNumberOfGroupRule.Format(" %d",ruleGroup->nRules);
	UpdateData(FALSE);
}

void CDlgRule::AddGroupRuleToList(unsigned long srcIp, 
									 unsigned long srcMask,
									 unsigned short srcPort, 
									 unsigned long dstIp, 
									 unsigned long dstMask,
									 unsigned short dstPort, 
									 unsigned int protocol, 
									 int action)
{
	char ip[16];
	char port[6];
	LVITEM it;
	int pos;

	
	it.mask		= LVIF_TEXT;
	it.iItem	= m_cListRule.GetItemCount();
	it.iSubItem	= 0;
	it.pszText	= (srcIp == 0) ? "All" : IpToString(ip, srcIp);
	pos			= m_cListRule.InsertItem(&it);

	it.iItem	= pos;
	it.iSubItem	= 1;
	it.pszText	= IpToString(ip, srcMask);
	m_cListRule.SetItem(&it);

	it.iItem	= pos;
	it.iSubItem	= 2;

	if(protocol != ICMP_PROTOCOL)
		it.pszText	= (srcPort == 0) ? "All" : itoa(srcPort, port, 10);

	else
		it.pszText	= (srcPort == 255) ? "All" : itoa(srcPort, port, 10);

	m_cListRule.SetItem(&it);
	
	it.iItem	= pos;
	it.iSubItem	= 3;
	it.pszText	= (dstIp == 0) ? "All" : IpToString(ip, dstIp);
	m_cListRule.SetItem(&it);

	it.iItem	= pos;
	it.iSubItem	= 4;
	it.pszText	= IpToString(ip, dstMask);
	m_cListRule.SetItem(&it);

	it.iItem	= pos;
	it.iSubItem = 5;

	if(protocol != ICMP_PROTOCOL)
		it.pszText	= (dstPort == 0) ? "All" : itoa(dstPort, port, 10);

	else
		it.pszText	= (dstPort == 255) ? "All" : itoa(dstPort, port, 10);

	m_cListRule.SetItem(&it);


	it.iItem	= pos;
	it.iSubItem	= 6;

	if(protocol == 1)
		it.pszText = "ICMP";

	else if(protocol == 6)
		it.pszText = "TCP";

	else if(protocol == 17)
		it.pszText = "UDP";

	else
		it.pszText = "All";

	m_cListRule.SetItem(&it);


	it.iItem	= pos;
	it.iSubItem	= 7;
	it.pszText = action ? "Deny" : "Allow";
	m_cListRule.SetItem(&it);

}
