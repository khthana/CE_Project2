// FirewallManagerDlg.cpp : implementation file
//

#include "stdafx.h"
#include "FirewallManager.h"
#include "FirewallManagerDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFirewallManagerDlg dialog

CFirewallManagerDlg::CFirewallManagerDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CFirewallManagerDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CFirewallManagerDlg)
	m_sNumberOfGroup = _T("");
	m_sNumberOfRule = _T("");
	m_sAction = _T("DENY");
	m_sProtocol = _T("ALL");
	m_sDstPort = _T("0");
	m_sSrcPort = _T("0");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);

	iFWGroupNo = 0;
	bEditRule = FALSE;

	sAllowAll = "0.0.0.0 255.255.255.255 0 0.0.0.0 255.255.255.255 0 ALL ALLOW";
	sDenyAll  = "0.0.0.0 255.255.255.255 0 0.0.0.0 255.255.255.255 0 ALL DENY";
}

void CFirewallManagerDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CFirewallManagerDlg)
	DDX_Control(pDX, IDC_IPADDRESS_SRC_MASK, m_cSrcMask);
	DDX_Control(pDX, IDC_IPADDRESS_SRC_ADDR, m_cSrcAddr);
	DDX_Control(pDX, IDC_IPADDRESS_DST_MASK, m_cDstMask);
	DDX_Control(pDX, IDC_IPADDRESS_DST_ADDR, m_cDstAddr);
	DDX_Control(pDX, IDC_LISTCTRL_RULE_OF_GROUP, m_cListRuleOfGroup);
	DDX_Control(pDX, IDC_LISTBOX_GROUP, m_cListGroup);
	DDX_Text(pDX, IDC_STATIC_NUMBER_OF_GROUP, m_sNumberOfGroup);
	DDX_Text(pDX, IDC_STATIC_RULE_OF_GROUP, m_sNumberOfRule);
	DDX_CBString(pDX, IDC_COMBO_ACTION, m_sAction);
	DDX_CBString(pDX, IDC_COMBO_PROTOCOL, m_sProtocol);
	DDX_Text(pDX, IDC_EDIT_DST_PORT, m_sDstPort);
	DDV_MaxChars(pDX, m_sDstPort, 5);
	DDX_Text(pDX, IDC_EDIT_SRC_PORT, m_sSrcPort);
	DDV_MaxChars(pDX, m_sSrcPort, 5);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CFirewallManagerDlg, CDialog)
	//{{AFX_MSG_MAP(CFirewallManagerDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_LBN_SELCHANGE(IDC_LISTBOX_GROUP, OnSelchangeListboxGroup)
	ON_BN_CLICKED(IDC_BUTTON_ADD_RULE, OnButtonAddRule)
	ON_BN_CLICKED(IDC_BUTTON_EDIT_RULE, OnButtonEditRule)
	ON_BN_CLICKED(IDC_BUTTON_DELETE_RULE, OnButtonDeleteRule)
	ON_BN_CLICKED(IDC_BUTTON_DEFAULT_RULE, OnButtonDefaultRule)
	ON_BN_CLICKED(IDC_BUTTON_CLEAR_RULE, OnButtonClearRule)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFirewallManagerDlg message handlers

BOOL CFirewallManagerDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

// Add Column to list Control
	m_cListRuleOfGroup.InsertColumn(0, "Source IP",LVCFMT_LEFT , 93, 0);
	m_cListRuleOfGroup.InsertColumn(1, "Source Mask",LVCFMT_LEFT , 93, 1);
	m_cListRuleOfGroup.InsertColumn(2, "Source Port",LVCFMT_LEFT ,81, 2);
	m_cListRuleOfGroup.InsertColumn(3, "Dest. IP",LVCFMT_LEFT , 93, 3);
	m_cListRuleOfGroup.InsertColumn(4, "Dest. Mask",LVCFMT_LEFT , 93, 4);
	m_cListRuleOfGroup.InsertColumn(5, "Dest. Port",LVCFMT_LEFT , 81, 5);
	m_cListRuleOfGroup.InsertColumn(6, "Protocol",LVCFMT_LEFT ,51, 6);
	m_cListRuleOfGroup.InsertColumn(7, "Action",LVCFMT_LEFT , 50, 7);

	m_cListRuleOfGroup.SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_GRIDLINES);

	COLORREF crBkColor = ::GetSysColor(COLOR_3DFACE);
	m_cListRuleOfGroup.SetBkColor(crBkColor);

