//{{AFX_INCLUDES()
#include "mschart.h"
//}}AFX_INCLUDES
#if !defined(AFX_GRAPH_H__7CCFFBAD_C088_49F3_BF3B_870863780CA8__INCLUDED_)
#define AFX_GRAPH_H__7CCFFBAD_C088_49F3_BF3B_870863780CA8__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Graph.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CGraph dialog

//##ModelId=3E9ABEED0080
class CGraph : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEED0097
	CGraph(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CGraph)
	enum { IDD = IDD_CHART };
	//##ModelId=3E9ABEED008D
	CMSChart	m_Chart;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CGraph)
	protected:
	//##ModelId=3E9ABEED0095
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CGraph)
	//##ModelId=3E9ABEED0094
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_GRAPH_H__7CCFFBAD_C088_49F3_BF3B_870863780CA8__INCLUDED_)
