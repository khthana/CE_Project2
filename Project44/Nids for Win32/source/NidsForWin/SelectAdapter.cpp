// SelectAdapter.cpp : implementation file
//

#include "stdafx.h"
#include "NidsForWin.h"
#include "SelectAdapter.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSelectAdapter dialog


CSelectAdapter::CSelectAdapter(CWnd* pParent /*=NULL*/)
	: CDialog(CSelectAdapter::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSelectAdapter)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CSelectAdapter::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSelectAdapter)
	DDX_Control(pDX, IDC_LIST_ADAP, m_List_Adapter);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSelectAdapter, CDialog)
	//{{AFX_MSG_MAP(CSelectAdapter)
	ON_NOTIFY(NM_DBLCLK, IDC_LIST_ADAP, OnDblclkListAdap)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSelectAdapter message handlers
BOOL CSelectAdapter::OnInitDialog()
{
	CDialog::OnInitDialog();
	ShowAdapterList();

	return TRUE;

}

void CSelectAdapter::OnCancel() 
{
	// TODO: Add extra cleanup here
	
	CDialog::OnCancel();
}

void CSelectAdapter::OnOK() 
{
	if (NumberAdapter = m_List_Adapter.GetSelectionMark() != -1 )
		NumberAdapter = m_List_Adapter.GetSelectionMark();
	// TODO: Add extra validation here
	
	CDialog::OnOK();
}

void CSelectAdapter::ShowAdapterList()
{
	LV_COLUMN column;
	column.mask=LVCF_FMT|LVCF_SUBITEM|LVCF_TEXT|LVCF_WIDTH;
	column.fmt=LVCFMT_CENTER;

	column.pszText="Network Card";
	column.iSubItem=0;
	column.cx=250;
	m_List_Adapter.InsertColumn(0,&column);

	column.pszText="IP Address";
	column.iSubItem=1;
	column.cx=110;
	m_List_Adapter.InsertColumn(1,&column);

	int i=0;
	LV_ITEM item;

	for(int Count = Device.GetNumDevice(); Count > 0 ; Count--)
	{
		CString Temp;
		char buffer[60];
		int IP_Field0,IP_Field1,IP_Field2,IP_Field3;
		Device.GetNameDevice(Count,Temp,IP_Field0,IP_Field1,IP_Field2,IP_Field3);
		item.mask=LVIF_TEXT;//|LVIF_IMAGE;
		item.iItem=Count;
		item.iSubItem=0;
		for(int a = 0 ; ((a < Temp.GetLength()) && (Temp[a] != -52)); a++)
			buffer[a] = Temp[a];
		buffer[a] = '\0';
		item.pszText=buffer;
 		i=m_List_Adapter.InsertItem(&item);

		item.mask=LVIF_TEXT;//|LVIF_IMAGE;
		item.iItem=Count;
		item.iSubItem=1;
		sprintf(buffer,"%d\.%d\.%d\.%d",IP_Field0,IP_Field1,IP_Field2,IP_Field3);
		item.pszText=buffer;
 		i=m_List_Adapter.SetItem(&item);
		
	}

}

void CSelectAdapter::OnDblclkListAdap(NMHDR* pNMHDR, LRESULT* pResult) 
{
	NumberAdapter = m_List_Adapter.GetSelectionMark();
	// TODO: Add your control notification handler code here
	
	*pResult = 0;

	CDialog::OnOK();

//	SendMessage(WM_CLOSE,0,0);
}

int CSelectAdapter::GetNumAdapSelect()
{
	return NumberAdapter;

}
