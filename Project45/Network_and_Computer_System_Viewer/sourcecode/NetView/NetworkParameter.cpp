// NetworkParameter.cpp : implementation file
//
#include "stdafx.h"
#include "NetView.h"
#include "NetViewDoc.h"
#include "NetViewView.h"
#include "Data.h"
#include "NetworkParameter.h"
#include "Redirect.h"
#include "Stat.h"
#include "WWaitTarget.h"
#include "MainFrm.h"
#include "Subnet.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CNetworkParameter dialog
CString Ipstart,Ipstop;
CString Glbstart,Glbstop;
int opt_type,opt_os,opt_snmp,opt_nimda,opt_share;
extern int first;
CNetworkParameter::CNetworkParameter(CWnd* pParent /*=NULL*/)
	: CDialog(CNetworkParameter::IDD, pParent)
{
	//{{AFX_DATA_INIT(CNetworkParameter)
	//}}AFX_DATA_INIT
	m_pParent = pParent;
	m_nID = CNetworkParameter::IDD;
}


void CNetworkParameter::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CNetworkParameter)
	DDX_Control(pDX, IDC_EDIT5, m_Edit5);
	DDX_Control(pDX, IDC_EDIT4, m_Edit4);
	DDX_Control(pDX, IDC_EDIT3, m_Edit3);
	DDX_Control(pDX, IDC_EDIT2, m_Edit2);
	DDX_Control(pDX, IDC_EDIT1, m_Edit1);
	DDX_Control(pDX, IDC_IPADDRESS2, m_IP2);
	DDX_Control(pDX, IDC_IPADDRESS1, m_IP1);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CNetworkParameter, CDialog)
	//{{AFX_MSG_MAP(CNetworkParameter)
	ON_BN_CLICKED(IDC_Single, OnSingle)
	ON_BN_CLICKED(IDC_Range, OnRange)
	ON_BN_CLICKED(IDC_Subnet, OnSubnet)
	ON_COMMAND(ID_View, OnView)
	ON_NOTIFY(IPN_FIELDCHANGED, IDC_IPADDRESS1, OnFieldchangedIpaddress1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CNetworkParameter message handlers

void CNetworkParameter::OnOK() 
{
	CData db;
	CSubnet sdb;
	CString buf,buf1,buf2,buf3,buf4;
	CString start,stop;

	opt_type=0;
	opt_os=0;
	opt_snmp=0;
	opt_nimda=0;
	opt_share=0;
	// TODO: Add extra validation here

	CDialog::ShowWindow(SW_HIDE);

	if((m_IP1.IsBlank())||(m_IP2.IsBlank()&&!((CButton*)GetDlgItem(IDC_Single))->GetCheck()))
	{
		MessageBox("กรุณาใส่ข้อมูลด้วย","ข้อมูลผิดพลาด",MB_OK);
		CNetworkParameter* nParam=new CNetworkParameter;
		nParam->DoModal();
	}
	else
	{	
		m_IP1.GetWindowText(buf1);
		m_IP1.GetDlgItemText(IDC_IPADDRESS1,buf2);
		m_IP2.GetDlgItemText(IDC_IPADDRESS2,buf3);
		Ipstart=buf1;
		m_IP2.GetWindowText(Ipstop);
		
		Glbstart=buf1;		//Global IP start
		Glbstop=Ipstop;		//Global IP stop

		Ipstart=Ipstart.Left(Ipstart.ReverseFind('.'));
		start=Ipstart.Right(Ipstart.GetLength()-(Ipstart.ReverseFind('.')+1));
		Ipstart=Ipstart.Mid(0,Ipstart.ReverseFind('.')+1);

		Ipstop=Ipstop.Left(Ipstop.ReverseFind('.'));
		stop=Ipstop.Right(Ipstop.GetLength()-(Ipstop.ReverseFind('.')+1));
		Ipstop=Ipstop.Mid(0,Ipstop.ReverseFind('.')+1);

		int sx,sy,ids=0,not_true=0;
		char sbuf[3];
		sx=atoi(start);
		sy=atoi(stop);
		sdb.Open(dbOpenDynaset,_T("Select * From Subnet"));
		while(sx<=sy)
		{ 
			sdb.AddNew();
			sdb.m_ID = ids;
			sdb.m_Subnet=Ipstart + _itoa(sx,sbuf,10) + ".0";
			sx=sx+1;
			ids=ids+1;
			sdb.Update();
		}
		
		if(Ipstart=="127.0.")
		{
			MessageBox("NETVIEW does not work on local loopback interfaces","Warning",MB_OK);
			not_true=1;
		}
		else if(Ipstart=="0.0.")
		{
			MessageBox("NETVIEW does not work on default route interfaces","Warning",MB_OK);
			not_true=1;
		}
		else
		{
			if(((CButton*)GetDlgItem(IDC_Single))->GetCheck())
			{
				if(buf2=="255")
				{
					MessageBox("Your input is invalid","Warning",MB_OK);
					not_true=1;
				}
				else
				{
					buf = ".\\bin\\nmap-3.00\\nmap.exe -sP " + buf1;
					CRedirect Redirect(buf, &m_Edit1);
					CWWaitTarget wait;
					wait.Show();
					Redirect.Run();
					wait.Close();
					Listhost();
					Redirect.Stop();
					opt_type=1;
				}
			}
			else if(((CButton*)GetDlgItem(IDC_Range))->GetCheck())
			{
				if((buf2=="255")||(buf3=="255"))
				{
					MessageBox("Your input is invalid","Warning",MB_OK);
					not_true=1;
				}
				else
				{
				buf = ".\\bin\\nmap-3.00\\nmap.exe -sP " + Ipstart + start +"-" + stop + "." + buf2 + "-" + buf3;
				CRedirect Redirect(buf, &m_Edit1);
				CWWaitTarget wait;
				wait.Show();
				Redirect.Run();
				wait.Close();
				Listhost();
				Redirect.Stop();
				opt_type=2;
				}
			}
			else if(((CButton*)GetDlgItem(IDC_Subnet))->GetCheck())
			{
				int i,bin2,bin3;
				char cnt[8]={'0','0','0','0','0','0','0','0'};
				if(buf2=="255")
				{
					MessageBox("Your input is invalid","Warning",MB_OK);
					not_true=1;
				}
				else
				{
				bin2=atoi(stop);
				if(bin2!=0)
				{
					_itoa(bin2,cnt,2);
					bin2=0;
					for(i=0;i<8;i++)
					{
						if(cnt[i]=='1')
							bin2=bin2+1;
					}
				}
				else
					bin2=0;
				bin3=atoi(buf3);
				if(bin3!=0)
				{
					_itoa(bin3,cnt,2);
					bin3=0;
					for(i=0;i<8;i++)
					{
						if(cnt[i]=='1')
						bin3=bin3+1;
					}
				}
				else
					bin3=0;
				bin2=16+bin2+bin3;
				_itoa(bin2,cnt,10);
				buf = ".\\bin\\nmap-3.00\\nmap.exe -sP " + buf1 + "/" + cnt;
				CRedirect Redirect(buf, &m_Edit1);
				CWWaitTarget wait;
				wait.Show();
				Redirect.Run();
				wait.Close();
				Listhost();
				Redirect.Stop();
				opt_type=3;
				}
			}
			
		}
		CString temp;
		CString virus;
		if(!not_true)
		{
		if(((CButton*)GetDlgItem(IDC_OSscan))->GetCheck())
		{
			db.Open(dbOpenDynaset,_T("Select * From HostActive"));
			db.MoveFirst();
			CWWaitTarget wait;
			wait.Show();
			while(!db.IsEOF())
			{
				m_Edit2.SetWindowText("");
				buf1=db.m_IP;
				buf = ".\\bin\\nmap-3.00\\nmap.exe -O " + buf1;
				CRedirect RedirectOS(buf, &m_Edit2);			
				RedirectOS.Run();
				FindOS();
				db.MoveNext();
				RedirectOS.Stop();
			}
			wait.Close();
			db.Close();
			opt_os=1;
		}
		if(((CButton*)GetDlgItem(IDC_Nimda))->GetCheck())
		{
			db.Open(dbOpenDynaset,_T("Select * From HostActive"));
			db.MoveFirst();
			CWWaitTarget wait;
			wait.Show();
			while(!db.IsEOF())
			{
				m_Edit3.SetWindowText("");
				buf1=db.m_IP;
				buf = ".\\bin\\nimda\\nimda.exe -h " + buf1;
				CRedirect Redirect(buf, &m_Edit3);
				Redirect.Run();
				m_Edit3.GetWindowText(temp);
				virus=temp.Mid(temp.Find("fileinfected")+15,1);
				db.Edit();
				if(virus=="1")
					db.m_Nimda=1;
				else if(virus=="0")
					db.m_Nimda=0;
				db.Update();
				db.MoveNext();
				Redirect.Stop();
			}
			wait.Close();
			db.Close();
			opt_nimda=1;
		}
		if(((CButton*)GetDlgItem(IDC_Snmp))->GetCheck())
		{
			db.Open(dbOpenDynaset,_T("Select * From HostActive"));
			db.MoveFirst();
			CWWaitTarget wait;
			wait.Show();
			while(!db.IsEOF())
			{
				m_Edit4.SetWindowText("");
				buf = ".\\bin\\snmputil\\check.exe get " + db.m_IP + " public " + "system.sysDescr.0";
				CRedirect Redirect(buf, &m_Edit4);
				Redirect.Run();
				m_Edit4.GetWindowText(temp);
				db.Edit();
				if (temp.Find("error")==-1) db.m_Snmp=1;
				else	db.m_Snmp=0;
				db.Update();
				db.MoveNext();
				Redirect.Stop();
			}
			wait.Close();
			db.Close();
			opt_snmp=1;
		}
		if(((CButton*)GetDlgItem(IDC_Share))->GetCheck())
		{
			db.Open(dbOpenDynaset,_T("Select * From HostActive"));
			db.MoveFirst();
			CString nfd;
			CWWaitTarget wait;
			wait.Show();
			while(!db.IsEOF())
			{
				m_Edit5.SetWindowText("");
				buf = ".\\bin\\nimda\\nimda.exe -h " + db.m_IP;
				CRedirect Redirect(buf, &m_Edit5);
				Redirect.Run();
				m_Edit5.GetWindowText(temp);
				nfd="\\\\"+db.m_IP+'\\';
				db.Edit();
				if(temp.Find(nfd,0)!=-1) db.m_Share=1;
				else db.m_Share=0;
				db.Update();
				db.MoveNext();
				Redirect.Stop();
			}
			wait.Close();
			db.Close();
			opt_share=1;
		}
		}
	}
	first=1;
	CDialog::ShowWindow(SW_SHOW);
	CDialog::OnOK();
}


void CNetworkParameter::OnCancel() 
{
	// TODO: Add extra cleanup here
	EndDialog(0);
	CDialog::OnCancel();
}


void CNetworkParameter::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	delete this;
	CDialog::PostNcDestroy();
}

