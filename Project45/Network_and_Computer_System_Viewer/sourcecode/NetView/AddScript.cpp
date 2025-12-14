// AddScript.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "AddScript.h"
#include "Redirect.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CString QuickCommand;
/////////////////////////////////////////////////////////////////////////////
// CAddScript dialog


CAddScript::CAddScript(CWnd* pParent /*=NULL*/)
	: CDialog(CAddScript::IDD, pParent)
{
	CString buf;
	//{{AFX_DATA_INIT(CAddScript)
	m_Command = _T("");
	
	//}}AFX_DATA_INIT

	m_Quick = _T(QuickCommand);
	
}


void CAddScript::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAddScript)
	DDX_Control(pDX, IDC_EDIT2, m_Output);
	DDX_Control(pDX, IDC_LIST1, m_List);
	DDX_Text(pDX, IDC_EDIT1, m_Command);
	DDX_Text(pDX, IDC_EDIT3, m_Quick);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CAddScript, CDialog)
	//{{AFX_MSG_MAP(CAddScript)
	ON_BN_CLICKED(IDC_ADD, OnAdd)
	ON_BN_CLICKED(IDC_EXE, OnExe)
	ON_BN_CLICKED(IDC_ADDQUICKRUN, OnAddquickrun)
	ON_BN_CLICKED(IDC_DEL, OnDel)
	ON_BN_CLICKED(IDCANCEL, OnClose)
	ON_WM_CREATE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAddScript message handlers

void CAddScript::OnAdd() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (m_Command != "") {
	m_List.AddString(m_Command);
	m_Command = "";
	UpdateData(FALSE);
	}
}

void CAddScript::OnExe() 
{
	// TODO: Add your control notification handler code here
	CString buffer;
	CString command = ".\\Module\\";
	if (m_List.GetCurSel() != LB_ERR) {
		m_List.GetText(m_List.GetCurSel(),buffer);
		if (buffer != "") {
		command = command + buffer;
		CRedirect Redirect(command, &m_Output);
		Redirect.Run();
		Redirect.Stop();
		}
	}
}

void CAddScript::OnAddquickrun() 
{
	// TODO: Add your control notification handler code here
	CString buffer;
	if (m_List.GetCurSel() != LB_ERR) {
		m_List.GetText(m_List.GetCurSel(),buffer);
		if (buffer != "") {
			m_Quick = buffer;
			QuickCommand = ".\\Module\\" + buffer;
			UpdateData(FALSE);
		}
	}

}

void CAddScript::OnDel() 
{
	// TODO: Add your control notification handler code here
	if (m_List.GetCurSel() != LB_ERR) {
		m_List.DeleteString(m_List.GetCurSel());
	}
}


void CAddScript::OnClose() 
{
	// TODO: Add your control notification handler code here
	int count;
	CString buf;
	CStdioFile file("addlist.lis",CFile::modeCreate|CFile::modeWrite);
	count = m_List.GetCount();
	//if(QuickCommand!="")
	//	file.WriteString(QuickCommand+"\n");
	
	for(int j=0;j<count;j++){
	m_List.GetText(j,buf);
	if(buf!=""){
		file.WriteString(buf+"\n");
		buf="";
	}
	}
	
	CDialog::OnOK();
}




BOOL CAddScript::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
		CString buf;
	CStdioFile file("addlist.lis",CFile::modeRead);
	//file.ReadString(QuickCommand);
	//m_Quick = QuickCommand;
	file.ReadString(buf);
	if(buf!="")
		m_List.AddString(buf);
	file.ReadString(buf);
	if(buf!="")
		m_List.AddString(buf);
	file.ReadString(buf);
	if(buf!="")
		m_List.AddString(buf);
	//
	UpdateData(FALSE);
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