// Set initial mask value
	m_cSrcAddr.SetAddress(0,0,0,0);
	m_cDstAddr.SetAddress(0,0,0,0);
	m_cSrcMask.SetAddress(255,255,255,255);
	m_cDstMask.SetAddress(255,255,255,255);

// create new object
	ruleManage = new CRuleManage();

// Get information to variable
	sUserName = GetUser();
	sUserDN = GetUserDN();

///////////////////
	m_cListGroup.ResetContent();

	ADCon.GetList("group",gName,gDistinguishedName);

	iADGroupAll = gName.GetSize();
	iFWGroupAll = gName.GetSize() - 24;

	for(int iCount = 0 ; iCount < iFWGroupAll ;iCount++)
	{
		m_cListGroup.AddString(gName.GetAt(iCount));
	}

	m_cListGroup.SetCurSel(0);
	OnSelchangeListboxGroup();

	m_sNumberOfGroup.Format(" %d",iFWGroupAll);

	UpdateData(FALSE);
	
	sServerAddress = ruleManage->GetClientIP();
	sServerRuleIn = "0.0.0.0 255.255.255.255 0 " + sServerAddress + " 255.255.255.255 0 ALL ALLOW";
	sServerRuleOut = sServerAddress + " 255.255.255.255 0 0.0.0.0 255.255.255.255 0 ALL ALLOW";

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CFirewallManagerDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CFirewallManagerDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CFirewallManagerDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

CString CFirewallManagerDlg::GetUser()
{
	char User[100];
	DWORD Len = sizeof(User);
	GetUserName(User, &Len);
	return User;
}

CString CFirewallManagerDlg::GetUserDN()
{
	CStringArray uDistinguishedName;
	CStringArray uName;
	
	if (ADCon.GetList("user",uName,uDistinguishedName) != TRUE)
	{
		AfxMessageBox("Can't get domain...!!!");
		return " ";
	}

	for(long icount=0 ; icount < uName.GetSize();icount++)
	{
		if(sUserName.Compare(uName.GetAt(icount)) == 0)
			return uDistinguishedName.GetAt(icount);
	}
	return "";
}

void CFirewallManagerDlg::AddRule() 
{
	for( int i = iCountRule - 1; i >= 0; i--)
	{
		BreakLongRule(rmDistinguishedName.GetAt(i));

		int result;
		result = inet_addr(sSrcAddress, &srcIp);
		if(result == -1)
		{
			AfxMessageBox("Invalid source address");
			return;
		}

		result = inet_addr(sSrcMask, &srcMask);
		if(result == -1)
		{
			AfxMessageBox("Invalid source mask");
			return;
		}

		result = inet_addr(sDstAddress, &dstIp);
		if(result == -1)
		{
			AfxMessageBox("Invalid destination address");
			return;
		}
	
		result = inet_addr(sDstMask, &dstMask);
		if(result == -1)
		{
			AfxMessageBox("Invalid destination mask");
			return;
		}	
	
		if(sProtocol == "TCP")
			protocol = 6;
		else if(sProtocol == "UDP")
			protocol = 17;
		else if(sProtocol == "ICMP")
			protocol = 1;
		else
			protocol = 0;

		if(sAction == "")
		{
			AfxMessageBox("Please, fill action field.");
			return;
		}
		else
		{
			if(sAction == "ALLOW")
				iAction = 0;
			else
				iAction = 1;
		}

		srcPort = atoi(sSrcPort);
		dstPort = atoi(sDstPort);

	// check number of rules
		if(ruleManage->nRules < MAX_RULES )
		{
		// Add the rule to the rule lists			
			if(ruleManage->AddRule(	srcIp, 
								srcMask, 
								srcPort, 
								dstIp, 
								dstMask, 
								dstPort, 
								protocol, 
								iAction) != 0)
				AfxMessageBox("Error adding the rule.");
			else
			{
//				AfxMessageBox("Add rule OK");
			}
		}
	}

	if (rmDistinguishedName.GetAt(i+1) == sAllowAll)
	{
		CheckRadioButton(IDC_RADIO_ALLOW_ALL, IDC_RADIO_DENY_ALL, IDC_RADIO_ALLOW_ALL);
	}
	else if (rmDistinguishedName.GetAt(i+1) == sDenyAll)
	{
		CheckRadioButton(IDC_RADIO_ALLOW_ALL, IDC_RADIO_DENY_ALL, IDC_RADIO_DENY_ALL);
	}

}