void CNetworkParameter::OnSingle() 
{
	// TODO: Add your control notification handler code here
	GetDlgItem(IDC_IPADDRESS1)->EnableWindow(TRUE);
	GetDlgItem(IDC_IPADDRESS2)->EnableWindow(FALSE);
	SetDlgItemText(IDC_IPADDRESS2,"");
}

void CNetworkParameter::OnRange() 
{
	// TODO: Add your control notification handler code here
	GetDlgItem(IDC_IPADDRESS1)->EnableWindow(TRUE);
	GetDlgItem(IDC_IPADDRESS2)->EnableWindow(TRUE);
	SetDlgItemText(IDC_IPADDRESS2,"");
}

void CNetworkParameter::OnSubnet() 
{
	// TODO: Add your control notification handler code here
	GetDlgItem(IDC_IPADDRESS1)->EnableWindow(TRUE);
	GetDlgItem(IDC_IPADDRESS2)->EnableWindow(TRUE);
	SetDlgItemText(IDC_IPADDRESS2,"255.255.255.0");
}

BOOL CNetworkParameter::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	//GetDlgItem(IDC_IPADDRESS2)->EnableWindow(FALSE);
	((CButton*)GetDlgItem(IDC_Range))->SetCheck(TRUE);
	m_IP1.SetWindowText(Ipstart);
	m_IP2.SetWindowText(Ipstop);
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CNetworkParameter::OnView() 
{
	// TODO: Add your command handler code here
	
}

