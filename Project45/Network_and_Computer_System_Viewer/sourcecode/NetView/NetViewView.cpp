// NetViewView.cpp : implementation of the CNetViewView class
//

#include "stdafx.h"
#include "NetView.h"
#include "Data.h"
#include "NetViewDoc.h"
#include "NetViewView.h"
#include "Position.h"
#include "NetworkParameter.h"
#include "Snmp.h"
#include "ResultAll.h"
#include "Port.h"
#include "Graph.h"
#include "Share.h"
#include "Subnet.h"
#include "Tracer.h"
#include "QuickShow.h"
#include "AddScript.h"
#include "Timer.h"
#include "Stat.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CString QuickCommand;
/////////////////////////////////////////////////////////////////////////////
// CNetViewView

IMPLEMENT_DYNCREATE(CNetViewView, CScrollView)

BEGIN_MESSAGE_MAP(CNetViewView, CScrollView)
	//{{AFX_MSG_MAP(CNetViewView)
	ON_WM_RBUTTONDOWN()
	ON_COMMAND(ID_View, OnViewHost)
	ON_COMMAND(ID_Trace, OnTrace)
	ON_COMMAND(ID_Refresh, OnRefresh)
	ON_COMMAND(ID_GRAPH, OnGraph)
	ON_COMMAND(ID_FILE_NEW, OnFileNew)
	ON_COMMAND(ID_Export, OnExport)
	ON_COMMAND(ID_Import, OnImport)
	ON_COMMAND(ID_TGraph, OnTGraph)
	ON_COMMAND(ID_TRefresh, OnTRefresh)
	ON_COMMAND(ID_TReport, OnTReport)
	ON_COMMAND(ID_TImport, OnTImport)
	ON_COMMAND(ID_OPTION_AUTOREFRESH_NONE, OnOptionAutorefreshNone)
	ON_UPDATE_COMMAND_UI(ID_OPTION_AUTOREFRESH_NONE, OnUpdateOptionAutorefreshNone)
	ON_COMMAND(ID_OPTION_AUTOREFRESH_SET, OnOptionAutorefreshSet)
	ON_UPDATE_COMMAND_UI(ID_OPTION_AUTOREFRESH_SET, OnUpdateOptionAutorefreshSet)
	ON_COMMAND(ID_OPTION_ADDSCRIPT, OnOptionAddscript)
	ON_WM_TIMER()
	ON_WM_PAINT()
	ON_COMMAND(ID_OPTION_CLEARSTATISTICDATABASE, OnOptionClearstatisticdatabase)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CNetViewView construction/destruction

extern int first;
extern CString Glbstart,Glbstop;
extern int opt_type,opt_os,opt_snmp,opt_nimda,opt_share;

CNetViewView::CNetViewView()
{
	// TODO: add construction code here
	isSetTimer = FALSE;
	sec = 0;
	min = 0;
	hour = 0;
}

CNetViewView::~CNetViewView()
{
}

BOOL CNetViewView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying

	//  the CREATESTRUCT cs
	return CScrollView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CNetViewView drawing