void CFirewallManagerDlg::UpdateList()
{
	// Update list control
	m_cListRuleOfGroup.DeleteAllItems();

	unsigned int i;
	for( i = 0;i < ruleManage->nRules ; i++)
	{
		AddRuleToList(ruleManage->rules[i].sourceIp,
					  ruleManage->rules[i].sourceMask,
					  ruleManage->rules[i].sourcePort,
					  ruleManage->rules[i].destinationIp,
					  ruleManage->rules[i].destinationMask,
					  ruleManage->rules[i].destinationPort,
					  ruleManage->rules[i].protocol,
					  ruleManage->rules[i].action);
	}

	m_sNumberOfRule.Format(" %d",ruleManage->nRules);
	UpdateData(FALSE);
}

void CFirewallManagerDlg::AddRuleToList(unsigned long srcIp, 
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
	it.iItem	= m_cListRuleOfGroup.GetItemCount();
	it.iSubItem	= 0;
	it.pszText	= (srcIp == 0) ? "All" : IpToString(ip, srcIp);
	pos			= m_cListRuleOfGroup.InsertItem(&it);

	it.iItem	= pos;
	it.iSubItem	= 1;
	it.pszText	= IpToString(ip, srcMask);
	m_cListRuleOfGroup.SetItem(&it);

	it.iItem	= pos;
	it.iSubItem	= 2;

	if(protocol != ICMP_PROTOCOL)
		it.pszText	= (srcPort == 0) ? "All" : itoa(srcPort, port, 10);

	else
		it.pszText	= (srcPort == 255) ? "All" : itoa(srcPort, port, 10);

	m_cListRuleOfGroup.SetItem(&it);
	
	it.iItem	= pos;
	it.iSubItem	= 3;
	it.pszText	= (dstIp == 0) ? "All" : IpToString(ip, dstIp);
	m_cListRuleOfGroup.SetItem(&it);

	it.iItem	= pos;
	it.iSubItem	= 4;
	it.pszText	= IpToString(ip, dstMask);
	m_cListRuleOfGroup.SetItem(&it);

	it.iItem	= pos;
	it.iSubItem = 5;

	if(protocol != ICMP_PROTOCOL)
		it.pszText	= (dstPort == 0) ? "All" : itoa(dstPort, port, 10);

	else
		it.pszText	= (dstPort == 255) ? "All" : itoa(dstPort, port, 10);

	m_cListRuleOfGroup.SetItem(&it);


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

	m_cListRuleOfGroup.SetItem(&it);

	it.iItem	= pos;
	it.iSubItem	= 7;
	it.pszText = action ? "Drop" : "Forward";
	m_cListRuleOfGroup.SetItem(&it);

}

void CFirewallManagerDlg::OnSelchangeListboxGroup() 
{	
	iADGroupNo = m_cListGroup.GetCurSel();
	GetDataFromAD();

	m_cListRuleOfGroup.DeleteAllItems();
	if (iCountRule != 0)
	{
		ruleManage->ResetRules();
		AddRule();
		UpdateList();
	}
}