void CNetworkParameter::FindOS()
{
	int whereOSStart=0;
	int whereOSStop=0;
	int pos_host1;
	int pos_host2;
	int checkfind;
	int wherePortStart=0;
	int wherePortStop=0;

	CString strTemp;
	CString OS,Op;
	CString host,sql;
	CData db;
	
	m_Edit2.GetWindowText(strTemp);

	whereOSStart = strTemp.Find("guess");
	whereOSStart = strTemp.Find(" ",whereOSStart)+1;
	whereOSStop = strTemp.Find("\n",whereOSStart);

	pos_host1 = strTemp.Find("Interesting ports on")+21;
	pos_host2 = strTemp.Find(" (",pos_host1);
	host = strTemp.Mid(pos_host1,pos_host2-pos_host1);
	sql="Select * From HostActive Where Host='"+host+"'";
	db.Open(dbOpenDynaset,_T(sql));
	OS = strTemp.Mid(whereOSStart,whereOSStop-whereOSStart);
	db.Edit();

	wherePortStart = strTemp.Find("Service",wherePortStop);
	wherePortStop = strTemp.Find("Remote",wherePortStart);
	Op = strTemp.Mid(wherePortStart+8,wherePortStop-(wherePortStart+8));
	Op.Replace("open    ","");
	db.m_OpenPort=Op;

	if(OS.Find("Windows")!=-1)
		db.m_OS=1;
	else if(OS.Find("Linux")!=-1)
		db.m_OS=2;
	else if(OS.Find("Mac")!=-1)
		db.m_OS=3;
	else if(OS.Find("BSD")!=-1)
		db.m_OS=4;
	else if((OS.Find("Laser")!=-1)||(OS.Find("printer")!=-1)||(OS.Find("Printer")!=-1)||(OS.Find("Jet")!=-1))
		db.m_OS=6;
	else if(OS.Find("Cisco")!=-1)
		db.m_OS=7;
	db.m_OSName=OS;
	db.Update();
	db.Close();
	m_Edit2.Clear();
	checkfind = strTemp.Find("guess:",whereOSStart);
	whereOSStart = checkfind+7;
	whereOSStop = strTemp.Find("\n",whereOSStart);

	while(checkfind!=-1)
	{
		pos_host1 = strTemp.Find("Interesting ports on",pos_host2)+21;
		pos_host2 = strTemp.Find(" (",pos_host1);
		host = strTemp.Mid(pos_host1,pos_host2-pos_host1);
		sql="Select * From HostActive Where Host='"+host+"'";
		db.Open(dbOpenDynaset,_T(sql));
		OS = strTemp.Mid(whereOSStart,whereOSStop-whereOSStart);
		db.Edit();

		wherePortStart = strTemp.Find("Service",wherePortStop);
		wherePortStop = strTemp.Find("Remote",wherePortStart);
		Op = strTemp.Mid(wherePortStart+8,wherePortStop-(wherePortStart+8));
		Op.Replace("open    ","");
		db.m_OpenPort=Op;
	
		if(OS.Find("Win")!=-1)
			db.m_OS=1;
		else if(OS.Find("Lin")!=-1)
			db.m_OS=2;
		db.m_OSName=OS;
		db.Update();
		db.Close();
		checkfind = strTemp.Find("guess:",whereOSStart);
		whereOSStart = checkfind+7;
		whereOSStop = strTemp.Find("\n",whereOSStop);
	}

}

