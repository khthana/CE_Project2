/*
	TcpScanAddUrlDlg.cpp
	Luca Piergentili, 06/08/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include "TcpScanAddUrlDlg.h"

BEGIN_MESSAGE_MAP(CTcpScanAddUrlDlg,CDialog)
	ON_BN_CLICKED(IDOK,OnButtonAdd)
	ON_BN_CLICKED(IDCANCEL,OnButtonCancel)
END_MESSAGE_MAP()

/*
	DoDataExchange()
*/
void CTcpScanAddUrlDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);

	DDX_Text(pDX,IDC_EDIT_URL,*m_pstrURL);
	DDX_Text(pDX,IDC_EDIT_COMMENT,*m_pstrComment);
}

/*
	CTcpScanAddUrlDlg()
*/
CTcpScanAddUrlDlg::CTcpScanAddUrlDlg(CWnd* pParent,CString& pURL,int nMaxURL,CString& pComment,int nMaxComment) : CDialog(CTcpScanAddUrlDlg::IDD,pParent)
{
	m_pstrURL = &pURL;
	m_nMaxURL = nMaxURL;
	m_pstrComment = &pComment;
	m_nMaxComment = nMaxComment;
}

/*
	OnInitDialog()
*/
BOOL CTcpScanAddUrlDlg::OnInitDialog(void)
{
	// chiama il gestore originale
	CDialog::OnInitDialog();

	// icona di default
	m_hIcon = AfxGetApp()->LoadIcon(IDI_TCPSCAN);
	SetIcon(m_hIcon,TRUE);
	SetIcon(m_hIcon,FALSE);

	return(TRUE);
}

/*
	OnButtonAdd()
*/
void CTcpScanAddUrlDlg::OnButtonAdd(void)
{
	BOOL flag = TRUE;

	UpdateData(TRUE);

	if(m_pstrURL->GetLength() <= 0 || m_pstrURL->GetLength() >= m_nMaxURL)
	{
		CString c;
		c.Format("Must enter valid URL with a length between %d and %d.",1,m_nMaxURL);
		AfxMessageBox(c,MB_ICONWARNING);
		flag = FALSE;
	}

	if(m_pstrComment->GetLength() <= 0)
		*m_pstrComment = " ";
	else if(m_pstrComment->GetLength() >= m_nMaxComment)
	{
		CString c;
		c.Format("Comment's length must be between %d and %d.",1,m_nMaxComment);
		AfxMessageBox(c,MB_ICONWARNING);
		flag = FALSE;
	}

	if(flag)
		EndDialog(IDOK);
}

/*
	OnButtonCancel()
*/
void CTcpScanAddUrlDlg::OnButtonCancel(void)
{
	EndDialog(IDCANCEL);
}
