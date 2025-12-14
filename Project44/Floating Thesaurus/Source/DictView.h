// DictView.h : interface of the CDictView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_DICTVIEW_H__CA2E86D1_CA5A_48D2_A666_27886C927F9D__INCLUDED_)
#define AFX_DICTVIEW_H__CA2E86D1_CA5A_48D2_A666_27886C927F9D__INCLUDED_

#define UWM_LDBLCLK_MSG _T("UWM_LDBLCLK_MSG-44E531B1_14D3_11d5_A025_006067718D05")

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "XInfoTip.h"
#include "GifAnimation.h"

extern "C" __declspec(dllimport) void WINAPI OnClickOK();
extern "C" __declspec(dllimport) BOOL setMyHook1(HWND hWnd);
extern "C" __declspec(dllimport) BOOL clearMyHook1(HWND hWnd);


class CDictSet;

class CDictView : public CDaoRecordView
{
protected: // create from serialization only
	CDictView();
	DECLARE_DYNCREATE(CDictView)

public:
	//{{AFX_DATA(CDictView)
	enum { IDD = IDD_DICT_FORM };
	CComboBox	m_clist;
	CDictSet* m_pSet;
	CString	m_cvocab;
	CString	m_ctmeaning;
	CString m_tmeaning;
	CString	m_cemeaning;
	CString m_emeaning;
	//}}AFX_DATA

// Attributes
public:
	CDictDoc* GetDocument();		
    CWinThread *m_pDlgThread;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDictView)
	public:
	virtual CDaoRecordset* OnGetRecordset();
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	virtual BOOL OnMove(UINT nIDMoveCommand);
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void OnInitialUpdate(); // called first time after construct
	//}}AFX_VIRTUAL

// Implementation
public:
	CString SetShowFormat(CString Word);
	bool InitConnection(CHAR *szUrl, CHAR *szFileName);
	virtual ~CDictView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

private:
	// data member
	char* netfile;		// internet file name
	char* histfile;		// history file name
	FILE *stream;
	struct word
	{
		CString vocab;
		CString time;
		CString tmean;
		CString emean;
	};
	word list[2000];

	// function
	void ThreadModeLess();
	void CheckGrammar(CString vocab);

	int  Search(CString SearchWord, CString& tnoun, CString& tverb, 
				CString& tadj,  CString& tadv,  CString& tconj,
				CString& tint,  CString& tprep, CString& tpron,
				CString& enoun, CString& everb, CString& eadj, 
				CString& eadv, 	CString& econj, CString& eint,
				CString& eprep, CString& epron, CString& blank);
	int SearchOnline(CString SearchWord);
	bool NetVocab(CString SearchWord, CString Meaning);

	bool CheckHistory(CString SearchWord);
	bool KeepHistory(CString SearchWord, CString TMeaning,
					CString EMeaning);
	int  ReadFile();
	void SetFormat(CString& Word);

	bool AddVocab(CString AddWord, CString tnoun, CString tverb,
				  CString tadj,  CString tadv,  CString tconj,
				  CString tint,  CString tprep, CString tpron,
				  CString enoun, CString everb, CString eadj,
				  CString eadv,  CString econj, CString eint,
				  CString eprep, CString epron);
	bool DeleteVocab(CString DeleteWord);

	void SetClipData(CString strClipboardText);
	CString GetClipData();
	BOOL GetText (LPSTR lpszBuffer, int nBufSize);

// Generated message map functions
protected:
	HICON m_hIcon;
	CXInfoTip		m_Tip;
	CFont			m_Font;
	HICON			m_hIcon1;
	HICON			m_hIcon2;
	HICON			m_hIcon3;
	bool	m_float, m_online, m_game;
	afx_msg	void OnLDblClk(WPARAM, LPARAM lParam);

	//{{AFX_MSG(CDictView)
	afx_msg void OnPreSearch();
	afx_msg int OnSearch(CString SearchWord);
	afx_msg void OnSearchNet(CString SearchWord);
	afx_msg void OnAddvocab();
	afx_msg void OnUpdatevocab();
	afx_msg void OnDeletevocab();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnFloat();
	afx_msg void OnUpdateFloat(CCmdUI* pCmdUI);
	afx_msg void OnUpdateEnOnline(CCmdUI* pCmdUI);
	afx_msg void OnUpdateDisOnline(CCmdUI* pCmdUI);
	afx_msg void OnUpdateEnGame(CCmdUI* pCmdUI);
	afx_msg void OnUpdateDisGame(CCmdUI* pCmdUI);
	afx_msg void OnUpdatePenOnline(CCmdUI* pCmdUI);
	afx_msg void OnUpdatePenGame(CCmdUI* pCmdUI);
	afx_msg void OnUpdatePdisOnline(CCmdUI* pCmdUI);
	afx_msg void OnUpdatePdisGame(CCmdUI* pCmdUI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in DictView.cpp
inline CDictDoc* CDictView::GetDocument()
   { return (CDictDoc*)m_pDocument; }	
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DICTVIEW_H__CA2E86D1_CA5A_48D2_A666_27886C927F9D__INCLUDED_)