void CNetworkParameter::Listhost()
{
	CString strTemp,subnet_before,subnet_now;
	static int whereHostStart=0;
	static int whereHostStop=0;
	static int whereHostIPStart=0;
	static int whereHostIPStop=0;
	static int whereHostListStart=0;
	static int End=0;
	int num=0;
	m_Edit1.GetWindowText(strTemp);
	if(strTemp.Find("Host seems down",whereHostStop)==-1)
	{
	whereHostListStart = strTemp.Find("Host",whereHostStop);
	whereHostStop = strTemp.Find(" (",whereHostListStart+4);
	whereHostIPStart = strTemp.Find("(",whereHostListStart);
	whereHostIPStop= strTemp.Find(")",whereHostIPStart);
	CData db;
	CStat stat;
	CString temp;
	stat.Open(dbOpenDynaset,_T("Select * From Stat"));
	db.Open(dbOpenDynaset,_T("Select * From HostActive"));
	db.AddNew();
	db.m_Host=strTemp.Mid(whereHostListStart+5,whereHostStop-(whereHostListStart+4));
	db.m_IP=strTemp.Mid(whereHostIPStart+1,whereHostIPStop-(whereHostIPStart)-1);

	subnet_before=db.m_IP.Left(db.m_IP.ReverseFind('.'));	//find subnet

	db.m_Id_subnet=num;
	stat.AddNew();
	stat.m_IP=db.m_IP;
	stat.m_Time=CString(CTime::GetCurrentTime().Format("%H:%M:%S"));
	stat.m_Date=CString(CTime::GetCurrentTime().Format("%a, %b %d, %Y"));
	stat.Update();
	db.Update();
	//num=num+1;
	for(int i=0;i<1024;i++)
	{
		whereHostStart = strTemp.Find("Host",whereHostStop);
		if (whereHostListStart==whereHostStart)
		{
			break;
		}
		whereHostStop = strTemp.Find(" (",whereHostStart+4);
		whereHostIPStart = strTemp.Find("(",whereHostStart);
		whereHostIPStop= strTemp.Find(")",whereHostIPStart);
		temp = strTemp.Mid(whereHostIPStart+1,whereHostIPStop-(whereHostIPStart)-1);
		if (temp.GetLength()>3){
		db.AddNew();
		db.m_Host=strTemp.Mid(whereHostStart+5,whereHostStop-(whereHostStart+4));
		db.m_IP=strTemp.Mid(whereHostIPStart+1,whereHostIPStop-(whereHostIPStart)-1);

		subnet_now=db.m_IP.Left(db.m_IP.ReverseFind('.'));	//find subnet
		if(subnet_before==subnet_now)
			db.m_Id_subnet=num;
		else
		{
			num=num+1;
			db.m_Id_subnet=num;
			subnet_before=subnet_now;
		}
		stat.AddNew();
		stat.m_IP=db.m_IP;
		stat.m_Time=CString(CTime::GetCurrentTime().Format("%H:%M:%S"));
		stat.m_Date=CString(CTime::GetCurrentTime().Format("%a, %b %d, %Y"));
		stat.Update();
		db.Update();
		}
	}
	db.Close();
	stat.Close();
	}
	else
		MessageBox("Host seems down","Result",MB_OK);
}

