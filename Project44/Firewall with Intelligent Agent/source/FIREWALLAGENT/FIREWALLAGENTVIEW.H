// FirewallAgentView.h : interface of the CFirewallAgentView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_FIREWALLAGENTVIEW_H__E1FC9E79_8653_4B47_A552_CFBD861C6408__INCLUDED_)
#define AFX_FIREWALLAGENTVIEW_H__E1FC9E79_8653_4B47_A552_CFBD861C6408__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CFirewallAgentView : public CView
{
protected: // create from serialization only
	CFirewallAgentView();
	DECLARE_DYNCREATE(CFirewallAgentView)

// Attributes
public:
	CFirewallAgentDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirewallAgentView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CFirewallAgentView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CFirewallAgentView)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in FirewallAgentView.cpp
inline CFirewallAgentDoc* CFirewallAgentView::GetDocument()
   { return (CFirewallAgentDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIREWALLAGENTVIEW_H__E1FC9E79_8653_4B47_A552_CFBD861C6408__INCLUDED_)