void CFirewallManagerDlg::OnButtonAddRule() 
{
	DWORD dwAddress;
	CString sSrcAddr,sSrcMask,sDstAddr,sDstMask,sLongRule;
	CString sDefaultRule;

	UpdateData(TRUE);
	
	m_cSrcAddr.GetAddress(dwAddress);
	sSrcAddr = dwAddressToString(dwAddress);

	m_cSrcMask.GetAddress(dwAddress);
	sSrcMask = dwAddressToString(dwAddress);
	
	m_cDstAddr.GetAddress(dwAddress);
	sDstAddr = dwAddressToString(dwAddress);

	m_cDstMask.GetAddress(dwAddress);
	sDstMask = dwAddressToString(dwAddress);

	sLongRule = sSrcAddr + " " + sSrcMask + " " + m_sSrcPort + " " + 
				sDstAddr + " " + sDstMask + " " + m_sDstPort + " " +
				m_sProtocol + " " + m_sAction;
	
	GetDataFromAD();

	if (iCountRule == 0)
	{
		ADCon.SetNewRule(gDistinguishedName.GetAt(iADGroupNo),sServerRuleIn);
		ADCon.SetNewRule(gDistinguishedName.GetAt(iADGroupNo),sServerRuleOut);
		ADCon.SetNewRule(gDistinguishedName.GetAt(iADGroupNo),sLongRule);

		int id = GetCheckedRadioButton(IDC_RADIO_ALLOW_ALL, IDC_RADIO_DENY_ALL);
		if(id == IDC_RADIO_ALLOW_ALL)
			sDefaultRule = sAllowAll;
		else
			sDefaultRule = sDenyAll;

		ADCon.SetNewRule(gDistinguishedName.GetAt(iADGroupNo),sDefaultRule);
	}
	else
	{
		sDefaultRule = rmDistinguishedName.GetAt(0);
		ADCon.SetDeleteRule(gDistinguishedName.GetAt(iADGroupNo),0);

		ADCon.SetNewRule(gDistinguishedName.GetAt(iADGroupNo),sLongRule);
		ADCon.SetNewRule(gDistinguishedName.GetAt(iADGroupNo),sDefaultRule);
	}

	m_cSrcAddr.SetAddress(0,0,0,0);
	m_cSrcMask.SetAddress(255,255,255,255);
	m_cDstAddr.SetAddress(0,0,0,0);
	m_cDstMask.SetAddress(255,255,255,255);
	m_sSrcPort = "0";
	m_sDstPort = "0";
	m_sProtocol = "ALL";
	m_sAction = "DENY";
	UpdateData(FALSE);

	OnSelchangeListboxGroup();

}

CString CFirewallManagerDlg::dwAddressToString(DWORD dwAddress)
{
	CString strIP,strF1,strF2,strF3,strF4;

	DWORD temp1,temp2,temp3,dwF1,dwF2,dwF3;
	temp1 = dwAddress%16777216;
	dwF1 = dwAddress/16777216;
	strF1.Format("%u",dwF1);
	temp2 = temp1%65536;
	dwF2 = temp1/65536;
	strF2.Format("%u",dwF2);
	temp3 = temp2%256;
	dwF3 = temp2/256;
	strF3.Format("%u",dwF3);
	strF4.Format("%u",temp3);

	strIP = strF1 + "." + strF2 + "." + strF3 + "." + strF4;

	return strIP;
}

