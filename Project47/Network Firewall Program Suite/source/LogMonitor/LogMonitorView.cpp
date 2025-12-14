// LogMonitorView.cpp : implementation of the CLogMonitorView class
//

#include "stdafx.h"
#include "LogMonitor.h"

#include "LogMonitorSet.h"
#include "LogMonitorDoc.h"
#include "LogMonitorView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLogMonitorView

IMPLEMENT_DYNCREATE(CLogMonitorView, CRecordView)

BEGIN_MESSAGE_MAP(CLogMonitorView, CRecordView)
	//{{AFX_MSG_MAP(CLogMonitorView)
	ON_BN_CLICKED(IDC_BUTTON_DELETE, OnButtonDelete)
	ON_BN_CLICKED(IDC_BUTTON_PREVIOUS, OnButtonPrevious)
	ON_BN_CLICKED(IDC_BUTTON_NEXT, OnButtonNext)
	ON_WM_TIMER()
	ON_LBN_SELCHANGE(IDC_LIST_TYPE, OnSelchangeListType)
	ON_LBN_SELCHANGE(IDC_LIST_TYPE_SUB, OnSelchangeListTypeSub)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLogMonitorView construction/destruction

CLogMonitorView::CLogMonitorView()
	: CRecordView(CLogMonitorView::IDD)
{
	//{{AFX_DATA_INIT(CLogMonitorView)
	m_pSet = NULL;
	m_sPageNo = _T("");
	m_sNumberOfLog = _T("");
	iPageNumber = 0;
	iRecordPerPage = 15;
	//}}AFX_DATA_INIT
	// TODO: add construction code here

}

CLogMonitorView::~CLogMonitorView()
{
}

void CLogMonitorView::DoDataExchange(CDataExchange* pDX)
{
	CRecordView::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLogMonitorView)
	DDX_Control(pDX, IDC_LIST_TYPE_SUB, m_cListTypeSub);
	DDX_Control(pDX, IDC_LIST_TYPE, m_cListType);
	DDX_Control(pDX, IDC_LIST_LOG, m_cListLog);
	DDX_Text(pDX, IDC_STATIC_PAGE_NO, m_sPageNo);
	DDX_Text(pDX, IDC_STATIC_NUMBER_OF_LOG, m_sNumberOfLog);
	//}}AFX_DATA_MAP
}

BOOL CLogMonitorView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CRecordView::PreCreateWindow(cs);
}

void CLogMonitorView::OnInitialUpdate()
{
	m_pSet = &GetDocument()->m_logMonitorSet;
	CRecordView::OnInitialUpdate();
	GetParentFrame()->RecalcLayout();
	ResizeParentToFit();
// Add Column to list Control server rule
	m_cListLog.InsertColumn(0, "Log No.",LVCFMT_LEFT , 50, 0);
	m_cListLog.InsertColumn(1, "Attack Destination",LVCFMT_LEFT , 100, 1);
	m_cListLog.InsertColumn(2, "Attack Source",LVCFMT_LEFT ,100, 2);
	m_cListLog.InsertColumn(3, "Attack Type",LVCFMT_LEFT , 100, 3);
	m_cListLog.InsertColumn(4, "Attack Date",LVCFMT_LEFT ,80, 4);
	m_cListLog.InsertColumn(5, "Attack Time",LVCFMT_LEFT , 70, 5);
	m_cListLog.InsertColumn(6, "Group",LVCFMT_LEFT , 80, 6);
	m_cListLog.InsertColumn(7, "User",LVCFMT_LEFT , 80, 7);

	m_cListLog.SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_GRIDLINES);

	COLORREF crBkColor = ::GetSysColor(COLOR_3DFACE);
	m_cListLog.SetBkColor(crBkColor);

