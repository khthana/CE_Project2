// SignatureDoc.h : interface of the CSignatureDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_SIGNATUREDOC_H__F65842EE_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_)
#define AFX_SIGNATUREDOC_H__F65842EE_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CSignatureSrvrItem;

class CSignatureDoc : public COleServerDoc
{
protected: // create from serialization only
	CSignatureDoc();
	DECLARE_DYNCREATE(CSignatureDoc)

// Attributes
public:

	CString m_user;
	CString m_strText;
	CSignatureSrvrItem* GetEmbeddedItem()
		{ return (CSignatureSrvrItem*)COleServerDoc::GetEmbeddedItem(); }

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSignatureDoc)
	protected:
	virtual COleServerItem* OnGetEmbeddedItem();
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CSignatureDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	virtual CDocObjectServer* GetDocObjectServer(LPOLEDOCUMENTSITE pDocSite);

// Generated message map functions
protected:
	//{{AFX_MSG(CSignatureDoc)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

	// Generated OLE dispatch map functions
	//{{AFX_DISPATCH(CSignatureDoc)
	//}}AFX_DISPATCH
	DECLARE_DISPATCH_MAP()
	DECLARE_INTERFACE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SIGNATUREDOC_H__F65842EE_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_)
