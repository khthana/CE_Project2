#if !defined(AFX_EDGE_H__570F3AA1_A192_11D4_A995_B681989E4310__INCLUDED_)
#define AFX_EDGE_H__570F3AA1_A192_11D4_A995_B681989E4310__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Edge.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// Edge dialog

class Edge : public CDialog
{
// Construction
public:
	Edge(CWnd* pParent = NULL);   // standard constructor
	int *newpic1,wpic,hpic;

	
	
	int *x,*y;
// Dialog Data
	//{{AFX_DATA(Edge)
	enum { IDD = IDD_DIALOG4 };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Edge)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(Edge)
	afx_msg void OnPaint();
	virtual BOOL OnInitDialog();
	afx_msg void OnImageprocessingShowimage();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_EDGE_H__570F3AA1_A192_11D4_A995_B681989E4310__INCLUDED_)
