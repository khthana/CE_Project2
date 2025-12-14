// Share.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "Share.h"
#include "Redirect.h"
#include "WWaitTarget.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CShare dialog


CShare::CShare(CWnd* pParent /*=NULL*/)
	: CDialog(CShare::IDD, pParent)
{
	//{{AFX_DATA_INIT(CShare)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CShare::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CShare)
	DDX_Control(pDX, IDC_EDIT1, m_Edit1);
	DDX_Control(pDX, IDC_Share, m_clist);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CShare, CDialog)
	//{{AFX_MSG_MAP(CShare)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CShare message handlers

BOOL CShare::OnInitDialog() 
{
	CDialog::OnInitDialog();

	CWWaitTarget wait;
	wait.Show();

	LVITEM item;
	CImageList *imgnormal;
	CString folder,oldf="",nfd,buf,temp;
	int length,fstart=0,fstop=0;
	
	imgnormal=new CImageList();
	imgnormal->Create(32,32,ILC_MASK,2,0);
	imgnormal->Add(AfxGetApp()->LoadIcon(IDI_ICON6));

	m_clist.SetImageList(imgnormal,LVSIL_SMALL);
	// TODO: Add extra initialization here
	
	m_Edit1.SetWindowText("");
	buf = ".\\bin\\nimda\\nimda.exe -h " + nIP;
	CRedirect Redirect(buf, &m_Edit1);
	Redirect.Run();
	m_Edit1.GetWindowText(temp);
	Redirect.Stop();
	nfd="\\\\"+nIP+'\\';
	length=nfd.GetLength();
	if(temp.Find(nfd,fstop)!=-1)
	{
		fstart=temp.Find(nfd,fstop)+length;
		fstop=temp.Find('\\',fstart);
		folder=temp.Mid(fstart,fstop);
		int i=0;
		LPTSTR ptr;
		while(temp.Find("Could Not Connect",fstop+1)>temp.Find(nfd,fstop+1))
		{
			fstart=temp.Find(nfd,fstop)+length;
			fstop=temp.Find('\\',fstart);
			folder=temp.Mid(fstart,fstop-fstart);
			ptr=folder.LockBuffer();
			if(folder!=oldf)
			{
				item.mask=LVIF_TEXT|LVIF_IMAGE;
				item.iItem=i;
				item.iSubItem=0;
				item.iImage=0;
				item.pszText=ptr;
				m_clist.InsertItem(&item);
				folder.UnlockBuffer();
				i=i+1;
			}
			oldf=folder;
		}
	}
	else
	{
		MessageBox("No Share Folder","Result",MB_OK);
		this->EndDialog(0);
	}

	wait.Close();
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
