/*
	TcpScanAddServiceDlg.cpp
	Luca Piergentili, 06/08/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include "TcpScanAddServiceDlg.h"

BEGIN_MESSAGE_MAP(CTcpScanAddServiceDlg,CDialog)
	ON_BN_CLICKED(IDOK,OnButtonAdd)
	ON_BN_CLICKED(IDCANCEL,OnButtonCancel)
END_MESSAGE_MAP()

/*
	DoDataExchange()
*/
void CTcpScanAddServiceDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);

	DDX_Text(pDX,IDC_EDIT_SERVICENAME,*m_pstrServiceName);
	DDX_Text(pDX,IDC_EDIT_PORTNUMBER,*m_pnPortNumber);
	DDX_Text(pDX,IDC_EDIT_PROTOCOLNAME,*m_pstrProtocolName);
	DDX_Text(pDX,IDC_EDIT_COMMENT,*m_pstrComment);
}

/*
	CTcpScanAddServiceDlg()
*/
CTcpScanAddServiceDlg::CTcpScanAddServiceDlg(CWnd* pParent,CString& pServiceName,UINT& pPortNumber,CString& pProtocolName,CString& pComment) : CDialog(CTcpScanAddServiceDlg::IDD,pParent)
{
	m_pstrServiceName = &pServiceName;
	m_pnPortNumber = &pPortNumber;
	m_pstrProtocolName = &pProtocolName;
	m_pstrComment = &pComment;
}

/*
	OnInitDialog()
*/
BOOL CTcpScanAddServiceDlg::OnInitDialog(void)
{
	// chiama il gestore originale
	CDialog::OnInitDialog();

	// icona di default
	m_hIcon = AfxGetApp()->LoadIcon(IDI_TCPSCAN);
	SetIcon(m_hIcon,TRUE);
	SetIcon(m_hIcon,FALSE);

	SetDlgItemText(IDC_EDIT_PROTOCOLNAME,*m_pstrProtocolName);

	return(TRUE);
}

/*
	OnButtonAdd()
*/
void CTcpScanAddServiceDlg::OnButtonAdd(void)
{
	BOOL flag = TRUE;

	UpdateData(TRUE);

	if(m_pstrServiceName->GetLength() <= 0)
	{
		AfxMessageBox("Must enter a valid service name.",MB_ICONWARNING);
		flag = FALSE;
	}
	
	if(*m_pnPortNumber <= 0 || *m_pnPortNumber >= UINT_MAX)
	{
		AfxMessageBox("Must enter a valid port number.",MB_ICONWARNING);
		flag = FALSE;
	}

	if(m_pstrComment->GetLength() <= 0)
		*m_pstrComment = " ";

	if(flag)
		EndDialog(IDOK);
}

/*
	OnButtonCancel()
*/
void CTcpScanAddServiceDlg::OnButtonCancel(void)
{
	EndDialog(IDCANCEL);
}
