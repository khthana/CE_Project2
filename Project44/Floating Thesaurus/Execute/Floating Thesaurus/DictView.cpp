// DictView.cpp : implementation of the CDictView class
//

#include "stdafx.h"
#include "Dict.h"

#include "stdio.h"
#include "fstream.h"
#include "io.h"

#include "DialogThread.h"
#include "DictSet.h"
#include "DictDoc.h"
#include "DictView.h"
#include "SearchOnline.h"	// For Search Online Method
#include "Add.h"			// For Add Record Method
#include "UpdateBox.h"		// For Update Box
#include "Update.h"			// For Update Record Method
#include "Delete.h"			// For Delete Record Method
#include "GifAnimation.h"
#include <afxinet.h>	// WININET

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

static UINT UWM_LDBLCLK = ::RegisterWindowMessage(UWM_LDBLCLK_MSG);

/////////////////////////////////////////////////////////////////////////////
// CDictView

IMPLEMENT_DYNCREATE(CDictView, CDaoRecordView)

BEGIN_MESSAGE_MAP(CDictView, CDaoRecordView)
	ON_REGISTERED_MESSAGE(UWM_LDBLCLK, OnLDblClk)
	//{{AFX_MSG_MAP(CDictView)
	ON_BN_CLICKED(IDC_Search, OnPreSearch)
	ON_COMMAND(ID_ADDVOCAB, OnAddvocab)
	ON_COMMAND(ID_UPDATEVOCAB, OnUpdatevocab)
	ON_COMMAND(ID_DELETEVOCAB, OnDeletevocab)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_COMMAND(ID_FLOAT, OnFloat)
	ON_COMMAND(ID_MENU_FLOAT, OnFloat)
	ON_UPDATE_COMMAND_UI(ID_MENU_FLOAT, OnUpdateFloat)
	ON_UPDATE_COMMAND_UI(ID_EN_ONLINE, OnUpdateEnOnline)
	ON_UPDATE_COMMAND_UI(ID_DIS_ONLINE, OnUpdateDisOnline)
	ON_UPDATE_COMMAND_UI(ID_EN_GAME, OnUpdateEnGame)
	ON_UPDATE_COMMAND_UI(ID_DIS_GAME, OnUpdateDisGame)
	ON_UPDATE_COMMAND_UI(ID_PEN_ONLINE, OnUpdatePenOnline)
	ON_UPDATE_COMMAND_UI(ID_PEN_GAME, OnUpdatePenGame)
	ON_UPDATE_COMMAND_UI(ID_PDIS_ONLINE, OnUpdatePdisOnline)
	ON_UPDATE_COMMAND_UI(ID_FLOAT, OnUpdateFloat)
	ON_UPDATE_COMMAND_UI(ID_PDIS_GAME, OnUpdatePdisGame)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDictView construction/destruction

CDictView::CDictView()
	: CDaoRecordView(CDictView::IDD)
{
	//{{AFX_DATA_INIT(CDictView)
	m_pSet = NULL;
	m_cvocab = _T("");
	m_ctmeaning = _T("");
	m_cemeaning = _T("");
	//}}AFX_DATA_INIT

	netfile = "InternetFile.txt";
	histfile = "HistoryFile.txt";
}

CDictView::~CDictView()
{
    if (AfxIsValidAddress(m_pDlgThread, sizeof(CWinThread)) &&
	AfxIsValidAddress(m_pDlgThread->m_pMainWnd, sizeof(CWnd)))
    {
	// retrieve the threads main window
		CDialog *pDlg = (CDialog *)m_pDlgThread->m_pMainWnd;
		if (::IsWindow(pDlg->GetSafeHwnd()))
		{
			// make sure we have a CDialog-derived main 
			// thread window then terminate it
		    ASSERT(pDlg->IsKindOf(RUNTIME_CLASS(CDialog)));
		    pDlg->EndDialog(IDCANCEL);
		    // now give the thread some time to end, 
		    // 2 second should be enough. You may 
			// able to use INFINITE as wait value, if you dare...
		    WaitForSingleObject(m_pDlgThread->m_hThread, 2000);
		    m_pDlgThread=NULL;
		}
    }
}

void CDictView::DoDataExchange(CDataExchange* pDX)
{
	CDaoRecordView::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDictView)
	DDX_Control(pDX, IDC_CVOCAB, m_clist);
	DDX_CBString(pDX, IDC_CVOCAB, m_cvocab);
	DDX_Text(pDX, IDC_THAI_MEANING, m_ctmeaning);
	DDX_Text(pDX, IDC_ENG_MEANING, m_cemeaning);
	//}}AFX_DATA_MAP
}

BOOL CDictView::PreCreateWindow(CREATESTRUCT& cs)
{
	return CDaoRecordView::PreCreateWindow(cs);
}

void CDictView::OnInitialUpdate()
{
	m_pSet = &GetDocument()->m_dictSet;
	CDaoRecordView::OnInitialUpdate();
	GetParentFrame()->RecalcLayout();
	ResizeParentToFit();
	m_float = FALSE;
	m_online = TRUE;
	m_game = TRUE;

	// Set the icon for this dialog.  The framework does this automatically
	// when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	
	m_hIcon1 = (HICON)::LoadImage(AfxFindResourceHandle(MAKEINTRESOURCE(IDI_ICON1), RT_GROUP_ICON), MAKEINTRESOURCE(IDI_ICON1), IMAGE_ICON, 0, 0, 0);
	m_hIcon2 = (HICON)::LoadImage(AfxFindResourceHandle(MAKEINTRESOURCE(IDI_ICON2), RT_GROUP_ICON), MAKEINTRESOURCE(IDI_ICON2), IMAGE_ICON, 0, 0, 0);

	// Create the tool tip
	m_Tip.Create(this);
}

/////////////////////////////////////////////////////////////////////////////
// CDictView diagnostics

#ifdef _DEBUG
void CDictView::AssertValid() const
{
	CDaoRecordView::AssertValid();
}

void CDictView::Dump(CDumpContext& dc) const
{
	CDaoRecordView::Dump(dc);
}

