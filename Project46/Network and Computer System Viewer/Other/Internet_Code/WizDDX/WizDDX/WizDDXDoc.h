// WizDDXDoc.h : interface of the CWizDDXDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_WIZDDXDOC_H__AC827D76_4D8A_4473_AE0F_37EF96AEE0FF__INCLUDED_)
#define AFX_WIZDDXDOC_H__AC827D76_4D8A_4473_AE0F_37EF96AEE0FF__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CWizDDXDoc : public CDocument
{
protected: // create from serialization only
	CWizDDXDoc();
	DECLARE_DYNCREATE(CWizDDXDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWizDDXDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CWizDDXDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CWizDDXDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WIZDDXDOC_H__AC827D76_4D8A_4473_AE0F_37EF96AEE0FF__INCLUDED_)
