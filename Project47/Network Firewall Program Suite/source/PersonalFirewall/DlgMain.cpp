// DlgMain.cpp : implementation file
//

#include "stdafx.h"
#include "PersonalFirewall.h"
#include "DlgMain.h"

#include "sockUtil.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

////////////////////////////////////////////////////////
///////////   IDS PARTH

#include "Analysis.h"
#include "Sniff.h"

/////////////////////////////////////////////////////
//////// IDS SECTION
#define TIME_ELAP 1000

CAnalysis AnalyPacket;
BOOL StatusStop = TRUE;
CSniff Sniffer;

/////////////////////////////////////////////////
//////  IDS CAPTURE PACKET FUNCTION
UINT Thread_Analysis(LPVOID pParam)
{	
	CString T_Type,T_Src,T_Dst,T_Time;
	while((!StatusStop))
	{
		Header_Packet Packet;
		if (::Sniffer.GetPacket(Packet))//Get Packet From Buffer
		{
			if (::AnalyPacket.Check(Packet))
			{
				::Sniffer.ClearSniff();
			}
		}
		else
			Sleep(1);
	}
	return 0;
}

UINT Thread_Sniff(LPVOID pParam)
{
	while((!StatusStop))
	{
		::Sniffer.PacketFromDevice();
	}
	return 0;
}

/////////////////////////////////////////////////////////////////////////////
// CDlgMain dialog


CDlgMain::CDlgMain(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgMain::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgMain)
	m_sUserName = _T("");
	//}}AFX_DATA_INIT
}


void CDlgMain::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgMain)
	DDX_Control(pDX, IDC_LIST_GROUP, m_cListGroup);
	DDX_Control(pDX, IDC_LIST_LOG, m_cListLog);
	DDX_Text(pDX, IDC_STATIC_USER_NAME, m_sUserName);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgMain, CDialog)
	//{{AFX_MSG_MAP(CDlgMain)
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgMain message handlers
CDlgMain::~CDlgMain()
{
	StopFilter();
//	OnStop();
}

BOOL CDlgMain::OnInitDialog()
{
	CDialog::OnInitDialog();

// Load Filter driver
	if(filterDriver.LoadDriver("FwHookDrv", NULL, NULL, TRUE) != DRV_SUCCESS)
	{
		AfxMessageBox("Error loading filter driver.");
		exit(-1);
	}
// create new object
//	pckFilter	= new CPacketFilter();
	ruleFilter	= new CRuleManage();
	ruleGroup	= new CRuleManage();
//	ruleNids	= new CRuleManage();

// Get information to variable
	sUserName = GetUser();
	sUserDN = GetUserDN();

// Show information to Page
	m_sUserName = " " + sUserName;
	UpdateData(FALSE);

	if (sUserDN != " ")
	{
		ListMemberOf();
		AddGroupRule();
		StartFilter();
		m_cListLog.AddString(">Firewall Started...");
		OnStart();
	}	
	return TRUE;  // return TRUE  unless you set the focus to a control
}
CString CDlgMain::GetUser()
{
	char User[100];
	DWORD Len = sizeof(User);
	GetUserName(User, &Len);
	return User;
}

CString CDlgMain::GetUserDN()
{
	CStringArray uDistinguishedName;
	CStringArray uName;
	
	if (ADCon.GetList("user",uName,uDistinguishedName) != TRUE)
	{
		m_cListLog.AddString(">Can't get domain...!!!");
		return " ";
	}

	return uDistinguishedName.GetAt(0);
}

void CDlgMain::ListMemberOf()
{	
	CString TmpMo;

	ADCon.GetMemberOf(sUserDN,saADGroup);

	int iFWGroupAll = saADGroup.GetSize() - 1;

	for(int icount = iFWGroupAll - 1 ; icount >= 0 ; icount--)
	{
		TmpMo = saADGroup.GetAt(icount);		
		m_cListGroup.AddString(TmpMo.Mid(3,TmpMo.Find(",")-3));
	}	
	sGroup = TmpMo.Mid(3,TmpMo.Find(",")-3);
}

