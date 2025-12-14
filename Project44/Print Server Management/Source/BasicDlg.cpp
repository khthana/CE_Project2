// BasicDlg.cpp : implementation file
//

//#include "winuser.h"
#include "WINSPOOL.H"
#include "stdafx.h"
#include "Basic.h"
#include "BasicDlg.h"
#include "NetInfo.h"
#include <lm.h>
#include<iads.h>
#include<adshlp.h>


#include "LimitDlg.h"
#include "SetCreditDlg.h"
#include "AddcreditDlg.h"
#include "ChargeDlg.h"
#include "SetBalanceDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CBasicDlg dialog

CBasicDlg::CBasicDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CBasicDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CBasicDlg)
	m_message = _T("");
	m_szServer = _T("");
	//}}AFX_DATA_INIT
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CBasicDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CBasicDlg)
	DDX_Control(pDX, IDC_LISTBOX, m_clistbox);
	DDX_Text(pDX, IDC_STATIC_MESSAGE, m_message);
	DDV_MaxChars(pDX, m_message, 40);
	DDX_LBString(pDX, IDC_LISTBOX, m_szServer);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CBasicDlg, CDialog)
	//{{AFX_MSG_MAP(CBasicDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(ID_LIMIT, OnLimit)
	ON_BN_CLICKED(ID_ADD, OnAdd)
	ON_BN_CLICKED(ID_CHARGE, OnCharge)
	ON_BN_CLICKED(ID_HISTORY, OnHistory)
	ON_BN_CLICKED(ID_EXIT, OnExit)
	ON_BN_CLICKED(ID_SET, OnSet)
	ON_LBN_SELCHANGE(IDC_LISTBOX, OnSelchangeListbox)
	ON_LBN_DBLCLK(IDC_LISTBOX, OnDblclkListbox)
	ON_BN_CLICKED(ID_SETBALANCE, OnSetbalance)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CBasicDlg message handlers

BOOL CBasicDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	
		// Create a list of NET_DISPLAY_USER structures
			USER_LIST* pUsers = new USER_LIST;
			// Get the information
			DWORD dwResult = ssl_net::CNetInfo::GetUserInfo (pUsers, m_szServer);
			if (ERROR_SUCCESS == dwResult) {
				// Process the results
				POSITION pos = pUsers->GetHeadPosition ();
				while (NULL != pos) {
					NET_DISPLAY_USER ndu = pUsers->GetNext (pos);
					CString szName, szComment, szFlags, szFullName, szUserID;
					szName.Format ("%S", ndu.usri1_name);
					szComment.Format ("%S", ndu.usri1_comment);
					szFlags.Format ("%d", ndu.usri1_flags);
					szFullName.Format ("%S", ndu.usri1_full_name);
					szUserID.Format ("%d", ndu.usri1_user_id);
					m_clistbox.AddString(szName);
					//m_clistbox.AddString(szFullName);
					/*m_clistbox.AddString(szComment);
					m_clistbox.AddString(szFlags);
					m_clistbox.AddString(szFullName);
					m_clistbox.AddString(szUserID);*/
				}
			}
			else {
				// Handle any errors
				CString szErrMsg = ssl_net::CNetInfo::FormatMessage (dwResult);
				AfxMessageBox (szErrMsg);
			}
			delete pUsers;
      ssl_net::CNetInfo::CleanUp ();
		// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CBasicDlg::OnPaint() 
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

HCURSOR CBasicDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CBasicDlg::OnLimit() 
{
	CLimitDlg limitdlg;
	limitdlg.DoModal();
	
}

void CBasicDlg::OnAdd() 
{
	CAddcreditDlg addcreditdlg;
	addcreditdlg.DoModal();
	
}

void CBasicDlg::OnCharge() 
{
	CChargeDlg chargedlg;
	chargedlg.DoModal();
	
}