void CNetViewView::OnDraw(CDC* pDC)
{
	CNetViewDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	
	CData db;
	int devide_subnet=0,s,one=1,before_subnet=256;
	int subnet[256];
	int total=1,count_ip=1;

	for(int i=0;i<=255;i++)
	{
		subnet[i]=0;
	}
		memdcCom.CreateCompatibleDC(pDC);
		// TODO: Add your message handler code here
		db.Open(dbOpenDynaset,_T("Select * From HostActive"));

		while(!db.IsEOF())
		{	
			if (one==1)
			{
				db.MoveNext();
				if(db.IsEOF())
					one=2;
				else
					one=3;
				db.MovePrev();
			}
			CPosition* p = new CPosition;
			if(db.m_OS==1)			//Windows
				if((db.m_Nimda)&&(db.m_Snmp))
					bmCom.LoadBitmap(IDB_BITMAP15);
				else if(db.m_Nimda)
					bmCom.LoadBitmap(IDB_BITMAP13);
				else if(db.m_Snmp)
					bmCom.LoadBitmap(IDB_BITMAP21);
				else
					bmCom.LoadBitmap(IDB_BITMAP1);
			else if(db.m_OS==2)		//Linux
				if((db.m_Nimda)&&(db.m_Snmp))
					bmCom.LoadBitmap(IDB_BITMAP18);
				else if(db.m_Nimda)
					bmCom.LoadBitmap(IDB_BITMAP11);
				else if(db.m_Snmp)
					bmCom.LoadBitmap(IDB_BITMAP17);
				else
					bmCom.LoadBitmap(IDB_BITMAP2);
			else if(db.m_OS==3)		//Mac
				if((db.m_Nimda)&&(db.m_Snmp))
					bmCom.LoadBitmap(IDB_BITMAP20);
				else if(db.m_Nimda)
					bmCom.LoadBitmap(IDB_BITMAP12);
				else if(db.m_Snmp)
					bmCom.LoadBitmap(IDB_BITMAP19);
				else
					bmCom.LoadBitmap(IDB_BITMAP3);
			else if(db.m_OS==4)		//FreeBSD
				if((db.m_Nimda)&&(db.m_Snmp))
					bmCom.LoadBitmap(IDB_BITMAP16);
				else if(db.m_Nimda)		
					bmCom.LoadBitmap(IDB_BITMAP10);
				else if(db.m_Snmp)
					bmCom.LoadBitmap(IDB_BITMAP22);
				else
					bmCom.LoadBitmap(IDB_BITMAP4);
			else if(db.m_OS==6)		//Printer
				if(db.m_Snmp)
					bmCom.LoadBitmap(IDB_BITMAP27);
				else
					bmCom.LoadBitmap(IDB_BITMAP6);
			else if(db.m_OS==7)		//Router,Switch
					bmCom.LoadBitmap(IDB_BITMAP23);
			else
				if((db.m_Nimda)&&(db.m_Snmp))
					bmCom.LoadBitmap(IDB_BITMAP26);
				else if(db.m_Nimda)
					bmCom.LoadBitmap(IDB_BITMAP14);
				else if(db.m_Snmp)
					bmCom.LoadBitmap(IDB_BITMAP25);
				else
					bmCom.LoadBitmap(IDB_BITMAP7);
			
			memdcCom.SelectObject(&bmCom);


			if(before_subnet==256)
				before_subnet=db.m_Id_subnet;
			if(before_subnet!=db.m_Id_subnet)
			{
				CSubnet sdb;
				char buf[2];
				_itoa(db.m_Id_subnet-1,buf,10);
				CString str="Select * From Subnet Where ID=";
				str=str+buf;
				sdb.Open(dbOpenDynaset,_T(str));
				DrawRect(25+(subnet[devide_subnet]-110),10+(100*(devide_subnet)),pDC,2);
				devide_subnet=devide_subnet+1;
				DrawRect(0,10+(100*(devide_subnet)),pDC,3);
				pDC->SetTextColor(RGB(255,0,0));
				pDC->TextOut(500,40+(100*(devide_subnet)),sdb.m_Subnet);
				pDC->SetTextColor(RGB(0,0,0));
				before_subnet=db.m_Id_subnet;
				devide_subnet=devide_subnet+1;
				total=1;
			}

			if(db.m_Share)
				pDC->TextOut(72+subnet[devide_subnet],45+(100*(devide_subnet)),"Share");


			s=db.GetRecordCount();
			pDC->BitBlt(25+subnet[devide_subnet],10+(100*(devide_subnet)),48,48,&memdcCom,0,0,SRCCOPY);
			pDC->TextOut(5+subnet[devide_subnet],65+(100*(devide_subnet)),db.m_IP);
			
			p->name=db.m_IP;
			p->m_tracker.m_rect.left=25+subnet[devide_subnet];
			p->m_tracker.m_rect.top=10+(100*(devide_subnet));
			p->m_tracker.m_rect.right=48+(25+subnet[devide_subnet]);
			p->m_tracker.m_rect.bottom=58+(100*(devide_subnet));
			pDoc->all_host.AddTail(p);
			if(((count_ip!=s)&&(total%9!=0))||(count_ip==1))
			{
				if (one!=2)
					DrawRect(25+subnet[devide_subnet],10+(100*(devide_subnet)),pDC,1);
			}
			
			subnet[devide_subnet]=subnet[devide_subnet]+110;
			if(total%9==0)
				devide_subnet=devide_subnet+1;
			if(count_ip==s)
			{
				CSubnet sdb;
				char buf[2];
				_itoa(db.m_Id_subnet,buf,10);
				CString str="Select * From Subnet Where ID=";
				str=str+buf;
				sdb.Open(dbOpenDynaset,_T(str));
				devide_subnet=devide_subnet+1;
				DrawRect(0,10+(100*(devide_subnet)),pDC,3);
				pDC->SetTextColor(RGB(255,0,0));
				pDC->TextOut(500,40+(100*(devide_subnet)),sdb.m_Subnet);
				pDC->SetTextColor(RGB(0,0,0));
			}
			db.MoveNext();
			total=total+1;
			count_ip=count_ip+1;

			if(db.IsEOF()) break;
			bmCom.DeleteObject();
		}
		bmCom.DeleteObject();
		memdcCom.DeleteDC();
	
	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CNetViewView diagnostics

#ifdef _DEBUG
void CNetViewView::AssertValid() const
{
	CScrollView::AssertValid();
}

void CNetViewView::Dump(CDumpContext& dc) const
{
	CScrollView::Dump(dc);
}

CNetViewDoc* CNetViewView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CNetViewDoc)));
	return (CNetViewDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CNetViewView message handlers

UINT CNetViewView::GetRandPoint(UINT nRandom)
{
	int temp1=rand()%nRandom;
	return (UINT)temp1;
}

COLORREF CNetViewView::GetRandColor()
{
	return RGB(GetRandPoint(255),GetRandPoint(255),GetRandPoint(255));
}

void CNetViewView::DrawRect(int start,int stop,CDC* pDC,int color)
{
	CPen pen;
	if((color==1)||(color==3))
		pen.CreatePen(PS_SOLID,2,RGB(2,3,55));
	else if(color==2)
		pen.CreatePen(PS_SOLID,2,RGB(255,255,255));

	CPen* poldPen;
	poldPen=pDC->SelectObject(&pen);
	if(color==3)
	{	pDC->MoveTo(start,stop+40);
		pDC->LineTo(start+1000,stop+40);
	}
	else
	{	pDC->MoveTo(start+40,stop+20);
		pDC->LineTo(start+110,stop+20);
	}
	pDC->SelectObject(poldPen);
}

void CNetViewView::OnRButtonDown(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	
	POSITION pos;
	CNetViewDoc* pDoc = GetDocument();
	CData db;
	CString sql;
	CArp *arp;
	CPoint pScroll;
	char macAddr[18];
	pScroll=GetDeviceScrollPosition();
	for(pos=pDoc->all_host.GetHeadPosition();pos!=NULL;)
	{
		CPosition* xx = (CPosition*)pDoc->all_host.GetNext(pos);
		if(xx->m_tracker.HitTest(point+pScroll)>=0)
		{
			CMenu menu;
			DWORD SelectionMade;
			VERIFY(menu.LoadMenu(IDR_NetView));
			CMenu* pPopup = menu.GetSubMenu(2);
			ASSERT(pPopup != NULL);

			POINT pp;
			GetCursorPos(&pp);
			SelectionMade = pPopup->TrackPopupMenu(TPM_LEFTALIGN | TPM_LEFTBUTTON 
				| TPM_NONOTIFY | TPM_RETURNCMD,pp.x,pp.y,this);
			pPopup->DestroyMenu();

			switch(SelectionMade) 
			{ 
				case ID_Snmp:
				{	
					CSnmp snmp;
					snmp.nIP=xx->name;
					snmp.DoModal();
					break; 
				}
				case ID_All:
				{	
					WORD wVersionRequested;
					WSADATA wsaData;
					char name[255];
					CString ownip;
					PHOSTENT hostinfo;
					wVersionRequested = MAKEWORD( 2, 0 );
	
					if ( WSAStartup( wVersionRequested, &wsaData ) == 0 )
					{

						if( gethostname ( name, sizeof(name)) == 0)
						{
							if((hostinfo = gethostbyname(name)) != NULL)
							{
							   ownip = inet_ntoa (*(struct in_addr *)*hostinfo->h_addr_list);
							}
						}
            
						WSACleanup( );
					}
					
					arp = new CArp(ownip,"255.255.255.0","161.246.5.254");

					sql="Select * From HostActive Where IP='"+xx->name+"'";
					db.Open(dbOpenDynaset,_T(sql));
					if(db.m_Mac=="")
					{
						if(arp->isArpVaild() == false)
						{
							db.Close();
							break;
						}
						else
						{
							if(arp->isArpVaild() == true)
							{
								if(arp->arpSendRecv(xx->name,macAddr)!=false)
								{
									arp->getLastMessage();
									db.Edit();
									db.m_Mac=CString(macAddr);
									db.Update();
								}
							}
						}
						
					}
					db.Close();
					CResultAll res;
					res.nIP=xx->name;
					res.DoModal();
					
					break; 
				}
				case ID_Port:
				{
					CPort p;
					p.Oport=xx->name;
					p.DoModal();
					break;
				}
				case ID_Share:
				{
					CShare shr;
					shr.nIP=xx->name;
					shr.DoModal();
					break;
				}
				case ID_RESULT_QUICKRUN:
				{		
					if (QuickCommand!=""){
					CQuickShow *QShowDlg;
					QShowDlg = new CQuickShow;
					QShowDlg->Create(IDD_QUICKSHOW,this);
					QShowDlg->ShowWindow(SW_SHOW);
					QShowDlg->DoCommand(xx->name);
					}else
						MessageBox("No QuickCommand","ERROR",MB_OK);
					break;
				}
				case ID_RESULT_ADDWATCH:
				{
					CAddScript *addscript;
					addscript = new CAddScript;
					addscript->Create(IDD_ADDSCRIPT,this);
					addscript->ShowWindow(SW_SHOW);
					break;
				}
			}
			break;
		}
	}
	
	CDC* pDC;
	pDC = GetDC();
	OnDraw(pDC);

	CScrollView::OnRButtonDown(nFlags, point);
}

void CNetViewView::OnInitialUpdate() 
{
	CScrollView::OnInitialUpdate();

	CSize viewSize;
	//viewSize=GetDocument()->GetViewDocSize();
	viewSize.cx = 800;
	viewSize.cy = 4000;
	SetScrollSizes(MM_TEXT,viewSize);
	   
	// TODO: Add your specialized code here and/or call the base class
	
}

void CNetViewView::OnViewHost() 
{
	// TODO: Add your command handler code here
	CNetViewDoc* pDoc = GetDocument();
	pDoc->all_host.RemoveAll();
	InvalidateRect(NULL,TRUE);
	CData db;
	CSubnet sdb;
	db.Open(dbOpenDynaset,_T("Select * From HostActive"));
	sdb.Open(dbOpenDynaset,_T("Select * From Subnet"));
	while(!db.IsEOF())
	{
		db.Delete();
		db.MoveNext();
		if(db.IsEOF()) break;
	}
	while(!sdb.IsEOF())
	{
		sdb.Delete();
		sdb.MoveNext();
		if(sdb.IsEOF()) break;
	}
	db.Close();
	sdb.Close();
	CNetworkParameter* nParam=new CNetworkParameter;
	nParam->DoModal();
}

void CNetViewView::OnTrace() 
{
	// TODO: Add your command handler code here
	CTracer *traceDlg;
	traceDlg = new CTracer;
	traceDlg->DoModal();
}

void CNetViewView::OnRefresh() 
{
	// TODO: Add your command handler code here
	CNetViewDoc* pDoc = GetDocument();
	pDoc->all_host.RemoveAll();
	InvalidateRect(NULL,TRUE);
	CData db;
	CSubnet sdb;
	db.Open(dbOpenDynaset,_T("Select * From HostActive"));
	sdb.Open(dbOpenDynaset,_T("Select * From Subnet"));
	while(!db.IsEOF())
	{
		db.Delete();
		db.MoveNext();
		if(db.IsEOF()) break;
	}
	while(!sdb.IsEOF())
	{
		sdb.Delete();
		sdb.MoveNext();
		if(sdb.IsEOF()) break;
	}
	db.Close();
	sdb.Close();
}



void CNetViewView::OnGraph() 
{
	// TODO: Add your command handler code here
	CGraph* cg;
	cg = new CGraph();
	cg->DoModal();
}


void CNetViewView::OnFileNew() 
{
	// TODO: Add your command handler code here
	OnViewHost();
}

void CNetViewView::OnExport() 
{
	// TODO: Add your command handler code here
	CData db;
	char opt[2],subnet[3],os[2],nimda[2],snmp[2],share[2];
	db.Open(dbOpenDynaset,_T("Select * From HostActive"));
	if(!db.IsEOF())
	{
		CFileDialog fd(FALSE,NULL,NULL,NULL,"View File (*.vw)|*.vw||");
		if(fd.DoModal()==IDOK)
		{
			CStdioFile file(fd.GetPathName()+".vw",CFile::modeCreate|CFile::modeWrite);
			file.WriteString(Glbstart + "|" + Glbstop + "\n");
			_itoa(opt_type,opt,10);
			file.WriteString(opt);
			_itoa(opt_os,opt,10);
			file.WriteString(opt);
			_itoa(opt_snmp,opt,10);
			file.WriteString(opt);
			_itoa(opt_nimda,opt,10);
			file.WriteString(opt);
			_itoa(opt_share,opt,10);
			file.WriteString(opt);
			file.WriteString("\n");
			while(!db.IsEOF())
			{	
				_itoa(db.m_Id_subnet,subnet,10);
				_itoa(db.m_OS,os,10);
				_itoa(db.m_Nimda,nimda,10);
				_itoa(db.m_Snmp,snmp,10);
				_itoa(db.m_Share,share,10);
				file.WriteString(db.m_IP + "|" + db.m_Host + "|" + subnet + "|" + 
					os + "|" + db.m_OSName + "|" + db.m_Mac +  
					"|" + snmp + "|" + nimda + "|" + share + "|" + db.m_OpenPort + "\n##########\n");
				db.MoveNext();
				if(db.IsEOF()) break;
			}
		}
	}
	else
	{
		MessageBox("Don't have data to export","Warning",MB_OK);
	}
	db.Close();
}

void CNetViewView::OnImport() 
{
	// TODO: Add your command handler code here
	
	CFileDialog fd(TRUE,NULL,NULL,NULL,"View File (*.vw)|*.vw||");
	if(fd.DoModal()==IDOK)
	{
		CStdioFile file(fd.GetPathName(),CFile::modeRead);
		CString msg,buffer;
		CData db;
		CSubnet sdb;
		db.Open(dbOpenDynaset,_T("Select * From HostActive"));
		sdb.Open(dbOpenDynaset,_T("Select * From Subnet"));
		if(!db.IsEOF())
		{
			while(!db.IsEOF())
			{
				db.Delete();
				db.MoveNext();
				if(db.IsEOF()) break;
			}
		}
		if(!sdb.IsEOF())
		{
			while(!sdb.IsEOF())
			{
				sdb.Delete();
				sdb.MoveNext();
				if(sdb.IsEOF()) break;
			}
		}
		int buf,id_sub=0;
		CString subnet_before="",subnet_now="";
		file.ReadString(buffer);
		Glbstart=buffer.Left(buffer.Find('|'));
		Glbstop=buffer.Mid(buffer.Find('|')+1,buffer.GetLength()-(buffer.Find('|')+1));
		file.ReadString(buffer);
		opt_type=atoi(buffer.Left(1));
		opt_os=atoi(buffer.Mid(2,1));
		opt_snmp=atoi(buffer.Mid(3,1));
		opt_nimda=atoi(buffer.Mid(4,1));
		opt_share=atoi(buffer.Mid(5,1));
		while(!feof(file.m_pStream))
		{
			file.ReadString(buffer);
			if(buffer.Left(buffer.Find('|'))!="")
			{
				db.AddNew();
				db.m_IP=buffer.Left(buffer.Find('|'));
				db.m_Host=buffer.Mid(buffer.Find('|')+1,buffer.Find('|',buffer.Find('|')+1)-(buffer.Find('|')+1));
				buf=buffer.Find('|',buffer.Find('|')+1)+1;
				db.m_Id_subnet=atoi(buffer.Mid(buf,buffer.Find('|',buf)-buf));
				buf=buffer.Find('|',buf)+1;
				db.m_OS=atoi(buffer.Mid(buf,buffer.Find('|',buf)-buf));
				buf=buffer.Find('|',buf)+1;
				db.m_OSName=buffer.Mid(buf,buffer.Find('|',buf)-buf);
				buf=buffer.Find('|',buf)+1;
				db.m_Mac=buffer.Mid(buf,buffer.Find('|',buf)-buf);
				buf=buffer.Find('|',buf)+1;
				db.m_Snmp=atoi(buffer.Mid(buf,buffer.Find('|',buf)-buf));
				buf=buffer.Find('|',buf)+1;
				db.m_Nimda=atoi(buffer.Mid(buf,buffer.Find('|',buf)-buf));
				buf=buffer.Find('|',buf)+1;
				db.m_Share=atoi(buffer.Mid(buf,buffer.Find('|',buf)-buf));

				file.ReadString(buffer);
				CString o_port="\n";
				while(buffer.Find("##########")==-1)
				{
					o_port=o_port+buffer+"\n";
					file.ReadString(buffer);
				}
				o_port.TrimRight("\n");
				db.m_OpenPort=o_port;

				subnet_now=db.m_IP.Left(db.m_IP.ReverseFind('.'));
				if((subnet_before=="")||(subnet_before!=subnet_now))
				{
					sdb.AddNew();
					sdb.m_ID=id_sub;
					sdb.m_Subnet=subnet_now+".0";
					sdb.Update();
					id_sub=id_sub+1;
					subnet_before=subnet_now;
				}
				db.Update();
			}
		}
		db.Close();
		CDC* pDC;
		pDC = GetDC();
		OnDraw(pDC);
	}
	
}

void CNetViewView::OnTGraph() 
{
	// TODO: Add your command handler code here
	CGraph* cg;
	cg = new CGraph();
	cg->DoModal();
}

void CNetViewView::OnTRefresh() 
{
	// TODO: Add your command handler code here
	CNetViewDoc* pDoc = GetDocument();
	pDoc->all_host.RemoveAll();
	InvalidateRect(NULL,TRUE);
	CData db;
	CSubnet sdb;
	db.Open(dbOpenDynaset,_T("Select * From HostActive"));
	sdb.Open(dbOpenDynaset,_T("Select * From Subnet"));
	while(!db.IsEOF())
	{
		db.Delete();
		db.MoveNext();
		if(db.IsEOF()) break;
	}
	while(!sdb.IsEOF())
	{
		sdb.Delete();
		sdb.MoveNext();
		if(sdb.IsEOF()) break;
	}
	db.Close();
	sdb.Close();

	CNetworkParameter* nParam=new CNetworkParameter;
	nParam->Create(IDD_ScanParam,this);
	nParam->ShowWindow(SW_HIDE);
	nParam->OnRefresh();
}

void CNetViewView::OnTReport()
{
	// TODO: Add your command handler code here
	OnExport();
}

void CNetViewView::OnTImport() 
{
	// TODO: Add your command handler code here
	OnImport();
}

void CNetViewView::OnOptionAutorefreshNone() 
{
	// TODO: Add your command handler code here
		isSetTimer = FALSE;
	KillTimer(TimerNUM);
}

void CNetViewView::OnOptionAutorefreshSet()
{
	// TODO: Add your command handler code here
	isSetTimer = TRUE;
	
	CTimer *timDlg = new CTimer;
	timDlg->DoModal();
	OnTime();
}

void CNetViewView::OnUpdateOptionAutorefreshNone(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
		if(isSetTimer==FALSE)
		pCmdUI->SetCheck(TRUE);
	else
		pCmdUI->SetCheck(FALSE);
}


void CNetViewView::OnUpdateOptionAutorefreshSet(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	if(isSetTimer==TRUE)
		pCmdUI->SetCheck(TRUE);
	else
		pCmdUI->SetCheck(FALSE);
}

void CNetViewView::OnOptionAddscript() 
{
	// TODO: Add your command handler code here
	CAddScript *addscript;
	addscript = new CAddScript;
	addscript->Create(IDD_ADDSCRIPT,this);
	addscript->ShowWindow(SW_SHOW);
	isSetTimer = FALSE;
}

void CNetViewView::OnActivateView(BOOL bActivate, CView* pActivateView, CView* pDeactiveView) 
{
	// TODO: Add your specialized code here and/or call the base class
	if(bActivate)
	{
		if(first==1)
		{
			CDC* pDC;
			pDC=GetDC();
			OnDraw(pDC);
			first=0;
		}
	}
	CScrollView::OnActivateView(bActivate, pActivateView, pDeactiveView);
}

void CNetViewView::OnTime()
{
	SetTimer(TimerNUM,1000,NULL);
}

void CNetViewView::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
		sec++;
		if (sec==60) {
			sec = 0;
			min++;
			if (min==60) {
				min = 0;
				hour++;
			}
		}
		if (sec == 20){
			OnTRefresh();
			sec =0;
			min =0;
			hour =0;
		}
	CScrollView::OnTimer(nIDEvent);
}

void CNetViewView::OnOptionClearstatisticdatabase() 
{
	// TODO: Add your command handler code here
	CStat dbs;
			dbs.Open(dbOpenDynaset,_T("Select * From Stat"));
			while(!dbs.IsEOF())
			{
				dbs.Delete();
				dbs.MoveNext();
				if(dbs.IsEOF()) break;
			}
			dbs.Close();
}