void CDlgMain::AddGroupRule()
{	
	int iGroupRule = 0;
	saADGroup.RemoveAll();
	ADCon.GetMemberOf(sUserDN,saADGroup);

	int iFWGroupAll = saADGroup.GetSize();

	for(int iCountGroup = iFWGroupAll - 1 ; iCountGroup >= 0 ; iCountGroup--)
	{	
		saGroupRule.RemoveAll();
		ADCon.GetRule(saADGroup.GetAt(iCountGroup),saGroupRule);

		iGroupRule = saGroupRule.GetSize();

		for( int i = iGroupRule - 1; i >= 0; i--)
		{
			CString sLongRule = saGroupRule.GetAt(i);

		// change long rule string to each variables
			CString tmpString;
			sLongRule.TrimLeft();	//removes newline, space, and tab characters
			sLongRule.TrimRight();	//removes newline, space, and tab characters

			for ( int j = 0; j<7; j++ ) 
			{
				int pos = sLongRule.Find(' ');
				tmpString = sLongRule.Left(pos);
				sLongRule.Delete(0, pos+1);

				switch(j)
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

				if (i == 0)
					iDefaultAction = iAction;
			}

			srcPort = atoi(sSrcPort);
			dstPort = atoi(sDstPort);

		// check number of rules
			if(ruleGroup->nRules < MAX_RULES )
			{
			// Add the rule to the rule lists			
				if(ruleGroup->AddRule(	srcIp, 
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
//					AfxMessageBox("Add rule OK");
				}
			}
		}
	}

}
BOOL CDlgMain::StartFilter()
{
	if(filterDriver.WriteIo(START_IP_HOOK, NULL, 0) != DRV_SUCCESS)
	{
		AfxMessageBox("CTest31Dlg::StartFilter() - >filterDriver.WriteIo Fail !!!");
		return FALSE;
	}
//	else
//		AfxMessageBox("WriteIO ok ");

// Send all rules to the driver
	unsigned int i;

	for(i = 0;i < ruleGroup->nRules;i++)
	{
		if (!AddFilterToFw(	ruleGroup->rules[i].sourceIp, 
							ruleGroup->rules[i].sourceMask,
							ruleGroup->rules[i].sourcePort,
							ruleGroup->rules[i].destinationIp,
							ruleGroup->rules[i].destinationMask,
							ruleGroup->rules[i].destinationPort,
							ruleGroup->rules[i].protocol,
							ruleGroup->rules[i].action))
		{
			AfxMessageBox("Error adding all rules to driver !!!.");
			return FALSE;
		}
	}
/*	for(i = 0;i < ruleFilter->nRules;i++)
	{
		if (!AddFilterToFw(	ruleFilter->rules[i].sourceIp, 
							ruleFilter->rules[i].sourceMask,
							ruleFilter->rules[i].sourcePort,
							ruleFilter->rules[i].destinationIp,
							ruleFilter->rules[i].destinationMask,
							ruleFilter->rules[i].destinationPort,
							ruleFilter->rules[i].protocol,
							ruleFilter->rules[i].action))
		{
			AfxMessageBox("Error adding all rules to driver !!!.");
			return FALSE;
		}
	}
*/
	return TRUE;
}

BOOL CDlgMain::StopFilter()
{
	if(filterDriver.WriteIo(STOP_IP_HOOK, NULL, 0) != DRV_SUCCESS)
	{
		AfxMessageBox("CTest31Dlg::StopFilter() - >filterDriver.WriteIo Fail !!!");
		return FALSE;
	}
	return TRUE;
}

BOOL CDlgMain::AddFilterToFw(unsigned long srcIp, 
							   unsigned long srcMask,
							   unsigned short srcPort, 
							   unsigned long dstIp,
							   unsigned long dstMask,
							   unsigned short dstPort,
							   unsigned int protocol,
							   int action)
{
	IPFilter pf;


	pf.protocol = protocol;

	pf.destinationIp = dstIp;			
	pf.sourceIp		 = srcIp;

	pf.destinationMask = dstMask;	
	pf.sourceMask	   = srcMask;		

	pf.destinationPort = htons(dstPort);						
	pf.sourcePort	   = htons(srcPort);				

	pf.drop = action;		
	
	// Send rule to the driver
	DWORD result = filterDriver.WriteIo(ADD_FILTER, &pf, sizeof(pf));

	if (result != DRV_SUCCESS) 
	{
		AfxMessageBox("CTest31Dlg::AddFilterToFw -> Send rules to the driver !!!");
		return FALSE;
	}

	else
		return TRUE;
}
void CDlgMain::OnStart()
{
		if(::Sniffer.GetStatusDirectPacket() == FALSE )
	{
		UpdateData(FALSE); 
		if(::Sniffer.OpenDirectPacket(0))
		{//send number of Adapter to select capture
			SetTimer(1,TIME_ELAP,NULL);//TIME_ELAP=1000
			m_cListLog.AddString(">Starting Intrusion Detection...");
//			m_sStatusNIDS = _T("Enable"); //Edit Box
			m_cListLog.SetTopIndex(m_cListLog.GetCount() - 1);

			UpdateData(FALSE); //set variable to control
			StatusStop = FALSE; //Flag Star Thread Function (initial Value True);
			AfxBeginThread((AFX_THREADPROC)Thread_Sniff,GetSafeHwnd(),THREAD_PRIORITY_IDLE);
			AfxBeginThread((AFX_THREADPROC)Thread_Analysis,GetSafeHwnd(),THREAD_PRIORITY_IDLE);
		}
		else{
			
			//OpenAdapter = 0; //if no adapter open select Again;
		}
	}
	else{
			//AfxMessageBox("Start");
			SetTimer(1,TIME_ELAP,NULL);//TIME_ELAP=1000
			m_cListLog.AddString(">Starting Intrusion Detection...");
//			m_sStatusNIDS = _T("Enable"); //Edit Box
			m_cListLog.SetTopIndex(m_cListLog.GetCount() - 1);

			UpdateData(FALSE); //set variable to control
			StatusStop = FALSE; //Flag Star Thread Function (initial Value True);
			AfxBeginThread((AFX_THREADPROC)Thread_Sniff,GetSafeHwnd(),THREAD_PRIORITY_IDLE);
			AfxBeginThread((AFX_THREADPROC)Thread_Analysis,GetSafeHwnd(),THREAD_PRIORITY_IDLE);
	}
}

void CDlgMain::OnStop()
{
	if(::Sniffer.GetStatusDirectPacket() == TRUE)
	{
		KillTimer(1); //Kill Timer ID = 1
		StatusStop = TRUE;
		m_cListLog.AddString(">Intrusion Detection has been stop!.");
//		m_sStatusNIDS = _T(" Disable");
		m_cListLog.SetTopIndex(m_cListLog.GetCount() - 1);

		UpdateData(FALSE); //set variable to control

		::Sniffer.ClearSniff();
		::Sniffer.CloseDirectPacket();
	}
}

void CDlgMain::OnTimer(UINT nIDEvent) 
{

// Client Attacked.
	CString Type,Src,Dst,Time;
	if (::AnalyPacket.GetResult(Type,Src,Dst,Time))
	{
		CTime t = CTime::GetCurrentTime();
		CString sSecond,sDay,sMonth,sYear,sDate;
		sSecond.Format("%d",t.GetSecond());
		sDay.Format("%d",t.GetDay());
		sMonth.Format("%d",t.GetMonth());
		sYear.Format("%d",t.GetYear());
		sDate = sDay+"/"+sMonth+"/"+sYear;

		Time += ":" + sSecond;
		CString msg = ">Attacked from:"+Src+",Type:"+Type+",Date:"+sDate+",Time:"+Time+"***";
		m_cListLog.AddString(msg);							// Add message to log list
		m_cListLog.SetTopIndex(m_cListLog.GetCount() - 1);		// Show last message in log list

		CString sTmpLog = Type+","+Src+","+Dst+","+sDate+","+Time+","+sGroup+","+sUserName;
		
		ADCon.SetNewLog(saADGroup.GetAt(0),sTmpLog);	// Add Log to AD

//		AddNidsRule(Src);
//		AddGroupRule();
/*		StopFilter();
		StartFilter();
*/	}

	CDialog::OnTimer(nIDEvent);
}

BOOL CDlgMain::AddNidsRule(CString sAtkSrc)
{
// Make new NIDS rule add to Filter
	char ip[16];
	for (unsigned int i = 0 ; i < ruleGroup->nRules ; i++)
	{
		if (sAtkSrc == IpToString(ip,ruleGroup->rules[i].sourceIp))
			return FALSE;
	}

	sSrcAddress = sAtkSrc;
	sSrcMask	= "255.255.255.255";
	sSrcPort	= "0";
	sDstAddress = ruleGroup->GetClientIP();
	sDstMask	= "255.255.255.255";
	sDstPort	= "0";
	sProtocol	= "ALL";
	sAction		= "DENY";

//	AfxMessageBox(sSrcAddress + "\n" + sSrcMask + "\n" + sSrcPort + "\n" + sDstAddress + "\n"
//					+ sDstMask + "\n" + sDstPort + "\n" + sProtocol + "\n" + sAction);

	int result;
	result = inet_addr(sSrcAddress, &srcIp);
	if(result == -1)
	{
		AfxMessageBox("Invalid source address");
		return FALSE;
	}

	result = inet_addr(sSrcMask, &srcMask);
	if(result == -1)
	{
		AfxMessageBox("Invalid source mask");
		return FALSE;
	}

	result = inet_addr(sDstAddress, &dstIp);
	if(result == -1)
	{
		AfxMessageBox("Invalid destination address");
		return FALSE;
	}

	result = inet_addr(sDstMask, &dstMask);
	if(result == -1)
	{
		AfxMessageBox("Invalid destination mask");
		return FALSE;
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
		return FALSE;
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

	// Add the rule to the rule lists
	ruleGroup->ResetRules();
	if(ruleGroup->AddRule(	srcIp, 
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
//		AfxMessageBox("Add rule OK");
	}
	return TRUE;
}
