// DictDoc.h : interface of the CDictDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_DICTDOC_H__AE085520_4A87_4BFA_997F_CA88A271E60A__INCLUDED_)
#define AFX_DICTDOC_H__AE085520_4A87_4BFA_997F_CA88A271E60A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
#include "DictSet.h"


class CDictDoc : public CDocument
{
protected: // create from serialization only
	CDictDoc();
	DECLARE_DYNCREATE(CDictDoc)

// Attributes
public:
	CDictSet m_dictSet;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDictDoc)
	public:
	virtual BOOL OnNewDocument();
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CDictDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CDictDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DICTDOC_H__AE085520_4A87_4BFA_997F_CA88A271E60A__INCLUDED_)