CDictDoc* CDictView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CDictDoc)));
	return (CDictDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CDictView database support
CDaoRecordset* CDictView::OnGetRecordset()
{
	return m_pSet;
}

/////////////////////////////////////////////////////////////////////////////
//	Set Hook & Clear Hook

void CDictView::OnFloat()
{
	m_float = !m_float;
	if (m_float)
	{
		BOOL result = setMyHook1(m_hWnd);
		if(!result)
		{ /* error */
			AfxMessageBox("Error",MB_OK);
		} /* error */
		else
		{ /* set hook */
			SetWindowPos(&wndTopMost, 0, 0, 0, 0,
				SWP_NOMOVE | SWP_NOSIZE);
		} /* set hook */
	
	}
	else
	{
		clearMyHook1(m_hWnd);
		SetWindowPos(&wndNoTopMost, 0, 0, 0, 0,
			SWP_NOMOVE | SWP_NOSIZE);
	}
}

/////////////////////////////////////////////////////////////////////////////
//	Update System Tray UI

void CDictView::OnUpdateFloat(CCmdUI* pCmdUI) 
{
	pCmdUI->SetCheck(m_float);	
}

void CDictView::OnUpdateEnOnline(CCmdUI* pCmdUI) 
{
	m_online = !m_online;
	pCmdUI->Enable(m_online);	
}

void CDictView::OnUpdateDisOnline(CCmdUI* pCmdUI) 
{
	m_online = !m_online;
	pCmdUI->Enable(m_online);	
}

void CDictView::OnUpdateEnGame(CCmdUI* pCmdUI) 
{
	m_game = !m_game;
	pCmdUI->Enable(m_game);	
}

void CDictView::OnUpdateDisGame(CCmdUI* pCmdUI) 
{
	m_game = !m_game;
	pCmdUI->Enable(m_game);	
}

void CDictView::OnUpdatePenOnline(CCmdUI* pCmdUI) 
{
	m_online = !m_online;
	pCmdUI->Enable(m_online);	
}

void CDictView::OnUpdatePdisOnline(CCmdUI* pCmdUI) 
{
	m_online = !m_online;
	pCmdUI->Enable(m_online);	
}

void CDictView::OnUpdatePenGame(CCmdUI* pCmdUI) 
{
	m_game = !m_game;
	pCmdUI->Enable(m_game);	
}

void CDictView::OnUpdatePdisGame(CCmdUI* pCmdUI) 
{
	m_game = !m_game;
	pCmdUI->Enable(m_game);	
}

/////////////////////////////////////////////////////////////////////////////
// CDictView message handlers
void CDictView::OnPreSearch()
{
	UpdateData(TRUE);	// Input Text From Combo Box to m_cvocab
	m_ctmeaning = "";	// thai meaning
	m_cemeaning = "";	// english meaning
	if ((m_cvocab.Find("'") != -1) || (m_cvocab.Find("*") != -1))
		return;
	bool hist = CheckHistory(m_cvocab);	// check history file
	if (m_cvocab.GetLength() == 0)
	{
		UpdateData(FALSE);
		return;
	}
	CheckGrammar(m_cvocab);

	for (int ind=0; ind <= m_clist.GetCount(); ind++)
	{
		if (m_clist.FindString(ind,m_cvocab) < 0)
		{
			m_clist.InsertString(0,m_cvocab);	// Add new vocab to combo's list
		}
	}	// end for
	UpdateData(FALSE);	// Output Text to Edit Box
	if ((m_cemeaning == "")&&(m_ctmeaning == "") && (m_online))
		OnSearchNet(m_cvocab);

	if (hist && m_game)
		ThreadModeLess();
} 

void CDictView::ThreadModeLess()
{
	if (AfxIsValidAddress(m_pDlgThread, sizeof(CWinThread)) &&
        AfxIsValidAddress(m_pDlgThread->m_pMainWnd, sizeof(CWnd)))
    {
        if (::IsWindow(m_pDlgThread->m_pMainWnd->GetSafeHwnd()))
        {    m_pDlgThread->GetMainWnd()->SetWindowPos(
	                &wndTopMost, 0,0,0,0,SWP_NOMOVE|SWP_NOSIZE|SWP_SHOWWINDOW);
             return;
        }
    }
    // create a new thread
    m_pDlgThread=AfxBeginThread( RUNTIME_CLASS(CDialogThread) );	
}

void CDictView::CheckGrammar(CString vocab)
{
	int len,count;
	len = vocab.GetLength();
	if (vocab.GetLength() <= 2)
	{
		count = OnSearch(vocab);
		m_ctmeaning = m_tmeaning;
		m_cemeaning = m_emeaning;
	}
	else
	if ((vocab.GetAt(len-1) == 's') && (vocab.GetAt(len-2) == 'e'))	// "es"
	{
		if (vocab.GetAt(len-3) == 'i')	// "ies"
		{
			count = OnSearch(vocab);
			m_ctmeaning = m_tmeaning;
			m_cemeaning = m_emeaning;
			count += OnSearch(vocab.Left(len-3) + 'y');
			m_ctmeaning = m_ctmeaning + m_tmeaning;
			m_cemeaning = m_cemeaning + m_emeaning;
		
		}
		else
			if (vocab.GetAt(len-3) == 'v')	// "ves"
			{
				count = OnSearch(vocab);
				m_ctmeaning = m_tmeaning;
				m_cemeaning = m_emeaning;
				count += OnSearch(vocab.Left(len-3) + 'f');
				m_ctmeaning = m_ctmeaning + m_tmeaning;
				m_cemeaning = m_cemeaning + m_emeaning;
				count += OnSearch(vocab.Left(len-3) + "fe");
				m_ctmeaning = m_ctmeaning + m_tmeaning;
				m_cemeaning = m_cemeaning + m_emeaning;
			}
			else	// "es"
			{
				count = OnSearch(vocab);
				m_ctmeaning = m_tmeaning;
				m_cemeaning = m_emeaning;
				count += OnSearch(vocab.Left(len-1));
				m_ctmeaning = m_ctmeaning + m_tmeaning;
				m_cemeaning = m_cemeaning + m_emeaning;
				count += OnSearch(vocab.Left(len-2));
				m_ctmeaning = m_ctmeaning + m_tmeaning;
				m_cemeaning = m_cemeaning + m_emeaning;
			}

	}
	else
		if (vocab.GetAt(len-1) == 's')	// "s"
		{
			count = OnSearch(vocab);
			m_ctmeaning = m_tmeaning;
			m_cemeaning = m_emeaning;
			count += OnSearch(vocab.Left(len-1));
			m_ctmeaning = m_ctmeaning + m_tmeaning;
			m_cemeaning = m_cemeaning + m_emeaning;
		}
		else
			if (vocab.GetAt(len-3) == 'i' && vocab.GetAt(len-2) == 'n' && vocab.GetAt(len-1) == 'g')	// "ing"
			{
				if (vocab.GetAt(len-4) == 'y')	// "ying"
				{
					count = OnSearch(vocab);
					m_ctmeaning = m_tmeaning;
					m_cemeaning = m_emeaning;
					count += OnSearch(vocab.Left(len-3));
					m_ctmeaning = m_ctmeaning + m_tmeaning;
					m_cemeaning = m_cemeaning + m_emeaning;
					count += OnSearch(vocab.Left(len-4) + "ie");
					m_ctmeaning = m_ctmeaning + m_tmeaning;
					m_cemeaning = m_cemeaning + m_emeaning;
				}
				else
					if (vocab.GetAt(len-4) == vocab.GetAt(len-5))		// "**ing"
					{
						count = OnSearch(vocab);
						m_ctmeaning = m_tmeaning;
						m_cemeaning = m_emeaning;
						count += OnSearch(vocab.Left(len-4));
						m_ctmeaning = m_ctmeaning + m_tmeaning;
						m_cemeaning = m_cemeaning + m_emeaning;
						count += OnSearch(vocab.Left(len-3));
						m_ctmeaning = m_ctmeaning + m_tmeaning;
						m_cemeaning = m_cemeaning + m_emeaning;
					}
					else	// "ing"
					{
						count = OnSearch(vocab);
						m_ctmeaning = m_tmeaning;
						m_cemeaning = m_emeaning;
						count += OnSearch(vocab.Left(len-3));
						m_ctmeaning = m_ctmeaning + m_tmeaning;
						m_cemeaning = m_cemeaning + m_emeaning;
					}
			
			}
			else
				if (vocab.GetAt(len-2) == 'e' && vocab.GetAt(len-1) == 'd')	// "ed"
				{
					if (vocab.GetAt(len-3) == 'i')	// "ied"
					{
						count = OnSearch(vocab);
						m_ctmeaning = m_tmeaning;
						m_cemeaning = m_emeaning;
						count += OnSearch(vocab.Left(len-3) + 'y');
						m_ctmeaning = m_ctmeaning + m_tmeaning;
						m_cemeaning = m_cemeaning + m_emeaning;
						count += OnSearch(vocab.Left(len-1));
						m_ctmeaning = m_ctmeaning + m_tmeaning;
						m_cemeaning = m_cemeaning + m_emeaning;
					}
					else
						if (vocab.GetAt(len-3) == vocab.GetAt(len-4))	// "**ed"
						{
							count = OnSearch(vocab);
							m_ctmeaning = m_tmeaning;
							m_cemeaning = m_emeaning;
							count += OnSearch(vocab.Left(len-3));
							m_ctmeaning = m_ctmeaning + m_tmeaning;
							m_cemeaning = m_cemeaning + m_emeaning;
							count += OnSearch(vocab.Left(len-2));
							m_ctmeaning = m_ctmeaning + m_tmeaning;
							m_cemeaning = m_cemeaning + m_emeaning;
						}
						else	// "ed"
						{
							count = OnSearch(vocab);
							m_ctmeaning = m_tmeaning;
							m_cemeaning = m_emeaning;
							count += OnSearch(vocab.Left(len-1));
							m_ctmeaning = m_ctmeaning + m_tmeaning;
							m_cemeaning = m_cemeaning + m_emeaning;
							count += OnSearch(vocab.Left(len-2));
							m_ctmeaning = m_ctmeaning + m_tmeaning;
							m_cemeaning = m_cemeaning + m_emeaning;
						}
				}
				else	// "-"
				{
					count = OnSearch(vocab);
					m_ctmeaning = m_tmeaning;
					m_cemeaning = m_emeaning;
				}

}

bool CDictView::CheckHistory(CString SearchWord)
{
	bool Found = FALSE;
	if (SearchWord != "")
	{
		CString Temp = SearchWord;
		Temp.MakeLower();
		ifstream file;
		file.open(histfile);	// open history file
	
		while (!file.eof() && (!Found))
		{
			TCHAR s[1000] = "";
			file.getline(s, 500);
			CString line(s);
			if (line == Temp)
				Found = TRUE;
		}
		file.close();
	}
	return Found;
}

int CDictView::OnSearch(CString SearchWord) 
{
	int much;
	CString t_noun = "";	CString e_noun = "";
	CString t_verb = "";	CString e_verb = "";
	CString t_adj  = "";	CString e_adj  = "";
	CString t_adv  = "";	CString e_adv  = "";
	CString t_conj = "";	CString e_conj = "";	
	CString t_int  = "";	CString e_int  = "";
	CString t_prep = "";	CString e_prep = "";
	CString t_pron = "";	CString e_pron = "";
	CString blank  = "";
	m_tmeaning = "";		m_emeaning = "";
	
	much = Search(SearchWord, t_noun, t_verb,
				  t_adj,  t_adv,  t_conj, t_int, t_prep, t_pron,
				  e_noun, e_verb, e_adj,  e_adv, e_conj, e_int, 
				  e_prep, e_pron, blank);
	
	// thai meaning
	if (t_noun != "") 
	{
		m_tmeaning += "(N.) "   + SetShowFormat(t_noun);
	}
	if (t_verb != "") 
	{	
		if (m_tmeaning.GetLength()!=0) m_tmeaning += " ";
		m_tmeaning += "(V.) "   + SetShowFormat(t_verb);
	}
	if (t_adj  != "") 
	{	
		if (m_tmeaning.GetLength()!=0) m_tmeaning += " ";
		m_tmeaning += "(ADJ) " + SetShowFormat(t_adj);
	}
	if (t_adv  != "") 
	{	
		if (m_tmeaning.GetLength()!=0) m_tmeaning += " ";
		m_tmeaning += "(ADV) " + SetShowFormat(t_adv);
	}
	if (t_conj != "") 
	{	
		if (m_tmeaning.GetLength()!=0) m_tmeaning += " ";
		m_tmeaning += "(CONJ) "+ SetShowFormat(t_conj);
	}
	if (t_int  != "") 
	{	
		if (m_tmeaning.GetLength()!=0) m_tmeaning += " ";
		m_tmeaning += "(INT) " + SetShowFormat(t_int);
	}
	if (t_prep != "") 
	{	
		if (m_tmeaning.GetLength()!=0) m_tmeaning += " ";
		m_tmeaning += "(PREP) "+ SetShowFormat(t_prep);
	}
	if (t_pron != "") 
	{	
		if (m_tmeaning.GetLength()!=0) m_tmeaning += " ";
		m_tmeaning += "(PRON) "+ SetShowFormat(t_pron);
	}

	// english meaning
	int len;
	if (blank != "")
	{
		len = blank.GetLength() - 1;
		if (blank[len] == ',')
			blank.Delete(len,1);
		m_emeaning += blank;
	}
	if (e_noun != "") 
	{
		len = e_noun.GetLength() - 1;
		if (e_noun[len] == ',')
			e_noun.Delete(len,1);
		if (m_emeaning.GetLength()!=0) m_emeaning += " ";
		m_emeaning += "(N.) "   + SetShowFormat(e_noun);
	}
	if (e_verb != "") 
	{	
		len = e_verb.GetLength() - 1;
		if (e_verb[len] == ',')
			e_verb.Delete(len,1);
		if (m_emeaning.GetLength()!=0) m_emeaning += " ";
		m_emeaning += "(V.) "   + SetShowFormat(e_verb);
	}
	if (e_adj  != "") 
	{	
		len = e_adj.GetLength() - 1;
		if (e_adj[len] == ',')
			e_adj.Delete(len,1);
		if (m_emeaning.GetLength()!=0) m_emeaning += " ";
		m_emeaning += "(ADJ) " + SetShowFormat(e_adj);
	}
	if (e_adv  != "") 
	{	
		len = e_adv.GetLength() - 1;
		if (e_adv[len] == ',')
			e_adv.Delete(len,1);
		if (m_emeaning.GetLength()!=0) m_emeaning += " ";
		m_emeaning += "(ADV) " + SetShowFormat(e_adv);
	}
	if (e_conj != "") 
	{	
		len = e_conj.GetLength() - 1;
		if (e_conj[len] == ',')
			e_conj.Delete(len,1);
		if (m_emeaning.GetLength()!=0) m_emeaning += " ";
		m_emeaning += "(CONJ) "+ SetShowFormat(e_conj);
	}
	if (e_int  != "") 
	{	
		len = e_int.GetLength() - 1;
		if (e_int[len] == ',')
			e_int.Delete(len,1);
		if (m_emeaning.GetLength()!=0) m_emeaning += " ";
		m_emeaning += "(INT) " + SetShowFormat(e_int);
	}
	if (e_prep != "") 
	{	
		len = e_prep.GetLength() - 1;
		if (e_prep[len] == ',')
			e_prep.Delete(len,1);
		if (m_emeaning.GetLength()!=0) m_emeaning += " ";
		m_emeaning += "(PREP) "+ SetShowFormat(e_prep);
	}
	if (e_pron != "") 
	{	
		len = e_pron.GetLength() - 1;
		if (e_pron[len] == ',')
			e_pron.Delete(len,1);
		if (m_emeaning.GetLength()!=0) m_emeaning += " ";
		m_emeaning += "(PRON) "+ SetShowFormat(e_pron);
	}

	if ((m_emeaning!="")||(m_tmeaning!=""))	
		bool KeepOK = KeepHistory(SearchWord,m_tmeaning,m_emeaning);
	return much;
}

int CDictView::ReadFile()
{
	int number;
	ifstream file;
	file.open(histfile);	// open history file
	TCHAR s[1000] = "";
	CString line = "";
	int c = 1;
	int i = 0;
	
	while (!file.eof())
	{
		file.getline(s, 500);
		line = s;
		if (c == 1)
			list[i].vocab = line;
		else if (c == 2)
			list[i].time  = line;
		else if (c == 3)
			list[i].tmean = line;
		else if (c == 4)
			list[i].emean = line;
		else if (c == 5)
		{	i += 1;
			c = 0;
		}
		c += 1;
	}
	number = i-1;
	file.close();
	return number;
}

int CDictView::Search(CString SearchWord, CString& tnoun, 
					  CString& tverb, CString& tadj,  CString& tadv,  
					  CString& tconj, CString& tint,  CString& tprep, 
					  CString& tpron, CString& enoun, CString& everb, 
					  CString& eadj,  CString& eadv,  CString& econj, 
					  CString& eint,  CString& eprep, CString& epron, CString& blank)
{
	int much = 0;
	CString temp = "";
	SearchWord.MakeLower();
	try
	{
		m_pSet->m_strFilter = "Eword='" + SearchWord + "'";
		m_pSet->Requery();

		much = m_pSet->GetRecordCount();
		if (m_pSet->GetRecordCount() != 0)
		{
			while (!m_pSet->IsEOF())
			{
				if (m_pSet->m_code == "N")			// noun
				{
					if (tnoun.GetLength() != 0) 
						tnoun += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tnoun += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tnoun += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tnoun += m_pSet->m_tsyn;

					if (enoun.GetLength() != 0) 
						enoun += " ";
					if (m_pSet->m_tenglish != "")
					{
						temp = m_pSet->m_tenglish;
						if (temp[0] == ',') 
							temp.Delete(0,2);
						enoun += temp;
					}
				}
				else if (m_pSet->m_code == "V")		// verb
				{
					if (tverb.GetLength() != 0) 
						tverb += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tverb += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tverb += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tverb += m_pSet->m_tsyn;

					if (everb.GetLength() != 0) 
						everb += " ";
					if (m_pSet->m_tenglish != "")
					{
						temp = m_pSet->m_tenglish;
						if (temp[0] == ',') 
							temp.Delete(0,2);
						everb += temp;
					}
				}
				else if (m_pSet->m_code == "ADJ")	// adjective
				{
					if (tadj.GetLength() != 0) 
						tadj += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tadj += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tadj += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tadj += m_pSet->m_tsyn;

					if (eadj.GetLength() != 0) 
						eadj += " ";
					if (m_pSet->m_tenglish != "")
					{
						temp = m_pSet->m_tenglish;
						if (temp[0] == ',') 
							temp.Delete(0,2);
						eadj += temp;
					}
				}
				else if (m_pSet->m_code == "ADV")	// adverb
				{
					if (tadv.GetLength() != 0) 
						tadv += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tadv += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tadv += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tadv += m_pSet->m_tsyn;

					if (eadv.GetLength() != 0) 
						eadv += " ";
					if (m_pSet->m_tenglish != "")
					{
						temp = m_pSet->m_tenglish;
						if (temp[0] == ',') 
							temp.Delete(0,2);
						eadv += temp;
					}
				}
				else if (m_pSet->m_code == "CONJ")	// conjunction
				{
					if (tconj.GetLength() != 0) 
						tconj += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tconj += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tconj += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tconj += m_pSet->m_tsyn;
				
					if (econj.GetLength() != 0) 
						econj += " ";
					if (m_pSet->m_tenglish != "")
					{
						temp = m_pSet->m_tenglish;
						if (temp[0] == ',') 
							temp.Delete(0,2);
						econj += temp;
					}
				}
				else if (m_pSet->m_code == "INT")	// interjection
				{
					if (tint.GetLength() != 0) 
						tint += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tint += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tint += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tint += m_pSet->m_tsyn;
				
					if (eint.GetLength() != 0) 
						eint += " ";
					if (m_pSet->m_tenglish != "")
					{
						temp = m_pSet->m_tenglish;
						if (temp[0] == ',') 
							temp.Delete(0,2);
						eint += temp;
					}
				}
				else if (m_pSet->m_code == "PREP")	// preposition
				{
					if (tprep.GetLength() != 0) 
						tprep += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tprep += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tprep += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tprep += m_pSet->m_tsyn;
				
					if (eprep.GetLength() != 0) 
						eprep += " ";
					if (m_pSet->m_tenglish != "")
					{
						temp = m_pSet->m_tenglish;
						if (temp[0] == ',') 
							temp.Delete(0,2);
						eprep += temp;
					}
				}
				else if (m_pSet->m_code == "PRON")	// pronoun
				{
					if (tpron.GetLength() != 0) 
						tpron += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tpron += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tpron += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tpron += m_pSet->m_tsyn;
				
					if (epron.GetLength() != 0) 
						epron += " ";
					if (m_pSet->m_tenglish != "")
					{
						temp = m_pSet->m_tenglish;
						if (temp[0] == ',') 
							temp.Delete(0,2);
						epron += temp;
					}
				}
				else								// no code
				{
					if (blank.GetLength() != 0)
						blank += " ";
					if (m_pSet->m_tenglish != "")
					{
						temp = m_pSet->m_tenglish;
						if (temp[0] == ',')
							temp.Delete(0,2);
						blank += temp;
					}
				}		
				m_pSet->MoveNext();
			}
		}

		m_pSet->m_strFilter = "Tenglish Like '*, " + SearchWord + ",*'";
		m_pSet->Requery();

		much += m_pSet->GetRecordCount();
		if (m_pSet->GetRecordCount() != 0)
		{
			while (!m_pSet->IsEOF())
			{
				if (m_pSet->m_code == "N")			// noun
				{
					if (tnoun.GetLength() != 0) 
						tnoun += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tnoun += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tnoun += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tnoun += m_pSet->m_tsyn;
					//SetShowFormat(tnoun);
				}
				else if (m_pSet->m_code == "V")		// verb
				{
					if (tverb.GetLength() != 0) 
						tverb += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tverb += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tverb += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tverb += m_pSet->m_tsyn;
				}
				else if (m_pSet->m_code == "ADJ")	// adjective
				{
					if (tadj.GetLength() != 0) 
						tadj += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tadj += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tadj += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tadj += m_pSet->m_tsyn;
				}
				else if (m_pSet->m_code == "ADV")	// adverb
				{
					if (tadv.GetLength() != 0) 
						tadv += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tadv += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tadv += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tadv += m_pSet->m_tsyn;
				}
				else if (m_pSet->m_code == "CONJ")	// conjunction
				{
					if (tconj.GetLength() != 0) 
						tconj += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tconj += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tconj += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tconj += m_pSet->m_tsyn;
				}
				else if (m_pSet->m_code == "INT")	// interjection
				{
					if (tint.GetLength() != 0) 
						tint += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tint += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tint += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tint += m_pSet->m_tsyn;
				}
				else if (m_pSet->m_code == "PREP")	// preposition
				{
					if (tprep.GetLength() != 0) 
						tprep += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tprep += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tprep += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tprep += m_pSet->m_tsyn;
				}
				else if (m_pSet->m_code == "PRON")	// pronoun
				{
					if (tpron.GetLength() != 0) 
						tpron += ", ";
					if ((m_pSet->m_tword != "") && (m_pSet->m_tsyn != ""))
						tpron += m_pSet->m_tword + ", " + m_pSet->m_tsyn;
					else if (m_pSet->m_tword != "")
						tpron += m_pSet->m_tword;
					else if (m_pSet->m_tsyn != "")
						tpron += m_pSet->m_tsyn;
				}
				m_pSet->MoveNext();
			}
		}
	}
    catch( CDaoException* e )
    {
        AfxMessageBox( e->m_nAfxDaoError,   
                      MB_ICONEXCLAMATION );
        m_pSet = NULL;
        e->Delete();
    }
	return much;
}

CString CDictView::SetShowFormat(CString Word)
{
	CString Temp[50];
	CString Code = "";
	int i = 0;
	for (i=0; i<50; i++)
		Temp[i] = "";
	int l = Word.GetLength();
	int j = 0;
	for (i=0; i<l; i++)
		if ((Word[i] != ';')&&(Word[i] != ','))
			Temp[j] += Word[i];
		else
			if (Temp[j] != "")
				j += 1;

	bool repeat = FALSE;
	Word = "";
	for (i=0; i<=j; i++)
		if (Temp[i][0] == ' ')
			Temp[i].Delete(0,1);
	for (i=0; i<=j; i++)
		if (Temp[i] != "")
		{
			repeat = FALSE;
			for (int k=i+1; k<=j; k++)
				if (Temp[i] == Temp[k])
					repeat = TRUE;
			if (!repeat)
				Word += Temp[i] + ", ";
				
		}
	int lm = Word.GetLength();
	if (Word[lm-1]==' ')
		Word.Delete(lm-2,2);
	return Word;
}

bool CDictView::KeepHistory(CString SearchWord, CString TMeaning,
							CString EMeaning)
{
	CString Word = SearchWord;
	Word.MakeLower();
	int t = m_tmeaning.GetLength();
	int e = m_emeaning.GetLength();
	if ((t != 0) || (e != 0))
	{
		COleDateTime date;	// search day
		date = COleDateTime::GetCurrentTime();
		CString temp = date.Format();
		int l = temp.GetLength();
		int s = Word.GetLength();
		char* day   = temp.GetBuffer(l);
		char* sword = Word.GetBuffer(s);
		char* tmean = m_tmeaning.GetBuffer(t);
		char* emean = m_emeaning.GetBuffer(e);

		int no = ReadFile();
		fstream file;
		file.open(histfile,ios::out);			// rewrite history file
		for (int i=0; i<=no; i++)
		{
			if (list[i].vocab != Word)
			{
				file.write(list[i].vocab, list[i].vocab.GetLength());
				endl(file);
				file.write(list[i].time,  list[i].time.GetLength());
				endl(file);
				file.write(list[i].tmean, list[i].tmean.GetLength());
				endl(file);
				file.write(list[i].emean, list[i].emean.GetLength());
				endl(file);
				endl(file);
			}
		}
		file.close();
		
		file.open(histfile,ios::app|ios::in);	// open history file
		file.write(sword,s); endl(file);
		file.write(day,l);	 endl(file);
		file.write(tmean,t); endl(file);
		file.write(emean,e); endl(file);
		endl(file);
		file.close();
	}
	return TRUE;
}

void CDictView::OnSearchNet(CString SearchWord)
{
	m_ctmeaning="";
	m_cemeaning="";
	m_pSet->m_tword = _T("");
	CSearchOnline online;
	int complete = 0;

	if (online.DoModal() == IDOK)
	{
		m_pSet->m_strFilter = "";
		complete = SearchOnline(SearchWord);
		if (complete == 0)
			MessageBox("Connect Fail","Search Online Result",MB_OK);
		else if (complete == 1)
			UpdateData(FALSE);
		else if (complete == 2)
			MessageBox("Sorry - no results were found.","Meaning",MB_OK);
	} // end if
}

int CDictView::SearchOnline(CString SearchWord)
{
	int i = 0;
	bool inter;
	bool NetComplete = FALSE;
	CString urlcgi;
	urlcgi = "http://info.babylon.com/cgi-bin/info.cgi?word=" + SearchWord + "&lang=&layout=df.html&n=1";
	char url[1350];
	strcpy(url,urlcgi);

	inter=InitConnection(url,netfile);

	if (inter) // connect ok
	{	
		// cut word
		ifstream file;
		file.open(netfile);	// open internet file

		while (!file.eof() && (i == 0))
		{
			TCHAR s[1000] = "";
			file.getline(s, 500);
			CString line(s);
			if (line == SearchWord)
			{
				file.getline(s,500);
				file.getline(s,500);
				file.getline(s,500);
				line = s;	// first line of meaning
				bool err = FALSE;
				while ((line != "")&&(!err))
				{
					if ((line[0] != '<')&&(line[0] != '\t')&&(line[0] != ' '))
					{
						NetComplete = NetVocab(SearchWord,line);
						file.getline(s,500);
						file.getline(s,500);
						file.getline(s,500);
						file.getline(s,500);
						file.getline(s,500);
						line = s;
					}
					else
						err = TRUE;
				}	// end while 
				i = 1;
			}
		}	// end while EOF or i!=0

		if (i == 1)  // show result on Message Box
		{
			int m = OnSearch(SearchWord);
			m_cemeaning = m_emeaning;
		}
		else
			i = 2;	// no results were found

		file.close();	// close internet file
	}
	else
		i = 0;		// Connect Fail

	return i;
}

bool CDictView::NetVocab(CString SearchWord, CString Meaning)
{
	bool NetComplete = FALSE;
	CString Word[15];
	CString Code = "";
	int i = 0;
	for (i=0; i<15; i++)
		Word[i] = "";
	int l = Meaning.GetLength();
	int j = 0;
	for (i=0; i<l; i++)
		if ((Meaning[i] != ';')&&(Meaning[i] != ','))
			Word[j] += Meaning[i];
		else
			if (Word[j] != "")
				j += 1;

	CString NewM = ", ";
	for (i=0; i<15; i++)
		if (Word[i] != "")
		{
			if (Word[i][0] == ' ')
				Word[i].Delete(0,1);
			NewM += Word[i] + ", ";
		}

	int lm = NewM.GetLength();
	if (NewM[lm-1]==' ')
		NewM.Delete(lm-1,1);

	i = 0;	
	while ((i<15)&&(Word[i]!="")&&(Code==""))
	{
		m_pSet->m_strFilter = "Eword='" + Word[i] + "'";
		if ((!m_pSet->IsBOF())||(!m_pSet->IsEOF()))
			m_pSet->MoveFirst();
		m_pSet->Requery();

		if (m_pSet->GetRecordCount() != 0)
		{
			if (m_pSet->m_code == "N")			// noun
				Code = "N";
			else if (m_pSet->m_code == "V")		// verb
				Code = "V";
			else if (m_pSet->m_code == "ADJ")	// adjective
				Code = "ADJ";
			else if (m_pSet->m_code == "ADV")	// adverb
				Code = "ADV";
			else if (m_pSet->m_code == "CONJ")	// conjunction
				Code = "CONJ";
			else if (m_pSet->m_code == "INT")	// interjection
				Code = "INT";
			else if (m_pSet->m_code == "PREP")	// preposition
				Code = "PREP";
			else if (m_pSet->m_code == "PRON")	// pronoun
				Code = "PRON";
		}
		else 
			i += 1;
	}

	if (!m_pSet->IsEOF()) m_pSet->MoveLast();
	m_pSet->AddNew();
	m_pSet->SetFieldNull(NULL);
	m_pSet->m_eword = SearchWord;
	m_pSet->m_tenglish = NewM;
	if (Code!="")
		m_pSet->m_code = Code;
	m_pSet->Update();
	return TRUE;
}

void CDictView::OnAddvocab() 
{
	CAdd add;
	bool AddComplete = FALSE;

	if (add.DoModal() == IDOK)
	{
		UpdateData(TRUE);
		if (m_pSet->CanUpdate())	// Determine whether recordset is updatable
		{
			if (add.m_addvocab.GetLength() > 0)
			{
				AddComplete = AddVocab( add.m_addvocab, add.m_addtnoun,
						add.m_addtverb, add.m_addtadj,  add.m_addtadv,
						add.m_addtconj, add.m_addtint,  add.m_addtprep,
						add.m_addtpron, add.m_addenoun, add.m_addeverb,
						add.m_addeadj,  add.m_addeadv,  add.m_addeconj,
						add.m_addeint,  add.m_addeprep, add.m_addepron);
			}
		}	// end if canupdate

		if (AddComplete)
			MessageBox("Add Complete!!","Add Complete",MB_OK|MB_ICONINFORMATION);
		else
			MessageBox("Vocab Field required.","Add Error",MB_OK|MB_ICONEXCLAMATION);

		m_cvocab = "";
		m_ctmeaning = "";
		m_cemeaning = "";
		UpdateData(FALSE);
	}	// end if IDOK
}	// end OnAddvocab

void CDictView::SetFormat(CString& Word)
{
	CString Temp[15];
	CString Code = "";
	int i = 0;
	for (i=0; i<15; i++)
		Temp[i] = "";
	int l = Word.GetLength();
	int j = 0;
	for (i=0; i<l; i++)
		if ((Word[i] != ';')&&(Word[i] != ','))
			Temp[j] += Word[i];
		else
			if (Temp[j] != "")
				j += 1;

	Word = ", ";
	for (i=0; i<15; i++)
		if (Temp[i] != "")
		{
			if (Temp[i][0] == ' ')
				Temp[i].Delete(0,1);
			Word += Temp[i] + ", ";
		}
	int lm = Word.GetLength();
	if (lm == 2)
		Word = "";
	else
		if (Word[lm-1]==' ')
			Word.Delete(lm-1,1);
}

bool CDictView::AddVocab(CString AddWord, CString tnoun, CString tverb,
			  CString tadj,  CString tadv,  CString tconj,
			  CString tint,  CString tprep, CString tpron,
			  CString enoun, CString everb, CString eadj,
			  CString eadv,  CString econj, CString eint,
			  CString eprep, CString epron)
{
	bool Complete = FALSE;		
	if ((enoun.GetLength() > 0 ) || (tnoun.GetLength() > 0))
	{
		SetFormat(enoun);
		Complete = TRUE;
		if (!m_pSet->IsEOF()) m_pSet->MoveLast();
		m_pSet->AddNew();
		m_pSet->SetFieldNull(NULL);
		m_pSet->m_eword = AddWord;
		m_pSet->m_code = "N";
		m_pSet->m_tenglish = enoun;
		m_pSet->m_tsyn = tnoun;
		m_pSet->Update();
	}	// end if noun

	if ((everb.GetLength() > 0 ) || (tverb.GetLength() > 0))
	{
		SetFormat(everb);
		Complete = TRUE;
		if (!m_pSet->IsEOF()) m_pSet->MoveLast();
		m_pSet->AddNew();
		m_pSet->SetFieldNull(NULL);
		m_pSet->m_eword = AddWord;
		m_pSet->m_code = "V";
		m_pSet->m_tenglish = everb;
		m_pSet->m_tsyn = tverb;
		m_pSet->Update();
	}	// end if verb
	
	if ((eadj.GetLength() > 0 ) || (tadj.GetLength() > 0))
	{
		SetFormat(eadj);
		Complete = TRUE;
		if (!m_pSet->IsEOF()) m_pSet->MoveLast();
		m_pSet->AddNew();
		m_pSet->SetFieldNull(NULL);
		m_pSet->m_eword = AddWord;
		m_pSet->m_code = "ADJ";
		m_pSet->m_tenglish = eadj;
		m_pSet->m_tsyn = tadj;
		m_pSet->Update();
	}	// end if adjective
	
	if ((eadv.GetLength() > 0 ) || (tadv.GetLength() > 0))
	{
		SetFormat(eadv);
		Complete = TRUE;
		if (!m_pSet->IsEOF()) m_pSet->MoveLast();
		m_pSet->AddNew();
		m_pSet->SetFieldNull(NULL);
		m_pSet->m_eword = AddWord;
		m_pSet->m_code = "ADV";
		m_pSet->m_tenglish = eadv;
		m_pSet->m_tsyn = tadv;
		m_pSet->Update();
	}	// end if adverb
	
	if ((eprep.GetLength() > 0 ) || (tprep.GetLength() > 0))
	{
		SetFormat(eprep);
		Complete = TRUE;
		if (!m_pSet->IsEOF()) m_pSet->MoveLast();
		m_pSet->AddNew();
		m_pSet->SetFieldNull(NULL);
		m_pSet->m_eword = AddWord;
		m_pSet->m_code = "PREP";
		m_pSet->m_tenglish = eprep;
		m_pSet->m_tsyn = tprep;
		m_pSet->Update();
	}	// end if preposition
	
	if ((epron.GetLength() > 0 ) || (tpron.GetLength() > 0))
	{
		SetFormat(epron);
		Complete = TRUE;
		if (!m_pSet->IsEOF()) m_pSet->MoveLast();
		m_pSet->AddNew();
		m_pSet->SetFieldNull(NULL);
		m_pSet->m_eword = AddWord;
		m_pSet->m_code = "PRON";
		m_pSet->m_tenglish = epron;
		m_pSet->m_tsyn = tpron;
		m_pSet->Update();
	}	// end if pronoun
	
	if ((econj.GetLength() > 0 ) || (tconj.GetLength() > 0))
	{
		SetFormat(econj);
		Complete = TRUE;
		if (!m_pSet->IsEOF()) m_pSet->MoveLast();
		m_pSet->AddNew();
		m_pSet->SetFieldNull(NULL);
		m_pSet->m_eword = AddWord;
		m_pSet->m_code = "CONJ";
		m_pSet->m_tenglish = econj;
		m_pSet->m_tsyn = tconj;
		m_pSet->Update();
	}	// end if conjunction
	
	if ((eint.GetLength() > 0 ) || (tint.GetLength() > 0))
	{
		SetFormat(eint);
		Complete = TRUE;
		if (!m_pSet->IsEOF()) m_pSet->MoveLast();
		m_pSet->AddNew();
		m_pSet->SetFieldNull(NULL);
		m_pSet->m_eword = AddWord;
		m_pSet->m_code = "INT";
		m_pSet->m_tenglish = eint;
		m_pSet->m_tsyn = tint;
		m_pSet->Update();
	}	// end if interjection

	return Complete;
}

void CDictView::OnUpdatevocab() 
{
	CUpdateBox upbox;
	CUpdate update;

	int  SearchVocab = 0;
	bool DelComplete;
	bool AddComplete;
	bool UpComplete = FALSE;
	CString blank = "";

	if (upbox.DoModal() == IDOK)
	{
		UpdateData(FALSE);
		SearchVocab = Search(upbox.m_editvocab, update.m_uptnoun,
				update.m_uptverb, update.m_uptadj,  update.m_uptadv,
				update.m_uptconj, update.m_uptint,  update.m_uptprep,
				update.m_uptpron, update.m_upenoun, update.m_upeverb,
				update.m_upeadj,  update.m_upeadv,  update.m_upeconj,
				update.m_upeint,  update.m_upeprep, update.m_upepron, blank);

		if (SearchVocab == 0)
		{
			MessageBox("Vocabulary not found!!","Edit",MB_OK|MB_ICONINFORMATION);
			return;
		}

		update.m_upvocab = upbox.m_editvocab;
		if (update.DoModal() == IDOK)
		{
			if (AfxMessageBox("Are you sure you want to edit this vocabulary and its synonyms?",MB_YESNO) != IDYES)
				return;

			DelComplete = DeleteVocab(update.m_upvocab);
			if (DelComplete)
			{
				AddComplete = AddVocab(update.m_upvocab, update.m_uptnoun,
					update.m_uptverb, update.m_uptadj,  update.m_uptadv,
					update.m_uptconj, update.m_uptint,  update.m_uptprep,
					update.m_uptpron, update.m_upenoun, update.m_upeverb,
					update.m_upeadj,  update.m_upeadv,  update.m_upeconj,
					update.m_upeint,  update.m_upeprep, update.m_upepron);
				if (AddComplete)
					UpComplete = TRUE;
			}
			if (UpComplete)
				MessageBox("Edit Complete!!","Edit",MB_OK|MB_ICONINFORMATION);
			else
				MessageBox("Edit Error!!","Edit",MB_OK|MB_ICONINFORMATION);

		}	// end if update -- IDOK
		m_cvocab = "";
		m_ctmeaning = "";
		m_cemeaning = "";
		UpdateData(FALSE);
	}	// end if upbox -- IDOK
}

void CDictView::OnDeletevocab() 
{
	CDelete del;
	bool DelComplete;

	if (del.DoModal() == IDOK)
	{
		if (m_pSet->CanUpdate())	// Determine whether recordset is updatable
		{
			if (AfxMessageBox("Are you sure you want to delete '" + del.m_delvocab + "'?",MB_YESNO) != IDYES)
				return;
			DelComplete = DeleteVocab(del.m_delvocab);
		}	// end if CanUpdate()

		if (DelComplete)
			MessageBox("Delete Complete!!","Delete",MB_OK|MB_ICONINFORMATION);
		else
			MessageBox("Vocabulary not found!!","Delete",MB_OK|MB_ICONINFORMATION);

		m_cvocab = "";
		m_ctmeaning = "";
		m_cemeaning = "";
		UpdateData(FALSE);
	}	// end if IDOK
}

bool CDictView::DeleteVocab(CString DeleteWord)
{
	bool NotFound = FALSE; 
	m_pSet->m_strFilter = "Eword='" + DeleteWord + "'";
	if ((!m_pSet->IsBOF())||(!m_pSet->IsEOF()))
		m_pSet->MoveFirst();
	m_pSet->Requery(); 

	if (m_pSet->GetRecordCount() != 0)
	{
		NotFound = TRUE;
		if (m_pSet->m_tenglish == "")
		{	
			if (m_pSet->GetEditMode() == dbEditNone)
				m_pSet->Delete();
		}
		else
		{
			if (m_pSet->GetEditMode() != dbEditInProgress)
				m_pSet->Edit();
			m_pSet->m_eword = " ";
			m_pSet->Update();
		}
		m_pSet->MoveNext();

		while (!m_pSet->IsEOF())
		{
			if (m_pSet->m_tenglish == "")
			{	
				if (m_pSet->GetEditMode() == dbEditNone)
					m_pSet->Delete();
			}
			else
			{
				if (m_pSet->GetEditMode() != dbEditInProgress)
					m_pSet->Edit();
				m_pSet->m_eword = " ";
				m_pSet->Update();
			}
			m_pSet->MoveNext();
		} // end while -- IsEOF
	} // end if

	m_pSet->m_strFilter = "Tenglish Like '*, " + DeleteWord + ",*'";
	if ((!m_pSet->IsBOF())||(!m_pSet->IsEOF()))
		m_pSet->MoveFirst();
	m_pSet->Requery();

	if (m_pSet->GetRecordCount() != 0)
	{
		NotFound = TRUE;
		if (m_pSet->GetEditMode() != dbEditInProgress)
			m_pSet->Edit();
		CString m_newteng = m_pSet->m_tenglish;
		CString m_newdvocab = " " + DeleteWord + ",";
		int n = m_newteng.Replace(m_newdvocab,"");	// delete word from m_tenglish
		m_pSet->m_tenglish = m_newteng;
		m_pSet->Update();

		if (((m_pSet->m_eword == "")||(m_pSet->m_eword == " "))&&(m_pSet->m_tenglish == ","))
		{
			if (m_pSet->GetEditMode() == dbEditNone)
				m_pSet->Delete();
		}
		m_pSet->MoveNext();
	
		while (!m_pSet->IsEOF())
		{
			if (m_pSet->GetEditMode() != dbEditInProgress)
				m_pSet->Edit();
			m_newteng = m_pSet->m_tenglish;
			n = m_newteng.Replace(m_newdvocab,"");
			m_pSet->m_tenglish = m_newteng;
			m_pSet->Update();

			if ((m_pSet->m_eword == "")&&(m_pSet->m_tenglish == ","))
			{
				if (m_pSet->GetEditMode() == dbEditNone)
					m_pSet->Delete();
			}
			m_pSet->MoveNext();
		}	// end while -- IsEOF
	}	// end if

	return NotFound;
}

bool CDictView::InitConnection(CHAR *szUrl, CHAR *szFileName)
{	
	TCHAR sz[1024];
	CInternetSession session (_T("MyTest agent"), 1, 
		INTERNET_OPEN_TYPE_DIRECT);
	CStdioFile* pFile = NULL;
	CHAR  szHead[] = "Accept: */*\r\n\r\n";
	DWORD nRead;
	CFile myFile;
	CFileException fileException;
  
	if ( !myFile.Open (szFileName, CFile::modeCreate | CFile::modeReadWrite,
		&fileException ) )
		return FALSE;

	pFile = session.OpenURL (szUrl, 1, INTERNET_FLAG_RELOAD | 
		INTERNET_FLAG_TRANSFER_BINARY, szHead, -1L);

	do
	{
		nRead = pFile->Read(sz, 1023);
		if (nRead != 0)
		myFile.Write (sz, nRead);
	} while (nRead != 0);

	myFile.Close();
	pFile->Close();
	if (pFile != NULL)
		delete pFile;
	session.Close();
   
	return TRUE;
}


BOOL CDictView::OnMove(UINT nIDMoveCommand) 
{
	if (m_pSet->GetEditMode() == dbEditAdd)
	{
		UpdateData(TRUE);
		if (m_pSet->CanUpdate())
		{
			m_pSet->Update();
		} // end if
		m_pSet->MoveLast();
	} // end if
	return CDaoRecordView::OnMove(nIDMoveCommand);
}

void CDictView::OnLDblClk(WPARAM, LPARAM lParam)
{
	// Simulate a key press and release Ctrl+C
	keybd_event( VK_CONTROL, 0x45,
				KEYEVENTF_EXTENDEDKEY | 0, 0);
	keybd_event( 0x43, 0x45,
				KEYEVENTF_EXTENDEDKEY | 0, 0);
	keybd_event( 0x43, 0x45,
				KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
	keybd_event( VK_CONTROL, 0x45,
				KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);

//////// Get Double Click Clipboard Data /////////
	
	CString tips;
	CPoint pt;
	GetCursorPos(&pt);
	m_ctmeaning = "";	// thai meaning
	m_cemeaning = "";	// english meaning
	
	CString vocab = GetClipData();
	LONG i = 0;

	while ((vocab == "")&&(i <= 5000000))
	{
		vocab = GetClipData();
		i += 1;
	}
	
	if ((vocab == "#$%&*") || (vocab == "")) // can't
		return;
	if ((vocab.Find("'") != -1) || (vocab.Find("*") != -1))
		return;
	vocab.TrimRight();

//////// Set User's Clipboard Data back //////////

	bool hist = CheckHistory(vocab);	// check history file
	CheckGrammar(vocab);
	int complete = 0;
	if (vocab.GetLength()!=0)
	{
		if ((m_cemeaning == "")&&(m_ctmeaning == ""))
		{	
			if (m_online)
			{
				complete = SearchOnline(vocab);
				if (complete == 0)
				{
					tips = "Connect Fail";
					m_Tip.SetIcon(m_hIcon2);
				}
				else if (complete == 1)
				{
					tips = vocab + "\r\n" + m_cemeaning;
					m_Tip.SetIcon(m_hIcon1);
				}
				else if (complete == 2)
				{
					tips = "No results were found";	//no results were found
					m_Tip.SetIcon(m_hIcon2);
				}
			}
			else	// disable search online
			{
				tips = "No results were found";
				m_Tip.SetIcon(m_hIcon2);
			}
			m_Tip.Show(tips, &pt);
		}
		else
		{
			if (m_ctmeaning.GetLength() != 0)
				if (m_cemeaning.GetLength() != 0)
					tips = vocab + "\r\n" + m_ctmeaning + "\r\n" + m_cemeaning;
				else
					tips = vocab + "\r\n" + m_ctmeaning;
			else
				tips = vocab + "\r\n" + m_cemeaning;
			m_Tip.SetIcon(m_hIcon1);
			m_Tip.Show(tips, &pt);
		}
	}

	if (hist && m_game)
		ThreadModeLess();
}

CString CDictView::GetClipData()
{
	CString vocab = "";
	if (IsClipboardFormatAvailable(CF_TEXT))
	{ 
		if (OpenClipboard())
		{
			HANDLE hData = GetClipboardData(CF_TEXT);
			if (hData != NULL)
			{
				vocab = (char*)GlobalLock(hData);
				GlobalUnlock(hData);
			}
			CloseClipboard();
		}
	}
	else
		vocab = "#$%&*";
	return vocab;
}

BOOL CDictView::GetText (LPSTR lpszBuffer, int nBufSize)
{
	HGLOBAL hGlobal;		// Global memory handle
	LPSTR lpszData;			// Pointer to clipboard data
	unsigned long nSize;	// Size of clipboard data

	OpenClipboard();
	hGlobal = GetClipboardData(CF_TEXT);	// pointer to text
	if (hGlobal == NULL) return FALSE;		// no text

	lpszData = (LPSTR)GlobalLock(hGlobal);	// lock global handle
	nSize = GlobalSize(hGlobal);			// getsize of text

	// make sure the text on the clipboard is not longer
	if(nSize >= (UINT)nBufSize) nSize = nBufSize - 1;

	// copy the text into the return buffer.
	for (UINT i = 0; i < nSize; ++i)
		*(lpszBuffer + i) = *(lpszData + i);
	*(lpszBuffer + i) = 0;

	GlobalUnlock(hGlobal);	// unlock
	CloseClipboard();

	return TRUE;
}

void CDictView::SetClipData(CString strClipboardText)
{
	if (OpenClipboard())
	{
	EmptyClipboard();
	HGLOBAL hglbText = GlobalAlloc(GMEM_MOVEABLE, 1 + strClipboardText.GetLength()); 
	char *pData = (char *)GlobalLock(hglbText); 
	lstrcpy(pData, strClipboardText);
	GlobalUnlock(hglbText); 
	SetClipboardData(CF_TEXT, hglbText);
	CloseClipboard();
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CDictView::OnPaint() 
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
		CView::OnPaint();
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CDictView::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

BOOL CDictView::PreTranslateMessage(MSG* pMsg) 
{
	m_Tip.RelayEvent(pMsg);
	return CView::PreTranslateMessage(pMsg);
}

