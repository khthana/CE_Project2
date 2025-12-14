// NewSigDlg.cpp : implementation file
//

#include "stdafx.h"
#include "IsagSign.h"
#include "NewSigDlg.h"
#include "WaitDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CNewSigDlg dialog


CNewSigDlg::CNewSigDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CNewSigDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CNewSigDlg)
	m_name = _T("");
	m_surname = _T("");
	m_usepic = FALSE;
	//}}AFX_DATA_INIT
	m_picfile = "";
}


void CNewSigDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CNewSigDlg)
	DDX_Control(pDX, IDC_SIGSIZE, m_ctrlsigsize);
	DDX_Control(pDX, IDC_TXTSIGPIC, m_txtsigpic);
	DDX_Control(pDX, IDC_BROWSE, m_browsebutt);
	DDX_Control(pDX, IDC_THUMNAIL, m_ctrlthum);
	DDX_Control(pDX, IDC_SURNAME, m_ctrlsurname);
	DDX_Control(pDX, IDC_NAME, m_ctrlname);
	DDX_Text(pDX, IDC_NAME, m_name);
	DDX_Text(pDX, IDC_SURNAME, m_surname);
	DDX_Check(pDX, IDC_USEPIC, m_usepic);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CNewSigDlg, CDialog)
	//{{AFX_MSG_MAP(CNewSigDlg)
	ON_BN_CLICKED(IDC_BROWSE, OnBrowse)
	ON_BN_CLICKED(IDC_USEPIC, OnUsepic)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CNewSigDlg message handlers

BOOL CNewSigDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
		
	m_ctrlname.SetLimitText(15);
	m_ctrlsurname.SetLimitText(15);
	CheckDlgButton(IDC_MD5, 1);
	m_ctrlsigsize.SetCurSel(2);
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CNewSigDlg::OnOK() 
{	CString picfilename = "";
	bool result;
	
	// Get Algid and Siglen
	if (IsDlgButtonChecked(IDC_MD4)) m_algid = 0;
	else if (IsDlgButtonChecked(IDC_MD5)) m_algid = 1;
	else m_algid = 2;
	m_sigsize = m_ctrlsigsize.GetCurSel();
	
	// Check for Blank
	UpdateData(TRUE);
	if (m_usepic) picfilename = m_picfile;
	if (m_name.GetLength()==0) AfxMessageBox("User name cannot be blanked");
	else if (m_surname.GetLength()==0) AfxMessageBox("Surname cannot be blanked");
		
	// Check user
	else 
	{	CWaitDlg waitdlg;
		
		this->ShowWindow(SW_HIDE);
		waitdlg.Create(IDD_WAIT, this);
		waitdlg.UpdateWindow();
		BeginWaitCursor();
		result = theApp.addUser(m_name, m_surname, m_algid, m_sigsize, picfilename);
		EndWaitCursor();
		waitdlg.DestroyWindow();
		this->ShowWindow(SW_RESTORE);
		if (result == true) CDialog::OnOK();
		else AfxMessageBox("Can't add user");
	}
}

void CNewSigDlg::OnBrowse() 
{	CString picfilename;
	CFileDialog fd(TRUE, NULL, NULL, NULL, "Bitmap (*.bmp)|*.bmp||");

	if (fd.DoModal()==IDOK)
	{	HBITMAP hpic = NULL;
		picfilename = fd.GetPathName();

		hpic=(HBITMAP)LoadImage(NULL, picfilename, IMAGE_BITMAP,
			280, 80, LR_LOADFROMFILE);
		if (hpic == NULL)
		{	AfxMessageBox("Not a picture file");
		}
		else
		{	m_ctrlthum.SetBitmap(hpic);
			m_picfile = picfilename;
		}

	}
}

void CNewSigDlg::OnUsepic() 
{	UpdateData();
	if (m_usepic)
	{	m_txtsigpic.EnableWindow(TRUE);
		m_browsebutt.EnableWindow(TRUE);
		m_ctrlthum.EnableWindow(TRUE);
	}
	else
	{	m_txtsigpic.EnableWindow(FALSE);
		m_browsebutt.EnableWindow(FALSE);
		m_ctrlthum.EnableWindow(FALSE);
	}
}