void CBasicDlg::OnHistory() 
{
	/*CString msg;
	CPrintDialog pdlg(TRUE,PD_ALLPAGES | PD_SELECTION | 
					PD_USEDEVMODECOPIESANDCOLLATE | PD_NOPAGENUMS);
	if (pdlg.DoModal()==IDOK){
		MessageBox(pdlg.GetDeviceName() );
		MessageBox(pdlg.GetDriverName() );
		MessageBox(pdlg.GetPortName() );
		/*msg.Format("%d copies",pdlg.GetCopies() );
		MessageBox(msg);
		msg.Format("%d Frompage",pdlg.GetFromPage() );
		MessageBox(msg);
		msg.Format("%d Topage",pdlg.GetToPage() );
		MessageBox(msg);*/
		/*if (pdlg.PrintCollate() ){
			msg.Format("%d copies",pdlg.GetCopies() );
			MessageBox(msg);		
		}
		else {
			LPDEVMODE devmode = pdlg.GetDevMode();
			msg.Format("%d copies",devmode->dmCopies);
			MessageBox(msg);
		}
		LPDEVMODE devmode = pdlg.GetDevMode();
		msg.Format("Media: %d ",devmode->dmFormName);
		MessageBox(msg);
	}*/
}

void CBasicDlg::OnExit() 
{
	/*CString msg;
	CPrintInfo pInfo;
	msg.Format("GetMinPage: %d",pInfo.GetMinPage() );
	MessageBox(msg);
	msg.Format("GetMaxPage: %d",pInfo.GetMaxPage() );
	MessageBox(msg);
	msg.Format("GetFromPage: %d",pInfo.GetFromPage() );
	MessageBox(msg);
	msg.Format("GetToPage: %d",pInfo.GetToPage() );
	MessageBox(msg);
	msg.Format("Strpage: %d",pInfo.m_strPageDesc);
	MessageBox(msg);
	msg.Format("DocObject: %d",pInfo.m_bDocObject = TRUE);
	MessageBox(msg);
	msg.Format("UserData: %d",pInfo.m_lpUserData);
	MessageBox(msg);*/
	CDialog::DestroyWindow();	
}

void CBasicDlg::OnSet() 
{
	CSetCreditDlg setcreditdlg;
	setcreditdlg.DoModal();
/*IADsPrintQueueOperations *pqo;
IADsPrintJob *pJob;
HRESULT hr ;
LPWSTR adsPath =L"WinNT://pond/Printers";
hr = ADsGetObject(adsPath, 
                  IID_IADsPrintQueueOperations, 
                  (void**)&pqo);
if (FAILED(hr)) exit(hr);

IADsCollection *pColl;
hr = pqo->PrintJobs(&pColl);

// now to enumerate the print jobs. Code omitted.

IUnknown *pUnk = NULL;
hr = pColl->get__NewEnum(&pUnk);
pColl->Release();
if (FAILED(hr) ) exit(hr);

IEnumVARIANT *pEnum;
hr = pUnk->QueryInterface(IID_IEnumVARIANT,(void**)&pEnum);
pUnk->Release();
if (FAILED(hr)) exit(hr);

// Now Enumerate
BSTR bstr;
VARIANT var;
ULONG lFetch;
IDispatch *pDisp;

VariantInit(&var);
hr = pEnum->Next(1, &var, &lFetch);
while(hr == S_OK)
{
    if (lFetch == 1)    
    {
        pDisp = V_DISPATCH(&var);
        pDisp->QueryInterface(IID_IADsPrintJob, (void**)&pJob);

        pJob->get_HostPrintQueue(&bstr);
        printf("HostPrintQueue: %S\n",bstr);
        SysFreeString(bstr);

        pJob->get_Description(&bstr);
        printf("Print job name: %S\n",bstr);
        SysFreeString(bstr);

        pJob->get_User(&bstr);
        printf("Requester: %S\n",bstr);
        SysFreeString(bstr);

        pJob->Release();
    }
    VariantClear(&var);
    pDisp=NULL;
    hr = pEnum->Next(1, &var, &lFetch);
};

hr = pEnum->Release();

hr = pqo->Release();*/

		
	
}

void CBasicDlg::OnSetbalance() 
{
	CSetBalanceDlg setbalancedlg;
	setbalancedlg.DoModal();
	
}

void CBasicDlg::OnSelchangeListbox() 
{
	UpdateData(TRUE);
	m_message = m_szServer;
	UpdateData(FALSE);
	
}

void CBasicDlg::OnDblclkListbox() 
{
	UpdateData(TRUE);
	MessageBox(m_szServer);
}








