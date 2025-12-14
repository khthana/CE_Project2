// LogMonitorDoc.h : interface of the CLogMonitorDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_LOGMONITORDOC_H__F287777D_F1C1_46B9_AD98_409ABCDAC0F4__INCLUDED_)
#define AFX_LOGMONITORDOC_H__F287777D_F1C1_46B9_AD98_409ABCDAC0F4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
#include "LogMonitorSet.h"


class CLogMonitorDoc : public CDocument
{
protected: // create from serialization only
	CLogMonitorDoc();
	DECLARE_DYNCREATE(CLogMonitorDoc)

// Attributes
public:
	CLogMonitorSet m_logMonitorSet;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLogMonitorDoc)
	public:
	virtual BOOL OnNewDocument();
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CLogMonitorDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CLogMonitorDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LOGMONITORDOC_H__F287777D_F1C1_46B9_AD98_409ABCDAC0F4__INCLUDED_)