void CFirewallManagerDlg::OnButtonEditRule() 
{
	if (bEditRule)
	{
		DWORD dwAddress;
		CString sSrcAddr,sSrcMask,sDstAddr,sDstMask,sLongRule;

		UpdateData(TRUE);
	
		m_cSrcAddr.GetAddress(dwAddress);
		sSrcAddr = dwAddressToString(dwAddress);

		m_cSrcMask.GetAddress(dwAddress);
		sSrcMask = dwAddressToString(dwAddress);
	
		m_cDstAddr.GetAddress(dwAddress);
		sDstAddr = dwAddressToString(dwAddress);

		m_cDstMask.GetAddress(dwAddress);
		sDstMask = dwAddressToString(dwAddress);

		sLongRule = sSrcAddr + " " + sSrcMask + " " + m_sSrcPort + " " + 
					sDstAddr + " " + sDstMask + " " + m_sDstPort + " " +
					m_sProtocol + " " + m_sAction;
		
		int i;
		GetDataFromAD();
		rmDistinguishedName.SetAt(iRulePosition,sLongRule);		

// Delete All Rule From AD.
		for( i = 0; i < iCountRule; i++)
		{
			ADCon.SetDeleteRule(gDistinguishedName.GetAt(iADGroupNo),i);
		}

// Add All and New Rule  To AD.
		for( i = iCountRule - 1; i >=0 ; i--)
		{
			ADCon.SetNewRule(gDistinguishedName.GetAt(iADGroupNo),rmDistinguishedName.GetAt(i));
		}

		m_cSrcAddr.SetAddress(0,0,0,0);
		m_cSrcMask.SetAddress(255,255,255,255);
		m_cDstAddr.SetAddress(0,0,0,0);
		m_cDstMask.SetAddress(255,255,255,255);
		m_sSrcPort = "0";
		m_sDstPort = "0";
		m_sProtocol = "ALL";
		m_sAction = "DENY";
		UpdateData(FALSE);

		GetDlgItem( IDC_BUTTON_ADD_RULE )->EnableWindow(TRUE);
		GetDlgItem( IDC_BUTTON_DELETE_RULE )->EnableWindow(TRUE);
		GetDlgItem( IDC_BUTTON_DEFAULT_RULE )->EnableWindow(TRUE);
		SetDlgItemText( IDC_BUTTON_EDIT_RULE , "Edit" ) ;
		bEditRule = FALSE;
		OnSelchangeListboxGroup();	
		
	}
	else
	{
		GetDataFromAD();

		POSITION pos = m_cListRuleOfGroup.GetFirstSelectedItemPosition();
		if (pos == NULL)
		{
			AfxMessageBox("No rule is selected.");
			return;
		}
	
		iRulePosition = SetPosition(m_cListRuleOfGroup.GetNextSelectedItem(pos));
		
		if (iRulePosition == 0)
		{
			AfxMessageBox("Default rule can edit default action only !!!");
			return;
		}
		else if ((iRulePosition == iCountRule - 1)||(iRulePosition == iCountRule - 2))
		{
			AfxMessageBox("Can not edit server rule!!!");
			return;
		}

		BreakLongRule(rmDistinguishedName.GetAt(iRulePosition));
		
		IPStringToIPBYTE(sSrcAddress);
		m_cSrcAddr.SetAddress(ip01,ip02,ip03,ip04);
		IPStringToIPBYTE(sSrcMask);
		m_cSrcMask.SetAddress(ip01,ip02,ip03,ip04);
		IPStringToIPBYTE(sDstAddress);
		m_cDstAddr.SetAddress(ip01,ip02,ip03,ip04);
		IPStringToIPBYTE(sDstMask);
		m_cDstMask.SetAddress(ip01,ip02,ip03,ip04);

		m_sSrcPort = sSrcPort;
		m_sDstPort = sDstPort;
		m_sProtocol = sProtocol;
		m_sAction = sAction;
		UpdateData(FALSE);

		GetDlgItem( IDC_BUTTON_ADD_RULE )->EnableWindow(FALSE);	
		GetDlgItem( IDC_BUTTON_DELETE_RULE )->EnableWindow(FALSE);
		GetDlgItem( IDC_BUTTON_DEFAULT_RULE )->EnableWindow(FALSE);

		SetDlgItemText( IDC_BUTTON_EDIT_RULE , "Edit OK" ) ;

		bEditRule = TRUE;

	}
}

void CFirewallManagerDlg::OnButtonDeleteRule() 
{
	GetDataFromAD();
// Get rule position
	POSITION pos = m_cListRuleOfGroup.GetFirstSelectedItemPosition();
	if (pos == NULL)
	{
		AfxMessageBox("No rule is selected.");
		return;
	}

	iRulePosition = SetPosition(m_cListRuleOfGroup.GetNextSelectedItem(pos));

	if (iRulePosition == 0)
	{
		AfxMessageBox("Can not delete default rule !!!");
		return;
	}
	else if ((iRulePosition == iCountRule - 1)||(iRulePosition == iCountRule - 2))
	{
		AfxMessageBox("Can not delete server rule !!!");
		return;
	}
	
	// Delete from AD	
	ADCon.SetDeleteRule(gDistinguishedName.GetAt(iADGroupNo),iRulePosition);
	OnSelchangeListboxGroup();
}