void CNetworkParameter::ListPort()
{
	CString strTemp,Op;
	m_Edit2.GetWindowText(strTemp);

	static int wherePortStart=0;
	static int wherePortStop=0;

	wherePortStart = strTemp.Find("Service",wherePortStop);
	wherePortStop = strTemp.Find("Remote",wherePortStart);

	while(wherePortStart!=-1)
	{
		Op = strTemp.Mid(wherePortStart+8,wherePortStop-(wherePortStart+8));
		wherePortStart = strTemp.Find("Service",wherePortStop);
		wherePortStop = strTemp.Find("Remote",wherePortStart);
		Op.Replace("open    ","");
	}
}

void CNetworkParameter::OnFieldchangedIpaddress1(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	CString buf;
	if(((CButton*)GetDlgItem(IDC_Range))->GetCheck())
	{ 
		m_IP1.GetWindowText(buf);
		m_IP2.SetWindowText(buf);
	}
	*pResult = 0;
}

void CNetworkParameter::OnRefresh()
{
	if(opt_type==1)
		((CButton*)GetDlgItem(IDC_Single))->SetCheck(1);
	else if(opt_type==2)
		((CButton*)GetDlgItem(IDC_Range))->SetCheck(1);
	else if(opt_type==3)
		((CButton*)GetDlgItem(IDC_Subnet))->SetCheck(1);
	m_IP1.SetWindowText(Glbstart);
	m_IP2.SetWindowText(Glbstop);
	((CButton*)GetDlgItem(IDC_OSscan))->SetCheck(opt_os);
	((CButton*)GetDlgItem(IDC_Nimda))->SetCheck(opt_nimda);
	((CButton*)GetDlgItem(IDC_Snmp))->SetCheck(opt_snmp);
	((CButton*)GetDlgItem(IDC_Share))->SetCheck(opt_share);
	OnOK();
}