// Add data from database to List
	iAllRecord = CountRecord();
	if (iAllRecord > 1)
		bLastRecord = FALSE;
	else
		bLastRecord = TRUE;

	m_sNumberOfLog.Format(" %d",iAllRecord);
	m_sPageNo.Format(" %d",iPageNumber + 1);
	UpdateData(FALSE);

	if (iAllRecord!=0)
	{
		CString sTmpLogNo;
		for (int i = 0 ; i < iAllRecord ; i++)
		{
			sTmpLogNo.Format("%d",m_pSet->m_LogNo);
			saAllRecord.Add((LPCTSTR)sTmpLogNo);
			m_pSet->MoveNext();
		}
		AddLogToList(iAllRecord);
	}

  SetTimer(1,TIME_ELAP,NULL);//TIME_ELAP=1000

	gDistinguishedName.RemoveAll();
	ADCon.GetList("group",gName,gDistinguishedName);

	iADGroupAll = gName.GetSize();
	iFWGroupAll = gName.GetSize() - 24;
//	iADGroupNo = iADGroupAll - iFWGroupAll;

// List 1
	m_cListType.AddString("All");
	m_cListType.AddString("Destination");
	m_cListType.AddString("Source");
	m_cListType.AddString("Type");
	m_cListType.AddString("User");
	m_cListType.AddString("Group");
	m_cListType.AddString("Date");

	GetDocument()->SetTitle("ISAG");
}

/////////////////////////////////////////////////////////////////////////////
// CLogMonitorView diagnostics

#ifdef _DEBUG
void CLogMonitorView::AssertValid() const
{
	CRecordView::AssertValid();
}

void CLogMonitorView::Dump(CDumpContext& dc) const
{
	CRecordView::Dump(dc);
}