int CFirewallManagerDlg::SetPosition(int iOldPos)
{
	return ruleManage->nRules - iOldPos - 1;
}

void CFirewallManagerDlg::BreakLongRule(CString sLongRule)
{
// change long rule string to each variables
	CString tmpString;
	sLongRule.TrimLeft();	//removes newline, space, and tab characters
	sLongRule.TrimRight();	//removes newline, space, and tab characters

	for ( int i=0; i<7; i++ ) 
	{
		int pos = sLongRule.Find(' ');
		tmpString = sLongRule.Left(pos);
		sLongRule.Delete(0, pos+1);

		switch(i)
		{
			case 0 :
				sSrcAddress = tmpString;
				break;
			case 1 :
				sSrcMask = tmpString;
				break;
			case 2 :
				sSrcPort = tmpString;
				break;
			case 3 :
				sDstAddress = tmpString;
				break;
			case 4 :
				sDstMask = tmpString;
				break;
			case 5 :
				sDstPort = tmpString;
				break;
			case 6 :
				sProtocol = tmpString;
				break;
		}

	}

	sAction = sLongRule;
	
//	AfxMessageBox(sSrcAddress + "\n" + sSrcMask + "\n" + sSrcPort + "\n" + sDstAddress + "\n"
//					+ sDstMask + "\n" + sDstPort + "\n" + sProtocol + "\n" + sAction);
}

void CFirewallManagerDlg::IPStringToIPBYTE(CString sIP)
{
	CString tmpString;
	sIP.TrimLeft();	//removes newline, space, and tab characters
	sIP.TrimRight();	//removes newline, space, and tab characters

	for ( int i = 0; i<3; i++ ) 
	{
		int pos = sIP.Find('.');
		tmpString = sIP.Left(pos);
		sIP.Delete(0, pos+1);		

		switch(i)
		{
			case 0 :
				ip01 = atoi(tmpString);
				break;
			case 1 :
				ip02 = atoi(tmpString);
				break;
			case 2 :
				ip03 = atoi(tmpString);
				break;
		}
	}
	ip04 = atoi(sIP);
}

void CFirewallManagerDlg::GetDataFromAD()
{
	gDistinguishedName.RemoveAll();
	ADCon.GetList("group",gName,gDistinguishedName);

	rmDistinguishedName.RemoveAll();
	ADCon.GetRule(gDistinguishedName.GetAt(iADGroupNo),rmDistinguishedName);
//	AfxMessageBox(gDistinguishedName.GetAt(iADGroupNo));
	iCountRule = rmDistinguishedName.GetSize();
	
}

void CFirewallManagerDlg::OnButtonDefaultRule() 
{
	CString sDefaultRule;
	GetDataFromAD();
	if (iCountRule == 0)
	{
		ADCon.SetNewRule(gDistinguishedName.GetAt(iADGroupNo),sServerRuleIn);
		ADCon.SetNewRule(gDistinguishedName.GetAt(iADGroupNo),sServerRuleOut);
	}
	else
		ADCon.SetDeleteRule(gDistinguishedName.GetAt(iADGroupNo),0);

	int id = GetCheckedRadioButton(IDC_RADIO_ALLOW_ALL, IDC_RADIO_DENY_ALL);
	if(id == IDC_RADIO_ALLOW_ALL)
		sDefaultRule = sAllowAll;
	else
		sDefaultRule = sDenyAll;

	ADCon.SetNewRule(gDistinguishedName.GetAt(iADGroupNo),sDefaultRule);
	OnSelchangeListboxGroup();
}

void CFirewallManagerDlg::OnButtonClearRule() 
{
	// Delete from AD
	GetDataFromAD();
	for (int i = 0 ; i < iCountRule ; i++)
		ADCon.SetDeleteRule(gDistinguishedName.GetAt(iADGroupNo),i);
	OnSelchangeListboxGroup();
}
