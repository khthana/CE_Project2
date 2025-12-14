// DirDlg.cpp : implementation file
//

#include "stdafx.h"
#include "first.h"
#include "DirDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// DirDlg dialog


DirDlg::DirDlg(CWnd* pParent /*=NULL*/)
	: CDialog(DirDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(DirDlg)
	m_data = _T("");
	//}}AFX_DATA_INIT
}


void DirDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(DirDlg)
	DDX_Control(pDX, IDC_SEL_DRIVE, m_combo);
	DDX_Control(pDX, IDC_DIR, m_dir);
	DDX_CBString(pDX, IDC_SEL_DRIVE, m_data);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(DirDlg, CDialog)
	//{{AFX_MSG_MAP(DirDlg)
	ON_LBN_DBLCLK(IDC_DIR, OnDblclkDir)
	ON_CBN_CLOSEUP(IDC_SEL_DRIVE, OnCloseupSelDrive)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// DirDlg message handlers

BOOL DirDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	extern CString prog_path;
	//start at directory which program run
	::SetCurrentDirectory(prog_path);
	//show file and folder in curent directory
	m_dir.Dir(0x0000,"*.bmp");
	m_dir.Dir(0x0010,"*");
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void DirDlg::OnDblclkDir() 
{
	CString buffer;

	//get filename which is doubleclicked
	m_dir.GetText(m_dir.GetCurSel(),buffer);
	
	//if filename is directory
	if (buffer.Find("[",0)!= -1)
	{
		buffer.Replace("[","");
		buffer.Replace("]","");

		//if up
		if (buffer.Compare("..")==0)
		{
			::SetCurrentDirectory("..");
			m_dir.ResetContent();
			m_dir.Dir(0x0000,"*.bmp");
			m_dir.Dir(0x0010,"*");
		}
		//if go into
		else
		{
			::SetCurrentDirectory(".\\"+buffer);	
			m_dir.ResetContent();
			m_dir.Dir(0x0000,"*.bmp");
			m_dir.Dir(0x0010,"*");
		}
	}	
}

void DirDlg::OnOK() 
{
	extern CString pic_path;
	char temp[60];
	//get path which is selected
	::GetCurrentDirectory(60,temp);
	pic_path=temp;
	//AfxMessageBox(temp);	
	CDialog::OnOK();
}

void DirDlg::OnCancel() 
{
	extern CString prog_path;
	//set to start path
	::SetCurrentDirectory(prog_path);
	
	CDialog::OnCancel();
}

void DirDlg::OnCloseupSelDrive() 
{
	int index;
	index = m_combo.GetCurSel();
	m_combo.GetLBText(index,m_data);
	::SetCurrentDirectory(m_data+"\\");	
	m_dir.ResetContent();
	m_dir.Dir(0x0000,"*.bmp");
	m_dir.Dir(0x0010,"*");
}


