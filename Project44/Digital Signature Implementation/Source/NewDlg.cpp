// NewDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Signature.h"
#include "NewDlg.h"
#include "WaitDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CNewDlg dialog


CNewDlg::CNewDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CNewDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CNewDlg)
	m_name = _T("");
	m_surname = _T("");
	m_usepic = FALSE;
	//}}AFX_DATA_INIT
}


void CNewDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CNewDlg)
	DDX_Control(pDX, IDC_BROWSE, m_browsebutt);
	DDX_Control(pDX, IDC_SURNAME, m_ctrlsurname);
	DDX_Control(pDX, IDC_NAME, m_ctrlname);
	DDX_Control(pDX, IDC_TXTPIC, m_txtsigpic);
	DDX_Control(pDX, IDC_THUMNAIL, m_ctrlthum);
	DDX_Text(pDX, IDC_NAME, m_name);
	DDV_MaxChars(pDX, m_name, 15);
	DDX_Text(pDX, IDC_SURNAME, m_surname);
	DDV_MaxChars(pDX, m_surname, 15);
	DDX_Check(pDX, IDC_USEPIC, m_usepic);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CNewDlg, CDialog)
	//{{AFX_MSG_MAP(CNewDlg)
	ON_BN_CLICKED(IDC_USEPIC, OnUsepic)
	ON_BN_CLICKED(IDC_BROWSE, OnBrowse)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CNewDlg message handlers

BOOL CNewDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
		
	m_ctrlname.SetLimitText(15);
	m_ctrlsurname.SetLimitText(15);
	CheckDlgButton(IDC_MD5, 1);
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CNewDlg::OnOK() 
{
	// TODO: Add extra validation here
	CString picfilename = "";
	bool result;
	
	// Get Algid and Siglen
	if (IsDlgButtonChecked(IDC_MD4))
		m_algid = 0;
	else 
		if (IsDlgButtonChecked(IDC_MD4))
			m_algid = 1;
		else 
			m_algid = 2;
	
	// Check for Blank
	UpdateData(TRUE);
	if (m_usepic) 
		picfilename = m_picfile;
	if (m_name.GetLength()==0) 
		AfxMessageBox("User name cannot be blanked");
	else 
		if (m_surname.GetLength()==0) 
			AfxMessageBox("Surname cannot be blanked");

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
		if (result == true) 
			CDialog::OnOK();
		else 
			AfxMessageBox("Can't add user");
	}
}

void CNewDlg::OnBrowse() 
{
	// TODO: Add your control notification handler code here
	CString picfilename;
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

void CNewDlg::OnUsepic() 
{	
	UpdateData();
	if (m_usepic)
	{	
		m_txtsigpic.EnableWindow(TRUE);
		m_browsebutt.EnableWindow(TRUE);
		m_ctrlthum.EnableWindow(TRUE);
	}
	else
	{	
		m_txtsigpic.EnableWindow(FALSE);
		m_browsebutt.EnableWindow(FALSE);
		m_ctrlthum.EnableWindow(FALSE);
	}
}
