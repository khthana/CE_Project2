// IsagSignDoc.h : interface of the CIsagSignDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_ISAGSIGNDOC_H__8A5F638B_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
#define AFX_ISAGSIGNDOC_H__8A5F638B_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CIsagSrvrItem;

class CIsagSignDoc : public COleServerDoc
{
protected: // create from serialization only
	CIsagSignDoc();
	DECLARE_DYNCREATE(CIsagSignDoc)

// Attributes
public:
	CString m_user;
	
	CIsagSrvrItem* GetEmbeddedItem()
		{ return (CIsagSrvrItem*)COleServerDoc::GetEmbeddedItem(); }

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CIsagSignDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	protected:
	virtual COleServerItem* OnGetEmbeddedItem();
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CIsagSignDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CIsagSignDoc)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ISAGSIGNDOC_H__8A5F638B_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
