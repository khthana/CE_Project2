// LogMonitorView.h : interface of the CLogMonitorView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_LOGMONITORVIEW_H__2747ACA1_64E1_4618_A387_31CC611F3F81__INCLUDED_)
#define AFX_LOGMONITORVIEW_H__2747ACA1_64E1_4618_A387_31CC611F3F81__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "ADConnect.h"

#define TIME_ELAP 5000

class CLogMonitorSet;

class CLogMonitorView : public CRecordView
{
protected: // create from serialization only
	CLogMonitorView();
	DECLARE_DYNCREATE(CLogMonitorView)

public:
	//{{AFX_DATA(CLogMonitorView)
	enum { IDD = IDD_LOGMONITOR_FORM };
	CListBox	m_cListTypeSub;
	CComboBox	m_cTypeSub;
	CListBox	m_cListType;
	CListBox	m_cList1;
	CListCtrl	m_cListLog;
	CLogMonitorSet* m_pSet;
	CString	m_sPageNo;
	CString	m_sNumberOfLog;
	//}}AFX_DATA

// Attributes
public:
	CLogMonitorDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLogMonitorView)
	public:
	virtual CRecordset* OnGetRecordset();
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void OnInitialUpdate(); // called first time after construct
	//}}AFX_VIRTUAL

// Implementation
public:
	int CountRecord();
	virtual ~CLogMonitorView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

private:
	BOOL bLastRecord;
protected:
	void AddLogToList(int iAllRecord);
	void AddLogToDB(CString sLog);

	CString sAllRecord;
	int iAllRecord;
	int iPageNumber;
	int iRecordPerPage;

	int iADGroupAll;
	int iADGroupNo;
	int iFWGroupAll;
	int iCountRule;

	CStringArray rmDistinguishedName;
	CStringArray gName;
	CStringArray gDistinguishedName;

	ADConnect ADCon;

	int iType;
	CStringArray saTmp;
	CStringArray saAllRecord;

// Generated message map functions
protected:
	//{{AFX_MSG(CLogMonitorView)
	afx_msg void OnButtonDelete();
	afx_msg void OnButtonPrevious();
	afx_msg void OnButtonNext();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnSelchangeListType();
	afx_msg void OnSelchangeListTypeSub();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in LogMonitorView.cpp
inline CLogMonitorDoc* CLogMonitorView::GetDocument()
   { return (CLogMonitorDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LOGMONITORVIEW_H__2747ACA1_64E1_4618_A387_31CC611F3F81__INCLUDED_)