CLogMonitorDoc* CLogMonitorView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CLogMonitorDoc)));
	return (CLogMonitorDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CLogMonitorView database support
CRecordset* CLogMonitorView::OnGetRecordset()
{
	return m_pSet;
}


/////////////////////////////////////////////////////////////////////////////
// CLogMonitorView message handlers
void CLogMonitorView::AddLogToList(int iAllRecord)
{
	CString sLogNo;
	LVITEM it;
	int pos, iFirstRecord = iPageNumber*10, iLastRecord = iFirstRecord + iRecordPerPage;

	if (iLastRecord > iAllRecord)
		iLastRecord = iAllRecord;

	m_cListLog.DeleteAllItems();
	m_pSet->MoveFirst();
	m_pSet->Move(iFirstRecord);

	for (int i = iFirstRecord; i < iLastRecord; i++)
	{
		sLogNo.Format("%d",m_pSet->m_LogNo);
		it.mask		= LVIF_TEXT;
		it.iItem	= m_cListLog.GetItemCount();
		it.iSubItem	= 0;
		it.pszText	= (LPTSTR)(LPCTSTR)sLogNo;
		pos			= m_cListLog.InsertItem(&it);

		it.iItem	= pos;
		it.iSubItem	= 1;
		it.pszText	= (LPTSTR)(LPCTSTR)m_pSet->m_AttackDst;
		m_cListLog.SetItem(&it);

		it.iItem	= pos;
		it.iSubItem	= 2;
		it.pszText	= (LPTSTR)(LPCTSTR)m_pSet->m_AttackSrc;
		m_cListLog.SetItem(&it);
		it.iItem	= pos;
		it.iSubItem	= 3;
		it.pszText	= (LPTSTR)(LPCTSTR)m_pSet->m_AttackType;
		m_cListLog.SetItem(&it);

		it.iItem	= pos;
		it.iSubItem	= 4;
		it.pszText	= (LPTSTR)(LPCTSTR)m_pSet->m_AttackDate;
		m_cListLog.SetItem(&it);
	
		it.iItem	= pos;
		it.iSubItem	= 5;
		it.pszText	= (LPTSTR)(LPCTSTR)m_pSet->m_AttackTime;
		m_cListLog.SetItem(&it);
	
		it.iItem	= pos;
		it.iSubItem	= 6;
		it.pszText	= (LPTSTR)(LPCTSTR)m_pSet->m_Group;
		m_cListLog.SetItem(&it);

		it.iItem	= pos;
		it.iSubItem	= 7;
		it.pszText	= (LPTSTR)(LPCTSTR)m_pSet->m_User;
		m_cListLog.SetItem(&it);

		m_pSet->MoveNext();
	}
	m_pSet->MoveFirst();
}

int CLogMonitorView::CountRecord()
{	
	int iCountRecord = 0;
	if (m_pSet->IsEOF())
		return 0;
	m_pSet->MoveFirst();
	while (!m_pSet->IsEOF())
	{
		iCountRecord++;
		m_pSet->MoveNext();
	}
	m_pSet->MoveFirst();
	return iCountRecord;
}

void CLogMonitorView::OnButtonDelete() 
{
	m_pSet->Close();
	m_pSet->m_strFilter = "[LogNo]";
	m_pSet->Open();

	POSITION pos = m_cListLog.GetFirstSelectedItemPosition();
	if (pos == NULL)
	{
		AfxMessageBox("No rule is selected.");
		return;
	}

	int iLogNo1, iLogNo2, iPosition = m_cListLog.GetNextSelectedItem(pos);
	iPosition = iPageNumber*10 + iPosition;

	m_pSet->Move(iPosition);
	m_pSet->Delete();

	m_pSet->Close();
	m_pSet->m_strFilter = "[LogNo]";
	m_pSet->Open();
	iAllRecord = CountRecord();

	if (iAllRecord == 0)
		bLastRecord = TRUE;
	else 
		bLastRecord = FALSE;

	m_cListLog.DeleteAllItems();

	if (bLastRecord != TRUE)
	{
		m_pSet->MoveFirst();		
	// Check delete first record ?
		iLogNo1 = m_pSet->m_LogNo;
		if (iLogNo1 != 1)
		{
			m_pSet->Edit();
			m_pSet->m_LogNo = 1;
			m_pSet->Update();
		}
	// Arrange new log number.
		for (int i = 1 ; i < iAllRecord ; i++)
		{
			iLogNo1 = m_pSet->m_LogNo;
			m_pSet->MoveNext();
			iLogNo2 = m_pSet->m_LogNo;
			if ((iLogNo1 + 1) != iLogNo2)
			{
				iLogNo2--;
				m_pSet->Edit();
				m_pSet->m_LogNo = iLogNo2;
				m_pSet->Update();
			}
		}
	// Show All record in DB
		m_sNumberOfLog.Format(" %d",iAllRecord);
		UpdateData(FALSE);

	// Update log list
		OnSelchangeListTypeSub();
	}
	else
	{
		m_sNumberOfLog.Format(" %d",iAllRecord);
		UpdateData(FALSE);
	}
}

void CLogMonitorView::OnButtonPrevious() 
{
	if (iPageNumber != 0)
	{
		iPageNumber--;
		m_sPageNo.Format(" %d",iPageNumber + 1);
		UpdateData(FALSE);
		AddLogToList(iAllRecord);
	}
	else
		return;
}

void CLogMonitorView::OnButtonNext() 
{
	if ((iPageNumber+1)*10 < iAllRecord)
	{
		iPageNumber++;
		m_sPageNo.Format(" %d",iPageNumber + 1);
		UpdateData(FALSE);
		AddLogToList(iAllRecord);
	}
	else
		return;
}

void CLogMonitorView::OnTimer(UINT nIDEvent) 
{
	for(int iCountGroup = 0 ; iCountGroup < iFWGroupAll ; iCountGroup++)
	{	
		rmDistinguishedName.RemoveAll();
		ADCon.GetLog(gDistinguishedName.GetAt(iCountGroup),rmDistinguishedName);

		int iLogNumber = rmDistinguishedName.GetSize();
		if (iLogNumber > 0)
		{
		// Add All Log to database
			for( int i = iLogNumber - 1; i >= 0; i--)
			{
				AddLogToDB(rmDistinguishedName.GetAt(i));
			}
		// Delete All Rule From AD.
			for( int j = 0; j < iLogNumber; j++)
			{
				ADCon.SetDeleteLog(gDistinguishedName.GetAt(iCountGroup),j);
			}
		// Show All record in DB
			m_pSet->Requery();
			iAllRecord = CountRecord();
			m_sNumberOfLog.Format(" %d",iAllRecord);
			UpdateData(FALSE);
		// Update Log List
			m_cListLog.DeleteAllItems();
			AddLogToList(iAllRecord);
		}
	}

	CRecordView::OnTimer(nIDEvent);
}

void CLogMonitorView::AddLogToDB(CString sLog)
{
	// change long log string to each variables
	CString tmpString,sLogNo,sAttackDst,sAttackSrc,sAttackType,sAttackDate,sAttackTime,sGroup,sUser;
	sLog.TrimLeft();	//removes newline, space, and tab characters
	sLog.TrimRight();	//removes newline, space, and tab characters

	for ( int i=0; i<7; i++ ) 
	{
		int pos = sLog.Find(',');
		tmpString = sLog.Left(pos);
		sLog.Delete(0, pos+1);

		switch(i)
		{
			case 0 :
				sAttackType = tmpString;
				break;
			case 1 :
				sAttackSrc = tmpString;
				break;
			case 2 :
				sAttackDst = tmpString;
				break;
			case 3 :
				sAttackDate = tmpString;
				break;
			case 4 :
				sAttackTime= tmpString;
				break;
			case 5 :
				sGroup = tmpString;
				break;
		}
	}	
	sUser = sLog;
//	AfxMessageBox(sAttackDst+sAttackSrc+sAttackType+sAttackDate+sAttackTime+sGroup+sUser);
	m_pSet->Requery();
	iAllRecord = CountRecord();
	int iLogNo = iAllRecord + 1;
	m_pSet->AddNew();
	m_pSet->m_LogNo		 = iLogNo;			m_pSet->m_AttackDst  = sAttackDst;
	m_pSet->m_AttackSrc	 = sAttackSrc;		m_pSet->m_AttackTime = sAttackTime;
	m_pSet->m_AttackDate = sAttackDate;		m_pSet->m_AttackType = sAttackType;
	m_pSet->m_Group		 = sGroup;			m_pSet->m_User		 = sUser;
	m_pSet->Update();
}

void CLogMonitorView::OnSelchangeListType() 
{
	m_pSet->Close();
	m_pSet->m_strFilter = "[User]";
	m_pSet->Open();
	iAllRecord = CountRecord();
	if (iAllRecord == 0)
		return;
	m_pSet->MoveFirst();
	int i, j, iEqual = 0, iSelected = m_cListType.GetCurSel();
	CString sTmp;
	m_cListTypeSub.ResetContent();
	saTmp.RemoveAll();
	switch (iSelected)
	{
		case 0 :
			AddLogToList(iAllRecord);
			iType = 0;
			break;
		case 1 :
			for (i = 0 ; i < iAllRecord ; i++)
			{
				if (i > 0)
				{
					sTmp = m_pSet->m_AttackDst;
					m_pSet->MoveFirst();
					for (j = 0 ; j < i ; j++)
					{
						if (sTmp == m_pSet->m_AttackDst)
							iEqual = 1;
						m_pSet->MoveNext();
					}
				}
				if (iEqual == 0)
				{
					m_cListTypeSub.AddString(m_pSet->m_AttackDst);
					saTmp.Add((LPCTSTR)m_pSet->m_AttackDst);
				}
				iEqual = 0;
				m_pSet->MoveNext();
			}
			iType = 1;
			break;
		case 2 :
			for (i = 0 ; i < iAllRecord ; i++)
			{
				if (i > 0)
				{
					sTmp = m_pSet->m_AttackSrc;
					m_pSet->MoveFirst();
					for (j = 0 ; j < i ; j++)
					{
						if (sTmp == m_pSet->m_AttackSrc)
							iEqual = 1;
						m_pSet->MoveNext();
					}
				}
				if (iEqual == 0)
				{
					m_cListTypeSub.AddString(m_pSet->m_AttackSrc);
					saTmp.Add((LPCTSTR)m_pSet->m_AttackSrc);
				}
				iEqual = 0;
				m_pSet->MoveNext();
			}
			iType = 2;
			break;
		case 3 :
			for (i = 0 ; i < iAllRecord ; i++)
			{
				if (i > 0)
				{
					sTmp = m_pSet->m_AttackType;
					m_pSet->MoveFirst();
					for (j = 0 ; j < i ; j++)
					{
						if (sTmp == m_pSet->m_AttackType)
							iEqual = 1;
						m_pSet->MoveNext();
					}
				}
				if (iEqual == 0)
				{
					m_cListTypeSub.AddString(m_pSet->m_AttackType);
					saTmp.Add((LPCTSTR)m_pSet->m_AttackType);
				}
				iEqual = 0;
				m_pSet->MoveNext();
			}
			iType = 3;
			break;
		case 4 :
			for (i = 0 ; i < iAllRecord ; i++)
			{
				if (i > 0)
				{
					sTmp = m_pSet->m_User;
					m_pSet->MoveFirst();
					for (j = 0 ; j < i ; j++)
					{
						if (sTmp == m_pSet->m_User)
							iEqual = 1;
						m_pSet->MoveNext();
					}
				}
				if (iEqual == 0)
				{
					m_cListTypeSub.AddString(m_pSet->m_User);
					saTmp.Add((LPCTSTR)m_pSet->m_User);
				}
				iEqual = 0;
				m_pSet->MoveNext();
			}
			iType = 4;
			break;
		case 5 :
			for (i = 0 ; i < iAllRecord ; i++)
			{
				if (i > 0)
				{
					sTmp = m_pSet->m_Group;
					m_pSet->MoveFirst();
					for (j = 0 ; j < i ; j++)
					{
						if (sTmp == m_pSet->m_Group)
							iEqual = 1;
						m_pSet->MoveNext();
					}
				}
				if (iEqual == 0)
				{
					m_cListTypeSub.AddString(m_pSet->m_Group);
					saTmp.Add((LPCTSTR)m_pSet->m_Group);
				}
				iEqual = 0;
				m_pSet->MoveNext();
			}
			iType = 5;
			break;
		case 6 :
			for (i = 0 ; i < iAllRecord ; i++)
			{
				if (i > 0)
				{
					sTmp = m_pSet->m_AttackDate;
					m_pSet->MoveFirst();
					for (j = 0 ; j < i ; j++)
					{
						if (sTmp == m_pSet->m_AttackDate)
							iEqual = 1;
						m_pSet->MoveNext();
					}
				}
				if (iEqual == 0)
				{
					m_cListTypeSub.AddString(m_pSet->m_AttackDate);
					saTmp.Add((LPCTSTR)m_pSet->m_AttackDate);
				}
				iEqual = 0;
				m_pSet->MoveNext();
			}
			iType = 6;
			break;
	}

}

void CLogMonitorView::OnSelchangeListTypeSub() 
{
	m_cListLog.DeleteAllItems();
	int iSelected = m_cListTypeSub.GetCurSel();
	CString sTmp;
	m_pSet->Close();
	switch(iType)
	{
		case 1 :
			m_pSet->m_strFilter = "[AttackDst] = '" + saTmp.GetAt(iSelected) + "'";
			break;
		case 2 :
			m_pSet->m_strFilter = "[AttackSrc] = '" + saTmp.GetAt(iSelected) + "'";
			break;
		case 3 :
			m_pSet->m_strFilter = "[AttackType] = '" + saTmp.GetAt(iSelected) + "'";
			break;
		case 4 :
			m_pSet->m_strFilter = "[User] = '" + saTmp.GetAt(iSelected) + "'";
			break;
		case 5 :
			m_pSet->m_strFilter = "[Group] = '" + saTmp.GetAt(iSelected) + "'";
			break;
		case 6 :
			m_pSet->m_strFilter = "[AttackDate] = '" + saTmp.GetAt(iSelected) + "'";
			break;
		case 0 :
			m_pSet->m_strFilter = "[AttackDate]";
			break;
	}
	m_pSet->Open();
	iAllRecord = CountRecord();
	AddLogToList(iAllRecord);
// Show All record in DB
	m_sNumberOfLog.Format(" %d",iAllRecord);
	UpdateData(FALSE);
}
